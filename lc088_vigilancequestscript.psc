ScriptName LC088_VigilanceQuestScript Extends Quest
{ Quest script for LC088_Vigilance, the Vigilance portion of the Crimson Fleet Final Battle. }

;-- Structs -----------------------------------------
Struct PrisonerOutfitDatum
  ActorBase PrisonerActorBase
  Outfit PrisonerPostReleaseOutfit
EndStruct


;-- Variables ---------------------------------------
Int CONST_Aggression_Aggressive = 1 Const
Int CONST_Brig_GenericPrisonersToSpawn = 2 Const
Int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const
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
Int CONST_Complete_Postquest_StartPostquest_Stage = 100 Const
Int CONST_Complete_Space_VigilanceCompleted_Stage = 193 Const
Int CONST_Complete_Stage = 1100 Const
Int CONST_Complete_StartNaevaScene_Stage = 1094 Const
Int CONST_DoorState_ActivationBlocked = 2 Const
Int CONST_DoorState_Open = 0 Const
Int CONST_DoorState_Sealed = 1 Const
Int CONST_Estelle_StartStage = 810 Const
Float CONST_FleeTimerDelay = 0.25 Const
Int CONST_FleeTimerID = 2 Const
Int CONST_Flee_DockingPortRemovalRadiusDistance = 4 Const
Int CONST_Flee_FleeRemovalDistance = 20 Const
Int CONST_LockLevel_RequiresTerminal = 253 Const
Int CONST_Ops_BattleMonitorTimerDelay = 1 Const
Int CONST_Ops_BattleMonitorTimerID = 5 Const
Float CONST_Ops_MovementUpdateHealthLossPercent = 0.300000012 Const
Int CONST_Ops_MovementUpdateTime = 15 Const
Int CONST_Ops_RobotActivationDelay = 7 Const
Int CONST_Ops_RobotActivationTimerDelay = 9 Const
Int CONST_Ops_RobotActivationTimerID = 4 Const
Int CONST_Ops_TurretActivationDelay = 5 Const
Int CONST_Ops_TurretActivationTimerDelay = 5 Const
Int CONST_Ops_TurretActivationTimerID = 3 Const
Int CONST_Quarters_ClearedStage = 880 Const
Int CONST_Robotics_MaxSimultaneousActiveRobots = 3 Const
Int CONST_Robotics_RoboticsBattleCompletedStage = 480 Const
Int CONST_Robotics_RoboticsBattleDeactivatedStage = 470 Const
Int CONST_Surrender_Stage = 1019 Const
Int CONST_UpdateRoboticsBattleTimerDelay = 2 Const
Int CONST_UpdateRoboticsBattleTimerID = 1 Const
Int CONST_WeaponsBattleCompletedStage = 680 Const
Bool Flee_HasFinishedFirstFleeTimer
Bool Flee_HasFinishedFleeEventSetup
robotpodscript[] Robotics_RoboticsEnemies
Bool Weapons_WeaponsAndTurretsLockedDown
ObjectReference[] brigFindWeaponsTriggers
ObjectReference brigTerminal
ObjectReference cargoBayTerminal
ObjectReference dockingPort05Ref
Bool enabledEstelle
ObjectReference engineRoomTerminal
Int estelleLevel
ObjectReference holdingCellMarkerRef
Actor kibweRef
Actor player
Actor toftRef
Bool updatingTerminal
inputenablelayer vigilanceInputLayer
ObjectReference weaponsTerminal

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BrigPrisonerFindWeaponGuard
Guard OpsActorCollectionsGuard
Guard RoboticsEnemiesGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc088_vigilancequestscript:prisoneroutfitdatum[] Property PrisonerOutfitData Auto Const mandatory
EndGroup

