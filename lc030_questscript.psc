ScriptName LC030_QuestScript Extends Quest
{ Quest script for LC030, The Lock. }

;-- Variables ---------------------------------------
Int CONST_CF03_ExteriorCompletedStage = 41 Const
Int CONST_CF03_StageRequiredForCeilingCollapse = 80 Const
Int CONST_CF03_StageToSetWhenIDCardReaderUsed = 48 Const
Int CONST_CF03_TransferChamberCompletedStage = 70 Const
Int CONST_CollapsingCeilingTimerDelay = 1 Const
Int CONST_CollapsingCeilingTimerID = 2 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_ExteriorMonitorDelgadoNearPlayerDistance = 14 Const
Int CONST_ExteriorMonitorDisableDistance = 30 Const
Int CONST_ExteriorMonitorTimerDelay = 3 Const
Int CONST_ExteriorMonitorTimerID = 1 Const
Int CONST_FissureEnemySafeRange = 4 Const
String CONST_IDCardReaderUsedEventName = "CardSwiped" Const
Int CONST_StageToSetDuringCeilingCollapse = 250 Const
Int CONST_StageToSetOnCollapsingWallActivated = 269 Const
Int CONST_StageToSetOnLeavingTheLock = 690 Const
Int CONST_StageToSetWhenShuttleBayCleared = 650 Const
Int CONST_TransferChamberMonitorTimerDelay = 3 Const
Int CONST_TransferChamberMonitorTimerID = 3 Const
inputenablelayer LC030InputLayer
Actor[] allAllies
ObjectReference collapsingCeilingActivatorRef
ObjectReference collapsingCeilingTriggerRef
Actor delgadoRef
Actor genericAlly01Ref
Actor genericAlly02Ref
Bool hasCollapsedCeiling
Bool hasCompletedExterior
ObjectReference loosePanelDoorRef
ObjectReference mapMarkerRef
ObjectReference mathisMoveToMarkerRef
Actor mathisRef
Actor playerRef
spaceshipreference playerShipRef
spaceshipreference shuttleBayShuttleRef

