ScriptName LC107QuestScript Extends Quest
{ Quest script for LC107, The Legacy. }

;-- Structs -----------------------------------------
Struct AmbientExplosionDatum
  Int ExplosionSizeMin
  { Min index into HullBreachExplosions. }
  Int ExplosionSizeMax
  { Max index into HullBreachExplosions. }
  Float ExplosionDelayMin
  { Min delay between explosions. }
  Float ExplosionDelayMax
  { Max delay between explosions. }
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_AmbientExplosionOffsetMaxX = 8 Const
Int CONST_AmbientExplosionOffsetMaxY = 16 Const
Int CONST_AmbientExplosionOffsetMaxZ = 8 Const
Int CONST_AmbientExplosionOffsetMinX = 0 Const
Int CONST_AmbientExplosionOffsetMinY = 8 Const
Int CONST_AmbientExplosionOffsetMinZ = 2 Const
Int CONST_AmbientExplosionTimerID = 2 Const
Int CONST_BreachSequenceExplosionTimerID = 1 Const
Float CONST_BreachSequenceRumbleDelayMax = 2.0 Const
Float CONST_BreachSequenceRumbleDelayMin = 1.0 Const
Float CONST_BreachSequenceRumblePowerMax = 1.0 Const
Float CONST_BreachSequenceRumblePowerMin = 0.5 Const
Float CONST_BreachSequenceRumbleTimeMax = 1.5 Const
Float CONST_BreachSequenceRumbleTimeMin = 0.75 Const
Float CONST_CredTankDrainPercentMax = 0.939999998 Const
Float CONST_DataCorePopupDelay = 2.0 Const
Int CONST_EvacuationSceneRepeatDelay = 90 Const
Int CONST_LegacyEscapeCompleteStage = 1000 Const
Int CONST_LegacyShipAccessibleStage = 20 Const
Int CONST_LegacyShipArrivalStage = 100 Const
Int CONST_LegacyShipDiscoveryDistance = 1500 Const
Int CONST_LegacyShipDiscoveryStage = 170 Const
Int CONST_LegacyShipDockedStage = 190 Const
Int CONST_LegacyShipMapMarkerRevealStage = 172 Const
Int CONST_LegacyShipMidwayDistance = 3250 Const
Int CONST_LegacyShipMidwayStage = 150 Const
Int CONST_OpenVaultEntranceDoorStage = 240 Const
Int CONST_VaultDataCoreInsertedStage = 343 Const
Int CONST_VaultDataCoreReadyForRemovalStage = 373 Const
Int CONST_VaultDataCoreRemovedStage = 374 Const
Int CONST_VaultDataTransferCompleteStage = 360 Const
Int CONST_VaultDownloadControlActivatedStage = 345 Const
Int CONST_VaultPowerReroutedStage = 333 Const
Int CONST_VaultPowerSwitch01ReroutedStage = 331 Const
Int CONST_VaultPowerSwitch02ReroutedStage = 332 Const
Int CONST_VaultTransferModule01InsertedStage = 340 Const
Int CONST_VaultTransferModule01RemovedStage = 370 Const
Int CONST_VaultTransferModule02InsertedStage = 341 Const
Int CONST_VaultTransferModule02RemovedStage = 371 Const
Int CONST_VaultTransferModulesInsertedStage = 342 Const
inputenablelayer LC107EnableLayer
Int ambientExplosionLevel
Bool breachSequenceExplosionsActive
Float credTankDrainPercent
ObjectReference crimsonFleetAliasContainerRef
Bool debugBlockAmbientExplosions
Float evacuationSceneLastPlayedTime
Bool initializedPackins
ObjectReference vaultControlsDataCoreSlotRef
ObjectReference vaultControlsDownloadControlRef
ObjectReference vaultControlsStatusIndicatorRef
ObjectReference vaultControlsTransferModuleSlot01Ref
ObjectReference vaultControlsTransferModuleSlot02Ref
lc107credtanksystemrefscript vaultCredTankManagerRef
ObjectReference vaultEntranceControlRef
genericswitchscript vaultPowerSwitch01LightRef
ObjectReference vaultPowerSwitch01Ref
genericswitchscript vaultPowerSwitch02LightRef
ObjectReference vaultPowerSwitch02Ref
Bool waitingForCredTanksShutdown
Bool waitingForPlayerToSit
Bool waitingForVaultInstantBreaches

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AmbientExplosionDataGuard
Guard TransferModuleSlot01ActivationGuard
Guard TransferModuleSlot02ActivationGuard

;-- Properties --------------------------------------
Group QuestData
  lc107questscript:ambientexplosiondatum[] Property AmbientExplosionData Auto mandatory
  { Array of ambient explosion data to use during the escape sequence. }
  sq_parentscript:actorvaluedatum[] Property ErebosActorValuesToDamage Auto Const mandatory
  { Array of actor values to damage on the Erebos. }
  Explosion[] Property HullBreachExplosions Auto Const mandatory
  { Explosions to use during the escape sequence. }
  spaceshipbase Property DEBUG_PlayerShip Auto Const mandatory
  { For quickstarts, the ship to place the player in. }
EndGroup

