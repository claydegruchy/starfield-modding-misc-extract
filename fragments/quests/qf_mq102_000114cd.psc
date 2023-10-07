ScriptName Fragments:Quests:QF_MQ102_000114CD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ102_020_SentinelMoara Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Scene Property MQ102_023_ReturnLodge Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ102_024_AddArtifact Auto Const mandatory
Scene Property MQ102_001_PlayerScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Scene Property MQ102_002_MASTScene Auto Const mandatory
Scene Property MQ102_012_SearchCluesScene Auto Const mandatory
Scene Property MQ102_014_JupiterScene Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ102SpaceEncounter02a Auto Const mandatory
Quest Property MQ102SpaceEncounter03 Auto Const mandatory
Scene Property MQ102_033_SaturnScene Auto Const mandatory
Scene Property MQ102_034_ApproachShipScene Auto Const mandatory
Scene Property MQ102_037_SarahWrapUp Auto Const mandatory
Scene Property MQ102_036_MoaraLockedUp Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Scene Property MQ102_007_SarahVenusScene Auto Const mandatory
Quest Property UC01 Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_FirstEncounterShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_MoaraShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_MoaraShipEnemies Auto Const mandatory
Quest Property MQ102xPostQuest Auto Const mandatory
ReferenceAlias Property Alias_Moara Auto Const mandatory
ObjectReference Property CydoniaBarSandboxMarker Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Scene Property MQ102_035_ShipDisabledScene Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipCaptiveMarker Auto Const mandatory
ObjectReference Property MQ102ArtifactSpawnMarker Auto Const mandatory
ReferenceAlias Property Alias_MQ102Artifact Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
Scene Property AudioLogs_MQ102_Pirate Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
Quest Property MoaraEliteCrewQuest Auto Const
Armor Property Spacesuit_Constellation_Helmet_01 Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory
Armor Property Spacesuit_Constellation_01 Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
ActorValue Property SpaceshipShieldHealth Auto Const mandatory
LocationAlias Property Alias_CityCydoniaLocation Auto Const mandatory
Quest Property TestGoToSpaceQuest Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipMarker Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Scene Property MQ102_008_VaruunScene02_Sarah Auto Const mandatory
Scene Property MQ102_008_VaruunScene01 Auto Const mandatory
Faction Property MQ102VaruunFaction Auto Const mandatory
Scene Property MQ102_012_MoaraSatelliteScene Auto Const mandatory
ReferenceAlias Property Alias_NovaMoaraLog Auto Const mandatory
Scene Property MQ102_014_MoonScene Auto Const mandatory
Scene Property MQ102_015_StaryardSarahComment01 Auto Const mandatory
Scene Property MQ102_016_StaryardSarahComment02 Auto Const mandatory
Scene Property MQ102_016_StaryardSarahComment03 Auto Const mandatory
Message Property Tutorial_ShipStealth_MSGBox Auto Const mandatory
Message Property Tutorial_Docking_MSGBox Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox01 Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox01_PC Auto Const mandatory
Message Property Tutorial_Boarding_MSGBox02 Auto Const mandatory
Scene Property MQ102_037_Moara Auto Const mandatory
ReferenceAlias Property Alias_MQ102ArtifactMoara Auto Const mandatory
Message Property MQ102SarahLockInMSG Auto Const mandatory
Message Property MQ102SarahLockInOverMSG Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipBoss Auto Const mandatory
ReferenceAlias Property Alias_SatelliteBeacon Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
wwiseevent Property QST_MQ102_Satellite_Activate_WEF Auto Const mandatory
Scene Property FFLodge01_Stage20_Noel_TourScene Auto Const mandatory
GlobalVariable Property MQ102_BlockNoelTour Auto Const mandatory
Quest Property FFLodge01_Actual Auto Const mandatory
Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
conditionform Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Keyword Property COM_PreventStoryGateScenes Auto Const mandatory
ReferenceAlias Property Alias_MoaraShipCockpitDoor Auto Const mandatory
Activator Property COM_MQ102_TxtReplace_QuestName_SarahMorgan Auto Const mandatory
Scene Property MQ102_033_NeptuneScene Auto Const mandatory
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:8
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:11
  MQ101.SetStage(1635) ; #DEBUG_LINE_NO:12
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:13
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:14
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:17
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:18
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().additem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:22
  Self.SetStage(10) ; #DEBUG_LINE_NO:24
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:28
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:29
  SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:38
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:39
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:40
  Self.SetStage(10) ; #DEBUG_LINE_NO:42
  Self.SetStage(100) ; #DEBUG_LINE_NO:43
  Self.SetStage(200) ; #DEBUG_LINE_NO:44
  Self.SetStage(300) ; #DEBUG_LINE_NO:45
  TestGoToSpaceQuest.SetStage(10) ; #DEBUG_LINE_NO:47
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:48
  Alias_SarahMorgan.GetRef().moveto(Game.GetPlayer() as ObjectReference, 0.0, -2.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:57
  Alias_Vasco.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:60
  Self.SetActive(True) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:70
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:71
  kmyQuest.ShowHelpMessage("FollowerWarn") ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0096_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0097_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:90
  Self.SetStage(96) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0100_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:100
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:102
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:105
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:107
  (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, True, MQ102SarahLockInMSG, COM_MQ102_TxtReplace_QuestName_SarahMorgan) ; #DEBUG_LINE_NO:108
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0110_Item_00()
  If !UC01.GetStageDone(100) ; #DEBUG_LINE_NO:117
    MQ102_002_MASTScene.Start() ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:135
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:136
  Alias_NovaMoaraLog.GetRef().Enable(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0210_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:147
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:149
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:151
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:153
  (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, True, MQ102SarahLockInMSG, COM_MQ102_TxtReplace_QuestName_SarahMorgan) ; #DEBUG_LINE_NO:154
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:155
  Self.SetStage(200) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0275_Item_00()
  Self.SetObjectiveDisplayed(32, True, False) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0277_Item_00()
  Self.SetObjectiveCompleted(32, True) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0285_Item_00()
  Game.GetPlayer().removeitem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0287_Item_00()
  Game.GetPlayer().removeitem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:189
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:197
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:198
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:206
  mq102script kmyQuest = __temp as mq102script ; #DEBUG_LINE_NO:207
  kmyQuest.BlockSpaceTravel() ; #DEBUG_LINE_NO:212
  MQ102_007_SarahVenusScene.Start() ; #DEBUG_LINE_NO:217
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:219
  Self.SetObjectiveDisplayed(41, True, False) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveDisplayed(32, False, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:229
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:230
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:233
  Self.SetObjectiveCompleted(41, True) ; #DEBUG_LINE_NO:234
  Self.SetObjectiveDisplayed(42, True, False) ; #DEBUG_LINE_NO:235
  Self.SetObjectiveDisplayed(43, True, False) ; #DEBUG_LINE_NO:236
  Tutorial_ShipStealth_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:238
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:239
  kmyQuest.ShowHelpMessage("SpaceTarget") ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0410_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:248
  mq102script kmyQuest = __temp as mq102script ; #DEBUG_LINE_NO:249
  kmyQuest.UnBlockSpaceTravel() ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_0415_Item_00()
  MQ102SpaceEncounter02a.Start() ; #DEBUG_LINE_NO:261
  Game.GetPlayer().addtoFaction(MQ102VaruunFaction) ; #DEBUG_LINE_NO:264
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:266
  Self.SetObjectiveCompleted(41, True) ; #DEBUG_LINE_NO:267
  Self.SetObjectiveDisplayed(42, True, False) ; #DEBUG_LINE_NO:268
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(415) ; #DEBUG_LINE_NO:276
    MQ102_008_VaruunScene02_Sarah.Start() ; #DEBUG_LINE_NO:277
  Else ; #DEBUG_LINE_NO:
    MQ102_008_VaruunScene01.Start() ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0425_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:288
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:289
  kmyQuest.ShowHelpMessage("MQ102Satellite") ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveDisplayed(43, False, False) ; #DEBUG_LINE_NO:300
  Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction) ; #DEBUG_LINE_NO:302
EndFunction

Function Fragment_Stage_0490_Item_00()
  ObjectReference SatelliteREF = Alias_SatelliteBeacon.GetRef() ; #DEBUG_LINE_NO:310
  SatelliteREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:312
  QST_MQ102_Satellite_Activate_WEF.Play(SatelliteREF, None, None) ; #DEBUG_LINE_NO:313
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:315
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:317
  Self.SetObjectiveCompleted(42, True) ; #DEBUG_LINE_NO:318
  Self.SetObjectiveCompleted(44, True) ; #DEBUG_LINE_NO:319
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:320
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:321
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:322
  Self.SetObjectiveDisplayed(43, False, False) ; #DEBUG_LINE_NO:323
  MQ102_012_MoaraSatelliteScene.Start() ; #DEBUG_LINE_NO:325
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:333
  mq102script kmyQuest = __temp as mq102script ; #DEBUG_LINE_NO:334
  kmyQuest.BlockSpaceTravel() ; #DEBUG_LINE_NO:337
  MQ102_012_MoaraSatelliteScene.Stop() ; #DEBUG_LINE_NO:339
  MQ102_014_MoonScene.Start() ; #DEBUG_LINE_NO:340
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:342
  Self.SetObjectiveDisplayed(61, True, False) ; #DEBUG_LINE_NO:343
  Alias_NovaMoaraLog.GetRef().Enable(False) ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:354
  mq102script kmyQuest = __temp as mq102script ; #DEBUG_LINE_NO:355
  kmyQuest.UnBlockSpaceTravel() ; #DEBUG_LINE_NO:358
  Self.SetObjectiveCompleted(61, True) ; #DEBUG_LINE_NO:360
  Self.SetObjectiveDisplayed(65, True, False) ; #DEBUG_LINE_NO:361
  Tutorial_Docking_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveCompleted(61, True) ; #DEBUG_LINE_NO:380
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:381
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:382
  MQ102_015_StaryardSarahComment01.Start() ; #DEBUG_LINE_NO:384
EndFunction

Function Fragment_Stage_0540_Item_00()
  MQ102_016_StaryardSarahComment02.Start() ; #DEBUG_LINE_NO:392
EndFunction

Function Fragment_Stage_0590_Item_00()
  Self.SetObjectiveCompleted(61, True) ; #DEBUG_LINE_NO:400
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:401
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:402
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_0595_Item_00()
  MQ102_016_StaryardSarahComment03.Start() ; #DEBUG_LINE_NO:411
EndFunction

Function Fragment_Stage_0600_Item_00()
  MQ102_033_SaturnScene.Start() ; #DEBUG_LINE_NO:421
  Self.SetObjectiveDisplayed(85, False, False) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0605_Item_00()
  ObjectReference ShipMarkerREF = Alias_MoaraShipMarker.GetRef() ; #DEBUG_LINE_NO:433
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference() ; #DEBUG_LINE_NO:434
  MoaraShipREF.moveto(ShipMarkerREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:436
  MoaraShipREF.Enable(False) ; #DEBUG_LINE_NO:437
  MoaraShipREF.DamageValue(SpaceshipEngineHealth, 2.0) ; #DEBUG_LINE_NO:439
  MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, False) ; #DEBUG_LINE_NO:440
  MoaraShipREF.DamageValue(SpaceshipShieldHealth, 3.0) ; #DEBUG_LINE_NO:443
  MoaraShipREF.EnablePartRepair(SpaceshipShieldHealth, False) ; #DEBUG_LINE_NO:444
  MoaraShipREF.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:447
EndFunction

Function Fragment_Stage_0607_Item_00()
  Self.SetStage(620) ; #DEBUG_LINE_NO:455
  Self.SetStage(630) ; #DEBUG_LINE_NO:456
  MQ102_033_NeptuneScene.Stop() ; #DEBUG_LINE_NO:458
  MQ102_034_ApproachShipScene.Stop() ; #DEBUG_LINE_NO:459
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:467
  Self.SetObjectiveCompleted(32, True) ; #DEBUG_LINE_NO:468
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:469
  Self.SetObjectiveCompleted(41, True) ; #DEBUG_LINE_NO:470
  Self.SetObjectiveCompleted(42, True) ; #DEBUG_LINE_NO:471
  Self.SetObjectiveDisplayed(43, False, False) ; #DEBUG_LINE_NO:472
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:473
  Self.SetObjectiveCompleted(61, True) ; #DEBUG_LINE_NO:474
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:475
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:476
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:477
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:485
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:486
  MQ102_034_ApproachShipScene.Start() ; #DEBUG_LINE_NO:488
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference() ; #DEBUG_LINE_NO:490
  MoaraShipREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:492
  MoaraShipREF.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:493
  MoaraShipREF.StartCombat(Alias_PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:494
  MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, False) ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:504
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_0630_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:522
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:523
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:526
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:527
EndFunction

Function Fragment_Stage_0640_Item_00()
  Tutorial_Boarding_MSGBox02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:535
EndFunction

Function Fragment_Stage_0640_Item_01()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:543
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:544
  MQ102_034_ApproachShipScene.Stop() ; #DEBUG_LINE_NO:546
  MQ102_035_ShipDisabledScene.Start() ; #DEBUG_LINE_NO:547
  Alias_Moara.GetActorRef().moveto(Alias_MoaraShipCaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:550
EndFunction

Function Fragment_Stage_0650_Item_00()
  Actor MoaraREF = Alias_Moara.GetActorRef() ; #DEBUG_LINE_NO:558
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:560
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:561
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:562
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:563
  MQ102_035_ShipDisabledScene.Stop() ; #DEBUG_LINE_NO:565
  MoaraREF.moveto(Alias_MoaraShipCaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:568
  MoaraREF.SetGhost(True) ; #DEBUG_LINE_NO:569
  ObjectReference PlacementREF = Alias_MQ102ArtifactMoara.GetRef() ; #DEBUG_LINE_NO:572
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(3, PlacementREF) ; #DEBUG_LINE_NO:573
  Alias_MQ102Artifact.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:574
  ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:575
  ArtifactREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:576
EndFunction

Function Fragment_Stage_0652_Item_00()
  Self.SetStage(660) ; #DEBUG_LINE_NO:584
EndFunction

Function Fragment_Stage_0655_Item_00()
  ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef() ; #DEBUG_LINE_NO:592
  CockpitDoorREF.SetOpen(True) ; #DEBUG_LINE_NO:594
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:602
  MQ102_036_MoaraLockedUp.Start() ; #DEBUG_LINE_NO:604
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:607
  spaceshipreference MoaraShipREF = Alias_MoaraShip.GetShipReference() ; #DEBUG_LINE_NO:608
  MoaraShipREF.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:609
  MoaraShipREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:610
  MoaraShipREF.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:611
  MoaraShipREF.SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:612
  MoaraShipREF.SetIgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:613
  ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef() ; #DEBUG_LINE_NO:615
  If Self.GetStageDone(670) || CockpitDoorREF.GetOpenState() <= 2 ; #DEBUG_LINE_NO:617
    Self.SetStage(680) ; #DEBUG_LINE_NO:618
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:620
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:629
  If Self.GetStageDone(660) ; #DEBUG_LINE_NO:631
    Self.SetStage(680) ; #DEBUG_LINE_NO:632
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:641
EndFunction

Function Fragment_Stage_0805_Item_00()
  Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:649
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:650
  MQ102_037_Moara.Start() ; #DEBUG_LINE_NO:652
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:660
  Self.SetObjectiveDisplayed(155, True, False) ; #DEBUG_LINE_NO:661
  Alias_MQ102Artifact.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:664
  Actor MoaraREF = Alias_Moara.GetActorRef() ; #DEBUG_LINE_NO:666
  MoaraREF.SetGhost(False) ; #DEBUG_LINE_NO:667
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:675
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:676
  MQ102_037_SarahWrapUp.Start() ; #DEBUG_LINE_NO:678
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(3) ; #DEBUG_LINE_NO:681
  ArmillaryMountSwapEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:684
EndFunction

Function Fragment_Stage_0830_Item_00()
  MQ102_023_ReturnLodge.Start() ; #DEBUG_LINE_NO:692
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:695
  (SQ_Companions as sq_companionsscript).SetRoleInActive(SarahMorganREF, True, False, True) ; #DEBUG_LINE_NO:696
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:697
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:698
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:700
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:708
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:709
  MQ102_BlockNoelTour.SetValue(1.0) ; #DEBUG_LINE_NO:712
EndFunction

Function Fragment_Stage_1000_Item_00()
  MQ102_023_ReturnLodge.Stop() ; #DEBUG_LINE_NO:720
  MQ102_024_AddArtifact.Start() ; #DEBUG_LINE_NO:721
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:723
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:724
  If FFLodge01_Stage20_Noel_TourScene.IsPlaying() ; #DEBUG_LINE_NO:727
    FFLodge01_Stage20_Noel_TourScene.Stop() ; #DEBUG_LINE_NO:728
    FFLodge01_Actual.SetStage(200) ; #DEBUG_LINE_NO:729
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1010_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:738
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:739
EndFunction

Function Fragment_Stage_1100_Item_00()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:747
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SarahMorganREF, True) ; #DEBUG_LINE_NO:748
  (SarahMorganREF as companionactorscript).AllowStoryGatesAndRestartTimer() ; #DEBUG_LINE_NO:750
EndFunction

Function Fragment_Stage_1110_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:758
EndFunction

Function Fragment_Stage_1120_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:766
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:769
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:770
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:771
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:779
  MQ103.SetStageNoWait(10) ; #DEBUG_LINE_NO:782
  MQ104.SetStageNoWait(10) ; #DEBUG_LINE_NO:783
  FFLodge01.SetStageNoWait(10) ; #DEBUG_LINE_NO:784
  MQ102xPostQuest.Start() ; #DEBUG_LINE_NO:785
  RAD02.SetStageNoWait(5) ; #DEBUG_LINE_NO:786
  Self.Stop() ; #DEBUG_LINE_NO:788
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:798
  If COM_Quest_SarahMorgan_Q01_SarahLockInCND.IsTrue(SarahMorganREF as ObjectReference, None) ; #DEBUG_LINE_NO:799
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    (SQ_Companions as sq_companionsscript).LockInCompanion(SarahMorganREF as companionactorscript, False, MQ102SarahLockInOverMSG, None) ; #DEBUG_LINE_NO:802
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(1130) ; #DEBUG_LINE_NO:806
  MQ102SpaceEncounter02a.Stop() ; #DEBUG_LINE_NO:809
  MQ102SpaceEncounter03.Stop() ; #DEBUG_LINE_NO:810
  Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction) ; #DEBUG_LINE_NO:813
  Actor MoaraREF = Alias_Moara.GetActorRef() ; #DEBUG_LINE_NO:816
  MoaraREF.moveto(CydoniaBarSandboxMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:817
  MoaraREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:818
  MoaraREF.SetGhost(False) ; #DEBUG_LINE_NO:819
  MoaraEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:820
  MQ102_BlockNoelTour.SetValue(0.0) ; #DEBUG_LINE_NO:823
  (MQ00 as mq00questscript).StartMQ104AFailsafeTimer() ; #DEBUG_LINE_NO:826
  (MQ00 as mq00questscript).StartMQ104BFailsafeTimer() ; #DEBUG_LINE_NO:827
EndFunction