Group AutofillProperties
  lc082_brigquestscript Property LC082 Auto Const mandatory
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Quest Property LC088_Space Auto Const mandatory
  Quest Property CF_Post Auto Const mandatory
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
  ReferenceAlias Property Kibwe Auto Const mandatory
  ReferenceAlias Property Ops_KibweStartMarker Auto Const mandatory
  ReferenceAlias Property Toft Auto Const mandatory
  ReferenceAlias Property Ops_ToftStartMarker Auto Const mandatory
  ReferenceAlias Property Brig_Terminal Auto Const mandatory
  RefCollectionAlias Property Brig_GenericPrisoners Auto Const mandatory
  RefCollectionAlias Property Brig_ReleasedPrisoners Auto Const mandatory
  RefCollectionAlias Property Brig_Enemies Auto Const mandatory
  RefCollectionAlias Property Brig_PrisonerFindWeaponTriggers Auto Const mandatory
  ReferenceAlias Property Brig_LarryDumbrosky Auto Const mandatory
  ReferenceAlias Property Brig_AyumiKomiko Auto Const mandatory
  ReferenceAlias Property Brig_AustinRake Auto Const mandatory
  ReferenceAlias Property Cargo_Terminal Auto Const mandatory
  RefCollectionAlias Property Rokov_RoomEnemies Auto Const mandatory
  ReferenceAlias Property Robotics_EventManager Auto Const mandatory
  RefCollectionAlias Property Robotics_RoboticsRoomDoors Auto Const mandatory
  ReferenceAlias Property Naeva_EngineRoom3Terminal Auto Const mandatory
  RefCollectionAlias Property Naeva_EngineRoom3Enemies Auto Const mandatory
  RefCollectionAlias Property Naeva_Allies Auto Const mandatory
  ReferenceAlias Property Weapons_Terminal Auto Const mandatory
  ReferenceAlias Property Weapons_WeaponsBayDoor Auto Const mandatory
  RefCollectionAlias Property Weapons_AmbushDoors Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesAll Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesInWeaponBays Auto Const mandatory
  RefCollectionAlias Property Weapons_EnemiesRobotsAndTurrets Auto Const mandatory
  RefCollectionAlias Property Mess_AmbushDoors Auto Const mandatory
  RefCollectionAlias Property Mess_AmbushEnemies Auto Const mandatory
  ReferenceAlias Property Estelle_EndMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level1_StartMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level2_StartMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level1_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level2_EnableMarker Auto Const mandatory
  ReferenceAlias Property Estelle_Level3_EnableMarker Auto Const mandatory
  RefCollectionAlias Property Estelle_Level1_QuartersEnemies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level2_QuartersEnemies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level2_QuartersAllies Auto Const mandatory
  RefCollectionAlias Property Estelle_Level3_QuartersAllies Auto Const mandatory
  ReferenceAlias Property Flee_DockingPort05 Auto Const mandatory
  ReferenceAlias Property Flee_HoldingCellMarker Auto Const mandatory
  RefCollectionAlias Property Flee_EnemiesFleeing Auto Const mandatory
  RefCollectionAlias Property Flee_EnemiesFleeingToGenericDockingPort Auto Const mandatory
  RefCollectionAlias Property Flee_NonBossBattleEnemies Auto Const mandatory
  RefCollectionAlias Property Flee_FleeAreaDoors Auto Const mandatory
  RefCollectionAlias Property Ops_RobotsAndTurrets Auto Const mandatory
  RefCollectionAlias Property Ops_Robots Auto Const mandatory
  RefCollectionAlias Property Ops_Robots_Initial Auto Const mandatory
  RefCollectionAlias Property Ops_Turrets Auto Const mandatory
  RefCollectionAlias Property Ops_BossHoldPositionTargets Auto Const mandatory
  RefCollectionAlias Property Ops_Elevators_FloorMarkers Auto Const mandatory
  RefCollectionAlias Property Ops_Doors_ElevatorAccessDoors Auto Const mandatory
  RefCollectionAlias Property Ops_Doors_OperationsCenterDoors Auto Const mandatory
  ReferenceAlias Property CF08BattleAlarm Auto Const mandatory
  Scene Property LC088_810_Estelle_Start Auto Const mandatory
  Scene Property LC088_810_Estelle_Start_2 Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
  Cell Property LC082Vigilance01 Auto Const mandatory
  Cell Property ssLC082Vigilance02 Auto Const mandatory
  Location Property LC082VigilanceLocation Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_Vigilance Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionAdlerKemp Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
  Keyword Property DMP_LinkRobotPod Auto Const mandatory
  Keyword Property LC088_LinkCaptainStartMarker Auto Const mandatory
  Keyword Property LC088_LinkRoboticsRobot Auto Const mandatory
  Keyword Property LC088_Ops_BossHoldPositionLink Auto Const mandatory
  Keyword Property LC088_Ops_BossHoldPositionInitialMarkerKeyword Auto Const mandatory
  Keyword Property LC088_Vigilance_Brig_CurrentPrisonerKeyword Auto Const mandatory
  ActorValue Property LC088_Vigilance_Brig_PrisonerFoundWeaponValue Auto Const mandatory
  ActorValue Property LC088_Vigilance_CaptainEventCompletedValue Auto Const mandatory
  ActorValue Property LC088_Ops_BossHoldPositionValue Auto Const mandatory
  ActorValue Property LC088_Ops_MovementUpdateHealthPercentStampValue Auto Const mandatory
  ActorValue Property LC088_Ops_MovementUpdateTimestampValue Auto Const mandatory
  Armor Property Clothes_UC_Prisoner Auto Const mandatory
  LeveledItem Property LLI_Role_UC Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:225
  kibweRef = Kibwe.GetActorRef() ; #DEBUG_LINE_NO:226
  toftRef = Toft.GetActorRef() ; #DEBUG_LINE_NO:227
  brigTerminal = Brig_Terminal.GetRef() ; #DEBUG_LINE_NO:228
  brigFindWeaponsTriggers = Brig_PrisonerFindWeaponTriggers.GetArray() ; #DEBUG_LINE_NO:229
  cargoBayTerminal = Cargo_Terminal.GetRef() ; #DEBUG_LINE_NO:230
  engineRoomTerminal = Naeva_EngineRoom3Terminal.GetRef() ; #DEBUG_LINE_NO:231
  weaponsTerminal = Weapons_Terminal.GetRef() ; #DEBUG_LINE_NO:232
  dockingPort05Ref = Flee_DockingPort05.GetRef() ; #DEBUG_LINE_NO:233
  holdingCellMarkerRef = Flee_HoldingCellMarker.GetRef() ; #DEBUG_LINE_NO:234
  vigilanceInputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:235
  kibweRef.Reset(None) ; #DEBUG_LINE_NO:238
  toftRef.Reset(None) ; #DEBUG_LINE_NO:239
  Flee_NonBossBattleEnemies.ResetAll() ; #DEBUG_LINE_NO:240
  Ops_RobotsAndTurrets.ResetAll() ; #DEBUG_LINE_NO:241
  LC082.ResetAllPrisoners() ; #DEBUG_LINE_NO:242
  LC082Vigilance01.SetFactionOwner(None) ; #DEBUG_LINE_NO:245
  ssLC082Vigilance02.SetFactionOwner(None) ; #DEBUG_LINE_NO:246
  Int I = 0 ; #DEBUG_LINE_NO:249
  While I < brigFindWeaponsTriggers.Length ; #DEBUG_LINE_NO:250
    Self.RegisterForRemoteEvent(brigFindWeaponsTriggers[I] as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:251
    I += 1 ; #DEBUG_LINE_NO:252
  EndWhile ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:254
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Unconscious") ; #DEBUG_LINE_NO:255
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_NativeTerminalActor_Ally") ; #DEBUG_LINE_NO:256
EndEvent

Function SetupAllCaptainEvents()
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Rokov, CONST_CaptainActiveStage_Rokov, Rokov.GetActorRef(), Rokov_EnableMarker.GetRef(), Rokov_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:269
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Mathis, CONST_CaptainActiveStage_Mathis, Mathis.GetActorRef(), Mathis_EnableMarker.GetRef(), Mathis_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:270
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Naeva, CONST_CaptainActiveStage_Naeva, Naeva.GetActorRef(), Naeva_EnableMarker.GetRef(), Naeva_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:271
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Adler, CONST_CaptainActiveStage_Adler, Adler.GetActorRef(), Adler_EnableMarker.GetRef(), Adler_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:272
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Huan, CONST_CaptainActiveStage_Huan, Huan.GetActorRef(), Huan_EnableMarker.GetRef(), Huan_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:273
  Self.SetupCaptainEvent(CrimsonFleetCaptainState_Estelle, CONST_CaptainActiveStage_Estelle, Estelle.GetActorRef(), Estelle_EnableMarker.GetRef(), Estelle_DisableMarker.GetRef()) ; #DEBUG_LINE_NO:274
  If CrimsonFleetCaptainState_Estelle.GetValue() == CONST_CaptainState_Active as Float ; #DEBUG_LINE_NO:275
    estelleLevel = CrimsonFleetCaptainStateDifficulty_Estelle.GetValueInt() ; #DEBUG_LINE_NO:276
  EndIf ; #DEBUG_LINE_NO:
  Int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt() ; #DEBUG_LINE_NO:280
  If adlerState == CONST_CaptainState_Active || adlerState == CONST_CaptainState_Imprisoned ; #DEBUG_LINE_NO:281
    Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp) ; #DEBUG_LINE_NO:282
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupCaptainEvent(GlobalVariable captainStateGlobal, Int captainActiveStage, Actor captain, ObjectReference enableMarker, ObjectReference disableMarker)
  Int captainState = captainStateGlobal.GetValueInt() ; #DEBUG_LINE_NO:287
  If captainState == CONST_CaptainState_Active ; #DEBUG_LINE_NO:288
    captain.Disable(False) ; #DEBUG_LINE_NO:289
    captain.Reset(None) ; #DEBUG_LINE_NO:290
    captain.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:291
    captain.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:292
    enableMarker.Enable(False) ; #DEBUG_LINE_NO:293
    disableMarker.Disable(False) ; #DEBUG_LINE_NO:294
    Self.SetStage(captainActiveStage) ; #DEBUG_LINE_NO:295
  Else ; #DEBUG_LINE_NO:
    enableMarker.Disable(False) ; #DEBUG_LINE_NO:297
    disableMarker.Enable(False) ; #DEBUG_LINE_NO:298
    If captainState == CONST_CaptainState_Imprisoned ; #DEBUG_LINE_NO:299
      captain.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:300
      captain.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:301
      If !captain.HasKeyword(LC088_Vigilance_Brig_CurrentPrisonerKeyword) ; #DEBUG_LINE_NO:302
        LC082.AddPrisoner(captain, -1) ; #DEBUG_LINE_NO:303
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetCaptainComplete(Actor captainActor)
  If captainActor.IsEnabled() ; #DEBUG_LINE_NO:314
    captainActor.SetValue(LC088_Vigilance_CaptainEventCompletedValue, 1.0) ; #DEBUG_LINE_NO:315
    captainActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:316
    captainActor.StopCombat() ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetCaptainAlliesComplete(RefCollectionAlias captainAllyCollection)
  Int I = 0 ; #DEBUG_LINE_NO:322
  Actor[] captainAllies = captainAllyCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:323
  While I < captainAllies.Length ; #DEBUG_LINE_NO:324
    Self.SetCaptainComplete(captainAllies[I]) ; #DEBUG_LINE_NO:325
    I += 1 ; #DEBUG_LINE_NO:326
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ShutdownAllCaptainEvents(Bool excludeNaevaIfSurrenderActive)
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Rokov, Rokov, False) ; #DEBUG_LINE_NO:335
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Mathis, Mathis, False) ; #DEBUG_LINE_NO:336
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Naeva, Naeva, True) ; #DEBUG_LINE_NO:337
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Adler, Adler, False) ; #DEBUG_LINE_NO:338
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Huan, Huan, False) ; #DEBUG_LINE_NO:339
  Self.ShutdownCaptainEvent(CrimsonFleetCaptainState_Estelle, Estelle, False) ; #DEBUG_LINE_NO:340
