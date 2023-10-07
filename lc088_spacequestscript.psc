ScriptName LC088_SpaceQuestScript Extends Quest
{ Quest script for LC088_Space, the Space portion of the Crimson Fleet Final Battle. }

;-- Variables ---------------------------------------
Int CF_Main_AllEnemiesDefeatedCount_4 = 15
Int CF_Main_ReinforcementTriggerCount_1 = 4
Int CF_Main_ReinforcementTriggerCount_2 = 6
Int CF_Main_ReinforcementTriggerCount_3 = 8
Int CONST_AILevelMod_Hard = 2 Const
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
Int CONST_DockingPermission_Any = 0 Const
Int CONST_DockingPermission_Never = 4 Const
Int CONST_EncounterID_Alpha = 1 Const
Int CONST_EncounterID_Beta = 2 Const
Int CONST_EncounterID_Gamma = 3 Const
Int CONST_EncounterID_Main = 4 Const
Int CONST_EncounterID_Skirmish = 0 Const
Int CONST_LC082_DisableCF07TrafficManagerStage = 40 Const
Int CONST_LC088KeyStage_Complete = 1100 Const
Int CONST_LC088VigilanceStage_Complete = 1100 Const
Int CONST_NearDistance_Close = 0 Const
Int CONST_NearDistance_Long = 3 Const
Int CONST_NearDistance_Moderate = 2 Const
Int CONST_NearDistance_Short = 1 Const
Int CONST_NearFacing_AwayLarge = 3 Const
Int CONST_NearFacing_AwaySmall = 2 Const
Int CONST_NearFacing_Random = -2 Const
Int CONST_NearFacing_TowardLarge = 1 Const
Int CONST_NearFacing_TowardSmall = 0 Const
Int CONST_NearPosition_Above = 3 Const
Int CONST_NearPosition_Behind = 2 Const
Int CONST_NearPosition_Below = 4 Const
Int CONST_NearPosition_DeadAhead = -1 Const
Int CONST_NearPosition_ForwardTight = 0 Const
Int CONST_NearPosition_ForwardWide = 1 Const
Int CONST_NearPosition_Left = 5 Const
Int CONST_NearPosition_Right = 6 Const
Float CONST_ReinforcementForwardVelocityPercent = 0.75 Const
Int CONST_ReinforcementMaxDistanceFromFallback = 10000 Const
Int CONST_SDAlliesForwardShiftDistance_Batteries = 1000 Const
Int CONST_SDAlliesForwardShiftDistance_Main = 0 Const
Int CONST_SDAlliesMax_Beta = 4 Const
Int CONST_SDAlliesMax_Gamma = 5 Const
Int CONST_SDAlliesMax_Main = 6 Const
Int CONST_SDBatteryMapMarkerHeadingOffsetDistance = 1000 Const
Float CONST_SDEnemiesMainDelay_Max = 2.0 Const
Float CONST_SDEnemiesMainDelay_Min = 0.5 Const
Float CONST_SDFleetEnableDelayMax = 0.400000006 Const
Float CONST_SDFleetEnableDelayMin = 0.200000003 Const
Float CONST_SDFleetEnableDelayVigilance = 1.0 Const
Int CONST_SDState_Failed = 1 Const
Int CONST_Stage_CF_AllEscortsDefeated = 175 Const
Int CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance = 179 Const
Int CONST_Stage_CF_DisplayQTsToRemaining = 173 Const
Int CONST_Stage_CF_DockedWithVigilance = 190 Const
Int CONST_Stage_CF_MainReady = 150 Const
Int CONST_Stage_CF_PlayerSidesWithCF = 100 Const
Int CONST_Stage_CF_Quickstart = 11 Const
Int CONST_Stage_CF_Reinforcements1 = 165 Const
Int CONST_Stage_CF_Reinforcements2 = 169 Const
Int CONST_Stage_CF_Reinforcements3 = 170 Const
Int CONST_Stage_CF_Skip = 40 Const
Int CONST_Stage_CF_StartAlpha = 120 Const
Int CONST_Stage_CF_StartBeta = 130 Const
Int CONST_Stage_CF_StartGamma = 140 Const
Int CONST_Stage_CF_StartMain = 160 Const
Int CONST_Stage_CF_StartMainDone = 161 Const
Int CONST_Stage_CF_UndockedWithVigilanceAfterCompleting = 195 Const
Int CONST_Stage_CF_VigilanceInvulnerable = 163 Const
Int CONST_Stage_PlayerSetupDone = 32 Const
Int CONST_Stage_SD_CompletedAlpha = 228 Const
Int CONST_Stage_SD_CompletedBeta = 238 Const
Int CONST_Stage_SD_CompletedGamma = 248 Const
Int CONST_Stage_SD_CompletedGammaSceneDone = 249 Const
Int CONST_Stage_SD_DockedWithKey = 290 Const
Int CONST_Stage_SD_MainBattleCompleted = 270 Const
Int CONST_Stage_SD_PlayerSidesWithSD = 200 Const
Int CONST_Stage_SD_Quickstart = 12 Const
Int CONST_Stage_SD_Reinforcements3 = 265 Const
Int CONST_Stage_SD_Skip = 45 Const
Int CONST_Stage_SD_StartAlpha = 220 Const
Int CONST_Stage_SD_StartBeta = 230 Const
Int CONST_Stage_SD_StartGamma = 240 Const
Int CONST_Stage_SD_StartMain = 260 Const
Int CONST_Stage_SD_StartMainDone = 261 Const
Int CONST_Stage_SD_UndockedWithKeyAfterCompleting = 295 Const
Int CONST_VigilanceDockingLimit = 3 Const
Int CONST_VigilanceInvulnerableMessageTimerDelay = 10 Const
Int CONST_VigilanceInvulnerableMessageTimerID = 2 Const
Int CONST_VigilanceInvulnerableSceneTimerID = 1 Const
Float CONST_VigilanceInvulnerableSceneWaitDelay = 20.0 Const
Float CONST_VigilanceShieldDamageDelayPerIncrement = 0.100000001 Const
Int CONST_VigilanceShieldDamageIncrements = 60 Const
Int CONST_VigilanceShieldDamagePerIncrement = 85 Const
Int CONST_VigilanceShieldSystemMaxDamage = 10000 Const
Int CONST_WaitForQuestStartupFailsafeMax = 120 Const
Location DBAlphaSpaceCellLoc
Location DBBetaSpaceCellLoc
Location DBGammaSpaceCellLoc
Location KeySpaceCellLoc
inputenablelayer LC088SpaceEnableLayer
Bool Main_MusicOverrideActive
Int Main_ReinforcementWavesTriggered
Int SD_LastBatteryDestroyedID
Int SD_Main_AllEnemiesDefeatedCount_4 = 0
Int SD_Main_ReinforcementTriggerCount_1 = 0
Int SD_Main_ReinforcementTriggerCount_2 = 0
Int SD_Main_ReinforcementTriggerCount_3 = 0
Location VigilanceSpaceCellLoc
Scene currentSpaceScene
spaceshipreference keyRef
Actor playerRef
Bool questStartupFinished
spaceshipreference vigilanceRef
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ReinforcementsGuard
Guard SpaceSceneGuard

;-- Properties --------------------------------------
Group QuestProperties
  spaceshipbase Property DEBUG_PlayerShipCF Auto Const mandatory
  spaceshipbase Property DEBUG_PlayerShipSD Auto Const mandatory
EndGroup