Group AutofillProperties
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property LC107LegacyShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property LegacyShip Auto Const mandatory
  ReferenceAlias Property ErebosShip Auto Const mandatory
  RefCollectionAlias Property SpaceCellShips Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  ReferenceAlias Property CrimsonFleetAliasContainer Auto Const mandatory
  ReferenceAlias Property CaptainTransferModule Auto Const mandatory
  ReferenceAlias Property JasperKryxTransferModule Auto Const mandatory
  ReferenceAlias Property DataCoreEmpty Auto Const mandatory
  ReferenceAlias Property DataCoreFull Auto Const mandatory
  ReferenceAlias Property VaultEntranceControl Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch01 Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch02 Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch01Light Auto Const mandatory
  ReferenceAlias Property VaultPowerSwitch02Light Auto Const mandatory
  ReferenceAlias Property VaultControlsStatusIndicator Auto Const mandatory
  ReferenceAlias Property VaultControlsTransferModuleSlot01 Auto Const mandatory
  ReferenceAlias Property VaultControlsTransferModuleSlot02 Auto Const mandatory
  ReferenceAlias Property VaultControlsDataCoreSlot Auto Const mandatory
  ReferenceAlias Property VaultControlsDownloadControl Auto Const mandatory
  ReferenceAlias Property VaultCredTankManager Auto Const mandatory
  RefCollectionAlias Property StandardCredTanks Auto Const mandatory
  RefCollectionAlias Property HullBreachesAll Auto Const mandatory
  RefCollectionAlias Property HullBreachesInstantBreak Auto Const mandatory
  RefCollectionAlias Property HullBreachesInstantBreakVault Auto Const mandatory
  RefCollectionAlias Property HullBreachTriggers Auto Const mandatory
  RefCollectionAlias Property DestructibleTraps Auto Const mandatory
  Message Property LC107_GalbankControlConsoleNeedsPowerMessage Auto Const mandatory
  Message Property LC107_GalbankTransferModuleLockedMessage Auto Const mandatory
  Message Property LC107_GalbankTransferModuleNeededMessage Auto Const mandatory
  Message Property LC107_GalbankDataCorePortNeedsTransferModulesMessage Auto Const mandatory
  Message Property LC107_GalbankDownloadControlNeedsDataCoreMessage Auto Const mandatory
  Message Property LC107_DataCoreLockedMessage Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesCurrentGlobal Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesTotalGlobal Auto Const mandatory
  GlobalVariable Property LC107VaultInstantBreachesCurrentGlobal Auto Const mandatory
  Scene Property CF07_zLegacy001_Callout_NoTransferModule Auto Const mandatory
  Scene Property CF07_zLegacy003_Callout_ConsoleLowPower Auto Const mandatory
  Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const mandatory
  ImageSpaceModifier Property HoldAtBlackImod Auto Const mandatory
  Key Property CF_GalbankTransferModule Auto Const mandatory
  Cell Property LC107Legacy01 Auto Const mandatory
  Keyword Property ENV_Loc_NotSealedEnvironment Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property CF05_ComSpike_AV Auto Const mandatory
  ActorValue Property CF06_ConductionGrid_AV Auto Const mandatory
  Perk Property Skill_Piloting Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  wwiseevent Property QST_CF07_Power_Half Auto Const mandatory
  wwiseevent Property QST_CF07_Power_Full Auto Const mandatory
  wwiseevent Property QST_CF07_ServerRoom_Activate Auto Const mandatory
  wwiseevent Property QST_CF07_ServerRoom_Deactivate Auto Const mandatory
  wwiseevent Property QST_CF07_Data_Transfer_LP_Start Auto Const mandatory
  wwiseevent Property QST_CF07_Data_Transfer_LP_Stop Auto Const mandatory
  wwiseevent Property WwiseEvent_QST_CF07_TakeModule Auto Const mandatory
EndGroup

