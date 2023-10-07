ScriptName LC165QuestScript Extends Quest conditional
{ One of the quest script for LC165, Buried Temple. Handles most of the quest logic. }

;-- Structs -----------------------------------------
Struct AdversaryBattleStageDatum
  String Name
  Bool MustExecute
  Float StageHealthThreshold = 0.0
  Float BackstopHealthThreshold = 0.0
  Int StageToSetOnEnterBeforeShifting = -1
  Int StageToSetOnEnterAfterShifting = -1
  Spell SpellToAddOnEnter
  String FunctionToCallDuringShift
  String ShiftToTrigger
  Bool ShouldUseHoldPreferred
  Keyword HoldPositionKeyword
  RefCollectionAlias HoldPositionMarkers
  Bool AllowDemonStage = False
  Bool AllowGravWellStage = False
  Bool AddTraumaPackStage = False
  Bool IsAdversaryFleeStage = False
  Bool IsAdversaryEndStage = False
EndStruct

Struct StarbornDatum
  String StarbornName
  ReferenceAlias StarbornAlias
  Actor starbornActorRef
  RefCollectionAlias StarbornDuplicatesCollection
  String StarbornBattleStartFunctionName
  String StarbornUpdateFunctionName
  String StarbornHitFunctionName
  String StarbornDyingFunctionName
  String StarbornSpellCastFunctionName
  String StarbornSwapCombatStyleFunctionName
  String StarbornOnDistanceLessThanName
  Float StarbornTimerDelay = 1.0
  Keyword StarbornMovementHoldPositionKeyword
  Float StarbornMovementUpdate_NotAtTargetTime = 20.0
  Float StarbornMovementUpdate_AtTargetTime = 0.0
  Float StarbornMovementUpdate_HealthLossPercentage = 0.0
  Int StarbornBattleStartStage = -1
  Int StarbornBattleDeathStage = -1
  Int StarbornBattleEndStage = -1
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition = 2 Const
Int CONST_AdversaryFleeValue_ShouldFleeWithRun = 1 Const
Int CONST_AdversaryFleeValue_ShouldNotFlee = 0 Const
Int CONST_Adversary_DataIndex = 5 Const
Int CONST_Adversary_DeathSceneCompletedStage = 1199 Const
Int CONST_Adversary_DeathSceneFailsafeTimeout = 300 Const
Int CONST_Adversary_EmissaryDuplicateCount = 3 Const
Int CONST_Adversary_InitAdversaryFailsafeTimeout = 120 Const
Int CONST_Aggression_VeryAggressive = 2 Const
Int CONST_AllyArrivalAttemptsMax = 10 Const
Int CONST_AllyArrivalTimerDelay = 1 Const
Int CONST_AllyArrivalTimerID = 11 Const
Int CONST_AllyJoinedStage = 230 Const
Int CONST_AllyRejoinDistance = 2 Const
Float CONST_ArtifactRingSpeed_AfterBattle = 0.25 Const
Float CONST_ArtifactRingSpeed_BeforeBattle = 0.25 Const
Float CONST_ArtifactRingSpeed_DuringBattle = 0.5 Const
Float CONST_AwardFinalArtifactPowerDelay = 3.0 Const
Int CONST_BridgeDuplicationLineCountdown_StartValue = 2 Const
Int CONST_Bridge_BridgeCatchupTeleportDistance = 18 Const
Int CONST_Bridge_CombatStyle_Assault = 2 Const
Int CONST_Bridge_CombatStyle_Charger = 1 Const
Int CONST_Bridge_CombatStyle_Sniper = 0 Const
Int CONST_Bridge_DataIndex = 0 Const
Int CONST_Bridge_DeathCountParallelize_2 = 1 Const
Int CONST_Bridge_DeathCountParallelize_3 = 3 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_Courtyard_DataIndex = 1 Const
Int CONST_Courtyard_FirstReanimateActiveStage = 410 Const
Int CONST_Courtyard_FirstReanimateTargetsCount = 6 Const
Int CONST_Courtyard_MassReanimateDelay = 2 Const
Float CONST_Courtyard_PerReanimateDelay = 0.200000003 Const
Int CONST_Courtyard_SecondReanimateTargetsCount = 4 Const
Int CONST_Courtyard_SecondReanimateZombieThreshold = 3 Const
Int CONST_Courtyard_ThirdReanimateActiveStage = 411 Const
Int CONST_Courtyard_ThirdReanimateTargetsCount = 5 Const
Int CONST_Courtyard_ThirdReanimateZombieThreshold = 3 Const
Float CONST_DissolveVFXDelay = 2.0 Const
Float CONST_Elevator01Speed = 0.07
Float CONST_Elevator02Speed = 0.043000001 Const
Int CONST_ElevatorGateOpenFailsafeCount = 50 Const
Int CONST_Fire_DataIndex = 2 Const
Int CONST_ForceAdversaryShiftFailsafe = 200 Const
Float CONST_Gravity_MasadaIII = 1.120000005 Const
Int CONST_Ice_DataIndex = 3 Const
Int CONST_MQ302BArtifactID = 23 Const
Int CONST_OpenState_Open = 1 Const
Float CONST_ParallelSelfOffsetMax = 3.0 Const
Float CONST_ParallelSelfOffsetMin = 0.5 Const
Int CONST_QuickstartLevel = 50 Const
Int CONST_RuinsDemonsMax = 6 Const
Float CONST_RuinsDemonsRespawnDelay = 15.0 Const
Float CONST_RuinsInitialSpawnDelay = 0.5 Const
Float CONST_RuinsSpawnNearPlayerDistance_Max = 12.0 Const
Float CONST_RuinsSpawnNearPlayerDistance_Min = 4.0 Const
Int CONST_RuinsTargetSelectionAttemptsMax = 4 Const
Int CONST_RuinsTeleportDistanceMax = 50 Const
Float CONST_RuinsTeleportNearPlayerDistance_Max = 12.0 Const
Float CONST_RuinsTeleportNearPlayerDistance_Min = 8.0 Const
Int CONST_Ruins_DataIndex = 4 Const
Int CONST_Ruins_HitCountWhileObserving_Max = 1 Const
Int CONST_Stage_BridgeStarbornParallelSelfReactStage = 310 Const
Int CONST_Stage_Complete = 2000 Const
Int CONST_Stage_EngineeringHackedStage = 606 Const
Int CONST_Stage_EngineeringRobotReactStage = 605 Const
Int CONST_Stage_ExteriorIDCardReaderUsedStage = 495 Const
Int CONST_Stage_PlayerTakesArtifactActivator = 1290 Const
Int CONST_Stage_Quickstart_Space = 0 Const
Int CONST_Stage_Ruins_BattleStartSceneEndedStage = 1001 Const
Int CONST_Stage_SetupAdversaryFaction = 25 Const
Int CONST_Stage_Startup_BothEnemies = 22 Const
Int CONST_Stage_Startup_EmissaryEnemy = 21 Const
Int CONST_Stage_Startup_HunterEnemy = 20 Const
Int CONST_StarbornAdversaryRescueDistance = 50 Const
Int CONST_StarbornAdversarySurrenderSceneFailsafe = 100 Const
Int CONST_StarbornAdversary_ArtifactSurgeDelay = 2 Const
Float CONST_StarbornAdversary_CheckForStateChangeTimerDelay = 1.0 Const
Int CONST_StarbornAdversary_CheckForStateChangeTimerID = 10 Const
Int CONST_StarbornAdversary_DemonCastDelay = 8 Const
Int CONST_StarbornAdversary_DemonState_ReadyToCast = 1 Const
Int CONST_StarbornAdversary_DemonState_Waiting = 0 Const
Int CONST_StarbornAdversary_DemonsToSpawnPerCastMax = 3 Const
Int CONST_StarbornAdversary_DemonsToSpawnTotal = 5 Const
Float CONST_StarbornAdversary_GravWellCastDelay = 12.0 Const
Float CONST_StarbornAdversary_GravWellCastDistance = 10.0 Const
Float CONST_StarbornAdversary_GravWellDetonateDelay = 4.0 Const
Int CONST_StarbornAdversary_GravWellState_TryToCreate = 1 Const
Int CONST_StarbornAdversary_GravWellState_TryToDetonate = 3 Const
Int CONST_StarbornAdversary_GravWellState_WaitToCreate = 0 Const
Int CONST_StarbornAdversary_GravWellState_WaitToDetonate = 2 Const
Int CONST_StarbornAdversary_ShiftsToLoad = 2 Const
Int CONST_StarbornAdversary_State_TempleInitial = 0 Const
Int CONST_StarbornAtTargetDistance = 16 Const
Int CONST_StarbornBattleState_Adversary_Normal = 1 Const
Int CONST_StarbornBattleState_Adversary_Waiting = 0 Const
Int CONST_StarbornBattleState_Bridge_Complete = 100 Const
Int CONST_StarbornBattleState_Bridge_Initial = 0 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_1 = 2 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_2 = 3 Const
Int CONST_StarbornBattleState_Bridge_Parallelized_3 = 4 Const
Int CONST_StarbornBattleState_Bridge_RealEnemyExposed = 5 Const
Int CONST_StarbornBattleState_Bridge_Start = 1 Const
Int CONST_StarbornBattleState_Courtyard_Complete = 100 Const
Int CONST_StarbornBattleState_Courtyard_FirstReanimateActive = 1 Const
Int CONST_StarbornBattleState_Courtyard_FirstReanimateReady = 0 Const
Int CONST_StarbornBattleState_Courtyard_Initial = 0 Const
Int CONST_StarbornBattleState_Courtyard_Normal = 6 Const
Int CONST_StarbornBattleState_Courtyard_SecondReanimateActive = 3 Const
Int CONST_StarbornBattleState_Courtyard_SecondReanimateReady = 2 Const
Int CONST_StarbornBattleState_Courtyard_ThirdReanimateActive = 5 Const
Int CONST_StarbornBattleState_Courtyard_ThirdReanimateReady = 4 Const
Int CONST_StarbornBattleState_Engineering_Complete = 100 Const
Int CONST_StarbornBattleState_Engineering_Initial = 0 Const
Int CONST_StarbornBattleState_Engineering_Normal = 1 Const
Int CONST_StarbornBattleState_Ruins_Attacking = 2 Const
Int CONST_StarbornBattleState_Ruins_Complete = 100 Const
Int CONST_StarbornBattleState_Ruins_Initial = 0 Const
Int CONST_StarbornBattleState_Ruins_Observing = 1 Const
Int CONST_StarbornBridge_TeleportMarkerSearchRadius = 50 Const
Int CONST_StarbornEngineering_ActiveRobotCountMax = 2 Const
Float CONST_StarbornEngineering_GravWellCastDelay = 10.0 Const
Float CONST_StarbornEngineering_GravWellCastDistance = 10.0 Const
Float CONST_StarbornEngineering_GravWellDetonateDelay = 4.0 Const
Int CONST_StarbornEngineering_GravWellState_TryToCreate = 1 Const
Int CONST_StarbornEngineering_GravWellState_TryToDetonate = 3 Const
Int CONST_StarbornEngineering_GravWellState_WaitToCreate = 0 Const
Int CONST_StarbornEngineering_GravWellState_WaitToDetonate = 2 Const
Int CONST_StarbornEngineering_InitialAppearanceDelay = 3 Const
Int CONST_StarbornShouldCastCombatSpellValue = 5 Const
Int CONST_StarbornStateValue_Adversary_Normal = 1 Const
Int CONST_StarbornStateValue_Adversary_ShouldCastInitialParallelSelf = 2 Const
Int CONST_StarbornStateValue_Adversary_Waiting = 0 Const
Int CONST_StarbornStateValue_Bridge_Normal = 2 Const
Int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat = 3 Const
Int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfPackage = 1 Const
Int CONST_StarbornStateValue_Bridge_WaitingForPlayer = 0 Const
Int CONST_StarbornStateValue_Courtyard_Normal = 2 Const
Int CONST_StarbornStateValue_Courtyard_ShouldCastMassReanimate = 1 Const
Int CONST_StarbornStateValue_Courtyard_WaitInTower = 0 Const
Int CONST_StarbornStateValue_Engineering_Normal = 1 Const
Int CONST_StarbornStateValue_Ruins_Attacking = 2 Const
Int CONST_StarbornStateValue_Ruins_Observing = 1 Const
Int CourtyardBattleState = 0
Actor[] CourtyardReanimateTargetsAll
Actor[] CourtyardReanimateTargetsRandomized
Bool DEBUG_AdversaryDebugMode
Bool DEBUG_StarbornRuinsBlockDemonSpawning
Int EngineeringBattleState = 0
inputenablelayer LC165EnableLayer
Int RuinsBattleState = 0
Int Ruins_HitCountWhileObserving
Actor adversary01DuplicateRef
Actor adversary01Ref
Actor adversary02DuplicateRef
Actor adversary02Ref
Bool adversaryBattleComplete
Int adversaryBattleStageDataIndex
Bool adversaryCompletedZeroGPhase
Bool adversaryHasShiftedAwayFromTemple
Float adversaryHealthBaseTotal
Int adversaryLastShiftIndex = -1
Int allyArrivalAttempts
ObjectReference[] allyArrivalMarkerChain
ObjectReference artifactActivatorRef
ObjectReference artifactPlatformRef
ObjectReference artifactRingsRef
ObjectReference artifactZeroGExplosion
ObjectReference bridgeBoundsTriggerRef
Actor bridgeCharger
ObjectReference bridgeHoldPositionTriggerRef
Actor bridgeLastHit
Int bridge_DeathCount
Int bridge_DuplicationLineCountdown = -1
Int bridge_NextCombatStyle
Bool bridge_WaitingForParallelSelfCast
ObjectReference courtyardLastSwapMarker1
ObjectReference courtyardLastSwapMarker2
RefCollectionAlias currentAdversaryHoldPositionTargetCollection
Int demonDuplicateID
Int elevatorSFXID
idcardreader exteriorIDCardReaderRef
Bool hasDispelledAdversaryVoidForm
Bool initialized
Actor player
Bool safeToForceAdversaryShift
ObjectReference scriptedExplosionHazard
ObjectReference scriptedGravWellHazard
Float scriptedGravWellTimestamp
lc165shiftingquestscript selfAsShiftingScript
lc165spacequestscript selfAsSpaceQuestScript
Int stageToSetOnNextShift = -1
Actor starbornAdversaryCurrentPrimary
Int starbornAdversaryDemonState
Actor starbornAdversaryEmissary
Int starbornAdversaryGravWellState
Bool starbornAdversaryHasSpawnedInitialDemons
Actor starbornAdversaryHunter
Actor starbornAdversaryPrimary
Float starbornAdversaryScriptedDemonTimestamp
ObjectReference starbornAdversary_GravWellTargetPoint
Actor starbornBridgePrimary
Int starbornEngineeringGravWellState
ObjectReference starbornEngineering_GravWellTargetPoint
Bool starbornEngineering_RobotsDisabled
Actor starbornFireActorRef
Bool starbornFireDead
Bool starbornFireHasKey
Actor starbornIceActorRef
Bool starbornIceDead
Float[] starbornRuinsDemonsRespawnTimes
ObjectReference starbornRuinsTriggerRef
defaultmultistateactivator templeExteriorDoorBarsRef
defaultmultistateactivator templeExteriorDoorRef
defaultmultistateactivator templeInteriorDoorRef
Bool templeInteriorInitialized
Bool waitingForLoadOutOfTemple

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AdversaryBattleStageDataGuard
Guard AdversaryDemonGuard
Guard AdversaryGravWellGuard
Guard AdversaryShiftingGuard
Guard AdversaryZeroGGuard
Guard BridgeParallelSelfGuard
Guard ChangeLocationGuard
Guard CourtyardBattleStateGuard
Guard EngineeringGravWellGuard
Guard RuinsBattleStateGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc165questscript:starborndatum[] Property StarbornData Auto mandatory
  { Data for each of the Starborn minibosses. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData Auto mandatory
  { Array of data used for the BOTH battle. This array gets overwritten by the Hunter or Emissary-specific arrays, if appropriate. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData_Hunter Auto Const mandatory
  { Array of data used for the HUNTER ONLY battle. }
  lc165questscript:adversarybattlestagedatum[] Property AdversaryBattleStageData_Emissary Auto Const mandatory
  { Array of data used for the EMISSARY ONLY battle. }
EndGroup

Group AutofillProperties
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  starborntemplequestscript Property StarbornTempleQuest Auto Const mandatory
  Location Property LC165BuriedTempleLocation Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  RefCollectionAlias Property Followers Auto Const mandatory
  ReferenceAlias Property Ally Auto Const mandatory
  ReferenceAlias Property Adversary01 Auto Const mandatory
  ReferenceAlias Property Adversary02 Auto Const mandatory
  Scene Property MQ302_191_Entrance_EmissaryJoin Auto Const mandatory
  Scene Property MQ302_191_Entrance_HunterJoin Auto Const mandatory
  Scene Property MQ302_Battle_01_Bridge_BattleStart Auto Const mandatory
  ReferenceAlias Property StarbornBridge_BridgeBoundsTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_HoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_InitialDuplicateSpawnPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_ChargerTeleportPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_AssaultTeleportPoints Auto Const mandatory
  RefCollectionAlias Property StarbornBridge_SniperTeleportPoints Auto Const mandatory
  FormList Property LC165_Starborn_Bridge_TeleportPointMarkerList Auto Const mandatory
  Spell Property LC165_Starborn_Bridge_ScriptedParallelSelfInitialSpell Auto Const mandatory
  Spell Property LC165_Starborn_Bridge_ScriptedParallelSelfSpell Auto Const mandatory
  ActorValue Property LC165_Starborn_Bridge_CombatStyleValue Auto Const mandatory
  ActorValue Property LC165_Starborn_Bridge_HasPerformedInitialTeleportValue Auto Const mandatory
  Keyword Property LC165_Starborn_Bridge_DuplicationLines Auto Const mandatory
  ObjectReference Property LC165ExteriorHoldingPenMarkerRef Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate01 Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate02 Auto Const mandatory
  Scene Property MQ302_Battle_02_Courtyard_MassReanimate03 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave01 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave02 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_ReanimateTargets_Wave03 Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_HoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property StarbornCourtyard_Navcut Auto Const mandatory
  Scene Property MQ302_Battle_03_Engineering_BattleStart Auto Const mandatory
  ReferenceAlias Property StarbornFire Auto Const mandatory
  ReferenceAlias Property StarbornIce Auto Const mandatory
  ReferenceAlias Property StarbornEngineering_HoldPositionTargetInitial Auto Const mandatory
  ReferenceAlias Property StarbornEngineering_GravityWellSourceMarkerInitial Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_HoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_GravityWellSourceMarkers Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_RobotsActive Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_RobotsInactive Auto Const mandatory
  RefCollectionAlias Property StarbornEngineering_TurretsAll Auto Const mandatory
  Spell Property LC165_Starborn_Ice_ScriptedGravityWellSpell Auto Const mandatory
  Spell Property LC165_Starborn_Fire_ScriptedSupernovaSpell Auto Const mandatory
  Static Property LC165_Engineering_GravityWellSourceMarker Auto Const mandatory
  Scene Property MQ302_Battle_05_Ruins_BattleStart Auto Const mandatory
  Scene Property MQ302_Battle_05_Ruins_TeleportReaction Auto Const mandatory
  ReferenceAlias Property StarbornRuins_InitialInnerDemonSpawnPointChainHead Auto Const mandatory
  ReferenceAlias Property StarbornRuins_HoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property StarbornRuins_ObservingHoldPositionTargets Auto Const mandatory
  Spell Property LC165_Starborn_Adversary_ScriptedInnerDemonSpell Auto Const mandatory
  Spell Property ArtifactPowerSenseStarStuff_Spell Auto Const mandatory
  Perk Property LC165_Starborn_Ruins_InnerDemonPerk Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_Museum_Arrival Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_EmissaryDeath Auto Const mandatory
  Scene Property MQ302_Battle_06_Adversary_HunterDeath Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Primary Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Hunter Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Emissary Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_ActiveDistortion Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_DeathMarker01 Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_DeathMarker02 Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_InitialDuplicateSpawnPointChainHead Auto Const mandatory
  ReferenceAlias Property StarbornAdversary_Nishina_TeleportMarkerChainHead Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Demons Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_ZeroGImpulseObjects Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_ZeroGDisableObjects Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_GravityWellSourceMarkers Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Astral_Dancers Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints Auto Const mandatory
  ObjectReference Property LC165AdversarySoloSceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary01SceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary02SceneMarkerRef Auto Const mandatory
  ObjectReference Property LC165AdversarySoloCombatStartMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary01CombatStartMarkerRef Auto Const mandatory
  ObjectReference Property LC165Adversary02CombatStartMarkerRef Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302B_A_Battles Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302B_B_BattleFinal Auto Const mandatory
  Explosion Property ArtifactPower_AntiGravityField Auto Const mandatory
  Keyword Property MQHunterKeyword Auto Const mandatory
  Keyword Property MQEmissaryKeyword Auto Const mandatory
  Keyword Property LC165_StarbornAdversaryInaccessibleKeyword Auto Const mandatory
  Keyword Property LC165_BossHoldPosition_PreferredKeyword Auto Const mandatory
  Cell Property LC165BuriedTemple03 Auto Const mandatory
  Static Property LC165_Adversary_GravityWellSourceMarker Auto Const mandatory
  Armor Property Spacesuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
  ReferenceAlias Property AllyArrivalMarker Auto Const mandatory
  Static Property LC165_AllyArrivalMarker Auto Const mandatory
  ReferenceAlias Property ExteriorIDCard Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardFallback Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardFallbackSpawnPoint Auto Const mandatory
  ReferenceAlias Property ExteriorIDCardReader Auto Const mandatory
  ReferenceAlias Property ExteriorLoadDoor Auto Const mandatory
  ReferenceAlias Property EngineeringKey Auto Const mandatory
  ReferenceAlias Property EngineeringKeyFallback Auto Const mandatory
  ReferenceAlias Property EngineeringKeyFallbackSpawnPoint Auto Const mandatory
  ReferenceAlias Property MQ302BPetrov Auto Const mandatory
  ReferenceAlias Property PetrovsDoor Auto Const mandatory
  ReferenceAlias Property ElevatorTopActivator Auto Const mandatory
  ReferenceAlias Property ElevatorTopDoor Auto Const mandatory
  ReferenceAlias Property ElevatorBottomActivator Auto Const mandatory
  ReferenceAlias Property ElevatorBottomDoor Auto Const mandatory
  ReferenceAlias Property Elevator01EnableMarker Auto Const mandatory
  ReferenceAlias Property Elevator02EnableMarker Auto Const mandatory
  ReferenceAlias Property Elevator02Gate Auto Const mandatory
  ReferenceAlias Property ElevatorStaticEnableMarker Auto Const mandatory
  Keyword Property LC165LinkElevatorPlatformHelperKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorDoorKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorTopCollisionKeyword Auto Const mandatory
  Keyword Property LC165LinkElevatorSoundMarkerKeyword Auto Const mandatory
  wwiseevent Property WwiseEvent_OBJElevatorLoadStart Auto Const mandatory
  wwiseevent Property OBJ_Elevator_Mine_Transit_LP Auto Const mandatory
  ReferenceAlias Property TempleExteriorDoorBars Auto Const mandatory
  ReferenceAlias Property TempleExteriorDoor Auto Const mandatory
  ReferenceAlias Property TempleInteriorDoor Auto Const mandatory
  ReferenceAlias Property ArtifactActivator Auto Const mandatory
  ReferenceAlias Property ArtifactRings Auto Const mandatory
  ReferenceAlias Property ArtifactRingsAudioMarker Auto Const mandatory
  ReferenceAlias Property ArtifactPlatform Auto Const mandatory
  RefCollectionAlias Property ArtifactCollision Auto Const mandatory
  ReferenceAlias Property SBPowerCollectionActivator Auto Const mandatory
  Spell Property ArtifactPower_GrantSpell_Phased_Time Auto Const mandatory
  wwiseevent Property WwiseEvent_AMBArtifactVisionX Auto Const mandatory
  ObjectReference Property LC165HoldingPenMarkerRef Auto Const mandatory
  ObjectReference Property LC165AllyHoldingPenMarkerRef Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property LC165StarbornEnemyFaction Auto Const mandatory
  ActorValue Property LC165_StarbornStateValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementUpdateTimestampValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementReachedTargetTimestampValue Auto Const mandatory
  ActorValue Property LC165_StarbornMovementHealthPercentStampValue Auto Const mandatory
  ActorValue Property LC165_BossHoldPositionValue Auto Const mandatory
  ActorValue Property LC165_AdversaryFleeValue Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Confidence Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ActorValue Property QuantumEssence Auto Const mandatory
  Keyword[] Property StarbornMovementHoldPositionKeywords Auto Const mandatory
  Keyword Property LC165_StarbornEventActorLinkKeyword Auto Const mandatory
  Keyword Property LC165_StarbornDuplicateLinkKeyword Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Message Property QuantumEssenceAddMSG Auto Const mandatory
  Static Property XMarker Auto Const mandatory
  Spell Property LC165_Scripted_VoidFormAb Auto Const mandatory
  Spell Property AbStarbornDeath Auto Const mandatory
  Spell Property LC165_AbParallelSelfDeath Auto Const mandatory
  Spell Property LC165_AbReanimate Auto Const mandatory
  Spell Property LC165_AbInnerDemonDeath Auto Const mandatory
  Spell Property AIPower_VoidForm Auto Const mandatory
  Spell Property LC165_Scripted_VoidFormSpell Auto Const mandatory
  Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
  Hazard Property LC165_ScriptedGravWellHazard Auto Const mandatory
  Explosion Property LC165_ScriptedGravWellExplosion Auto Const mandatory
  Explosion Property LC165_ScriptedSupernovaExplosion Auto Const mandatory
  Explosion Property LC165_StarbornReanimateExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportInExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportOutExplosion Auto Const mandatory
  Explosion Property LC165_StarbornTeleportSwapExplosion Auto Const mandatory
  Explosion Property LC165_StarbornParallelSelfSpawnExplosion Auto Const mandatory
  Explosion Property LC165_StarbornInnerDemonSpawnExplosion Auto Const mandatory
  Explosion Property LC165_AnomalyTeleportExplosion Auto Const mandatory
  combatstyle Property LC165_csStarbornChargerBridge Auto Const mandatory
  combatstyle Property LC165_csStarbornChargerBridge_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_Sniper Auto Const mandatory
  combatstyle Property LC165_csStarborn_Sniper_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_Assault Auto Const mandatory
  combatstyle Property LC165_csStarborn_Assault_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_MQHunter Auto Const mandatory
  combatstyle Property LC165_csStarborn_MQHunter_CastCombatSpell Auto Const mandatory
  combatstyle Property csStarborn_MQEmissary Auto Const mandatory
  combatstyle Property LC165_csStarborn_MQEmissary_CastCombatSpell Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p75_p75_03 Auto Const mandatory
  MiscObject Property Artifact_MU Auto Const mandatory
  RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
  Potion Property Aid_MedPack Auto Const mandatory
  Potion Property Aid_TraumaPack Auto Const mandatory
EndGroup

Bool Property usedSurfaceQuickstart Auto hidden
Int Property bridgeBattleState = 0 Auto conditional hidden
Bool Property Elevator02FinishedAnimation = False Auto conditional hidden

;-- Functions ---------------------------------------

Function StarbornRuinsSwapCombatStyle(Actor starbornRuinsRef, Int starbornDataIndex, Bool shouldCastSpell)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:589
  selfAsSpaceQuestScript = (Self as Quest) as lc165spacequestscript ; #DEBUG_LINE_NO:590
  selfAsShiftingScript = (Self as Quest) as lc165shiftingquestscript ; #DEBUG_LINE_NO:591
  bridgeBoundsTriggerRef = StarbornBridge_BridgeBoundsTrigger.GetRef() ; #DEBUG_LINE_NO:592
  bridgeHoldPositionTriggerRef = StarbornBridge_HoldPositionTrigger.GetAt(0) ; #DEBUG_LINE_NO:593
  templeExteriorDoorBarsRef = TempleExteriorDoorBars.GetRef() as defaultmultistateactivator ; #DEBUG_LINE_NO:594
  templeExteriorDoorRef = TempleExteriorDoor.GetRef() as defaultmultistateactivator ; #DEBUG_LINE_NO:595
  templeInteriorDoorRef = TempleInteriorDoor.GetRef() as defaultmultistateactivator ; #DEBUG_LINE_NO:596
  Int I = 0 ; #DEBUG_LINE_NO:599
  While I < StarbornData.Length ; #DEBUG_LINE_NO:600
    StarbornData[I].StarbornAlias.TryToReset() ; #DEBUG_LINE_NO:601
    StarbornData[I].StarbornDuplicatesCollection.ResetAll() ; #DEBUG_LINE_NO:602
    I += 1 ; #DEBUG_LINE_NO:603
  EndWhile ; #DEBUG_LINE_NO:
  StarbornAdversary_Hunter.TryToReset() ; #DEBUG_LINE_NO:605
  StarbornAdversary_Emissary.TryToReset() ; #DEBUG_LINE_NO:606
  StarbornCourtyard_ReanimateTargets.ResetAll() ; #DEBUG_LINE_NO:607
  StarbornEngineering_RobotsActive.ResetAll() ; #DEBUG_LINE_NO:608
  StarbornEngineering_RobotsInactive.ResetAll() ; #DEBUG_LINE_NO:609
  StarbornEngineering_TurretsAll.ResetAll() ; #DEBUG_LINE_NO:610
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:613
  I = 0 ; #DEBUG_LINE_NO:616
  While I < StarbornData.Length ; #DEBUG_LINE_NO:617
    Actor current = StarbornData[I].StarbornAlias.GetActorRef() ; #DEBUG_LINE_NO:618
    If current != None ; #DEBUG_LINE_NO:619
      StarbornData[I].starbornActorRef = current ; #DEBUG_LINE_NO:620
      current.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:621
      current.Disable(False) ; #DEBUG_LINE_NO:622
      Self.RegisterForStarbornEvents(current, I) ; #DEBUG_LINE_NO:623
      current.RemoveItem(Aid_MedPack as Form, 100, False, None) ; #DEBUG_LINE_NO:624
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:626
  EndWhile ; #DEBUG_LINE_NO:
  Self.StarbornBridgeInit(CONST_Bridge_DataIndex) ; #DEBUG_LINE_NO:630
  CourtyardReanimateTargetsAll = StarbornCourtyard_ReanimateTargets.GetArray() as Actor[] ; #DEBUG_LINE_NO:632
  CourtyardReanimateTargetsRandomized = commonarrayfunctions.CopyAndRandomizeObjArray(StarbornCourtyard_ReanimateTargets.GetArray()) as Actor[] ; #DEBUG_LINE_NO:633
  starbornFireActorRef = StarbornFire.GetActorRef() ; #DEBUG_LINE_NO:635
  starbornIceActorRef = StarbornIce.GetActorRef() ; #DEBUG_LINE_NO:636
  ObjectReference[] randomizedRobots = commonarrayfunctions.CopyAndRandomizeObjArray(StarbornEngineering_RobotsActive.GetArray()) ; #DEBUG_LINE_NO:637
  StarbornEngineering_RobotsActive.RemoveAll() ; #DEBUG_LINE_NO:638
  StarbornEngineering_RobotsActive.AddArray(randomizedRobots) ; #DEBUG_LINE_NO:639
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Unconscious") ; #DEBUG_LINE_NO:640
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Frenzy") ; #DEBUG_LINE_NO:641
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Ally") ; #DEBUG_LINE_NO:642
  starbornRuinsTriggerRef = StarbornRuins_HoldPositionTrigger.GetRef() ; #DEBUG_LINE_NO:644
  starbornRuinsDemonsRespawnTimes = new Float[0] ; #DEBUG_LINE_NO:645
  exteriorIDCardReaderRef = ExteriorIDCardReader.GetRef() as idcardreader ; #DEBUG_LINE_NO:648
  Self.RegisterForCustomEvent(exteriorIDCardReaderRef as ScriptObject, "idcardreader_IDReaderActivatedSuccess") ; #DEBUG_LINE_NO:649
  ExteriorLoadDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:652
  Self.SetTempleDoorState(True, True) ; #DEBUG_LINE_NO:655
  artifactActivatorRef = ArtifactActivator.GetRef() ; #DEBUG_LINE_NO:658
  artifactRingsRef = ArtifactRings.GetRef() ; #DEBUG_LINE_NO:659
  artifactPlatformRef = ArtifactPlatform.GetRef() ; #DEBUG_LINE_NO:660
  artifactActivatorRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:661
  Self.RegisterForRemoteEvent(artifactActivatorRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:662
EndEvent

Function QuickstartTo(ObjectReference quickstartMarker)
  If !Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) && !Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && !Self.GetStageDone(CONST_Stage_Startup_BothEnemies) ; #DEBUG_LINE_NO:668
    Self.SetStage(CONST_Stage_Startup_HunterEnemy) ; #DEBUG_LINE_NO:669
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(CONST_Stage_Quickstart_Space) && quickstartMarker == None ; #DEBUG_LINE_NO:672
    selfAsSpaceQuestScript.QuickstartToSpace() ; #DEBUG_LINE_NO:673
  Else ; #DEBUG_LINE_NO:
    usedSurfaceQuickstart = True ; #DEBUG_LINE_NO:675
    Actor allyRef = Ally.GetActorRef() ; #DEBUG_LINE_NO:678
    If allyRef != None ; #DEBUG_LINE_NO:679
      SQ_Followers.SetRoleActive(allyRef, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:680
      allyRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:681
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(CONST_Stage_SetupAdversaryFaction) ; #DEBUG_LINE_NO:685
    player.MoveTo(quickstartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:688
    Companion.TryToMoveTo(quickstartMarker) ; #DEBUG_LINE_NO:689
    Followers.MoveAllTo(quickstartMarker) ; #DEBUG_LINE_NO:690
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnterVoidForm(Actor target)
  If target != None ; #DEBUG_LINE_NO:701
    LC165_Scripted_VoidFormSpell.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:702
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ExitVoidForm(Actor target)
  If target != None ; #DEBUG_LINE_NO:707
    target.RemoveSpell(LC165_Scripted_VoidFormSpell) ; #DEBUG_LINE_NO:708
    target.DispelSpell(LC165_Scripted_VoidFormSpell) ; #DEBUG_LINE_NO:709
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TeleportIn(ObjectReference target, Spell teleportInSpell, Explosion teleportInExplosion)
  If target != None ; #DEBUG_LINE_NO:715
    If teleportInSpell == None && teleportInExplosion == None ; #DEBUG_LINE_NO:716
      teleportInExplosion = LC165_StarbornTeleportInExplosion ; #DEBUG_LINE_NO:717
    EndIf ; #DEBUG_LINE_NO:
    Actor targetActor = target as Actor ; #DEBUG_LINE_NO:719
    If targetActor ; #DEBUG_LINE_NO:720
      If teleportInSpell != None ; #DEBUG_LINE_NO:721
        targetActor.AddSpell(teleportInSpell, True) ; #DEBUG_LINE_NO:722
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If teleportInExplosion != None ; #DEBUG_LINE_NO:725
      target.PlaceAtMe(teleportInExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:726
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TeleportOut(Actor target, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutDelay, Bool shouldDisable)
  If target != None ; #DEBUG_LINE_NO:733
    If teleportOutSpell == None && teleportOutExplosion == None ; #DEBUG_LINE_NO:734
      teleportOutExplosion = LC165_StarbornTeleportOutExplosion ; #DEBUG_LINE_NO:735
    EndIf ; #DEBUG_LINE_NO:
    If teleportOutSpell != None ; #DEBUG_LINE_NO:737
      target.AddSpell(teleportOutSpell, True) ; #DEBUG_LINE_NO:738
      Utility.Wait(CONST_DissolveVFXDelay) ; #DEBUG_LINE_NO:739
    EndIf ; #DEBUG_LINE_NO:
    If teleportOutExplosion != None ; #DEBUG_LINE_NO:741
      target.PlaceAtMe(teleportOutExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:742
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(teleportOutDelay) ; #DEBUG_LINE_NO:744
    If shouldDisable ; #DEBUG_LINE_NO:745
      target.Disable(False) ; #DEBUG_LINE_NO:746
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TeleportOutNoWait(Actor target, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutDelay, Bool shouldDisable)
  Var[] akArgs = new Var[5] ; #DEBUG_LINE_NO:752
  akArgs[0] = target as Var ; #DEBUG_LINE_NO:753
  akArgs[1] = teleportOutSpell as Var ; #DEBUG_LINE_NO:754
  akArgs[2] = teleportOutExplosion as Var ; #DEBUG_LINE_NO:755
  akArgs[3] = teleportOutDelay as Var ; #DEBUG_LINE_NO:756
  akArgs[4] = shouldDisable as Var ; #DEBUG_LINE_NO:757
  Self.CallFunctionNoWait("TeleportOut", akArgs) ; #DEBUG_LINE_NO:758
EndFunction

Function CombatTeleportNearPlayerNoWait(Actor actorToTeleport, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.CombatTeleportNearRefNoWait(actorToTeleport, player as ObjectReference, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:763
EndFunction

Function CombatTeleportNearPlayer(Actor actorToTeleport, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.CombatTeleportNearRef(actorToTeleport, player as ObjectReference, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:767
EndFunction

Function CombatTeleportNearRefNoWait(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[11] ; #DEBUG_LINE_NO:771
  akArgs[0] = actorToTeleport as Var ; #DEBUG_LINE_NO:772
  akArgs[1] = sourceRef as Var ; #DEBUG_LINE_NO:773
  akArgs[2] = minDistance as Var ; #DEBUG_LINE_NO:774
  akArgs[3] = maxDistance as Var ; #DEBUG_LINE_NO:775
  akArgs[4] = allowZOffset as Var ; #DEBUG_LINE_NO:776
  akArgs[5] = alwaysInFront as Var ; #DEBUG_LINE_NO:777
  akArgs[6] = teleportInSpell as Var ; #DEBUG_LINE_NO:778
  akArgs[7] = teleportInExplosion as Var ; #DEBUG_LINE_NO:779
  akArgs[8] = teleportOutSpell as Var ; #DEBUG_LINE_NO:780
  akArgs[9] = teleportOutExplosion as Var ; #DEBUG_LINE_NO:781
  akArgs[10] = teleportOutSpellDelay as Var ; #DEBUG_LINE_NO:782
  Self.CallFunctionNoWait("CombatTeleportNearRef", akArgs) ; #DEBUG_LINE_NO:783
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If !actorToTeleport.IsDead() ; #DEBUG_LINE_NO:787
    Float[] akOffsets = new Float[3] ; #DEBUG_LINE_NO:788
    If maxDistance > 0.0 ; #DEBUG_LINE_NO:789
      akOffsets[0] = Utility.RandomFloat(minDistance, maxDistance) ; #DEBUG_LINE_NO:790
      akOffsets[1] = Utility.RandomFloat(minDistance, maxDistance) ; #DEBUG_LINE_NO:791
      akOffsets[2] = Utility.RandomFloat(minDistance, maxDistance) ; #DEBUG_LINE_NO:792
      If Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:793
        akOffsets[0] = akOffsets[0] * -1.0 ; #DEBUG_LINE_NO:794
      EndIf ; #DEBUG_LINE_NO:
      If !alwaysInFront && Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:796
        akOffsets[1] = akOffsets[1] * -1.0 ; #DEBUG_LINE_NO:797
      EndIf ; #DEBUG_LINE_NO:
      If !allowZOffset ; #DEBUG_LINE_NO:799
        akOffsets[2] = 0.0 ; #DEBUG_LINE_NO:800
      ElseIf Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:801
        akOffsets[2] = akOffsets[2] * -1.0 ; #DEBUG_LINE_NO:802
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference target = sourceRef.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True) ; #DEBUG_LINE_NO:805
    If minDistance > 0.0 || maxDistance > 0.0 ; #DEBUG_LINE_NO:806
      target.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:807
    EndIf ; #DEBUG_LINE_NO:
    Self.CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:809
    target.Delete() ; #DEBUG_LINE_NO:810
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[8] ; #DEBUG_LINE_NO:815
  akArgs[0] = actorToTeleport as Var ; #DEBUG_LINE_NO:816
  akArgs[1] = target as Var ; #DEBUG_LINE_NO:817
  akArgs[2] = shouldBeInvisibleAfterTeleport as Var ; #DEBUG_LINE_NO:818
  akArgs[3] = teleportInSpell as Var ; #DEBUG_LINE_NO:819
  akArgs[4] = teleportInExplosion as Var ; #DEBUG_LINE_NO:820
  akArgs[5] = teleportOutSpell as Var ; #DEBUG_LINE_NO:821
  akArgs[6] = teleportOutExplosion as Var ; #DEBUG_LINE_NO:822
  akArgs[7] = teleportOutSpellDelay as Var ; #DEBUG_LINE_NO:823
  Self.CallFunctionNoWait("CombatTeleport", akArgs) ; #DEBUG_LINE_NO:824
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded() ; #DEBUG_LINE_NO:828
    Self.TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False) ; #DEBUG_LINE_NO:829
  EndIf ; #DEBUG_LINE_NO:
  If shouldBeInvisibleAfterTeleport ; #DEBUG_LINE_NO:831
    Self.EnterVoidForm(actorToTeleport) ; #DEBUG_LINE_NO:832
    actorToTeleport.DispelSpell(ArtifactPowerSenseStarStuff_Spell) ; #DEBUG_LINE_NO:833
  EndIf ; #DEBUG_LINE_NO:
  If !shouldBeInvisibleAfterTeleport ; #DEBUG_LINE_NO:835
    Self.TeleportIn(target, teleportInSpell, teleportInExplosion) ; #DEBUG_LINE_NO:836
  EndIf ; #DEBUG_LINE_NO:
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:838
  If actorToTeleport.IsDisabled() ; #DEBUG_LINE_NO:839
    actorToTeleport.Enable(False) ; #DEBUG_LINE_NO:840
  EndIf ; #DEBUG_LINE_NO:
  If !shouldBeInvisibleAfterTeleport ; #DEBUG_LINE_NO:842
    Self.ExitVoidForm(actorToTeleport) ; #DEBUG_LINE_NO:843
  EndIf ; #DEBUG_LINE_NO:
  If !actorToTeleport.IsDead() ; #DEBUG_LINE_NO:845
    actorToTeleport.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:846
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function NoncombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Var[] akArgs = new Var[8] ; #DEBUG_LINE_NO:851
  akArgs[0] = actorToTeleport as Var ; #DEBUG_LINE_NO:852
  akArgs[1] = target as Var ; #DEBUG_LINE_NO:853
  akArgs[2] = shouldBeInvisibleAfterTeleport as Var ; #DEBUG_LINE_NO:854
  akArgs[3] = teleportInSpell as Var ; #DEBUG_LINE_NO:855
  akArgs[4] = teleportInExplosion as Var ; #DEBUG_LINE_NO:856
  akArgs[5] = teleportOutSpell as Var ; #DEBUG_LINE_NO:857
  akArgs[6] = teleportOutExplosion as Var ; #DEBUG_LINE_NO:858
  akArgs[7] = teleportOutSpellDelay as Var ; #DEBUG_LINE_NO:859
  Self.CallFunctionNoWait("NoncombatTeleport", akArgs) ; #DEBUG_LINE_NO:860
EndFunction

Function NoncombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded() ; #DEBUG_LINE_NO:864
    Self.TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False) ; #DEBUG_LINE_NO:865
  EndIf ; #DEBUG_LINE_NO:
  If shouldBeInvisibleAfterTeleport ; #DEBUG_LINE_NO:867
    Self.EnterVoidForm(actorToTeleport) ; #DEBUG_LINE_NO:868
  EndIf ; #DEBUG_LINE_NO:
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:870
  If actorToTeleport.IsDisabled() ; #DEBUG_LINE_NO:871
    actorToTeleport.Enable(False) ; #DEBUG_LINE_NO:872
  EndIf ; #DEBUG_LINE_NO:
  If !shouldBeInvisibleAfterTeleport ; #DEBUG_LINE_NO:874
    Self.TeleportIn(actorToTeleport as ObjectReference, teleportInSpell, teleportInExplosion) ; #DEBUG_LINE_NO:875
    Self.ExitVoidForm(actorToTeleport) ; #DEBUG_LINE_NO:876
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Actor Function CreateRuinsDemon(Int starbornDataIndex, RefCollectionAlias demonRefCollection)
  Actor actorToDuplicate = None ; #DEBUG_LINE_NO:881
  If demonDuplicateID == 1 && actorToDuplicate == None ; #DEBUG_LINE_NO:882
    If Companion.GetActorRef() != None ; #DEBUG_LINE_NO:883
      actorToDuplicate = Companion.GetActorRef() ; #DEBUG_LINE_NO:884
      demonDuplicateID += 1 ; #DEBUG_LINE_NO:885
    Else ; #DEBUG_LINE_NO:
      demonDuplicateID += 1 ; #DEBUG_LINE_NO:887
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If demonDuplicateID == 2 && actorToDuplicate == None ; #DEBUG_LINE_NO:890
    If Ally.GetActorRef() != None ; #DEBUG_LINE_NO:891
      actorToDuplicate = Ally.GetActorRef() ; #DEBUG_LINE_NO:892
      demonDuplicateID += 1 ; #DEBUG_LINE_NO:893
    Else ; #DEBUG_LINE_NO:
      demonDuplicateID += 1 ; #DEBUG_LINE_NO:895
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If demonDuplicateID == 3 ; #DEBUG_LINE_NO:898
    demonDuplicateID = 0 ; #DEBUG_LINE_NO:899
  EndIf ; #DEBUG_LINE_NO:
  If demonDuplicateID == 0 && actorToDuplicate == None ; #DEBUG_LINE_NO:901
    actorToDuplicate = player ; #DEBUG_LINE_NO:902
    demonDuplicateID += 1 ; #DEBUG_LINE_NO:903
  EndIf ; #DEBUG_LINE_NO:
  Actor createdDemon = Self.CreateDuplicate(LC165HoldingPenMarkerRef, actorToDuplicate, StarbornData[starbornDataIndex].starbornActorRef, demonRefCollection, starbornDataIndex, False) ; #DEBUG_LINE_NO:906
  createdDemon.Enable(False) ; #DEBUG_LINE_NO:907
  Return createdDemon ; #DEBUG_LINE_NO:908
EndFunction

Actor Function CreateDuplicate(ObjectReference spawnPoint, Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, Int starbornDataIndex, Bool shouldRegisterForEvents)
  Actor duplicate = spawnPoint.PlaceDuplicateActorAtMe(actorToDuplicate, False, True, True, None, None, True) ; #DEBUG_LINE_NO:912
  duplicate.RemoveFromAllFactions() ; #DEBUG_LINE_NO:913
  duplicate.SetGroupFaction(None) ; #DEBUG_LINE_NO:914
  duplicate.AddToFaction(LC165StarbornEnemyFaction) ; #DEBUG_LINE_NO:915
  duplicate.SetValue(Aggression, CONST_Aggression_VeryAggressive as Float) ; #DEBUG_LINE_NO:916
  duplicate.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:917
  duplicate.SetLinkedRef(actorToDuplicate as ObjectReference, LC165_StarbornDuplicateLinkKeyword, True) ; #DEBUG_LINE_NO:918
  If creatingActor != None ; #DEBUG_LINE_NO:919
    duplicate.SetLinkedRef(creatingActor as ObjectReference, LC165_StarbornEventActorLinkKeyword, True) ; #DEBUG_LINE_NO:920
  EndIf ; #DEBUG_LINE_NO:
  If duplicateCollection != None ; #DEBUG_LINE_NO:922
    duplicateCollection.AddRef(duplicate as ObjectReference) ; #DEBUG_LINE_NO:923
  EndIf ; #DEBUG_LINE_NO:
  If shouldRegisterForEvents ; #DEBUG_LINE_NO:925
    Self.RegisterForStarbornEvents(duplicate, starbornDataIndex) ; #DEBUG_LINE_NO:926
  EndIf ; #DEBUG_LINE_NO:
  Return duplicate ; #DEBUG_LINE_NO:928
EndFunction

Actor Function CreateParallelSelf(Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, Int starbornDataIndex, Bool shouldRegisterForEvents)
  ObjectReference spawnPoint = Self.GetParallelSelfSpawnPoint(actorToDuplicate as ObjectReference) ; #DEBUG_LINE_NO:932
  Actor duplicate = Self.CreateDuplicate(spawnPoint, actorToDuplicate, creatingActor, duplicateCollection, starbornDataIndex, shouldRegisterForEvents) ; #DEBUG_LINE_NO:933
  spawnPoint.Delete() ; #DEBUG_LINE_NO:934
  Return duplicate ; #DEBUG_LINE_NO:935
EndFunction

ObjectReference Function GetParallelSelfSpawnPoint(ObjectReference source)
  Float[] offsets = new Float[3] ; #DEBUG_LINE_NO:939
  offsets[0] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax) ; #DEBUG_LINE_NO:940
  offsets[1] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax) ; #DEBUG_LINE_NO:941
  ObjectReference spawnPoint = source.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:942
  spawnPoint.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:943
  Return spawnPoint ; #DEBUG_LINE_NO:944
EndFunction

Function CreateScriptedGraityWell(ObjectReference source)
  Self.DestroyScriptedGravityWell(None, False) ; #DEBUG_LINE_NO:948
  scriptedExplosionHazard = source.PlaceAtMe(LC165_ScriptedGravWellExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:949
  scriptedGravWellHazard = source.PlaceAtMe(LC165_ScriptedGravWellHazard as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:950
EndFunction

Function DestroyScriptedGravityWell(Explosion explosionToSpawn, Bool shouldUpdateTimestamp)
  If scriptedGravWellHazard != None ; #DEBUG_LINE_NO:954
    If explosionToSpawn == None ; #DEBUG_LINE_NO:955
      If scriptedExplosionHazard != None ; #DEBUG_LINE_NO:956
        scriptedExplosionHazard.Delete() ; #DEBUG_LINE_NO:957
        scriptedExplosionHazard = None ; #DEBUG_LINE_NO:958
      EndIf ; #DEBUG_LINE_NO:
      If scriptedGravWellHazard != None ; #DEBUG_LINE_NO:960
        scriptedGravWellHazard.Delete() ; #DEBUG_LINE_NO:961
        scriptedGravWellHazard = None ; #DEBUG_LINE_NO:962
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      ObjectReference myXMarker = scriptedGravWellHazard.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:965
      scriptedExplosionHazard.Delete() ; #DEBUG_LINE_NO:966
      scriptedExplosionHazard = None ; #DEBUG_LINE_NO:967
      scriptedGravWellHazard.Delete() ; #DEBUG_LINE_NO:968
      scriptedGravWellHazard = None ; #DEBUG_LINE_NO:969
      myXMarker.PlaceAtMe(explosionToSpawn as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:970
      myXMarker.Delete() ; #DEBUG_LINE_NO:971
    EndIf ; #DEBUG_LINE_NO:
    If shouldUpdateTimestamp ; #DEBUG_LINE_NO:973
      scriptedGravWellTimestamp = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:974
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartScriptedReanimate(Actor caster, Actor[] reanimateTargets, Float reanimateDelay)
  Int I = 0 ; #DEBUG_LINE_NO:980
  While I < reanimateTargets.Length && !caster.IsDead() ; #DEBUG_LINE_NO:981
    reanimateTargets[I].PlaceAtMe(LC165_StarbornReanimateExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:982
    reanimateTargets[I].Resurrect() ; #DEBUG_LINE_NO:984
    reanimateTargets[I].AddSpell(LC165_AbReanimate, True) ; #DEBUG_LINE_NO:985
    I += 1 ; #DEBUG_LINE_NO:986
    If I < reanimateTargets.Length && reanimateDelay > 0.0 ; #DEBUG_LINE_NO:987
      Utility.Wait(reanimateDelay) ; #DEBUG_LINE_NO:988
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Int Function CountScriptedReanimate(Actor[] reanimateTargets)
  Int activeActorCount = 0 ; #DEBUG_LINE_NO:994
  Int I = 0 ; #DEBUG_LINE_NO:995
  While I < reanimateTargets.Length ; #DEBUG_LINE_NO:996
    If !reanimateTargets[I].IsDead() ; #DEBUG_LINE_NO:997
      activeActorCount += 1 ; #DEBUG_LINE_NO:998
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1000
  EndWhile ; #DEBUG_LINE_NO:
  Return activeActorCount ; #DEBUG_LINE_NO:1002
EndFunction

Function CleanupScriptedActors(Actor[] targets, Int numToCleanup, Bool shouldDisable, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Int cleanedUpCount = 0 ; #DEBUG_LINE_NO:1006
  Int I = 0 ; #DEBUG_LINE_NO:1007
  While I < targets.Length && (cleanedUpCount < numToCleanup || numToCleanup < 0) ; #DEBUG_LINE_NO:1008
    If !targets[I].IsDead() && !targets[I].IsDisabled() ; #DEBUG_LINE_NO:1009
      cleanedUpCount += 1 ; #DEBUG_LINE_NO:1010
      If shouldDisable ; #DEBUG_LINE_NO:1011
        Self.TeleportOutNoWait(targets[I], teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, True) ; #DEBUG_LINE_NO:1012
      Else ; #DEBUG_LINE_NO:
        targets[I].Kill(None) ; #DEBUG_LINE_NO:1014
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1017
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DissolveStarborn(Actor starbornToDissolve)
  starbornToDissolve.BlockActivation(True, True) ; #DEBUG_LINE_NO:1022
  starbornToDissolve.AddSpell(AbStarbornDeath, True) ; #DEBUG_LINE_NO:1023
  Utility.Wait(CONST_DissolveVFXDelay) ; #DEBUG_LINE_NO:1024
  FortifyQuantumEssenceSpell.Cast(starbornToDissolve as ObjectReference, player as ObjectReference) ; #DEBUG_LINE_NO:1025
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:1026
  starbornToDissolve.DisableNoWait(False) ; #DEBUG_LINE_NO:1027
EndFunction

Function DropStarbornItem(Actor starbornToDropItem, ObjectReference itemToDrop)
  ObjectReference itemMarker = starbornToDropItem.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:1031
  itemMarker.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:1032
  itemToDrop.MoveTo(itemMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1033
  itemToDrop.SetMotionType(2, True) ; #DEBUG_LINE_NO:1034
  itemMarker.Delete() ; #DEBUG_LINE_NO:1035
EndFunction

Function RegisterForStarbornEvents(Actor currentStarborn, Int starbornDataIndex)
  currentStarborn.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentStarborn.GetValuePercentage(Health)) ; #DEBUG_LINE_NO:1044
  If StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime >= 0.0 ; #DEBUG_LINE_NO:1045
    currentStarborn.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0.0) ; #DEBUG_LINE_NO:1046
  EndIf ; #DEBUG_LINE_NO:
  If StarbornData[starbornDataIndex].StarbornSpellCastFunctionName != "" ; #DEBUG_LINE_NO:1048
    Self.RegisterForRemoteEvent(currentStarborn as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:1049
  EndIf ; #DEBUG_LINE_NO:
  If StarbornData[starbornDataIndex].StarbornHitFunctionName != "" ; #DEBUG_LINE_NO:1051
    Self.RegisterForHitEvent(currentStarborn as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:1052
  EndIf ; #DEBUG_LINE_NO:
  If StarbornData[starbornDataIndex].StarbornDyingFunctionName != "" ; #DEBUG_LINE_NO:1054
    Self.RegisterForRemoteEvent(currentStarborn as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:1055
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartStarbornBattle(Actor currentStarborn)
  Int starbornDataIndex = StarbornData.findstruct("starbornActorRef", currentStarborn, 0) ; #DEBUG_LINE_NO:1061
  Var[] akArgs = new Var[2] ; #DEBUG_LINE_NO:1062
  akArgs[0] = currentStarborn as Var ; #DEBUG_LINE_NO:1063
  akArgs[1] = starbornDataIndex as Var ; #DEBUG_LINE_NO:1064
  Self.CallFunction(StarbornData[starbornDataIndex].StarbornBattleStartFunctionName, akArgs) ; #DEBUG_LINE_NO:1065
  If StarbornData[starbornDataIndex].StarbornUpdateFunctionName != "" ; #DEBUG_LINE_NO:1066
    Self.StartTimer(StarbornData[starbornDataIndex].StarbornTimerDelay, starbornDataIndex) ; #DEBUG_LINE_NO:1067
  EndIf ; #DEBUG_LINE_NO:
  MUSGenesisCombatBoss_MQ302B_A_Battles.Add() ; #DEBUG_LINE_NO:1069
EndFunction

Event OnTimer(Int timerID)
  If timerID < StarbornData.Length ; #DEBUG_LINE_NO:1074
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:1075
    akArgs[0] = timerID as Var ; #DEBUG_LINE_NO:1076
    Self.CallFunction(StarbornData[timerID].StarbornUpdateFunctionName, akArgs) ; #DEBUG_LINE_NO:1077
    If Self.GetStageDone(StarbornData[timerID].StarbornBattleEndStage) ; #DEBUG_LINE_NO:1078
      MUSGenesisCombatBoss_MQ302B_A_Battles.Remove() ; #DEBUG_LINE_NO:1079
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(StarbornData[timerID].StarbornTimerDelay, timerID) ; #DEBUG_LINE_NO:1081
    EndIf ; #DEBUG_LINE_NO:
  ElseIf timerID == CONST_StarbornAdversary_CheckForStateChangeTimerID ; #DEBUG_LINE_NO:1083
    Self.StarbornAdversaryCheckForStateChange() ; #DEBUG_LINE_NO:1084
    If !adversaryBattleComplete ; #DEBUG_LINE_NO:1085
      Self.StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID) ; #DEBUG_LINE_NO:1086
    EndIf ; #DEBUG_LINE_NO:
  ElseIf timerID == CONST_AllyArrivalTimerID ; #DEBUG_LINE_NO:1088
    Self.TryToTeleportAllyForArrival() ; #DEBUG_LINE_NO:1089
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Var[] akArgs = Self.GetEventHandlerParameterData(akTarget as Actor) ; #DEBUG_LINE_NO:1096
  Int index = akArgs[3] as Int ; #DEBUG_LINE_NO:1097
  If index >= 0 ; #DEBUG_LINE_NO:1098
    akArgs[0] = (akAggressor as Actor) as Var ; #DEBUG_LINE_NO:1099
    Bool shouldReregister = Self.CallFunction(StarbornData[index].StarbornHitFunctionName, akArgs) as Bool ; #DEBUG_LINE_NO:1100
    If shouldReregister ; #DEBUG_LINE_NO:1101
      Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:1102
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
  Var[] akArgs = Self.GetEventHandlerParameterData(akSource) ; #DEBUG_LINE_NO:1109
  Int index = akArgs[3] as Int ; #DEBUG_LINE_NO:1110
  If index >= 0 ; #DEBUG_LINE_NO:1111
    akArgs[0] = akKiller as Var ; #DEBUG_LINE_NO:1112
    Self.CallFunction(StarbornData[index].StarbornDyingFunctionName, akArgs) ; #DEBUG_LINE_NO:1113
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
  Var[] akArgs = Self.GetEventHandlerParameterData(akSource as Actor) ; #DEBUG_LINE_NO:1119
  Int index = akArgs[3] as Int ; #DEBUG_LINE_NO:1120
  If index >= 0 ; #DEBUG_LINE_NO:1121
    akArgs[0] = akSpell as Var ; #DEBUG_LINE_NO:1122
    Self.CallFunction(StarbornData[index].StarbornSpellCastFunctionName, akArgs) ; #DEBUG_LINE_NO:1123
  EndIf ; #DEBUG_LINE_NO:
  If templeInteriorInitialized && !adversaryHasShiftedAwayFromTemple ; #DEBUG_LINE_NO:1125
    artifactRingsRef.PlayAnimation("FXPlay01") ; #DEBUG_LINE_NO:1128
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Var[] Function GetEventHandlerParameterData(Actor akSource)
  Var[] akArgs = new Var[4] ; #DEBUG_LINE_NO:1134
  akArgs[1] = akSource as Var ; #DEBUG_LINE_NO:1135
  Actor akEventLink = akSource.GetLinkedRef(LC165_StarbornEventActorLinkKeyword) as Actor ; #DEBUG_LINE_NO:1136
  If akEventLink == None ; #DEBUG_LINE_NO:1137
    akArgs[2] = akSource as Var ; #DEBUG_LINE_NO:1138
  Else ; #DEBUG_LINE_NO:
    akArgs[2] = akEventLink as Var ; #DEBUG_LINE_NO:1140
  EndIf ; #DEBUG_LINE_NO:
  akArgs[3] = StarbornData.findstruct("starbornActorRef", akArgs[2] as Actor, 0) as Var ; #DEBUG_LINE_NO:1142
  Return akArgs ; #DEBUG_LINE_NO:1143
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  Guard ChangeLocationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1148
    If akOldLoc == LC165BuriedTempleLocation && akNewLoc != LC165BuriedTempleLocation && player.GetCurrentLocation() != LC165BuriedTempleLocation ; #DEBUG_LINE_NO:1149
      Int I = 0 ; #DEBUG_LINE_NO:1151
      While I < StarbornData.Length ; #DEBUG_LINE_NO:1152
        Self.CancelTimer(I) ; #DEBUG_LINE_NO:1153
        I += 1 ; #DEBUG_LINE_NO:1154
      EndWhile ; #DEBUG_LINE_NO:
      MUSGenesisCombatBoss_MQ302B_A_Battles.Remove() ; #DEBUG_LINE_NO:1157
      ObjectReference test = Ally.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:1159
      Actor allyRef = Ally.GetActorRef() ; #DEBUG_LINE_NO:1160
      If allyRef != None && Self.GetStageDone(CONST_AllyJoinedStage) && allyRef.IsEnabled() ; #DEBUG_LINE_NO:1161
        SQ_Followers.SetRoleInactive(allyRef, True, False, True) ; #DEBUG_LINE_NO:1163
        Self.TeleportOut(allyRef, None, None, -1.0, True) ; #DEBUG_LINE_NO:1164
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akNewLoc == LC165BuriedTempleLocation ; #DEBUG_LINE_NO:1166
      Int i = 0 ; #DEBUG_LINE_NO:1168
      While i < StarbornData.Length ; #DEBUG_LINE_NO:1169
        If Self.GetStageDone(StarbornData[i].StarbornBattleStartStage) && !Self.GetStageDone(StarbornData[i].StarbornBattleEndStage) && StarbornData[i].StarbornUpdateFunctionName != "" ; #DEBUG_LINE_NO:1170
          Self.StartTimer(0.0, i) ; #DEBUG_LINE_NO:1171
          MUSGenesisCombatBoss_MQ302B_A_Battles.Add() ; #DEBUG_LINE_NO:1173
        EndIf ; #DEBUG_LINE_NO:
        i += 1 ; #DEBUG_LINE_NO:1175
      EndWhile ; #DEBUG_LINE_NO:
      ObjectReference test = Ally.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:1178
      Actor allyref = Ally.GetActorRef() ; #DEBUG_LINE_NO:1179
      If allyref != None && Self.GetStageDone(CONST_AllyJoinedStage) && allyref.IsDisabled() ; #DEBUG_LINE_NO:1180
        Float[] akOffsets = new Float[3] ; #DEBUG_LINE_NO:1182
        akOffsets[1] = CONST_AllyRejoinDistance as Float ; #DEBUG_LINE_NO:1183
        ObjectReference target = player.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True) ; #DEBUG_LINE_NO:1184
        target.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:1185
        allyref.MoveTo(target, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1186
        Self.TeleportIn(allyref as ObjectReference, None, None) ; #DEBUG_LINE_NO:1187
        allyref.EnableNoWait(False) ; #DEBUG_LINE_NO:1188
        SQ_Followers.SetRoleActive(allyref, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:1189
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor ; #DEBUG_LINE_NO:1198
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0 ; #DEBUG_LINE_NO:1199
    Self.StarbornEngineeringDisableRobots() ; #DEBUG_LINE_NO:1200
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor ; #DEBUG_LINE_NO:1205
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0 ; #DEBUG_LINE_NO:1206
    Self.StarbornEngineeringDisableRobots() ; #DEBUG_LINE_NO:1207
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Frenzy(sq_parentscript source, Var[] akArgs)
  Actor targetActor = akArgs[1] as Actor ; #DEBUG_LINE_NO:1212
  If StarbornEngineering_RobotsActive.Find(targetActor as ObjectReference) >= 0 || StarbornEngineering_RobotsInactive.Find(targetActor as ObjectReference) >= 0 ; #DEBUG_LINE_NO:1213
    Self.StarbornEngineeringDisableRobots() ; #DEBUG_LINE_NO:1214
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == artifactActivatorRef && (akActivator == player as ObjectReference) ; #DEBUG_LINE_NO:1220
    artifactActivatorRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1221
    player.AddAliasedItem(Artifact_MU as Form, MQ00_ArtifactsHolder as Alias, 1, True) ; #DEBUG_LINE_NO:1222
    Self.SetStage(CONST_Stage_PlayerTakesArtifactActivator) ; #DEBUG_LINE_NO:1223
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If akObj1 is Actor ; #DEBUG_LINE_NO:1229
    akObj1.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:1230
  Else ; #DEBUG_LINE_NO:
    akObj2.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:1232
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If waitingForLoadOutOfTemple ; #DEBUG_LINE_NO:1238
    waitingForLoadOutOfTemple = False ; #DEBUG_LINE_NO:1239
    Self.AwardFinalArtifactPower() ; #DEBUG_LINE_NO:1240
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateAndEVPIndex(Int starbornDataIndex, Spell spellToUpdate, Bool shouldAddSpell, Int starbornStateValue, Bool shouldRemoveFromPlayerFriendFaction, Bool shouldStartCombat)
  lc165questscript:starborndatum current = StarbornData[starbornDataIndex] ; #DEBUG_LINE_NO:1248
  Self.UpdateAndEVPActor(current.starbornActorRef, starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction, False) ; #DEBUG_LINE_NO:1249
  If current.StarbornDuplicatesCollection != None ; #DEBUG_LINE_NO:1250
    Actor[] currentDuplicates = current.StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:1251
    If currentDuplicates != None ; #DEBUG_LINE_NO:1252
      Int I = 0 ; #DEBUG_LINE_NO:1253
      While I < currentDuplicates.Length ; #DEBUG_LINE_NO:1254
        If currentDuplicates[I] != current.starbornActorRef ; #DEBUG_LINE_NO:1255
          Self.UpdateAndEVPActor(currentDuplicates[I], starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction, shouldStartCombat) ; #DEBUG_LINE_NO:1256
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:1258
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateAndEVPActor(Actor actorToUpdate, Int starbornDataIndex, Spell spellToUpdate, Bool shouldAddSpell, Int starbornStateValue, Bool shouldRemoveFromPlayerFriendFaction, Bool shouldStartCombat)
  If spellToUpdate != None ; #DEBUG_LINE_NO:1266
    If shouldAddSpell ; #DEBUG_LINE_NO:1267
      actorToUpdate.AddSpell(spellToUpdate, True) ; #DEBUG_LINE_NO:1268
    Else ; #DEBUG_LINE_NO:
      actorToUpdate.RemoveSpell(spellToUpdate) ; #DEBUG_LINE_NO:1270
    EndIf ; #DEBUG_LINE_NO:
    Var[] akArgs = new Var[3] ; #DEBUG_LINE_NO:1272
    akArgs[0] = actorToUpdate as Var ; #DEBUG_LINE_NO:1273
    akArgs[1] = starbornDataIndex as Var ; #DEBUG_LINE_NO:1274
    akArgs[2] = shouldAddSpell as Var ; #DEBUG_LINE_NO:1275
    Self.CallFunction(StarbornData[starbornDataIndex].StarbornSwapCombatStyleFunctionName, akArgs) ; #DEBUG_LINE_NO:1276
  EndIf ; #DEBUG_LINE_NO:
  If starbornStateValue != -1 ; #DEBUG_LINE_NO:1278
    actorToUpdate.SetValue(LC165_StarbornStateValue, starbornStateValue as Float) ; #DEBUG_LINE_NO:1279
  EndIf ; #DEBUG_LINE_NO:
  If shouldRemoveFromPlayerFriendFaction ; #DEBUG_LINE_NO:1281
    actorToUpdate.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:1282
  EndIf ; #DEBUG_LINE_NO:
  If (shouldRemoveFromPlayerFriendFaction || shouldStartCombat) && !actorToUpdate.IsDead() && !actorToUpdate.IsDisabled() ; #DEBUG_LINE_NO:1284
    actorToUpdate.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:1285
  EndIf ; #DEBUG_LINE_NO:
  actorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:1287
EndFunction

Bool Function ShouldUpdateMovement(Actor actorToUpdate, Int starbornDataIndex, Float healthLossPercentage)
  Bool healthUpdate = Self.ShouldUpdateMovementDueToHealthLoss(actorToUpdate, starbornDataIndex, healthLossPercentage) ; #DEBUG_LINE_NO:1292
  If healthUpdate ; #DEBUG_LINE_NO:1293
    Return True ; #DEBUG_LINE_NO:1295
  Else ; #DEBUG_LINE_NO:
    Bool timeUpdate = Self.ShouldUpdateMovementDueToTime(actorToUpdate, starbornDataIndex) ; #DEBUG_LINE_NO:1297
    If timeUpdate ; #DEBUG_LINE_NO:1298
      Return True ; #DEBUG_LINE_NO:1300
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:1303
EndFunction

Bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate, Int starbornDataIndex, Float healthLossPercentage)
  If healthLossPercentage == -1.0 ; #DEBUG_LINE_NO:1308
    healthLossPercentage = StarbornData[starbornDataIndex].StarbornMovementUpdate_HealthLossPercentage ; #DEBUG_LINE_NO:1309
  EndIf ; #DEBUG_LINE_NO:
  If healthLossPercentage > 0.0 ; #DEBUG_LINE_NO:1311
    Float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health) ; #DEBUG_LINE_NO:1312
    Float lastHealthPercentage = actorToUpdate.GetValue(LC165_StarbornMovementHealthPercentStampValue) ; #DEBUG_LINE_NO:1313
    If currentHealthPercentage < lastHealthPercentage - healthLossPercentage ; #DEBUG_LINE_NO:1314
      Return True ; #DEBUG_LINE_NO:1315
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:1318
EndFunction

Bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate, Int starbornDataIndex)
  Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:1323
  Float timeForNextMovementUpdate = 0.0 ; #DEBUG_LINE_NO:1324
  If StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime > 0.0 ; #DEBUG_LINE_NO:1325
    Float reachedTargetTime = actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue) ; #DEBUG_LINE_NO:1326
    If reachedTargetTime > 0.0 ; #DEBUG_LINE_NO:1327
      If currentTime < reachedTargetTime ; #DEBUG_LINE_NO:1329
        actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, currentTime) ; #DEBUG_LINE_NO:1331
        reachedTargetTime = currentTime ; #DEBUG_LINE_NO:1332
      EndIf ; #DEBUG_LINE_NO:
      timeForNextMovementUpdate = reachedTargetTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime ; #DEBUG_LINE_NO:1334
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If timeForNextMovementUpdate == 0.0 ; #DEBUG_LINE_NO:1337
    Float lastMovementUpdateTime = actorToUpdate.GetValue(LC165_StarbornMovementUpdateTimestampValue) ; #DEBUG_LINE_NO:1338
    If currentTime < lastMovementUpdateTime ; #DEBUG_LINE_NO:1340
      actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, currentTime) ; #DEBUG_LINE_NO:1342
      lastMovementUpdateTime = currentTime ; #DEBUG_LINE_NO:1343
    EndIf ; #DEBUG_LINE_NO:
    timeForNextMovementUpdate = lastMovementUpdateTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_NotAtTargetTime ; #DEBUG_LINE_NO:1345
  EndIf ; #DEBUG_LINE_NO:
  Return currentTime >= timeForNextMovementUpdate ; #DEBUG_LINE_NO:1347
EndFunction

ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate, Keyword HoldPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If potentialHoldPositionTargetsCol == None || potentialHoldPositionTargetsCol.GetCount() == 0 ; #DEBUG_LINE_NO:1352
    Return None ; #DEBUG_LINE_NO:1353
  Else ; #DEBUG_LINE_NO:
    ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray() ; #DEBUG_LINE_NO:1355
    If potentialHoldPositionTargets.Length == 1 ; #DEBUG_LINE_NO:1356
      Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, potentialHoldPositionTargets[0], shouldTeleport, shouldBeInvisibleAfterTeleport, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1357
    Else ; #DEBUG_LINE_NO:
      ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(HoldPositionKeyword) ; #DEBUG_LINE_NO:1359
      If currentHoldPositionTarget != None ; #DEBUG_LINE_NO:1360
        Int currentHoldPositionTargetIndex = potentialHoldPositionTargets.find(currentHoldPositionTarget, 0) ; #DEBUG_LINE_NO:1361
        If currentHoldPositionTargetIndex >= 0 ; #DEBUG_LINE_NO:1362
          potentialHoldPositionTargets.remove(currentHoldPositionTargetIndex, 1) ; #DEBUG_LINE_NO:1363
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1) ; #DEBUG_LINE_NO:1366
      ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex] ; #DEBUG_LINE_NO:1367
      Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:1368
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, Keyword HoldPositionKeyword, ObjectReference newHoldPositionTarget, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If actorToUpdate.GetLinkedRef(HoldPositionKeyword) != None && actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue) >= 0.0 ; #DEBUG_LINE_NO:1375
    Self.UnregisterForDistanceEvents(actorToUpdate as ScriptObject, actorToUpdate.GetLinkedRef(HoldPositionKeyword) as ScriptObject, -1) ; #DEBUG_LINE_NO:1376
  EndIf ; #DEBUG_LINE_NO:
  actorToUpdate.SetLinkedRef(newHoldPositionTarget, HoldPositionKeyword, True) ; #DEBUG_LINE_NO:1378
  If actorToUpdate.GetValue(LC165_BossHoldPositionValue) != CONST_StarbornShouldCastCombatSpellValue as Float ; #DEBUG_LINE_NO:1379
    actorToUpdate.SetValue(LC165_BossHoldPositionValue, 1.0 - actorToUpdate.GetValue(LC165_BossHoldPositionValue)) ; #DEBUG_LINE_NO:1380
  EndIf ; #DEBUG_LINE_NO:
  actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:1382
  actorToUpdate.SetValue(LC165_StarbornMovementHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health)) ; #DEBUG_LINE_NO:1383
  actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0.0) ; #DEBUG_LINE_NO:1384
  If newHoldPositionTarget != None ; #DEBUG_LINE_NO:1385
    Self.RegisterForDistanceLessThanEvent(actorToUpdate as ScriptObject, newHoldPositionTarget as ScriptObject, CONST_StarbornAtTargetDistance as Float, 0) ; #DEBUG_LINE_NO:1386
  EndIf ; #DEBUG_LINE_NO:
  actorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:1388
  If shouldTeleport && !actorToUpdate.IsDead() ; #DEBUG_LINE_NO:1389
    Self.CombatTeleportNoWait(actorToUpdate, newHoldPositionTarget, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:1390
  EndIf ; #DEBUG_LINE_NO:
  Return newHoldPositionTarget ; #DEBUG_LINE_NO:1392
EndFunction

Function StartAllyArrivalTimer()
  ObjectReference allyArrivalMarkerChainHeadRef = AllyArrivalMarker.GetRef() ; #DEBUG_LINE_NO:1400
  allyArrivalMarkerChain = allyArrivalMarkerChainHeadRef.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:1401
  allyArrivalMarkerChain.insert(allyArrivalMarkerChainHeadRef, 0) ; #DEBUG_LINE_NO:1402
  Self.StartTimer(0.0, CONST_AllyArrivalTimerID) ; #DEBUG_LINE_NO:1403
EndFunction

Function TryToTeleportAllyForArrival()
  ObjectReference allyArrivalTargetRef = None ; #DEBUG_LINE_NO:1407
  Int I = 0 ; #DEBUG_LINE_NO:1408
  While allyArrivalTargetRef == None && I < allyArrivalMarkerChain.Length ; #DEBUG_LINE_NO:1409
    If player.HasDetectionLOS(allyArrivalMarkerChain[I]) ; #DEBUG_LINE_NO:1410
      allyArrivalTargetRef = allyArrivalMarkerChain[I] ; #DEBUG_LINE_NO:1411
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1413
  EndWhile ; #DEBUG_LINE_NO:
  If allyArrivalTargetRef == None && allyArrivalAttempts < CONST_AllyArrivalAttemptsMax ; #DEBUG_LINE_NO:1415
    allyArrivalAttempts += 1 ; #DEBUG_LINE_NO:1416
    Self.StartTimer(CONST_AllyArrivalTimerDelay as Float, CONST_AllyArrivalTimerID) ; #DEBUG_LINE_NO:1417
  Else ; #DEBUG_LINE_NO:
    If allyArrivalTargetRef == None ; #DEBUG_LINE_NO:1419
      allyArrivalTargetRef = Game.FindClosestReferenceOfTypeFromRef(LC165_AllyArrivalMarker as Form, player as ObjectReference, 1000.0) ; #DEBUG_LINE_NO:1420
    EndIf ; #DEBUG_LINE_NO:
    If allyArrivalTargetRef == None ; #DEBUG_LINE_NO:1422
      allyArrivalTargetRef = allyArrivalMarkerChain[0] ; #DEBUG_LINE_NO:1423
    EndIf ; #DEBUG_LINE_NO:
    Self.NoncombatTeleport(Ally.GetActorRef(), allyArrivalTargetRef, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1425
    If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) ; #DEBUG_LINE_NO:1426
      MQ302_191_Entrance_EmissaryJoin.Start() ; #DEBUG_LINE_NO:1427
    Else ; #DEBUG_LINE_NO:
      MQ302_191_Entrance_HunterJoin.Start() ; #DEBUG_LINE_NO:1429
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeInit(Int starbornDataIndex)
  Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef ; #DEBUG_LINE_NO:1438
  starbornBridgeRef.SetValue(LC165_Starborn_Bridge_CombatStyleValue, CONST_Bridge_CombatStyle_Assault as Float) ; #DEBUG_LINE_NO:1439
  starbornBridgePrimary = Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False) ; #DEBUG_LINE_NO:1440
  Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False) ; #DEBUG_LINE_NO:1441
  Self.StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False) ; #DEBUG_LINE_NO:1442
  Int I = 0 ; #DEBUG_LINE_NO:1443
  Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:1444
  While I < duplicates.Length ; #DEBUG_LINE_NO:1445
    duplicates[I].MoveTo(LC165ExteriorHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1446
    duplicates[I].AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:1447
    duplicates[I].EnableNoWait(False) ; #DEBUG_LINE_NO:1448
    I += 1 ; #DEBUG_LINE_NO:1449
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeStart(Actor starbornBridgeRef, Int starbornDataIndex)
  bridgeBattleState = CONST_StarbornBattleState_Bridge_Start ; #DEBUG_LINE_NO:1454
  bridge_WaitingForParallelSelfCast = True ; #DEBUG_LINE_NO:1455
  starbornBridgePrimary.SetGhost(True) ; #DEBUG_LINE_NO:1456
  starbornBridgePrimary.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:1457
  Self.NoncombatTeleport(starbornBridgePrimary, starbornBridgeRef as ObjectReference, False, None, None, None, None, 0.0) ; #DEBUG_LINE_NO:1458
  MQ302_Battle_01_Bridge_BattleStart.Start() ; #DEBUG_LINE_NO:1459
  ObjectReference[] spawnPoints = StarbornBridge_InitialDuplicateSpawnPoints.GetArray() ; #DEBUG_LINE_NO:1460
  Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:1461
  Int I = 1 ; #DEBUG_LINE_NO:1462
  While I < duplicates.Length ; #DEBUG_LINE_NO:1463
    duplicates[I].RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:1464
    Self.CombatTeleport(duplicates[I], spawnPoints[I - 1], False, None, LC165_StarbornParallelSelfSpawnExplosion, None, None, 0.0) ; #DEBUG_LINE_NO:1465
    I += 1 ; #DEBUG_LINE_NO:1466
  EndWhile ; #DEBUG_LINE_NO:
  starbornBridgePrimary.SetGhost(False) ; #DEBUG_LINE_NO:1468
  starbornBridgePrimary.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0) ; #DEBUG_LINE_NO:1469
  Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False) ; #DEBUG_LINE_NO:1470
  bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_1 ; #DEBUG_LINE_NO:1471
  bridge_DuplicationLineCountdown = 1 ; #DEBUG_LINE_NO:1472
  bridge_WaitingForParallelSelfCast = False ; #DEBUG_LINE_NO:1473
