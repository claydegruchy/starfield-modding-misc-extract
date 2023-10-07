ScriptName UC01_ShipSimulationQuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct EnemyWave
  FormList BaseEnemyList
  { Required form list of initial enemies to spawn in }
  Int Difficulty = 2
  { What difficulty level the NPCs should be spawned in }
EndStruct


;-- Variables ---------------------------------------
Bool bSequenceComplete
Int iGetUpTimerID = 4 Const
Int iResetTimerID = 3 Const
Int iTimerID = 1 Const
Int iUpgradeSceneTimerID = 2 Const

;-- Properties --------------------------------------
Group Objects
  FormList Property UC01_SimEnemyShips_FormList Auto Const mandatory
  { List of enemy ships }
  uc01_shipsimulationquestscript:enemywave[] Property EnemyTierLists Auto Const mandatory
  { Array of structs of enemy tiers, as well as the difficulty they should be spawned at }
  ActorValue Property Health Auto Const mandatory
  { Health value }
  ActorValue Property SpaceshipCrew Auto Const mandatory
  { Spaceship crew value (used to get the ships to stop fighting) }
  wwiseevent Property ResetShipSoundEvent Auto Const mandatory
  { Sound to play when the player's ship is being reset }
  GlobalVariable Property UC01_ShipSim_CurrentTier Auto Const mandatory
  { Global used to track the player's progression through the sequence }
  GlobalVariable Property UC01_ShipSim_TotalEnemyCount Auto Const mandatory
  { The total number of enemies the player has to face in order to complete the sequence totally }
  GlobalVariable Property UC01_ShipSim_MinTierRequired Auto Const mandatory
  { How many enemies the player has to kill in order to pass }
  GlobalVariable Property UC01_ShipSim_PlayerDeaths Auto Const mandatory
  { Global var used to track the number of ship deaths. Only saves out after the first go around }
  inputenablelayer Property SimShipEnablePlayer Auto
  { Enable layer that manages the player's controls during the sequence }
  GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Auto mandatory
  { Global used to track how many enemies we've defeated in the current wave }
  GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountTotal Auto Const mandatory
  { Global used to track how many total enemies we'll be fighting each wave }
  GlobalVariable Property UC01_ShipSim_Debug_InifinitePerks Auto Const mandatory
  { If set to 1, we don't clean up the player's perks between rounds }
  ActorValue Property WeaponGroup1SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 1 health (used to repair the ship) }
  ActorValue Property WeaponGroup2SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 2 health (used to repair the ship) }
  ActorValue Property WeaponGroup3SystemHealth Auto Const mandatory
  { Spaceship Weapon Group 3 health (used to repair the ship) }
  ActorValue Property EngineSystemHealth Auto Const mandatory
  { Spaceship Engine health (used to repair the ship) }
  ActorValue Property ShieldSystemHealth Auto Const mandatory
  { Spaceship Shield health (used to repair the ship) }
  ActorValue Property GravDriveSystemHealth Auto Const mandatory
  { Spaceship Grav Drive health (used to repair the ship) }
  ActorValue Property ReactorSystemHealth Auto Const mandatory
  { Spaceship Reactor health (used to repair the ship) }
  ActorValue Property ShipSystemEngineEMHealth Auto Const mandatory
  { Spaceship Engine EM health (used to repair the ship) }
  ActorValue Property ShipSystemGravDriveEMHealth Auto Const mandatory
  { Spaceship Grav Drive EM health (used to repair the ship) }
  ActorValue Property ShipSystemShieldsEMHealth Auto Const mandatory
  { Spaceship Shields EM health (used to repair the ship) }
  ActorValue Property ShipSystemWeaponEMHealth Auto Const mandatory
  { Spaceship Weapon EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup1EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup2EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  ActorValue Property SpaceshipWeaponGroup3EMHealth Auto Const mandatory
  { Spaceship Weapon Group 1 EM health (used to repair the ship) }
  Perk[] Property UpgradePerks Auto Const mandatory
  { Array of all the upgrade perks the player can use during this sequence that get removed after a round }
  Scene Property UC01_ShipSimQuest_400b_Upgrade_Manager Auto Const mandatory
  { Upgrade scene. Triggered by all the upgrades, which then loop through each other and trigger the 
    appropriate ones to avoid concatinating. I am super up for better suggestions on how to handle this. }
  GlobalVariable Property UC01_ShipSim_SpawnWaitTimer Auto Const mandatory
  { If we're spawning a large group of enemies, how long should we regularly wait? }
  Potion Property ShipRepairKit Auto Const mandatory
  { Player gets one repair kit per tier }
  GlobalVariable Property UC01_RepairKitPerTier Auto Const mandatory
  { Global used to turn on giving the player a reapir kit every Tier if we want that }
  GlobalVariable Property UC01_RestoreRepairKitsOnFail Auto Const mandatory
  { Global var used to manage if we want to restore the player's repair kits after they fail }
  ActorValue[] Property ShipActorValues Auto Const mandatory
  { Array of actor values that we repair on the ship when it's downed }
  Message Property UC01_ShipSim_ExitPilotSeat Auto Const mandatory
  { Message to show for MKB urging the player to get out of their seat }
  Message Property UC01_ShipSim_ExitPilotSeat_Controller Auto Const mandatory
  { Message to show for Gamepad urging the player to get out of their seat }
  GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Basic Auto Const mandatory
  { Global var for the Ship Sim basic ally }
  GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Debug Auto Const mandatory
  { Global var for the Ship Sim debug ally }
  GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const mandatory
  { Global var for the Ship Sim shields debug bonus }
  GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const mandatory
  { Global var for the Ship Sim weapons debug bonus }
EndGroup

Group Aliases
  RefCollectionAlias Property EnemySpawns Auto Const mandatory
  { Ref collection for the enemy spawns }
  ReferenceAlias Property ActiveEnemy Auto Const mandatory
  { Alias to hold the active opponent for the player }
  RefCollectionAlias Property ActiveEnemies Auto Const mandatory
  { RefColl to hold all the enemies for a given tier }
  ReferenceAlias Property ExitRock Auto Const mandatory
  { The rock that manages the exit for the experience }
  ReferenceAlias Property SimShip Auto Const mandatory
  { Alias for the player's ship }
  ReferenceAlias Property currEnemySpawn Auto Const mandatory
  { Alias used to hold the spawn point of the current enemy }
  ReferenceAlias Property nextEnemySpawn Auto Const mandatory
  { Conditional alias used to find spawn points an appropriate distance away from the player }
  RefCollectionAlias Property AlliedShips Auto Const mandatory
  { Holding collection for any allied ships the player's calling in }
  ReferenceAlias Property ShipSimSeat Auto Const mandatory
  { Alias for the Sim Ship's seat. Used to check if the player's still sitting in it }
EndGroup

Group Scenes
  Scene Property UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable Auto Const mandatory
  { New target available scene }
  Scene Property UC01_ShipSimulatorHelperQuest_300a_TargetDefeated Auto Const mandatory
  { Enemy defeated scene }
  Scene Property UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent Auto Const mandatory
  { Scene to play after the player's reset the sequence }
EndGroup

Group Vars
  Float Property CountdownTimer = 8.0 Auto Const
  { How long to wait after telling the player the next wave is coming to spawn them }
  Float Property ResetTimerLength = 0.25 Auto Const
  { How long to wait until kicking off the reset sequence }
  Float Property GetUpTimerLength = 14.0 Auto Const
  { How long to wait to check and tell the player to get out of their seat again }
  Int Property WaitForNextEnemyObj = 250 Auto Const
  { Objective directing player to wait for the next enemy }
  Int Property EngageEnemyObj = 300 Auto Const
  { Objective index directing the player to attack the new enemy }
  Int Property PlayerPassedStage = 400 Auto Const
  { Stage to set if the player's successfully passed the sequence }
  Int Property ProceedToPilotsSeatObjIndex = 100 Auto Const
  { Objective index for directing the player to sit in the pilot's seat }
  Int Property TriggerResetObjIndex = 350 Auto Const
  { Objective index for directing the player to reset the sequence }
EndGroup

Group Properties
  Bool Property bResetRequired Auto conditional
  { Used to track if the quest is in need of reseting }
  Bool Property bSequencePaused Auto conditional
  { Used to track if the quest is paused (player hasn't both reset the sequence AND reentered the pilots seat) }
  Bool Property bSequenceInited Auto conditional
  { Used to track if the combat sequence has been started }
  Int Property FailureCount Auto conditional
  { Count how many times the player has failed. Open up new dialogue options if it's more than once }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  UC01_ShipSim_CurrentTier.SetValue(0.0) ; #DEBUG_LINE_NO:224
  UC01_ShipSim_TotalEnemyCount.SetValue(EnemyTierLists.Length as Float) ; #DEBUG_LINE_NO:227
  Self.ResetDebugGlobals() ; #DEBUG_LINE_NO:230
EndEvent

Function ResetDebugGlobals()
  UC01_ShipSim_Debug_AllySpawned_Basic.SetValue(0.0) ; #DEBUG_LINE_NO:234
  UC01_ShipSim_Debug_AllySpawned_Debug.SetValue(0.0) ; #DEBUG_LINE_NO:235
  UC01_ShipSim_Debug_InifinitePerks.SetValue(0.0) ; #DEBUG_LINE_NO:236
  UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(0.0) ; #DEBUG_LINE_NO:237
  UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(0.0) ; #DEBUG_LINE_NO:238
EndFunction

Function ApplyShipPerk(Perk akPerkToApply)
  SimShip.GetShipRef().AddPerk(akPerkToApply, False) ; #DEBUG_LINE_NO:242
EndFunction

Function BeginSequence()
  Self.StartCooldownTimer(-1.0) ; #DEBUG_LINE_NO:246
  bSequenceInited = True ; #DEBUG_LINE_NO:249
  (ExitRock as uc01_rockaliasscript).StartSequence() ; #DEBUG_LINE_NO:250
EndFunction

Function StartNewWave()
  If !bSequenceComplete ; #DEBUG_LINE_NO:254
    Self.SpawnEnemies() ; #DEBUG_LINE_NO:255
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnEnemies()
  Int h = 0 ; #DEBUG_LINE_NO:261
  Int hCount = EnemySpawns.GetCount() ; #DEBUG_LINE_NO:262
  ObjectReference[] TempSpawns = new ObjectReference[hCount] ; #DEBUG_LINE_NO:263
  While h < hCount ; #DEBUG_LINE_NO:266
    TempSpawns[h] = EnemySpawns.GetAt(h) ; #DEBUG_LINE_NO:267
    h += 1 ; #DEBUG_LINE_NO:270
  EndWhile ; #DEBUG_LINE_NO:
  Int currWave = UC01_ShipSim_CurrentTier.GetValueInt() ; #DEBUG_LINE_NO:274
  FormList currList = EnemyTierLists[currWave].BaseEnemyList ; #DEBUG_LINE_NO:276
  Int currDifficulty = EnemyTierLists[currWave].Difficulty ; #DEBUG_LINE_NO:277
  Int I = 0 ; #DEBUG_LINE_NO:280
  Int iCount = currList.GetSize() ; #DEBUG_LINE_NO:281
  Bool waitAfterEveryShipSpawn = iCount > 3 ; #DEBUG_LINE_NO:282
  Float fWaitTimer = UC01_ShipSim_SpawnWaitTimer.GetValue() ; #DEBUG_LINE_NO:283
  While I < iCount ; #DEBUG_LINE_NO:286
    Int iRand = Utility.RandomInt(0, TempSpawns.Length - 1) ; #DEBUG_LINE_NO:288
    ObjectReference EnemySpawn = TempSpawns[iRand] ; #DEBUG_LINE_NO:290
    If EnemySpawn == None ; #DEBUG_LINE_NO:293
      h = 0 ; #DEBUG_LINE_NO:294
      While h < hCount ; #DEBUG_LINE_NO:295
        TempSpawns.add(EnemySpawns.GetAt(h), 1) ; #DEBUG_LINE_NO:296
        h += 1 ; #DEBUG_LINE_NO:299
      EndWhile ; #DEBUG_LINE_NO:
      EnemySpawn = TempSpawns[0] ; #DEBUG_LINE_NO:303
      iRand = 0 ; #DEBUG_LINE_NO:304
    EndIf ; #DEBUG_LINE_NO:
    Form CurrentEnemy = currList.GetAt(I) ; #DEBUG_LINE_NO:309
    spaceshipreference NewEnemy = EnemySpawn.PlaceShipAtMe(CurrentEnemy, currDifficulty, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:310
    If CurrentEnemy != None && NewEnemy != None ; #DEBUG_LINE_NO:314
      ActiveEnemies.AddRef(NewEnemy as ObjectReference) ; #DEBUG_LINE_NO:315
      TempSpawns.remove(iRand, 1) ; #DEBUG_LINE_NO:316
    EndIf ; #DEBUG_LINE_NO:
    If waitAfterEveryShipSpawn ; #DEBUG_LINE_NO:320
      Utility.Wait(fWaitTimer) ; #DEBUG_LINE_NO:321
    ElseIf I != 0 && I % 2 == 0 ; #DEBUG_LINE_NO:322
      Utility.Wait(fWaitTimer) ; #DEBUG_LINE_NO:323
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:326
  EndWhile ; #DEBUG_LINE_NO:
  If ActiveEnemies.GetCount() > 0 ; #DEBUG_LINE_NO:329
    UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable.Start() ; #DEBUG_LINE_NO:331
    Self.SetObjectiveDisplayed(WaitForNextEnemyObj, False, False) ; #DEBUG_LINE_NO:332
    UC01_ShipSim_CurrentWaveEnemyCountTotal.SetValue(iCount as Float) ; #DEBUG_LINE_NO:335
    Self.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountTotal) ; #DEBUG_LINE_NO:336
    Self.SetObjectiveDisplayedAtTop(EngageEnemyObj) ; #DEBUG_LINE_NO:337
    Int j = 0 ; #DEBUG_LINE_NO:339
    Int jCount = ActiveEnemies.GetCount() ; #DEBUG_LINE_NO:340
    While j < jCount ; #DEBUG_LINE_NO:342
      spaceshipreference currEnemy = ActiveEnemies.GetAt(j) as spaceshipreference ; #DEBUG_LINE_NO:343
      currEnemy.EnableWithGravJump() ; #DEBUG_LINE_NO:344
      j += 1 ; #DEBUG_LINE_NO:346
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnemyDefeated()
  If !bSequenceComplete && !bSequencePaused ; #DEBUG_LINE_NO:355
    Self.SetObjectiveDisplayed(EngageEnemyObj, False, False) ; #DEBUG_LINE_NO:357
    UC01_ShipSim_CurrentTier.Mod(1.0) ; #DEBUG_LINE_NO:358
    If UC01_ShipSim_CurrentTier.GetValue() >= UC01_ShipSim_MinTierRequired.GetValue() ; #DEBUG_LINE_NO:361
      Self.SetStage(PlayerPassedStage) ; #DEBUG_LINE_NO:362
    EndIf ; #DEBUG_LINE_NO:
    UC01_ShipSimulatorHelperQuest_300a_TargetDefeated.Start() ; #DEBUG_LINE_NO:368
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearShipUpgrades()
  If UC01_ShipSim_Debug_InifinitePerks.GetValue() < 1.0 ; #DEBUG_LINE_NO:375
    Int I = 0 ; #DEBUG_LINE_NO:376
    Int iLength = UpgradePerks.Length ; #DEBUG_LINE_NO:377
    While I < iLength ; #DEBUG_LINE_NO:379
      Perk currPerk = UpgradePerks[I] ; #DEBUG_LINE_NO:380
      spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:381
      If PlayerShip.HasPerk(currPerk) ; #DEBUG_LINE_NO:383
        PlayerShip.RemovePerk(currPerk) ; #DEBUG_LINE_NO:384
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:386
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PauseSequence()
  bSequencePaused = True ; #DEBUG_LINE_NO:393
  bResetRequired = True ; #DEBUG_LINE_NO:394
  Self.ClearShipUpgrades() ; #DEBUG_LINE_NO:396
  Self.CancelTimer(iTimerID) ; #DEBUG_LINE_NO:398
  Int I = 0 ; #DEBUG_LINE_NO:401
  Int iCount = ActiveEnemies.GetCount() ; #DEBUG_LINE_NO:402
  While I < iCount ; #DEBUG_LINE_NO:404
    spaceshipreference currRef = ActiveEnemies.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:405
    currRef.SetUnconscious(True) ; #DEBUG_LINE_NO:406
    currRef.SetGhost(True) ; #DEBUG_LINE_NO:407
    I += 1 ; #DEBUG_LINE_NO:408
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetObjectiveFailed(EngageEnemyObj, True) ; #DEBUG_LINE_NO:411
EndFunction

Function DirectPlayerToReset()
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, True, False) ; #DEBUG_LINE_NO:416
  Self.ToggleGetUpTimer(True) ; #DEBUG_LINE_NO:417
EndFunction

Function DirectPlayerToPilotsSeat()
  Self.ToggleGetUpTimer(False) ; #DEBUG_LINE_NO:421
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, True, False) ; #DEBUG_LINE_NO:422
EndFunction

Function TriggerResetTimer()
  Self.StartTimer(ResetTimerLength, iResetTimerID) ; #DEBUG_LINE_NO:426
EndFunction

Function ResetSequence()
  bResetRequired = False ; #DEBUG_LINE_NO:431
  FailureCount += 1 ; #DEBUG_LINE_NO:432
  Self.ToggleGetUpTimer(False) ; #DEBUG_LINE_NO:435
  Int I = ActiveEnemies.GetCount() - 1 ; #DEBUG_LINE_NO:438
  While I >= 0 ; #DEBUG_LINE_NO:440
    ObjectReference currObj = ActiveEnemies.GetAt(I) ; #DEBUG_LINE_NO:441
    spaceshipreference currRef = currObj as spaceshipreference ; #DEBUG_LINE_NO:442
    currRef.DisableWithGravJump() ; #DEBUG_LINE_NO:443
    ActiveEnemies.RemoveRef(currObj) ; #DEBUG_LINE_NO:444
    I -= 1 ; #DEBUG_LINE_NO:446
  EndWhile ; #DEBUG_LINE_NO:
  Self.RepairPlayerShip() ; #DEBUG_LINE_NO:451
  If UC01_RestoreRepairKitsOnFail.GetValueInt() > 0 ; #DEBUG_LINE_NO:454
    spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:455
    Int iKitsToAdd = 3 - PlayerShip.GetItemCount(ShipRepairKit as Form) ; #DEBUG_LINE_NO:456
    If iKitsToAdd > 0 ; #DEBUG_LINE_NO:458
      PlayerShip.AddItem(ShipRepairKit as Form, iKitsToAdd, True) ; #DEBUG_LINE_NO:459
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0.0) ; #DEBUG_LINE_NO:463
  Self.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated) ; #DEBUG_LINE_NO:464
  Self.SetObjectiveDisplayed(TriggerResetObjIndex, False, False) ; #DEBUG_LINE_NO:465
  Self.SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex, True, False) ; #DEBUG_LINE_NO:467
EndFunction

Function ResumeCombatSequence()
  bSequencePaused = False ; #DEBUG_LINE_NO:471
  UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent.Start() ; #DEBUG_LINE_NO:474
EndFunction

Function RepairPlayerShip()
  spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:478
  Bool PlayRepairSound = Self.CheckForRepairAudio() ; #DEBUG_LINE_NO:480
  PlayerShip.RestoreValue(Health, PlayerShip.GetValue(Health)) ; #DEBUG_LINE_NO:482
  PlayerShip.RestoreValue(WeaponGroup1SystemHealth, 1000000.0) ; #DEBUG_LINE_NO:485
  PlayerShip.RestoreValue(WeaponGroup2SystemHealth, 1000000.0) ; #DEBUG_LINE_NO:486
  PlayerShip.RestoreValue(WeaponGroup3SystemHealth, 1000000.0) ; #DEBUG_LINE_NO:487
  PlayerShip.RestoreValue(EngineSystemHealth, 1000000.0) ; #DEBUG_LINE_NO:488
  PlayerShip.RestoreValue(ShieldSystemHealth, 1000000.0) ; #DEBUG_LINE_NO:489
  PlayerShip.RestoreValue(GravDriveSystemHealth, 1000000.0) ; #DEBUG_LINE_NO:490
  PlayerShip.RestoreValue(ReactorSystemHealth, 1000000.0) ; #DEBUG_LINE_NO:491
  PlayerShip.RestoreValue(ShipSystemEngineEMHealth, 1000000.0) ; #DEBUG_LINE_NO:492
  PlayerShip.RestoreValue(ShipSystemGravDriveEMHealth, 1000000.0) ; #DEBUG_LINE_NO:493
  PlayerShip.RestoreValue(ShipSystemShieldsEMHealth, 1000000.0) ; #DEBUG_LINE_NO:494
  PlayerShip.RestoreValue(ShipSystemWeaponEMHealth, 1000000.0) ; #DEBUG_LINE_NO:495
  PlayerShip.RestoreValue(SpaceshipWeaponGroup1EMHealth, 1000000.0) ; #DEBUG_LINE_NO:496
  PlayerShip.RestoreValue(SpaceshipWeaponGroup2EMHealth, 1000000.0) ; #DEBUG_LINE_NO:497
  PlayerShip.RestoreValue(SpaceshipWeaponGroup3EMHealth, 1000000.0) ; #DEBUG_LINE_NO:498
  If UC01_RepairKitPerTier.GetValueInt() > 0 && PlayerShip.GetItemCount(ShipRepairKit as Form) < 1 ; #DEBUG_LINE_NO:500
    PlayerShip.AddItem(ShipRepairKit as Form, 1, True) ; #DEBUG_LINE_NO:501
  EndIf ; #DEBUG_LINE_NO:
  If PlayRepairSound ; #DEBUG_LINE_NO:504
    ResetShipSoundEvent.PlayAndWait(SimShip.GetRef(), None, None) ; #DEBUG_LINE_NO:505
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function CheckForRepairAudio()
  Int I = 0 ; #DEBUG_LINE_NO:510
  Int iLength = ShipActorValues.Length ; #DEBUG_LINE_NO:511
  Bool bPlayRepairSound = False ; #DEBUG_LINE_NO:512
  spaceshipreference PlayerShip = SimShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:513
  While I < iLength && !bPlayRepairSound ; #DEBUG_LINE_NO:515
    ActorValue currValue = ShipActorValues[I] ; #DEBUG_LINE_NO:516
    If PlayerShip.GetBaseValue(currValue) != PlayerShip.GetValue(currValue) ; #DEBUG_LINE_NO:518
      bPlayRepairSound = True ; #DEBUG_LINE_NO:519
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:521
  EndWhile ; #DEBUG_LINE_NO:
  Return bPlayRepairSound ; #DEBUG_LINE_NO:524
EndFunction

Function SpawnPlayerAlly(Form akBaseObject)
  spaceshipreference NewAlly = SimShip.GetRef().PlaceShipNearMe(akBaseObject, 0, 0, 0, 4, True, False, False, True, None) ; #DEBUG_LINE_NO:529
  NewAlly.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:530
  AlliedShips.AddRef(NewAlly as ObjectReference) ; #DEBUG_LINE_NO:531
EndFunction

Function StartCooldownTimer(Float fTimerOverride)
  If fTimerOverride > -1.0 ; #DEBUG_LINE_NO:537
    Self.StartTimer(fTimerOverride, iTimerID) ; #DEBUG_LINE_NO:538
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(CountdownTimer, iTimerID) ; #DEBUG_LINE_NO:540
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex, False, False) ; #DEBUG_LINE_NO:542
  Self.SetObjectiveDisplayed(EngageEnemyObj, False, False) ; #DEBUG_LINE_NO:543
  Self.SetObjectiveDisplayedAtTop(WaitForNextEnemyObj) ; #DEBUG_LINE_NO:545
  Self.RepairPlayerShip() ; #DEBUG_LINE_NO:546
EndFunction

Function ShutdownSimulation()
  bSequenceComplete = True ; #DEBUG_LINE_NO:550
  Self.CancelTimer(iTimerID) ; #DEBUG_LINE_NO:551
  ActiveEnemy.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:552
EndFunction

Function TriggerUpgradeScene()
  Self.StartTimer(0.5, iUpgradeSceneTimerID) ; #DEBUG_LINE_NO:556
EndFunction

ObjectReference Function FindEnemySpawn()
  ObjectReference NextSpawn = None ; #DEBUG_LINE_NO:561
  ObjectReference MostRecentEnemySpawn = currEnemySpawn.GetRef() ; #DEBUG_LINE_NO:562
  ObjectReference FallbackSpawn = EnemySpawns.GetAt(Utility.RandomInt(0, EnemySpawns.GetCount() - 1)) ; #DEBUG_LINE_NO:564
  nextEnemySpawn.RefillAlias() ; #DEBUG_LINE_NO:567
  ObjectReference PossibleNextSpawn = nextEnemySpawn.GetRef() ; #DEBUG_LINE_NO:568
  If nextEnemySpawn as Bool && PossibleNextSpawn != MostRecentEnemySpawn ; #DEBUG_LINE_NO:571
    NextSpawn = PossibleNextSpawn ; #DEBUG_LINE_NO:572
  Else ; #DEBUG_LINE_NO:
    NextSpawn = FallbackSpawn ; #DEBUG_LINE_NO:574
  EndIf ; #DEBUG_LINE_NO:
  Return NextSpawn ; #DEBUG_LINE_NO:578
EndFunction

Function SetEnemyScale(Float fScaletoSet)
  Int I = 0 ; #DEBUG_LINE_NO:582
  Int iCount = ActiveEnemies.GetCount() ; #DEBUG_LINE_NO:583
  While I < iCount ; #DEBUG_LINE_NO:585
    ObjectReference currRef = ActiveEnemies.GetAt(I) ; #DEBUG_LINE_NO:586
    currRef.SetScale(fScaletoSet) ; #DEBUG_LINE_NO:587
    I += 1 ; #DEBUG_LINE_NO:589
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If !bSequenceComplete && aiTimerID == iTimerID ; #DEBUG_LINE_NO:595
    Self.StartNewWave() ; #DEBUG_LINE_NO:597
  ElseIf aiTimerID == iUpgradeSceneTimerID ; #DEBUG_LINE_NO:598
    UC01_ShipSimQuest_400b_Upgrade_Manager.Start() ; #DEBUG_LINE_NO:599
  ElseIf aiTimerID == iResetTimerID ; #DEBUG_LINE_NO:600
    Self.ResetSequence() ; #DEBUG_LINE_NO:601
  ElseIf aiTimerID == iGetUpTimerID ; #DEBUG_LINE_NO:602
    Self.CheckForGetUpMessage() ; #DEBUG_LINE_NO:603
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ToggleGetUpTimer(Bool bStart)
  If bStart ; #DEBUG_LINE_NO:608
    Self.StartTimer(GetUpTimerLength, iGetUpTimerID) ; #DEBUG_LINE_NO:609
  Else ; #DEBUG_LINE_NO:
    Self.CancelTimer(iGetUpTimerID) ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckForGetUpMessage()
  If bSequencePaused ; #DEBUG_LINE_NO:616
    If Game.GetPlayer().GetFurnitureUsing() == ShipSimSeat.GetRef() ; #DEBUG_LINE_NO:617
      If Game.UsingGamepad() ; #DEBUG_LINE_NO:618
        UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:619
      Else ; #DEBUG_LINE_NO:
        UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:621
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.ToggleGetUpTimer(True) ; #DEBUG_LINE_NO:625
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:633
EndFunction