Int Property CONST_ReactorState_Active = 0 Auto Const hidden
Int Property CONST_ReactorState_Inactive = 1 Auto Const hidden
Int Property CONST_ReactorState_Destroyed = 2 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Reset = 0 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_HalfPower = 1 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Powered = 2 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert = 3 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_DownloadFinished = 4 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval = 5 Auto Const hidden
Int Property CONST_VaultControlsPowerStatus_Shutdown = 6 Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  spaceshipreference erebosShipRef = ErebosShip.GetShipRef() ; #DEBUG_LINE_NO:229
  Self.RegisterForRemoteEvent(erebosShipRef as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:230
  SpaceCellShips.AddRef(LegacyShip.GetRef()) ; #DEBUG_LINE_NO:233
  SpaceCellShips.AddRef(ErebosShip.GetRef()) ; #DEBUG_LINE_NO:234
  vaultCredTankManagerRef = VaultCredTankManager.GetRef() as lc107credtanksystemrefscript ; #DEBUG_LINE_NO:237
  vaultEntranceControlRef = VaultEntranceControl.GetRef() ; #DEBUG_LINE_NO:240
  vaultPowerSwitch01Ref = VaultPowerSwitch01.GetRef() ; #DEBUG_LINE_NO:241
  vaultPowerSwitch02Ref = VaultPowerSwitch02.GetRef() ; #DEBUG_LINE_NO:242
  vaultPowerSwitch01LightRef = VaultPowerSwitch01Light.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:243
  vaultPowerSwitch02LightRef = VaultPowerSwitch02Light.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:244
  vaultControlsTransferModuleSlot01Ref = VaultControlsTransferModuleSlot01.GetRef() ; #DEBUG_LINE_NO:245
  vaultControlsTransferModuleSlot02Ref = VaultControlsTransferModuleSlot02.GetRef() ; #DEBUG_LINE_NO:246
  vaultControlsDataCoreSlotRef = VaultControlsDataCoreSlot.GetRef() ; #DEBUG_LINE_NO:247
  vaultControlsDownloadControlRef = VaultControlsDownloadControl.GetRef() ; #DEBUG_LINE_NO:248
  vaultControlsStatusIndicatorRef = VaultControlsStatusIndicator.GetRef() ; #DEBUG_LINE_NO:249
  crimsonFleetAliasContainerRef = CrimsonFleetAliasContainer.GetRef() ; #DEBUG_LINE_NO:250
  vaultEntranceControlRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:252
  vaultPowerSwitch01Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:253
  vaultPowerSwitch02Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:254
  vaultControlsTransferModuleSlot01Ref.BlockActivation(True, False) ; #DEBUG_LINE_NO:255
  vaultControlsTransferModuleSlot02Ref.BlockActivation(True, False) ; #DEBUG_LINE_NO:256
  vaultControlsDataCoreSlotRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:257
  vaultControlsDownloadControlRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:258
  Self.RegisterForRemoteEvent(PlayerShip.GetShipRef() as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:260
  Self.RegisterForRemoteEvent(LegacyShip.GetShipRef() as ScriptObject, "OnCellLoad") ; #DEBUG_LINE_NO:261
  Self.RegisterForRemoteEvent(vaultEntranceControlRef as ScriptObject, "OnCellLoad") ; #DEBUG_LINE_NO:262
  Self.RegisterForRemoteEvent(vaultEntranceControlRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:263
  Self.RegisterForRemoteEvent(vaultPowerSwitch01Ref as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:264
  Self.RegisterForRemoteEvent(vaultPowerSwitch02Ref as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:265
  Self.RegisterForRemoteEvent(vaultControlsTransferModuleSlot01Ref as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:266
  Self.RegisterForRemoteEvent(vaultControlsTransferModuleSlot02Ref as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:267
  Self.RegisterForRemoteEvent(vaultControlsDataCoreSlotRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:268
  Self.RegisterForRemoteEvent(vaultControlsDownloadControlRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:269
EndEvent

Function DEBUG_GoToSpaceAndWait(Bool shouldAddCF07Modules)
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:275
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:276
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:277
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:278
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:279
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:280
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:281
  spaceshipreference playerShipRef = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShip as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:282
  SQ_PlayerShip.ResetPlayerShip(playerShipRef) ; #DEBUG_LINE_NO:283
  SQ_PlayerShip.ResetHomeShip(playerShipRef) ; #DEBUG_LINE_NO:284
  playerShipRef.AddItem(ShipRepairKit as Form, 20, False) ; #DEBUG_LINE_NO:285
  playerRef.MoveTo(playerShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:286
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:287
  PlayerShipPilotSeat.GetRef().Activate(playerRef as ObjectReference, False) ; #DEBUG_LINE_NO:288
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:289
  waitingForPlayerToSit = True ; #DEBUG_LINE_NO:290
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:291
  While waitingForPlayerToSit ; #DEBUG_LINE_NO:
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:293
  EndWhile ; #DEBUG_LINE_NO:
  If shouldAddCF07Modules ; #DEBUG_LINE_NO:295
    Self.DEBUG_ChangeCF07ModuleData(True, True) ; #DEBUG_LINE_NO:296
  EndIf ; #DEBUG_LINE_NO:
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, playerShipRef) ; #DEBUG_LINE_NO:298
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False ; #DEBUG_LINE_NO:305
EndEvent

Function DEBUG_ChangeCF07ModuleData(Bool shouldHaveComspike, Bool shouldHaveCondictionGrid)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:310
  If shouldHaveComspike ; #DEBUG_LINE_NO:311
    playerShipRef.SetValue(CF05_ComSpike_AV, 1.0) ; #DEBUG_LINE_NO:312
  Else ; #DEBUG_LINE_NO:
    playerShipRef.SetValue(CF05_ComSpike_AV, 0.0) ; #DEBUG_LINE_NO:314
  EndIf ; #DEBUG_LINE_NO:
  If shouldHaveCondictionGrid ; #DEBUG_LINE_NO:316
    playerShipRef.SetValue(CF06_ConductionGrid_AV, 1.0) ; #DEBUG_LINE_NO:317
  Else ; #DEBUG_LINE_NO:
    playerShipRef.SetValue(CF06_ConductionGrid_AV, 0.0) ; #DEBUG_LINE_NO:319
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnCellLoad(ObjectReference akSource)
  If (akSource == LegacyShip.GetShipRef() as ObjectReference) && Self.GetStageDone(CONST_LegacyShipAccessibleStage) && !Self.GetStageDone(CONST_LegacyShipDockedStage) ; #DEBUG_LINE_NO:329
    Self.UpdateArrivalProcess() ; #DEBUG_LINE_NO:330
  ElseIf akSource == vaultEntranceControlRef && !initializedPackins ; #DEBUG_LINE_NO:331
    Self.CallFunctionNoWait("CredTanksInit", None) ; #DEBUG_LINE_NO:333
    Self.CallFunctionNoWait("HullBreachesInit", None) ; #DEBUG_LINE_NO:335
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateArrivalProcess()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:340
  spaceshipreference legacyShipRef = LegacyShip.GetShipRef() ; #DEBUG_LINE_NO:341
  Bool hasConductionGrid = playerShipRef.GetValue(CF06_ConductionGrid_AV) > 0.0 ; #DEBUG_LINE_NO:342
  Float distanceFromLegacy = playerShipRef.GetDistance(legacyShipRef as ObjectReference) ; #DEBUG_LINE_NO:343
  If hasConductionGrid && Companion.GetRef() != None ; #DEBUG_LINE_NO:345
    If !Self.GetStageDone(CONST_LegacyShipArrivalStage) ; #DEBUG_LINE_NO:346
      Self.SetStage(CONST_LegacyShipArrivalStage) ; #DEBUG_LINE_NO:347
    ElseIf !Self.GetStageDone(CONST_LegacyShipMidwayStage) ; #DEBUG_LINE_NO:348
      If distanceFromLegacy > CONST_LegacyShipMidwayDistance as Float ; #DEBUG_LINE_NO:349
        Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipMidwayDistance as Float, 0) ; #DEBUG_LINE_NO:350
      Else ; #DEBUG_LINE_NO:
        Self.SetStage(CONST_LegacyShipMidwayStage) ; #DEBUG_LINE_NO:352
      EndIf ; #DEBUG_LINE_NO:
    ElseIf !Self.GetStageDone(CONST_LegacyShipDiscoveryStage) ; #DEBUG_LINE_NO:354
      If distanceFromLegacy > CONST_LegacyShipDiscoveryDistance as Float ; #DEBUG_LINE_NO:355
        Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipDiscoveryDistance as Float, 0) ; #DEBUG_LINE_NO:356
      Else ; #DEBUG_LINE_NO:
        Self.SetStage(CONST_LegacyShipDiscoveryStage) ; #DEBUG_LINE_NO:358
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf distanceFromLegacy > CONST_LegacyShipDiscoveryDistance as Float ; #DEBUG_LINE_NO:362
    Self.RegisterForDistanceLessThanEvent(playerShipRef as ScriptObject, legacyShipRef as ScriptObject, CONST_LegacyShipDiscoveryDistance as Float, 0) ; #DEBUG_LINE_NO:363
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(CONST_LegacyShipMapMarkerRevealStage) ; #DEBUG_LINE_NO:365
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.UpdateArrivalProcess() ; #DEBUG_LINE_NO:371
EndEvent

Event SpaceshipReference.OnShipDock(spaceshipreference akSource, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If akSource == PlayerShip.GetShipRef() && akParent == LegacyShip.GetShipRef() ; #DEBUG_LINE_NO:375
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:376
    Self.SetStage(190) ; #DEBUG_LINE_NO:377
  ElseIf akSource == ErebosShip.GetShipRef() && akParent == LegacyShip.GetShipRef() ; #DEBUG_LINE_NO:378
    SQ_Parent.SetupDamagedShip(ErebosShip.GetShipRef(), False, True, False, False, True, True, ErebosActorValuesToDamage) ; #DEBUG_LINE_NO:379
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetVaultControlsPowerStatus(Int status)
  If status == CONST_VaultControlsPowerStatus_HalfPower ; #DEBUG_LINE_NO:405
    QST_CF07_Power_Half.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:406
  ElseIf status == CONST_VaultControlsPowerStatus_Powered ; #DEBUG_LINE_NO:408
    QST_CF07_Power_Full.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:409
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Start") ; #DEBUG_LINE_NO:411
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start") ; #DEBUG_LINE_NO:412
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start") ; #DEBUG_LINE_NO:413
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:414
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop") ; #DEBUG_LINE_NO:415
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop") ; #DEBUG_LINE_NO:416
    vaultControlsTransferModuleSlot01Ref.PlayAnimation("TurnOnFull") ; #DEBUG_LINE_NO:417
    vaultControlsTransferModuleSlot02Ref.PlayAnimation("TurnOnFull") ; #DEBUG_LINE_NO:418
  ElseIf status == CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert ; #DEBUG_LINE_NO:419
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start") ; #DEBUG_LINE_NO:420
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:421
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop") ; #DEBUG_LINE_NO:422
  ElseIf status == CONST_VaultControlsPowerStatus_DownloadFinished ; #DEBUG_LINE_NO:423
    vaultControlsDownloadControlRef.PlayAnimation("Play02") ; #DEBUG_LINE_NO:424
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop") ; #DEBUG_LINE_NO:425
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop") ; #DEBUG_LINE_NO:426
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop") ; #DEBUG_LINE_NO:427
  ElseIf status == CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval ; #DEBUG_LINE_NO:428
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop") ; #DEBUG_LINE_NO:429
  ElseIf status == CONST_VaultControlsPowerStatus_Shutdown ; #DEBUG_LINE_NO:430
    vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Stop") ; #DEBUG_LINE_NO:431
    vaultPowerSwitch01LightRef.SetState("Off") ; #DEBUG_LINE_NO:432
    vaultPowerSwitch02LightRef.SetState("Off") ; #DEBUG_LINE_NO:433
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnblockVaultPowerSwitches()
  vaultPowerSwitch01Ref.BlockActivation(False, False) ; #DEBUG_LINE_NO:438
  vaultPowerSwitch02Ref.BlockActivation(False, False) ; #DEBUG_LINE_NO:439
EndFunction

Function ProcessOnActivate(ObjectReference akSource, ObjectReference akActionRef)
  If akSource == vaultEntranceControlRef ; #DEBUG_LINE_NO:443
    If !Self.GetStageDone(CONST_OpenVaultEntranceDoorStage) ; #DEBUG_LINE_NO:444
      If Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0 ; #DEBUG_LINE_NO:445
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:446
        CF07_zLegacy001_Callout_NoTransferModule.Start() ; #DEBUG_LINE_NO:447
      Else ; #DEBUG_LINE_NO:
        vaultEntranceControlRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:449
        vaultEntranceControlRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:450
        Self.SetStageNoWait(CONST_OpenVaultEntranceDoorStage) ; #DEBUG_LINE_NO:451
        vaultEntranceControlRef.PlayAnimation("Play02") ; #DEBUG_LINE_NO:452
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSource == vaultPowerSwitch01Ref ; #DEBUG_LINE_NO:455
    vaultPowerSwitch01Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:456
    vaultPowerSwitch01LightRef.SetColor("White") ; #DEBUG_LINE_NO:457
    Self.SetStage(CONST_VaultPowerSwitch01ReroutedStage) ; #DEBUG_LINE_NO:458
  ElseIf akSource == vaultPowerSwitch02Ref ; #DEBUG_LINE_NO:459
    vaultPowerSwitch02Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:460
    vaultPowerSwitch02LightRef.SetColor("White") ; #DEBUG_LINE_NO:461
    Self.SetStage(CONST_VaultPowerSwitch02ReroutedStage) ; #DEBUG_LINE_NO:462
  ElseIf akSource == vaultControlsTransferModuleSlot01Ref ; #DEBUG_LINE_NO:463
    Guard TransferModuleSlot01ActivationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:464
      If !Self.GetStageDone(CONST_VaultPowerReroutedStage) ; #DEBUG_LINE_NO:465
        LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:466
        CF07_zLegacy003_Callout_ConsoleLowPower.Start() ; #DEBUG_LINE_NO:467
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0 ; #DEBUG_LINE_NO:468
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:469
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0 ; #DEBUG_LINE_NO:470
        Game.GetPlayer().RemoveItem(CF_GalbankTransferModule as Form, 1, False, crimsonFleetAliasContainerRef) ; #DEBUG_LINE_NO:471
        Self.GoToState("Waiting") ; #DEBUG_LINE_NO:472
        vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:473
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start") ; #DEBUG_LINE_NO:474
        Self.SetStage(CONST_VaultTransferModule01InsertedStage) ; #DEBUG_LINE_NO:475
      ElseIf !Self.GetStageDone(CONST_VaultDataTransferCompleteStage) ; #DEBUG_LINE_NO:476
        LC107_GalbankTransferModuleLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:477
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule01RemovedStage) ; #DEBUG_LINE_NO:478
        vaultControlsTransferModuleSlot01Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:479
        Self.GoToState("Waiting") ; #DEBUG_LINE_NO:480
        vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play02", "Done") ; #DEBUG_LINE_NO:481
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Stop") ; #DEBUG_LINE_NO:482
        Game.GetPlayer().AddItem(CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:483
        Self.SetStage(CONST_VaultTransferModule01RemovedStage) ; #DEBUG_LINE_NO:484
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  ElseIf akSource == vaultControlsTransferModuleSlot02Ref ; #DEBUG_LINE_NO:487
    Guard TransferModuleSlot02ActivationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:488
      If !Self.GetStageDone(CONST_VaultPowerReroutedStage) ; #DEBUG_LINE_NO:489
        LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:490
        CF07_zLegacy003_Callout_ConsoleLowPower.Start() ; #DEBUG_LINE_NO:491
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) == 0 ; #DEBUG_LINE_NO:492
        LC107_GalbankTransferModuleNeededMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:493
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02InsertedStage) && Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0 ; #DEBUG_LINE_NO:494
        Game.GetPlayer().RemoveItem(CF_GalbankTransferModule as Form, 1, False, crimsonFleetAliasContainerRef) ; #DEBUG_LINE_NO:495
        Self.GoToState("Waiting") ; #DEBUG_LINE_NO:496
        vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:497
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start") ; #DEBUG_LINE_NO:498
        Self.SetStage(CONST_VaultTransferModule02InsertedStage) ; #DEBUG_LINE_NO:499
      ElseIf !Self.GetStageDone(CONST_VaultDataTransferCompleteStage) ; #DEBUG_LINE_NO:500
        LC107_GalbankTransferModuleLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:501
      ElseIf !Self.GetStageDone(CONST_VaultTransferModule02RemovedStage) ; #DEBUG_LINE_NO:502
        vaultControlsTransferModuleSlot02Ref.BlockActivation(True, True) ; #DEBUG_LINE_NO:503
        Self.GoToState("Waiting") ; #DEBUG_LINE_NO:504
        vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play02", "Done") ; #DEBUG_LINE_NO:505
        vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Stop") ; #DEBUG_LINE_NO:506
        Game.GetPlayer().AddItem(JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:507
        Self.SetStage(CONST_VaultTransferModule02RemovedStage) ; #DEBUG_LINE_NO:508
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  ElseIf akSource == vaultControlsDataCoreSlotRef ; #DEBUG_LINE_NO:511
    If !Self.GetStageDone(CONST_VaultPowerReroutedStage) ; #DEBUG_LINE_NO:512
      LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:513
      CF07_zLegacy003_Callout_ConsoleLowPower.Start() ; #DEBUG_LINE_NO:514
    ElseIf !Self.GetStageDone(CONST_VaultTransferModulesInsertedStage) ; #DEBUG_LINE_NO:515
      LC107_GalbankDataCorePortNeedsTransferModulesMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:516
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreInsertedStage) ; #DEBUG_LINE_NO:517
      Game.GetPlayer().RemoveItem(DataCoreEmpty.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:518
      vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:519
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start") ; #DEBUG_LINE_NO:520
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start") ; #DEBUG_LINE_NO:521
      Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:522
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Loop") ; #DEBUG_LINE_NO:523
      Self.SetStage(CONST_VaultDataCoreInsertedStage) ; #DEBUG_LINE_NO:524
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreReadyForRemovalStage) ; #DEBUG_LINE_NO:525
      LC107_DataCoreLockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:526
      Self.DisableFastTravelOnLegacy() ; #DEBUG_LINE_NO:527
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreRemovedStage) ; #DEBUG_LINE_NO:528
      vaultControlsDataCoreSlotRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:529
      WwiseEvent_QST_CF07_TakeModule.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:530
      vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play02", "Done") ; #DEBUG_LINE_NO:531
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Stop") ; #DEBUG_LINE_NO:532
      Self.LockPlayerForEscape() ; #DEBUG_LINE_NO:533
      Game.GetPlayer().AddItem(DataCoreFull.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:534
      Self.SetStage(CONST_VaultDataCoreRemovedStage) ; #DEBUG_LINE_NO:535
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSource == vaultControlsDownloadControlRef ; #DEBUG_LINE_NO:537
    If !Self.GetStageDone(CONST_VaultPowerReroutedStage) ; #DEBUG_LINE_NO:538
      LC107_GalbankControlConsoleNeedsPowerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:539
      CF07_zLegacy003_Callout_ConsoleLowPower.Start() ; #DEBUG_LINE_NO:540
    ElseIf !Self.GetStageDone(CONST_VaultDataCoreInsertedStage) ; #DEBUG_LINE_NO:541
      LC107_GalbankDownloadControlNeedsDataCoreMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:542
    ElseIf !Self.GetStageDone(CONST_VaultDownloadControlActivatedStage) ; #DEBUG_LINE_NO:543
      vaultControlsDownloadControlRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:544
      vaultControlsDownloadControlRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:545
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop") ; #DEBUG_LINE_NO:546
      Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:547
      vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start") ; #DEBUG_LINE_NO:548
      Self.SetStage(CONST_VaultDownloadControlActivatedStage) ; #DEBUG_LINE_NO:549
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CredTanksInit()
  Float startTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:560
  Self.StartCredTankOperation() ; #DEBUG_LINE_NO:561
  vaultCredTankManagerRef.PerformInitialRegistration(None) ; #DEBUG_LINE_NO:562
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Initialize) ; #DEBUG_LINE_NO:563
  Self.WaitForCredTankOperation() ; #DEBUG_LINE_NO:564
  initializedPackins = True ; #DEBUG_LINE_NO:566
EndFunction

Function CredTanksBoot()
  Float startTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:570
  Self.WaitForCredTankInitialization() ; #DEBUG_LINE_NO:571
  Self.StartCredTankOperation() ; #DEBUG_LINE_NO:572
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Boot) ; #DEBUG_LINE_NO:573
  Self.WaitForCredTankOperation() ; #DEBUG_LINE_NO:574
EndFunction

Function CredTanksDrain()
  Float startTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:579
  Self.WaitForCredTankInitialization() ; #DEBUG_LINE_NO:580
  Self.StartCredTankOperation() ; #DEBUG_LINE_NO:581
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:582
  akArgs[0] = startTime as Var ; #DEBUG_LINE_NO:583
  Self.CallFunctionNoWait("CredTanksDrain02", akArgs) ; #DEBUG_LINE_NO:584
EndFunction

Function CredTanksDrain02(Float startTime)
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Drain) ; #DEBUG_LINE_NO:588
  Self.WaitForCredTankOperation() ; #DEBUG_LINE_NO:589
EndFunction

Function CredTanksShutdown()
  waitingForCredTanksShutdown = True ; #DEBUG_LINE_NO:594
  Float startTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:595
  Self.WaitForCredTankInitialization() ; #DEBUG_LINE_NO:596
  Self.StartCredTankOperation() ; #DEBUG_LINE_NO:597
  vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Shutdown) ; #DEBUG_LINE_NO:598
  Self.WaitForCredTankOperation() ; #DEBUG_LINE_NO:599
  waitingForCredTanksShutdown = False ; #DEBUG_LINE_NO:601
EndFunction

Function StartCredTankOperation()
  LC107CredTankShelvesCurrentGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:606
EndFunction

Function WaitForCredTankOperation()
  Int current = LC107CredTankShelvesCurrentGlobal.GetValueInt() ; #DEBUG_LINE_NO:610
  Int total = LC107CredTankShelvesTotalGlobal.GetValueInt() ; #DEBUG_LINE_NO:611
  While current < total ; #DEBUG_LINE_NO:612
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:613
    current = LC107CredTankShelvesCurrentGlobal.GetValueInt() ; #DEBUG_LINE_NO:614
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function WaitForCredTankInitialization()
  Int failsafe = 0 ; #DEBUG_LINE_NO:621
  While !initializedPackins && failsafe < 150 ; #DEBUG_LINE_NO:622
    failsafe += 1 ; #DEBUG_LINE_NO:623
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:624
  EndWhile ; #DEBUG_LINE_NO:
  If failsafe == 150 ; #DEBUG_LINE_NO:626
    Return  ; #DEBUG_LINE_NO:628
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_ForceDataTransfer()
  vaultControlsDataCoreSlotRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:634
  vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:635
  vaultControlsDataCoreSlotRef.PlayAnimation("Stage04_Stop") ; #DEBUG_LINE_NO:636
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 0.0) ; #DEBUG_LINE_NO:637
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 10.0) ; #DEBUG_LINE_NO:638
  Self.PerformCredTankDataTransfer() ; #DEBUG_LINE_NO:639
