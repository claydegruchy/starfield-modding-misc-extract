ScriptName LC088_KeyQuestScript Extends Quest
{ Quest script for LC088_Key, the Key portion of the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CONST_Aggression_Aggressive = 1 Const
Int CONST_Aggression_Unaggressive = 0 Const
Int CONST_CaptainActiveStage_Adler = 16 Const
Int CONST_CaptainActiveStage_Estelle = 18 Const
Int CONST_CaptainActiveStage_Huan = 17 Const
Int CONST_CaptainActiveStage_Mathis = 14 Const
Int CONST_CaptainActiveStage_Naeva = 15 Const
Int CONST_CaptainActiveStage_Rokov = 13 Const
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_CompleteStage = 1100 Const
Int CONST_Confidence_Cowardly = 0 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_DoorToVossOpenedStage = 390 Const
Int CONST_LockLevelTerminalOnly = 253 Const
Int CONST_ReactorBattleStartStage = 700 Const
Int CONST_ReactorOverride01Stage = 790 Const
Int CONST_ReactorOverride02Stage = 890 Const
Int CONST_ReactorOverride03Stage = 990 Const
Int CONST_VossBombArmedStage = 420 Const
Int CONST_VossBombDisarmedStage = 19 Const
Int CONST_VossBombExplodedDelay = 4 Const
Int CONST_VossBombExplodedStage = 480 Const
Int CONST_VossOpensDoorsStage = 490 Const
ObjectReference Reactor01ShutdownControlRef
ObjectReference Reactor02ShutdownControlRef
ObjectReference Reactor03ShutdownControlRef
ObjectReference[] ReactorSoundMarkerRefs
inputenablelayer keyInputLayer
Actor player
Int reactorOverloadID
Bool vossBombExploded
Int vossBombTickNormalID
Int vossBombTickUrgentID
Actor vossRef

;-- Properties --------------------------------------
Group QuestProperties
  ReferenceAlias[] Property OtherKeyActors Auto Const mandatory
  wwiseevent[] Property ReactorSoundEvents Auto Const mandatory
EndGroup

Group AutofillProperties
  Quest Property LC082 Auto Const mandatory
  LocationAlias Property LC088KeyInteriorLocation Auto Const mandatory
  ReferenceAlias Property Rokov Auto Const mandatory
  ReferenceAlias Property Rokov_EnableMarker Auto Const mandatory
  ReferenceAlias Property Rokov_DisableMarker Auto Const mandatory
  ReferenceAlias Property Mathis Auto Const mandatory
  ReferenceAlias Property Mathis_EnableMarker Auto Const mandatory
  ReferenceAlias Property Mathis_DisableMarker Auto Const mandatory
  ReferenceAlias Property Naeva Auto Const mandatory
  ReferenceAlias Property Naeva_EnableMarker Auto Const mandatory
  ReferenceAlias Property Naeva_DisableMarker Auto Const mandatory
  ReferenceAlias Property Adler Auto Const mandatory
  ReferenceAlias Property Adler_EnableMarker Auto Const mandatory
  ReferenceAlias Property Adler_DisableMarker Auto Const mandatory
  ReferenceAlias Property Huan Auto Const mandatory
  ReferenceAlias Property Huan_EnableMarker Auto Const mandatory
  ReferenceAlias Property Huan_DisableMarker Auto Const mandatory
  ReferenceAlias Property Estelle Auto Const mandatory
  ReferenceAlias Property Estelle_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_DisableMarker Auto Const mandatory
  ReferenceAlias Property Delgado Auto Const mandatory
  ReferenceAlias Property Jasmine Auto Const mandatory
  ReferenceAlias Property Voss Auto Const mandatory
  ReferenceAlias Property Reactor01ShutdownControl Auto Const mandatory
  ReferenceAlias Property Reactor02ShutdownControl Auto Const mandatory
  ReferenceAlias Property Reactor03ShutdownControl Auto Const mandatory
  ReferenceAlias Property ReactorSoundMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property Reactor01Activators Auto Const mandatory
  RefCollectionAlias Property Reactor02Activators Auto Const mandatory
  RefCollectionAlias Property Reactor03Activators Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup1 Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup2 Auto Const mandatory
  RefCollectionAlias Property GenericEnemiesGroup3 Auto Const mandatory
  RefCollectionAlias Property LoadElevators Auto Const mandatory
  ReferenceAlias Property Ops_EntryDoor Auto Const mandatory
  Keyword Property LC082_Brig_CurrentPrisonerKeyword Auto Const mandatory
  Keyword Property LC088_Key_LinkStartMarkerKeyword Auto Const mandatory
  Keyword Property LC088_Key_LinkRestraintKeyword Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
  Keyword Property LinkCombatTravel Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Keyword Property LocTypeSettlement Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  Cell Property StationTheKeyShipInterior Auto Const mandatory
  Cell Property StationTheKeyInterior Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  Explosion Property ChestBombExplosion Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_Key Auto Const mandatory
  Location Property TheKeyInteriorLocation Auto Const mandatory
  Faction Property PlayerFaction Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionAdlerKemp Auto Const mandatory
  Message Property LC088_Key_EmergencyShutdownNotRespondingMessage Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_01_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_01_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_02_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_02_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_03_Overload Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_03_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Reactor_OverloadAlarm Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Tick_Normal Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Tick_Urgent Auto Const mandatory
  wwiseevent Property QST_CF08_Voss_Bomb_Detonate Auto Const mandatory
EndGroup

Int Property CONST_ReactorState_Active = 0 Auto Const hidden
Int Property CONST_ReactorState_Inactive = 1 Auto Const hidden
Int Property CONST_ReactorState_Destroyed = 2 Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:159
  vossRef = Voss.GetActorRef() ; #DEBUG_LINE_NO:160
  keyInputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:161
  Reactor01ShutdownControlRef = Reactor01ShutdownControl.GetRef() ; #DEBUG_LINE_NO:162
  Reactor02ShutdownControlRef = Reactor02ShutdownControl.GetRef() ; #DEBUG_LINE_NO:163
  Reactor03ShutdownControlRef = Reactor03ShutdownControl.GetRef() ; #DEBUG_LINE_NO:164
  ObjectReference ReactorSoundMarkerChainHeadRef = ReactorSoundMarkerChainHead.GetRef() ; #DEBUG_LINE_NO:165
  ReactorSoundMarkerRefs = ReactorSoundMarkerChainHeadRef.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:166
  ReactorSoundMarkerRefs.insert(ReactorSoundMarkerChainHeadRef, 0) ; #DEBUG_LINE_NO:167
  StationTheKeyShipInterior.SetFactionOwner(PlayerFaction) ; #DEBUG_LINE_NO:169
  StationTheKeyInterior.SetFactionOwner(PlayerFaction) ; #DEBUG_LINE_NO:170
  LC088KeyInteriorLocation.GetLocation().RemoveKeyword(LocTypeSettlement) ; #DEBUG_LINE_NO:172
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:175
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:176
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:177
  Self.RegisterForRemoteEvent(Reactor01ShutdownControlRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:178
  Self.RegisterForRemoteEvent(Reactor02ShutdownControlRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:179
  Self.RegisterForRemoteEvent(Reactor03ShutdownControlRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:180
EndEvent

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, Rokov) ; #DEBUG_LINE_NO:186
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, Mathis) ; #DEBUG_LINE_NO:187
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, Adler) ; #DEBUG_LINE_NO:188
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, Huan) ; #DEBUG_LINE_NO:189
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, Estelle) ; #DEBUG_LINE_NO:190
  Int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt() ; #DEBUG_LINE_NO:193
  If adlerState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:194
    Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp) ; #DEBUG_LINE_NO:195
  EndIf ; #DEBUG_LINE_NO:
  Naeva.TryToDisable() ; #DEBUG_LINE_NO:198
  Self.SetupCaptainEvent(CONST_CaptainState_Inactive, CONST_CaptainActiveStage_Naeva, Naeva) ; #DEBUG_LINE_NO:199