Group AutofillProperties
  Quest Property LC082 Auto Const mandatory
  Quest Property LC088_Vigilance Auto Const mandatory
  Quest Property LC088_Key Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property KeySpaceCellLocation Auto Const mandatory
  LocationAlias Property VigilanceSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBAlphaSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBBetaSpaceCellLocation Auto Const mandatory
  LocationAlias Property DBGammaSpaceCellLocation Auto Const mandatory
  ReferenceAlias Property KeyAlias Auto Const mandatory
  ReferenceAlias Property Vigilance Auto Const mandatory
  ReferenceAlias Property Player Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_RokovShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_MathisShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_NaevaShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_AdlerShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_HuanShip Auto Const mandatory
  ReferenceAlias Property CF_Captain_EstelleShip Auto Const mandatory
  RefCollectionAlias Property CF_Captains_All Auto Const mandatory
  ReferenceAlias Property SD_ToftShip Auto Const mandatory
  ReferenceAlias Property SD_ArchangelShip Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Group Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlpha Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBeta Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGamma Auto Const mandatory
  ReferenceAlias Property KeyMapMarker Auto Const mandatory
  ReferenceAlias Property VigilanceEnableMarkerCF07 Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlphaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBetaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGammaMapMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryAlphaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryBetaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property DefensiveBatteryGammaProjectileSourceMarker Auto Const mandatory
  ReferenceAlias Property VigilanceArrivalMarker Auto Const mandatory
  ReferenceAlias Property VigilanceTrafficMarker Auto Const mandatory
  ReferenceAlias Property KeyTrafficMarker Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property StationTheKey_CFMainEnableMarker Auto Const mandatory
  ReferenceAlias Property KeyTurretsEnableMarker Auto Const mandatory
  RefCollectionAlias Property KeyTurrets Auto Const mandatory
  RefCollectionAlias Property IncidentalDialogueBlockedCollection Auto Const mandatory
  RefCollectionAlias Property CF_Allies_All Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Skirmish Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Alpha Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Beta Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Gamma Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main_Reinforcements Auto Const mandatory
  RefCollectionAlias Property CF_Allies_Main_FallbackReinforcements Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_All Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Skirmish Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Alpha Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Beta Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Gamma Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main_Reinforcements_1 Auto Const mandatory
  RefCollectionAlias Property CF_Enemies_Main_Reinforcements_2 Auto Const mandatory
  RefCollectionAlias Property GenericShipsAll Auto Const mandatory
  RefCollectionAlias Property SD_Allies_All Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Skirmish Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Alpha Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Beta Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Gamma Auto Const mandatory
  RefCollectionAlias Property SD_Allies_Main_SysDefFleet Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_All Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Skirmish Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Alpha Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Beta Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Gamma Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main_Reinforcements_1 Auto Const mandatory
  RefCollectionAlias Property SD_Enemies_Main_Reinforcements_2 Auto Const mandatory
  ReferenceAlias Property SD_BatteryDestroyedSpeaker Auto Const mandatory
  ReferenceAlias Property SD_Alpha_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Beta_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Gamma_ArrivalPointMarkerChainHead Auto Const mandatory
  ReferenceAlias Property SD_Main_ArrivalPointMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property GammaShipsAll Auto Const mandatory
  GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property LC088SpaceMainEnemiesKilled Auto Const mandatory
  Faction Property PlayerFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property ShieldHealth Auto Const mandatory
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
  ActorValue Property SpaceshipMainEnginePower Auto Const mandatory
  ActorValue Property SpaceshipShieldPower Auto Const mandatory
  ActorValue Property HideShipFromHUDValue Auto Const mandatory
  Keyword Property CF05_JadeSwanShipKeyword Auto Const mandatory
  Keyword Property LC088_Space_CF_LinkToFormationKeyword Auto Const mandatory
  Keyword Property LC088_Space_CF_CaptainsDockingLinkToVigilance Auto Const mandatory
  Keyword Property LC088_Space_SD_ReinforcementDockedWithKeyKeyword Auto Const mandatory
  Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
  Scene Property LC088_Space_SD_225_BatteryDestroyed Auto Const mandatory
  Scene Property LC088_Space_SD_226_BatteryPhaseComplete Auto Const mandatory
  Spell Property LC088_DefensiveBatteryRegenSpell Auto Const mandatory
  Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageReductionPerk Auto Const mandatory
  Perk Property Skill_Piloting Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  Message Property LC088_Space_VigilanceShieldsImpenetrableMessage Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08SpaceBattle Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  ObjectReference Property TheKey_DataCoreAnalyzer_EnableMarkerRef Auto Const mandatory
  ObjectReference Property TheKey_DataCoreAnalyzer_DisableMarkerRef Auto Const mandatory
  ReferenceAlias Property TheKey_DataCoreAnalyzer Auto Const mandatory
  ObjectReference Property LC082_DataCoreAnalyzer_DisableMarkerRef Auto Const mandatory
  ObjectReference Property LC082_DataCoreAnalyzer_EnableMarkerRef Auto Const mandatory
  ReferenceAlias Property LC082_DataCoreAnalyzer Auto Const mandatory
  VisualEffect Property LC088_Space_DefensiveBatteriesFireOnVigilance Auto Const mandatory
  GlobalVariable Property LC088_Space_UseNewDefensiveBatteryFireVFX Auto Const mandatory
  GlobalVariable Property LC088_Space_DefensiveBatteryFireToShieldDegenDelay Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:323
  keyRef = KeyAlias.GetShipRef() ; #DEBUG_LINE_NO:324
  vigilanceRef = Vigilance.GetShipRef() ; #DEBUG_LINE_NO:325
  KeySpaceCellLoc = KeySpaceCellLocation.GetLocation() ; #DEBUG_LINE_NO:326
  VigilanceSpaceCellLoc = VigilanceSpaceCellLocation.GetLocation() ; #DEBUG_LINE_NO:327
  DBAlphaSpaceCellLoc = DBAlphaSpaceCellLocation.GetLocation() ; #DEBUG_LINE_NO:328
  DBBetaSpaceCellLoc = DBBetaSpaceCellLocation.GetLocation() ; #DEBUG_LINE_NO:329
  DBGammaSpaceCellLoc = DBGammaSpaceCellLocation.GetLocation() ; #DEBUG_LINE_NO:330
  CF_Allies_All.AddRefCollection(CF_Allies_Skirmish) ; #DEBUG_LINE_NO:333
  CF_Allies_All.AddRefCollection(CF_Allies_Alpha) ; #DEBUG_LINE_NO:334
  CF_Allies_All.AddRefCollection(CF_Allies_Beta) ; #DEBUG_LINE_NO:335
  CF_Allies_All.AddRefCollection(CF_Allies_Gamma) ; #DEBUG_LINE_NO:336
  CF_Allies_All.AddRefCollection(CF_Allies_Main) ; #DEBUG_LINE_NO:337
  IncidentalDialogueBlockedCollection.AddRefCollection(CF_Allies_All) ; #DEBUG_LINE_NO:338
  CF_Enemies_All.AddRefCollection(CF_Enemies_Skirmish) ; #DEBUG_LINE_NO:340
  CF_Enemies_All.AddRefCollection(CF_Enemies_Alpha) ; #DEBUG_LINE_NO:341
  CF_Enemies_All.AddRefCollection(CF_Enemies_Beta) ; #DEBUG_LINE_NO:342
  CF_Enemies_All.AddRefCollection(CF_Enemies_Gamma) ; #DEBUG_LINE_NO:343
  CF_Enemies_All.AddRefCollection(CF_Enemies_Main) ; #DEBUG_LINE_NO:344
  IncidentalDialogueBlockedCollection.AddRefCollection(CF_Enemies_All) ; #DEBUG_LINE_NO:345
  SD_Allies_All.AddRefCollection(SD_Allies_Alpha) ; #DEBUG_LINE_NO:347
  SD_Allies_All.AddRefCollection(SD_Allies_Beta) ; #DEBUG_LINE_NO:348
  SD_Allies_All.AddRefCollection(SD_Allies_Gamma) ; #DEBUG_LINE_NO:349
  SD_Allies_All.AddRefCollection(SD_Allies_Main_SysDefFleet) ; #DEBUG_LINE_NO:350
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_All) ; #DEBUG_LINE_NO:351
  SD_Enemies_All.AddRefCollection(SD_Enemies_Skirmish) ; #DEBUG_LINE_NO:353
  SD_Enemies_All.AddRefCollection(SD_Enemies_Alpha) ; #DEBUG_LINE_NO:354
  SD_Enemies_All.AddRefCollection(SD_Enemies_Beta) ; #DEBUG_LINE_NO:355
  SD_Enemies_All.AddRefCollection(SD_Enemies_Gamma) ; #DEBUG_LINE_NO:356
  SD_Enemies_All.AddRefCollection(SD_Enemies_Main) ; #DEBUG_LINE_NO:357
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Enemies_All) ; #DEBUG_LINE_NO:358
  GenericShipsAll.AddRefCollection(CF_Allies_All) ; #DEBUG_LINE_NO:360
  GenericShipsAll.AddRefCollection(CF_Enemies_All) ; #DEBUG_LINE_NO:361
  GenericShipsAll.AddRefCollection(SD_Allies_All) ; #DEBUG_LINE_NO:362
  GenericShipsAll.AddRefCollection(SD_Enemies_All) ; #DEBUG_LINE_NO:363
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:366
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:367
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:368
  Self.RegisterForRemoteEvent(CF_Enemies_Main as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:369
  Self.RegisterForRemoteEvent(SD_Enemies_Main as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:370
  Self.SetDockingEnabled(keyRef, False) ; #DEBUG_LINE_NO:373
  Self.SetDockingEnabled(vigilanceRef, False) ; #DEBUG_LINE_NO:374
  VigilanceTrafficMarker.TryToDisable() ; #DEBUG_LINE_NO:377
  StationTheKey_CFMainEnableMarker.TryToDisable() ; #DEBUG_LINE_NO:378
  KeyTurretsEnableMarker.TryToEnable() ; #DEBUG_LINE_NO:381
  CF_Allies_Skirmish.EnableAll(False) ; #DEBUG_LINE_NO:385
  CF_Enemies_Skirmish.EnableAll(False) ; #DEBUG_LINE_NO:386
  If CF_SysDefShutdown.GetValue() != CONST_SDState_Failed as Float ; #DEBUG_LINE_NO:389
    SD_Allies_Skirmish.EnableAll(False) ; #DEBUG_LINE_NO:390
    SD_Enemies_Skirmish.EnableAll(False) ; #DEBUG_LINE_NO:391
    LC082.SetStage(CONST_LC082_DisableCF07TrafficManagerStage) ; #DEBUG_LINE_NO:392
  EndIf ; #DEBUG_LINE_NO:
  Self.InitAllCaptainEvents() ; #DEBUG_LINE_NO:396
  Int I = 0 ; #DEBUG_LINE_NO:399
  ObjectReference[] cfEnemyShips = CF_Enemies_All.GetArray() ; #DEBUG_LINE_NO:400
  While I < cfEnemyShips.Length ; #DEBUG_LINE_NO:401
    cfEnemyShips[I].SetValue(DockingPermission, CONST_DockingPermission_Never as Float) ; #DEBUG_LINE_NO:402
    I += 1 ; #DEBUG_LINE_NO:403
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:405
  ObjectReference[] sdEnemyShips = SD_Enemies_All.GetArray() ; #DEBUG_LINE_NO:406
  While I < sdEnemyShips.Length ; #DEBUG_LINE_NO:407
    sdEnemyShips[I].SetValue(DockingPermission, CONST_DockingPermission_Never as Float) ; #DEBUG_LINE_NO:408
    I += 1 ; #DEBUG_LINE_NO:409
  EndWhile ; #DEBUG_LINE_NO:
  questStartupFinished = True ; #DEBUG_LINE_NO:413
EndEvent

Function WaitForQuestStartup()
  Int failsafe = 0 ; #DEBUG_LINE_NO:417
  While !questStartupFinished && failsafe < CONST_WaitForQuestStartupFailsafeMax ; #DEBUG_LINE_NO:418
    failsafe += 1 ; #DEBUG_LINE_NO:419
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:420
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function InitAllCaptainEvents()
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip) ; #DEBUG_LINE_NO:427
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip) ; #DEBUG_LINE_NO:428
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip) ; #DEBUG_LINE_NO:429
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip) ; #DEBUG_LINE_NO:430
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip) ; #DEBUG_LINE_NO:431
  Self.InitCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip) ; #DEBUG_LINE_NO:432