EndFunction

Function StarbornBridgeUpdate(Int starbornDataIndex)
  If bridgeBattleState == CONST_StarbornBattleState_Bridge_RealEnemyExposed && StarbornData[starbornDataIndex].starbornActorRef.IsDead() ; #DEBUG_LINE_NO:1477
    bridgeBattleState = CONST_StarbornBattleState_Bridge_Complete ; #DEBUG_LINE_NO:1479
    If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0 ; #DEBUG_LINE_NO:1480
      Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage) ; #DEBUG_LINE_NO:1481
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage) ; #DEBUG_LINE_NO:1483
  ElseIf bridgeBattleState < CONST_StarbornBattleState_Bridge_RealEnemyExposed ; #DEBUG_LINE_NO:1484
    Actor[] bridgeRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:1486
    If bridgeRefs == None ; #DEBUG_LINE_NO:1487
      bridgeRefs = new Actor[0] ; #DEBUG_LINE_NO:1488
    EndIf ; #DEBUG_LINE_NO:
    Actor lastFoundDead = None ; #DEBUG_LINE_NO:1492
    Int I = bridgeRefs.Length - 1 ; #DEBUG_LINE_NO:1493
    While I >= 0 ; #DEBUG_LINE_NO:1494
      If bridgeRefs[I].IsDead() ; #DEBUG_LINE_NO:1495
        lastFoundDead = bridgeRefs[I] ; #DEBUG_LINE_NO:1496
        bridge_DeathCount += 1 ; #DEBUG_LINE_NO:1497
        Self.TeleportOutNoWait(bridgeRefs[I], LC165_AbParallelSelfDeath, None, -1.0, True) ; #DEBUG_LINE_NO:1498
        StarbornData[starbornDataIndex].StarbornDuplicatesCollection.RemoveRef(bridgeRefs[I] as ObjectReference) ; #DEBUG_LINE_NO:1499
        bridgeRefs.remove(I, 1) ; #DEBUG_LINE_NO:1500
      EndIf ; #DEBUG_LINE_NO:
      I -= 1 ; #DEBUG_LINE_NO:1502
    EndWhile ; #DEBUG_LINE_NO:
    If bridgeRefs.Length == 0 ; #DEBUG_LINE_NO:1506
      Self.StarbornBridgeSwapInRealStarborn(lastFoundDead, starbornDataIndex) ; #DEBUG_LINE_NO:1508
    ElseIf bridgeRefs.Length == 1 && bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_3 ; #DEBUG_LINE_NO:1509
      Self.StarbornBridgeSwapInRealStarborn(bridgeRefs[0], starbornDataIndex) ; #DEBUG_LINE_NO:1511
    ElseIf bridge_DuplicationLineCountdown >= 0 ; #DEBUG_LINE_NO:1515
      bridge_DuplicationLineCountdown -= 1 ; #DEBUG_LINE_NO:1516
      If bridge_DuplicationLineCountdown == 0 ; #DEBUG_LINE_NO:1517
        bridge_DuplicationLineCountdown = -1 ; #DEBUG_LINE_NO:1518
        I = 0 ; #DEBUG_LINE_NO:1519
        While I < bridgeRefs.Length ; #DEBUG_LINE_NO:1520
          bridgeRefs[I].SayCustom(LC165_Starborn_Bridge_DuplicationLines, None, False, None) ; #DEBUG_LINE_NO:1521
          I += 1 ; #DEBUG_LINE_NO:1522
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      If !bridge_WaitingForParallelSelfCast ; #DEBUG_LINE_NO:1527
        If bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1 && bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_2 ; #DEBUG_LINE_NO:1528
          bridge_WaitingForParallelSelfCast = True ; #DEBUG_LINE_NO:1529
          Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat, False, False) ; #DEBUG_LINE_NO:1530
        ElseIf bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2 && bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_3 ; #DEBUG_LINE_NO:1531
          bridge_WaitingForParallelSelfCast = True ; #DEBUG_LINE_NO:1532
          Self.UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat, False, False) ; #DEBUG_LINE_NO:1533
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If bridgeBattleState >= CONST_StarbornBattleState_Bridge_Parallelized_1 ; #DEBUG_LINE_NO:1538
        I = 0 ; #DEBUG_LINE_NO:1539
        While I < bridgeRefs.Length ; #DEBUG_LINE_NO:1540
          Actor currentRef = bridgeRefs[I] ; #DEBUG_LINE_NO:1541
          Int currentRefCombatStyle = currentRef.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as Int ; #DEBUG_LINE_NO:1542
          Bool shouldTeleport = False ; #DEBUG_LINE_NO:1543
          If !bridgeBoundsTriggerRef.IsInTrigger(currentRef as ObjectReference) && (!currentRef.GetParentCell() != LC165BuriedTemple03 as Bool) ; #DEBUG_LINE_NO:1544
            shouldTeleport = True ; #DEBUG_LINE_NO:1545
          ElseIf !bridgeHoldPositionTriggerRef.IsInTrigger(currentRef as ObjectReference) && bridgeHoldPositionTriggerRef.IsInTrigger(player as ObjectReference) && (currentRef.GetDistance(player as ObjectReference) > CONST_Bridge_BridgeCatchupTeleportDistance as Float) ; #DEBUG_LINE_NO:1547
            shouldTeleport = True ; #DEBUG_LINE_NO:1548
          ElseIf currentRef.GetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue) == 0.0 ; #DEBUG_LINE_NO:1550
            shouldTeleport = True ; #DEBUG_LINE_NO:1551
            currentRef.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0) ; #DEBUG_LINE_NO:1552
          ElseIf Self.ShouldUpdateMovementDueToHealthLoss(bridgeRefs[I], starbornDataIndex, -1.0) ; #DEBUG_LINE_NO:1554
            shouldTeleport = True ; #DEBUG_LINE_NO:1555
            currentRef.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentRef.GetValuePercentage(Health)) ; #DEBUG_LINE_NO:1556
          EndIf ; #DEBUG_LINE_NO:
          If shouldTeleport ; #DEBUG_LINE_NO:1559
            If currentRefCombatStyle == CONST_Bridge_CombatStyle_Charger ; #DEBUG_LINE_NO:1560
              ObjectReference teleportPoint = Game.FindClosestReferenceOfAnyTypeInListFromRef(LC165_Starborn_Bridge_TeleportPointMarkerList, player as ObjectReference, CONST_StarbornBridge_TeleportMarkerSearchRadius as Float) ; #DEBUG_LINE_NO:1561
              If teleportPoint == None ; #DEBUG_LINE_NO:1562
                teleportPoint = StarbornBridge_ChargerTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_ChargerTeleportPoints.GetCount() - 1)) ; #DEBUG_LINE_NO:1563
              EndIf ; #DEBUG_LINE_NO:
              Self.CombatTeleportNoWait(currentRef, teleportPoint, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1566
            ElseIf currentRefCombatStyle == CONST_Bridge_CombatStyle_Assault ; #DEBUG_LINE_NO:1567
              ObjectReference teleportpoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount() - 1)) ; #DEBUG_LINE_NO:1568
              Self.CombatTeleportNoWait(currentRef, teleportpoint, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1570
            Else ; #DEBUG_LINE_NO:
              ObjectReference teleportpoint = StarbornBridge_SniperTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_SniperTeleportPoints.GetCount() - 1)) ; #DEBUG_LINE_NO:1572
              Self.CombatTeleportNoWait(currentRef, teleportpoint, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1574
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:1577
        EndWhile ; #DEBUG_LINE_NO:
        If !Self.GetStageDone(CONST_Stage_BridgeStarbornParallelSelfReactStage) ; #DEBUG_LINE_NO:1579
          Self.SetStage(CONST_Stage_BridgeStarbornParallelSelfReactStage) ; #DEBUG_LINE_NO:1580
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeSpellCast(Form spellCast, Actor caster, Actor starbornBridgeRef, Int starbornDataIndex)
  If spellCast == LC165_Starborn_Bridge_ScriptedParallelSelfSpell as Form ; #DEBUG_LINE_NO:1589
    Guard BridgeParallelSelfGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1590
      If caster.GetValue(LC165_StarbornStateValue) == CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat as Float ; #DEBUG_LINE_NO:1591
        Self.UpdateAndEVPActor(caster, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False) ; #DEBUG_LINE_NO:1592
        Actor duplicate = Self.StarbornBridgeSpawnParallelSelf(caster, starbornBridgeRef, starbornDataIndex, True) ; #DEBUG_LINE_NO:1593
        Self.UpdateAndEVPActor(duplicate, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True, False) ; #DEBUG_LINE_NO:1594
        If bridge_WaitingForParallelSelfCast ; #DEBUG_LINE_NO:1595
          If bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1 ; #DEBUG_LINE_NO:1596
            bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_2 ; #DEBUG_LINE_NO:1597
          ElseIf bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2 ; #DEBUG_LINE_NO:1598
            bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_3 ; #DEBUG_LINE_NO:1599
          EndIf ; #DEBUG_LINE_NO:
          bridge_DuplicationLineCountdown = CONST_BridgeDuplicationLineCountdown_StartValue ; #DEBUG_LINE_NO:1601
          bridge_WaitingForParallelSelfCast = False ; #DEBUG_LINE_NO:1602
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeDying(ObjectReference akKiller, Actor target, Actor starbornBridgeRef, Int starbornDataIndex)
  If target == starbornBridgeRef ; #DEBUG_LINE_NO:1610
    Self.DissolveStarborn(starbornBridgeRef) ; #DEBUG_LINE_NO:1611
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeSwapCombatStyle(Actor starbornBridgeRef, Int starbornDataIndex, Bool shouldCastSpell)
  Self.StarbornBridgeSetCombatStyle(starbornBridgeRef, shouldCastSpell) ; #DEBUG_LINE_NO:1616
EndFunction

Actor Function StarbornBridgeSpawnParallelSelf(Actor source, Actor starbornBridgeRef, Int starbornDataIndex, Bool shouldTeleportAfterCreation)
  Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, source, starbornBridgeRef, StarbornData[starbornDataIndex].StarbornDuplicatesCollection, starbornDataIndex, True) ; #DEBUG_LINE_NO:1620
  Self.StarbornBridgeSelectCombatStyle(duplicate) ; #DEBUG_LINE_NO:1621
  Self.SetNewHoldPositionTargetRandom(duplicate, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornBridge_HoldPositionTrigger, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1622
  If shouldTeleportAfterCreation ; #DEBUG_LINE_NO:1623
    Self.CombatTeleportNearRef(duplicate, source as ObjectReference, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, True, False, None, LC165_StarbornParallelSelfSpawnExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:1624
  Else ; #DEBUG_LINE_NO:
    duplicate.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1.0) ; #DEBUG_LINE_NO:1626
  EndIf ; #DEBUG_LINE_NO:
  Return duplicate ; #DEBUG_LINE_NO:1628
EndFunction

Function StarbornBridgeSelectCombatStyle(Actor actorToUpdate)
  actorToUpdate.SetValue(LC165_Starborn_Bridge_CombatStyleValue, bridge_NextCombatStyle as Float) ; #DEBUG_LINE_NO:1632
  bridge_NextCombatStyle = (bridge_NextCombatStyle + 1) % 3 ; #DEBUG_LINE_NO:1633
  Self.StarbornBridgeSetCombatStyle(actorToUpdate, False) ; #DEBUG_LINE_NO:1634
EndFunction

Function StarbornBridgeSetCombatStyle(Actor actorToUpdate, Bool shouldCastSpell)
  Int combatStyleValue = actorToUpdate.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as Int ; #DEBUG_LINE_NO:1638
  If shouldCastSpell ; #DEBUG_LINE_NO:1639
    If combatStyleValue == CONST_Bridge_CombatStyle_Charger ; #DEBUG_LINE_NO:1640
      actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge_CastCombatSpell) ; #DEBUG_LINE_NO:1641
    ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Assault ; #DEBUG_LINE_NO:1642
      actorToUpdate.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell) ; #DEBUG_LINE_NO:1643
    ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Sniper ; #DEBUG_LINE_NO:1644
      actorToUpdate.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell) ; #DEBUG_LINE_NO:1645
    EndIf ; #DEBUG_LINE_NO:
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Charger ; #DEBUG_LINE_NO:1648
    actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge) ; #DEBUG_LINE_NO:1649
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Assault ; #DEBUG_LINE_NO:1650
    actorToUpdate.SetCombatStyle(csStarborn_Assault) ; #DEBUG_LINE_NO:1651
  ElseIf combatStyleValue == CONST_Bridge_CombatStyle_Sniper ; #DEBUG_LINE_NO:1652
    actorToUpdate.SetCombatStyle(csStarborn_Sniper) ; #DEBUG_LINE_NO:1653
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeSwapInRealStarborn(Actor oldActor, Int starbornDataIndex)
  bridgeBattleState = CONST_StarbornBattleState_Bridge_RealEnemyExposed ; #DEBUG_LINE_NO:1659
  Self.TeleportOut(oldActor, None, None, -1.0, False) ; #DEBUG_LINE_NO:1661
  Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef ; #DEBUG_LINE_NO:1662
  If oldActor.IsDead() ; #DEBUG_LINE_NO:1663
    oldActor.DisableNoWait(False) ; #DEBUG_LINE_NO:1664
    Self.TeleportIn(oldActor as ObjectReference, None, None) ; #DEBUG_LINE_NO:1665
    starbornBridgeRef.MoveTo(oldActor as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1666
    starbornBridgeRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1667
    starbornBridgeRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1668
    starbornBridgeRef.Kill(None) ; #DEBUG_LINE_NO:1669
    oldActor.Delete() ; #DEBUG_LINE_NO:1670
  Else ; #DEBUG_LINE_NO:
    Float healthLost = oldActor.GetBaseValue(Health) - oldActor.GetValue(Health) ; #DEBUG_LINE_NO:1672
    oldActor.DisableNoWait(False) ; #DEBUG_LINE_NO:1673
    ObjectReference teleportPoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount() - 1)) ; #DEBUG_LINE_NO:1674
    Self.TeleportIn(teleportPoint, None, None) ; #DEBUG_LINE_NO:1675
    starbornBridgeRef.MoveTo(teleportPoint, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1676
    starbornBridgeRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1677
    starbornBridgeRef.DamageValue(Health, healthLost) ; #DEBUG_LINE_NO:1678
    starbornBridgeRef.SetCombatStyle(csStarborn_Assault) ; #DEBUG_LINE_NO:1679
    Self.UpdateAndEVPActor(starbornBridgeRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Bridge_Normal, True, False) ; #DEBUG_LINE_NO:1680
    starbornBridgeRef.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:1681
    oldActor.Delete() ; #DEBUG_LINE_NO:1682
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornBridgeForceRescueTeleport(Actor rescueTriggerActor)
  If StarbornData[CONST_Bridge_DataIndex].StarbornDuplicatesCollection.GetArray().find(rescueTriggerActor as ObjectReference, 0) >= 0 ; #DEBUG_LINE_NO:1687
    rescueTriggerActor.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 0.0) ; #DEBUG_LINE_NO:1689
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornCourtyardStart(Actor starbornCourtyardRef, Int starbornDataIndex)
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1702
    CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateReady ; #DEBUG_LINE_NO:1703
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  MQ302_Battle_02_Courtyard_MassReanimate01.Start() ; #DEBUG_LINE_NO:1705
EndFunction