EndFunction

Function ShutdownCaptainEvent(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias, Bool shouldSkipClearingAlias)
  Int captainState = captainStateGlobal.GetValueInt() ; #DEBUG_LINE_NO:344
  If captainState != CONST_CaptainState_Dead ; #DEBUG_LINE_NO:345
    If captainState == CONST_CaptainState_Imprisoned ; #DEBUG_LINE_NO:346
      captainStateGlobal.SetValue(CONST_CaptainState_Freed as Float) ; #DEBUG_LINE_NO:347
    Else ; #DEBUG_LINE_NO:
      Actor captain = captainAlias.GetActorRef() ; #DEBUG_LINE_NO:350
      captain.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:351
      captain.EvaluatePackage(False) ; #DEBUG_LINE_NO:352
      captain.MoveToPackageLocation() ; #DEBUG_LINE_NO:353
      captain.EnableNoWait(False) ; #DEBUG_LINE_NO:354
    EndIf ; #DEBUG_LINE_NO:
    If !shouldSkipClearingAlias ; #DEBUG_LINE_NO:356
      captainAlias.Clear() ; #DEBUG_LINE_NO:357
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainStartMarker)
  Actor captainRef = captainAlias.GetActorRef() ; #DEBUG_LINE_NO:365
  ObjectReference captainStartMarkerRef = captainStartMarker.GetRef() ; #DEBUG_LINE_NO:366
  If captainRef != None ; #DEBUG_LINE_NO:367
    captainRef.Enable(False) ; #DEBUG_LINE_NO:368
    captainRef.MoveTo(captainStartMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:369
    captainRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:370
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableCaptainAlly(ReferenceAlias allyAlias)
  Self.EnableCaptainAllyRef(allyAlias.GetActorRef()) ; #DEBUG_LINE_NO:376
EndFunction

Function EnableCaptainAllyRef(Actor allyRef)
  If allyRef != None ; #DEBUG_LINE_NO:380
    allyRef.Reset(None) ; #DEBUG_LINE_NO:381
    allyRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:382
    allyRef.Enable(False) ; #DEBUG_LINE_NO:383
    allyRef.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:384
    allyRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:385
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(sq_parentscript akSource, Var[] akArgs)
  ObjectReference nativeTerminal = akArgs[0] as ObjectReference ; #DEBUG_LINE_NO:396
  Actor nativeTerminalActor = akArgs[1] as Actor ; #DEBUG_LINE_NO:397
  Bool isUnconscuous = akArgs[2] as Bool ; #DEBUG_LINE_NO:398
  If nativeTerminal != None && nativeTerminalActor != None && isUnconscuous && nativeTerminal.GetParentCell() == LC082Vigilance01 ; #DEBUG_LINE_NO:399
    Self.RemoveNativeTerminalEnemy(nativeTerminalActor) ; #DEBUG_LINE_NO:400
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(sq_parentscript akSource, Var[] akArgs)
  ObjectReference nativeTerminal = akArgs[0] as ObjectReference ; #DEBUG_LINE_NO:407
  Actor nativeTerminalActor = akArgs[1] as Actor ; #DEBUG_LINE_NO:408
  If nativeTerminal != None && nativeTerminalActor != None && nativeTerminal.GetParentCell() == LC082Vigilance01 ; #DEBUG_LINE_NO:409
    Self.RemoveNativeTerminalEnemy(nativeTerminalActor) ; #DEBUG_LINE_NO:410
    nativeTerminalActor.RemoveFromFaction(UCSysDefFaction) ; #DEBUG_LINE_NO:411
    nativeTerminalActor.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:412
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RemoveNativeTerminalEnemy(Actor enemy)
  RefCollectionAlias enemyCol = None ; #DEBUG_LINE_NO:417
  If Brig_Enemies.Find(enemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:418
    enemyCol = Brig_Enemies ; #DEBUG_LINE_NO:419
  ElseIf Rokov_RoomEnemies.Find(enemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:420
    enemyCol = Rokov_RoomEnemies ; #DEBUG_LINE_NO:421
  ElseIf Naeva_EngineRoom3Enemies.Find(enemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:422
    enemyCol = Naeva_EngineRoom3Enemies ; #DEBUG_LINE_NO:423
  ElseIf Weapons_EnemiesAll.Find(enemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:424
    enemyCol = Weapons_EnemiesAll ; #DEBUG_LINE_NO:425
  EndIf ; #DEBUG_LINE_NO:
  If enemyCol != None ; #DEBUG_LINE_NO:427
    (enemyCol as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(enemy as ObjectReference) ; #DEBUG_LINE_NO:429
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupBrigPrisoners()
  LC082.DisablePrisoner(Brig_LarryDumbrosky.GetActorRef()) ; #DEBUG_LINE_NO:442
  LC082.DisablePrisoner(Brig_AyumiKomiko.GetActorRef()) ; #DEBUG_LINE_NO:443
  LC082.DisablePrisoner(Brig_AustinRake.GetActorRef()) ; #DEBUG_LINE_NO:444
  Int I = 0 ; #DEBUG_LINE_NO:446
  While I < CONST_Brig_GenericPrisonersToSpawn ; #DEBUG_LINE_NO:447
    Brig_GenericPrisoners.AddRef(LC082.AddPrisoner(None, -1) as ObjectReference) ; #DEBUG_LINE_NO:448
    I += 1 ; #DEBUG_LINE_NO:449
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ReleaseAllPrisoners()
  Int I = 1 ; #DEBUG_LINE_NO:455
  Int brigDataLength = LC082.GetBrigDataLength() ; #DEBUG_LINE_NO:456
  While I < brigDataLength ; #DEBUG_LINE_NO:457
    Self.ReleasePrisoner(I) ; #DEBUG_LINE_NO:458
    I += 1 ; #DEBUG_LINE_NO:459
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ReleaseAllPrisonersAndWait()
  Int I = 1 ; #DEBUG_LINE_NO:464
  Int brigDataLength = LC082.GetBrigDataLength() ; #DEBUG_LINE_NO:465
  While I < brigDataLength ; #DEBUG_LINE_NO:466
    Self.ReleasePrisonerAndWait(I) ; #DEBUG_LINE_NO:467
    I += 1 ; #DEBUG_LINE_NO:468
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ReleasePrisoner(Int cellID)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:474
  akArgs[0] = cellID as Var ; #DEBUG_LINE_NO:475
  Self.CallFunctionNoWait("ReleasePrisonerAndWait", akArgs) ; #DEBUG_LINE_NO:476
EndFunction

Function ReleasePrisonerAndWait(Int cellID)
  Actor releasedPrisoner = LC082.ReleasePrisoner(cellID) ; #DEBUG_LINE_NO:480
  If releasedPrisoner != None ; #DEBUG_LINE_NO:481
    Brig_ReleasedPrisoners.AddRef(releasedPrisoner as ObjectReference) ; #DEBUG_LINE_NO:482
    Self.SetStage(CONST_Brig_ReleasedPrisonerStageToSet) ; #DEBUG_LINE_NO:483
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  Actor prisoner = akActionRef as Actor ; #DEBUG_LINE_NO:489
  Guard BrigPrisonerFindWeaponGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:490
    If prisoner.GetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue) == 0.0 ; #DEBUG_LINE_NO:491
      prisoner.SetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue, 1.0) ; #DEBUG_LINE_NO:492
      prisoner.AddItem(LLI_Role_UC as Form, 1, False) ; #DEBUG_LINE_NO:493
      prisoner.EvaluatePackage(False) ; #DEBUG_LINE_NO:494
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function CleanupAllPrisoners()
  Self.CallFunctionNoWait("CleanupAllPrisonersAndWait", None) ; #DEBUG_LINE_NO:500
EndFunction

Function CleanupAllPrisonersAndWait()
  Self.ReleaseAllPrisonersAndWait() ; #DEBUG_LINE_NO:504
  Int count = Brig_ReleasedPrisoners.GetCount() ; #DEBUG_LINE_NO:505
  Int I = 0 ; #DEBUG_LINE_NO:506
  While I < count ; #DEBUG_LINE_NO:507
    Actor current = Brig_ReleasedPrisoners.GetAt(I) as Actor ; #DEBUG_LINE_NO:508
    ActorBase currentBase = current.GetLeveledActorBase() ; #DEBUG_LINE_NO:509
    Int currentOutfitDataIndex = PrisonerOutfitData.findstruct("PrisonerActorBase", currentBase, 0) ; #DEBUG_LINE_NO:510
    If currentOutfitDataIndex >= 0 ; #DEBUG_LINE_NO:511
      current.Disable(False) ; #DEBUG_LINE_NO:512
      current.RemoveItem(Clothes_UC_Prisoner as Form, 1, False, None) ; #DEBUG_LINE_NO:513
      current.SetOutfit(PrisonerOutfitData[currentOutfitDataIndex].PrisonerPostReleaseOutfit, False) ; #DEBUG_LINE_NO:514
      current.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:515
      current.EvaluatePackage(False) ; #DEBUG_LINE_NO:516
      current.MoveToPackageLocation() ; #DEBUG_LINE_NO:517
      current.EnableNoWait(False) ; #DEBUG_LINE_NO:518
    Else ; #DEBUG_LINE_NO:
      current.DisableNoWait(False) ; #DEBUG_LINE_NO:520
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:522
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_SetupRoboticsEnemiesArray()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:533
    Self.Robotics_InitRoboticsEnemiesArray() ; #DEBUG_LINE_NO:534
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_InitRoboticsEnemiesArray()
  If Robotics_RoboticsEnemies == None ; #DEBUG_LINE_NO:539
    If Self.GetStageDone(CONST_CaptainActiveStage_Mathis) ; #DEBUG_LINE_NO:540
      Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom01).GetLinkedRefChain(LC088_LinkRoboticsRobot, 100) as robotpodscript[] ; #DEBUG_LINE_NO:541
      Robotics_RoboticsEnemies[0].DamageValue(Health, Robotics_RoboticsEnemies[0].GetValue(Health) * 0.800000012) ; #DEBUG_LINE_NO:542
      Robotics_RoboticsEnemies[1].DamageValue(Health, Robotics_RoboticsEnemies[1].GetValue(Health) * 0.600000024) ; #DEBUG_LINE_NO:543
      Robotics_RoboticsEnemies[2].DamageValue(Health, Robotics_RoboticsEnemies[2].GetValue(Health) * 0.200000003) ; #DEBUG_LINE_NO:544
    Else ; #DEBUG_LINE_NO:
      Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom02).GetLinkedRefChain(LC088_LinkRoboticsRobot, 100) as robotpodscript[] ; #DEBUG_LINE_NO:546
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_StartRoboticsBayBattle()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:553
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:554
      Self.Robotics_InitRoboticsEnemiesArray() ; #DEBUG_LINE_NO:555
      Self.StartTimer(0.0, CONST_UpdateRoboticsBattleTimerID) ; #DEBUG_LINE_NO:556
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_UpdateRoboticsBattle()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:563
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:564
      Int activeRobots = 0 ; #DEBUG_LINE_NO:567
      Int I = 0 ; #DEBUG_LINE_NO:568
      While I < Robotics_RoboticsEnemies.Length && activeRobots < CONST_Robotics_MaxSimultaneousActiveRobots ; #DEBUG_LINE_NO:569
        If Robotics_RoboticsEnemies[I].IsDead() ; #DEBUG_LINE_NO:570
          Robotics_RoboticsEnemies.remove(I, 1) ; #DEBUG_LINE_NO:571
        ElseIf Robotics_RoboticsEnemies[I].IsUnconscious() ; #DEBUG_LINE_NO:572
          Robotics_RoboticsEnemies[I].WakeRobotFromPod() ; #DEBUG_LINE_NO:574
          Robotics_RoboticsEnemies[I].SetUnconscious(False) ; #DEBUG_LINE_NO:575
          activeRobots += 1 ; #DEBUG_LINE_NO:576
          I += 1 ; #DEBUG_LINE_NO:577
        Else ; #DEBUG_LINE_NO:
          activeRobots += 1 ; #DEBUG_LINE_NO:579
          I += 1 ; #DEBUG_LINE_NO:580
        EndIf ; #DEBUG_LINE_NO:
      EndWhile ; #DEBUG_LINE_NO:
      If activeRobots == 0 ; #DEBUG_LINE_NO:583
        Self.SetStage(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:585
      Else ; #DEBUG_LINE_NO:
        Self.StartTimer(CONST_UpdateRoboticsBattleTimerDelay as Float, CONST_UpdateRoboticsBattleTimerID) ; #DEBUG_LINE_NO:588
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_DeactivateRobots()
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:596
    If !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:597
      Self.CancelTimer(CONST_UpdateRoboticsBattleTimerID) ; #DEBUG_LINE_NO:598
      Self.Robotics_InitRoboticsEnemiesArray() ; #DEBUG_LINE_NO:599
      Int I = 0 ; #DEBUG_LINE_NO:600
      While I < Robotics_RoboticsEnemies.Length ; #DEBUG_LINE_NO:601
        If Robotics_RoboticsEnemies[I].GetLinkedRef(DMP_LinkRobotPod) != None ; #DEBUG_LINE_NO:602
          Robotics_RoboticsEnemies[I].SendRobotToPod() ; #DEBUG_LINE_NO:603
        Else ; #DEBUG_LINE_NO:
          Robotics_RoboticsEnemies[I].SetUnconscious(True) ; #DEBUG_LINE_NO:605
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:607
      EndWhile ; #DEBUG_LINE_NO:
      Self.SetStage(CONST_Robotics_RoboticsBattleDeactivatedStage) ; #DEBUG_LINE_NO:609
      Self.SetStage(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:610
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_SealRoboticsBayDoors()
  Int I = 0 ; #DEBUG_LINE_NO:617
  Int count = Robotics_RoboticsRoomDoors.GetCount() ; #DEBUG_LINE_NO:618
  While I < count && !Self.GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage) ; #DEBUG_LINE_NO:619
    Robotics_RoboticsRoomDoors.GetAt(I).SetOpen(False) ; #DEBUG_LINE_NO:620
    I += 1 ; #DEBUG_LINE_NO:621
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Robotics_UnsealRoboticsBayDoors()
  Int I = 0 ; #DEBUG_LINE_NO:627
  Int count = Robotics_RoboticsRoomDoors.GetCount() ; #DEBUG_LINE_NO:628
  While I < count ; #DEBUG_LINE_NO:629
    Robotics_RoboticsRoomDoors.GetAt(I).SetOpen(True) ; #DEBUG_LINE_NO:630
    I += 1 ; #DEBUG_LINE_NO:631
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EVPNaevaAndAllies()
  Naeva.TryToEvaluatePackage() ; #DEBUG_LINE_NO:641
  Naeva_Allies.EvaluateAll() ; #DEBUG_LINE_NO:642
EndFunction

Function Weapons_ConvertRobotsAndTurrets()
  Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[] ; #DEBUG_LINE_NO:652
  Int I = 0 ; #DEBUG_LINE_NO:653
  While I < robotsAndTurrets.Length ; #DEBUG_LINE_NO:654
    robotsAndTurrets[I].RemoveFromAllFactions() ; #DEBUG_LINE_NO:655
    robotsAndTurrets[I].AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:656
    robotsAndTurrets[I].AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:657
    robotsAndTurrets[I].SetValue(Aggression, CONST_Aggression_Aggressive as Float) ; #DEBUG_LINE_NO:658
    robotsAndTurrets[I].SetPlayerTeammate(True, False, False) ; #DEBUG_LINE_NO:659
    robotpodscript robotActor = robotsAndTurrets[I] as robotpodscript ; #DEBUG_LINE_NO:660
    If robotActor != None ; #DEBUG_LINE_NO:661
      robotActor.WakeRobotFromPod() ; #DEBUG_LINE_NO:662
    Else ; #DEBUG_LINE_NO:
      robotsAndTurrets[I].SetUnconscious(False) ; #DEBUG_LINE_NO:664
    EndIf ; #DEBUG_LINE_NO:
    (Weapons_EnemiesAll as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(robotsAndTurrets[I] as ObjectReference) ; #DEBUG_LINE_NO:666
    I += 1 ; #DEBUG_LINE_NO:667
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Weapons_SealWeaponBays()
  ObjectReference wbDoor = Weapons_WeaponsBayDoor.GetRef() ; #DEBUG_LINE_NO:674
  wbDoor.SetOpen(False) ; #DEBUG_LINE_NO:675
  wbDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:676
  wbDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal) ; #DEBUG_LINE_NO:677
  Actor[] enemiesInWeaponBays = Weapons_EnemiesInWeaponBays.GetArray() as Actor[] ; #DEBUG_LINE_NO:679
  Int I = 0 ; #DEBUG_LINE_NO:680
  While I < enemiesInWeaponBays.Length ; #DEBUG_LINE_NO:681
    (Weapons_EnemiesAll as lc088_vigilanceenemyrefcolscript).RemoveEnemyRef(enemiesInWeaponBays[I] as ObjectReference) ; #DEBUG_LINE_NO:682
    I += 1 ; #DEBUG_LINE_NO:683
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Weapons_StartAmbush()
  ObjectReference[] ambushDoors = Weapons_AmbushDoors.GetArray() ; #DEBUG_LINE_NO:693
  Int I = 0 ; #DEBUG_LINE_NO:694
  While I < ambushDoors.Length ; #DEBUG_LINE_NO:695
    If !ambushDoors[I].IsLocked() ; #DEBUG_LINE_NO:696
      ambushDoors[I].SetOpen(True) ; #DEBUG_LINE_NO:697
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:699
  EndWhile ; #DEBUG_LINE_NO:
  Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[] ; #DEBUG_LINE_NO:701
  I = 0 ; #DEBUG_LINE_NO:702
  While I < robotsAndTurrets.Length ; #DEBUG_LINE_NO:703
    Actor current = robotsAndTurrets[I] ; #DEBUG_LINE_NO:704
    robotpodscript currentAsRobot = current as robotpodscript ; #DEBUG_LINE_NO:705
    If currentAsRobot != None ; #DEBUG_LINE_NO:706
      currentAsRobot.WakeRobotFromPod() ; #DEBUG_LINE_NO:707
    Else ; #DEBUG_LINE_NO:
      current.SetUnconscious(False) ; #DEBUG_LINE_NO:709
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:711
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:713
  Actor[] allEnemies = Weapons_EnemiesAll.GetArray() as Actor[] ; #DEBUG_LINE_NO:714
  I = 0 ; #DEBUG_LINE_NO:715
  While I < allEnemies.Length ; #DEBUG_LINE_NO:716
    allEnemies[I].StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:717
    I += 1 ; #DEBUG_LINE_NO:718
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Mess_StartAmbush()
  Int I = 0 ; #DEBUG_LINE_NO:729
  Int count = Mess_AmbushDoors.GetCount() ; #DEBUG_LINE_NO:730
  While I < count ; #DEBUG_LINE_NO:731
    Mess_AmbushDoors.GetAt(I).SetOpen(True) ; #DEBUG_LINE_NO:732
    I += 1 ; #DEBUG_LINE_NO:733
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:735
  count = Mess_AmbushEnemies.GetCount() ; #DEBUG_LINE_NO:736
  While I < count ; #DEBUG_LINE_NO:737
    Actor current = Mess_AmbushEnemies.GetAt(I) as Actor ; #DEBUG_LINE_NO:738
    current.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:739
    I += 1 ; #DEBUG_LINE_NO:740
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetupEstelle()
  If estelleLevel == 0 ; #DEBUG_LINE_NO:751
    Estelle_Level1_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:752
    Estelle_Level1_QuartersEnemies.EnableAll(False) ; #DEBUG_LINE_NO:753
    Estelle_Level2_QuartersEnemies.DisableAll(False) ; #DEBUG_LINE_NO:754
  ElseIf estelleLevel == 1 ; #DEBUG_LINE_NO:756
    Estelle.GetActorRef().SetLinkedRef(Estelle_Level1_StartMarker.GetRef(), LC088_LinkCaptainStartMarker, True) ; #DEBUG_LINE_NO:757
    Estelle_Level1_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:758
    Estelle_Level1_QuartersEnemies.EnableAll(False) ; #DEBUG_LINE_NO:759
    Estelle_Level2_QuartersEnemies.DisableAll(False) ; #DEBUG_LINE_NO:760
  ElseIf estelleLevel == 2 ; #DEBUG_LINE_NO:762
    Estelle.GetActorRef().SetLinkedRef(Estelle_Level2_StartMarker.GetRef(), LC088_LinkCaptainStartMarker, True) ; #DEBUG_LINE_NO:763
    Estelle_Level2_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:764
    Estelle_Level1_QuartersEnemies.DisableAll(False) ; #DEBUG_LINE_NO:765
    Estelle_Level2_QuartersEnemies.EnableAll(False) ; #DEBUG_LINE_NO:766
  Else ; #DEBUG_LINE_NO:
    Estelle_Level3_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:769
    Estelle_Level1_QuartersEnemies.DisableAll(False) ; #DEBUG_LINE_NO:770
    Estelle_Level2_QuartersEnemies.DisableAll(False) ; #DEBUG_LINE_NO:771
    Self.EnableEstelle() ; #DEBUG_LINE_NO:773
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableEstelle()
  If !enabledEstelle && estelleLevel > 0 && Self.GetStageDone(CONST_CaptainActiveStage_Estelle) ; #DEBUG_LINE_NO:779
    enabledEstelle = True ; #DEBUG_LINE_NO:780
    If estelleLevel == 1 ; #DEBUG_LINE_NO:782
      Self.EnableCaptain(Estelle, Estelle_Level1_StartMarker) ; #DEBUG_LINE_NO:783
      LC088_810_Estelle_Start.Start() ; #DEBUG_LINE_NO:784
    ElseIf estelleLevel == 2 ; #DEBUG_LINE_NO:785
      Self.EnableCaptain(Estelle, Estelle_Level2_StartMarker) ; #DEBUG_LINE_NO:786
      LC088_810_Estelle_Start.Start() ; #DEBUG_LINE_NO:787
    Else ; #DEBUG_LINE_NO:
      Actor estelleRef = Estelle.GetActorRef() ; #DEBUG_LINE_NO:789
      ObjectReference estelleEndMarkerRef = Estelle_EndMarker.GetRef() ; #DEBUG_LINE_NO:790
      estelleRef.Enable(False) ; #DEBUG_LINE_NO:791
      estelleRef.MoveTo(estelleEndMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:792
      LC088_810_Estelle_Start_2.Start() ; #DEBUG_LINE_NO:793
      Self.SetStage(CONST_Quarters_ClearedStage) ; #DEBUG_LINE_NO:795
    EndIf ; #DEBUG_LINE_NO:
    If estelleLevel > 1 ; #DEBUG_LINE_NO:798
      Actor[] allies1 = Estelle_Level2_QuartersAllies.GetArray() as Actor[] ; #DEBUG_LINE_NO:799
      Int I = 0 ; #DEBUG_LINE_NO:800
      While I < allies1.Length ; #DEBUG_LINE_NO:801
        Self.EnableCaptainAllyRef(allies1[I]) ; #DEBUG_LINE_NO:802
        I += 1 ; #DEBUG_LINE_NO:803
      EndWhile ; #DEBUG_LINE_NO:
      If estelleLevel > 2 ; #DEBUG_LINE_NO:805
        Actor[] allies2 = Estelle_Level3_QuartersAllies.GetArray() as Actor[] ; #DEBUG_LINE_NO:806
        I = 0 ; #DEBUG_LINE_NO:807
        While I < allies2.Length ; #DEBUG_LINE_NO:808
          Self.EnableCaptainAllyRef(allies2[I]) ; #DEBUG_LINE_NO:809
          I += 1 ; #DEBUG_LINE_NO:810
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Flee_StartFleeing()
  Int I = 0 ; #DEBUG_LINE_NO:830
  Int count = Flee_FleeAreaDoors.GetCount() ; #DEBUG_LINE_NO:831
  While I < count ; #DEBUG_LINE_NO:832
    Flee_FleeAreaDoors.GetAt(I).SetOpen(True) ; #DEBUG_LINE_NO:833
    I += 1 ; #DEBUG_LINE_NO:834
  EndWhile ; #DEBUG_LINE_NO:
  Self.StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID) ; #DEBUG_LINE_NO:837
  Flee_EnemiesFleeing.EvaluateAll() ; #DEBUG_LINE_NO:839
  I = 0 ; #DEBUG_LINE_NO:841
  count = Flee_NonBossBattleEnemies.GetCount() ; #DEBUG_LINE_NO:842
  While I < count ; #DEBUG_LINE_NO:843
    Actor current = Flee_NonBossBattleEnemies.GetAt(I) as Actor ; #DEBUG_LINE_NO:844
    If current == None || current.IsDead() || Flee_EnemiesFleeing.Find(current as ObjectReference) >= 0 ; #DEBUG_LINE_NO:845
       ; #DEBUG_LINE_NO:
    ElseIf current.HasKeyword(ActorTypeRobot) && !player.HasDetectionLOS(current as ObjectReference) ; #DEBUG_LINE_NO:847
      current.Kill(None) ; #DEBUG_LINE_NO:849
    Else ; #DEBUG_LINE_NO:
      Bool removed = Self.Flee_TryToRemoveFleeingActor(current) ; #DEBUG_LINE_NO:852
      If !removed ; #DEBUG_LINE_NO:853
        Flee_EnemiesFleeing.AddRef(current as ObjectReference) ; #DEBUG_LINE_NO:855
        Flee_EnemiesFleeingToGenericDockingPort.AddRef(current as ObjectReference) ; #DEBUG_LINE_NO:856
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:859
  EndWhile ; #DEBUG_LINE_NO:
  Flee_HasFinishedFleeEventSetup = True ; #DEBUG_LINE_NO:861
EndFunction

Function Flee_UpdateFleeEvent()
  Int I = 0 ; #DEBUG_LINE_NO:866
  While I < Flee_EnemiesFleeing.GetCount() ; #DEBUG_LINE_NO:867
    Actor currentEnemy = Flee_EnemiesFleeing.GetAt(I) as Actor ; #DEBUG_LINE_NO:868
    ObjectReference currentEnemyEscapePoint = currentEnemy.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:869
    If currentEnemy == None ; #DEBUG_LINE_NO:870
       ; #DEBUG_LINE_NO:
    ElseIf currentEnemy.IsDead() ; #DEBUG_LINE_NO:872
      Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:874
      If Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:875
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:876
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy as ObjectReference) >= 0 ; #DEBUG_LINE_NO:878
      If Self.Flee_TryToRemoveFleeingActor(currentEnemy) ; #DEBUG_LINE_NO:879
        Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:881
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:882
      ElseIf currentEnemy.GetDistance(dockingPort05Ref) < CONST_Flee_DockingPortRemovalRadiusDistance as Float ; #DEBUG_LINE_NO:883
        currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:885
        currentEnemy.Kill(None) ; #DEBUG_LINE_NO:886
        Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:887
        Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:888
      Else ; #DEBUG_LINE_NO:
        If !Flee_HasFinishedFirstFleeTimer ; #DEBUG_LINE_NO:891
          currentEnemy.EvaluatePackage(False) ; #DEBUG_LINE_NO:892
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:894
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currentEnemyEscapePoint == None || currentEnemyEscapePoint.IsDisabled() ; #DEBUG_LINE_NO:896
      Flee_EnemiesFleeingToGenericDockingPort.AddRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:898
      currentEnemy.EvaluatePackage(False) ; #DEBUG_LINE_NO:899
    ElseIf currentEnemy.GetDistance(currentEnemyEscapePoint) < CONST_Flee_DockingPortRemovalRadiusDistance as Float ; #DEBUG_LINE_NO:900
      Flee_EnemiesFleeing.RemoveRef(currentEnemy as ObjectReference) ; #DEBUG_LINE_NO:902
      currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:903
      currentEnemy.Kill(None) ; #DEBUG_LINE_NO:904
    Else ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:908
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Flee_HasFinishedFirstFleeTimer = True ; #DEBUG_LINE_NO:911
  If Flee_HasFinishedFleeEventSetup && Flee_EnemiesFleeing.GetCount() == 0 ; #DEBUG_LINE_NO:912
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID) ; #DEBUG_LINE_NO:916
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Flee_TryToRemoveFleeingActor(Actor fleeingActor)
  If (fleeingActor.GetDistance(player as ObjectReference) >= CONST_Flee_FleeRemovalDistance as Float) && !player.HasDetectionLOS(fleeingActor as ObjectReference) ; #DEBUG_LINE_NO:922
    fleeingActor.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:924
    fleeingActor.Kill(None) ; #DEBUG_LINE_NO:925
    Return True ; #DEBUG_LINE_NO:926
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:928
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Ops_SetupOps()
  kibweRef.SetGhost(True) ; #DEBUG_LINE_NO:939
  kibweRef.SetEssential(False) ; #DEBUG_LINE_NO:940
  kibweRef.MoveTo(Ops_KibweStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:941
  kibweRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:942
  toftRef.SetGhost(True) ; #DEBUG_LINE_NO:944
  toftRef.SetEssential(False) ; #DEBUG_LINE_NO:945
  toftRef.MoveTo(Ops_ToftStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:946
  toftRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:947
EndFunction

Function Ops_StartBattleNoWait()
  Self.CallFunctionNoWait("Ops_StartBattle", None) ; #DEBUG_LINE_NO:952
EndFunction

Function Ops_StartBattle()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:957
  MUSGenesisCombatBoss_Vigilance.Add() ; #DEBUG_LINE_NO:958
  Self.SetNewHoldPositionTarget(kibweRef, kibweRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword)) ; #DEBUG_LINE_NO:960
  kibweRef.SetGhost(False) ; #DEBUG_LINE_NO:961
  kibweRef.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:962
  Self.SetNewHoldPositionTarget(toftRef, toftRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword)) ; #DEBUG_LINE_NO:963
  toftRef.SetGhost(False) ; #DEBUG_LINE_NO:964
  toftRef.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:965
  Self.StartTimer(CONST_Ops_BattleMonitorTimerDelay as Float, CONST_Ops_BattleMonitorTimerID) ; #DEBUG_LINE_NO:967
  Self.StartTimer(CONST_Ops_RobotActivationTimerDelay as Float, CONST_Ops_RobotActivationTimerID) ; #DEBUG_LINE_NO:969
  Self.StartTimer(CONST_Ops_TurretActivationTimerDelay as Float, CONST_Ops_TurretActivationTimerID) ; #DEBUG_LINE_NO:970
EndFunction

Function Ops_ActivateAllTurrets()
  Self.ToggleOpsActorCollection(Ops_Turrets, True) ; #DEBUG_LINE_NO:975
EndFunction

Function Ops_ActivateInitialRobots()
  Self.ToggleOpsActorCollection(Ops_Robots_Initial, True) ; #DEBUG_LINE_NO:979
EndFunction

Function Ops_ActivateAllRobots()
  Self.ToggleOpsActorCollection(Ops_Robots, True) ; #DEBUG_LINE_NO:984
EndFunction

Function Ops_UpdateBattleMonitor()
  Bool eitherSysDefLeaderAlive = False ; #DEBUG_LINE_NO:988
  If !kibweRef.IsDead() ; #DEBUG_LINE_NO:989
    eitherSysDefLeaderAlive = True ; #DEBUG_LINE_NO:990
    If Self.ShouldUpdateMovement(kibweRef) ; #DEBUG_LINE_NO:991
      Self.SetNewHoldPositionTargetRandom(kibweRef) ; #DEBUG_LINE_NO:992
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !toftRef.IsDead() ; #DEBUG_LINE_NO:995
    eitherSysDefLeaderAlive = True ; #DEBUG_LINE_NO:996
    If Self.ShouldUpdateMovement(toftRef) ; #DEBUG_LINE_NO:997
      Self.SetNewHoldPositionTargetRandom(toftRef) ; #DEBUG_LINE_NO:998
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If eitherSysDefLeaderAlive ; #DEBUG_LINE_NO:1001
    Self.StartTimer(CONST_Ops_BattleMonitorTimerDelay as Float, CONST_Ops_BattleMonitorTimerID) ; #DEBUG_LINE_NO:1002
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function ShouldUpdateMovement(Actor actorToUpdate)
  Bool healthUpdate = Self.ShouldUpdateMovementDueToHealthLoss(actorToUpdate) ; #DEBUG_LINE_NO:1009
  If healthUpdate ; #DEBUG_LINE_NO:1010
    Return True ; #DEBUG_LINE_NO:1012
  Else ; #DEBUG_LINE_NO:
    Bool timeUpdate = Self.ShouldUpdateMovementDueToTime(actorToUpdate) ; #DEBUG_LINE_NO:1014
    If timeUpdate ; #DEBUG_LINE_NO:1015
      Return True ; #DEBUG_LINE_NO:1017
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:1020
EndFunction

Bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate)
  Float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health) ; #DEBUG_LINE_NO:1025
  Float lastHealthPercentage = actorToUpdate.GetValue(LC088_Ops_MovementUpdateHealthPercentStampValue) ; #DEBUG_LINE_NO:1026
  If currentHealthPercentage < lastHealthPercentage - CONST_Ops_MovementUpdateHealthLossPercent ; #DEBUG_LINE_NO:1027
    Return True ; #DEBUG_LINE_NO:1028
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:1030
EndFunction

Bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate)
  Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:1035
  Float lastMovementUpdateTime = actorToUpdate.GetValue(LC088_Ops_MovementUpdateTimestampValue) ; #DEBUG_LINE_NO:1036
  Float timeForNextMovementUpdate = lastMovementUpdateTime + CONST_Ops_MovementUpdateTime as Float ; #DEBUG_LINE_NO:1037
  Return lastMovementUpdateTime < currentTime || currentTime >= timeForNextMovementUpdate ; #DEBUG_LINE_NO:1038
EndFunction

ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate)
  ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(LC088_Ops_BossHoldPositionLink) ; #DEBUG_LINE_NO:1043
  ObjectReference[] potentialHoldPositionTargets = Ops_BossHoldPositionTargets.GetArray() ; #DEBUG_LINE_NO:1044
  Int currentHoldPositionTargetIndex = potentialHoldPositionTargets.find(currentHoldPositionTarget, 0) ; #DEBUG_LINE_NO:1045
  If currentHoldPositionTargetIndex >= 0 ; #DEBUG_LINE_NO:1046
    potentialHoldPositionTargets.remove(currentHoldPositionTargetIndex, 1) ; #DEBUG_LINE_NO:1047
  EndIf ; #DEBUG_LINE_NO:
  Int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length - 1) ; #DEBUG_LINE_NO:1049
  ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex] ; #DEBUG_LINE_NO:1050
  Self.SetNewHoldPositionTarget(actorToUpdate, newHoldPositionTarget) ; #DEBUG_LINE_NO:1051
