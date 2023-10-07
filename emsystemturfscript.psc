ScriptName EMSystemTurfScript Extends ObjectReference conditional hidden

;-- Variables ---------------------------------------
Int ActiveActors
Int IdleEncounterTimer = 20
Bool RegisterLock
Bool SendingToSleep = False
Int TotalActors
Int UpdateActorsTimer = 10

;-- Properties --------------------------------------
Group Required_Properties collapsedonref
  emsystemquestscript Property EMSystemQuest Auto Const mandatory
  { The quest that handles all of the encounters. }
  Keyword Property EMSystemLinkToTurf Auto Const mandatory
  { The keyword that each actors will be linked to this turf with. }
  Keyword Property EMSystemLinkToSleep Auto Const mandatory
  { The keyword we link the sleeping actors to furniture with.  So we know which ones should be sleeping. }
  Keyword Property ActorTypeTurret Auto Const mandatory
  { They keyword a turrent actor has, since we treat sleeping turrets differently. }
  Keyword Property LinkAmbushFurniture Auto Const mandatory
EndGroup

Bool Property EncounterActive = False Auto conditional

;-- Functions ---------------------------------------

Function StartUpdateActorsTimer()
  Self.StartTimer(Utility.RandomFloat(5.0, 6.0), UpdateActorsTimer) ; #DEBUG_LINE_NO:42
EndFunction

Function StartIdleEncounterTimer()
  Self.StartTimer(Utility.RandomFloat(8.0, 10.0), IdleEncounterTimer) ; #DEBUG_LINE_NO:47
EndFunction

Event OnInit()
  EMSystemQuest.IncrementTotal() ; #DEBUG_LINE_NO:52
EndEvent