EndFunction

Function PerformCredTankDataTransfer()
  QST_CF07_ServerRoom_Activate.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:643
  Self.CredTanksBoot() ; #DEBUG_LINE_NO:644
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:645
  Self.CredTanksDrain() ; #DEBUG_LINE_NO:646
  QST_CF07_ServerRoom_Deactivate.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:647
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:648
  Float current = LC107CredTankShelvesCurrentGlobal.GetValueInt() as Float ; #DEBUG_LINE_NO:649
  Float total = LC107CredTankShelvesTotalGlobal.GetValueInt() as Float ; #DEBUG_LINE_NO:650
  Float currentPercent = current / total ; #DEBUG_LINE_NO:651
  QST_CF07_Data_Transfer_LP_Start.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:652
  While currentPercent < CONST_CredTankDrainPercentMax ; #DEBUG_LINE_NO:653
    vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", currentPercent) ; #DEBUG_LINE_NO:654
    Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:655
    current = LC107CredTankShelvesCurrentGlobal.GetValueInt() as Float ; #DEBUG_LINE_NO:656
    currentPercent = current / total ; #DEBUG_LINE_NO:657
  EndWhile ; #DEBUG_LINE_NO:
  QST_CF07_Data_Transfer_LP_Stop.Play(vaultControlsDataCoreSlotRef, None, None) ; #DEBUG_LINE_NO:659
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:660
EndFunction