EndFunction

Function InitCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainShip)
  spaceshipreference captainShipRef = captainShip.GetShipRef() ; #DEBUG_LINE_NO:436
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:437
    Self.SetStage(captainActiveStage) ; #DEBUG_LINE_NO:438
    CF_Captains_All.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:439
    captainShipRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:440
    captainShipRef.EnableNoWait(False) ; #DEBUG_LINE_NO:441
    captainShipRef.InstantDock(keyRef as ObjectReference) ; #DEBUG_LINE_NO:442
  Else ; #DEBUG_LINE_NO:
    captainShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip, None) ; #DEBUG_LINE_NO:451
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip, CF_Allies_Alpha) ; #DEBUG_LINE_NO:452
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip, None) ; #DEBUG_LINE_NO:453
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip, CF_Allies_Gamma) ; #DEBUG_LINE_NO:454
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip, CF_Allies_Beta) ; #DEBUG_LINE_NO:455
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:458
    Self.SetupCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip, None) ; #DEBUG_LINE_NO:459
  Else ; #DEBUG_LINE_NO:
    spaceshipreference naevaShip = CF_Captain_NaevaShip.GetShipRef() ; #DEBUG_LINE_NO:461
    naevaShip.DisableNoWait(False) ; #DEBUG_LINE_NO:462
    CF_Captains_All.RemoveRef(naevaShip as ObjectReference) ; #DEBUG_LINE_NO:463
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupCaptainEvent(Int captainState, Int captainActiveStage, ReferenceAlias captainShip, RefCollectionAlias cfAlliesCollection)
  spaceshipreference captainShipRef = captainShip.GetShipRef() ; #DEBUG_LINE_NO:468
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:469
    If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:470
      CF_Allies_All.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:471
      CF_Allies_Main.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:472
      IncidentalDialogueBlockedCollection.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:473
      captainShipRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:475
      If cfAlliesCollection != None ; #DEBUG_LINE_NO:476
        cfAlliesCollection.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:477
        CF_Allies_Main_Reinforcements.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:478
      EndIf ; #DEBUG_LINE_NO:
    ElseIf cfAlliesCollection != None && CF_Allies_Main_FallbackReinforcements.GetCount() > 0 ; #DEBUG_LINE_NO:481
      spaceshipreference nextFallback = CF_Allies_Main_FallbackReinforcements.GetAt(0) as spaceshipreference ; #DEBUG_LINE_NO:482
      CF_Allies_Main_FallbackReinforcements.RemoveRef(nextFallback as ObjectReference) ; #DEBUG_LINE_NO:483
      CF_Allies_All.AddRef(nextFallback as ObjectReference) ; #DEBUG_LINE_NO:484
      CF_Allies_Main.AddRef(nextFallback as ObjectReference) ; #DEBUG_LINE_NO:485
      CF_Allies_Main_Reinforcements.AddRef(nextFallback as ObjectReference) ; #DEBUG_LINE_NO:486
      IncidentalDialogueBlockedCollection.AddRef(nextFallback as ObjectReference) ; #DEBUG_LINE_NO:487
      nextFallback.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:489
    EndIf ; #DEBUG_LINE_NO:
  ElseIf captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:493
    captainShipRef.SetEssential(False) ; #DEBUG_LINE_NO:494
    SD_Enemies_All.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:495
    If cfAlliesCollection == None ; #DEBUG_LINE_NO:496
      SD_Enemies_Main.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:497
      captainShipRef.InstantUndock() ; #DEBUG_LINE_NO:498
      captainShipRef.MoveTo(captainShipRef.GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:499
    Else ; #DEBUG_LINE_NO:
      SD_Enemies_Main_Reinforcements_1.AddRef(captainShipRef as ObjectReference) ; #DEBUG_LINE_NO:501
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableAllCaptainShips()
  CF_Captain_RokovShip.TryToDisable() ; #DEBUG_LINE_NO:510
  CF_Captain_MathisShip.TryToDisable() ; #DEBUG_LINE_NO:511
  CF_Captain_AdlerShip.TryToDisable() ; #DEBUG_LINE_NO:512
  CF_Captain_HuanShip.TryToDisable() ; #DEBUG_LINE_NO:513
  CF_Captain_EstelleShip.TryToDisable() ; #DEBUG_LINE_NO:514
  CF_Captain_NaevaShip.TryToDisable() ; #DEBUG_LINE_NO:515
EndFunction

Function SetupDefensiveBatteries()
  Self.SetupDefensiveBattery(DefensiveBatteryAlpha.GetShipRef()) ; #DEBUG_LINE_NO:521
  Self.SetupDefensiveBattery(DefensiveBatteryBeta.GetShipRef()) ; #DEBUG_LINE_NO:522
  Self.SetupDefensiveBattery(DefensiveBatteryGamma.GetShipRef()) ; #DEBUG_LINE_NO:523
  If Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) ; #DEBUG_LINE_NO:527
    ObjectReference alphaHeadingRef = DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:528
    alphaHeadingRef.SetPosition(alphaHeadingRef.GetPositionX(), alphaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, alphaHeadingRef.GetPositionZ()) ; #DEBUG_LINE_NO:529
    ObjectReference betaHeadingRef = DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:530
    betaHeadingRef.SetPosition(betaHeadingRef.GetPositionX(), betaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, betaHeadingRef.GetPositionZ()) ; #DEBUG_LINE_NO:531
    ObjectReference gammaHeadingRef = DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:532
    gammaHeadingRef.SetPosition(gammaHeadingRef.GetPositionX(), gammaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance as Float, gammaHeadingRef.GetPositionZ()) ; #DEBUG_LINE_NO:533
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupDefensiveBattery(spaceshipreference battery)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:538
    battery.SetEssential(True) ; #DEBUG_LINE_NO:539
    battery.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:540
    battery.EnablePartRepair(ShipSystemShieldsHealth, False) ; #DEBUG_LINE_NO:541
    battery.EnablePartRepair(SpaceshipShieldPower, False) ; #DEBUG_LINE_NO:542
    battery.DamageValue(ShieldHealth, 10000.0) ; #DEBUG_LINE_NO:543
    battery.DamageValue(Health, 10000.0) ; #DEBUG_LINE_NO:545
  Else ; #DEBUG_LINE_NO:
    battery.SetEssential(False) ; #DEBUG_LINE_NO:547
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupKeyTurrets()
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:554
    CF_Allies_All.AddRefCollection(KeyTurrets) ; #DEBUG_LINE_NO:555
    CF_Allies_Main.AddRefCollection(KeyTurrets) ; #DEBUG_LINE_NO:556
  Else ; #DEBUG_LINE_NO:
    SD_Enemies_All.AddRefCollection(KeyTurrets) ; #DEBUG_LINE_NO:558
    SD_Enemies_Main.AddRefCollection(KeyTurrets) ; #DEBUG_LINE_NO:559
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function IgnoreAlliedFriendlyHits()
  RefCollectionAlias allyCollection = None ; #DEBUG_LINE_NO:566
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:567
    allyCollection = CF_Allies_All ; #DEBUG_LINE_NO:568
  Else ; #DEBUG_LINE_NO:
    allyCollection = SD_Allies_All ; #DEBUG_LINE_NO:570
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:572
  Int count = allyCollection.GetCount() ; #DEBUG_LINE_NO:573
  While I < count ; #DEBUG_LINE_NO:574
    (allyCollection.GetAt(I) as spaceshipreference).IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:576
    I += 1 ; #DEBUG_LINE_NO:577
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CleanupCF05JadeSwan()
  ObjectReference[] jadeSwanShips = PlayerShip.GetRef().FindAllReferencesWithKeyword(CF05_JadeSwanShipKeyword as Form, 100000.0) ; #DEBUG_LINE_NO:583
  Int I = 0 ; #DEBUG_LINE_NO:584
  While I < jadeSwanShips.Length ; #DEBUG_LINE_NO:585
    If jadeSwanShips[I].IsCreated() ; #DEBUG_LINE_NO:586
      jadeSwanShips[I].DisableNoWait(False) ; #DEBUG_LINE_NO:588
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:590
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForLoadScreenEvent()
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:596
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLocation, Location akNewLocation)
  If Self.GetStageDone(CONST_Stage_CF_Skip) || Self.GetStageDone(CONST_Stage_SD_Skip) ; #DEBUG_LINE_NO:606
     ; #DEBUG_LINE_NO:
  ElseIf !Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) && !Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) ; #DEBUG_LINE_NO:608
    If akNewLocation == KeySpaceCellLoc ; #DEBUG_LINE_NO:609
      Self.SetStage(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:610
    ElseIf akNewLocation == VigilanceSpaceCellLoc && CF_SysDefShutdown.GetValueInt() == 0 ; #DEBUG_LINE_NO:611
      Self.SetStage(CONST_Stage_SD_PlayerSidesWithSD) ; #DEBUG_LINE_NO:612
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akNewLocation == KeySpaceCellLoc ; #DEBUG_LINE_NO:615
    If Main_MusicOverrideActive ; #DEBUG_LINE_NO:616
      MUSGenesisCombatBoss_CF08SpaceBattle.Add() ; #DEBUG_LINE_NO:617
    ElseIf Self.GetStageDone(CONST_Stage_CF_MainReady) && !Self.GetStageDone(CONST_Stage_CF_StartMainDone) || Self.GetStageDone(CONST_Stage_SD_CompletedGammaSceneDone) && !Self.GetStageDone(CONST_Stage_SD_StartMainDone) ; #DEBUG_LINE_NO:618,619
      Self.Main_SetPlayerControlsEnabled(False) ; #DEBUG_LINE_NO:620
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Main_MusicOverrideActive ; #DEBUG_LINE_NO:
    MUSGenesisCombatBoss_CF08SpaceBattle.Remove() ; #DEBUG_LINE_NO:623
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If !abOpening ; #DEBUG_LINE_NO:628
    Location currentLocation = PlayerShip.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:629
    If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:630
      If currentLocation == DBAlphaSpaceCellLoc ; #DEBUG_LINE_NO:631
        Self.SetStage(CONST_Stage_CF_StartAlpha) ; #DEBUG_LINE_NO:632
      ElseIf currentLocation == DBBetaSpaceCellLoc ; #DEBUG_LINE_NO:633
        Self.SetStage(CONST_Stage_CF_StartBeta) ; #DEBUG_LINE_NO:634
      ElseIf currentLocation == DBGammaSpaceCellLoc ; #DEBUG_LINE_NO:635
        Self.SetStage(CONST_Stage_CF_StartGamma) ; #DEBUG_LINE_NO:636
      ElseIf currentLocation == KeySpaceCellLoc && Self.GetStageDone(CONST_Stage_CF_MainReady) ; #DEBUG_LINE_NO:637
        Self.CleanupCF05JadeSwan() ; #DEBUG_LINE_NO:638
        Self.SetStage(CONST_Stage_CF_StartMain) ; #DEBUG_LINE_NO:639
        Self.UnregisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:640
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currentLocation == DBAlphaSpaceCellLoc ; #DEBUG_LINE_NO:643
      Self.SetStage(CONST_Stage_SD_StartAlpha) ; #DEBUG_LINE_NO:644
    ElseIf currentLocation == DBBetaSpaceCellLoc ; #DEBUG_LINE_NO:645
      Self.SetStage(CONST_Stage_SD_StartBeta) ; #DEBUG_LINE_NO:646
    ElseIf currentLocation == DBGammaSpaceCellLoc ; #DEBUG_LINE_NO:647
      Self.SetStage(CONST_Stage_SD_StartGamma) ; #DEBUG_LINE_NO:648
    ElseIf currentLocation == KeySpaceCellLoc ; #DEBUG_LINE_NO:649
      Self.CleanupCF05JadeSwan() ; #DEBUG_LINE_NO:650
      Self.SetStage(CONST_Stage_SD_StartMain) ; #DEBUG_LINE_NO:651
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:652
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int timerID)
  If timerID == CONST_VigilanceInvulnerableSceneTimerID ; #DEBUG_LINE_NO:659
    Self.SetStage(CONST_Stage_CF_VigilanceInvulnerable) ; #DEBUG_LINE_NO:660
  ElseIf timerID == CONST_VigilanceInvulnerableMessageTimerID ; #DEBUG_LINE_NO:661
    If !Self.GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance) ; #DEBUG_LINE_NO:662
      Self.RegisterForHitEvent(vigilanceRef as ScriptObject, playerRef as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:663
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSource, ObjectReference akSenderRef, ObjectReference akKiller)
  Self.Main_CheckForReinforcements(akSenderRef) ; #DEBUG_LINE_NO:669
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If akParent == vigilanceRef && !abComplete && Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:673
    Self.SetStage(CONST_Stage_CF_DockedWithVigilance) ; #DEBUG_LINE_NO:674
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:675
  ElseIf akParent == keyRef && !abComplete && Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) ; #DEBUG_LINE_NO:676
    Self.SetStage(CONST_Stage_SD_DockedWithKey) ; #DEBUG_LINE_NO:677
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:678
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If akParent == vigilanceRef && abComplete && (Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) || Self.GetStageDone(CONST_Stage_CF_Skip)) && LC088_Vigilance.GetStageDone(CONST_LC088VigilanceStage_Complete) ; #DEBUG_LINE_NO:683
    Self.SetStage(CONST_Stage_CF_UndockedWithVigilanceAfterCompleting) ; #DEBUG_LINE_NO:684
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:685
  ElseIf akParent == keyRef && abComplete && (Self.GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) || Self.GetStageDone(CONST_Stage_SD_Skip)) && LC088_Key.GetStageDone(CONST_LC088KeyStage_Complete) ; #DEBUG_LINE_NO:686
    Self.SetStage(CONST_Stage_SD_UndockedWithKeyAfterCompleting) ; #DEBUG_LINE_NO:687
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:688
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False ; #DEBUG_LINE_NO:694
EndEvent