Function StarbornCourtyardUpdate(Int starbornDataIndex)
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1709
    Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef ; #DEBUG_LINE_NO:1710
    If starbornCourtyardRef.IsDead() ; #DEBUG_LINE_NO:1713
      Self.DropStarbornItem(starbornCourtyardRef, ExteriorIDCard.GetRef()) ; #DEBUG_LINE_NO:1714
      ExteriorIDCardFallback.GetRef().MoveTo(ExteriorIDCardFallbackSpawnPoint.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1715
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Complete ; #DEBUG_LINE_NO:1716
      StarbornCourtyard_Navcut.DisableAll(False) ; #DEBUG_LINE_NO:1717
      If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0 ; #DEBUG_LINE_NO:1718
        Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage) ; #DEBUG_LINE_NO:1719
      EndIf ; #DEBUG_LINE_NO:
      Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage) ; #DEBUG_LINE_NO:1721
      Self.CleanupScriptedActors(CourtyardReanimateTargetsAll, -1, False, None, None, -1.0) ; #DEBUG_LINE_NO:1722
      Return  ; #DEBUG_LINE_NO:1723
    EndIf ; #DEBUG_LINE_NO:
    If CourtyardBattleState < CONST_StarbornBattleState_Courtyard_Normal ; #DEBUG_LINE_NO:1726
      If CourtyardBattleState == CONST_StarbornBattleState_Courtyard_FirstReanimateActive && Self.GetCourtyardZombiesCount() < CONST_Courtyard_SecondReanimateZombieThreshold ; #DEBUG_LINE_NO:1728
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateReady ; #DEBUG_LINE_NO:1729
        MQ302_Battle_02_Courtyard_MassReanimate02.Start() ; #DEBUG_LINE_NO:1730
      ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateActive && Self.GetCourtyardZombiesCount() < CONST_Courtyard_ThirdReanimateZombieThreshold ; #DEBUG_LINE_NO:1731
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateReady ; #DEBUG_LINE_NO:1732
        MQ302_Battle_02_Courtyard_MassReanimate03.Start() ; #DEBUG_LINE_NO:1733
      ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateActive ; #DEBUG_LINE_NO:1734
        CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Normal ; #DEBUG_LINE_NO:1735
        Self.SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, True, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1736
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.ShouldUpdateMovement(starbornCourtyardRef, starbornDataIndex, -1.0) ; #DEBUG_LINE_NO:1741
      Self.StarbornCourtyardTryToTeleportSwapWithZombie(starbornDataIndex) ; #DEBUG_LINE_NO:1742
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornCourtyardDying(ObjectReference akKiller, Actor target, Actor starbornCourtyardRef, Int starbornDataIndex)
  If target == starbornCourtyardRef ; #DEBUG_LINE_NO:1749
    Self.DissolveStarborn(starbornCourtyardRef) ; #DEBUG_LINE_NO:1750
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PerformCourtyardScriptedMassReanimateNoWait()
  Self.CallFunctionNoWait("PerformCourtyardScriptedMassReanimate", None) ; #DEBUG_LINE_NO:1755