EndFunction

Function SetupCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainAlias)
  Actor captainRef = captainAlias.GetActorRef() ; #DEBUG_LINE_NO:203
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:204
    Self.SetupKeyActor(captainRef) ; #DEBUG_LINE_NO:205
    Self.SetStage(captainActiveStage) ; #DEBUG_LINE_NO:206
  Else ; #DEBUG_LINE_NO:
    captainAlias.Clear() ; #DEBUG_LINE_NO:208
    If !captainRef.IsDead() ; #DEBUG_LINE_NO:209
      captainRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:210
      captainRef.MoveToPackageLocation() ; #DEBUG_LINE_NO:211
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupOtherActors()
  Int I = 0 ; #DEBUG_LINE_NO:219
  While I < OtherKeyActors.Length ; #DEBUG_LINE_NO:220
    Self.SetupKeyActor(OtherKeyActors[I].GetActorRef()) ; #DEBUG_LINE_NO:221
    I += 1 ; #DEBUG_LINE_NO:222
  EndWhile ; #DEBUG_LINE_NO:
  Delgado.GetActorRef().AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:225
EndFunction

Function SetupAllEnemyGroups()
  Self.SetupEnemyGroup(GenericEnemiesGroup1) ; #DEBUG_LINE_NO:231
  Self.SetupEnemyGroup(GenericEnemiesGroup2) ; #DEBUG_LINE_NO:232
  Self.SetupEnemyGroup(GenericEnemiesGroup3) ; #DEBUG_LINE_NO:233