Function PlaySpaceScene(Scene sceneToPlay)
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:704
    If currentSpaceScene != None ; #DEBUG_LINE_NO:705
      currentSpaceScene.Stop() ; #DEBUG_LINE_NO:706
    EndIf ; #DEBUG_LINE_NO:
    currentSpaceScene = sceneToPlay ; #DEBUG_LINE_NO:708
    currentSpaceScene.Start() ; #DEBUG_LINE_NO:709
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function UnblockIncidentalDialogue(Int encounterID)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:714
    If encounterID == CONST_EncounterID_Skirmish ; #DEBUG_LINE_NO:715
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Skirmish) ; #DEBUG_LINE_NO:716
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Skirmish) ; #DEBUG_LINE_NO:717
    ElseIf encounterID == CONST_EncounterID_Alpha ; #DEBUG_LINE_NO:718
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Alpha) ; #DEBUG_LINE_NO:719
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Alpha) ; #DEBUG_LINE_NO:720
    ElseIf encounterID == CONST_EncounterID_Beta ; #DEBUG_LINE_NO:721
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Beta) ; #DEBUG_LINE_NO:722
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Beta) ; #DEBUG_LINE_NO:723
    ElseIf encounterID == CONST_EncounterID_Gamma ; #DEBUG_LINE_NO:724
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Gamma) ; #DEBUG_LINE_NO:725
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Gamma) ; #DEBUG_LINE_NO:726
    ElseIf encounterID == CONST_EncounterID_Main ; #DEBUG_LINE_NO:727
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Main) ; #DEBUG_LINE_NO:728
      IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Main) ; #DEBUG_LINE_NO:729
    EndIf ; #DEBUG_LINE_NO:
  ElseIf encounterID == CONST_EncounterID_Skirmish ; #DEBUG_LINE_NO:732
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Skirmish) ; #DEBUG_LINE_NO:733
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Skirmish) ; #DEBUG_LINE_NO:734
  ElseIf encounterID == CONST_EncounterID_Alpha ; #DEBUG_LINE_NO:735
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Alpha) ; #DEBUG_LINE_NO:736
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Alpha) ; #DEBUG_LINE_NO:737
  ElseIf encounterID == CONST_EncounterID_Beta ; #DEBUG_LINE_NO:738
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Beta) ; #DEBUG_LINE_NO:739
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Beta) ; #DEBUG_LINE_NO:740
  ElseIf encounterID == CONST_EncounterID_Gamma ; #DEBUG_LINE_NO:741
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Gamma) ; #DEBUG_LINE_NO:742
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Gamma) ; #DEBUG_LINE_NO:743
  ElseIf encounterID == CONST_EncounterID_Main ; #DEBUG_LINE_NO:744
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Main_SysDefFleet) ; #DEBUG_LINE_NO:745
    IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Main) ; #DEBUG_LINE_NO:746
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Main_SetPlayerControlsEnabled(Bool enableControls)
  If LC088SpaceEnableLayer == None ; #DEBUG_LINE_NO:753
    LC088SpaceEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:754
  EndIf ; #DEBUG_LINE_NO:
  LC088SpaceEnableLayer.EnableMovement(enableControls) ; #DEBUG_LINE_NO:756
  LC088SpaceEnableLayer.EnableFighting(enableControls) ; #DEBUG_LINE_NO:757
