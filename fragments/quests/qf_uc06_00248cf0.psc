ScriptName Fragments:Quests:QF_UC06_00248CF0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NamelessAlias Auto Const mandatory
Scene Property UC06_400_OrlaseGreetingScene Auto Const mandatory
Scene Property UC06_500_OrlaseDeath Auto Const mandatory
ReferenceAlias Property Alias_OrlaseShip Auto Const mandatory
ReferenceAlias Property Alias_OrlaseID Auto Const mandatory
ObjectReference Property UC06_SpaceBattleTeleportMarker Auto Const mandatory
ObjectReference Property UC06_DebugMarker01 Auto Const mandatory
ObjectReference Property UC06_DebugMarker02 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property TestMQ101HelperQuest Auto Const mandatory
Scene Property UC06_90_VaeVictis_Attract Auto Const mandatory
Scene Property UC06_420_OrlaseEngineDisabled Auto Const mandatory
Message Property UC06_Debug_DebrisField Auto Const mandatory
ObjectReference Property UC05_DebugMarker01 Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Message Property UC06_Debug_TroubleTravelingToDen Auto Const mandatory
Message Property UC06_Debug_TravelingToOrlase Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_Orlase Auto Const mandatory
Scene Property UC06_430_OrlaseBoardingScene Auto Const mandatory
Key Property UC06_OrlaseCabinKey Auto Const mandatory
Faction Property UC06_OrlaseFaction Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_VVSurvivedExecution Auto Const mandatory
Quest Property UC07_HadrianVVRevealQuest Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HowVVFoundResearchTeam Auto Const mandatory
Scene Property UC06_100_VaeVictisIntro Auto Const mandatory
Scene Property UC06_140_PlayerExitsVVChamber Auto Const mandatory
Quest Property UC07 Auto Const mandatory
ReferenceAlias Property Alias_OrlaseCabinDoor Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
ReferenceAlias Property Alias_FloorManager Auto Const mandatory
Scene Property UC06_560_VV_ApproachTransfer Auto Const mandatory
ReferenceAlias Property Alias_TransferSystemTrigger Auto Const mandatory
ReferenceAlias Property Alias_VaeVictis Auto Const mandatory
RefCollectionAlias Property Alias_EthereaMines Auto Const mandatory
RefCollectionAlias Property Alias_EthereaTurrets Auto Const mandatory
Scene Property UC06_95_SS7Guard_PlayerApproachesDoor Auto Const mandatory
ReferenceAlias Property Alias_VVChamberDoor Auto Const mandatory
Scene Property UC06_570_System_TransferAccepted Auto Const mandatory
ReferenceAlias Property Alias_ChiefYasin Auto Const mandatory
ReferenceAlias Property Alias_MacIntyre Auto Const mandatory
ReferenceAlias Property Alias_MacIntyreSlateLookMarker Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
wwiseevent Property QST_Orlase_Ship_HostileTransmission_WEF Auto Const mandatory
ReferenceAlias Property Alias_OrlaseCaptainLocker Auto Const mandatory
LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Small Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC06_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Self.SetStage(10) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(105) ; #DEBUG_LINE_NO:18
  UC06_90_VaeVictis_Attract.Stop() ; #DEBUG_LINE_NO:19
  Self.SetStage(99) ; #DEBUG_LINE_NO:20
  Self.SetStage(200) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().Moveto(UC06_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:23
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(99) ; #DEBUG_LINE_NO:33
  Self.SetStage(105) ; #DEBUG_LINE_NO:34
  UC06_90_VaeVictis_Attract.Stop() ; #DEBUG_LINE_NO:35
  Alias_OrlaseShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:37
  Self.SetStage(200) ; #DEBUG_LINE_NO:39
  Self.SetStage(300) ; #DEBUG_LINE_NO:40
  Frontier_ModularREF.setlinkedref(None, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:41
  Frontier_ModularREF.Moveto(UC06_SpaceBattleTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:43
  Game.GetPlayer().Moveto(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:50
  Game.FadeOutGame(False, True, 0.0, 5.0, False) ; #DEBUG_LINE_NO:54
  TestMQ101HelperQuest.SetStage(10) ; #DEBUG_LINE_NO:56
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(99) ; #DEBUG_LINE_NO:67
  Self.SetStage(105) ; #DEBUG_LINE_NO:68
  UC06_90_VaeVictis_Attract.Stop() ; #DEBUG_LINE_NO:69
  Self.SetStage(550) ; #DEBUG_LINE_NO:70
  Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:71
  Game.GetPlayer().Moveto(UC06_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:73
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(99) ; #DEBUG_LINE_NO:83
  Self.SetStage(105) ; #DEBUG_LINE_NO:84
  UC06_90_VaeVictis_Attract.Stop() ; #DEBUG_LINE_NO:85
  Self.SetStage(120) ; #DEBUG_LINE_NO:86
  Self.SetStage(133) ; #DEBUG_LINE_NO:87
  Self.SetStage(200) ; #DEBUG_LINE_NO:88
  Game.GetPlayer().Moveto(UC05_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:89
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:90
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:91
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:92
  Self.SetStage(10) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_OrlaseShip.GetRef().DamageValue(Health, 1.0) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_OrlaseShip.GetRef().Moveto(Alias_playerShip.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0010_Item_00()
  Frontier_ModularREF.Moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:120
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:121
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:122
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0095_Item_00()
  UC06_95_SS7Guard_PlayerApproachesDoor.Start() ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0099_Item_00()
  Alias_VVChamberDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:147
  (Alias_FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:150
  Self.SetActive(True) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC06_90_VaeVictis_Attract.Start() ; #DEBUG_LINE_NO:160
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:161
  Self.SetObjectiveDisplayed(105, True, False) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:179
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:180
  UC06_100_VaeVictisIntro.Start() ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_NamelessAlias.Clear() ; #DEBUG_LINE_NO:189
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:191
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:192
  Self.SetObjectiveDisplayedAtTop(120) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0131_Item_00()
  Self.SetStage(135) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0135_Item_00()
  UC_PlayerKnows_VVSurvivedExecution.SetValue(1.0) ; #DEBUG_LINE_NO:218
EndFunction

Function Fragment_Stage_0136_Item_00()
  UC_PlayerKnows_HowVVFoundResearchTeam.SetValue(1.0) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0140_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:234
    UC06_140_PlayerExitsVVChamber.Start() ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:252
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:253
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:254
  If !Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:256
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:257
  EndIf ; #DEBUG_LINE_NO:
  Alias_ChiefYasin.GetRef().Enable(False) ; #DEBUG_LINE_NO:261
  Alias_MacIntyre.GetRef().Moveto(Alias_MacIntyreSlateLookMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:272
  uc06_questscript kmyQuest = __temp as uc06_questscript ; #DEBUG_LINE_NO:273
  spaceshipreference OrlaseShipRef = Alias_OrlaseShip.GetShipRef() ; #DEBUG_LINE_NO:277
  OrlaseShipRef.Enable(False) ; #DEBUG_LINE_NO:278
  OrlaseShipRef.SetUnconscious(True) ; #DEBUG_LINE_NO:279
  Alias_EthereaMines.EnableAll(False) ; #DEBUG_LINE_NO:282
  kmyQuest.PrepTurrets() ; #DEBUG_LINE_NO:283
  Alias_EthereaTurrets.EnableAll(False) ; #DEBUG_LINE_NO:284
  kmyQuest.RegisterForShipItemCollection() ; #DEBUG_LINE_NO:286
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:289
  MQ_TutorialQuest.SetStage(50) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0350_Item_00()
  spaceshipreference OrlaseShipRef = Alias_OrlaseShip.GetShipRef() ; #DEBUG_LINE_NO:300
  OrlaseShipRef.SetUnconscious(False) ; #DEBUG_LINE_NO:302
  OrlaseShipRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:303
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:311
    If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:312
      Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:313
    EndIf ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:316
    Self.SetObjectiveDisplayedAtTop(400) ; #DEBUG_LINE_NO:317
    Self.SetObjectiveDisplayed(401, True, False) ; #DEBUG_LINE_NO:318
    UC06_400_OrlaseGreetingScene.Start() ; #DEBUG_LINE_NO:320
    Alias_OrlaseShip.GetShipRef().EnablePartRepair(SpaceshipEngineHealth, False) ; #DEBUG_LINE_NO:323
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0403_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:332
  uc06_questscript kmyQuest = __temp as uc06_questscript ; #DEBUG_LINE_NO:333
  QST_Orlase_Ship_HostileTransmission_WEF.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:336
  kmyQuest.DeployTurrets() ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:345
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:346
    Self.SetObjectiveCompleted(401, True) ; #DEBUG_LINE_NO:347
    Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:348
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(430) && !Self.GetStageDone(440) ; #DEBUG_LINE_NO:353
    UC06_420_OrlaseEngineDisabled.Start() ; #DEBUG_LINE_NO:354
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0430_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:363
    Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:364
    Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:365
    Alias_Orlase.GetRef().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:370
    Alias_OrlaseCaptainLocker.GetRef().AddItem(LL_BE_ShipCaptainsLockerLoot_Small as Form, 1, False) ; #DEBUG_LINE_NO:373
  EndIf ; #DEBUG_LINE_NO:
  UC06_430_OrlaseBoardingScene.Start() ; #DEBUG_LINE_NO:378
EndFunction

Function Fragment_Stage_0440_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:386
  uc06_questscript kmyQuest = __temp as uc06_questscript ; #DEBUG_LINE_NO:387
  If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:390
    Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:391
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(430, False, False) ; #DEBUG_LINE_NO:394
  Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:395
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:396
  spaceshipreference OrlaseShip = Alias_OrlaseShip.GetShipRef() ; #DEBUG_LINE_NO:399
  If OrlaseShip.GetValue(SpaceshipCrew) > 0.0 ; #DEBUG_LINE_NO:401
    OrlaseShip.DamageValue(SpaceshipCrew, OrlaseShip.GetValue(SpaceshipCrew)) ; #DEBUG_LINE_NO:402
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.DisableTurrets() ; #DEBUG_LINE_NO:406
EndFunction

Function Fragment_Stage_0441_Item_00()
  Alias_OrlaseCabinDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:414
  Alias_OrlaseCabinDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:415
EndFunction

Function Fragment_Stage_0445_Item_00()
  If Self.GetStageDone(440) ; #DEBUG_LINE_NO:423
    Self.SetObjectiveDisplayed(445, True, False) ; #DEBUG_LINE_NO:424
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  If !Self.IsObjectiveCompleted(445) && Self.IsObjectiveDisplayed(445) ; #DEBUG_LINE_NO:433
    Self.SetObjectiveDisplayed(445, False, False) ; #DEBUG_LINE_NO:434
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0451_Item_00()
  If Self.IsObjectiveDisplayed(445) ; #DEBUG_LINE_NO:443
    Self.SetObjectiveCompleted(445, True) ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:453
  uc06_questscript kmyQuest = __temp as uc06_questscript ; #DEBUG_LINE_NO:454
  If !Self.IsObjectiveCompleted(150) && Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:459
    Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:460
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(401) && Self.IsObjectiveDisplayed(401) ; #DEBUG_LINE_NO:463
    Self.SetObjectiveDisplayed(401, False, False) ; #DEBUG_LINE_NO:464
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(420) && Self.IsObjectiveDisplayed(420) ; #DEBUG_LINE_NO:467
    Self.SetObjectiveDisplayed(420, False, False) ; #DEBUG_LINE_NO:468
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(430) && Self.IsObjectiveDisplayed(430) ; #DEBUG_LINE_NO:471
    Self.SetObjectiveDisplayed(430, False, False) ; #DEBUG_LINE_NO:472
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(445) && Self.IsObjectiveDisplayed(445) ; #DEBUG_LINE_NO:475
    Self.SetObjectiveDisplayed(445, False, False) ; #DEBUG_LINE_NO:476
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.DisableTurrets() ; #DEBUG_LINE_NO:480
  If !Self.GetStageDone(550) ; #DEBUG_LINE_NO:483
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:484
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:485
    If !Self.GetStageDone(430) && !Self.GetStageDone(440) ; #DEBUG_LINE_NO:488
      UC06_500_OrlaseDeath.Start() ; #DEBUG_LINE_NO:489
    EndIf ; #DEBUG_LINE_NO:
    Alias_OrlaseShip.GetRef().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:492
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:501
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:503
  Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:504
EndFunction

Function Fragment_Stage_0553_Item_00()
  UC_PlayerKnows_KaiserIsARobot.SetValue(1.0) ; #DEBUG_LINE_NO:512
EndFunction

Function Fragment_Stage_0560_Item_00()
  UC06_560_VV_ApproachTransfer.Start() ; #DEBUG_LINE_NO:520
  Alias_TransferSystemTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:523
  Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:525
  Self.SetObjectiveDisplayed(560, True, False) ; #DEBUG_LINE_NO:526
EndFunction

Function Fragment_Stage_0570_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:535
  Game.GetPlayer().RemoveItem(Alias_OrlaseID.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:537
  UC06_570_System_TransferAccepted.Start() ; #DEBUG_LINE_NO:539
EndFunction

Function Fragment_Stage_0580_Item_00()
  Alias_VaeVictis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:547
  Self.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:549
  Self.SetObjectiveDisplayed(580, True, False) ; #DEBUG_LINE_NO:550
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC07_HadrianVVRevealQuest.Start() ; #DEBUG_LINE_NO:559
  UC07.Start() ; #DEBUG_LINE_NO:560
  Game.AddAchievement(12) ; #DEBUG_LINE_NO:563
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:565
  Self.Stop() ; #DEBUG_LINE_NO:566
EndFunction