Function PopupDataCore()
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:664
  vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 1.0) ; #DEBUG_LINE_NO:665
  Utility.Wait(CONST_DataCorePopupDelay) ; #DEBUG_LINE_NO:666
EndFunction

Function PlayBreachSequenceStartVFX()
  Game.SetInChargen(True, True, False) ; #DEBUG_LINE_NO:676
EndFunction

Function PlayBreachSequenceEndVFX()
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:681
  breachSequenceExplosionsActive = False ; #DEBUG_LINE_NO:683
EndFunction

Function SetNotSealedEnvironment()
  LC107LegacyShipLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:688
EndFunction

Function WaitForBreachesAndCredTanks()
  While waitingForCredTanksShutdown ; #DEBUG_LINE_NO:
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:694
  EndWhile ; #DEBUG_LINE_NO:
  While waitingForVaultInstantBreaches ; #DEBUG_LINE_NO:
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:698
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HullBreachesInit()
  lc107hullbreachscript[] hullBreaches = HullBreachesAll.GetArray() as lc107hullbreachscript[] ; #DEBUG_LINE_NO:711
  Int I = 0 ; #DEBUG_LINE_NO:712
  While I < hullBreaches.Length ; #DEBUG_LINE_NO:713
    If hullBreaches[I] != None ; #DEBUG_LINE_NO:714
      hullBreaches[I].InitHullBreach() ; #DEBUG_LINE_NO:715
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:717
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function BreakVaultInstantBreaches()
  waitingForVaultInstantBreaches = True ; #DEBUG_LINE_NO:722
  lc107hullbreachscript[] hullBreachesVault = HullBreachesInstantBreakVault.GetArray() as lc107hullbreachscript[] ; #DEBUG_LINE_NO:723
  Int totalInstantBreaches = hullBreachesVault.Length ; #DEBUG_LINE_NO:724
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:725
  akArgs[0] = True as Var ; #DEBUG_LINE_NO:726
  Int I = 0 ; #DEBUG_LINE_NO:727
  While I < totalInstantBreaches ; #DEBUG_LINE_NO:728
    lc107hullbreachscript currentBreach = hullBreachesVault[I] ; #DEBUG_LINE_NO:729
    If currentBreach != None ; #DEBUG_LINE_NO:730
      currentBreach.CallFunctionNoWait("TriggerBreach", akArgs) ; #DEBUG_LINE_NO:731
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:733
  EndWhile ; #DEBUG_LINE_NO:
  Int currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt() ; #DEBUG_LINE_NO:735
  While currentInstantBreaches < totalInstantBreaches ; #DEBUG_LINE_NO:736
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:737
    currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt() ; #DEBUG_LINE_NO:738
  EndWhile ; #DEBUG_LINE_NO:
  waitingForVaultInstantBreaches = False ; #DEBUG_LINE_NO:741