EndFunction

Function Main_EVPAllNoWait(Bool shouldStopCombat)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:761
  akArgs[0] = shouldStopCombat as Var ; #DEBUG_LINE_NO:762
  Self.CallFunctionNoWait("Main_EVPAll", akArgs) ; #DEBUG_LINE_NO:763
EndFunction

Function Main_EVPAll(Bool shouldStopCombat)
  Vigilance.TryToEvaluatePackage() ; #DEBUG_LINE_NO:767
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:768
    Self.Main_EVPAllCollection(CF_Allies_Main, shouldStopCombat) ; #DEBUG_LINE_NO:769
    Self.Main_EVPAllCollection(CF_Enemies_Main, shouldStopCombat) ; #DEBUG_LINE_NO:770
  Else ; #DEBUG_LINE_NO:
    Self.Main_EVPAllCollection(SD_Allies_Group, shouldStopCombat) ; #DEBUG_LINE_NO:772
    Self.Main_EVPAllCollection(SD_Allies_Main_SysDefFleet, shouldStopCombat) ; #DEBUG_LINE_NO:773
    Self.Main_EVPAllCollection(SD_Enemies_Main, shouldStopCombat) ; #DEBUG_LINE_NO:774
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Main_EVPAllCollection(RefCollectionAlias refCol, Bool shouldStopCombat)
  spaceshipreference[] refColShips = refCol.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:779
  Int I = 0 ; #DEBUG_LINE_NO:780
  While I < refColShips.Length ; #DEBUG_LINE_NO:781
    If !refColShips[I].IsDisabled() ; #DEBUG_LINE_NO:782
      If shouldStopCombat ; #DEBUG_LINE_NO:783
        refColShips[I].StopCombat() ; #DEBUG_LINE_NO:784
      EndIf ; #DEBUG_LINE_NO:
      refColShips[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:786
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:788
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Main_SetMusicOverrideActive(Bool shouldBeActive)
  Main_MusicOverrideActive = shouldBeActive ; #DEBUG_LINE_NO:793
  If Main_MusicOverrideActive ; #DEBUG_LINE_NO:794
    MUSGenesisCombatBoss_CF08SpaceBattle.Add() ; #DEBUG_LINE_NO:795
  Else ; #DEBUG_LINE_NO:
    MUSGenesisCombatBoss_CF08SpaceBattle.Remove() ; #DEBUG_LINE_NO:797
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Main_FormCFBattleLine()
  spaceshipreference[] mainShips = None ; #DEBUG_LINE_NO:803
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:804
    mainShips = CF_Allies_Main.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:805
  Else ; #DEBUG_LINE_NO:
    mainShips = SD_Enemies_Main.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:807
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:809
  While I < mainShips.Length ; #DEBUG_LINE_NO:810
    If KeyTurrets.Find(mainShips[I] as ObjectReference) < 0 ; #DEBUG_LINE_NO:811
      ObjectReference battleLinePosition = mainShips[I].GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword) ; #DEBUG_LINE_NO:812
      If battleLinePosition != None ; #DEBUG_LINE_NO:813
        mainShips[I].Enable(False) ; #DEBUG_LINE_NO:814
        mainShips[I].InstantUndock() ; #DEBUG_LINE_NO:815
        mainShips[I].MoveTo(battleLinePosition, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:816
        mainShips[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:817
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:820
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Main_EnableSDFleet(RefCollectionAlias SDFleetCollection)
  vigilanceRef.Disable(False) ; #DEBUG_LINE_NO:826
  vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:827
  spaceshipreference[] SDFleetRefs = SDFleetCollection.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:829
  Int I = 0 ; #DEBUG_LINE_NO:830
  While I < SDFleetRefs.Length ; #DEBUG_LINE_NO:831
    SDFleetRefs[I].EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:832
    Utility.Wait(Utility.RandomFloat(CONST_SDFleetEnableDelayMin, CONST_SDFleetEnableDelayMax)) ; #DEBUG_LINE_NO:833
    I += 1 ; #DEBUG_LINE_NO:834
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(CONST_SDFleetEnableDelayVigilance) ; #DEBUG_LINE_NO:837
  Self.Main_EnableVigilance() ; #DEBUG_LINE_NO:838
EndFunction

Function Main_EnableVigilance()
  vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:842
  vigilanceRef.EnableWithGravJump() ; #DEBUG_LINE_NO:843
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:844
    Self.StartTimer(0.0, CONST_VigilanceInvulnerableMessageTimerID) ; #DEBUG_LINE_NO:845
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If !Self.GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance) ; #DEBUG_LINE_NO:851
    LC088_Space_VigilanceShieldsImpenetrableMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:852
    Self.StartTimer(CONST_VigilanceInvulnerableMessageTimerDelay as Float, CONST_VigilanceInvulnerableMessageTimerID) ; #DEBUG_LINE_NO:853
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Main_CheckForReinforcements(ObjectReference killedShip)
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:858
    If CF_Enemies_Main.Find(killedShip) >= 0 ; #DEBUG_LINE_NO:859
      CF_Enemies_Main.RemoveRef(killedShip) ; #DEBUG_LINE_NO:860
      LC088SpaceMainEnemiesKilled.Mod(1.0) ; #DEBUG_LINE_NO:861
    EndIf ; #DEBUG_LINE_NO:
    Guard ReinforcementsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:863
      If Main_ReinforcementWavesTriggered == 0 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_1 ; #DEBUG_LINE_NO:864
        Main_ReinforcementWavesTriggered = 1 ; #DEBUG_LINE_NO:865
        Self.SetStage(CONST_Stage_CF_Reinforcements1) ; #DEBUG_LINE_NO:866
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 1 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_2 ; #DEBUG_LINE_NO:868
        Main_ReinforcementWavesTriggered = 2 ; #DEBUG_LINE_NO:869
        Self.SetStage(CONST_Stage_CF_Reinforcements2) ; #DEBUG_LINE_NO:870
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 2 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_3 ; #DEBUG_LINE_NO:872
        Main_ReinforcementWavesTriggered = 3 ; #DEBUG_LINE_NO:873
        Self.SetStage(CONST_Stage_CF_Reinforcements3) ; #DEBUG_LINE_NO:874
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 3 && LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_AllEnemiesDefeatedCount_4 ; #DEBUG_LINE_NO:876
        Main_ReinforcementWavesTriggered = 4 ; #DEBUG_LINE_NO:877
        Self.SetStage(CONST_Stage_CF_AllEscortsDefeated) ; #DEBUG_LINE_NO:878
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If SD_Enemies_Main.Find(killedShip) >= 0 ; #DEBUG_LINE_NO:882
      SD_Enemies_Main.RemoveRef(killedShip) ; #DEBUG_LINE_NO:883
      LC088SpaceMainEnemiesKilled.Mod(1.0) ; #DEBUG_LINE_NO:884
    EndIf ; #DEBUG_LINE_NO:
    Guard ReinforcementsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:886
      If Main_ReinforcementWavesTriggered == 0 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_1 ; #DEBUG_LINE_NO:887
        Main_ReinforcementWavesTriggered = 1 ; #DEBUG_LINE_NO:888
        Self.Main_TriggerReinforcements(1) ; #DEBUG_LINE_NO:889
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 1 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_2 ; #DEBUG_LINE_NO:891
        Main_ReinforcementWavesTriggered = 2 ; #DEBUG_LINE_NO:892
        Self.Main_TriggerReinforcements(2) ; #DEBUG_LINE_NO:893
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 2 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_3 ; #DEBUG_LINE_NO:895
        Main_ReinforcementWavesTriggered = 3 ; #DEBUG_LINE_NO:896
        Self.SetStage(CONST_Stage_SD_Reinforcements3) ; #DEBUG_LINE_NO:897
      EndIf ; #DEBUG_LINE_NO:
      If Main_ReinforcementWavesTriggered == 3 && LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_AllEnemiesDefeatedCount_4 ; #DEBUG_LINE_NO:899
        Main_ReinforcementWavesTriggered = 4 ; #DEBUG_LINE_NO:900
        Self.SetStage(CONST_Stage_SD_MainBattleCompleted) ; #DEBUG_LINE_NO:901
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Main_TriggerReinforcements(Int wave)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:908
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:909
    If wave == 1 ; #DEBUG_LINE_NO:910
      CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_1) ; #DEBUG_LINE_NO:911
      Self.CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_1, vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:912
    ElseIf wave == 2 ; #DEBUG_LINE_NO:913
      Self.CF_EnableAllyReinforcementsMain(CF_Allies_Main_Reinforcements, vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:914
    ElseIf wave == 3 ; #DEBUG_LINE_NO:915
      CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_2) ; #DEBUG_LINE_NO:916
      Self.CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_2, vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:917
    EndIf ; #DEBUG_LINE_NO:
  ElseIf wave == 1 ; #DEBUG_LINE_NO:920
    SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_1) ; #DEBUG_LINE_NO:921
    Self.SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_1) ; #DEBUG_LINE_NO:922
  ElseIf wave == 2 ; #DEBUG_LINE_NO:923
    SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_2) ; #DEBUG_LINE_NO:924
    Self.SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_2) ; #DEBUG_LINE_NO:925
  ElseIf wave == 3 ; #DEBUG_LINE_NO:926
    Self.Main_EnableSDFleet(SD_Allies_Main_SysDefFleet) ; #DEBUG_LINE_NO:927
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CF_EnableAllyReinforcementsBattery(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:938
  spaceshipreference captainShip = reinforcementShips[reinforcementShips.Length - 1] ; #DEBUG_LINE_NO:939
  captainShip.Disable(False) ; #DEBUG_LINE_NO:941
  Self.CF_EnableReinforcement(captainShip, fallbackRef, True) ; #DEBUG_LINE_NO:942
  Int I = 0 ; #DEBUG_LINE_NO:944
  While I < reinforcementShips.Length - 1 ; #DEBUG_LINE_NO:945
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, False) ; #DEBUG_LINE_NO:946
    I += 1 ; #DEBUG_LINE_NO:947
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:949
EndFunction