EndFunction

Function PerformCourtyardScriptedMassReanimate()
  Guard CourtyardBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1759
    Actor starbornCourtyardRef = StarbornData[CONST_Courtyard_DataIndex].starbornActorRef ; #DEBUG_LINE_NO:1760
    Actor[] actorsToReanimate = None ; #DEBUG_LINE_NO:1761
    If CourtyardBattleState == CONST_StarbornBattleState_Courtyard_Initial ; #DEBUG_LINE_NO:1762
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateActive ; #DEBUG_LINE_NO:1763
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave01.GetArray() as Actor[] ; #DEBUG_LINE_NO:1764
      Self.SetStage(CONST_Courtyard_FirstReanimateActiveStage) ; #DEBUG_LINE_NO:1765
    ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateReady ; #DEBUG_LINE_NO:1766
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateActive ; #DEBUG_LINE_NO:1767
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave02.GetArray() as Actor[] ; #DEBUG_LINE_NO:1768
    ElseIf CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateReady ; #DEBUG_LINE_NO:1769
      CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateActive ; #DEBUG_LINE_NO:1770
      actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave03.GetArray() as Actor[] ; #DEBUG_LINE_NO:1771
      Self.SetStage(CONST_Courtyard_ThirdReanimateActiveStage) ; #DEBUG_LINE_NO:1772
      Self.UpdateAndEVPActor(starbornCourtyardRef, CONST_Courtyard_DataIndex, None, False, CONST_StarbornStateValue_Courtyard_Normal, True, False) ; #DEBUG_LINE_NO:1773
    EndIf ; #DEBUG_LINE_NO:
    Self.StartScriptedReanimate(starbornCourtyardRef, actorsToReanimate, CONST_Courtyard_PerReanimateDelay) ; #DEBUG_LINE_NO:1776
    Utility.Wait(CONST_Courtyard_MassReanimateDelay as Float) ; #DEBUG_LINE_NO:1779
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornCourtyardTryToTeleportSwapWithZombie(Int starbornDataIndex)
  Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef ; #DEBUG_LINE_NO:1784
  Self.SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1785
  Actor firstLivingCourtyardZombie = None ; #DEBUG_LINE_NO:1786
  Actor[] allCourtyardZombies = commonarrayfunctions.CopyAndRandomizeActorArray(CourtyardReanimateTargetsAll) ; #DEBUG_LINE_NO:1787
  Int I = 0 ; #DEBUG_LINE_NO:1788
  While I < allCourtyardZombies.Length && firstLivingCourtyardZombie == None ; #DEBUG_LINE_NO:1789
    If !allCourtyardZombies[I].IsDead() ; #DEBUG_LINE_NO:1790
      firstLivingCourtyardZombie = allCourtyardZombies[I] ; #DEBUG_LINE_NO:1791
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1793
  EndWhile ; #DEBUG_LINE_NO:
  If firstLivingCourtyardZombie != None ; #DEBUG_LINE_NO:1795
    If !starbornCourtyardRef.IsDead() && !firstLivingCourtyardZombie.IsDead() ; #DEBUG_LINE_NO:1796
      courtyardLastSwapMarker2 = firstLivingCourtyardZombie.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:1797
      courtyardLastSwapMarker2.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:1798
      courtyardLastSwapMarker1 = starbornCourtyardRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:1799
      Self.TeleportIn(starbornCourtyardRef as ObjectReference, None, LC165_StarbornTeleportSwapExplosion) ; #DEBUG_LINE_NO:1800
      Self.TeleportIn(firstLivingCourtyardZombie as ObjectReference, None, LC165_StarbornTeleportSwapExplosion) ; #DEBUG_LINE_NO:1801
      starbornCourtyardRef.MoveTo(courtyardLastSwapMarker2, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1802
      firstLivingCourtyardZombie.MoveTo(courtyardLastSwapMarker1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1803
      courtyardLastSwapMarker1.Delete() ; #DEBUG_LINE_NO:1804
      courtyardLastSwapMarker2.Delete() ; #DEBUG_LINE_NO:1805
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Int Function GetCourtyardZombiesCount()
  Int count = Self.CountScriptedReanimate(CourtyardReanimateTargetsAll) ; #DEBUG_LINE_NO:1811
  Return count ; #DEBUG_LINE_NO:1813
EndFunction

Function DEBUG_KillCourtyardZombies(Int numToKill)
  Self.CleanupScriptedActors(CourtyardReanimateTargetsAll, numToKill, False, None, None, -1.0) ; #DEBUG_LINE_NO:1817
EndFunction

Event IDCardReader.IDReaderActivatedSuccess(idcardreader akSource, Var[] akArgs)
  If akSource == exteriorIDCardReaderRef ; #DEBUG_LINE_NO:1825
    Self.SetStage(CONST_Stage_ExteriorIDCardReaderUsedStage) ; #DEBUG_LINE_NO:1826
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StarbornEngineeringStart(Actor starbornFireRef, Int starbornDataIndex)
  Self.SetNewHoldPositionTarget(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef(), False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1840
  Self.SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef().GetLinkedRef(None), False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1841
  ObjectReference EngineeringGravityWellSourceMarkerInitial = StarbornEngineering_GravityWellSourceMarkerInitial.GetRef() ; #DEBUG_LINE_NO:1844
  Self.CreateScriptedGraityWell(EngineeringGravityWellSourceMarkerInitial) ; #DEBUG_LINE_NO:1845
  scriptedGravWellTimestamp = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:1846
  Utility.Wait(CONST_StarbornEngineering_InitialAppearanceDelay as Float) ; #DEBUG_LINE_NO:1847
  Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True) ; #DEBUG_LINE_NO:1848
  Self.NoncombatTeleport(starbornIceActorRef, starbornIceActorRef as ObjectReference, False, None, LC165_StarbornTeleportInExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:1851
  Self.UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, None, False, CONST_StarbornStateValue_Engineering_Normal, True, False) ; #DEBUG_LINE_NO:1852
  Float[] fireMarkerOffsetValues = new Float[3] ; #DEBUG_LINE_NO:1854
  fireMarkerOffsetValues[2] = 2.0 ; #DEBUG_LINE_NO:1855
  ObjectReference fireMarker = EngineeringGravityWellSourceMarkerInitial.PlaceAtMe(XMarker as Form, 1, False, False, True, fireMarkerOffsetValues, None, True) ; #DEBUG_LINE_NO:1856
  Self.NoncombatTeleport(starbornFireActorRef, fireMarker, False, None, LC165_StarbornTeleportInExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:1857
  Self.UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, None, False, CONST_StarbornStateValue_Engineering_Normal, True, False) ; #DEBUG_LINE_NO:1858
  fireMarker.Delete() ; #DEBUG_LINE_NO:1859
  MQ302_Battle_03_Engineering_BattleStart.Start() ; #DEBUG_LINE_NO:1861
  StarbornEngineering_GravityWellSourceMarkers.RemoveRef(EngineeringGravityWellSourceMarkerInitial) ; #DEBUG_LINE_NO:1862
  EngineeringGravityWellSourceMarkerInitial.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1863
  Actor[] EngineeringTurrets = StarbornEngineering_TurretsAll.GetArray() as Actor[] ; #DEBUG_LINE_NO:1866
  Int I = 0 ; #DEBUG_LINE_NO:1867
  While I < EngineeringTurrets.Length ; #DEBUG_LINE_NO:1868
    EngineeringTurrets[I].SetUnconscious(False) ; #DEBUG_LINE_NO:1869
    I += 1 ; #DEBUG_LINE_NO:1870
  EndWhile ; #DEBUG_LINE_NO:
  robotpodscript[] EngineeringRobotsInitial = StarbornEngineering_RobotsActive.GetArray() as robotpodscript[] ; #DEBUG_LINE_NO:1872
  I = 0 ; #DEBUG_LINE_NO:1873
  While I < EngineeringRobotsInitial.Length ; #DEBUG_LINE_NO:1874
    EngineeringRobotsInitial[I].WakeRobotFromPod() ; #DEBUG_LINE_NO:1875
    EngineeringRobotsInitial[I].StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:1876
    I += 1 ; #DEBUG_LINE_NO:1877
  EndWhile ; #DEBUG_LINE_NO:
  EngineeringBattleState = CONST_StarbornBattleState_Engineering_Normal ; #DEBUG_LINE_NO:1880
EndFunction

Function StarbornEngineeringUpdate(Int starbornDataIndex)
  If !starbornFireDead && starbornFireActorRef.IsDead() ; #DEBUG_LINE_NO:1885
    starbornFireDead = True ; #DEBUG_LINE_NO:1886
    If !starbornIceDead ; #DEBUG_LINE_NO:1887
      starbornFireHasKey = False ; #DEBUG_LINE_NO:1888
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(StarbornData[CONST_Fire_DataIndex].StarbornBattleDeathStage) ; #DEBUG_LINE_NO:1890
  EndIf ; #DEBUG_LINE_NO:
  If !starbornIceDead && starbornIceActorRef.IsDead() ; #DEBUG_LINE_NO:1892
    starbornIceDead = True ; #DEBUG_LINE_NO:1893
    If !starbornFireDead ; #DEBUG_LINE_NO:1894
      starbornFireHasKey = True ; #DEBUG_LINE_NO:1895
    EndIf ; #DEBUG_LINE_NO:
    Self.DestroyScriptedGravityWell(None, False) ; #DEBUG_LINE_NO:1897
    Self.SetStage(StarbornData[CONST_Ice_DataIndex].StarbornBattleDeathStage) ; #DEBUG_LINE_NO:1898
  EndIf ; #DEBUG_LINE_NO:
  If starbornFireDead && starbornIceDead ; #DEBUG_LINE_NO:1900
    If starbornFireHasKey ; #DEBUG_LINE_NO:1901
      Self.DropStarbornItem(starbornFireActorRef, EngineeringKey.GetRef()) ; #DEBUG_LINE_NO:1902
    Else ; #DEBUG_LINE_NO:
      Self.DropStarbornItem(starbornIceActorRef, EngineeringKey.GetRef()) ; #DEBUG_LINE_NO:1904
    EndIf ; #DEBUG_LINE_NO:
    EngineeringKeyFallback.GetRef().MoveTo(EngineeringKeyFallbackSpawnPoint.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1906
    Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage) ; #DEBUG_LINE_NO:1907
    EngineeringBattleState = CONST_StarbornBattleState_Engineering_Complete ; #DEBUG_LINE_NO:1908
  EndIf ; #DEBUG_LINE_NO:
  Bool shouldUpdateFireMovement = !starbornFireDead && Self.ShouldUpdateMovement(starbornFireActorRef, CONST_Fire_DataIndex, -1.0) ; #DEBUG_LINE_NO:1912
  Bool shouldUpdateIceMovement = !starbornIceDead && Self.ShouldUpdateMovement(starbornIceActorRef, CONST_Ice_DataIndex, -1.0) ; #DEBUG_LINE_NO:1913
  If shouldUpdateFireMovement || shouldUpdateIceMovement ; #DEBUG_LINE_NO:1914
    ObjectReference fireHoldPositionTarget = Self.SetNewHoldPositionTargetRandom(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargets, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1915
    If !starbornIceDead ; #DEBUG_LINE_NO:1916
      Self.SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, fireHoldPositionTarget.GetLinkedRef(None), False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:1917
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:1922
  If currentTime < scriptedGravWellTimestamp ; #DEBUG_LINE_NO:1924
    scriptedGravWellTimestamp = currentTime ; #DEBUG_LINE_NO:1926
  EndIf ; #DEBUG_LINE_NO:
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1928
    If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:1929
      Float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellCastDelay ; #DEBUG_LINE_NO:1930
      If currentTime < nextGravWellTime ; #DEBUG_LINE_NO:1932
        nextGravWellTime = currentTime ; #DEBUG_LINE_NO:1933
      EndIf ; #DEBUG_LINE_NO:
      If currentTime >= nextGravWellTime ; #DEBUG_LINE_NO:1935
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToCreate ; #DEBUG_LINE_NO:1936
        Self.UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, True, -1, False, False) ; #DEBUG_LINE_NO:1937
      EndIf ; #DEBUG_LINE_NO:
    ElseIf starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToDetonate ; #DEBUG_LINE_NO:1939
      Float detonateTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellDetonateDelay ; #DEBUG_LINE_NO:1940
      If currentTime < detonateTime ; #DEBUG_LINE_NO:1942
        detonateTime = currentTime ; #DEBUG_LINE_NO:1943
      EndIf ; #DEBUG_LINE_NO:
      If currentTime >= detonateTime ; #DEBUG_LINE_NO:1945
        If !starbornFireDead ; #DEBUG_LINE_NO:1946
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:1947
          Self.UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, True, -1, False, False) ; #DEBUG_LINE_NO:1948
        Else ; #DEBUG_LINE_NO:
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:1950
          Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:1951
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:1954
      Float cleanupTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellDetonateDelay * 1.5 ; #DEBUG_LINE_NO:1955
      If currentTime < cleanupTime ; #DEBUG_LINE_NO:1957
        cleanupTime = currentTime ; #DEBUG_LINE_NO:1958
      EndIf ; #DEBUG_LINE_NO:
      If currentTime >= cleanupTime ; #DEBUG_LINE_NO:1960
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:1961
        Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:1962
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  If !starbornEngineering_RobotsDisabled ; #DEBUG_LINE_NO:1968
    robotpodscript[] EngineeringRobotsActive = StarbornEngineering_RobotsActive.GetArray() as robotpodscript[] ; #DEBUG_LINE_NO:1969
    Int I = 0 ; #DEBUG_LINE_NO:1970
    While I < EngineeringRobotsActive.Length ; #DEBUG_LINE_NO:1971
      If EngineeringRobotsActive[I].IsDead() ; #DEBUG_LINE_NO:1972
        StarbornEngineering_RobotsActive.RemoveRef(EngineeringRobotsActive[I] as ObjectReference) ; #DEBUG_LINE_NO:1973
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:1975
    EndWhile ; #DEBUG_LINE_NO:
    Int robotsToActivate = CONST_StarbornEngineering_ActiveRobotCountMax - StarbornEngineering_RobotsActive.GetCount() ; #DEBUG_LINE_NO:1977
    If robotsToActivate > 0 && !Self.GetStageDone(CONST_Stage_EngineeringRobotReactStage) ; #DEBUG_LINE_NO:1978
      Self.SetStage(CONST_Stage_EngineeringRobotReactStage) ; #DEBUG_LINE_NO:1979
    EndIf ; #DEBUG_LINE_NO:
    While robotsToActivate > 0 && StarbornEngineering_RobotsInactive.GetCount() > 0 ; #DEBUG_LINE_NO:1981
      robotpodscript nextRobot = StarbornEngineering_RobotsInactive.GetAt(0) as robotpodscript ; #DEBUG_LINE_NO:1982
      StarbornEngineering_RobotsInactive.RemoveRef(nextRobot as ObjectReference) ; #DEBUG_LINE_NO:1983
      StarbornEngineering_RobotsActive.AddRef(nextRobot as ObjectReference) ; #DEBUG_LINE_NO:1984
      nextRobot.WakeRobotFromPod() ; #DEBUG_LINE_NO:1985
      nextRobot.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:1986
      robotsToActivate -= 1 ; #DEBUG_LINE_NO:1987
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornEngineeringDying(ObjectReference akKiller, Actor target, Actor starbornEngineeringRef, Int starbornDataIndex)
  If target == starbornEngineeringRef ; #DEBUG_LINE_NO:1993
    Self.DissolveStarborn(starbornEngineeringRef) ; #DEBUG_LINE_NO:1994
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornEngineeringDisableRobots()
  Self.SetStage(CONST_Stage_EngineeringHackedStage) ; #DEBUG_LINE_NO:1999
  StarbornEngineering_RobotsInactive.RemoveAll() ; #DEBUG_LINE_NO:2000
  StarbornEngineering_RobotsActive.RemoveAll() ; #DEBUG_LINE_NO:2001
  starbornEngineering_RobotsDisabled = True ; #DEBUG_LINE_NO:2002
EndFunction

Function StarbornFireSpellCast(Form spellCast, Actor caster, Actor starbornFireRef, Int starbornDataIndex)
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2006
    If spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell as Form ; #DEBUG_LINE_NO:2007
      Self.UpdateAndEVPActor(starbornFireRef, starbornDataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, False, -1, False, False) ; #DEBUG_LINE_NO:2008
      If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:2009
        starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2010
        Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True) ; #DEBUG_LINE_NO:2011
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornIceSpellCast(Form spellCast, Actor caster, Actor starbornIceRef, Int starbornDataIndex)
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2018
    If spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell as Form ; #DEBUG_LINE_NO:2019
      Self.UpdateAndEVPActor(starbornIceRef, starbornDataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, False, -1, False, False) ; #DEBUG_LINE_NO:2020
      If starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToCreate ; #DEBUG_LINE_NO:2021
        starbornEngineering_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Engineering_GravityWellSourceMarker as Form, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornEngineering_GravWellCastDistance) ; #DEBUG_LINE_NO:2022
        scriptedGravWellTimestamp = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:2023
        If starbornEngineering_GravWellTargetPoint == None ; #DEBUG_LINE_NO:2024
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2025
        Else ; #DEBUG_LINE_NO:
          starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToDetonate ; #DEBUG_LINE_NO:2027
          Self.CreateScriptedGraityWell(starbornEngineering_GravWellTargetPoint) ; #DEBUG_LINE_NO:2028
          StarbornEngineering_GravityWellSourceMarkers.RemoveRef(starbornEngineering_GravWellTargetPoint) ; #DEBUG_LINE_NO:2029
          starbornEngineering_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2030
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornFireSwapCombatStyle(Actor starbornFireRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell ; #DEBUG_LINE_NO:2038
    starbornFireRef.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell) ; #DEBUG_LINE_NO:2039
  Else ; #DEBUG_LINE_NO:
    starbornFireRef.SetCombatStyle(csStarborn_Assault) ; #DEBUG_LINE_NO:2041
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornIceSwapCombatStyle(Actor starbornIceRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell ; #DEBUG_LINE_NO:2046
    starbornIceRef.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell) ; #DEBUG_LINE_NO:2047
  Else ; #DEBUG_LINE_NO:
    starbornIceRef.SetCombatStyle(csStarborn_Sniper) ; #DEBUG_LINE_NO:2049
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckPetrovFailsafe()
  If MQ302BPetrov.GetActorRef().IsDead() ; #DEBUG_LINE_NO:2060
    PetrovsDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:2061
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayInitialElevatorLeverSFX()
  WwiseEvent_OBJElevatorLoadStart.Play(ElevatorTopActivator.GetRef(), None, None) ; #DEBUG_LINE_NO:2074