;-- Properties --------------------------------------
Group AutofillProperties
  Quest Property CF03 Auto Const mandatory
  bescript Property BE_CF03_Shuttle Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  LocationAlias Property LC030LockLocation Auto Const mandatory
  LocationAlias Property ShuttleBayShuttleLocation Auto Const mandatory
  ReferenceAlias Property Mathis Auto Const mandatory
  ReferenceAlias Property Mathis_CollapsingCeilingMoveToMarker Auto Const mandatory
  ReferenceAlias Property Delgado Auto Const mandatory
  ReferenceAlias Property GenericAlly01 Auto Const mandatory
  ReferenceAlias Property GenericAlly02 Auto Const mandatory
  ReferenceAlias Property MapMarker Auto Const mandatory
  RefCollectionAlias Property ExteriorEnemiesBeyondTheLock Auto Const mandatory
  RefCollectionAlias Property ExteriorEnemiesWithinTheLock Auto Const mandatory
  RefCollectionAlias Property TransferChamberEnemies_All Auto Const mandatory
  RefCollectionAlias Property FissureEnemies_All Auto Const mandatory
  RefCollectionAlias Property BarracksCreatures_All Auto Const mandatory
  RefCollectionAlias Property ShuttleBayEnemies_All Auto Const mandatory
  ReferenceAlias Property TransferChamberFailsafeTrigger Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingTrigger Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingActivator Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingCollisionPrim Auto Const mandatory
  ReferenceAlias Property CollapsingCeilingNavcutPrim Auto Const mandatory
  ReferenceAlias Property LoosePanelDoor Auto Const mandatory
  ReferenceAlias Property ShuttleBayGryllobaQueen Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property ShuttleBayShuttle Auto Const mandatory
  ReferenceAlias Property StationTheKey Auto Const mandatory
  ReferenceAlias Property KeyPlayerDockingPort Auto Const mandatory
  Cell Property LC030Lock01 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_1 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_2 Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_1_NotPlayable Auto Const mandatory
  Armor Property Spacesuit_CrimsonFleet_Backpack_2_NotPlayable Auto Const mandatory
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  Keyword Property SpaceshipStoredLink Auto Const mandatory
  Location Property SKryx_PSuvorov_Surface Auto Const mandatory
  wwiseevent Property QST_CF03_CeilingCollapse_Collapse Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  ActorValue Property AmbushTriggered Auto Const mandatory
  GlobalVariable Property CF03ExteriorActorsHoldNearPlayerGlobal Auto Const mandatory
  ObjectReference Property CF03DelgadoInsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03MathisInsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03GenericAlly01InsideLockEntranceMarkerRef Auto Const mandatory
  ObjectReference Property CF03GenericAlly02InsideLockEntranceMarkerRef Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SwapOutShuttle()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:112
  mathisRef = Mathis.GetActorRef() ; #DEBUG_LINE_NO:113
  delgadoRef = Delgado.GetActorRef() ; #DEBUG_LINE_NO:114
  genericAlly01Ref = GenericAlly01.GetActorRef() ; #DEBUG_LINE_NO:115
  genericAlly02Ref = GenericAlly02.GetActorRef() ; #DEBUG_LINE_NO:116
  shuttleBayShuttleRef = ShuttleBayShuttle.GetShipRef() ; #DEBUG_LINE_NO:117
  allAllies = new Actor[4] ; #DEBUG_LINE_NO:118
  allAllies[0] = delgadoRef ; #DEBUG_LINE_NO:119
  allAllies[1] = mathisRef ; #DEBUG_LINE_NO:120
  allAllies[2] = genericAlly01Ref ; #DEBUG_LINE_NO:121
  allAllies[3] = genericAlly02Ref ; #DEBUG_LINE_NO:122
  mathisMoveToMarkerRef = Mathis_CollapsingCeilingMoveToMarker.GetRef() ; #DEBUG_LINE_NO:123
  mapMarkerRef = MapMarker.GetRef() ; #DEBUG_LINE_NO:125
  collapsingCeilingTriggerRef = CollapsingCeilingTrigger.GetRef() ; #DEBUG_LINE_NO:126
  collapsingCeilingActivatorRef = CollapsingCeilingActivator.GetRef() ; #DEBUG_LINE_NO:127
  loosePanelDoorRef = LoosePanelDoor.GetRef() ; #DEBUG_LINE_NO:128
  GenericAlly01.TryToReset() ; #DEBUG_LINE_NO:130
  GenericAlly01.TryToReset() ; #DEBUG_LINE_NO:131
  ShuttleBayGryllobaQueen.TryToReset() ; #DEBUG_LINE_NO:132
  ExteriorEnemiesBeyondTheLock.ResetAll() ; #DEBUG_LINE_NO:133
  ExteriorEnemiesWithinTheLock.ResetAll() ; #DEBUG_LINE_NO:134
  TransferChamberEnemies_All.ResetAll() ; #DEBUG_LINE_NO:135
  BarracksCreatures_All.ResetAll() ; #DEBUG_LINE_NO:136
  ShuttleBayEnemies_All.ResetAll() ; #DEBUG_LINE_NO:137
  Self.SetIgnoreFriendlyHitsOnAllies(True) ; #DEBUG_LINE_NO:140
  Self.RegisterForRemoteEvent(genericAlly01Ref as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:143
  If genericAlly01Ref.Is3DLoaded() ; #DEBUG_LINE_NO:144
    Self.RemoveAllyBackpacks() ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(shuttleBayShuttleRef as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:149
  Self.RegisterForRemoteEvent(collapsingCeilingTriggerRef as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:152
  Self.RegisterForRemoteEvent(loosePanelDoorRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:155
  TransferChamberEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:158
  BarracksCreatures_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:159
  ShuttleBayEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:160
EndEvent

Event ObjectReference.OnLoad(ObjectReference akSource)
  If akSource == genericAlly01Ref as ObjectReference ; #DEBUG_LINE_NO:173
    Self.RemoveAllyBackpacks() ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
  If (akSource == shuttleBayShuttleRef as ObjectReference) && Self.GetStageDone(CONST_StageToSetWhenShuttleBayCleared) ; #DEBUG_LINE_NO:176
    BE_CF03_Shuttle.SetEnemyShipLandingRampsOpenState(True) ; #DEBUG_LINE_NO:177
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RemoveAllyBackpacks()
  Self.UnregisterForRemoteEvent(genericAlly01Ref as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:183
  Int I = 0 ; #DEBUG_LINE_NO:185
  While I < allAllies.Length ; #DEBUG_LINE_NO:186
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1 as Form, 1, False, None) ; #DEBUG_LINE_NO:187
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2 as Form, 1, False, None) ; #DEBUG_LINE_NO:188
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable as Form, 1, False, None) ; #DEBUG_LINE_NO:189
    allAllies[I].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2_NotPlayable as Form, 1, False, None) ; #DEBUG_LINE_NO:190
    I += 1 ; #DEBUG_LINE_NO:191
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StartExteriorMonitor()
  Self.StartTimer(CONST_ExteriorMonitorTimerDelay as Float, CONST_ExteriorMonitorTimerID) ; #DEBUG_LINE_NO:197
EndFunction

Function MonitorExterior()
  If hasCompletedExterior ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  ElseIf CF03.GetStage() >= CONST_CF03_ExteriorCompletedStage ; #DEBUG_LINE_NO:203
    Self.EndExteriorMonitor() ; #DEBUG_LINE_NO:205
  ElseIf playerRef.GetCurrentLocation() != LC030LockLocation.GetLocation() ; #DEBUG_LINE_NO:206
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:208
    CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:210
    If !playerRef.GetCurrentLocation().IsChild(SKryx_PSuvorov_Surface) ; #DEBUG_LINE_NO:212
      Int I = 0 ; #DEBUG_LINE_NO:213
      While I < allAllies.Length ; #DEBUG_LINE_NO:214
        allAllies[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:215
        allAllies[I].MoveToPackageLocation() ; #DEBUG_LINE_NO:216
        I += 1 ; #DEBUG_LINE_NO:217
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Bool actorsHoldingNearDelgado = False ; #DEBUG_LINE_NO:225
    If playerRef.GetDistance(mapMarkerRef) < delgadoRef.GetDistance(mapMarkerRef) ; #DEBUG_LINE_NO:226
      CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:228
    Else ; #DEBUG_LINE_NO:
      actorsHoldingNearDelgado = True ; #DEBUG_LINE_NO:231
      CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:232
    EndIf ; #DEBUG_LINE_NO:
    If actorsHoldingNearDelgado || (delgadoRef.GetDistance(playerRef as ObjectReference) < CONST_ExteriorMonitorDelgadoNearPlayerDistance as Float) ; #DEBUG_LINE_NO:237
      Self.MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock, False) ; #DEBUG_LINE_NO:239
    EndIf ; #DEBUG_LINE_NO:
    Int i = 0 ; #DEBUG_LINE_NO:246
    While i < allAllies.Length ; #DEBUG_LINE_NO:247
      If allAllies[i].GetValue(Health) < 0.0 ; #DEBUG_LINE_NO:249
        allAllies[i].RestoreValue(Health, Math.Abs(allAllies[i].GetValue(Health) + 10.0)) ; #DEBUG_LINE_NO:250
      EndIf ; #DEBUG_LINE_NO:
      i += 1 ; #DEBUG_LINE_NO:253
    EndWhile ; #DEBUG_LINE_NO:
    Self.EVPAllies() ; #DEBUG_LINE_NO:257
    Self.StartTimer(CONST_ExteriorMonitorTimerDelay as Float, CONST_ExteriorMonitorTimerID) ; #DEBUG_LINE_NO:260
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MonitorCleanupDistantEnemies(RefCollectionAlias enemyCollection, Bool forceCleanup)
  Actor[] enemies = enemyCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:266
  Int I = 0 ; #DEBUG_LINE_NO:267
  While I < enemies.Length ; #DEBUG_LINE_NO:268
    Actor current = enemies[I] ; #DEBUG_LINE_NO:269
    If current != None && current.GetValue(AmbushTriggered) > 0.0 ; #DEBUG_LINE_NO:271
      If current.IsDead() ; #DEBUG_LINE_NO:273
        enemyCollection.RemoveRef(current as ObjectReference) ; #DEBUG_LINE_NO:275
      ElseIf forceCleanup || (delgadoRef.GetDistance(current as ObjectReference) > CONST_ExteriorMonitorDisableDistance as Float) && (playerRef.GetDistance(current as ObjectReference) > CONST_ExteriorMonitorDisableDistance as Float) && !playerRef.HasDetectionLOS(current as ObjectReference) ; #DEBUG_LINE_NO:276
        enemyCollection.RemoveRef(current as ObjectReference) ; #DEBUG_LINE_NO:279
        current.DisableNoWait(False) ; #DEBUG_LINE_NO:280
        current.Delete() ; #DEBUG_LINE_NO:281
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:284
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EndExteriorMonitorNoWait()
  Self.CallFunctionNoWait("EndExteriorMonitor", None) ; #DEBUG_LINE_NO:289
EndFunction

Function EndExteriorMonitor()
  hasCompletedExterior = True ; #DEBUG_LINE_NO:293
  Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:294
  Self.MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock, True) ; #DEBUG_LINE_NO:295
  Self.MonitorCleanupDistantEnemies(ExteriorEnemiesWithinTheLock, True) ; #DEBUG_LINE_NO:296