EndFunction

Function SetupEnemyGroup(RefCollectionAlias enemyGroup)
  Int I = 0 ; #DEBUG_LINE_NO:237
  Int count = enemyGroup.GetCount() ; #DEBUG_LINE_NO:238
  While I < count ; #DEBUG_LINE_NO:239
    Self.SetupKeyActor(enemyGroup.GetAt(I) as Actor) ; #DEBUG_LINE_NO:240
    I += 1 ; #DEBUG_LINE_NO:241
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetupKeyActor(Actor keyActor)
  If keyActor != None ; #DEBUG_LINE_NO:248
    keyActor.Reset(None) ; #DEBUG_LINE_NO:249
    keyActor.SetProtected(False) ; #DEBUG_LINE_NO:250
    keyActor.SetEssential(False) ; #DEBUG_LINE_NO:251
    keyActor.SetGhost(False) ; #DEBUG_LINE_NO:252
    keyActor.SetValue(Game.GetInvulnerableAV(), 0.0) ; #DEBUG_LINE_NO:253
    keyActor.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:254
    keyActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:255
    keyActor.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:256
    If keyActor.GetValue(Aggression) < CONST_Aggression_Aggressive as Float ; #DEBUG_LINE_NO:257
      keyActor.SetValue(Aggression, CONST_Aggression_Aggressive as Float) ; #DEBUG_LINE_NO:258
    EndIf ; #DEBUG_LINE_NO:
    keyActor.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:260
    ObjectReference startMarker = keyActor.GetLinkedRef(LC088_Key_LinkStartMarkerKeyword) ; #DEBUG_LINE_NO:262
    If startMarker == None ; #DEBUG_LINE_NO:263
      keyActor.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:264
    Else ; #DEBUG_LINE_NO:
      keyActor.MoveTo(startMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:266
    EndIf ; #DEBUG_LINE_NO:
    keyActor.DisableNoWait(False) ; #DEBUG_LINE_NO:268
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupReactors(RefCollectionAlias reactorCollection, Int reactorID)
  lc088_keyreactorscript[] reactors = reactorCollection.GetArray() as lc088_keyreactorscript[] ; #DEBUG_LINE_NO:275
  Int I = 0 ; #DEBUG_LINE_NO:276
  While I < reactors.Length ; #DEBUG_LINE_NO:277
    If reactors[I] != None ; #DEBUG_LINE_NO:278
      reactors[I].RegisterForReactorEvent(reactorID) ; #DEBUG_LINE_NO:279
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:281
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnableEnemyGroup(Int enemyGroup)
  If enemyGroup == 1 ; #DEBUG_LINE_NO:293
    GenericEnemiesGroup1.EnableAll(False) ; #DEBUG_LINE_NO:294
    Self.TryToEnableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker) ; #DEBUG_LINE_NO:295
    Jasmine.TryToEnableNoWait() ; #DEBUG_LINE_NO:296
    If !vossBombExploded ; #DEBUG_LINE_NO:297
      Voss.TryToEnableNoWait() ; #DEBUG_LINE_NO:298
    EndIf ; #DEBUG_LINE_NO:
  ElseIf enemyGroup == 2 ; #DEBUG_LINE_NO:300
    GenericEnemiesGroup2.EnableAll(False) ; #DEBUG_LINE_NO:301
    Self.TryToEnableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker) ; #DEBUG_LINE_NO:302
    Self.TryToEnableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker) ; #DEBUG_LINE_NO:303
  ElseIf enemyGroup == 3 ; #DEBUG_LINE_NO:304
    GenericEnemiesGroup3.EnableAll(False) ; #DEBUG_LINE_NO:305
    Self.TryToEnableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker) ; #DEBUG_LINE_NO:306
    Self.TryToEnableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker) ; #DEBUG_LINE_NO:307
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableEnemyGroup(Int enemyGroup)
  If enemyGroup == 1 ; #DEBUG_LINE_NO:313
    GenericEnemiesGroup1.DisableAll(False) ; #DEBUG_LINE_NO:314
    Self.TryToDisableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker) ; #DEBUG_LINE_NO:315
    Jasmine.TryToDisableNoWait() ; #DEBUG_LINE_NO:316
    Voss.TryToDisableNoWait() ; #DEBUG_LINE_NO:317
  ElseIf enemyGroup == 2 ; #DEBUG_LINE_NO:318
    GenericEnemiesGroup2.DisableAll(False) ; #DEBUG_LINE_NO:319
    Self.TryToDisableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker) ; #DEBUG_LINE_NO:320
    Self.TryToDisableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker) ; #DEBUG_LINE_NO:321
  ElseIf enemyGroup == 3 ; #DEBUG_LINE_NO:322
    GenericEnemiesGroup3.DisableAll(False) ; #DEBUG_LINE_NO:323
    Self.TryToDisableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker) ; #DEBUG_LINE_NO:324
    Self.TryToDisableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker) ; #DEBUG_LINE_NO:325
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToEnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
  Actor captainRef = captainAlias.GetActorRef() ; #DEBUG_LINE_NO:331
  If captainRef != None ; #DEBUG_LINE_NO:332
    captainRef.EnableNoWait(False) ; #DEBUG_LINE_NO:333
    captainEnableMarkerAlias.TryToEnableNoWait() ; #DEBUG_LINE_NO:334
    captainDisableMarkerAlias.TryToDisableNoWait() ; #DEBUG_LINE_NO:335
  Else ; #DEBUG_LINE_NO:
    captainEnableMarkerAlias.TryToDisableNoWait() ; #DEBUG_LINE_NO:337
    captainDisableMarkerAlias.TryToEnableNoWait() ; #DEBUG_LINE_NO:338
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToDisableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
  captainAlias.TryToDisableNoWait() ; #DEBUG_LINE_NO:344
  captainEnableMarkerAlias.TryToDisableNoWait() ; #DEBUG_LINE_NO:345
  captainDisableMarkerAlias.TryToDisableNoWait() ; #DEBUG_LINE_NO:346