Event OnCellLoad()
  EMSystemQuest.IncrementLoaded() ; #DEBUG_LINE_NO:60
  Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:61
  If Self.GetTriggerObjectCount() == 0 && TurfActors.Length > 0 ; #DEBUG_LINE_NO:63
    If Self.AllActorsOutOfCombat(None) ; #DEBUG_LINE_NO:64
      Self.SendToSleep(True, TurfActors) ; #DEBUG_LINE_NO:65
      Self.StartIdleEncounterTimer() ; #DEBUG_LINE_NO:66
    Else ; #DEBUG_LINE_NO:
      Self.WakeUp(TurfActors) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.StartUpdateActorsTimer() ; #DEBUG_LINE_NO:71
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == UpdateActorsTimer ; #DEBUG_LINE_NO:80
    Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:82
    EMSystemQuest.UpdateInactive() ; #DEBUG_LINE_NO:83
    Self.UpdateActorCount(TurfActors) ; #DEBUG_LINE_NO:84
    If !EncounterActive ; #DEBUG_LINE_NO:86
      If Self.GetTriggerObjectCount() == 0 ; #DEBUG_LINE_NO:87
        Self.SendToSleep(False, TurfActors) ; #DEBUG_LINE_NO:88
      Else ; #DEBUG_LINE_NO:
        Self.WakeUp(TurfActors) ; #DEBUG_LINE_NO:90
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If Self.Is3DLoaded() ; #DEBUG_LINE_NO:93
      Self.StartUpdateActorsTimer() ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
  ElseIf aiTimerID == IdleEncounterTimer ; #DEBUG_LINE_NO:96
    Bool continueTimer = False ; #DEBUG_LINE_NO:99
    If Self.GetTriggerObjectCount() == 0 ; #DEBUG_LINE_NO:101
      Actor[] turfactors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:102
      If Self.AllActorsOutOfCombat(turfactors) ; #DEBUG_LINE_NO:105
        If turfactors.Length > 0 ; #DEBUG_LINE_NO:107
          Self.SendToSleep(turfactors as Bool, None) ; #DEBUG_LINE_NO:110
        EndIf ; #DEBUG_LINE_NO:
        continueTimer = True ; #DEBUG_LINE_NO:112
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      continueTimer = True ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
    If continueTimer && Self.Is3DLoaded() ; #DEBUG_LINE_NO:120
      Self.StartIdleEncounterTimer() ; #DEBUG_LINE_NO:121
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SendToSleep(Bool bForced, Actor[] SentTurfActors)
  While RegisterLock ; #DEBUG_LINE_NO:
    If SendingToSleep ; #DEBUG_LINE_NO:134
      Return  ; #DEBUG_LINE_NO:135
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:137
  EndWhile ; #DEBUG_LINE_NO:
  RegisterLock = True ; #DEBUG_LINE_NO:140
  SendingToSleep = True ; #DEBUG_LINE_NO:141
  If Self.GetTriggerObjectCount() == 0 ; #DEBUG_LINE_NO:143
    If EncounterActive == True ; #DEBUG_LINE_NO:144
      EMSystemQuest.DecrementActive() ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
    Actor[] TurfActors = None ; #DEBUG_LINE_NO:148
    EncounterActive = False ; #DEBUG_LINE_NO:150
    If SentTurfActors ; #DEBUG_LINE_NO:152
      TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:153
    Else ; #DEBUG_LINE_NO:
      TurfActors = SentTurfActors ; #DEBUG_LINE_NO:155
    EndIf ; #DEBUG_LINE_NO:
    Int maxSize = TurfActors.Length ; #DEBUG_LINE_NO:158
    Int count = 0 ; #DEBUG_LINE_NO:159
    Self.StopCombatOnAll(TurfActors) ; #DEBUG_LINE_NO:161
    While count < maxSize ; #DEBUG_LINE_NO:163
      Actor turfActor = TurfActors[count] ; #DEBUG_LINE_NO:165
      If turfActor.GetLinkedRef(EMSystemLinkToSleep) as Bool && (bForced || turfActor.IsAIEnabled() || turfActor.GetSitState() != 3 && turfActor.GetSleepState() != 3) ; #DEBUG_LINE_NO:168
        turfActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:173
        If bForced && !turfActor.HasKeyword(ActorTypeTurret) ; #DEBUG_LINE_NO:174
          If turfActor.GetLinkedRef(LinkAmbushFurniture) ; #DEBUG_LINE_NO:175
            turfActor.EnableAI(True, False) ; #DEBUG_LINE_NO:178
            Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:179
            turfActor.SnapIntoInteraction(turfActor.GetLinkedRef(EMSystemLinkToSleep)) ; #DEBUG_LINE_NO:180
            Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:181
            turfActor.EnableAI(False, False) ; #DEBUG_LINE_NO:182
          ElseIf turfActor.GetDistance(turfActor.GetLinkedRef(EMSystemLinkToSleep)) < 128.0 ; #DEBUG_LINE_NO:186
            turfActor.EnableAI(True, False) ; #DEBUG_LINE_NO:188
            Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:189
            turfActor.SnapIntoInteraction(turfActor.GetLinkedRef(EMSystemLinkToSleep)) ; #DEBUG_LINE_NO:190
            Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:192
            turfActor.EnableAI(False, False) ; #DEBUG_LINE_NO:193
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        If turfActor.HasKeyword(ActorTypeTurret) ; #DEBUG_LINE_NO:198
          turfActor.EnableAI(True, False) ; #DEBUG_LINE_NO:200
          Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:201
          turfActor.EnableAI(False, False) ; #DEBUG_LINE_NO:202
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(turfActor as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:207
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:208
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:209
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:210
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:211
      count += 1 ; #DEBUG_LINE_NO:212
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  SendingToSleep = False ; #DEBUG_LINE_NO:217
  RegisterLock = False ; #DEBUG_LINE_NO:218
EndFunction

Function WakeUp(Actor[] SentTurfActors)
  While RegisterLock ; #DEBUG_LINE_NO:
    If EncounterActive ; #DEBUG_LINE_NO:229
      Return  ; #DEBUG_LINE_NO:230
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:232
  EndWhile ; #DEBUG_LINE_NO:
  RegisterLock = True ; #DEBUG_LINE_NO:235
  If EncounterActive == False ; #DEBUG_LINE_NO:238
    EMSystemQuest.IncrementActive() ; #DEBUG_LINE_NO:240
    EncounterActive = True ; #DEBUG_LINE_NO:241
    Actor[] TurfActors = None ; #DEBUG_LINE_NO:242
    If SentTurfActors ; #DEBUG_LINE_NO:244
      TurfActors = SentTurfActors ; #DEBUG_LINE_NO:245
    Else ; #DEBUG_LINE_NO:
      TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:247
    EndIf ; #DEBUG_LINE_NO:
    Int maxSize = TurfActors.Length ; #DEBUG_LINE_NO:250
    Int count = 0 ; #DEBUG_LINE_NO:251
    While count < maxSize ; #DEBUG_LINE_NO:252
      Actor turfActor = TurfActors[count] ; #DEBUG_LINE_NO:254
      Self.UnregisterForAllHitEvents(turfActor as ScriptObject) ; #DEBUG_LINE_NO:255
      Self.UnRegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:256
      Self.UnRegisterForRemoteEvent(turfActor as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:257
      turfActor.EnableAI(True, False) ; #DEBUG_LINE_NO:259
      turfActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:260
      Self.RegisterForRemoteEvent(turfActor as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:261
      count += 1 ; #DEBUG_LINE_NO:262
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  RegisterLock = False ; #DEBUG_LINE_NO:266
EndFunction

Function StopCombatOnAll(Actor[] SentTurfActors)
  Actor[] TurfActors = None ; #DEBUG_LINE_NO:275
  If SentTurfActors ; #DEBUG_LINE_NO:277
    TurfActors = SentTurfActors ; #DEBUG_LINE_NO:278
  Else ; #DEBUG_LINE_NO:
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:280
  EndIf ; #DEBUG_LINE_NO:
  Int maxSize = TurfActors.Length ; #DEBUG_LINE_NO:283
  Int count = 0 ; #DEBUG_LINE_NO:284
  While count < maxSize ; #DEBUG_LINE_NO:285
    Actor turfActor = TurfActors[count] ; #DEBUG_LINE_NO:286
    turfActor.StopCombat() ; #DEBUG_LINE_NO:289
    turfActor.StopCombatAlarm() ; #DEBUG_LINE_NO:290
    count += 1 ; #DEBUG_LINE_NO:292
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UpdateActorCount(Actor[] SentTurfActors)
  Int PreviousTotalActors = TotalActors ; #DEBUG_LINE_NO:301
  Int PreviousActiveActors = ActiveActors ; #DEBUG_LINE_NO:302
  TotalActors = 0 ; #DEBUG_LINE_NO:303
  ActiveActors = 0 ; #DEBUG_LINE_NO:304
  Actor[] TurfActors = None ; #DEBUG_LINE_NO:305
  If SentTurfActors ; #DEBUG_LINE_NO:307
    TurfActors = SentTurfActors ; #DEBUG_LINE_NO:308
  Else ; #DEBUG_LINE_NO:
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:310
  EndIf ; #DEBUG_LINE_NO:
  Int maxSize = TurfActors.Length ; #DEBUG_LINE_NO:313
  Int count = 0 ; #DEBUG_LINE_NO:315
  While count < maxSize ; #DEBUG_LINE_NO:316
    Actor turfActor = TurfActors[count] ; #DEBUG_LINE_NO:317
    TotalActors += 1 ; #DEBUG_LINE_NO:319
    If turfActor.IsAIEnabled() ; #DEBUG_LINE_NO:320
      ActiveActors += 1 ; #DEBUG_LINE_NO:322
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:324
  EndWhile ; #DEBUG_LINE_NO:
  EMSystemQuest.UpdateActorsActive(PreviousActiveActors, ActiveActors) ; #DEBUG_LINE_NO:326
  EMSystemQuest.UpdateActorsTotal(PreviousTotalActors, TotalActors) ; #DEBUG_LINE_NO:327
EndFunction

Bool Function TryToDisableAI(Actor ActorToDisable)
  Bool result = False ; #DEBUG_LINE_NO:333
  If EncounterActive == False ; #DEBUG_LINE_NO:335
    ActorToDisable.EnableAI(False, False) ; #DEBUG_LINE_NO:337
    result = True ; #DEBUG_LINE_NO:338
  EndIf ; #DEBUG_LINE_NO:
  Return result ; #DEBUG_LINE_NO:343
EndFunction

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
  If akFurniture == akSender.GetLinkedRef(EMSystemLinkToSleep) ; #DEBUG_LINE_NO:349
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:353
    Self.TryToDisableAI(akSender) ; #DEBUG_LINE_NO:354
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.CancelTimer(IdleEncounterTimer) ; #DEBUG_LINE_NO:363
  Self.WakeUp(None) ; #DEBUG_LINE_NO:364
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  Actor[] TurfActors = None ; #DEBUG_LINE_NO:373
  If aeCombatState > 0 ; #DEBUG_LINE_NO:374
    Self.CancelTimer(IdleEncounterTimer) ; #DEBUG_LINE_NO:376
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:377
    Self.WakeUp(TurfActors) ; #DEBUG_LINE_NO:378
  ElseIf aeCombatState == 0 ; #DEBUG_LINE_NO:379
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:380
    If Self.AllActorsOutOfCombat(TurfActors) ; #DEBUG_LINE_NO:381
      Self.SendToSleep(TurfActors as Bool, None) ; #DEBUG_LINE_NO:382
      If Self.Is3DLoaded() ; #DEBUG_LINE_NO:383
        Self.StartIdleEncounterTimer() ; #DEBUG_LINE_NO:384
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.CancelTimer(IdleEncounterTimer) ; #DEBUG_LINE_NO:387
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If Self.CountActorsLinkedToMe(EMSystemLinkToTurf, None) == 0 ; #DEBUG_LINE_NO:398
    If EncounterActive == True ; #DEBUG_LINE_NO:399
      EMSystemQuest.DecrementActive() ; #DEBUG_LINE_NO:401
      EMSystemQuest.DecrementTotal() ; #DEBUG_LINE_NO:402
    EndIf ; #DEBUG_LINE_NO:
    EncounterActive = False ; #DEBUG_LINE_NO:405
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  akSender.EnableAI(True, False) ; #DEBUG_LINE_NO:415
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:423
    Actor[] TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:425
    If TurfActors.Length == 0 ; #DEBUG_LINE_NO:426
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.WakeUp(TurfActors) ; #DEBUG_LINE_NO:430
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function AllActorsOutOfCombat(Actor[] SentTurfActors)
  Actor[] TurfActors = None ; #DEBUG_LINE_NO:440
  If SentTurfActors ; #DEBUG_LINE_NO:441
    TurfActors = SentTurfActors ; #DEBUG_LINE_NO:442
  Else ; #DEBUG_LINE_NO:
    TurfActors = Self.GetActorsLinkedToMe(EMSystemLinkToTurf, None) ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
  Int maxSize = TurfActors.Length ; #DEBUG_LINE_NO:446
  Int count = 0 ; #DEBUG_LINE_NO:447
  While count < maxSize ; #DEBUG_LINE_NO:448
    Actor turfActor = TurfActors[count] ; #DEBUG_LINE_NO:449
    If turfActor.GetCombatState() != 0 ; #DEBUG_LINE_NO:450
      Return False ; #DEBUG_LINE_NO:453
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:455
  EndWhile ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:459
EndFunction

Event OnUnload()
  EncounterActive = False ; #DEBUG_LINE_NO:468
  EMSystemQuest.DecrementLoaded() ; #DEBUG_LINE_NO:469
  EMSystemQuest.SubtractFromActorsTotal(TotalActors) ; #DEBUG_LINE_NO:470
  EMSystemQuest.SubtractFromActorsActive(ActiveActors) ; #DEBUG_LINE_NO:471
  EMSystemQuest.UpdateInactive() ; #DEBUG_LINE_NO:472
  Self.UpdateActorCount(None) ; #DEBUG_LINE_NO:473
  TotalActors = 0 ; #DEBUG_LINE_NO:474
  ActiveActors = 0 ; #DEBUG_LINE_NO:475
  Self.UnRegisterForAllEvents() ; #DEBUG_LINE_NO:478
  Self.CancelTimer(UpdateActorsTimer) ; #DEBUG_LINE_NO:480
  Self.CancelTimer(IdleEncounterTimer) ; #DEBUG_LINE_NO:481
EndEvent