EndFunction

Function SetIgnoreFriendlyHitsOnAllies(Bool shouldIgnore)
  Int I = 0 ; #DEBUG_LINE_NO:304
  While I < allAllies.Length ; #DEBUG_LINE_NO:305
    allAllies[I].IgnoreFriendlyHits(shouldIgnore) ; #DEBUG_LINE_NO:306
    I += 1 ; #DEBUG_LINE_NO:307
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveAlliesToPackageLocations()
  Int I = 0 ; #DEBUG_LINE_NO:312
  While I < allAllies.Length ; #DEBUG_LINE_NO:313
    allAllies[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:314
    allAllies[I].MoveToPackageLocation() ; #DEBUG_LINE_NO:315
    I += 1 ; #DEBUG_LINE_NO:316
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EVPAllies()
  Int I = 0 ; #DEBUG_LINE_NO:321
  While I < allAllies.Length ; #DEBUG_LINE_NO:322
    allAllies[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:323
    I += 1 ; #DEBUG_LINE_NO:324
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveAlliesIntoLock()
  If delgadoRef.GetParentCell() != LC030Lock01 ; #DEBUG_LINE_NO:329
    delgadoRef.MoveTo(CF03DelgadoInsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:330
  EndIf ; #DEBUG_LINE_NO:
  If mathisRef.GetParentCell() != LC030Lock01 ; #DEBUG_LINE_NO:332
    mathisRef.MoveTo(CF03MathisInsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
  If genericAlly01Ref.GetParentCell() != LC030Lock01 ; #DEBUG_LINE_NO:335
    genericAlly01Ref.MoveTo(CF03GenericAlly01InsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:336
  EndIf ; #DEBUG_LINE_NO:
  If genericAlly02Ref.GetParentCell() != LC030Lock01 ; #DEBUG_LINE_NO:338
    genericAlly02Ref.MoveTo(CF03GenericAlly02InsideLockEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:339
  EndIf ; #DEBUG_LINE_NO:
  Self.EVPAllies() ; #DEBUG_LINE_NO:341
EndFunction

Function RegisterForDelgadoUsingIDCardReader()
  Self.RegisterForAnimationEvent(delgadoRef as ObjectReference, CONST_IDCardReaderUsedEventName) ; #DEBUG_LINE_NO:351
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If (akSource == delgadoRef as ObjectReference) && asEventName == CONST_IDCardReaderUsedEventName ; #DEBUG_LINE_NO:355
    Self.UnregisterForAnimationEvent(delgadoRef as ObjectReference, CONST_IDCardReaderUsedEventName) ; #DEBUG_LINE_NO:356
    CF03.SetStage(CONST_CF03_StageToSetWhenIDCardReaderUsed) ; #DEBUG_LINE_NO:357
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartTransferChamberMonitor()
  Self.StartTimer(CONST_TransferChamberMonitorTimerDelay as Float, CONST_TransferChamberMonitorTimerID) ; #DEBUG_LINE_NO:367
EndFunction

Function MonitorTransferChamber()
  ObjectReference transferChamberFailsafeTriggerRef = TransferChamberFailsafeTrigger.GetRef() ; #DEBUG_LINE_NO:371
  Actor[] enemies = TransferChamberEnemies_All.GetArray() as Actor[] ; #DEBUG_LINE_NO:372
  Int I = 0 ; #DEBUG_LINE_NO:373
  While I < enemies.Length ; #DEBUG_LINE_NO:374
    Actor current = enemies[I] ; #DEBUG_LINE_NO:375
    If current != None && !current.IsDead() && transferChamberFailsafeTriggerRef.IsInTrigger(current as ObjectReference) ; #DEBUG_LINE_NO:376
      current.Kill(None) ; #DEBUG_LINE_NO:377
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:380
  EndWhile ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(CONST_CF03_TransferChamberCompletedStage) ; #DEBUG_LINE_NO:382
    Self.StartTimer(CONST_TransferChamberMonitorTimerDelay as Float, CONST_TransferChamberMonitorTimerID) ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  If !hasCollapsedCeiling && (akTriggerRef == playerRef as ObjectReference) ; #DEBUG_LINE_NO:393
    Self.CheckCollapsingCeiling() ; #DEBUG_LINE_NO:394
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckCollapsingCeiling()
  If collapsingCeilingTriggerRef.IsInTrigger(playerRef as ObjectReference) && CF03.GetStageDone(CONST_CF03_StageRequiredForCeilingCollapse) ; #DEBUG_LINE_NO:399
    Bool shouldRestartTimer = True ; #DEBUG_LINE_NO:400
    If collapsingCeilingTriggerRef.IsInTrigger(mathisRef as ObjectReference) ; #DEBUG_LINE_NO:401
      shouldRestartTimer = !Self.TryToCollapseCeiling() ; #DEBUG_LINE_NO:402
    ElseIf !playerRef.HasDetectionLOS(mathisMoveToMarkerRef) && !playerRef.HasDetectionLOS(mathisRef as ObjectReference) ; #DEBUG_LINE_NO:403
      mathisRef.MoveTo(mathisMoveToMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:404
      shouldRestartTimer = !Self.TryToCollapseCeiling() ; #DEBUG_LINE_NO:405
    EndIf ; #DEBUG_LINE_NO:
    If shouldRestartTimer ; #DEBUG_LINE_NO:407
      Self.StartTimer(CONST_CollapsingCeilingTimerDelay as Float, CONST_CollapsingCeilingTimerID) ; #DEBUG_LINE_NO:408
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function TryToCollapseCeiling()
  CollapsingCeilingCollisionPrim.TryToEnable() ; #DEBUG_LINE_NO:414
  If !collapsingCeilingTriggerRef.IsInTrigger(playerRef as ObjectReference) ; #DEBUG_LINE_NO:415
    CollapsingCeilingCollisionPrim.TryToDisable() ; #DEBUG_LINE_NO:416
    Return False ; #DEBUG_LINE_NO:417
  Else ; #DEBUG_LINE_NO:
    Self.CollapseCeiling(False) ; #DEBUG_LINE_NO:419
    Return True ; #DEBUG_LINE_NO:420
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CollapseCeiling(Bool isForcedByQuickstart)
  If !hasCollapsedCeiling ; #DEBUG_LINE_NO:425
    hasCollapsedCeiling = True ; #DEBUG_LINE_NO:426
    LC030InputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:428
    LC030InputLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:429
    CollapsingCeilingNavcutPrim.TryToEnable() ; #DEBUG_LINE_NO:430
    ObjectReference collapsingCeilingRef = CollapsingCeilingActivator.GetRef() ; #DEBUG_LINE_NO:431
    collapsingCeilingRef.PlayAnimation("Play01") ; #DEBUG_LINE_NO:432
    QST_CF03_CeilingCollapse_Collapse.Play(collapsingCeilingRef, None, None) ; #DEBUG_LINE_NO:433
    If !isForcedByQuickstart ; #DEBUG_LINE_NO:435
      Self.SetStage(CONST_StageToSetDuringCeilingCollapse) ; #DEBUG_LINE_NO:436
      Game.ShakeCamera(collapsingCeilingActivatorRef, 0.5, 2.0) ; #DEBUG_LINE_NO:437
      Utility.Wait(2.0) ; #DEBUG_LINE_NO:438
      CollapsingCeilingCollisionPrim.TryToDisable() ; #DEBUG_LINE_NO:439
    EndIf ; #DEBUG_LINE_NO:
    playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:443
    Self.RegisterForRemoteEvent(ShuttleBayShuttle.GetShipRef() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:444
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:445
    Int I = 0 ; #DEBUG_LINE_NO:447
    While I < allAllies.Length ; #DEBUG_LINE_NO:448
      allAllies[I].EquipItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable as Form, False, False) ; #DEBUG_LINE_NO:449
      I += 1 ; #DEBUG_LINE_NO:450
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnblockCollapsingWallActivation()
  loosePanelDoorRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:456
EndFunction

Function TryToStopCombatInFissure()
  Actor[] fissureEnemyRefs = FissureEnemies_All.GetArray() as Actor[] ; #DEBUG_LINE_NO:465
  Int I = 0 ; #DEBUG_LINE_NO:466
  While I < fissureEnemyRefs.Length ; #DEBUG_LINE_NO:468
    Actor current = fissureEnemyRefs[I] ; #DEBUG_LINE_NO:469
    If current == None || current.IsDead() || !current.IsInCombat() ; #DEBUG_LINE_NO:470
       ; #DEBUG_LINE_NO:
    ElseIf current.HasDetectionLOS(playerRef as ObjectReference) || current.HasDetectionLOS(mathisRef as ObjectReference) || (current.GetDistance(playerRef as ObjectReference) < CONST_FissureEnemySafeRange as Float) ; #DEBUG_LINE_NO:472
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      current.StopCombat() ; #DEBUG_LINE_NO:476
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:478
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_ExteriorMonitorTimerID ; #DEBUG_LINE_NO:489
    Self.MonitorExterior() ; #DEBUG_LINE_NO:490
  ElseIf timerID == CONST_TransferChamberMonitorTimerID ; #DEBUG_LINE_NO:491
    Self.MonitorTransferChamber() ; #DEBUG_LINE_NO:492
  ElseIf timerID == CONST_CollapsingCeilingTimerID ; #DEBUG_LINE_NO:493
    Self.CheckCollapsingCeiling() ; #DEBUG_LINE_NO:494
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == loosePanelDoorRef ; #DEBUG_LINE_NO:499
    Self.SetStage(CONST_StageToSetOnCollapsingWallActivated) ; #DEBUG_LINE_NO:500
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If !hasCompletedExterior && akNewLoc == LC030LockLocation.GetLocation() ; #DEBUG_LINE_NO:505
    Self.StartExteriorMonitor() ; #DEBUG_LINE_NO:506
    Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:507
  ElseIf hasCollapsedCeiling ; #DEBUG_LINE_NO:
    If akNewLoc == ShuttleBayShuttleLocation.GetLocation() ; #DEBUG_LINE_NO:509
       ; #DEBUG_LINE_NO:
    ElseIf akNewLoc != LC030LockLocation.GetLocation() ; #DEBUG_LINE_NO:511
      Self.ReenableFastTravel() ; #DEBUG_LINE_NO:513
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSource, Location akOldLoc, Location akNewLoc)
  If hasCollapsedCeiling ; #DEBUG_LINE_NO:519
    If akSource == ShuttleBayShuttle.GetShipRef() ; #DEBUG_LINE_NO:520
      playerShipRef.InstantUndock() ; #DEBUG_LINE_NO:522
      playerShipRef.SetLinkedRef(KeyPlayerDockingPort.GetRef(), SpaceshipStoredLink, True) ; #DEBUG_LINE_NO:523
      playerShipRef.Disable(False) ; #DEBUG_LINE_NO:524
      playerShipRef.MoveTo(StationTheKey.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:525
      Self.UnregisterForRemoteEvent(shuttleBayShuttleRef as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:527
      Self.ReenableFastTravel() ; #DEBUG_LINE_NO:529
    Else ; #DEBUG_LINE_NO:
      Self.ReenableFastTravel() ; #DEBUG_LINE_NO:532
    EndIf ; #DEBUG_LINE_NO:
    BE_CF03_Shuttle.SetStage(20) ; #DEBUG_LINE_NO:535
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReenableFastTravel()
  If LC030InputLayer != None ; #DEBUG_LINE_NO:549
    LC030InputLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:550
    LC030InputLayer.Delete() ; #DEBUG_LINE_NO:551
    LC030InputLayer = None ; #DEBUG_LINE_NO:552
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(CONST_StageToSetOnLeavingTheLock) ; #DEBUG_LINE_NO:554
  Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:555
EndFunction

Function Cleanup()
  playerRef = None ; #DEBUG_LINE_NO:559
  mathisRef = None ; #DEBUG_LINE_NO:560
  delgadoRef = None ; #DEBUG_LINE_NO:561
  genericAlly01Ref = None ; #DEBUG_LINE_NO:562
  genericAlly02Ref = None ; #DEBUG_LINE_NO:563
  allAllies = None ; #DEBUG_LINE_NO:564
  mathisMoveToMarkerRef = None ; #DEBUG_LINE_NO:565
  mapMarkerRef = None ; #DEBUG_LINE_NO:566
  collapsingCeilingTriggerRef = None ; #DEBUG_LINE_NO:567
  collapsingCeilingActivatorRef = None ; #DEBUG_LINE_NO:568
  playerShipRef = None ; #DEBUG_LINE_NO:569
  shuttleBayShuttleRef = None ; #DEBUG_LINE_NO:570
  Self.ReenableFastTravel() ; #DEBUG_LINE_NO:571
EndFunction