EndFunction

Function SetElevatorsLockedDown(Bool shouldBeLockedDown)
  Int I = 0 ; #DEBUG_LINE_NO:356
  Int count = LoadElevators.GetCount() ; #DEBUG_LINE_NO:357
  While I < count ; #DEBUG_LINE_NO:358
    (LoadElevators.GetAt(I) as loadelevatorfloorscript).SetAccessible(!shouldBeLockedDown) ; #DEBUG_LINE_NO:359
    I += 1 ; #DEBUG_LINE_NO:360
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function OpenDoorCollection(RefCollectionAlias doorCollection)
  Int I = 0 ; #DEBUG_LINE_NO:366
  Int count = doorCollection.GetCount() ; #DEBUG_LINE_NO:367
  While I < count ; #DEBUG_LINE_NO:368
    doorCollection.GetAt(I).SetOpen(True) ; #DEBUG_LINE_NO:369
    I += 1 ; #DEBUG_LINE_NO:370
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetupOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef() ; #DEBUG_LINE_NO:375
  opsEntryDoorRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:376
EndFunction

Function SealOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef() ; #DEBUG_LINE_NO:380
  opsEntryDoorRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:381
  opsEntryDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:382
  opsEntryDoorRef.SetLockLevel(CONST_LockLevelTerminalOnly) ; #DEBUG_LINE_NO:383
