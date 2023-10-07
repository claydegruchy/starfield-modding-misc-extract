ScriptName UC08_QueenBattle_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int iBroadcastSceneDelayTimerID = 3 Const
Int iQueenLockFailsafeCount = 0
Int iQueenLockTimerID = 2 Const
Int iSignalIntroTimerID = 1 Const

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property UC08_AB_SwitchCount Auto Const mandatory
  { Used to track the number of switches thrown }
  GlobalVariable Property UC08_AB_AnomalyLocked Auto Const mandatory
  { Global used to lock the queen place for a little bit after each radar blast }
  GlobalVariable Property UC08_AB_AnomalyTargetsThrallsThreshold Auto Const mandatory
  { Global var tracking how many Thralls can still be around before the Queen can come
    after the player again }
  GlobalVariable Property UC08_AB_AnomalyLockCount Auto Const mandatory
  { Global var tracking how many times we check for thralls before allow the Queen to go back to killing the player }
  GlobalVariable Property UC08_AB_BroadcastDamageMultipler Auto Const mandatory
  { Global used to decide what health percentage should be removed from the anomaly per hit from the broadcast towers }
EndGroup

Group Scenes
  Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const mandatory
  { Scene to play when the 1st switch is thrown }
  Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const mandatory
  { Scene to play when the 2nd switch is thrown }
  Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const mandatory
  { Scene to play when the 3rd switch is thrown }
EndGroup