EndFunction

Function SetupElevators()
  ObjectReference elevator01PlatformHelperRef = Elevator01EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword) ; #DEBUG_LINE_NO:2078
  elevator01PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1.0) ; #DEBUG_LINE_NO:2079
  elevator01PlatformHelperRef.SetAnimationVariableFloat("Position", 0.0) ; #DEBUG_LINE_NO:2080
  elevator01PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator01Speed) ; #DEBUG_LINE_NO:2081
  ObjectReference elevator02PlatformHelperRef = Elevator02EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword) ; #DEBUG_LINE_NO:2083
  elevator02PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1.0) ; #DEBUG_LINE_NO:2084
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Position", 0.0) ; #DEBUG_LINE_NO:2085
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator02Speed) ; #DEBUG_LINE_NO:2086
EndFunction

Function PlayElevator01NoWait()
  ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef() ; #DEBUG_LINE_NO:2090
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False) ; #DEBUG_LINE_NO:2091
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable(False) ; #DEBUG_LINE_NO:2092
  elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:2093
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimation("Play01") ; #DEBUG_LINE_NO:2094
EndFunction

Function DisableElevator01()
  ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef() ; #DEBUG_LINE_NO:2098
  elevator01EnableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:2099
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).DisableNoWait(False) ; #DEBUG_LINE_NO:2100
  elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).DisableNoWait(False) ; #DEBUG_LINE_NO:2101
  wwiseevent.StopInstance(elevatorSFXID) ; #DEBUG_LINE_NO:2102
EndFunction

Function PlayElevator02NoWait()
  Self.CallFunctionNoWait("PlayElevator02", None) ; #DEBUG_LINE_NO:2106
EndFunction

Function PlayElevator02()
  ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef() ; #DEBUG_LINE_NO:2110
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False) ; #DEBUG_LINE_NO:2111
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable(False) ; #DEBUG_LINE_NO:2112
  elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:2113
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:2114
  wwiseevent.StopInstance(elevatorSFXID) ; #DEBUG_LINE_NO:2115
  ObjectReference elevator02GateRef = Elevator02Gate.GetRef() ; #DEBUG_LINE_NO:2117
  elevator02GateRef.SetOpen(True) ; #DEBUG_LINE_NO:2118
  Int failsafe = 0 ; #DEBUG_LINE_NO:2119
  While elevator02GateRef.GetOpenState() != CONST_OpenState_Open && failsafe < CONST_ElevatorGateOpenFailsafeCount ; #DEBUG_LINE_NO:2120
    failsafe += 1 ; #DEBUG_LINE_NO:2121
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:2122
  EndWhile ; #DEBUG_LINE_NO:
  ElevatorTopDoor.TryToEnable() ; #DEBUG_LINE_NO:2125
  ElevatorTopActivator.TryToDisable() ; #DEBUG_LINE_NO:2126
  ElevatorBottomDoor.TryToEnable() ; #DEBUG_LINE_NO:2127
  ElevatorBottomActivator.TryToDisable() ; #DEBUG_LINE_NO:2128
  Elevator02FinishedAnimation = True ; #DEBUG_LINE_NO:2130
EndFunction

Function QuickstartElevator02()
  ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef() ; #DEBUG_LINE_NO:2134
  elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable(False) ; #DEBUG_LINE_NO:2135
  ObjectReference elevator02PlatformHelperRef = elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword) ; #DEBUG_LINE_NO:2136
  elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", 1.0) ; #DEBUG_LINE_NO:2137
  elevator02PlatformHelperRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:2138
  ObjectReference elevator02GateRef = Elevator02Gate.GetRef() ; #DEBUG_LINE_NO:2140
  elevator02GateRef.SetOpen(True) ; #DEBUG_LINE_NO:2141
  ElevatorTopDoor.TryToEnable() ; #DEBUG_LINE_NO:2142
  ElevatorTopActivator.TryToDisable() ; #DEBUG_LINE_NO:2143
  ElevatorBottomDoor.TryToEnable() ; #DEBUG_LINE_NO:2144
  ElevatorBottomActivator.TryToDisable() ; #DEBUG_LINE_NO:2145
  Elevator02FinishedAnimation = True ; #DEBUG_LINE_NO:2147
EndFunction

Function StarbornRuinsStart(Actor starbornRuinsRef, Int starbornDataIndex)
  MQ302_Battle_05_Ruins_BattleStart.Start() ; #DEBUG_LINE_NO:2160
  Actor[] initialDemons = None ; #DEBUG_LINE_NO:2163
  If !DEBUG_StarbornRuinsBlockDemonSpawning ; #DEBUG_LINE_NO:2164
    ObjectReference initialSpawnPointHead = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef() ; #DEBUG_LINE_NO:2165
    ObjectReference[] initialSpawnPoints = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef().GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:2166
    initialSpawnPoints.insert(initialSpawnPointHead, 0) ; #DEBUG_LINE_NO:2167
    initialDemons = new Actor[0] ; #DEBUG_LINE_NO:2168
    Int i = 0 ; #DEBUG_LINE_NO:2169
    While i < initialSpawnPoints.Length ; #DEBUG_LINE_NO:2170
      Actor currentDemon = Self.StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex, initialSpawnPoints[i], False) ; #DEBUG_LINE_NO:2171
      initialDemons.add(currentDemon, 1) ; #DEBUG_LINE_NO:2172
      Utility.Wait(CONST_RuinsInitialSpawnDelay) ; #DEBUG_LINE_NO:2173
      i += 1 ; #DEBUG_LINE_NO:2174
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  While !Self.GetStageDone(CONST_Stage_Ruins_BattleStartSceneEndedStage) ; #DEBUG_LINE_NO:2179
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:2180
  EndWhile ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:2184
  While initialDemons != None && I < initialDemons.Length ; #DEBUG_LINE_NO:2185
    Self.StarbornRuinsStartCombatDemon(initialDemons[I], starbornDataIndex) ; #DEBUG_LINE_NO:2186
    I += 1 ; #DEBUG_LINE_NO:2187
  EndWhile ; #DEBUG_LINE_NO:
  starbornRuinsRef.Enable(False) ; #DEBUG_LINE_NO:2191
  starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing as Float) ; #DEBUG_LINE_NO:2192
  Self.SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2193
  starbornRuinsRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:2194
  starbornRuinsRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:2195
  Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2196
    RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing ; #DEBUG_LINE_NO:2197
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornRuinsUpdate(Int starbornDataIndex)
  Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2202
    Actor starbornRuinsRef = StarbornData[starbornDataIndex].starbornActorRef ; #DEBUG_LINE_NO:2203
    If starbornRuinsRef.IsDead() ; #DEBUG_LINE_NO:2206
      If RuinsBattleState < CONST_StarbornBattleState_Ruins_Complete ; #DEBUG_LINE_NO:2207
        RuinsBattleState = CONST_StarbornBattleState_Ruins_Complete ; #DEBUG_LINE_NO:2208
        Self.CleanupScriptedActors(StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[], -1, True, None, None, -1.0) ; #DEBUG_LINE_NO:2209
        If StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0 ; #DEBUG_LINE_NO:2210
          Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage) ; #DEBUG_LINE_NO:2211
        EndIf ; #DEBUG_LINE_NO:
        Self.SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage) ; #DEBUG_LINE_NO:2213
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Bool playerIsInTrigger = starbornRuinsTriggerRef.IsInTrigger(player as ObjectReference) ; #DEBUG_LINE_NO:2216
      If !playerIsInTrigger || Self.ShouldUpdateMovement(starbornRuinsRef, starbornDataIndex, -1.0) ; #DEBUG_LINE_NO:2217
        If playerIsInTrigger && RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing ; #DEBUG_LINE_NO:2218
          Ruins_HitCountWhileObserving = 0 ; #DEBUG_LINE_NO:2219
          Self.UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, False, False) ; #DEBUG_LINE_NO:2220
          Self.SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2221
          Self.ExitVoidForm(starbornRuinsRef) ; #DEBUG_LINE_NO:2222
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking ; #DEBUG_LINE_NO:2223
        ElseIf RuinsBattleState == CONST_StarbornBattleState_Ruins_Attacking ; #DEBUG_LINE_NO:2225
          starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing as Float) ; #DEBUG_LINE_NO:2226
          Self.SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2227
          starbornRuinsRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:2228
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing ; #DEBUG_LINE_NO:2229
          MQ302_Battle_05_Ruins_TeleportReaction.Start() ; #DEBUG_LINE_NO:2230
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If !DEBUG_StarbornRuinsBlockDemonSpawning ; #DEBUG_LINE_NO:2236
        Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:2237
        RefCollectionAlias starbornRuinsDemonCollection = StarbornData[starbornDataIndex].StarbornDuplicatesCollection ; #DEBUG_LINE_NO:2238
        Actor[] starbornRuinsDemons = starbornRuinsDemonCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:2239
        If starbornRuinsDemons == None ; #DEBUG_LINE_NO:2240
          starbornRuinsDemons = new Actor[0] ; #DEBUG_LINE_NO:2241
        EndIf ; #DEBUG_LINE_NO:
        Int I = 0 ; #DEBUG_LINE_NO:2243
        While I < starbornRuinsDemons.Length ; #DEBUG_LINE_NO:2244
          Actor current = starbornRuinsDemons[I] ; #DEBUG_LINE_NO:2245
          If current.IsDead() ; #DEBUG_LINE_NO:2246
            Self.TeleportOutNoWait(current, LC165_AbInnerDemonDeath, None, -1.0, True) ; #DEBUG_LINE_NO:2247
            starbornRuinsDemonCollection.RemoveRef(current as ObjectReference) ; #DEBUG_LINE_NO:2248
            starbornRuinsDemonsRespawnTimes.add(currentTime, 1) ; #DEBUG_LINE_NO:2249
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:2252
        EndWhile ; #DEBUG_LINE_NO:
        If starbornRuinsDemonsRespawnTimes.Length > 0 && (starbornRuinsDemonsRespawnTimes[0] < currentTime || currentTime > starbornRuinsDemonsRespawnTimes[0] + CONST_RuinsDemonsRespawnDelay || starbornRuinsDemonCollection.GetCount() == 0) ; #DEBUG_LINE_NO:2258
          starbornRuinsDemonsRespawnTimes.remove(0, 1) ; #DEBUG_LINE_NO:2260
          Self.StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex, None, True) ; #DEBUG_LINE_NO:2261
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornRuinsDying(ObjectReference akKiller, Actor target, Actor starbornRuinsRef, Int starbornDataIndex)
  If target == starbornRuinsRef ; #DEBUG_LINE_NO:2269
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:2270
    akArgs[0] = CONST_Ruins_DataIndex as Var ; #DEBUG_LINE_NO:2271
    Self.CallFunctionNoWait("StarbornRuinsUpdate", akArgs) ; #DEBUG_LINE_NO:2272
    Self.DissolveStarborn(starbornRuinsRef) ; #DEBUG_LINE_NO:2273
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function StarbornRuinsHit(Actor aggressor, Actor target, Actor starbornRuinsRef, Int starbornDataIndex)
  If RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing ; #DEBUG_LINE_NO:2279
    Guard RuinsBattleStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2280
      If RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing ; #DEBUG_LINE_NO:2281
        Ruins_HitCountWhileObserving += 1 ; #DEBUG_LINE_NO:2282
        If Ruins_HitCountWhileObserving >= CONST_Ruins_HitCountWhileObserving_Max ; #DEBUG_LINE_NO:2283
          Ruins_HitCountWhileObserving = 0 ; #DEBUG_LINE_NO:2284
          starbornRuinsRef.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:2285
          Self.UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, False, False) ; #DEBUG_LINE_NO:2286
          Self.SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2287
          Self.ExitVoidForm(starbornRuinsRef) ; #DEBUG_LINE_NO:2288
          RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking ; #DEBUG_LINE_NO:2289
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:2295
EndFunction