EndFunction

Function OpenOpsEntryDoor()
  ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef() ; #DEBUG_LINE_NO:387
  opsEntryDoorRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:388
  opsEntryDoorRef.Unlock(False) ; #DEBUG_LINE_NO:389
  opsEntryDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:390
EndFunction

Function LockPlayerControls(Bool shouldLock)
  If shouldLock ; #DEBUG_LINE_NO:394
    keyInputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:395
  Else ; #DEBUG_LINE_NO:
    keyInputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:397
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
  If (akSource == vossRef as ObjectReference) && vossBombTickNormalID == 0 && Self.GetStageDone(CONST_DoorToVossOpenedStage) && !Self.GetStageDone(CONST_VossBombExplodedStage) && !Self.GetStageDone(CONST_VossBombDisarmedStage) ; #DEBUG_LINE_NO:402
    vossBombTickNormalID = QST_CF08_Voss_Bomb_Tick_Normal.Play(vossRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:403
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
  If akSource == vossRef && !Self.GetStageDone(CONST_VossBombDisarmedStage) ; #DEBUG_LINE_NO:408
    Self.VossBombDetonate() ; #DEBUG_LINE_NO:409
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function VossBombDetonate()
  vossBombExploded = True ; #DEBUG_LINE_NO:414
  QST_CF08_Voss_Bomb_Detonate.Play(vossRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:415
  vossRef.PlaceAtMe(ChestBombExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:416
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:417
  vossRef.DisableNoWait(False) ; #DEBUG_LINE_NO:418
  Utility.Wait(CONST_VossBombExplodedDelay as Float) ; #DEBUG_LINE_NO:419
  Self.SetStage(CONST_VossBombExplodedStage) ; #DEBUG_LINE_NO:420
EndFunction

Function VossBombArmed()
  If !vossBombExploded ; #DEBUG_LINE_NO:424
    vossBombTickUrgentID = QST_CF08_Voss_Bomb_Tick_Urgent.Play(vossRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:425
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function VossBombTickStop()
  wwiseevent.StopInstance(vossBombTickNormalID) ; #DEBUG_LINE_NO:430
  wwiseevent.StopInstance(vossBombTickUrgentID) ; #DEBUG_LINE_NO:431
EndFunction

Function VossWaitForSit()
  Self.RegisterForRemoteEvent(vossRef as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:435
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  Self.SetStage(CONST_VossOpensDoorsStage) ; #DEBUG_LINE_NO:439
EndEvent

Function SetupReactorBattleNoWait()
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:452
  akArgs[0] = 1 as Var ; #DEBUG_LINE_NO:453
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:454
  akArgs[0] = 2 as Var ; #DEBUG_LINE_NO:455
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:456
  akArgs[0] = 3 as Var ; #DEBUG_LINE_NO:457
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:458
  Self.SetupReactors(Reactor01Activators, 1) ; #DEBUG_LINE_NO:460
  Self.SetupReactors(Reactor02Activators, 2) ; #DEBUG_LINE_NO:461
  Self.SetupReactors(Reactor03Activators, 3) ; #DEBUG_LINE_NO:462
EndFunction

Function AbortReactorBattleNoWait()
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:468
  akArgs[0] = 3 as Var ; #DEBUG_LINE_NO:469
  Self.CallFunctionNoWait("DisableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:470
EndFunction

Function StartReactorBattle()
  StationTheKeyInterior.EnableFastTravel(False) ; #DEBUG_LINE_NO:476
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:478
  MUSGenesisCombatBoss_Key.Add() ; #DEBUG_LINE_NO:479
  reactorOverloadID = QST_CF08_Reactor_OverloadAlarm.Play(ReactorSoundMarkerRefs[2], None, None) ; #DEBUG_LINE_NO:481
  Self.SetReactorState(1, CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:483
  Self.SetReactorState(2, CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:484
  Self.SetReactorState(3, CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:485
  Actor delgadoRef = Delgado.GetActorRef() ; #DEBUG_LINE_NO:487
  delgadoRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:488
  delgadoRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:489
EndFunction

Function EndReactorBattleNoWait()
  StationTheKeyInterior.EnableFastTravel(True) ; #DEBUG_LINE_NO:495
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:497
  MUSGenesisCombatBoss_Key.Remove() ; #DEBUG_LINE_NO:498
  wwiseevent.StopInstance(reactorOverloadID) ; #DEBUG_LINE_NO:500
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:502
  akArgs[0] = 1 as Var ; #DEBUG_LINE_NO:503
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:504
  akArgs[0] = 2 as Var ; #DEBUG_LINE_NO:505
  Self.CallFunctionNoWait("EnableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:506
EndFunction

Function EndReactorBattleAndWait()
  StationTheKeyInterior.EnableFastTravel(True) ; #DEBUG_LINE_NO:511
  MUSGenesisCombatBoss_Key.Remove() ; #DEBUG_LINE_NO:513
  wwiseevent.StopInstance(reactorOverloadID) ; #DEBUG_LINE_NO:515
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:517
  akArgs[0] = 1 as Var ; #DEBUG_LINE_NO:518
  Self.CallFunction("EnableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:519
  akArgs[0] = 2 as Var ; #DEBUG_LINE_NO:520
  Self.CallFunction("EnableEnemyGroup", akArgs) ; #DEBUG_LINE_NO:521
EndFunction

Function SetReactorState(Int reactorID, Int reactorState)
  Var[] akArgs = new Var[2] ; #DEBUG_LINE_NO:572
  akArgs[0] = reactorID as Var ; #DEBUG_LINE_NO:573
  akArgs[1] = reactorState as Var ; #DEBUG_LINE_NO:574
  Self.SendCustomEvent("lc088_keyquestscript_LC088ReactorStateChangeEvent", akArgs) ; #DEBUG_LINE_NO:575
  ObjectReference reactorSoundMarker = ReactorSoundMarkerRefs[reactorID] ; #DEBUG_LINE_NO:577
  Int reactorSoundIndex = (reactorID - 1) * 3 + reactorState ; #DEBUG_LINE_NO:578
  wwiseevent reactorSound = ReactorSoundEvents[reactorSoundIndex] ; #DEBUG_LINE_NO:579
  reactorSound.Play(reactorSoundMarker, None, None) ; #DEBUG_LINE_NO:580
  If reactorID == 3 && reactorState == CONST_ReactorState_Active ; #DEBUG_LINE_NO:581
    wwiseevent.StopInstance(reactorOverloadID) ; #DEBUG_LINE_NO:583
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
  If akNewLoc == TheKeyInteriorLocation && !Self.GetStageDone(CONST_CompleteStage) ; #DEBUG_LINE_NO:590
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Add() ; #DEBUG_LINE_NO:591
  ElseIf akOldLoc == TheKeyInteriorLocation ; #DEBUG_LINE_NO:592
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:593
    MUSGenesisCombatBoss_Key.Remove() ; #DEBUG_LINE_NO:594
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:599
  MUSGenesisCombatBoss_Key.Remove() ; #DEBUG_LINE_NO:600
EndEvent

Function Cleanup()
  player = None ; #DEBUG_LINE_NO:610
  vossRef = None ; #DEBUG_LINE_NO:611
  Reactor01ShutdownControlRef = None ; #DEBUG_LINE_NO:612
  Reactor02ShutdownControlRef = None ; #DEBUG_LINE_NO:613
  Reactor03ShutdownControlRef = None ; #DEBUG_LINE_NO:614
  ReactorSoundMarkerRefs = None ; #DEBUG_LINE_NO:615
  If keyInputLayer != None ; #DEBUG_LINE_NO:616
    keyInputLayer.Delete() ; #DEBUG_LINE_NO:617
  EndIf ; #DEBUG_LINE_NO:
  Self.CleanupCaptain(CrimsonFleetCaptainState_Rokov, Rokov) ; #DEBUG_LINE_NO:621
  Self.CleanupCaptain(CrimsonFleetCaptainState_Mathis, Mathis) ; #DEBUG_LINE_NO:622
  Self.CleanupCaptain(CrimsonFleetCaptainState_Adler, Adler) ; #DEBUG_LINE_NO:623
  Self.CleanupCaptain(CrimsonFleetCaptainState_Huan, Huan) ; #DEBUG_LINE_NO:624
  Self.CleanupCaptain(CrimsonFleetCaptainState_Estelle, Estelle) ; #DEBUG_LINE_NO:625
  Rokov_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:626
  Rokov_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:627
  Mathis_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:628
  Mathis_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:629
  Naeva_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:630
  Naeva_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:631
  Adler_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:632
  Adler_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:633
  Huan_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:634
  Huan_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:635
  Estelle_EnableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:636
  Estelle_DisableMarker.TryToDisableNoWait() ; #DEBUG_LINE_NO:637
  Actor delgadoRef = Delgado.GetActorRef() ; #DEBUG_LINE_NO:640
  If !delgadoRef.IsDead() ; #DEBUG_LINE_NO:641
    (LC082 as lc082_brigquestscript).AddPrisoner(delgadoRef, -1) ; #DEBUG_LINE_NO:642
  EndIf ; #DEBUG_LINE_NO:
  Voss.TryToDisableNoWait() ; #DEBUG_LINE_NO:646
  Jasmine.TryToDisableNoWait() ; #DEBUG_LINE_NO:647
  GenericEnemiesGroup1.DisableAll(False) ; #DEBUG_LINE_NO:650
  GenericEnemiesGroup2.DisableAll(False) ; #DEBUG_LINE_NO:651
  GenericEnemiesGroup3.DisableAll(False) ; #DEBUG_LINE_NO:652
EndFunction

Function CleanupCaptain(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias)
  Actor captainRef = captainAlias.GetActorRef() ; #DEBUG_LINE_NO:657
  Int captainState = captainStateGlobal.GetValueInt() ; #DEBUG_LINE_NO:658
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:659
    captainStateGlobal.SetValue(CONST_CaptainState_Dead as Float) ; #DEBUG_LINE_NO:660
    captainRef.DisableNoWait(False) ; #DEBUG_LINE_NO:661
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Busy

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:527
    Int currentStage = Self.GetStage() ; #DEBUG_LINE_NO:528
    If akSource == Reactor01ShutdownControlRef ; #DEBUG_LINE_NO:529
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride01Stage ; #DEBUG_LINE_NO:530
        Reactor01ShutdownControlRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:531
        (Reactor01ShutdownControlRef as genericswitchscript).SetColor("Blue") ; #DEBUG_LINE_NO:532
        Self.SetStage(CONST_ReactorOverride01Stage) ; #DEBUG_LINE_NO:533
      Else ; #DEBUG_LINE_NO:
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:535
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akSource == Reactor02ShutdownControlRef ; #DEBUG_LINE_NO:537
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride02Stage ; #DEBUG_LINE_NO:538
        Reactor02ShutdownControlRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:539
        (Reactor02ShutdownControlRef as genericswitchscript).SetColor("Blue") ; #DEBUG_LINE_NO:540
        Self.SetStage(CONST_ReactorOverride02Stage) ; #DEBUG_LINE_NO:541
      Else ; #DEBUG_LINE_NO:
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:543
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akSource == Reactor03ShutdownControlRef ; #DEBUG_LINE_NO:545
      If currentStage >= CONST_ReactorBattleStartStage && currentStage < CONST_ReactorOverride03Stage ; #DEBUG_LINE_NO:546
        Reactor03ShutdownControlRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:547
        (Reactor03ShutdownControlRef as genericswitchscript).SetColor("Blue") ; #DEBUG_LINE_NO:548
        Self.SetStage(CONST_ReactorOverride03Stage) ; #DEBUG_LINE_NO:549
        Delgado.GetActorRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:551
      Else ; #DEBUG_LINE_NO:
        LC088_Key_EmergencyShutdownNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:553
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:556
  EndEvent
EndState