Group Spells
  Spell Property CCT_HitSpell_BigStagger Auto Const mandatory
  { Spell used to stagger all the critters in the area when a radar blast goes off }
  Spell Property UC08_CrTerrormorphMindControl_Permanent Auto Const mandatory
  { Spell used to denote which team this NPC is on. In this case, the Queen's }
  Spell Property UC08_CrTerrormorphMindControl_PlayerAlly Auto Const mandatory
  { Spell used to denote which team this NPC is on. In this case, the player's }
EndGroup

Group Aliases
  RefCollectionAlias Property AllHostileThralls Auto Const mandatory
  { Collection that contains all the enemy creatures involved in the fight }
  RefCollectionAlias Property ActiveHostiles Auto Const mandatory
  { Collection that contains only the active enemy critters }
  RefCollectionAlias Property AllAlliedThralls Auto Const mandatory
  { Collection that contains all the allied creatures involved in the fight }
  RefCollectionAlias Property ActiveAlliedThralls Auto Const mandatory
  { Collection that contains just the living creatures allied with the player }
  RefCollectionAlias Property TowerAmbushes Auto Const mandatory
  { Collection used to contain the hand-placed Terrormorph ambushes in this sequence }
  ReferenceAlias Property Queen Auto Const mandatory
  { Alias for the morph queen }
  ReferenceAlias Property Hadrian Auto Const mandatory
  { Ref alias for Hadrian }
  ReferenceAlias Property Kaiser Auto Const mandatory
  { Ref alias for Kaiser }
  ReferenceAlias Property ActiveSignalMarker Auto Const mandatory
  { Holding alias for the signal sound marker's that's currently active }
  ReferenceAlias[] Property SignalMarkers Auto Const mandatory
  { Array of ref aliases for each of the Queen's "signal" sounds }
  ReferenceAlias Property ActiveQueenCombatTarget Auto Const mandatory
  { Holding alias for the Queen's current combat target }
  RefCollectionAlias Property AcelesPlantThralls Auto Const mandatory
  { Ref collection for all the thralls back at the Aceles plant }
EndGroup

Group Factions
  Faction Property TerrormorphMindControlFaction Auto Const mandatory
  { Faction used to denote which thralls are enemies and which aren't }
  Faction Property PlayerAllyFaction Auto Const mandatory
  { Player ally faction. Applied to all allied NPCs as they spawn/swap states }
  Faction Property UC08_PlayerAlignedNPCAllyFaction Auto Const mandatory
  { Faction applied to enemy thralls to get them fighting the Queen }
  Faction Property UC08_TerrormorphAnomalyFriendFaction Auto Const mandatory
  { Faction removed from the player's ally critters to get them fighting the Queen }
EndGroup

Group Ints
  Int Property iSignalIntroTimerLength = 10 Auto Const
  { How long we should wait before triggering the Signal gameplay intro scene }
  Int Property iQueenLockTimerLength = 30 Auto Const
  { How long we should lock the Queen in place after a blast }
  Int Property iSignalIntroStage = 155 Auto Const
  { Stage to set to trigger the Signal Intro scene }
  Int Property iQueenDeadStage = 900 Auto Const
  { Stage to set to trigger the Signal Intro scene }
EndGroup

Group MiscObjs
  Bool Property bBroadcastSceneActive Auto
  { Set true if there's a  broadcast scene actively playing at the moment }
  Explosion Property UC08_BroadcastBlastImpact Auto Const mandatory
  { Explosion used to trigger the broadcast blast }
  wwiseevent Property QST_UC08_Creature_Battle_Reveal_WEF Auto Const mandatory
  { Sound played when allied creatures are revealed }
  ActorValue Property AmbushTriggered Auto Const mandatory
  { Actor value used to trigger the NPC's ambush state }
  ActorValue Property Health Auto Const mandatory
  { Health actor value }
EndGroup


;-- Functions ---------------------------------------

Function TriggerRadarBlast(ObjectReference akBlastSource, RefCollectionAlias akMorphSupportCollection, RefCollectionAlias akThrallSupportCollection)
  If !Self.GetStageDone(iQueenDeadStage) ; #DEBUG_LINE_NO:133
    UC08_AB_SwitchCount.Mod(1.0) ; #DEBUG_LINE_NO:136
    ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:139
    PlayREF.PlaceAtMe(UC08_BroadcastBlastImpact as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:140
    Actor QAct = Queen.GetActorRef() ; #DEBUG_LINE_NO:142
    If !QAct.IsDead() ; #DEBUG_LINE_NO:143
      CCT_HitSpell_BigStagger.Cast(QAct as ObjectReference, None) ; #DEBUG_LINE_NO:144
      Float fBlastDamage = QAct.GetBaseValue(Health) * UC08_AB_BroadcastDamageMultipler.GetValue() ; #DEBUG_LINE_NO:145
      QAct.DamageValue(Health, fBlastDamage) ; #DEBUG_LINE_NO:147
    EndIf ; #DEBUG_LINE_NO:
    Self.PlayBroadcastScene() ; #DEBUG_LINE_NO:152
    Self.UpdateSignalMarker() ; #DEBUG_LINE_NO:155
    Self.StaggerCreatures() ; #DEBUG_LINE_NO:158
    If !QAct.IsDead() ; #DEBUG_LINE_NO:161
      Int currSwitchCount = UC08_AB_SwitchCount.GetValueInt() ; #DEBUG_LINE_NO:162
      If currSwitchCount == 1 ; #DEBUG_LINE_NO:163
        ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection) ; #DEBUG_LINE_NO:164
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None) ; #DEBUG_LINE_NO:165
        Self.PrepAllyColl(akThrallSupportCollection) ; #DEBUG_LINE_NO:166
      ElseIf currSwitchCount == 2 ; #DEBUG_LINE_NO:167
        ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection) ; #DEBUG_LINE_NO:168
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None) ; #DEBUG_LINE_NO:169
        Self.PrepAllyColl(akMorphSupportCollection) ; #DEBUG_LINE_NO:170
      Else ; #DEBUG_LINE_NO:
        ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection) ; #DEBUG_LINE_NO:172
        ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection) ; #DEBUG_LINE_NO:173
        QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF, None, None) ; #DEBUG_LINE_NO:174
        Self.PrepAllyColl(akMorphSupportCollection) ; #DEBUG_LINE_NO:175
        Self.PrepAllyColl(akThrallSupportCollection) ; #DEBUG_LINE_NO:176
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.LockQueen() ; #DEBUG_LINE_NO:182
EndFunction

Function PlayBroadcastScene()
  If !Queen.GetActorRef().IsDead() ; #DEBUG_LINE_NO:186
    Int currVal = UC08_AB_SwitchCount.GetValueInt() ; #DEBUG_LINE_NO:187
    If currVal == 1 ; #DEBUG_LINE_NO:190
      UC08_QueenBattle_PercivalHad_FirstSwitch.Start() ; #DEBUG_LINE_NO:191
    ElseIf currVal == 2 ; #DEBUG_LINE_NO:192
      UC08_QueenBattle_PercivalHad_SecondSwitch.Start() ; #DEBUG_LINE_NO:193
    ElseIf currVal == 3 ; #DEBUG_LINE_NO:194
      UC08_QueenBattle_PercivalHad_SecondSwitch.Stop() ; #DEBUG_LINE_NO:195
      UC08_QueenBattle_PercivalHad_ThirdSwitch.Start() ; #DEBUG_LINE_NO:196
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StaggerCreatures()
  Int h = 0 ; #DEBUG_LINE_NO:205
  Int hCount = AllHostileThralls.GetCount() ; #DEBUG_LINE_NO:206
  While h < hCount ; #DEBUG_LINE_NO:208
    Actor currACT = AllHostileThralls.GetAt(h) as Actor ; #DEBUG_LINE_NO:209
    If (currACT as Bool && currACT.IsEnabled()) && currACT.GetValue(AmbushTriggered) >= 1.0 ; #DEBUG_LINE_NO:211
      ActiveHostiles.AddRef(currACT as ObjectReference) ; #DEBUG_LINE_NO:212
    EndIf ; #DEBUG_LINE_NO:
    h += 1 ; #DEBUG_LINE_NO:216
  EndWhile ; #DEBUG_LINE_NO:
  Int I = ActiveHostiles.GetCount() - 1 ; #DEBUG_LINE_NO:220
  Int k = 0 ; #DEBUG_LINE_NO:221
  Int kCount = ActiveHostiles.GetCount() ; #DEBUG_LINE_NO:222
  Int iActiveCount = 0 ; #DEBUG_LINE_NO:223
  While k < kCount ; #DEBUG_LINE_NO:226
    Actor curract = ActiveHostiles.GetAt(k) as Actor ; #DEBUG_LINE_NO:227
    If curract.IsEnabled() && curract.GetValue(AmbushTriggered) >= 1.0 ; #DEBUG_LINE_NO:228
      iActiveCount += 1 ; #DEBUG_LINE_NO:229
    EndIf ; #DEBUG_LINE_NO:
    k += 1 ; #DEBUG_LINE_NO:232
  EndWhile ; #DEBUG_LINE_NO:
  Int j = 0 ; #DEBUG_LINE_NO:235
  Int jTurncoats = 0 ; #DEBUG_LINE_NO:236
  Int currVal = UC08_AB_SwitchCount.GetValueInt() ; #DEBUG_LINE_NO:237
  If currVal == 3 ; #DEBUG_LINE_NO:240
    jTurncoats = ActiveHostiles.GetCount() ; #DEBUG_LINE_NO:241
  Else ; #DEBUG_LINE_NO:
    jTurncoats = Math.Floor((iActiveCount / (4 - UC08_AB_SwitchCount.GetValueInt())) as Float) ; #DEBUG_LINE_NO:243
  EndIf ; #DEBUG_LINE_NO:
  While I >= 0 && j <= jTurncoats ; #DEBUG_LINE_NO:247
    Actor curract = ActiveHostiles.GetAt(I) as Actor ; #DEBUG_LINE_NO:248
    If !curract.IsDisabled() && !curract.IsDead() && curract.GetValue(AmbushTriggered) >= 1.0 ; #DEBUG_LINE_NO:251
      curract.StopCombat() ; #DEBUG_LINE_NO:252
      curract.StopCombatAlarm() ; #DEBUG_LINE_NO:253
      curract.RemoveFromFaction(TerrormorphMindControlFaction) ; #DEBUG_LINE_NO:254
      curract.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:255
      curract.AddToFaction(UC08_PlayerAlignedNPCAllyFaction) ; #DEBUG_LINE_NO:256
      curract.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:257
      AllAlliedThralls.AddRef(curract as ObjectReference) ; #DEBUG_LINE_NO:258
      curract.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent) ; #DEBUG_LINE_NO:259
      AllHostileThralls.RemoveRef(curract as ObjectReference) ; #DEBUG_LINE_NO:260
      ActiveHostiles.RemoveRef(curract as ObjectReference) ; #DEBUG_LINE_NO:261
      If !curract.IsDead() ; #DEBUG_LINE_NO:263
        ActiveAlliedThralls.AddRef(curract as ObjectReference) ; #DEBUG_LINE_NO:264
      EndIf ; #DEBUG_LINE_NO:
      curract.StopCombat() ; #DEBUG_LINE_NO:267
      curract.StopCombatAlarm() ; #DEBUG_LINE_NO:268
      curract.EvaluatePackage(False) ; #DEBUG_LINE_NO:270
      curract.StartCombat(Queen.GetActorRef() as ObjectReference, False) ; #DEBUG_LINE_NO:273
      j += 1 ; #DEBUG_LINE_NO:275
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:278
  EndWhile ; #DEBUG_LINE_NO:
  Int a = 0 ; #DEBUG_LINE_NO:282
  Int aCount = AllAlliedThralls.GetCount() ; #DEBUG_LINE_NO:283
  While a < aCount ; #DEBUG_LINE_NO:286
    Actor curract = AllAlliedThralls.GetAt(a) as Actor ; #DEBUG_LINE_NO:287
    If curract.IsEnabled() && !curract.IsDead() && curract.GetValue(AmbushTriggered) >= 1.0 ; #DEBUG_LINE_NO:289
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    a += 1 ; #DEBUG_LINE_NO:294
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function LockQueen()
  Actor QAct = Queen.GetActorRef() ; #DEBUG_LINE_NO:299
  If !QAct.IsDead() ; #DEBUG_LINE_NO:301
    Actor CombatTarget = Self.FindNewQueenCombatTarget() ; #DEBUG_LINE_NO:302
    If CombatTarget ; #DEBUG_LINE_NO:303
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference) ; #DEBUG_LINE_NO:304
      QAct.StartCombat(CombatTarget as ObjectReference, True) ; #DEBUG_LINE_NO:305
      UC08_AB_AnomalyLocked.SetValue(1.0) ; #DEBUG_LINE_NO:306
    EndIf ; #DEBUG_LINE_NO:
    Int I = ActiveAlliedThralls.GetCount() - 1 ; #DEBUG_LINE_NO:310
    While I >= 0 ; #DEBUG_LINE_NO:312
      Actor currACT = ActiveAlliedThralls.GetAt(I) as Actor ; #DEBUG_LINE_NO:313
      If currACT.IsDead() ; #DEBUG_LINE_NO:315
        ActiveAlliedThralls.RemoveRef(currACT as ObjectReference) ; #DEBUG_LINE_NO:316
      EndIf ; #DEBUG_LINE_NO:
      I -= 1 ; #DEBUG_LINE_NO:319
    EndWhile ; #DEBUG_LINE_NO:
    Self.StartTimer(iQueenLockTimerLength as Float, iQueenLockTimerID) ; #DEBUG_LINE_NO:322
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If UC08_AB_AnomalyLocked.GetValue() >= 1.0 ; #DEBUG_LINE_NO:327
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:328
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterBleedout") ; #DEBUG_LINE_NO:329
    Actor CombatTarget = Self.FindNewQueenCombatTarget() ; #DEBUG_LINE_NO:330
    If CombatTarget ; #DEBUG_LINE_NO:332
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference) ; #DEBUG_LINE_NO:333
      Queen.GetActorRef().StartCombat(CombatTarget as ObjectReference, True) ; #DEBUG_LINE_NO:334
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)
  If UC08_AB_AnomalyLocked.GetValue() >= 1.0 ; #DEBUG_LINE_NO:340
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:341
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnEnterBleedout") ; #DEBUG_LINE_NO:342
    Actor CombatTarget = Self.FindNewQueenCombatTarget() ; #DEBUG_LINE_NO:343
    If CombatTarget ; #DEBUG_LINE_NO:345
      ActiveQueenCombatTarget.ForceRefTo(CombatTarget as ObjectReference) ; #DEBUG_LINE_NO:346
      Queen.GetActorRef().StartCombat(CombatTarget as ObjectReference, True) ; #DEBUG_LINE_NO:347
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartSignalIntroTimer()
  Self.StartTimer(iSignalIntroTimerLength as Float, iSignalIntroTimerID) ; #DEBUG_LINE_NO:353
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iSignalIntroTimerID ; #DEBUG_LINE_NO:357
    Self.SetStage(iSignalIntroStage) ; #DEBUG_LINE_NO:358
  ElseIf aiTimerID == iQueenLockTimerID ; #DEBUG_LINE_NO:359
    UC08_AB_AnomalyLocked.SetValue(0.0) ; #DEBUG_LINE_NO:362
    Self.UnregisterForRemoteEvent(ActiveQueenCombatTarget.GetActorRef() as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:363
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RemoveMindControlSpell()
  Int I = 0 ; #DEBUG_LINE_NO:368
  Int iCount = AllHostileThralls.GetCount() ; #DEBUG_LINE_NO:369
  While I < iCount ; #DEBUG_LINE_NO:371
    Actor currThrall = AllHostileThralls.GetAt(I) as Actor ; #DEBUG_LINE_NO:372
    currThrall.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent) ; #DEBUG_LINE_NO:373
    CCT_HitSpell_BigStagger.Cast(currThrall as ObjectReference, None) ; #DEBUG_LINE_NO:374
    currThrall.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:375
    currThrall.AddToFaction(UC08_PlayerAlignedNPCAllyFaction) ; #DEBUG_LINE_NO:376
    currThrall.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:377
    currThrall.EvaluatePackage(False) ; #DEBUG_LINE_NO:378
    currThrall.StopCombat() ; #DEBUG_LINE_NO:379
    currThrall.StopCombatAlarm() ; #DEBUG_LINE_NO:380
    I += 1 ; #DEBUG_LINE_NO:382
  EndWhile ; #DEBUG_LINE_NO:
  Hadrian.GetActorRef().StopCombat() ; #DEBUG_LINE_NO:386
  Kaiser.GetActorRef().StopCombat() ; #DEBUG_LINE_NO:387
  Int j = 0 ; #DEBUG_LINE_NO:390
  Int jCount = AllAlliedThralls.GetCount() ; #DEBUG_LINE_NO:391
  While j < jCount ; #DEBUG_LINE_NO:393
    Actor currACT = AllAlliedThralls.GetAt(j) as Actor ; #DEBUG_LINE_NO:394
    currACT.StopCombat() ; #DEBUG_LINE_NO:395
    currACT.StopCombatAlarm() ; #DEBUG_LINE_NO:396
    currACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:397
    j += 1 ; #DEBUG_LINE_NO:399
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function KillActiveHostiles()
  ActiveHostiles.KillAll(None) ; #DEBUG_LINE_NO:404