ObjectReference Function SetRuinsObservingStateHoldPositionTarget(Actor actorToUpdate, Keyword HoldPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, Bool shouldTeleport, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Int attempts = 0 ; #DEBUG_LINE_NO:2306
  ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray() ; #DEBUG_LINE_NO:2307
  Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1) ; #DEBUG_LINE_NO:2308
  ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex] ; #DEBUG_LINE_NO:2309
  While attempts < CONST_RuinsTargetSelectionAttemptsMax && (newHoldPositionTarget.GetDistance(player as ObjectReference) > CONST_RuinsTeleportDistanceMax as Float) ; #DEBUG_LINE_NO:2310
    attempts += 1 ; #DEBUG_LINE_NO:2311
    newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1) ; #DEBUG_LINE_NO:2312
    newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex] ; #DEBUG_LINE_NO:2313
  EndWhile ; #DEBUG_LINE_NO:
  Return Self.SetNewHoldPositionTarget(actorToUpdate, HoldPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:2316
EndFunction

Actor Function StarbornRuinsSpawnDemon(Actor starbornRuinsRef, Int starbornDataIndex, ObjectReference spawnPoint, Bool shouldStartCombatOnSpawn)
  Actor newDemon = Self.CreateRuinsDemon(starbornDataIndex, StarbornData[starbornDataIndex].StarbornDuplicatesCollection) ; #DEBUG_LINE_NO:2322
  If !shouldStartCombatOnSpawn ; #DEBUG_LINE_NO:2323
    newDemon.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:2324
  EndIf ; #DEBUG_LINE_NO:
  If spawnPoint != None ; #DEBUG_LINE_NO:2326
    Self.CombatTeleportNoWait(newDemon, spawnPoint, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:2327
  Else ; #DEBUG_LINE_NO:
    Self.CombatTeleportNearPlayerNoWait(newDemon, CONST_RuinsSpawnNearPlayerDistance_Min, CONST_RuinsSpawnNearPlayerDistance_Max, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:2329
  EndIf ; #DEBUG_LINE_NO:
  If shouldStartCombatOnSpawn ; #DEBUG_LINE_NO:2331
    Self.StarbornRuinsStartCombatDemon(newDemon, starbornDataIndex) ; #DEBUG_LINE_NO:2332
  Else ; #DEBUG_LINE_NO:
    newDemon.EvaluatePackage(False) ; #DEBUG_LINE_NO:2334
  EndIf ; #DEBUG_LINE_NO:
  Return newDemon ; #DEBUG_LINE_NO:2337
EndFunction

Function StarbornRuinsStartCombatDemon(Actor demon, Int starbornDataIndex)
  Self.UpdateAndEVPActor(demon, starbornDataIndex, None, False, CONST_StarbornStateValue_Ruins_Attacking, True, False) ; #DEBUG_LINE_NO:2341
EndFunction

Function SetTempleDoorState(Bool exteriorShouldBeBlocked, Bool interiorShouldBeBlocked)
  If exteriorShouldBeBlocked ; #DEBUG_LINE_NO:2350
    templeExteriorDoorRef.SetAnimationState("Off", False) ; #DEBUG_LINE_NO:2351
    templeExteriorDoorBarsRef.SetAnimationState("Off", False) ; #DEBUG_LINE_NO:2352
    ((templeExteriorDoorBarsRef as ObjectReference) as starborntempledoorbarsscript).SetShouldRegisterForOpenEvent(False) ; #DEBUG_LINE_NO:2353
  Else ; #DEBUG_LINE_NO:
    templeExteriorDoorRef.SetAnimationState("On", False) ; #DEBUG_LINE_NO:2355
    templeExteriorDoorBarsRef.SetAnimationState("On", False) ; #DEBUG_LINE_NO:2356
    ((templeExteriorDoorBarsRef as ObjectReference) as starborntempledoorbarsscript).SetShouldRegisterForOpenEvent(True) ; #DEBUG_LINE_NO:2357
  EndIf ; #DEBUG_LINE_NO:
  If interiorShouldBeBlocked ; #DEBUG_LINE_NO:2359
    templeInteriorDoorRef.SetAnimationState("Off", False) ; #DEBUG_LINE_NO:2360
  Else ; #DEBUG_LINE_NO:
    templeInteriorDoorRef.SetAnimationState("On", False) ; #DEBUG_LINE_NO:2362
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupAdversaryBattleStageData()
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) && AdversaryBattleStageData_Hunter != None ; #DEBUG_LINE_NO:2377
    AdversaryBattleStageData = AdversaryBattleStageData_Hunter ; #DEBUG_LINE_NO:2378
  ElseIf Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && AdversaryBattleStageData_Emissary != None ; #DEBUG_LINE_NO:2379
    AdversaryBattleStageData = AdversaryBattleStageData_Emissary ; #DEBUG_LINE_NO:2380
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function InitAdversary()
  Int failsafe = 0 ; #DEBUG_LINE_NO:2391
  While artifactActivatorRef == None && failsafe < CONST_Adversary_InitAdversaryFailsafeTimeout ; #DEBUG_LINE_NO:2392
    failsafe += 1 ; #DEBUG_LINE_NO:2393
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:2394
  EndWhile ; #DEBUG_LINE_NO:
  If failsafe >= CONST_Adversary_InitAdversaryFailsafeTimeout ; #DEBUG_LINE_NO:2396
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  adversary01Ref = Adversary01.GetActorRef() ; #DEBUG_LINE_NO:2400
  adversary02Ref = Adversary02.GetActorRef() ; #DEBUG_LINE_NO:2401
  RefCollectionAlias adversaryDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection ; #DEBUG_LINE_NO:2403
  adversary01DuplicateRef = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, None, adversaryDuplicates, CONST_Adversary_DataIndex, True) ; #DEBUG_LINE_NO:2405
  StarbornData[CONST_Adversary_DataIndex].starbornActorRef = adversary01DuplicateRef ; #DEBUG_LINE_NO:2406
  Self.InitAdversaryHelper(adversary01DuplicateRef) ; #DEBUG_LINE_NO:2407
  adversary01DuplicateRef.EnableNoWait(False) ; #DEBUG_LINE_NO:2408
  StarbornAdversary_Primary.ForceRefTo(adversary01DuplicateRef as ObjectReference) ; #DEBUG_LINE_NO:2409
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) || Self.GetStageDone(CONST_Stage_Startup_BothEnemies) ; #DEBUG_LINE_NO:2410
    starbornAdversaryHunter = adversary01DuplicateRef ; #DEBUG_LINE_NO:2411
    StarbornAdversary_Hunter.ForceRefTo(adversary01DuplicateRef as ObjectReference) ; #DEBUG_LINE_NO:2412
  Else ; #DEBUG_LINE_NO:
    starbornAdversaryEmissary = adversary01DuplicateRef ; #DEBUG_LINE_NO:2414
    StarbornAdversary_Emissary.ForceRefTo(adversary01DuplicateRef as ObjectReference) ; #DEBUG_LINE_NO:2415
  EndIf ; #DEBUG_LINE_NO:
  If adversary02Ref != None ; #DEBUG_LINE_NO:2418
    adversary02DuplicateRef = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary02Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True) ; #DEBUG_LINE_NO:2419
    adversary02DuplicateRef.SetLinkedRef(adversary01DuplicateRef as ObjectReference, LC165_StarbornEventActorLinkKeyword, True) ; #DEBUG_LINE_NO:2420
    Self.InitAdversaryHelper(adversary02DuplicateRef) ; #DEBUG_LINE_NO:2421
    adversary02DuplicateRef.EnableNoWait(False) ; #DEBUG_LINE_NO:2422
    starbornAdversaryEmissary = adversary02DuplicateRef ; #DEBUG_LINE_NO:2423
    StarbornAdversary_Emissary.ForceRefTo(adversary02DuplicateRef as ObjectReference) ; #DEBUG_LINE_NO:2424
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) ; #DEBUG_LINE_NO:2429
    Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True) ; #DEBUG_LINE_NO:2431
    duplicate.SetEssential(True) ; #DEBUG_LINE_NO:2432
  Else ; #DEBUG_LINE_NO:
    Actor emissaryRef = None ; #DEBUG_LINE_NO:2435
    If adversary02Ref == None ; #DEBUG_LINE_NO:2436
      emissaryRef = adversary01Ref ; #DEBUG_LINE_NO:2437
    Else ; #DEBUG_LINE_NO:
      emissaryRef = adversary02Ref ; #DEBUG_LINE_NO:2439
    EndIf ; #DEBUG_LINE_NO:
    Int i = 0 ; #DEBUG_LINE_NO:2441
    While i < CONST_Adversary_EmissaryDuplicateCount ; #DEBUG_LINE_NO:2442
      Actor duplicate = Self.CreateDuplicate(LC165HoldingPenMarkerRef, emissaryRef, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True) ; #DEBUG_LINE_NO:2443
      duplicate.SetEssential(True) ; #DEBUG_LINE_NO:2444
      i += 1 ; #DEBUG_LINE_NO:2445
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor[] allDuplicates = adversaryDuplicates.GetArray() as Actor[] ; #DEBUG_LINE_NO:2450
  Int I = 0 ; #DEBUG_LINE_NO:2451
  While I < allDuplicates.Length ; #DEBUG_LINE_NO:2452
    adversaryHealthBaseTotal += allDuplicates[I].GetBaseValue(Health) ; #DEBUG_LINE_NO:2453
    allDuplicates[I].SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:2454
    I += 1 ; #DEBUG_LINE_NO:2455
  EndWhile ; #DEBUG_LINE_NO:
  Self.StarbornAdversaryPreloadShiftsNoWait(-1, 0) ; #DEBUG_LINE_NO:2459
EndFunction

Function InitAdversaryHelper(Actor adversaryRef)
  adversaryRef.Disable(False) ; #DEBUG_LINE_NO:2463
  adversaryRef.SetGhost(True) ; #DEBUG_LINE_NO:2464
  adversaryRef.SetEssential(True) ; #DEBUG_LINE_NO:2465
  adversaryRef.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:2466
  adversaryRef.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2467
EndFunction