Function CF_EnableEnemyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:953
  Int I = 0 ; #DEBUG_LINE_NO:954
  While I < reinforcementShips.Length ; #DEBUG_LINE_NO:955
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, False) ; #DEBUG_LINE_NO:956
    I += 1 ; #DEBUG_LINE_NO:957
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CF_EnableAllyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
  spaceshipreference[] reinforcementShips = reinforcements.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:962
  Int I = 0 ; #DEBUG_LINE_NO:963
  While I < reinforcementShips.Length ; #DEBUG_LINE_NO:964
    reinforcementShips[I].Disable(False) ; #DEBUG_LINE_NO:965
    reinforcementShips[I].RestoreValue(Health, reinforcementShips[I].GetBaseValue(Health) / 2.0) ; #DEBUG_LINE_NO:966
    Self.CF_EnableReinforcement(reinforcementShips[I], fallbackRef, True) ; #DEBUG_LINE_NO:967
    I += 1 ; #DEBUG_LINE_NO:968
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CF_EnableReinforcement(spaceshipreference ship, ObjectReference fallbackRef, Bool shouldWaitForJump)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:974
  If playerShipRef.GetCurrentLocation() == fallbackRef.GetCurrentLocation() || (playerShipRef.GetDistance(fallbackRef) < CONST_ReinforcementMaxDistanceFromFallback as Float) ; #DEBUG_LINE_NO:975
    ship.MoveNear(playerShipRef as ObjectReference, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge) ; #DEBUG_LINE_NO:976
  Else ; #DEBUG_LINE_NO:
    ship.MoveNear(fallbackRef, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge) ; #DEBUG_LINE_NO:979
  EndIf ; #DEBUG_LINE_NO:
  If shouldWaitForJump ; #DEBUG_LINE_NO:982
    ship.EnableWithGravJump() ; #DEBUG_LINE_NO:983
  Else ; #DEBUG_LINE_NO:
    ship.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:985
  EndIf ; #DEBUG_LINE_NO:
  ship.SetForwardVelocity(CONST_ReinforcementForwardVelocityPercent) ; #DEBUG_LINE_NO:987
EndFunction

Function CF_RestoreDefensiveBattery(spaceshipreference batteryToRestore)
  (batteryToRestore as lc088_defensivebatteryscript).RegenBattery() ; #DEBUG_LINE_NO:992
EndFunction

Function CF_Main_ReadyForVigilanceInvulnerableScene()
  Self.StartTimer(CONST_VigilanceInvulnerableSceneWaitDelay, CONST_VigilanceInvulnerableSceneTimerID) ; #DEBUG_LINE_NO:997
EndFunction

Function CF_Main_FireBatteriesAtVigilance()
  If LC088_Space_UseNewDefensiveBatteryFireVFX.GetValue() > 0.0 ; #DEBUG_LINE_NO:1002
    LC088_Space_DefensiveBatteriesFireOnVigilance.Play(vigilanceRef as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:1003
  Else ; #DEBUG_LINE_NO:
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryAlphaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:1005
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryBetaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:1006
    LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryGammaProjectileSourceMarker.GetRef(), vigilanceRef as ObjectReference) ; #DEBUG_LINE_NO:1007
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CF_Main_RemoveVigilanceInvulnerability()
  Utility.Wait(LC088_Space_DefensiveBatteryFireToShieldDegenDelay.GetValue()) ; #DEBUG_LINE_NO:1012
  vigilanceRef.AddPerk(LC088_Space_VigilanceDamageReductionPerk, False) ; #DEBUG_LINE_NO:1013
  Int I = 0 ; #DEBUG_LINE_NO:1014
  While I < CONST_VigilanceShieldDamageIncrements ; #DEBUG_LINE_NO:1015
    vigilanceRef.DamageValue(ShieldHealth, CONST_VigilanceShieldDamagePerIncrement as Float) ; #DEBUG_LINE_NO:1016
    Utility.Wait(CONST_VigilanceShieldDamageDelayPerIncrement) ; #DEBUG_LINE_NO:1017
    I += 1 ; #DEBUG_LINE_NO:1018
  EndWhile ; #DEBUG_LINE_NO:
  vigilanceRef.DamageValue(ShipSystemShieldsHealth, CONST_VigilanceShieldSystemMaxDamage as Float) ; #DEBUG_LINE_NO:1020
  vigilanceRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk) ; #DEBUG_LINE_NO:1021
  vigilanceRef.RemoveKeyword(DisallowAsCombatTargetKeyword) ; #DEBUG_LINE_NO:1022
EndFunction

Function CF_Main_StartDockingWithVigilance()
  Int vigilanceDockingCount = 1 ; #DEBUG_LINE_NO:1034
  Int I = 0 ; #DEBUG_LINE_NO:1035
  While I < CF_Captains_All.GetCount() && vigilanceDockingCount < CONST_VigilanceDockingLimit ; #DEBUG_LINE_NO:1036
    spaceshipreference current = CF_Captains_All.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:1037
    If current.GetLinkedRef(LC088_Space_CF_CaptainsDockingLinkToVigilance) == None ; #DEBUG_LINE_NO:1038
      current.SetLinkedRef(vigilanceRef as ObjectReference, LC088_Space_CF_CaptainsDockingLinkToVigilance, True) ; #DEBUG_LINE_NO:1039
      vigilanceDockingCount += 1 ; #DEBUG_LINE_NO:1040
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1042
  EndWhile ; #DEBUG_LINE_NO:
  CF_Captains_All.EvaluateAll() ; #DEBUG_LINE_NO:1044
EndFunction

Function SD_SetupMainEnemyReinforcements()
  Self.SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_1) ; #DEBUG_LINE_NO:1054
  Self.SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_2) ; #DEBUG_LINE_NO:1055
EndFunction

Function SD_SetupMainEnemyReinforcementsCollection(RefCollectionAlias reinforcementCol)
  spaceshipreference[] reinforcementShipRefs = reinforcementCol.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1059
  Int I = 0 ; #DEBUG_LINE_NO:1060
  While I < reinforcementShipRefs.Length ; #DEBUG_LINE_NO:1061
    spaceshipreference currentShip = reinforcementShipRefs[I] ; #DEBUG_LINE_NO:1062
    currentShip.AddKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword) ; #DEBUG_LINE_NO:1063
    currentShip.SetValue(HideShipFromHUDValue, 1.0) ; #DEBUG_LINE_NO:1064
    currentShip.EvaluatePackage(False) ; #DEBUG_LINE_NO:1065
    currentShip.InstantDock(keyRef as ObjectReference) ; #DEBUG_LINE_NO:1066
    I += 1 ; #DEBUG_LINE_NO:1068
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SD_SetupAllyGroup()
  spaceshipreference toftShipRef = SD_ToftShip.GetShipRef() ; #DEBUG_LINE_NO:1075
  toftShipRef.SetEssential(True) ; #DEBUG_LINE_NO:1076
  SD_Allies_All.AddRef(toftShipRef as ObjectReference) ; #DEBUG_LINE_NO:1077
  SD_Allies_Group.AddRef(toftShipRef as ObjectReference) ; #DEBUG_LINE_NO:1078
  spaceshipreference archangelShipRef = SD_ArchangelShip.GetShipRef() ; #DEBUG_LINE_NO:1080
  archangelShipRef.SetEssential(True) ; #DEBUG_LINE_NO:1081
  SD_Allies_All.AddRef(archangelShipRef as ObjectReference) ; #DEBUG_LINE_NO:1082
  SD_Allies_Group.AddRef(archangelShipRef as ObjectReference) ; #DEBUG_LINE_NO:1083
  SD_Allies_Group.AddRefCollection(SD_Allies_Alpha) ; #DEBUG_LINE_NO:1085
EndFunction

