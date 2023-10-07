ScriptName UCR04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Aliases
  RefCollectionAlias Property Enemies Auto Const mandatory
  { Ref collection for the enemies we'll have in this quest }
  RefCollectionAlias Property UnsampledEnemies Auto Const mandatory
  { Ref collection that contains only enemies that haven't yet had their samples removed }
  RefCollectionAlias Property SpawnMarkers Auto Const mandatory
  { Ref collection holding the spawn markers for the aliens }
  RefCollectionAlias Property CreatureSamples Auto Const mandatory
  { Holding collection for the creature sample items }
  RefCollectionAlias Property ActiveCreatureSamples Auto Const mandatory
  { Collection used for the creature sample items that are now available for collection }
  ReferenceAlias Property PatrolingEnemy Auto Const mandatory
  { Alias to get one of the critters patroling }
  ReferenceAlias Property Player Auto Const mandatory
  { Player quest alias }
  ReferenceAlias Property LegendaryAlias Auto Const mandatory
  { Alias we shove a critter into if we want to make it Legendary }
  ReferenceAlias Property PatrolStartMarker Auto Const mandatory
  { Alias for a patrol path marker }
  RefCollectionAlias Property PatrolingEnemies Auto Const mandatory
  { Ref collection to get the NPCs into a patrolling group }
EndGroup

Group Globals
  GlobalVariable Property UCR04_MinSamplesRequired Auto Const mandatory
  { Minimum samples required on this quest }
  GlobalVariable Property UCR04_MaxSamplesRequired Auto Const mandatory
  { Max number of samples required on this quest }
  GlobalVariable Property UCR04_SamplesTotalRequired Auto Const mandatory
  { Ultimate number of samples the player needs to collect }
  GlobalVariable Property UCR04_SamplesHarvested Auto Const mandatory
  { Tracking global for how many samples the player has collected }
  GlobalVariable Property UCR04_RequireOutOfCombatHarvesting Auto Const mandatory
  { Global used to toggle whether or not the player needs to be in combat to harvest from the critters. Set to ONE by default. }
  GlobalVariable Property UCR04_LegendaryCritterChance Auto Const mandatory
  { Percent change 0-100 that this quest will spawn a legendary critter }
  GlobalVariable Property UCR04_MaxPatrollingEnemies Auto Const mandatory
  { Max number of NPCs we want patrolling together }
  GlobalVariable Property UCR04_MinPatrollingEnemies Auto Const mandatory
  { Min number of NPCs we want patrolling together }
  GlobalVariable Property UCR04_TotalPatrollingEnemies Auto Const mandatory
  { Final count of how many NPCs we want patrolling together }
EndGroup

Group ObjectiveIndicesAndStages
  Int Property SampleCollectObj = 100 Auto Const
  { Objective index telling the player to collect samples }
  Int Property NonLethalObj = 111 Auto Const
  { Objective index telling the player they can do it non-lethaly }
EndGroup

Group Misc
  LocationRefType Property REScenePatrolStartLocRef Auto Const mandatory
  { Loc ref used to designate a marker starting a patrol path }
  Keyword Property UCR04SpecimenTarget Auto Const mandatory
  { Keyword used to find proper specimen targets }
  MiscObject Property UCR04_SpecimenSample Auto Const mandatory
  { The samples the player is hunting }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to throw when the player tries to harvest material from their target while it's in combat }
  Perk Property UCR04_Critters_ReduceIncomingDamage_c75 Auto Const mandatory
  { Damage reduction perk to make these critters a little tougher }
  ActorValue Property Confidence Auto Const mandatory
  { Confidence actor value }
  Int Property MinConfidenceValue = 3 Auto Const
  { Baseline confidence value we want to give these creatures }
  ucparentfactionquestscript Property DialogueUCFactionAlwaysOn Auto Const mandatory
  { Parent quest for all things UC. Used to manage the custom events for the sample harvesting }
EndGroup


;-- Functions ---------------------------------------

Function PrepQuest()
  Int iSampleAmount = Utility.RandomInt(UCR04_MinSamplesRequired.GetValueInt(), UCR04_MaxSamplesRequired.GetValueInt()) ; #DEBUG_LINE_NO:102
  If iSampleAmount < 1 ; #DEBUG_LINE_NO:104
    iSampleAmount = 1 ; #DEBUG_LINE_NO:105
  ElseIf iSampleAmount > Enemies.GetCount() ; #DEBUG_LINE_NO:106
    iSampleAmount = Enemies.GetCount() ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  UCR04_SamplesHarvested.SetValue(0.0) ; #DEBUG_LINE_NO:111
  Self.SpawnEnemies(iSampleAmount) ; #DEBUG_LINE_NO:116
  UCR04_SamplesTotalRequired.SetValue(iSampleAmount as Float) ; #DEBUG_LINE_NO:119
  (Player as ucr04_playeraliasscript).ReadyPlayerAliasScript(UCR04_SamplesTotalRequired.GetValueInt()) ; #DEBUG_LINE_NO:121
  Self.UpdateCurrentInstanceGlobal(UCR04_SamplesHarvested) ; #DEBUG_LINE_NO:122
  Self.UpdateCurrentInstanceGlobal(UCR04_SamplesTotalRequired) ; #DEBUG_LINE_NO:123
  Self.RegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_UCR04SampleCollected") ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayed(NonLethalObj, True, False) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayedAtTop(SampleCollectObj) ; #DEBUG_LINE_NO:129
EndFunction

Function SpawnEnemies(Int iNumofSamples)
  Int I = 0 ; #DEBUG_LINE_NO:135
  Int iCount = Enemies.GetCount() ; #DEBUG_LINE_NO:136
  Int iRand = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:141
  Int iFinalCount = iCount - iRand ; #DEBUG_LINE_NO:142
  iCount = iFinalCount ; #DEBUG_LINE_NO:143
  If iCount < iNumofSamples ; #DEBUG_LINE_NO:146
    iCount = iNumofSamples ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  Int iLegendChange = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:151
  If iLegendChange <= UCR04_LegendaryCritterChance.GetValueInt() ; #DEBUG_LINE_NO:154
    I += 1 ; #DEBUG_LINE_NO:156
    Self.PrepEnemy(LegendaryAlias.GetActorRef()) ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
  UCR04_TotalPatrollingEnemies.SetValue(0.0) ; #DEBUG_LINE_NO:161
  Int iPatrollerCount = Utility.RandomInt(UCR04_MinPatrollingEnemies.GetValueInt(), UCR04_MaxPatrollingEnemies.GetValueInt()) ; #DEBUG_LINE_NO:162
  UCR04_TotalPatrollingEnemies.SetValue(iPatrollerCount as Float) ; #DEBUG_LINE_NO:163
  Actor currEnemy = None ; #DEBUG_LINE_NO:166
  While I < iCount ; #DEBUG_LINE_NO:168
    currEnemy = Enemies.GetAt(I) as Actor ; #DEBUG_LINE_NO:169
    Self.PrepEnemy(currEnemy) ; #DEBUG_LINE_NO:172
    I += 1 ; #DEBUG_LINE_NO:173
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function PrepEnemy(Actor akEnemyToPrep)
  ObjectReference currSpawn = None ; #DEBUG_LINE_NO:180
  ObjectReference currSample = None ; #DEBUG_LINE_NO:181
  Int iSpawnIndex = Utility.RandomInt(0, SpawnMarkers.GetCount() - 1) ; #DEBUG_LINE_NO:183
  currSpawn = SpawnMarkers.GetAt(iSpawnIndex) ; #DEBUG_LINE_NO:184
  akEnemyToPrep.MoveTo(currSpawn, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:186
  If PatrolStartMarker.GetRef() != None && PatrolingEnemies.GetCount() < UCR04_TotalPatrollingEnemies.GetValueInt() ; #DEBUG_LINE_NO:189
    PatrolingEnemies.AddRef(akEnemyToPrep as ObjectReference) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  currSample = CreatureSamples.GetAt(0) ; #DEBUG_LINE_NO:194
  ActiveCreatureSamples.AddRef(currSample) ; #DEBUG_LINE_NO:196
  akEnemyToPrep.AddItem(currSample as Form, 1, False) ; #DEBUG_LINE_NO:197
  CreatureSamples.RemoveRef(currSample) ; #DEBUG_LINE_NO:198
  UnsampledEnemies.AddRef(akEnemyToPrep as ObjectReference) ; #DEBUG_LINE_NO:201
  akEnemyToPrep.AddPerk(UCR04_Critters_ReduceIncomingDamage_c75, False) ; #DEBUG_LINE_NO:202
  If akEnemyToPrep.GetValue(Confidence) < MinConfidenceValue as Float ; #DEBUG_LINE_NO:203
    akEnemyToPrep.SetValue(Confidence, MinConfidenceValue as Float) ; #DEBUG_LINE_NO:204
  EndIf ; #DEBUG_LINE_NO:
  akEnemyToPrep.Enable(False) ; #DEBUG_LINE_NO:207
  currSample.Enable(False) ; #DEBUG_LINE_NO:209
  akEnemyToPrep.EvaluatePackage(False) ; #DEBUG_LINE_NO:211
EndFunction

Event UCParentFactionQuestScript.UCR04SampleCollected(ucparentfactionquestscript akSender, Var[] akArgs)
  Actor akTargetCreature = akArgs[0] as Actor ; #DEBUG_LINE_NO:215
  If akTargetCreature.HasKeyword(UCR04SpecimenTarget) ; #DEBUG_LINE_NO:219
    If !akTargetCreature.IsInCombat() || UCR04_RequireOutOfCombatHarvesting.GetValueInt() <= 0 ; #DEBUG_LINE_NO:222
      UnsampledEnemies.RemoveRef(akTargetCreature as ObjectReference) ; #DEBUG_LINE_NO:223
      Int SpecimenCount = akTargetCreature.GetItemCount(UCR04_SpecimenSample as Form) ; #DEBUG_LINE_NO:224
      akTargetCreature.RemoveItem(UCR04_SpecimenSample as Form, SpecimenCount, False, None) ; #DEBUG_LINE_NO:226
      Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:228
      Int I = 0 ; #DEBUG_LINE_NO:230
      Int iCount = SpecimenCount ; #DEBUG_LINE_NO:231
      While I < iCount ; #DEBUG_LINE_NO:233
        PlayACT.AddAliasedItem(UCR04_SpecimenSample as Form, ActiveCreatureSamples as Alias, 1, True) ; #DEBUG_LINE_NO:234
        I += 1 ; #DEBUG_LINE_NO:237
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:240
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  Self.UnregisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_UCR04SampleCollected") ; #DEBUG_LINE_NO:246
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:253
EndFunction