EndFunction

ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, ObjectReference newHoldPositionTarget)
  actorToUpdate.SetLinkedRef(newHoldPositionTarget, LC088_Ops_BossHoldPositionLink, True) ; #DEBUG_LINE_NO:1055
  actorToUpdate.SetValue(LC088_Ops_BossHoldPositionValue, 1.0 - actorToUpdate.GetValue(LC088_Ops_BossHoldPositionValue)) ; #DEBUG_LINE_NO:1056
  actorToUpdate.SetValue(LC088_Ops_MovementUpdateTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:1057
  actorToUpdate.SetValue(LC088_Ops_MovementUpdateHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health)) ; #DEBUG_LINE_NO:1058
  actorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:1059
  Return newHoldPositionTarget ; #DEBUG_LINE_NO:1060
EndFunction

Function Ops_EndBattleNoWait()
  Self.CallFunctionNoWait("Ops_EndBattle", None) ; #DEBUG_LINE_NO:1066
EndFunction

Function Ops_EndBattle()
  Self.CancelTimer(CONST_Ops_BattleMonitorTimerID) ; #DEBUG_LINE_NO:1071
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:1073
  MUSGenesisCombatBoss_Vigilance.Remove() ; #DEBUG_LINE_NO:1074
  CF08BattleAlarm.TryToDisable() ; #DEBUG_LINE_NO:1076
  Self.ShutdownAllCaptainEvents(True) ; #DEBUG_LINE_NO:1078
  Self.ToggleOpsActorCollection(Ops_RobotsAndTurrets, False) ; #DEBUG_LINE_NO:1080
  Actor[] allNonbossEnemies = Flee_NonBossBattleEnemies.GetArray() as Actor[] ; #DEBUG_LINE_NO:1082
  Int I = 0 ; #DEBUG_LINE_NO:1083
  While I < allNonbossEnemies.Length ; #DEBUG_LINE_NO:1084
    Actor currentEnemy = allNonbossEnemies[I] ; #DEBUG_LINE_NO:1085
    If currentEnemy == None && !currentEnemy.IsDead() && !currentEnemy.IsDisabled() ; #DEBUG_LINE_NO:1086
      If currentEnemy.HasKeyword(ActorTypeRobot) ; #DEBUG_LINE_NO:1087
        currentEnemy.SetUnconscious(True) ; #DEBUG_LINE_NO:1088
      Else ; #DEBUG_LINE_NO:
        currentEnemy.MoveTo(holdingCellMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1090
        currentEnemy.Kill(None) ; #DEBUG_LINE_NO:1091
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1094
  EndWhile ; #DEBUG_LINE_NO:
  Self.CleanupAllPrisoners() ; #DEBUG_LINE_NO:1098
  Self.Ops_UnsealSecurityDoors() ; #DEBUG_LINE_NO:1100
  Self.SetStageNoWait(CONST_Complete_StartNaevaScene_Stage) ; #DEBUG_LINE_NO:1102
  Self.Ops_SetElevatorLockedDown(False) ; #DEBUG_LINE_NO:1104
  Self.Ops_SetFastTravelEnabled(True) ; #DEBUG_LINE_NO:1106
  LC088_Space.SetStage(CONST_Complete_Space_VigilanceCompleted_Stage) ; #DEBUG_LINE_NO:1108
  CF_Post.SetStage(CONST_Complete_Postquest_StartPostquest_Stage) ; #DEBUG_LINE_NO:1110
EndFunction

Function ToggleOpsActorCollection(RefCollectionAlias actorCollection, Bool shouldActivate)
  Guard OpsActorCollectionsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1115
    Actor[] myActors = actorCollection.GetArray() as Actor[] ; #DEBUG_LINE_NO:1116
    Int I = 0 ; #DEBUG_LINE_NO:1117
    While I < myActors.Length ; #DEBUG_LINE_NO:1118
      If myActors[I] != None ; #DEBUG_LINE_NO:1119
        If shouldActivate && !Self.GetStageDone(CONST_Complete_Stage) ; #DEBUG_LINE_NO:1120
          robotpodscript robotActor = myActors[I] as robotpodscript ; #DEBUG_LINE_NO:1121
          If robotActor != None ; #DEBUG_LINE_NO:1122
            robotActor.WakeRobotFromPod() ; #DEBUG_LINE_NO:1123
          Else ; #DEBUG_LINE_NO:
            myActors[I].SetUnconscious(False) ; #DEBUG_LINE_NO:1125
            myActors[I].StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:1126
          EndIf ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          myActors[I].SetUnconscious(True) ; #DEBUG_LINE_NO:1129
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:1132
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Ops_SetFastTravelEnabled(Bool IsEnabled)
  LC082Vigilance01.EnableFastTravel(IsEnabled) ; #DEBUG_LINE_NO:1140
EndFunction

Function Ops_InitSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed) ; #DEBUG_LINE_NO:1145
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_ActivationBlocked) ; #DEBUG_LINE_NO:1146
EndFunction