EndFunction

Function BreakOtherInstantBreaches()
  Int I = 0 ; #DEBUG_LINE_NO:745
  lc107hullbreachscript[] hullBreachesOther = HullBreachesInstantBreak.GetArray() as lc107hullbreachscript[] ; #DEBUG_LINE_NO:746
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:747
  akArgs[0] = False as Var ; #DEBUG_LINE_NO:748
  While I < hullBreachesOther.Length ; #DEBUG_LINE_NO:749
    lc107hullbreachscript currentBreach = hullBreachesOther[I] ; #DEBUG_LINE_NO:750
    If currentBreach != None ; #DEBUG_LINE_NO:751
      currentBreach.CallFunctionNoWait("TriggerBreach", akArgs) ; #DEBUG_LINE_NO:752
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:754
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DamageDestructibleTraps()
  Utility.Wait(15.0) ; #DEBUG_LINE_NO:759
  ObjectReference[] destructibleTrapRefs = DestructibleTraps.GetArray() ; #DEBUG_LINE_NO:761
  Int I = 0 ; #DEBUG_LINE_NO:762
  While I < destructibleTrapRefs.Length ; #DEBUG_LINE_NO:763
    ObjectReference currentTrap = destructibleTrapRefs[I] ; #DEBUG_LINE_NO:764
    currentTrap.DamageObject(currentTrap.GetValue(Health) - 3.0) ; #DEBUG_LINE_NO:765
    I += 1 ; #DEBUG_LINE_NO:766
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StartBreachSequenceExplosions()
  breachSequenceExplosionsActive = True ; #DEBUG_LINE_NO:780
  Self.StartTimer(0.0, CONST_BreachSequenceExplosionTimerID) ; #DEBUG_LINE_NO:781