Function InitTempleInterior()
  templeInteriorInitialized = True ; #DEBUG_LINE_NO:2473
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:2477
  Actor companionRef = Companion.GetActorRef() ; #DEBUG_LINE_NO:2478
  If companionRef != None ; #DEBUG_LINE_NO:2479
    Self.RegisterForRemoteEvent(companionRef as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:2480
  EndIf ; #DEBUG_LINE_NO:
  Actor[] followerRefs = Followers.GetArray() as Actor[] ; #DEBUG_LINE_NO:2482
  Int I = 0 ; #DEBUG_LINE_NO:2483
  While followerRefs != None && I < followerRefs.Length ; #DEBUG_LINE_NO:2484
    Self.RegisterForRemoteEvent(followerRefs[I] as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:2485
    I += 1 ; #DEBUG_LINE_NO:2486
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryTeleportInForConfrontation(Bool DEBUG_forceDispel)
  If !hasDispelledAdversaryVoidForm ; #DEBUG_LINE_NO:2492
    hasDispelledAdversaryVoidForm = True ; #DEBUG_LINE_NO:2493
    ObjectReference adversary01StartPoint = None ; #DEBUG_LINE_NO:2496
    ObjectReference adversary02StartPoint = None ; #DEBUG_LINE_NO:2497
    If adversary02Ref == None ; #DEBUG_LINE_NO:2498
      adversary01StartPoint = LC165AdversarySoloSceneMarkerRef ; #DEBUG_LINE_NO:2499
    Else ; #DEBUG_LINE_NO:
      adversary01StartPoint = LC165Adversary01SceneMarkerRef ; #DEBUG_LINE_NO:2501
      adversary02StartPoint = LC165Adversary02SceneMarkerRef ; #DEBUG_LINE_NO:2502
    EndIf ; #DEBUG_LINE_NO:
    Self.TeleportIn(adversary01StartPoint, None, None) ; #DEBUG_LINE_NO:2505
    adversary01DuplicateRef.MoveTo(adversary01StartPoint, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2506
    If adversary02StartPoint != None ; #DEBUG_LINE_NO:2508
      Utility.Wait(1.0) ; #DEBUG_LINE_NO:2509
      Self.TeleportIn(adversary02StartPoint, None, None) ; #DEBUG_LINE_NO:2510
      adversary02DuplicateRef.MoveTo(adversary02StartPoint, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2511
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryStart(Actor starbornAdversaryRef, Int starbornDataIndex)
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:2523
  MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Add() ; #DEBUG_LINE_NO:2525
  If adversary02Ref == None ; #DEBUG_LINE_NO:2527
    Self.NoncombatTeleport(adversary01DuplicateRef, LC165AdversarySoloCombatStartMarkerRef, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2528
  Else ; #DEBUG_LINE_NO:
    Self.NoncombatTeleport(adversary01DuplicateRef, LC165Adversary01CombatStartMarkerRef, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2530
    Self.NoncombatTeleport(adversary02DuplicateRef, LC165Adversary02CombatStartMarkerRef, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2531
  EndIf ; #DEBUG_LINE_NO:
  If starbornAdversaryHunter != None ; #DEBUG_LINE_NO:2533
    starbornAdversaryHunter.SetGhost(False) ; #DEBUG_LINE_NO:2534
    Self.UpdateAndEVPActor(starbornAdversaryHunter, starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False) ; #DEBUG_LINE_NO:2535
  EndIf ; #DEBUG_LINE_NO:
  If starbornAdversaryEmissary != None ; #DEBUG_LINE_NO:2537
    starbornAdversaryEmissary.SetGhost(False) ; #DEBUG_LINE_NO:2538
    Self.UpdateAndEVPActor(starbornAdversaryEmissary, starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False) ; #DEBUG_LINE_NO:2539
  EndIf ; #DEBUG_LINE_NO:
  artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_DuringBattle) ; #DEBUG_LINE_NO:2542
  Ally.GetActorRef().StartCombat(adversary01DuplicateRef as ObjectReference, False) ; #DEBUG_LINE_NO:2544
  Actor[] followerRefs = Followers.GetArray() as Actor[] ; #DEBUG_LINE_NO:2545
  Int I = 0 ; #DEBUG_LINE_NO:2546
  While I < followerRefs.Length ; #DEBUG_LINE_NO:2547
    followerRefs[I].StartCombat(adversary01DuplicateRef as ObjectReference, False) ; #DEBUG_LINE_NO:2548
    I += 1 ; #DEBUG_LINE_NO:2549
  EndWhile ; #DEBUG_LINE_NO:
  Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:2552
  ObjectReference duplicateSpawnPoint = StarbornAdversary_InitialDuplicateSpawnPointChainHead.GetRef() ; #DEBUG_LINE_NO:2553
  I = 0 ; #DEBUG_LINE_NO:2554
  While I < allDuplicates.Length ; #DEBUG_LINE_NO:2555
    If allDuplicates[I] != starbornAdversaryHunter && allDuplicates[I] != starbornAdversaryEmissary ; #DEBUG_LINE_NO:2556
      Self.TeleportIn(duplicateSpawnPoint, None, LC165_StarbornParallelSelfSpawnExplosion) ; #DEBUG_LINE_NO:2557
      allDuplicates[I].Enable(False) ; #DEBUG_LINE_NO:2558
      allDuplicates[I].MoveTo(duplicateSpawnPoint, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2559
      Self.UpdateAndEVPActor(allDuplicates[I], starbornDataIndex, None, False, CONST_StarbornStateValue_Adversary_Normal, True, False) ; #DEBUG_LINE_NO:2560
      duplicateSpawnPoint = duplicateSpawnPoint.GetLinkedRef(None) ; #DEBUG_LINE_NO:2561
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:2563
  EndWhile ; #DEBUG_LINE_NO:
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2566
    Self.StarbornAdversaryPerformStateChange(CONST_StarbornAdversary_State_TempleInitial, -1.0, -1.0, None) ; #DEBUG_LINE_NO:2567
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Self.StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID) ; #DEBUG_LINE_NO:2570
EndFunction

Function StarbornAdversaryUpdate(Int starbornDataIndex)
  If !adversaryBattleComplete ; #DEBUG_LINE_NO:2577
    Actor[] adversaryRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:2579
    If adversaryRefs == None ; #DEBUG_LINE_NO:2582
      Return  ; #DEBUG_LINE_NO:2583
    EndIf ; #DEBUG_LINE_NO:
    If currentAdversaryHoldPositionTargetCollection != None ; #DEBUG_LINE_NO:2587
      Int I = 0 ; #DEBUG_LINE_NO:2588
      While I < adversaryRefs.Length ; #DEBUG_LINE_NO:2589
        Bool shouldUpdateMovementHealth = Self.ShouldUpdateMovementDueToHealthLoss(adversaryRefs[I], starbornDataIndex, -1.0) ; #DEBUG_LINE_NO:2590
        Bool shouldUpdateMovementTime = Self.ShouldUpdateMovementDueToTime(adversaryRefs[I], starbornDataIndex) ; #DEBUG_LINE_NO:2591
        Bool shouldUpdateTeleport = False ; #DEBUG_LINE_NO:2592
        If shouldUpdateMovementHealth && adversaryRefs[I].HasKeyword(MQEmissaryKeyword) && adversaryRefs[I].GetValue(Health) > 0.0 ; #DEBUG_LINE_NO:2593
          shouldUpdateTeleport = True ; #DEBUG_LINE_NO:2594
        EndIf ; #DEBUG_LINE_NO:
        If shouldUpdateMovementHealth || shouldUpdateMovementTime ; #DEBUG_LINE_NO:2596
          Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2597
            Self.SetNewHoldPositionTargetRandom(adversaryRefs[I], StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, currentAdversaryHoldPositionTargetCollection, shouldUpdateTeleport, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:2598
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:2602
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:2607
    Actor primeAdversary = adversaryRefs[0] ; #DEBUG_LINE_NO:2608
    If primeAdversary != None && (primeAdversary.GetValue(LC165_AdversaryFleeValue) == CONST_AdversaryFleeValue_ShouldNotFlee as Float) && (AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage || AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage) ; #DEBUG_LINE_NO:2609
      Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2610
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage ; #DEBUG_LINE_NO:2611
          Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2612
            If primeAdversary != starbornAdversaryCurrentPrimary ; #DEBUG_LINE_NO:2613
              starbornAdversaryCurrentPrimary = primeAdversary ; #DEBUG_LINE_NO:2614
              starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2615
              Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:2616
            EndIf ; #DEBUG_LINE_NO:
            If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2618
              Float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellCastDelay ; #DEBUG_LINE_NO:2619
              If currentTime < nextGravWellTime ; #DEBUG_LINE_NO:2621
                nextGravWellTime = currentTime ; #DEBUG_LINE_NO:2623
              EndIf ; #DEBUG_LINE_NO:
              If currentTime >= nextGravWellTime ; #DEBUG_LINE_NO:2625
                starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToCreate ; #DEBUG_LINE_NO:2626
                Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, True, -1, False, False) ; #DEBUG_LINE_NO:2627
              EndIf ; #DEBUG_LINE_NO:
            ElseIf starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToDetonate ; #DEBUG_LINE_NO:2629
              Float detonateTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellDetonateDelay ; #DEBUG_LINE_NO:2630
              If currentTime < detonateTime ; #DEBUG_LINE_NO:2632
                detonateTime = currentTime ; #DEBUG_LINE_NO:2634
              EndIf ; #DEBUG_LINE_NO:
              If currentTime >= detonateTime ; #DEBUG_LINE_NO:2636
                If primeAdversary.HasKeyword(MQHunterKeyword) ; #DEBUG_LINE_NO:2637
                  starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:2638
                  Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, True, -1, False, False) ; #DEBUG_LINE_NO:2639
                Else ; #DEBUG_LINE_NO:
                  starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2641
                  Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:2642
                EndIf ; #DEBUG_LINE_NO:
              EndIf ; #DEBUG_LINE_NO:
            ElseIf starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:2645
              Float cleanupTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellDetonateDelay * 1.5 ; #DEBUG_LINE_NO:2646
              If currentTime < cleanupTime ; #DEBUG_LINE_NO:2648
                cleanupTime = currentTime ; #DEBUG_LINE_NO:2650
              EndIf ; #DEBUG_LINE_NO:
              If currentTime >= cleanupTime ; #DEBUG_LINE_NO:2652
                starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:2653
                Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:2654
              EndIf ; #DEBUG_LINE_NO:
            EndIf ; #DEBUG_LINE_NO:
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage ; #DEBUG_LINE_NO:2659
          Guard AdversaryDemonGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2660
            If primeAdversary != starbornAdversaryCurrentPrimary ; #DEBUG_LINE_NO:2661
              starbornAdversaryCurrentPrimary = primeAdversary ; #DEBUG_LINE_NO:2662
              starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting ; #DEBUG_LINE_NO:2663
            EndIf ; #DEBUG_LINE_NO:
            Actor[] adversaryDemons = StarbornAdversary_Demons.GetArray() as Actor[] ; #DEBUG_LINE_NO:2665
            Int i = 0 ; #DEBUG_LINE_NO:2666
            While i < adversaryDemons.Length ; #DEBUG_LINE_NO:2667
              If adversaryDemons[i].IsDead() ; #DEBUG_LINE_NO:2668
                Self.TeleportOutNoWait(adversaryDemons[i], LC165_AbInnerDemonDeath, None, -1.0, True) ; #DEBUG_LINE_NO:2669
                StarbornAdversary_Demons.RemoveRef(adversaryDemons[i] as ObjectReference) ; #DEBUG_LINE_NO:2670
              EndIf ; #DEBUG_LINE_NO:
              i += 1 ; #DEBUG_LINE_NO:2672
            EndWhile ; #DEBUG_LINE_NO:
            Int remainingDemons = StarbornAdversary_Demons.GetCount() ; #DEBUG_LINE_NO:2674
            If remainingDemons < CONST_StarbornAdversary_DemonsToSpawnTotal ; #DEBUG_LINE_NO:2675
              If currentTime < starbornAdversaryScriptedDemonTimestamp || currentTime >= (starbornAdversaryScriptedDemonTimestamp + CONST_StarbornAdversary_DemonCastDelay as Float) ; #DEBUG_LINE_NO:2676
                starbornAdversaryScriptedDemonTimestamp = currentTime ; #DEBUG_LINE_NO:2677
                starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_ReadyToCast ; #DEBUG_LINE_NO:2678
                Self.UpdateAndEVPActor(primeAdversary, starbornDataIndex, LC165_Starborn_Adversary_ScriptedInnerDemonSpell, True, -1, False, False) ; #DEBUG_LINE_NO:2679
              EndIf ; #DEBUG_LINE_NO:
            EndIf ; #DEBUG_LINE_NO:
          EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        If AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage ; #DEBUG_LINE_NO:2684
          AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage = False ; #DEBUG_LINE_NO:2685
          If primeAdversary != starbornAdversaryCurrentPrimary ; #DEBUG_LINE_NO:2686
            starbornAdversaryCurrentPrimary = primeAdversary ; #DEBUG_LINE_NO:2687
          EndIf ; #DEBUG_LINE_NO:
          primeAdversary.AddItem(Aid_TraumaPack as Form, 1, False) ; #DEBUG_LINE_NO:2689
        EndIf ; #DEBUG_LINE_NO:
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryCheckForStateChange()
  If !adversaryBattleComplete ; #DEBUG_LINE_NO:2699
    Float adversaryHealthCurrentTotal = 0.0 ; #DEBUG_LINE_NO:2700
    Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:2701
    Float[] adversaryRefsCurrentHealth = new Float[adversaryRefs.Length] ; #DEBUG_LINE_NO:2702
    Bool potentialAdversaryRemoval = False ; #DEBUG_LINE_NO:2703
    Actor currentAdversaryRef = None ; #DEBUG_LINE_NO:2704
    Int I = 0 ; #DEBUG_LINE_NO:2705
    While I < adversaryRefs.Length ; #DEBUG_LINE_NO:2706
      currentAdversaryRef = adversaryRefs[I] ; #DEBUG_LINE_NO:2707
      adversaryRefsCurrentHealth[I] = currentAdversaryRef.GetValue(Health) ; #DEBUG_LINE_NO:2708
      adversaryHealthCurrentTotal += Math.Max(adversaryRefsCurrentHealth[I], 0.0) ; #DEBUG_LINE_NO:2709
      If !potentialAdversaryRemoval && adversaryRefsCurrentHealth[I] <= 0.0 ; #DEBUG_LINE_NO:2710
        potentialAdversaryRemoval = True ; #DEBUG_LINE_NO:2711
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:2713
    EndWhile ; #DEBUG_LINE_NO:
    Float adversaryHealthCurrentPercent = adversaryHealthCurrentTotal / adversaryHealthBaseTotal ; #DEBUG_LINE_NO:2715
    Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2718
      If !DEBUG_AdversaryDebugMode && adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex + 1].StageHealthThreshold ; #DEBUG_LINE_NO:2719
        Self.StarbornAdversaryPerformStateChange(-1, adversaryHealthCurrentPercent, adversaryHealthCurrentTotal, None) ; #DEBUG_LINE_NO:2720
      ElseIf potentialAdversaryRemoval ; #DEBUG_LINE_NO:
        I = 0 ; #DEBUG_LINE_NO:2722
        While I < adversaryRefs.Length ; #DEBUG_LINE_NO:2723
          If adversaryRefsCurrentHealth[I] <= 0.0 ; #DEBUG_LINE_NO:2724
            If adversaryRefs.Length >= 2 ; #DEBUG_LINE_NO:2725
              Actor adversaryToRemove = adversaryRefs[I] ; #DEBUG_LINE_NO:2726
              adversaryToRemove.KillEssential(None) ; #DEBUG_LINE_NO:2728
              Self.TeleportOutNoWait(adversaryToRemove, LC165_AbParallelSelfDeath, None, -1.0, True) ; #DEBUG_LINE_NO:2729
              StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(adversaryToRemove as ObjectReference) ; #DEBUG_LINE_NO:2730
              adversaryRefs.remove(I, 1) ; #DEBUG_LINE_NO:2731
              adversaryRefsCurrentHealth.remove(I, 1) ; #DEBUG_LINE_NO:2732
              I -= 1 ; #DEBUG_LINE_NO:2733
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:2736
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryPerformStateChange(Int forcedState, Float adversaryHealthCurrentPercent, Float adversaryHealthCurrentTotal, ObjectReference distortion)
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:2745
  Int adversaryBattlePreviousStageDataIndex = adversaryBattleStageDataIndex ; #DEBUG_LINE_NO:2746
  safeToForceAdversaryShift = False ; #DEBUG_LINE_NO:2747
  If forcedState >= 0 ; #DEBUG_LINE_NO:2750
    adversaryBattleStageDataIndex = forcedState ; #DEBUG_LINE_NO:2751
  ElseIf adversaryHealthCurrentPercent >= 0.0 ; #DEBUG_LINE_NO:2752
    Bool shouldStopAndExecute = False ; #DEBUG_LINE_NO:2753
    While !shouldStopAndExecute && adversaryBattleStageDataIndex < AdversaryBattleStageData.Length - 1 && adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex + 1].StageHealthThreshold ; #DEBUG_LINE_NO:2754
      adversaryBattleStageDataIndex += 1 ; #DEBUG_LINE_NO:2755
      If AdversaryBattleStageData[adversaryBattleStageDataIndex].MustExecute || AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0.0 ; #DEBUG_LINE_NO:2756
        shouldStopAndExecute = True ; #DEBUG_LINE_NO:2757
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Return  ; #DEBUG_LINE_NO:2762
  EndIf ; #DEBUG_LINE_NO:
  Actor primeAdversary = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetAt(0) as Actor ; #DEBUG_LINE_NO:2767
  If AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowGravWellStage ; #DEBUG_LINE_NO:2768
    primeAdversary.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell) ; #DEBUG_LINE_NO:2769
    primeAdversary.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell) ; #DEBUG_LINE_NO:2770
    Self.StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False) ; #DEBUG_LINE_NO:2771
    Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:2772
  EndIf ; #DEBUG_LINE_NO:
  If AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowDemonStage ; #DEBUG_LINE_NO:2774
    primeAdversary.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell) ; #DEBUG_LINE_NO:2775
    Self.StarbornAdversaryKillDemons() ; #DEBUG_LINE_NO:2776
    Self.StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False) ; #DEBUG_LINE_NO:2777
  EndIf ; #DEBUG_LINE_NO:
  If AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryEndStage ; #DEBUG_LINE_NO:2781
    StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(primeAdversary as ObjectReference) ; #DEBUG_LINE_NO:2782
    Self.DestroyScriptedGravityWell(None, True) ; #DEBUG_LINE_NO:2783
    Self.StarbornAdversaryKillDemons() ; #DEBUG_LINE_NO:2784
    Self.StarbornAdversaryPlayDeathSceneAndWait(primeAdversary) ; #DEBUG_LINE_NO:2785
  EndIf ; #DEBUG_LINE_NO:
  Int StageToSetOnEnterBeforeShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterBeforeShifting ; #DEBUG_LINE_NO:2789
  If StageToSetOnEnterBeforeShifting >= 0 ; #DEBUG_LINE_NO:2790
    Self.SetStage(StageToSetOnEnterBeforeShifting) ; #DEBUG_LINE_NO:2791
  EndIf ; #DEBUG_LINE_NO:
  Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:2794
    String ShiftToTrigger = AdversaryBattleStageData[adversaryBattleStageDataIndex].ShiftToTrigger ; #DEBUG_LINE_NO:2796
    String FunctionToCallDuringShift = AdversaryBattleStageData[adversaryBattleStageDataIndex].FunctionToCallDuringShift ; #DEBUG_LINE_NO:2797
    If ShiftToTrigger != "" ; #DEBUG_LINE_NO:2798
      selfAsShiftingScript.ShiftTo(ShiftToTrigger, FunctionToCallDuringShift, distortion, -1, None) ; #DEBUG_LINE_NO:2799
      StarbornAdversary_ActiveDistortion.Clear() ; #DEBUG_LINE_NO:2800
      Self.StarbornAdversaryPreloadShiftsNoWait(adversaryBattlePreviousStageDataIndex, adversaryBattleStageDataIndex) ; #DEBUG_LINE_NO:2801
      stageToSetOnNextShift = -1 ; #DEBUG_LINE_NO:2802
    EndIf ; #DEBUG_LINE_NO:
    If AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0.0 ; #DEBUG_LINE_NO:2806
      Float backstopHealthTotal = AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold * adversaryHealthBaseTotal ; #DEBUG_LINE_NO:2807
      Float backstopHealthAdd = Math.Max(backstopHealthTotal - adversaryHealthCurrentTotal, 0.0) ; #DEBUG_LINE_NO:2808
      Float backstopHealthAddPerRef = backstopHealthAdd / adversaryRefs.Length as Float ; #DEBUG_LINE_NO:2809
      If backstopHealthAdd == 0.0 ; #DEBUG_LINE_NO:2810
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        adversaryRefs = commonarrayfunctions.SortRefsByValue(adversaryRefs as ObjectReference[], Health) as Actor[] ; #DEBUG_LINE_NO:2815
        Int ArrayLength = adversaryRefs.Length ; #DEBUG_LINE_NO:2816
        Actor[] reversedAdversaries = new Actor[ArrayLength] ; #DEBUG_LINE_NO:2817
        Float[] reversedHealth = new Float[ArrayLength] ; #DEBUG_LINE_NO:2818
        Int I = 0 ; #DEBUG_LINE_NO:2819
        While I < ArrayLength ; #DEBUG_LINE_NO:2820
          reversedAdversaries[ArrayLength - I - 1] = adversaryRefs[I] ; #DEBUG_LINE_NO:2821
          reversedHealth[ArrayLength - I - 1] = adversaryRefs[I].GetValue(Health) ; #DEBUG_LINE_NO:2822
          I += 1 ; #DEBUG_LINE_NO:2823
        EndWhile ; #DEBUG_LINE_NO:
        adversaryRefs = reversedAdversaries ; #DEBUG_LINE_NO:2825
        Float[] adversaryRefsCurrentHealth = reversedHealth ; #DEBUG_LINE_NO:2826
        adversaryHealthCurrentTotal = 0.0 ; #DEBUG_LINE_NO:2833
        I = 0 ; #DEBUG_LINE_NO:2834
        While I < adversaryRefsCurrentHealth.Length ; #DEBUG_LINE_NO:2835
          adversaryHealthCurrentTotal += Math.Max(adversaryRefsCurrentHealth[I], 0.0) ; #DEBUG_LINE_NO:2837
          I += 1 ; #DEBUG_LINE_NO:2838
        EndWhile ; #DEBUG_LINE_NO:
        I = 0 ; #DEBUG_LINE_NO:2843
        While I < adversaryRefs.Length ; #DEBUG_LINE_NO:2844
          Float currentHealthBase = adversaryRefs[I].GetBaseValue(Health) ; #DEBUG_LINE_NO:2845
          Float currentHealthLoss = 0.0 ; #DEBUG_LINE_NO:2846
          Float healthRestoreRequiredToZero = 0.0 ; #DEBUG_LINE_NO:2847
          If adversaryRefsCurrentHealth[I] >= 0.0 ; #DEBUG_LINE_NO:2848
            currentHealthLoss = currentHealthBase - adversaryRefsCurrentHealth[I] ; #DEBUG_LINE_NO:2849
          Else ; #DEBUG_LINE_NO:
            currentHealthLoss = currentHealthBase ; #DEBUG_LINE_NO:2851
            healthRestoreRequiredToZero = Math.Abs(adversaryRefsCurrentHealth[I]) ; #DEBUG_LINE_NO:2852
          EndIf ; #DEBUG_LINE_NO:
          If currentHealthLoss >= backstopHealthAddPerRef ; #DEBUG_LINE_NO:2854
            adversaryRefs[I].RestoreValue(Health, healthRestoreRequiredToZero + backstopHealthAddPerRef) ; #DEBUG_LINE_NO:2857
            backstopHealthAdd -= backstopHealthAddPerRef ; #DEBUG_LINE_NO:2859
          Else ; #DEBUG_LINE_NO:
            adversaryRefs[I].RestoreValue(Health, currentHealthLoss) ; #DEBUG_LINE_NO:2862
            backstopHealthAdd -= currentHealthLoss ; #DEBUG_LINE_NO:2863
            Int adversariesRemaining = adversaryRefs.Length - I - 1 ; #DEBUG_LINE_NO:2865
            If adversariesRemaining > 0 ; #DEBUG_LINE_NO:2866
              backstopHealthAddPerRef = backstopHealthAdd / adversariesRemaining as Float ; #DEBUG_LINE_NO:2867
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:2872
        EndWhile ; #DEBUG_LINE_NO:
        Float adversaryHealthNewTotal = 0.0 ; #DEBUG_LINE_NO:2875
        I = 0 ; #DEBUG_LINE_NO:2877
        While I < adversaryRefsCurrentHealth.Length ; #DEBUG_LINE_NO:2878
          Float newCurrentHealth = adversaryRefs[I].GetValue(Health) ; #DEBUG_LINE_NO:2879
          adversaryHealthNewTotal += newCurrentHealth ; #DEBUG_LINE_NO:2880
          I += 1 ; #DEBUG_LINE_NO:2882
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If ShiftToTrigger != "" ; #DEBUG_LINE_NO:2891
      selfAsShiftingScript.ShiftAdversary(ShiftToTrigger) ; #DEBUG_LINE_NO:2892
      adversaryLastShiftIndex = adversaryBattleStageDataIndex ; #DEBUG_LINE_NO:2893
      safeToForceAdversaryShift = True ; #DEBUG_LINE_NO:2894
    EndIf ; #DEBUG_LINE_NO:
    Int StageToSetOnEnterAfterShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterAfterShifting ; #DEBUG_LINE_NO:2898
    If StageToSetOnEnterAfterShifting >= 0 ; #DEBUG_LINE_NO:2899
      Self.SetStageNoWait(StageToSetOnEnterAfterShifting) ; #DEBUG_LINE_NO:2900
    EndIf ; #DEBUG_LINE_NO:
    If adversaryBattleStageDataIndex == AdversaryBattleStageData.Length - 1 ; #DEBUG_LINE_NO:2904
      adversaryBattleComplete = True ; #DEBUG_LINE_NO:2905
    Else ; #DEBUG_LINE_NO:
      RefCollectionAlias holdPositionCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers ; #DEBUG_LINE_NO:2908
      If holdPositionCollection != None ; #DEBUG_LINE_NO:2909
        currentAdversaryHoldPositionTargetCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers ; #DEBUG_LINE_NO:2911
      EndIf ; #DEBUG_LINE_NO:
      Keyword newHoldPositionKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionKeyword ; #DEBUG_LINE_NO:2915
      If newHoldPositionKeyword != None ; #DEBUG_LINE_NO:2916
        StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword = newHoldPositionKeyword ; #DEBUG_LINE_NO:2918
      EndIf ; #DEBUG_LINE_NO:
      Bool currentlyHasKeyword = AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].IsAdversaryFleeStage ; #DEBUG_LINE_NO:2922
      Bool shouldHaveKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryFleeStage ; #DEBUG_LINE_NO:2923
      If currentlyHasKeyword != shouldHaveKeyword ; #DEBUG_LINE_NO:2924
        Int i = 0 ; #DEBUG_LINE_NO:2925
        While i < adversaryRefs.Length ; #DEBUG_LINE_NO:2926
          Actor currentAdversaryRef = adversaryRefs[i] ; #DEBUG_LINE_NO:2927
          If shouldHaveKeyword ; #DEBUG_LINE_NO:2928
            currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithRun as Float) ; #DEBUG_LINE_NO:2929
            Self.RegisterForHitEvent(currentAdversaryRef as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:2930
          Else ; #DEBUG_LINE_NO:
            currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldNotFlee as Float) ; #DEBUG_LINE_NO:2932
            Self.UnregisterForHitEvent(currentAdversaryRef as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:2933
          EndIf ; #DEBUG_LINE_NO:
          i += 1 ; #DEBUG_LINE_NO:2935
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.StarbornAdversaryUpdateAllHoldPositionLinks(AdversaryBattleStageData[adversaryBattleStageDataIndex].ShouldUseHoldPreferred) ; #DEBUG_LINE_NO:2940
      Spell SpellToAddOnEnter = AdversaryBattleStageData[adversaryBattleStageDataIndex].SpellToAddOnEnter ; #DEBUG_LINE_NO:2943
      If SpellToAddOnEnter != None ; #DEBUG_LINE_NO:2944
        primeAdversary.AddSpell(SpellToAddOnEnter, True) ; #DEBUG_LINE_NO:2945
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    selfAsShiftingScript.WaitForAdversaryUpdateToFinish() ; #DEBUG_LINE_NO:2950
    safeToForceAdversaryShift = False ; #DEBUG_LINE_NO:2951
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryPreloadShiftsNoWait(Int previousStage, Int currentStage)
  If previousStage >= 0 ; #DEBUG_LINE_NO:2956
    String priorShiftName = AdversaryBattleStageData[previousStage].ShiftToTrigger ; #DEBUG_LINE_NO:2957
    String currentShiftName = AdversaryBattleStageData[currentStage].ShiftToTrigger ; #DEBUG_LINE_NO:2958
    If priorShiftName != "" && priorShiftName != currentShiftName ; #DEBUG_LINE_NO:2959
      ObjectReference previousStageEnableMarker = selfAsShiftingScript.GetShiftEnableParentMarker(priorShiftName) ; #DEBUG_LINE_NO:2960
      If previousStageEnableMarker != None ; #DEBUG_LINE_NO:2961
        previousStageEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:2963
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = currentStage ; #DEBUG_LINE_NO:2967
  Int shiftsPreloaded = 0 ; #DEBUG_LINE_NO:2968
  ObjectReference lastShiftPreloadedMarker = None ; #DEBUG_LINE_NO:2969
  While I < AdversaryBattleStageData.Length && shiftsPreloaded < CONST_StarbornAdversary_ShiftsToLoad ; #DEBUG_LINE_NO:2970
    String potentialShift = AdversaryBattleStageData[I].ShiftToTrigger ; #DEBUG_LINE_NO:2971
    If potentialShift != "" ; #DEBUG_LINE_NO:2972
      ObjectReference potentialEnableParentMarker = selfAsShiftingScript.GetShiftEnableParentMarker(potentialShift) ; #DEBUG_LINE_NO:2973
      If potentialEnableParentMarker != None && potentialEnableParentMarker != lastShiftPreloadedMarker ; #DEBUG_LINE_NO:2974
        If I == currentStage ; #DEBUG_LINE_NO:2975
          lastShiftPreloadedMarker = potentialEnableParentMarker ; #DEBUG_LINE_NO:2976
        Else ; #DEBUG_LINE_NO:
          potentialEnableParentMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:2979
          lastShiftPreloadedMarker = potentialEnableParentMarker ; #DEBUG_LINE_NO:2980
          shiftsPreloaded += 1 ; #DEBUG_LINE_NO:2981
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:2985
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversarySwapCombatStyle(Actor starbornAdversaryRef, Int starbornDataIndex, Bool shouldCastSpell)
  If shouldCastSpell ; #DEBUG_LINE_NO:2990
    If starbornAdversaryRef.HasKeyword(MQHunterKeyword) ; #DEBUG_LINE_NO:2991
      starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQHunter_CastCombatSpell) ; #DEBUG_LINE_NO:2992
    Else ; #DEBUG_LINE_NO:
      starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQEmissary_CastCombatSpell) ; #DEBUG_LINE_NO:2994
    EndIf ; #DEBUG_LINE_NO:
  ElseIf starbornAdversaryRef.HasKeyword(MQHunterKeyword) ; #DEBUG_LINE_NO:2997
    starbornAdversaryRef.SetCombatStyle(csStarborn_MQHunter) ; #DEBUG_LINE_NO:2998
  Else ; #DEBUG_LINE_NO:
    starbornAdversaryRef.SetCombatStyle(csStarborn_MQEmissary) ; #DEBUG_LINE_NO:3000
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryForceState(Int newState, ObjectReference distortion)
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3007
    If adversaryBattleStageDataIndex > newState ; #DEBUG_LINE_NO:3008
       ; #DEBUG_LINE_NO:
    ElseIf adversaryBattleStageDataIndex == newState ; #DEBUG_LINE_NO:3010
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.StarbornAdversaryPerformStateChange(newState, -1.0, -1.0, distortion) ; #DEBUG_LINE_NO:3013
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryForceStateAdvance()
  Guard AdversaryBattleStageDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3020
    Self.StarbornAdversaryPerformStateChange(adversaryBattleStageDataIndex + 1, -1.0, -1.0, None) ; #DEBUG_LINE_NO:3021
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ForceAdversaryShift(String shiftName)
  Int failsafe = 0 ; #DEBUG_LINE_NO:3027
  While !safeToForceAdversaryShift && failsafe < CONST_ForceAdversaryShiftFailsafe ; #DEBUG_LINE_NO:3028
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:3029
    failsafe += 1 ; #DEBUG_LINE_NO:3030
  EndWhile ; #DEBUG_LINE_NO:
  If safeToForceAdversaryShift ; #DEBUG_LINE_NO:3032
    selfAsShiftingScript.UpdateAdversary(shiftName, 0.0) ; #DEBUG_LINE_NO:3033
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryShiftingTriggerEntered(lc165adversaryshiftingtriggerscript sourceTrigger, Actor triggerActor, ObjectReference distortion)
  If triggerActor != None ; #DEBUG_LINE_NO:3041
    Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3042
      If triggerActor == player ; #DEBUG_LINE_NO:3043
        If sourceTrigger.ShouldShiftPlayer ; #DEBUG_LINE_NO:3044
          Int lastShiftIndex = AdversaryBattleStageData.rfindstruct("ShiftToTrigger", sourceTrigger.shiftName, -1) ; #DEBUG_LINE_NO:3046
          If lastShiftIndex < 0 ; #DEBUG_LINE_NO:3047
             ; #DEBUG_LINE_NO:
          Else ; #DEBUG_LINE_NO:
            Self.StarbornAdversaryForceState(lastShiftIndex + 1, distortion) ; #DEBUG_LINE_NO:3050
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      ElseIf triggerActor == Companion.GetActorRef() || triggerActor == Ally.GetActorRef() ; #DEBUG_LINE_NO:3053
        If sourceTrigger.ShouldShiftPlayer ; #DEBUG_LINE_NO:3054
          triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:3056
          triggerActor.MoveTo(LC165AllyHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3057
        EndIf ; #DEBUG_LINE_NO:
      ElseIf StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.Find(triggerActor as ObjectReference) >= 0 ; #DEBUG_LINE_NO:3059
        If sourceTrigger.ShouldShiftAdversary ; #DEBUG_LINE_NO:3060
          Int lastshiftindex = AdversaryBattleStageData.rfindstruct("ShiftToTrigger", sourceTrigger.shiftName, -1) ; #DEBUG_LINE_NO:3062
          If lastshiftindex < 0 ; #DEBUG_LINE_NO:3063
             ; #DEBUG_LINE_NO:
          ElseIf adversaryLastShiftIndex <= lastshiftindex ; #DEBUG_LINE_NO:3065
            triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:3068
            triggerActor.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword) ; #DEBUG_LINE_NO:3069
            triggerActor.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3070
            Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:3073
            Bool allInaccessible = True ; #DEBUG_LINE_NO:3074
            Int I = 0 ; #DEBUG_LINE_NO:3075
            While I < allDuplicates.Length && allInaccessible ; #DEBUG_LINE_NO:3076
              allInaccessible = allDuplicates[I].HasKeyword(LC165_StarbornAdversaryInaccessibleKeyword) ; #DEBUG_LINE_NO:3077
              I += 1 ; #DEBUG_LINE_NO:3078
            EndWhile ; #DEBUG_LINE_NO:
            If allInaccessible ; #DEBUG_LINE_NO:3080
              StarbornAdversary_ActiveDistortion.ForceRefTo(sourceTrigger.GetLinkedRef(None)) ; #DEBUG_LINE_NO:3081
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      ElseIf sourceTrigger.ShouldShiftOtherActors ; #DEBUG_LINE_NO:3087
        If sourceTrigger.ShouldPlayVFXForOtherActors ; #DEBUG_LINE_NO:3090
          triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:3091
        EndIf ; #DEBUG_LINE_NO:
        triggerActor.DisableNoWait(False) ; #DEBUG_LINE_NO:3093
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryUpdateAllHoldPositionLinks(Bool ShouldUseHoldPreferred)
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:3102
  Int I = 0 ; #DEBUG_LINE_NO:3103
  While I < adversaryRefs.Length ; #DEBUG_LINE_NO:3104
    Actor current = adversaryRefs[I] ; #DEBUG_LINE_NO:3105
    Int j = 0 ; #DEBUG_LINE_NO:3106
    While j < StarbornMovementHoldPositionKeywords.Length ; #DEBUG_LINE_NO:3107
      current.SetLinkedRef(None, StarbornMovementHoldPositionKeywords[j], True) ; #DEBUG_LINE_NO:3108
      j += 1 ; #DEBUG_LINE_NO:3109
    EndWhile ; #DEBUG_LINE_NO:
    If ShouldUseHoldPreferred ; #DEBUG_LINE_NO:3111
      current.AddKeyword(LC165_BossHoldPosition_PreferredKeyword) ; #DEBUG_LINE_NO:3112
    Else ; #DEBUG_LINE_NO:
      current.RemoveKeyword(LC165_BossHoldPosition_PreferredKeyword) ; #DEBUG_LINE_NO:3114
    EndIf ; #DEBUG_LINE_NO:
    Keyword HoldPositionKeyword = StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword ; #DEBUG_LINE_NO:3116
    Self.SetNewHoldPositionTargetRandom(current, HoldPositionKeyword, currentAdversaryHoldPositionTargetCollection, False, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:3117
    I += 1 ; #DEBUG_LINE_NO:3119
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversarySpellCast(Form spellCast, Actor caster, Actor starbornAdversaryRef, Int starbornDataIndex)
  If spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell as Form ; #DEBUG_LINE_NO:3126
    caster.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell) ; #DEBUG_LINE_NO:3127
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False) ; #DEBUG_LINE_NO:3128
    Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3129
      If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToCreate ; #DEBUG_LINE_NO:3130
        scriptedGravWellTimestamp = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:3131
        starbornAdversary_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Adversary_GravityWellSourceMarker as Form, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornAdversary_GravWellCastDistance) ; #DEBUG_LINE_NO:3132
        If starbornAdversary_GravWellTargetPoint == None ; #DEBUG_LINE_NO:3133
          starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:3134
        Else ; #DEBUG_LINE_NO:
          starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToDetonate ; #DEBUG_LINE_NO:3136
          Self.CreateScriptedGraityWell(starbornAdversary_GravWellTargetPoint) ; #DEBUG_LINE_NO:3137
          StarbornAdversary_GravityWellSourceMarkers.RemoveRef(starbornAdversary_GravWellTargetPoint) ; #DEBUG_LINE_NO:3138
          starbornAdversary_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3139
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  ElseIf spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell as Form ; #DEBUG_LINE_NO:3143
    caster.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell) ; #DEBUG_LINE_NO:3144
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False) ; #DEBUG_LINE_NO:3145
    Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3146
      If starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate ; #DEBUG_LINE_NO:3147
        starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate ; #DEBUG_LINE_NO:3148
        Self.DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True) ; #DEBUG_LINE_NO:3149
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  ElseIf spellCast == LC165_Starborn_Adversary_ScriptedInnerDemonSpell as Form ; #DEBUG_LINE_NO:3152
    caster.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell) ; #DEBUG_LINE_NO:3153
    Self.StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False) ; #DEBUG_LINE_NO:3154
    Guard AdversaryDemonGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3155
      If starbornAdversaryDemonState == CONST_StarbornAdversary_DemonState_ReadyToCast ; #DEBUG_LINE_NO:3156
        starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting ; #DEBUG_LINE_NO:3157
        If !starbornAdversaryHasSpawnedInitialDemons ; #DEBUG_LINE_NO:3158
          starbornAdversaryHasSpawnedInitialDemons = True ; #DEBUG_LINE_NO:3159
          ObjectReference[] starbornAdversaryInitialDemonSpawnPoints = StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints.GetArray() ; #DEBUG_LINE_NO:3160
          Int I = 0 ; #DEBUG_LINE_NO:3161
          While I < CONST_StarbornAdversary_DemonsToSpawnTotal ; #DEBUG_LINE_NO:3162
            Self.StarbornAdversarySpawnDemon(caster, starbornAdversaryInitialDemonSpawnPoints[I]) ; #DEBUG_LINE_NO:3163
            I += 1 ; #DEBUG_LINE_NO:3164
          EndWhile ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          Int i = 0 ; #DEBUG_LINE_NO:3167
          While i < CONST_StarbornAdversary_DemonsToSpawnPerCastMax && StarbornAdversary_Demons.GetCount() < CONST_StarbornAdversary_DemonsToSpawnTotal ; #DEBUG_LINE_NO:3168
            Self.StarbornAdversarySpawnDemon(caster, None) ; #DEBUG_LINE_NO:3169
            i += 1 ; #DEBUG_LINE_NO:3170
          EndWhile ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function StarbornAdversaryHit(Actor aggressor, Actor target, Actor starbornAdversaryRef, Int starbornDataIndex)
  target.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition as Float) ; #DEBUG_LINE_NO:3181
  target.EvaluatePackage(False) ; #DEBUG_LINE_NO:3182