Function Ops_SealSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed) ; #DEBUG_LINE_NO:1151
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Sealed) ; #DEBUG_LINE_NO:1152
EndFunction

Function Ops_UnsealSecurityDoors()
  Self.Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Open) ; #DEBUG_LINE_NO:1157
  Self.Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Open) ; #DEBUG_LINE_NO:1158
EndFunction

Function Ops_LockPlayerControls(Bool shouldLock)
  If shouldLock ; #DEBUG_LINE_NO:1163
    vigilanceInputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:1164
  Else ; #DEBUG_LINE_NO:
    vigilanceInputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:1166
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Ops_SetDoorState(RefCollectionAlias doorCollection, Int doorState)
  Int I = 0 ; #DEBUG_LINE_NO:1172
  Int count = doorCollection.GetCount() ; #DEBUG_LINE_NO:1173
  While I < count ; #DEBUG_LINE_NO:1174
    ObjectReference currentDoor = doorCollection.GetAt(I) ; #DEBUG_LINE_NO:1175
    If doorState == CONST_DoorState_Open ; #DEBUG_LINE_NO:1176
      currentDoor.Unlock(False) ; #DEBUG_LINE_NO:1177
      currentDoor.SetOpen(True) ; #DEBUG_LINE_NO:1178
      currentDoor.BlockActivation(False, False) ; #DEBUG_LINE_NO:1179
    ElseIf doorState == CONST_DoorState_Sealed ; #DEBUG_LINE_NO:1180
      currentDoor.SetOpen(False) ; #DEBUG_LINE_NO:1181
      currentDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:1182
      currentDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal) ; #DEBUG_LINE_NO:1183
      currentDoor.BlockActivation(False, False) ; #DEBUG_LINE_NO:1184
    ElseIf doorState == CONST_DoorState_ActivationBlocked ; #DEBUG_LINE_NO:1185
      currentDoor.SetOpen(False) ; #DEBUG_LINE_NO:1186
      currentDoor.Unlock(False) ; #DEBUG_LINE_NO:1187
      currentDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:1188
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1190
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Ops_SetElevatorLockedDown(Bool shouldBeLockedDown)
  Int I = 0 ; #DEBUG_LINE_NO:1196
  Int count = Ops_Elevators_FloorMarkers.GetCount() ; #DEBUG_LINE_NO:1197
  While I < count ; #DEBUG_LINE_NO:1198
    (Ops_Elevators_FloorMarkers.GetAt(I) as loadelevatorfloorscript).SetAccessible(!shouldBeLockedDown) ; #DEBUG_LINE_NO:1199
    I += 1 ; #DEBUG_LINE_NO:1200
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC082VigilanceLocation && !Self.GetStageDone(CONST_Complete_Stage) ; #DEBUG_LINE_NO:1210
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Add() ; #DEBUG_LINE_NO:1211
  ElseIf akOldLoc == LC082VigilanceLocation ; #DEBUG_LINE_NO:1212
    MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:1213
    MUSGenesisCombatBoss_Vigilance.Remove() ; #DEBUG_LINE_NO:1214
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Cleanup()
  MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove() ; #DEBUG_LINE_NO:1220
  MUSGenesisCombatBoss_Vigilance.Remove() ; #DEBUG_LINE_NO:1221
  player = None ; #DEBUG_LINE_NO:1224
  kibweRef = None ; #DEBUG_LINE_NO:1225
  toftRef = None ; #DEBUG_LINE_NO:1226
  brigTerminal = None ; #DEBUG_LINE_NO:1227
  brigFindWeaponsTriggers = None ; #DEBUG_LINE_NO:1228
  cargoBayTerminal = None ; #DEBUG_LINE_NO:1229
  engineRoomTerminal = None ; #DEBUG_LINE_NO:1230
  weaponsTerminal = None ; #DEBUG_LINE_NO:1231
  dockingPort05Ref = None ; #DEBUG_LINE_NO:1232
  holdingCellMarkerRef = None ; #DEBUG_LINE_NO:1233
  vigilanceInputLayer.Delete() ; #DEBUG_LINE_NO:1234
  Guard RoboticsEnemiesGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:1235
    Robotics_RoboticsEnemies = None ; #DEBUG_LINE_NO:1236
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_UpdateRoboticsBattleTimerID ; #DEBUG_LINE_NO:1246
    Self.Robotics_UpdateRoboticsBattle() ; #DEBUG_LINE_NO:1247
  ElseIf timerID == CONST_FleeTimerID ; #DEBUG_LINE_NO:1248
    Self.Flee_UpdateFleeEvent() ; #DEBUG_LINE_NO:1249
  ElseIf timerID == CONST_Ops_TurretActivationTimerID ; #DEBUG_LINE_NO:1250
    Self.Ops_ActivateAllTurrets() ; #DEBUG_LINE_NO:1251
  ElseIf timerID == CONST_Ops_RobotActivationTimerID ; #DEBUG_LINE_NO:1252
    Self.Ops_ActivateInitialRobots() ; #DEBUG_LINE_NO:1253
  ElseIf timerID == CONST_Ops_BattleMonitorTimerID ; #DEBUG_LINE_NO:1254
    Self.Ops_UpdateBattleMonitor() ; #DEBUG_LINE_NO:1255
  EndIf ; #DEBUG_LINE_NO:
EndEvent