Function SD_UpdateAndMoveAllyGroup(Int encounterID)
  If encounterID == CONST_EncounterID_Alpha ; #DEBUG_LINE_NO:1090
    Self.SD_MoveAllyGroup(SD_Alpha_ArrivalPointMarkerChainHead.GetRef(), encounterID) ; #DEBUG_LINE_NO:1092
  ElseIf encounterID == CONST_EncounterID_Beta ; #DEBUG_LINE_NO:1093
    Self.SD_CleanupAllyGroup() ; #DEBUG_LINE_NO:1094
    Self.SD_MoveAllyGroup(SD_Beta_ArrivalPointMarkerChainHead.GetRef(), encounterID) ; #DEBUG_LINE_NO:1096
  ElseIf encounterID == CONST_EncounterID_Gamma ; #DEBUG_LINE_NO:1097
    Self.SD_CleanupAllyGroup() ; #DEBUG_LINE_NO:1098
    Self.SD_UpdateAllyGroup(SD_Allies_Beta, CONST_SDAlliesMax_Gamma) ; #DEBUG_LINE_NO:1099
    Self.SD_MoveAllyGroup(SD_Gamma_ArrivalPointMarkerChainHead.GetRef(), encounterID) ; #DEBUG_LINE_NO:1100
  ElseIf encounterID == CONST_EncounterID_Main ; #DEBUG_LINE_NO:1101
    Self.SD_CleanupAllyGroup() ; #DEBUG_LINE_NO:1102
    Self.SD_UpdateAllyGroup(SD_Allies_Gamma, CONST_SDAlliesMax_Main) ; #DEBUG_LINE_NO:1103
    Self.SD_MoveAllyGroup(SD_Main_ArrivalPointMarkerChainHead.GetRef(), encounterID) ; #DEBUG_LINE_NO:1104
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SD_CleanupAllyGroup()
  spaceshipreference[] allyGroupRefs = SD_Allies_Group.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1112
  Int I = 0 ; #DEBUG_LINE_NO:1113
  While I < allyGroupRefs.Length ; #DEBUG_LINE_NO:1114
    spaceshipreference currentShip = allyGroupRefs[I] ; #DEBUG_LINE_NO:1115
    If currentShip.IsDead() ; #DEBUG_LINE_NO:1116
      SD_Allies_Group.RemoveRef(currentShip as ObjectReference) ; #DEBUG_LINE_NO:1117
    Else ; #DEBUG_LINE_NO:
      currentShip.DisableNoWait(False) ; #DEBUG_LINE_NO:1120
      If currentShip.IsEssential(True) ; #DEBUG_LINE_NO:1121
        Float currentHealth = currentShip.GetValue(Health) ; #DEBUG_LINE_NO:1122
        Float minHealth = currentShip.GetBaseValue(Health) / 2.0 ; #DEBUG_LINE_NO:1123
        If currentHealth < minHealth ; #DEBUG_LINE_NO:1124
          currentShip.RestoreValue(Health, minHealth - currentHealth) ; #DEBUG_LINE_NO:1125
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1129
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SD_UpdateAllyGroup(RefCollectionAlias refCollectionToAdd, Int maxAllies)
  spaceshipreference[] newAllyRefs = refCollectionToAdd.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1137
  Int alliesInGroup = SD_Allies_Group.GetCount() ; #DEBUG_LINE_NO:1138
  Int I = 0 ; #DEBUG_LINE_NO:1139
  While alliesInGroup < maxAllies && I < newAllyRefs.Length ; #DEBUG_LINE_NO:1140
    spaceshipreference currentShip = newAllyRefs[I] ; #DEBUG_LINE_NO:1141
    If !currentShip.IsDead() && !currentShip.IsDisabled() ; #DEBUG_LINE_NO:1142
      SD_Allies_Group.AddRef(currentShip as ObjectReference) ; #DEBUG_LINE_NO:1143
      alliesInGroup += 1 ; #DEBUG_LINE_NO:1144
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1147
  EndWhile ; #DEBUG_LINE_NO:
  While I < newAllyRefs.Length ; #DEBUG_LINE_NO:1149
    newAllyRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:1150
    I += 1 ; #DEBUG_LINE_NO:1152
  EndWhile ; #DEBUG_LINE_NO:
  IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_Group) ; #DEBUG_LINE_NO:1154
EndFunction

Function SD_MoveAllyGroup(ObjectReference allyMoveToMarker, Int encounterID)
  Int offsetForwardShift = 0 ; #DEBUG_LINE_NO:1159
  If encounterID == CONST_EncounterID_Main ; #DEBUG_LINE_NO:1160
    offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Main ; #DEBUG_LINE_NO:1161
  Else ; #DEBUG_LINE_NO:
    offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Batteries ; #DEBUG_LINE_NO:1163
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference toftShipRef = SD_ToftShip.GetShipRef() ; #DEBUG_LINE_NO:1165
  spaceshipreference[] allyGroupRefs = SD_Allies_Group.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1166
  ObjectReference nextAllyMoveToMarker = allyMoveToMarker.GetLinkedRef(None) ; #DEBUG_LINE_NO:1167
  Float[] offsetValues = new Float[3] ; #DEBUG_LINE_NO:1168
  ObjectReference playerMarker = PlayerShip.GetRef().PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:1169
  Int I = 0 ; #DEBUG_LINE_NO:1170
  While I < allyGroupRefs.Length && nextAllyMoveToMarker != None ; #DEBUG_LINE_NO:1171
    offsetValues[0] = nextAllyMoveToMarker.GetPositionX() - playerMarker.GetPositionX() ; #DEBUG_LINE_NO:1172
    offsetValues[1] = nextAllyMoveToMarker.GetPositionY() - playerMarker.GetPositionY() + offsetForwardShift as Float ; #DEBUG_LINE_NO:1173
    offsetValues[2] = nextAllyMoveToMarker.GetPositionZ() - playerMarker.GetPositionZ() ; #DEBUG_LINE_NO:1174
    ObjectReference jumpMarker = playerMarker.PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, offsetValues, None, True) ; #DEBUG_LINE_NO:1175
    spaceshipreference currentShip = allyGroupRefs[I] ; #DEBUG_LINE_NO:1176
    currentShip.MoveTo(jumpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1177
    If currentShip != toftShipRef ; #DEBUG_LINE_NO:1178
      currentShip.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:1179
      currentShip.EvaluatePackage(False) ; #DEBUG_LINE_NO:1180
    EndIf ; #DEBUG_LINE_NO:
    nextAllyMoveToMarker = nextAllyMoveToMarker.GetLinkedRef(None) ; #DEBUG_LINE_NO:1183
    jumpMarker.Delete() ; #DEBUG_LINE_NO:1184
    I += 1 ; #DEBUG_LINE_NO:1185
  EndWhile ; #DEBUG_LINE_NO:
  toftShipRef.EnableWithGravJump() ; #DEBUG_LINE_NO:1187
  toftShipRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:1188
  playerMarker.Delete() ; #DEBUG_LINE_NO:1189
EndFunction

Function SD_PlayBatteryDestroyedScene(Int encounterID)
  SD_LastBatteryDestroyedID = encounterID ; #DEBUG_LINE_NO:1194
  spaceshipreference[] speakerRefCol = None ; #DEBUG_LINE_NO:1195
  If encounterID == CONST_EncounterID_Alpha ; #DEBUG_LINE_NO:1196
    speakerRefCol = SD_Enemies_Alpha.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1197
  ElseIf encounterID == CONST_EncounterID_Beta ; #DEBUG_LINE_NO:1198
    speakerRefCol = SD_Enemies_Beta.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1199
  ElseIf encounterID == CONST_EncounterID_Gamma ; #DEBUG_LINE_NO:1200
    speakerRefCol = SD_Enemies_Gamma.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1201
  EndIf ; #DEBUG_LINE_NO:
  Bool foundBatteryDestroyedSpeaker = False ; #DEBUG_LINE_NO:1203
  Int I = 0 ; #DEBUG_LINE_NO:1204
  While !foundBatteryDestroyedSpeaker && I < speakerRefCol.Length ; #DEBUG_LINE_NO:1205
    spaceshipreference currentShip = speakerRefCol[I] ; #DEBUG_LINE_NO:1206
    If !currentShip.IsDead() ; #DEBUG_LINE_NO:1207
      foundBatteryDestroyedSpeaker = True ; #DEBUG_LINE_NO:1208
      SD_BatteryDestroyedSpeaker.ForceRefTo(currentShip as ObjectReference) ; #DEBUG_LINE_NO:1209
      Self.PlaySpaceScene(LC088_Space_SD_225_BatteryDestroyed) ; #DEBUG_LINE_NO:1210
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1212
  EndWhile ; #DEBUG_LINE_NO:
  If !foundBatteryDestroyedSpeaker ; #DEBUG_LINE_NO:1214
    Self.SD_PlayBatteryPhaseCompleteScene(encounterID) ; #DEBUG_LINE_NO:1215
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SD_PlayBatteryPhaseCompleteScene(Int encounterID)
  If encounterID == -1 ; #DEBUG_LINE_NO:1222
    encounterID = SD_LastBatteryDestroyedID ; #DEBUG_LINE_NO:1223
  EndIf ; #DEBUG_LINE_NO:
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1225
    If encounterID == 1 && !Self.GetStageDone(CONST_Stage_SD_CompletedAlpha) || encounterID == 2 && !Self.GetStageDone(CONST_Stage_SD_CompletedBeta) || encounterID == 3 && !Self.GetStageDone(CONST_Stage_SD_CompletedGamma) ; #DEBUG_LINE_NO:1226,1227,1228
      Self.PlaySpaceScene(LC088_Space_SD_226_BatteryPhaseComplete) ; #DEBUG_LINE_NO:1229
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function SD_CalculateMainBattleCounts()
  Int totalEnemyCount = SD_Enemies_Main.GetCount() + SD_Enemies_Main_Reinforcements_1.GetCount() + SD_Enemies_Main_Reinforcements_2.GetCount() ; #DEBUG_LINE_NO:1236
  SD_Main_ReinforcementTriggerCount_1 = SD_Enemies_Main.GetCount() / 3 ; #DEBUG_LINE_NO:1237
  SD_Main_ReinforcementTriggerCount_2 = Math.Min(totalEnemyCount as Float, (SD_Main_ReinforcementTriggerCount_1 + SD_Enemies_Main_Reinforcements_1.GetCount() / 2 + 1) as Float) as Int ; #DEBUG_LINE_NO:1238
  SD_Main_ReinforcementTriggerCount_3 = Math.Min(totalEnemyCount as Float, (SD_Main_ReinforcementTriggerCount_2 + SD_Enemies_Main_Reinforcements_2.GetCount() / 2 + 1) as Float) as Int ; #DEBUG_LINE_NO:1239
  SD_Main_AllEnemiesDefeatedCount_4 = totalEnemyCount ; #DEBUG_LINE_NO:1240
EndFunction

Function SD_UndockReinforcements(RefCollectionAlias reinforcementShips)
  spaceshipreference[] reinforcementShipRefs = reinforcementShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1247
  Int I = 0 ; #DEBUG_LINE_NO:1248
  While I < reinforcementShipRefs.Length ; #DEBUG_LINE_NO:1249
    spaceshipreference currentShip = reinforcementShipRefs[I] ; #DEBUG_LINE_NO:1250
    currentShip.RemoveKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword) ; #DEBUG_LINE_NO:1251
    currentShip.SetValue(HideShipFromHUDValue, 0.0) ; #DEBUG_LINE_NO:1252
    currentShip.EvaluatePackage(False) ; #DEBUG_LINE_NO:1253
    I += 1 ; #DEBUG_LINE_NO:1255
    If I < reinforcementShipRefs.Length ; #DEBUG_LINE_NO:1256
      Utility.Wait(Utility.RandomFloat(CONST_SDEnemiesMainDelay_Min, CONST_SDEnemiesMainDelay_Max)) ; #DEBUG_LINE_NO:1257
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SD_SwitchKeyToSDDocking()
  keyRef.RemoveFromFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:1264
  keyRef.AddToFaction(UCSysDefFaction) ; #DEBUG_LINE_NO:1265