EndFunction

Function StarbornAdversarySetZeroGActive()
  Guard AdversaryZeroGGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3188
    If !adversaryCompletedZeroGPhase ; #DEBUG_LINE_NO:3190
      artifactZeroGExplosion = artifactActivatorRef.PlaceAtMe(ArtifactPower_AntiGravityField as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:3192
      Self.SetVascoZeroGInactive(True) ; #DEBUG_LINE_NO:3193
      LC165BuriedTemple03.SetGravityScale(0.0) ; #DEBUG_LINE_NO:3194
      ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray() ; #DEBUG_LINE_NO:3196
      Int i = 0 ; #DEBUG_LINE_NO:3197
      While i < zeroGDisableObjects.Length ; #DEBUG_LINE_NO:3198
        zeroGDisableObjects[i].DisableNoWait(False) ; #DEBUG_LINE_NO:3199
        i += 1 ; #DEBUG_LINE_NO:3200
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  ObjectReference[] zeroGImpulseObjects = StarbornAdversary_ZeroGImpulseObjects.GetArray() ; #DEBUG_LINE_NO:3204
  Int I = 0 ; #DEBUG_LINE_NO:3205
  While I < zeroGImpulseObjects.Length ; #DEBUG_LINE_NO:3206
    zeroGImpulseObjects[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (zeroGImpulseObjects[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25) ; #DEBUG_LINE_NO:3207
    I += 1 ; #DEBUG_LINE_NO:3208
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversarySetZeroGInactive()
  Bool adversaryCompletedZeroGPhaseThisCall = False ; #DEBUG_LINE_NO:3214
  Guard AdversaryZeroGGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3215
    If !adversaryCompletedZeroGPhase ; #DEBUG_LINE_NO:3216
      LC165BuriedTemple03.SetGravityScale(CONST_Gravity_MasadaIII) ; #DEBUG_LINE_NO:3218
      Self.SetVascoZeroGInactive(False) ; #DEBUG_LINE_NO:3219
      adversaryCompletedZeroGPhase = True ; #DEBUG_LINE_NO:3220
      adversaryCompletedZeroGPhaseThisCall = True ; #DEBUG_LINE_NO:3221
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  If adversaryCompletedZeroGPhaseThisCall ; #DEBUG_LINE_NO:3224
    Self.CallFunctionNoWait("StarbornAdversarySetZeroGInactiveNoWait", None) ; #DEBUG_LINE_NO:3225
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetVascoZeroGInactive(Bool shouldBeInactive)
  Actor[] followerRefs = Followers.GetArray() as Actor[] ; #DEBUG_LINE_NO:3232
  If followerRefs != None ; #DEBUG_LINE_NO:3233
    Int I = 0 ; #DEBUG_LINE_NO:3234
    While I < followerRefs.Length ; #DEBUG_LINE_NO:3235
      vascoshutdownzerogscript VascoRef = followerRefs[I] as vascoshutdownzerogscript ; #DEBUG_LINE_NO:3236
      If VascoRef != None ; #DEBUG_LINE_NO:3237
        If shouldBeInactive ; #DEBUG_LINE_NO:3238
          VascoRef.ShutDown() ; #DEBUG_LINE_NO:3239
        Else ; #DEBUG_LINE_NO:
          VascoRef.StartUp() ; #DEBUG_LINE_NO:3241
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:3244
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversarySetZeroGInactiveNoWait()
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:3253
  Actor companionRef = Companion.GetActorRef() ; #DEBUG_LINE_NO:3254
  If companionRef != None ; #DEBUG_LINE_NO:3255
    Self.UnregisterForRemoteEvent(companionRef as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:3256
  EndIf ; #DEBUG_LINE_NO:
  Actor[] followerRefs = Followers.GetArray() as Actor[] ; #DEBUG_LINE_NO:3258
  Int I = 0 ; #DEBUG_LINE_NO:3259
  While followerRefs != None && I < followerRefs.Length ; #DEBUG_LINE_NO:3260
    Self.UnregisterForRemoteEvent(followerRefs[I] as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:3261
    I += 1 ; #DEBUG_LINE_NO:3262
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray() ; #DEBUG_LINE_NO:3265
  I = 0 ; #DEBUG_LINE_NO:3266
  While I < zeroGDisableObjects.Length ; #DEBUG_LINE_NO:3267
    zeroGDisableObjects[I].EnableNoWait(False) ; #DEBUG_LINE_NO:3268
    I += 1 ; #DEBUG_LINE_NO:3269
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryShiftAwayFromTemple()
  Self.StarbornAdversarySetZeroGInactive() ; #DEBUG_LINE_NO:3276
  Self.SetArtifactStage(4) ; #DEBUG_LINE_NO:3278
  adversaryHasShiftedAwayFromTemple = True ; #DEBUG_LINE_NO:3280
  If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) || Self.GetStageDone(CONST_Stage_Startup_BothEnemies) ; #DEBUG_LINE_NO:3282
    StarbornAdversary_Astral_Dancers.EnableAll(False) ; #DEBUG_LINE_NO:3283
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryTeleportInNishina()
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:3289
  If adversaryRefs != None ; #DEBUG_LINE_NO:3290
    Guard AdversaryShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3291
      ObjectReference nextTeleportPoint = StarbornAdversary_Nishina_TeleportMarkerChainHead.GetRef() ; #DEBUG_LINE_NO:3292
      Int I = 0 ; #DEBUG_LINE_NO:3293
      While I < adversaryRefs.Length ; #DEBUG_LINE_NO:3294
        Self.SetNewHoldPositionTarget(adversaryRefs[I], StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword, nextTeleportPoint, True, False, None, None, None, None, -1.0) ; #DEBUG_LINE_NO:3295
        nextTeleportPoint = nextTeleportPoint.GetLinkedRef(None) ; #DEBUG_LINE_NO:3296
        I += 1 ; #DEBUG_LINE_NO:3297
      EndWhile ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Actor Function StarbornAdversarySpawnDemon(Actor caster, ObjectReference spawnPoint)
  Actor demon = Self.CreateRuinsDemon(CONST_Adversary_DataIndex, StarbornAdversary_Demons) ; #DEBUG_LINE_NO:3305
  If spawnPoint == None ; #DEBUG_LINE_NO:3306
    Self.CombatTeleportNearRefNoWait(demon, caster as ObjectReference, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:3307
  Else ; #DEBUG_LINE_NO:
    Self.CombatTeleportNearRefNoWait(demon, spawnPoint, 0.0, 0.0, True, False, None, LC165_StarbornInnerDemonSpawnExplosion, None, None, -1.0) ; #DEBUG_LINE_NO:3309
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryKillDemons()
  Self.CleanupScriptedActors(StarbornAdversary_Demons.GetArray() as Actor[], -1, True, None, None, -1.0) ; #DEBUG_LINE_NO:3315
EndFunction

Function StarbornAdversaryUpdateAdversaryActors()
  Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:3321
  If adversaryRefs != None && adversaryRefs.Length >= 1 ; #DEBUG_LINE_NO:3322
    If Self.GetStageDone(CONST_Stage_Startup_HunterEnemy) ; #DEBUG_LINE_NO:3323
      StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0] as ObjectReference) ; #DEBUG_LINE_NO:3324
    ElseIf Self.GetStageDone(CONST_Stage_Startup_EmissaryEnemy) ; #DEBUG_LINE_NO:3325
      StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0] as ObjectReference) ; #DEBUG_LINE_NO:3326
    ElseIf adversaryRefs[0].HasKeyword(MQHunterKeyword) ; #DEBUG_LINE_NO:3328
      StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0] as ObjectReference) ; #DEBUG_LINE_NO:3329
      If adversaryRefs.Length >= 2 ; #DEBUG_LINE_NO:3330
        StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[1] as ObjectReference) ; #DEBUG_LINE_NO:3331
      Else ; #DEBUG_LINE_NO:
        StarbornAdversary_Emissary.Clear() ; #DEBUG_LINE_NO:3333
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      StarbornAdversary_Hunter.Clear() ; #DEBUG_LINE_NO:3336
      StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0] as ObjectReference) ; #DEBUG_LINE_NO:3337
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryPlayDeathSceneAndWait(Actor deathSceneActor)
  MQ302_Battle_06_Adversary_Museum_Arrival.Stop() ; #DEBUG_LINE_NO:3346
  deathSceneActor.DispelSpell(AIPower_VoidForm) ; #DEBUG_LINE_NO:3348
  deathSceneActor.DispelSpell(LC165_Scripted_VoidFormAb) ; #DEBUG_LINE_NO:3349
  If deathSceneActor.HasKeyword(MQHunterKeyword) ; #DEBUG_LINE_NO:3351
    StarbornAdversary_Hunter.ForceRefTo(deathSceneActor as ObjectReference) ; #DEBUG_LINE_NO:3352
    MQ302_Battle_06_Adversary_HunterDeath.Start() ; #DEBUG_LINE_NO:3353
  Else ; #DEBUG_LINE_NO:
    StarbornAdversary_Emissary.ForceRefTo(deathSceneActor as ObjectReference) ; #DEBUG_LINE_NO:3355
    MQ302_Battle_06_Adversary_EmissaryDeath.Start() ; #DEBUG_LINE_NO:3356
  EndIf ; #DEBUG_LINE_NO:
  Self.StarbornAdversaryMoveAndKillAdversary() ; #DEBUG_LINE_NO:3359
  Int failsafe = 0 ; #DEBUG_LINE_NO:3361
  While !Self.GetStageDone(CONST_Adversary_DeathSceneCompletedStage) && failsafe < CONST_Adversary_DeathSceneFailsafeTimeout ; #DEBUG_LINE_NO:3362
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:3363
    failsafe += 1 ; #DEBUG_LINE_NO:3364
  EndWhile ; #DEBUG_LINE_NO:
  deathSceneActor.BlockActivation(True, True) ; #DEBUG_LINE_NO:3367
  deathSceneActor.KillEssential(None) ; #DEBUG_LINE_NO:3368
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:3369
  WwiseEvent_ShakeController_p75_p75_03.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:3371
EndFunction

Function StarbornAdversaryMoveAndKillAdversary()
  adversary01Ref.MoveTo(StarbornAdversary_DeathMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3376
  adversary01Ref.Enable(False) ; #DEBUG_LINE_NO:3377
  adversary01Ref.KillEssential(player) ; #DEBUG_LINE_NO:3378
  If adversary02Ref != None ; #DEBUG_LINE_NO:3379
    adversary02Ref.MoveTo(StarbornAdversary_DeathMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3380
    adversary02Ref.Enable(False) ; #DEBUG_LINE_NO:3381
    adversary02Ref.KillEssential(player) ; #DEBUG_LINE_NO:3382
  EndIf ; #DEBUG_LINE_NO:
  artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_AfterBattle) ; #DEBUG_LINE_NO:3385
EndFunction

Function StarbornAdversaryEnd(Bool adversarySurrendered)
  MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Remove() ; #DEBUG_LINE_NO:3393
  If !adversarySurrendered ; #DEBUG_LINE_NO:3395
    Self.StarbornAdversaryMoveAndKillAdversary() ; #DEBUG_LINE_NO:3398
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversarySurrenderTeleport(Scene starbornAdversarySurrenderScene)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:3404
  akArgs[0] = starbornAdversarySurrenderScene as Var ; #DEBUG_LINE_NO:3405
  Self.CallFunctionNoWait("StarbornAdversarySurrenderTeleportRef", akArgs) ; #DEBUG_LINE_NO:3406
EndFunction

Function StarbornAdversarySurrenderTeleportRef(Scene starbornAdversarySurrenderScene)
  If adversary01DuplicateRef != None ; #DEBUG_LINE_NO:3411
    adversary01DuplicateRef.SetGhost(True) ; #DEBUG_LINE_NO:3412
    Self.TeleportOutNoWait(adversary01DuplicateRef, None, None, -1.0, False) ; #DEBUG_LINE_NO:3413
  EndIf ; #DEBUG_LINE_NO:
  If adversary02DuplicateRef != None ; #DEBUG_LINE_NO:3415
    adversary02DuplicateRef.SetGhost(True) ; #DEBUG_LINE_NO:3416
    Self.TeleportOutNoWait(adversary02DuplicateRef, None, None, -1.0, False) ; #DEBUG_LINE_NO:3417
  EndIf ; #DEBUG_LINE_NO:
  Int failsafe = 0 ; #DEBUG_LINE_NO:3419
  While starbornAdversarySurrenderScene.IsPlaying() && failsafe < CONST_StarbornAdversarySurrenderSceneFailsafe ; #DEBUG_LINE_NO:3420
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:3421
    failsafe += 1 ; #DEBUG_LINE_NO:3422
  EndWhile ; #DEBUG_LINE_NO:
  If adversary01DuplicateRef != None ; #DEBUG_LINE_NO:3425
    adversary01DuplicateRef.DisableNoWait(False) ; #DEBUG_LINE_NO:3426
  EndIf ; #DEBUG_LINE_NO:
  If adversary02DuplicateRef != None ; #DEBUG_LINE_NO:3428
    adversary02DuplicateRef.DisableNoWait(False) ; #DEBUG_LINE_NO:3429
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StarbornAdversaryRescueCheck()
  If adversary01Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance as Float ; #DEBUG_LINE_NO:3434
    adversary01Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower as Form, 100, False, None) ; #DEBUG_LINE_NO:3436
    adversary01Ref.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False) ; #DEBUG_LINE_NO:3437
  EndIf ; #DEBUG_LINE_NO:
  If adversary02Ref != None && (adversary02Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance as Float) ; #DEBUG_LINE_NO:3439
    adversary02Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower as Form, 100, False, None) ; #DEBUG_LINE_NO:3441
    adversary02Ref.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False) ; #DEBUG_LINE_NO:3442
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetArtifactStageNoWait(Int stage)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:3453
  akArgs[0] = stage as Var ; #DEBUG_LINE_NO:3454
  Self.CallFunctionNoWait("SetArtifactStage", akArgs) ; #DEBUG_LINE_NO:3455
EndFunction

Function SetArtifactStage(Int stage)
  If stage == 0 ; #DEBUG_LINE_NO:3459
    artifactRingsRef.PlayAnimation("Reset") ; #DEBUG_LINE_NO:3460
  ElseIf stage == 1 ; #DEBUG_LINE_NO:3461
     ; #DEBUG_LINE_NO:
  ElseIf stage == 2 ; #DEBUG_LINE_NO:3463
    artifactRingsRef.PlayAnimation("Play01") ; #DEBUG_LINE_NO:3464
  ElseIf stage == 3 ; #DEBUG_LINE_NO:3465
    artifactRingsRef.PlayAnimation("Play03") ; #DEBUG_LINE_NO:3466
  ElseIf stage == 4 ; #DEBUG_LINE_NO:3467
    artifactRingsRef.PlayAnimation("Play04") ; #DEBUG_LINE_NO:3468
  ElseIf stage == 5 ; #DEBUG_LINE_NO:3469
    ArtifactCollision.DisableAll(False) ; #DEBUG_LINE_NO:3472
    ArtifactRingsAudioMarker.TryToDisable() ; #DEBUG_LINE_NO:3473
    artifactRingsRef.PlayAnimationAndWait("Close", "AnimationComplete") ; #DEBUG_LINE_NO:3474
    artifactPlatformRef.PlayAnimation("Play01") ; #DEBUG_LINE_NO:3476
    artifactActivatorRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:3477
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TakeFinalArtifact()
  waitingForLoadOutOfTemple = True ; #DEBUG_LINE_NO:3482
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:3483
  Game.FadeOutGame(True, True, 0.0, 0.5, True) ; #DEBUG_LINE_NO:3484
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:3485
  WwiseEvent_AMBArtifactVisionX.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:3486
  Game.PlayBinkNoWait("PowerVision_PhasedTime.bk2", False, False, True, True, False, True) ; #DEBUG_LINE_NO:3487
  selfAsShiftingScript.ShiftTo("TeleportOut", "", None, -1, None) ; #DEBUG_LINE_NO:3488
EndFunction

Function AwardFinalArtifactPower()
  Utility.Wait(CONST_AwardFinalArtifactPowerDelay) ; #DEBUG_LINE_NO:3492
  ArtifactPower_GrantSpell_Phased_Time.Cast(player as ObjectReference, player as ObjectReference) ; #DEBUG_LINE_NO:3493
  (SBPowerCollectionActivator.GetRef() as sbpowercollectionactivatorscript).PlayerReceivePower() ; #DEBUG_LINE_NO:3494
  Self.SetStage(CONST_Stage_Complete) ; #DEBUG_LINE_NO:3495
EndFunction

Function Cleanup()
  player = None ; #DEBUG_LINE_NO:3505
  selfAsSpaceQuestScript = None ; #DEBUG_LINE_NO:3506
  selfAsShiftingScript = None ; #DEBUG_LINE_NO:3507
  scriptedGravWellHazard = None ; #DEBUG_LINE_NO:3508
  scriptedExplosionHazard = None ; #DEBUG_LINE_NO:3509
  bridgeBoundsTriggerRef = None ; #DEBUG_LINE_NO:3510
  bridgeHoldPositionTriggerRef = None ; #DEBUG_LINE_NO:3511
  bridgeCharger = None ; #DEBUG_LINE_NO:3512
  bridgeLastHit = None ; #DEBUG_LINE_NO:3513
  CourtyardReanimateTargetsAll = None ; #DEBUG_LINE_NO:3514
  CourtyardReanimateTargetsRandomized = None ; #DEBUG_LINE_NO:3515
  courtyardLastSwapMarker1 = None ; #DEBUG_LINE_NO:3516
  courtyardLastSwapMarker2 = None ; #DEBUG_LINE_NO:3517
  exteriorIDCardReaderRef = None ; #DEBUG_LINE_NO:3518
  starbornFireActorRef = None ; #DEBUG_LINE_NO:3519
  starbornIceActorRef = None ; #DEBUG_LINE_NO:3520
  Guard EngineeringGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3521
    starbornEngineering_GravWellTargetPoint = None ; #DEBUG_LINE_NO:3522
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  If LC165EnableLayer != None ; #DEBUG_LINE_NO:3524
    LC165EnableLayer.Delete() ; #DEBUG_LINE_NO:3525
  EndIf ; #DEBUG_LINE_NO:
  starbornRuinsTriggerRef = None ; #DEBUG_LINE_NO:3527
  templeExteriorDoorRef = None ; #DEBUG_LINE_NO:3528
  templeExteriorDoorBarsRef = None ; #DEBUG_LINE_NO:3529
  templeInteriorDoorRef = None ; #DEBUG_LINE_NO:3530
  adversary01Ref = None ; #DEBUG_LINE_NO:3531
  adversary02Ref = None ; #DEBUG_LINE_NO:3532
  adversary01DuplicateRef = None ; #DEBUG_LINE_NO:3533
  adversary02DuplicateRef = None ; #DEBUG_LINE_NO:3534
  starbornAdversaryPrimary = None ; #DEBUG_LINE_NO:3535
  starbornAdversaryCurrentPrimary = None ; #DEBUG_LINE_NO:3536
  starbornAdversaryHunter = None ; #DEBUG_LINE_NO:3537
  starbornAdversaryEmissary = None ; #DEBUG_LINE_NO:3538
  currentAdversaryHoldPositionTargetCollection = None ; #DEBUG_LINE_NO:3539
  artifactZeroGExplosion = None ; #DEBUG_LINE_NO:3540
  artifactActivatorRef = None ; #DEBUG_LINE_NO:3541
  artifactRingsRef = None ; #DEBUG_LINE_NO:3542
  artifactPlatformRef = None ; #DEBUG_LINE_NO:3543
  Guard AdversaryGravWellGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:3544
     ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function SetPlayerControlsEnabled(Bool enableControls)
  If LC165EnableLayer == None ; #DEBUG_LINE_NO:3557
    LC165EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:3558
  EndIf ; #DEBUG_LINE_NO:
  LC165EnableLayer.EnableMovement(enableControls) ; #DEBUG_LINE_NO:3560
  LC165EnableLayer.EnableFighting(enableControls) ; #DEBUG_LINE_NO:3561
  LC165EnableLayer.EnableSneaking(enableControls) ; #DEBUG_LINE_NO:3562
  LC165EnableLayer.EnableFarTravel(enableControls) ; #DEBUG_LINE_NO:3563
  LC165EnableLayer.EnableFastTravel(enableControls) ; #DEBUG_LINE_NO:3564
  LC165EnableLayer.EnableGravJump(enableControls) ; #DEBUG_LINE_NO:3565
EndFunction

Function DEBUG_TestAdversary(Int index, Bool shouldAllowFurtherShifting)
  DEBUG_AdversaryDebugMode = !shouldAllowFurtherShifting ; #DEBUG_LINE_NO:3576
  If !Self.GetStageDone(20) && !Self.GetStageDone(21) ; #DEBUG_LINE_NO:3577
    Self.SetStage(22) ; #DEBUG_LINE_NO:3578
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(9) ; #DEBUG_LINE_NO:3580
  Self.StarbornAdversaryTeleportInForConfrontation(False) ; #DEBUG_LINE_NO:3581
  Self.SetStage(1120) ; #DEBUG_LINE_NO:3582
  Self.StarbornAdversaryForceState(index, None) ; #DEBUG_LINE_NO:3583
EndFunction

Function DEBUG_KillAdversaries()
  adversary01Ref.DamageValue(Health, 1000000.0) ; #DEBUG_LINE_NO:3588
  Actor[] duplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:3589
  Int I = 0 ; #DEBUG_LINE_NO:3590
  While I < duplicates.Length ; #DEBUG_LINE_NO:3591
    duplicates[I].DamageValue(Health, 1000000.0) ; #DEBUG_LINE_NO:3592
    I += 1 ; #DEBUG_LINE_NO:3593
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_StarbornRuinsBlockSpawning()
  DEBUG_StarbornRuinsBlockDemonSpawning = True ; #DEBUG_LINE_NO:3599
EndFunction

Function DEBUG_MoveToPlayer(ObjectReference ref)
  ref.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:3604
EndFunction

Function DebugCamera(Actor ID)
  Game.SetCameraTarget(ID) ; #DEBUG_LINE_NO:3608
EndFunction