EndFunction

Function StartAmbientExplosions(Int newAmbientExplosionLevel)
  Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:786
    ambientExplosionLevel = newAmbientExplosionLevel ; #DEBUG_LINE_NO:787
    Self.StartTimer(0.0, CONST_AmbientExplosionTimerID) ; #DEBUG_LINE_NO:788
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StartAmbientExplosionTimer()
  Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:793
    Self.StartTimer(Utility.RandomFloat(AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin, AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax), CONST_AmbientExplosionTimerID) ; #DEBUG_LINE_NO:794
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_BreachSequenceExplosionTimerID ; #DEBUG_LINE_NO:799
    Self.CancelTimer(CONST_BreachSequenceExplosionTimerID) ; #DEBUG_LINE_NO:800
    Float rumbleTime = Utility.RandomFloat(CONST_BreachSequenceRumbleTimeMin, CONST_BreachSequenceRumbleTimeMax) ; #DEBUG_LINE_NO:801
    Game.GetPlayer().RampRumble(Utility.RandomFloat(CONST_BreachSequenceRumblePowerMin, CONST_BreachSequenceRumblePowerMax), rumbleTime, 1600.0) ; #DEBUG_LINE_NO:802
    Utility.Wait(rumbleTime) ; #DEBUG_LINE_NO:803
    If breachSequenceExplosionsActive ; #DEBUG_LINE_NO:804
      Self.StartTimer(Utility.RandomFloat(CONST_BreachSequenceRumbleDelayMin, CONST_BreachSequenceRumbleDelayMax), CONST_BreachSequenceExplosionTimerID) ; #DEBUG_LINE_NO:805
    EndIf ; #DEBUG_LINE_NO:
  ElseIf timerID == CONST_AmbientExplosionTimerID && !debugBlockAmbientExplosions ; #DEBUG_LINE_NO:809
    Guard AmbientExplosionDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:810
      If Game.GetPlayer().GetParentCell() == LC107Legacy01 ; #DEBUG_LINE_NO:811
        Self.TriggerExplosion(AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin, AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax, None) ; #DEBUG_LINE_NO:812
        Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:813
        If evacuationSceneLastPlayedTime == 0.0 || currentTime < evacuationSceneLastPlayedTime ; #DEBUG_LINE_NO:814
          evacuationSceneLastPlayedTime = currentTime ; #DEBUG_LINE_NO:816
        ElseIf currentTime > (evacuationSceneLastPlayedTime + CONST_EvacuationSceneRepeatDelay as Float) ; #DEBUG_LINE_NO:817
          evacuationSceneLastPlayedTime = currentTime ; #DEBUG_LINE_NO:818
          CF07_zLegacy007_Evacuate_HullBreach.Start() ; #DEBUG_LINE_NO:819
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If !Self.GetStageDone(CONST_LegacyEscapeCompleteStage) ; #DEBUG_LINE_NO:822
        Self.StartAmbientExplosionTimer() ; #DEBUG_LINE_NO:823
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TriggerExplosion(Int ExplosionSizeMin, Int ExplosionSizeMax, ObjectReference explosionSource)
  Bool isSpawnedExplosionSource = False ; #DEBUG_LINE_NO:830
  If explosionSource == None ; #DEBUG_LINE_NO:831
    isSpawnedExplosionSource = True ; #DEBUG_LINE_NO:832
    Float[] offsets = new Float[3] ; #DEBUG_LINE_NO:833
    offsets[0] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinX as Float, CONST_AmbientExplosionOffsetMaxX as Float) ; #DEBUG_LINE_NO:834
    offsets[1] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinY as Float, CONST_AmbientExplosionOffsetMaxY as Float) ; #DEBUG_LINE_NO:835
    offsets[2] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinZ as Float, CONST_AmbientExplosionOffsetMaxZ as Float) ; #DEBUG_LINE_NO:836
    If Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:837
      offsets[0] = offsets[0] * -1.0 ; #DEBUG_LINE_NO:838
    EndIf ; #DEBUG_LINE_NO:
    explosionSource = Game.GetPlayer().PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:840
  EndIf ; #DEBUG_LINE_NO:
  Explosion explosionToSpawn = None ; #DEBUG_LINE_NO:843
  If ExplosionSizeMin == ExplosionSizeMax ; #DEBUG_LINE_NO:844
    explosionToSpawn = HullBreachExplosions[ExplosionSizeMin] ; #DEBUG_LINE_NO:845
  Else ; #DEBUG_LINE_NO:
    explosionToSpawn = HullBreachExplosions[Utility.RandomInt(ExplosionSizeMin, ExplosionSizeMax)] ; #DEBUG_LINE_NO:847
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference spawnedExplosion = explosionSource.PlaceAtMe(explosionToSpawn as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:850
  If isSpawnedExplosionSource ; #DEBUG_LINE_NO:852
    explosionSource.Delete() ; #DEBUG_LINE_NO:853
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_BlockAmbientExplosions()
  debugBlockAmbientExplosions = True ; #DEBUG_LINE_NO:858
EndFunction

Function DEBUG_SetAmbientExplosionValues(Int sizeMin, Int sizeMax, Int delayMin, Int delayMax)
  AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin = sizeMin ; #DEBUG_LINE_NO:862
  AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax = sizeMax ; #DEBUG_LINE_NO:863
  AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin = delayMin as Float ; #DEBUG_LINE_NO:864
  AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax = delayMax as Float ; #DEBUG_LINE_NO:865
EndFunction

Function ResetStandardCredTanks()
  cfcredtankscript[] standardTanks = StandardCredTanks.GetArray() as cfcredtankscript[] ; #DEBUG_LINE_NO:875
  Int I = 0 ; #DEBUG_LINE_NO:876
  While I < standardTanks.Length ; #DEBUG_LINE_NO:877
    standardTanks[I].ResetCredTank() ; #DEBUG_LINE_NO:878
    I += 1 ; #DEBUG_LINE_NO:879
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetReactorState(RefCollectionAlias reactorCol, Int newState)
  reactorfloormida01script[] reactors = reactorCol.GetArray() as reactorfloormida01script[] ; #DEBUG_LINE_NO:884
  Int I = 0 ; #DEBUG_LINE_NO:885
  While I < reactors.Length ; #DEBUG_LINE_NO:886
    reactors[I].SetReactorState(newState, False) ; #DEBUG_LINE_NO:887
    I += 1 ; #DEBUG_LINE_NO:888
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DisableFastTravelOnLegacy()
  If LC107EnableLayer == None ; #DEBUG_LINE_NO:899
    LC107EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:900
  EndIf ; #DEBUG_LINE_NO:
  LC107EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:902
EndFunction

Function LockPlayerForEscape()
  Self.DisableFastTravelOnLegacy() ; #DEBUG_LINE_NO:906
  LC107EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:907
  Game.SetInChargen(True, True, False) ; #DEBUG_LINE_NO:908
EndFunction

Function UnlockPlayerMovement()
  LC107EnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:912
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:913
EndFunction

Function UnlockFastTravel()
  If LC107EnableLayer != None ; #DEBUG_LINE_NO:917
    LC107EnableLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:918
    LC107EnableLayer.Delete() ; #DEBUG_LINE_NO:919
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Cleanup()
  vaultEntranceControlRef = None ; #DEBUG_LINE_NO:930
  vaultPowerSwitch01Ref = None ; #DEBUG_LINE_NO:931
  vaultPowerSwitch02Ref = None ; #DEBUG_LINE_NO:932
  vaultPowerSwitch01LightRef = None ; #DEBUG_LINE_NO:933
  vaultPowerSwitch02LightRef = None ; #DEBUG_LINE_NO:934
  vaultControlsTransferModuleSlot01Ref = None ; #DEBUG_LINE_NO:935
  vaultControlsTransferModuleSlot02Ref = None ; #DEBUG_LINE_NO:936
  vaultControlsDataCoreSlotRef = None ; #DEBUG_LINE_NO:937
  vaultControlsDownloadControlRef = None ; #DEBUG_LINE_NO:938
  vaultControlsStatusIndicatorRef = None ; #DEBUG_LINE_NO:939
  crimsonFleetAliasContainerRef = None ; #DEBUG_LINE_NO:940
  vaultCredTankManagerRef = None ; #DEBUG_LINE_NO:941
EndFunction

;-- State -------------------------------------------
State ProcessingActivation
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
    Self.GoToState("ProcessingActivation") ; #DEBUG_LINE_NO:390
    Self.ProcessOnActivate(akSource, akActionRef) ; #DEBUG_LINE_NO:391
    Self.GoToState("Waiting") ; #DEBUG_LINE_NO:392
  EndEvent
EndState
