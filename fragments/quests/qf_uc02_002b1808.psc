ScriptName Fragments:Quests:QF_UC02_002B1808 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property PUC02_DEBUG_CollectShipUpgrades Auto Const mandatory
Scene Property UC02_090_HerathAttractScene Auto Const mandatory
Scene Property UC02_300_HadrianAttractScene Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
Quest Property UC02_TrackerQuest Auto Const mandatory
ObjectReference Property DebugMarker01 Auto Const
ObjectReference Property DebugMarker02 Auto Const
Scene Property UC02_700a_HeadingToTerrormorph Auto Const mandatory
Explosion Property CarExplosion Auto Const
ObjectReference Property DebugMarker03 Auto Const
ReferenceAlias Property Alias_ExplosionSource Auto Const mandatory
Scene Property UC02_700_TerrormorphDead Auto Const mandatory
ObjectReference Property DebugMarker04 Auto Const
Scene Property UC02_600_HadrianRadioScene Auto Const mandatory
LeveledItem Property TestVSWeapons Auto Const mandatory
Message Property UC02_DEBUG_HadrianCantMove Auto Const
Quest Property UC03 Auto Const mandatory
ReferenceAlias Property Alias_Antennas Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Scene Property UC02_610_PlayerTunedTrackingSystem Auto Const mandatory
ObjectReference Property DebugMarker05 Auto Const
ReferenceAlias Property Alias_SignalTerminal Auto Const mandatory
ReferenceAlias Property Alias_FuelTankObj Auto Const mandatory
ReferenceAlias Property Alias_LurePathingTarget Auto Const mandatory
RefCollectionAlias Property Alias_PowerBoxes Auto Const mandatory
GlobalVariable Property UC02_PowerBoxesTotal Auto Const mandatory
GlobalVariable Property UC02_PowerBoxesActivated Auto Const mandatory
Scene Property UC02_301_HadrianAttractScene Auto Const mandatory
GlobalVariable Property UC_PlayerKnowsHadriansPast Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Scene Property UC02_700b_TerrormorphKilled_CompanionResponse Auto Const mandatory
ReferenceAlias Property Alias_ShipTech Auto Const mandatory
GlobalVariable Property UC02_HadrianKnowsPlayerIsVanguard Auto Const mandatory
Scene Property UC02_607_TanksPrimed Auto Const mandatory
ObjectReference Property TerrTeleMarker Auto Const
Message Property UC02_DEBUG_CombatPolish Auto Const mandatory
ReferenceAlias Property Alias_HadrianGenetag Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCellSample Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Message Property UC02_DEBUG_TrackingTerminalBusted Auto Const mandatory
Quest Property UC02_ScannerQuest Auto Const mandatory
GlobalVariable Property UC02_RewardCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property UC02_DebugMarker07 Auto Const mandatory
ObjectReference Property UC02_HadrianMarker_Scene750 Auto Const mandatory
Quest Property UC01 Auto Const mandatory
LeveledItem Property LL_UC01_VanguardNewRecruitKit Auto Const mandatory
Quest Property CF01 Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
GlobalVariable Property UC02_UCShipComponentsUnlocked Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphTempFriendAlias Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const mandatory
Armor Property Spacesuit_UCVanguard_LightArmored Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_Londinion Auto Const mandatory
wwiseevent Property NPC_Terrormorph_Scream_WEF Auto Const mandatory
Weather Property WeatherThunderstormC01H050D015 Auto Const mandatory
ReferenceAlias Property Alias_PlayerTerrormorphFriendAlias Auto Const mandatory
ReferenceAlias Property Alias_HadrianShipEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_NATarmacShipEnableMarker Auto Const mandatory
ObjectReference Property UC03_TerrormorphSpawn_Spaceport Auto Const mandatory
ReferenceAlias Property Alias_ChiefHerath Auto Const mandatory
ObjectReference Property UC02_ChiefHerath_TeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_ObjMarker200 Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphPreyFriendAlias Auto Const mandatory
ReferenceAlias Property Alias_RevealCritter Auto Const mandatory
ReferenceAlias Property Alias_TauCetiWeatherTrigger Auto Const mandatory
RefCollectionAlias Property Alias_SecurityBldgDoors Auto Const mandatory
LeveledItem Property LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality Auto Const mandatory
ReferenceAlias Property Alias_SecurityOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SecurityOfficeDoorCollision Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0210_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:8
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().MoveTo(DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:16
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:17
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:18
  Self.SetStage(19) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:29
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:30
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:33
  Self.SetStage(200) ; #DEBUG_LINE_NO:34
  Game.GetPlayer().MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
  Self.SetStage(19) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:46
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:47
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:50
  Self.SetStage(200) ; #DEBUG_LINE_NO:51
  Self.SetStage(300) ; #DEBUG_LINE_NO:52
  UC02_300_HadrianAttractScene.Stop() ; #DEBUG_LINE_NO:53
  Self.SetStage(310) ; #DEBUG_LINE_NO:54
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:55
  Self.SetStage(19) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0004_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:66
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:67
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:70
  Self.SetStage(200) ; #DEBUG_LINE_NO:71
  Self.SetStage(300) ; #DEBUG_LINE_NO:72
  UC02_300_HadrianAttractScene.Stop() ; #DEBUG_LINE_NO:73
  Self.SetStage(310) ; #DEBUG_LINE_NO:74
  Self.SetStage(410) ; #DEBUG_LINE_NO:75
  Self.SetStage(420) ; #DEBUG_LINE_NO:76
  Self.SetStage(500) ; #DEBUG_LINE_NO:77
  Game.GetPlayer().MoveTo(DebugMarker04, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:78
  Self.SetStage(19) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:88
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:89
  Self.SetStage(200) ; #DEBUG_LINE_NO:90
  Game.GetPlayer().MoveTo(DebugMarker05, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:91
  Self.SetStage(19) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0006_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:101
  Self.SetStage(200) ; #DEBUG_LINE_NO:102
  Self.SetStage(300) ; #DEBUG_LINE_NO:103
  Self.SetStage(310) ; #DEBUG_LINE_NO:104
  Self.SetStage(410) ; #DEBUG_LINE_NO:105
  Self.SetStage(420) ; #DEBUG_LINE_NO:106
  Self.SetStage(500) ; #DEBUG_LINE_NO:107
  Self.SetStage(600) ; #DEBUG_LINE_NO:108
  Self.SetStage(607) ; #DEBUG_LINE_NO:109
  Game.GetPlayer().MoveTo(DebugMarker04, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:110
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:111
  UC02_600_HadrianRadioScene.Stop() ; #DEBUG_LINE_NO:112
  UC02_300_HadrianAttractScene.Stop() ; #DEBUG_LINE_NO:113
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:114
  Self.SetStage(19) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:124
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:125
  Self.SetStage(200) ; #DEBUG_LINE_NO:126
  Self.SetStage(300) ; #DEBUG_LINE_NO:127
  Self.SetStage(310) ; #DEBUG_LINE_NO:128
  Self.SetStage(410) ; #DEBUG_LINE_NO:129
  Self.SetStage(420) ; #DEBUG_LINE_NO:130
  Self.SetStage(500) ; #DEBUG_LINE_NO:131
  Self.SetStage(700) ; #DEBUG_LINE_NO:132
  Self.SetStage(740) ; #DEBUG_LINE_NO:133
  Self.SetStage(750) ; #DEBUG_LINE_NO:134
  Game.GetPlayer().MoveTo(UC02_DebugMarker07, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:135
  Alias_Hadrian.GetRef().MoveTo(UC02_HadrianMarker_Scene750, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:136
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:137
  UC02_600_HadrianRadioScene.Stop() ; #DEBUG_LINE_NO:138
  UC02_300_HadrianAttractScene.Stop() ; #DEBUG_LINE_NO:139
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:140
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:141
  Self.SetStage(19) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0019_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:151
  PlayACT.AddPerk(BackgroundSoldier, False) ; #DEBUG_LINE_NO:152
  PlayACT.AddPerk(BackgroundCombatMedic, False) ; #DEBUG_LINE_NO:153
  PlayACT.AddPerk(BackgroundXenobiologist, False) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:170
  Self.SetActive(True) ; #DEBUG_LINE_NO:171
  Alias_NATarmacShipEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:174
  Alias_ChiefHerath.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:177
  Alias_ShipTech.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC02_090_HerathAttractScene.Start() ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_ShipTech.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:194
  Alias_ChiefHerath.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:195
  UC02_090_HerathAttractScene.Stop() ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0129_Item_00()
  PUC02_DEBUG_CollectShipUpgrades.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Hadrian.GetRef().Enable(False) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:221
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:222
  ObjectReference PlayShip = Alias_PlayerShip.GetRef() ; #DEBUG_LINE_NO:223
  PlayShip.AddItem(Alias_Antennas.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:224
  PlayShip.AddItem(LL_UC01_VanguardNewRecruitKit as Form, 1, False) ; #DEBUG_LINE_NO:225
  Alias_HadrianShipEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:226
  Alias_TauCetiWeatherTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0250_Item_00()
  NPC_Terrormorph_Scream_WEF.Play(Alias_ObjMarker200.GetRef(), None, None) ; #DEBUG_LINE_NO:243
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:245
  If !Self.GetStageDone(302) ; #DEBUG_LINE_NO:246
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:247
    Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.GetStageDone(301) ; #DEBUG_LINE_NO:257
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:258
    Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:259
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:260
    UC02_300_HadrianAttractScene.Start() ; #DEBUG_LINE_NO:261
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:270
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:271
    Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:272
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:273
    UC02_301_HadrianAttractScene.Start() ; #DEBUG_LINE_NO:274
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0302_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0407_Item_00()
  UC_PlayerKnowsHadriansPast.SetValue(1.0) ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_0412_Item_00()
  Self.SetStage(410) ; #DEBUG_LINE_NO:299
  Self.SetStage(703) ; #DEBUG_LINE_NO:300
  If !Self.GetStageDone(705) ; #DEBUG_LINE_NO:302
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:303
    Self.SetObjectiveDisplayed(699, True, False) ; #DEBUG_LINE_NO:304
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0440_Item_00()
  UC02_HadrianKnowsPlayerIsVanguard.SetValue(1.0) ; #DEBUG_LINE_NO:313
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:321
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:322
  Self.SetStage(422) ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:331
    Self.SetStage(599) ; #DEBUG_LINE_NO:332
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0599_Item_00()
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:341
    Self.SetObjectiveDisplayedAtTop(500) ; #DEBUG_LINE_NO:342
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:351
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:352
  If Self.GetStageDone(500) && !Self.GetStageDone(700) ; #DEBUG_LINE_NO:355
    Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:356
    Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:357
    UC02_600_HadrianRadioScene.Start() ; #DEBUG_LINE_NO:358
  EndIf ; #DEBUG_LINE_NO:
  Alias_Terrormorph.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:361
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:369
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:370
  kmyQuest.SetUpPowerboxObjective() ; #DEBUG_LINE_NO:374
  Self.SetObjectiveCompleted(605, True) ; #DEBUG_LINE_NO:375
  Self.SetObjectiveCompleted(607, True) ; #DEBUG_LINE_NO:376
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:378
    Self.SetObjectiveDisplayed(601, True, False) ; #DEBUG_LINE_NO:379
  EndIf ; #DEBUG_LINE_NO:
  If UC02_ScannerQuest.IsRunning() ; #DEBUG_LINE_NO:382
    (UC02_ScannerQuest as uc02_scannerquestscript).DisplayDistanceMessage() ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:392
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:393
  Self.SetObjectiveDisplayed(605, True, False) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0606_Item_00()
  If !Self.GetStageDone(630) && !Self.GetStageDone(700) ; #DEBUG_LINE_NO:403
    Alias_TerrormorphTempFriendAlias.ForceRefTo(Alias_Terrormorph.GetRef()) ; #DEBUG_LINE_NO:404
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0607_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:413
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:414
  kmyQuest.SealSecurityBldgDoors(True) ; #DEBUG_LINE_NO:417
  Actor TerREF = Alias_Terrormorph.GetActorRef() ; #DEBUG_LINE_NO:419
  TerREF.SetGhost(True) ; #DEBUG_LINE_NO:420
  TerREF.Enable(False) ; #DEBUG_LINE_NO:421
  TerREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:422
  UC02_600_HadrianRadioScene.Stop() ; #DEBUG_LINE_NO:424
  UC02_607_TanksPrimed.Start() ; #DEBUG_LINE_NO:425
  Self.SetObjectiveCompleted(605, True) ; #DEBUG_LINE_NO:427
  Self.SetObjectiveDisplayed(607, True, False) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0608_Item_00()
  Alias_Terrormorph.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:436
  Alias_SecurityOfficeEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:439
EndFunction

Function Fragment_Stage_0609_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:447
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:448
  Actor TerREF = Alias_Terrormorph.GetActorRef() ; #DEBUG_LINE_NO:451
  TerREF.SetGhost(False) ; #DEBUG_LINE_NO:452
  TerREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:453
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_SignalTerminal.GetRef().Unlock(False) ; #DEBUG_LINE_NO:461
  Self.SetObjectiveDisplayed(610, True, False) ; #DEBUG_LINE_NO:462
EndFunction

Function Fragment_Stage_0611_Item_00()
  Alias_RevealCritter.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:470
EndFunction

Function Fragment_Stage_0612_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:478
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:479
  kmyQuest.SealSecurityBldgDoors(False) ; #DEBUG_LINE_NO:483
EndFunction

Function Fragment_Stage_0615_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:491
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:492
  If !Alias_FuelTankObj.GetRef().IsDisabled() ; #DEBUG_LINE_NO:495
    Self.SetObjectiveDisplayed(615, True, False) ; #DEBUG_LINE_NO:496
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:505
    UC02_607_TanksPrimed.Start() ; #DEBUG_LINE_NO:506
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:509
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:517
  uc02_questscript kmyQuest = __temp as uc02_questscript ; #DEBUG_LINE_NO:518
  Actor TerREF = Alias_Terrormorph.GetActorRef() ; #DEBUG_LINE_NO:522
  TerREF.SetGhost(False) ; #DEBUG_LINE_NO:523
  TerREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:524
  Alias_TerrormorphTempFriendAlias.Clear() ; #DEBUG_LINE_NO:525
  Alias_PlayerTerrormorphFriendAlias.Clear() ; #DEBUG_LINE_NO:526
  Alias_TerrormorphPreyFriendAlias.Clear() ; #DEBUG_LINE_NO:527
  Self.SetStage(599) ; #DEBUG_LINE_NO:529
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(601, True) ; #DEBUG_LINE_NO:537
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveCompleted(615, True) ; #DEBUG_LINE_NO:545
EndFunction

Function Fragment_Stage_0700_Item_00()
  UC02_TrackerQuest.SetStage(1000) ; #DEBUG_LINE_NO:553
  UC02_607_TanksPrimed.Stop() ; #DEBUG_LINE_NO:554
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:555
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:557
    Self.SetObjectiveDisplayed(699, True, False) ; #DEBUG_LINE_NO:558
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(420) ; #DEBUG_LINE_NO:561
    Self.SetObjectiveDisplayed(420, False, False) ; #DEBUG_LINE_NO:562
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(601) ; #DEBUG_LINE_NO:565
    Self.SetObjectiveDisplayed(601, False, False) ; #DEBUG_LINE_NO:566
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(602) ; #DEBUG_LINE_NO:569
    Self.SetObjectiveDisplayed(602, False, False) ; #DEBUG_LINE_NO:570
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(605) ; #DEBUG_LINE_NO:573
    Self.SetObjectiveDisplayed(605, False, False) ; #DEBUG_LINE_NO:574
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(610) ; #DEBUG_LINE_NO:577
    Self.SetObjectiveDisplayed(610, False, False) ; #DEBUG_LINE_NO:578
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(615) ; #DEBUG_LINE_NO:581
    Self.SetObjectiveDisplayed(615, False, False) ; #DEBUG_LINE_NO:582
  EndIf ; #DEBUG_LINE_NO:
  UC02_700b_TerrormorphKilled_CompanionResponse.Start() ; #DEBUG_LINE_NO:586
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:589
EndFunction

Function Fragment_Stage_0705_Item_00()
  If Self.GetStageDone(500) || Self.GetStageDone(412) ; #DEBUG_LINE_NO:597
    Self.SetObjectiveCompleted(699, True) ; #DEBUG_LINE_NO:598
    Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:599
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:608
  Self.SetObjectiveDisplayed(710, True, False) ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0740_Item_00()
  Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False, Alias_Hadrian.GetRef()) ; #DEBUG_LINE_NO:617
  Self.SetStage(710) ; #DEBUG_LINE_NO:618
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:620
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:621
  Self.SetObjectiveDisplayed(710, True, False) ; #DEBUG_LINE_NO:622
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(710, True) ; #DEBUG_LINE_NO:630
  Self.SetObjectiveDisplayed(750, True, False) ; #DEBUG_LINE_NO:631
EndFunction

Function Fragment_Stage_0752_Item_00()
  UC_PlayerKnows_Londinion.SetValue(1.0) ; #DEBUG_LINE_NO:639
EndFunction

Function Fragment_Stage_0770_Item_00()
  Game.GetPlayer().AddItem(Alias_HadrianGenetag.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:647
  Alias_TauCetiWeatherTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:650
EndFunction

Function Fragment_Stage_0800_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:658
  PlayREF.AddItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:659
  PlayREF.AddItem(Credits as Form, UC02_RewardCredits.GetValueInt(), False) ; #DEBUG_LINE_NO:660
  Self.SetObjectiveCompleted(750, True) ; #DEBUG_LINE_NO:662
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:663
  Alias_NATarmacShipEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:666
EndFunction

Function Fragment_Stage_0801_Item_00()
  Alias_Hadrian.GetRef().Disable(False) ; #DEBUG_LINE_NO:674
  Alias_HadrianShipEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:675
  Alias_SecurityOfficeEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:678
EndFunction

Function Fragment_Stage_0860_Item_00()
  CF01.SetStage(205) ; #DEBUG_LINE_NO:686
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:694
  UC03.Start() ; #DEBUG_LINE_NO:695
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:698
  PlayACT.AddItem(LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality as Form, 1, False) ; #DEBUG_LINE_NO:699
  ObjectReference PlayShip = Alias_PlayerShip.GetRef() ; #DEBUG_LINE_NO:702
  PlayShip.RemoveItem(Alias_Antennas.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:703
  uc03questscript NextQuest = UC03 as uc03questscript ; #DEBUG_LINE_NO:706
  NextQuest.TerrormorphCellSample.ForceRefTo(Alias_TerrormorphCellSample.GetRef()) ; #DEBUG_LINE_NO:707
  NextQuest.HadrianGenetag.ForceRefTo(Alias_HadrianGenetag.GetRef()) ; #DEBUG_LINE_NO:708
  UC02_UCShipComponentsUnlocked.SetValue(1.0) ; #DEBUG_LINE_NO:711
  Game.AddAchievement(11) ; #DEBUG_LINE_NO:714
  Alias_TauCetiWeatherTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:717
  Self.Stop() ; #DEBUG_LINE_NO:719
EndFunction