EndFunction

Function SD_DisableAllyLeaderShips()
  SD_ToftShip.TryToDisable() ; #DEBUG_LINE_NO:1270
  SD_ArchangelShip.TryToDisable() ; #DEBUG_LINE_NO:1271
EndFunction

Function Cleanup()
  playerRef = None ; #DEBUG_LINE_NO:1280
  keyRef = None ; #DEBUG_LINE_NO:1281
  vigilanceRef = None ; #DEBUG_LINE_NO:1282
  KeySpaceCellLoc = None ; #DEBUG_LINE_NO:1283
  VigilanceSpaceCellLoc = None ; #DEBUG_LINE_NO:1284
  DBAlphaSpaceCellLoc = None ; #DEBUG_LINE_NO:1285
  DBBetaSpaceCellLoc = None ; #DEBUG_LINE_NO:1286
  DBGammaSpaceCellLoc = None ; #DEBUG_LINE_NO:1287
  If LC088SpaceEnableLayer != None ; #DEBUG_LINE_NO:1288
    LC088SpaceEnableLayer.Delete() ; #DEBUG_LINE_NO:1289
  EndIf ; #DEBUG_LINE_NO:
  Guard SpaceSceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1291
    currentSpaceScene = None ; #DEBUG_LINE_NO:1292
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function EnableDataCoreAnalyzer(Bool sidedWithCF)
  If sidedWithCF || Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:1302
    TheKey_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1303
    TheKey_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1304
  Else ; #DEBUG_LINE_NO:
    LC082_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1306
    LC082_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1307
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function InsertDataCore(Bool sidedWithCF)
  If sidedWithCF || Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:1312
    (TheKey_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False) ; #DEBUG_LINE_NO:1313
  Else ; #DEBUG_LINE_NO:
    (LC082_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False) ; #DEBUG_LINE_NO:1315
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetDockingEnabled(spaceshipreference shipRef, Bool SetDockingEnabled)
  If SetDockingEnabled ; #DEBUG_LINE_NO:1326
    shipRef.SetValue(DockingPermission, CONST_DockingPermission_Any as Float) ; #DEBUG_LINE_NO:1327
  Else ; #DEBUG_LINE_NO:
    shipRef.SetValue(DockingPermission, CONST_DockingPermission_Never as Float) ; #DEBUG_LINE_NO:1329
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetUpGammaShipsAll()
  GammaShipsAll.AddRefCollection(CF_Allies_Gamma) ; #DEBUG_LINE_NO:1334
  GammaShipsAll.AddRefCollection(CF_Enemies_Gamma) ; #DEBUG_LINE_NO:1335
  GammaShipsAll.AddRefCollection(SD_Allies_Gamma) ; #DEBUG_LINE_NO:1336
  GammaShipsAll.AddRefCollection(SD_Enemies_Gamma) ; #DEBUG_LINE_NO:1337
  GammaShipsAll.AddRefCollection(SD_Allies_Group) ; #DEBUG_LINE_NO:1338
EndFunction

Function DEBUG_GoToSpaceAndWait()
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:1348
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:1349
  Bool shouldSpawnCFShip = Self.GetStageDone(CONST_Stage_CF_Quickstart) || Self.GetStageDone(CONST_Stage_CF_Skip) ; #DEBUG_LINE_NO:1350
  spaceshipreference testShip = Self.DEBUG_SpawnPlayerShip(shouldSpawnCFShip) ; #DEBUG_LINE_NO:1351
  testShip.AddItem(ShipRepairKit as Form, 20, False) ; #DEBUG_LINE_NO:1352
  playerRef.MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1353
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:1354
  PlayerShipPilotSeat.GetRef().Activate(playerRef as ObjectReference, False) ; #DEBUG_LINE_NO:1355
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:1356
  waitingForPlayerToSit = True ; #DEBUG_LINE_NO:1357
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:1358
  While waitingForPlayerToSit ; #DEBUG_LINE_NO:
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:1360
  EndWhile ; #DEBUG_LINE_NO:
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip) ; #DEBUG_LINE_NO:1362
EndFunction

spaceshipreference Function DEBUG_SpawnPlayerShip(Bool spawnCFShip)
  playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:1369
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:1370
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:1371
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:1372
  playerRef.AddPerk(Skill_Piloting, False) ; #DEBUG_LINE_NO:1373
  spaceshipreference testShip = None ; #DEBUG_LINE_NO:1375
  If spawnCFShip ; #DEBUG_LINE_NO:1376
    testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:1377
  Else ; #DEBUG_LINE_NO:
    testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipSD as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:1379
  EndIf ; #DEBUG_LINE_NO:
  SQ_PlayerShip.ResetPlayerShip(testShip) ; #DEBUG_LINE_NO:1381
  SQ_PlayerShip.ResetHomeShip(testShip) ; #DEBUG_LINE_NO:1382
  Return testShip ; #DEBUG_LINE_NO:1383
EndFunction

Function DEBUG_KillMain(Int numToKill)
  spaceshipreference[] mainEnemyRefs = None ; #DEBUG_LINE_NO:1388
  If Self.GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) ; #DEBUG_LINE_NO:1389
    mainEnemyRefs = CF_Enemies_Main.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1390
  Else ; #DEBUG_LINE_NO:
    mainEnemyRefs = SD_Enemies_Main.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:1392
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:1395
  While I < numToKill && I < mainEnemyRefs.Length ; #DEBUG_LINE_NO:1396
    If mainEnemyRefs[I].IsEssential(True) || mainEnemyRefs[I].IsDead() ; #DEBUG_LINE_NO:1397
      mainEnemyRefs.remove(I, 1) ; #DEBUG_LINE_NO:1399
    Else ; #DEBUG_LINE_NO:
      mainEnemyRefs[I].Kill(None) ; #DEBUG_LINE_NO:1402
      I += 1 ; #DEBUG_LINE_NO:1403
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_DamageVigilance()
  vigilanceRef.EnablePartRepair(ShipSystemEngineHealth, False) ; #DEBUG_LINE_NO:1410
  vigilanceRef.DamageValue(ShipSystemEngineHealth, vigilanceRef.GetValue(ShipSystemEngineHealth)) ; #DEBUG_LINE_NO:1411
  vigilanceRef.DamageValue(ShieldHealth, 100000.0) ; #DEBUG_LINE_NO:1412
  vigilanceRef.DamageValue(ShipSystemShieldsHealth, 100000.0) ; #DEBUG_LINE_NO:1413
  vigilanceRef.DamageValue(Health, 100000.0) ; #DEBUG_LINE_NO:1414
EndFunction