EndFunction

Function UpdateSignalMarker()
  ObjectReference currRef = ActiveSignalMarker.GetRef() ; #DEBUG_LINE_NO:408
  currRef.Disable(False) ; #DEBUG_LINE_NO:409
  ActiveSignalMarker.Clear() ; #DEBUG_LINE_NO:410
  Int currSwitchCount = UC08_AB_SwitchCount.GetValueInt() - 1 ; #DEBUG_LINE_NO:411
  ObjectReference nextSignal = SignalMarkers[currSwitchCount].GetRef() ; #DEBUG_LINE_NO:413
  If nextSignal != None ; #DEBUG_LINE_NO:415
    nextSignal.Enable(False) ; #DEBUG_LINE_NO:416
    ActiveSignalMarker.ForceRefTo(nextSignal) ; #DEBUG_LINE_NO:417
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Actor Function FindNewQueenCombatTarget()
  Actor QAct = Queen.GetActorRef() ; #DEBUG_LINE_NO:422
  Int I = 0 ; #DEBUG_LINE_NO:423
  Int iFailsafeCount = 5 ; #DEBUG_LINE_NO:424
  Actor NewTarget = None ; #DEBUG_LINE_NO:425
  Actor SearchSource = QAct ; #DEBUG_LINE_NO:426
  While I < iFailsafeCount && NewTarget == None ; #DEBUG_LINE_NO:429
    Actor PossibleTarget = Game.FindRandomActorFromRef(SearchSource as ObjectReference, 40.0) ; #DEBUG_LINE_NO:430
    If PossibleTarget.IsInFaction(UC08_PlayerAlignedNPCAllyFaction) && !PossibleTarget.IsDead() ; #DEBUG_LINE_NO:433
      NewTarget = PossibleTarget ; #DEBUG_LINE_NO:435
    Else ; #DEBUG_LINE_NO:
      SearchSource = PossibleTarget ; #DEBUG_LINE_NO:438
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:441
  EndWhile ; #DEBUG_LINE_NO:
  If NewTarget ; #DEBUG_LINE_NO:444
    Self.RegisterForRemoteEvent(NewTarget as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:445
    Self.RegisterForRemoteEvent(NewTarget as ScriptObject, "OnEnterBleedout") ; #DEBUG_LINE_NO:446
  EndIf ; #DEBUG_LINE_NO:
  Return NewTarget ; #DEBUG_LINE_NO:450
EndFunction

Function PrepAllyColl(RefCollectionAlias akTargetColl)
  Int I = 0 ; #DEBUG_LINE_NO:454
  Int iCount = akTargetColl.GetCount() ; #DEBUG_LINE_NO:455
  While I < iCount ; #DEBUG_LINE_NO:457
    Actor currACT = akTargetColl.GetAt(I) as Actor ; #DEBUG_LINE_NO:458
    currACT.RemoveFromFaction(UC08_TerrormorphAnomalyFriendFaction) ; #DEBUG_LINE_NO:460
    currACT.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:461
    currACT.AddToFaction(UC08_PlayerAlignedNPCAllyFaction) ; #DEBUG_LINE_NO:462
    currACT.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:463
    currACT.SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:464
    currACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:465
    I += 1 ; #DEBUG_LINE_NO:467
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CleanUpPlantThralls()
  Int I = 0 ; #DEBUG_LINE_NO:473
  Int iCount = AcelesPlantThralls.GetCount() ; #DEBUG_LINE_NO:474
  While I < iCount ; #DEBUG_LINE_NO:476
    Actor currACT = AcelesPlantThralls.GetAt(I) as Actor ; #DEBUG_LINE_NO:477
    If !currACT.IsDead() ; #DEBUG_LINE_NO:479
      currACT.Disable(False) ; #DEBUG_LINE_NO:480
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:483
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:491
EndFunction
