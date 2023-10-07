ScriptName Fragments:Quests:QF_MQ301_002A8001 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ301StartMarker Auto Const mandatory
Key Property MQ301MoonBaseKey Auto Const mandatory
Scene Property MQ301_001_LaunchScene Auto Const mandatory
ReferenceAlias Property Alias_MoonTransmitter Auto Const mandatory
Scene Property MQ301_002_CompanionReaction Auto Const mandatory
Scene Property MQ301_003_CompanionReaction_TruthAboutEarth Auto Const mandatory
ObjectReference Property MQ301ExtNASAMarker Auto Const mandatory
ObjectReference Property MQ301InteriorNASAMarker Auto Const mandatory
Quest Property MQ302 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_Artifact Auto Const mandatory
Scene Property MQ301_004_StarbornScene Auto Const mandatory
ObjectReference Property NASAMapMarkerREF Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
LocationAlias Property Alias_NASALocation Auto Const mandatory
Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
Location Property LC165BuriedTempleLocation Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const mandatory
Key Property MQ301NasaKey Auto Const mandatory
Key Property MQ301PrototypeKey Auto Const mandatory
ReferenceAlias Property Alias_ReleaseArtifactSwitch Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
RefCollectionAlias Property Alias_StarbornAttackers Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ReferenceAlias Property Alias_GravDriveActivator Auto Const mandatory
ReferenceAlias Property Alias_GravDriveDoor Auto Const mandatory
ReferenceAlias Property Alias_GravDriveAnimHelper Auto Const mandatory
ReferenceAlias Property Alias_MoonMapMarker Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ReferenceAlias Property Alias_GravDriveSoundMarker Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
wwiseevent Property WwiseEvent_ShakeController_p75_p75_03 Auto Const mandatory
wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
wwiseevent Property OE_EarthquakeSound Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:13
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:14
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False) ; #DEBUG_LINE_NO:17
  Self.SetStage(10) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:27
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:28
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:29
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:33
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:34
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False) ; #DEBUG_LINE_NO:38
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False) ; #DEBUG_LINE_NO:39
  Self.SetStage(130) ; #DEBUG_LINE_NO:41
  Self.SetStage(132) ; #DEBUG_LINE_NO:42
  Game.GetPlayer().moveto(MQ301ExtNASAMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:52
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:53
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:54
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:58
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:59
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:60
  Self.SetStage(137) ; #DEBUG_LINE_NO:63
  Game.GetPlayer().moveto(MQ301InteriorNASAMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:75
  ObjectReference MoonMapMarkerREF = Alias_MoonMapMarker.GetRef() ; #DEBUG_LINE_NO:77
  MoonMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:79
  MoonMapMarkerREF.AddToMapScanned(False) ; #DEBUG_LINE_NO:80
  MoonMapMarkerREF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:81
  Alias_MoonTransmitter.GetRef().Enable(False) ; #DEBUG_LINE_NO:83
  Self.SetActive(True) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:93
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(12, True, False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:110
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:111
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0032_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:122
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:123
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0033_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:134
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:135
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0034_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:146
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:147
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0035_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:158
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:159
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0036_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:170
  mq301script kmyQuest = __temp as mq301script ; #DEBUG_LINE_NO:171
  kmyQuest.UpdateMoonLogCount() ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(12, True) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:190
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:191
  Alias_MoonTransmitter.GetRef().Enable(False) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0120_Item_00()
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:201
  Alias_MoonTransmitter.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:203
  MQ301_001_LaunchScene.Start() ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:214
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:215
  NASAMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:217
  NASAMapMarkerREF.AddToMapScanned(False) ; #DEBUG_LINE_NO:218
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:219
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0130_Item_01()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:229
  NASAMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:231
  NASAMapMarkerREF.AddToMapScanned(False) ; #DEBUG_LINE_NO:232
  NASAMapMarkerREF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:233
  Game.GetPlayer().additem(MQ301NasaKey as Form, 1, False) ; #DEBUG_LINE_NO:235
  Self.SetActive(True) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0132_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:245
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:246
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:249
  Self.SetObjectiveDisplayed(12, False, False) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:261
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0137_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:270
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:271
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:274
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:275
  kmyQuest.ShowHelpMessage("Flashlight") ; #DEBUG_LINE_NO:277
  ObjectReference ArtifactPlacementREF = Alias_Artifact.GetRef() ; #DEBUG_LINE_NO:280
  ObjectReference AttachREF = Alias_GravDriveActivator.GetRef() ; #DEBUG_LINE_NO:281
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifactandAttach(13, ArtifactPlacementREF, AttachREF) ; #DEBUG_LINE_NO:282
  Alias_Artifact.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:283
  ArtifactREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:284
  ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:285
EndFunction

Function Fragment_Stage_0141_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:293
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:294
EndFunction

Function Fragment_Stage_0142_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:302
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:303
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0143_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:312
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:313
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:314
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_0144_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:323
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:324
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:325
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:326
  Game.GetPlayer().additem(MQ301PrototypeKey as Form, 1, False) ; #DEBUG_LINE_NO:328
  Self.SetStage(150) ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_0145_Item_00()
  MQ301_003_CompanionReaction_TruthAboutEarth.Start() ; #DEBUG_LINE_NO:338
EndFunction

Function Fragment_Stage_0147_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:346
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:347
  kmyQuest.ShowHelpMessage("ZeroG") ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:366
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:367
  Alias_Artifact.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:369
  Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(0.0) ; #DEBUG_LINE_NO:370
  Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(1.0) ; #DEBUG_LINE_NO:371
  Alias_GravDriveSoundMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0170_Item_00()
  ObjectReference GravDriveDoorREF = Alias_GravDriveDoor.GetRef() ; #DEBUG_LINE_NO:380
  ObjectReference GravDriveAnimHelperREF = Alias_GravDriveAnimHelper.GetRef() ; #DEBUG_LINE_NO:381
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:382
  Bool bAnimationsPlayed = True ; #DEBUG_LINE_NO:384
  If GravDriveDoorREF.PlayAnimation("Open") ; #DEBUG_LINE_NO:386
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    bAnimationsPlayed = False ; #DEBUG_LINE_NO:389
  EndIf ; #DEBUG_LINE_NO:
  If GravDriveAnimHelperREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:392
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    bAnimationsPlayed = False ; #DEBUG_LINE_NO:395
  EndIf ; #DEBUG_LINE_NO:
  If bAnimationsPlayed == False ; #DEBUG_LINE_NO:399
    PlayerREF.additem(Alias_Artifact.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:400
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  AudioLogsQuest_MQ301_Earth09.Stop() ; #DEBUG_LINE_NO:409
  AudioLogsQuest_MQ301_Earth10.Stop() ; #DEBUG_LINE_NO:410
  MQ301_004_StarbornScene.Start() ; #DEBUG_LINE_NO:411
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:414
  Game.ShakeCamera(None, 0.25, 5.0) ; #DEBUG_LINE_NO:415
  WwiseEvent_ShakeController_p5_p5_05.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:416
  OE_EarthquakeSound.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:417
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:419
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:420
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(13) ; #DEBUG_LINE_NO:423
  MQ00_ArtifactsHolder.AddRef(Alias_Artifact.GetRef()) ; #DEBUG_LINE_NO:426
  MQ302.SetStage(10) ; #DEBUG_LINE_NO:429
  Alias_StarbornAttackers.EnableAll(False) ; #DEBUG_LINE_NO:432
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:440
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:441
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:444
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:445
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:447
  HunterREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:448
  HunterREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:449
  HunterREF.Enable(False) ; #DEBUG_LINE_NO:450
  EmissaryREF.Disable(False) ; #DEBUG_LINE_NO:451
  EmissaryREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:452
  EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:453
  EmissaryREF.Enable(False) ; #DEBUG_LINE_NO:454
EndFunction

Function Fragment_Stage_0500_Item_00()
  If MQ207B.GetStageDone(1000) ; #DEBUG_LINE_NO:463
    Self.SetStage(1000) ; #DEBUG_LINE_NO:464
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(900) ; #DEBUG_LINE_NO:466
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:475
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:476
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllOBjectives() ; #DEBUG_LINE_NO:484
  LC165BuriedTempleSpaceLocation.Reset() ; #DEBUG_LINE_NO:487
  LC165BuriedTempleLocation.Reset() ; #DEBUG_LINE_NO:488
  Int iChoice = MQ302_SidedWithChoice.GetValueInt() ; #DEBUG_LINE_NO:491
  If iChoice == 0 ; #DEBUG_LINE_NO:492
    MQ302b.SetStage(20) ; #DEBUG_LINE_NO:494
  ElseIf iChoice == 1 ; #DEBUG_LINE_NO:495
    MQ302b.SetStage(21) ; #DEBUG_LINE_NO:497
  Else ; #DEBUG_LINE_NO:
    MQ302b.SetStage(22) ; #DEBUG_LINE_NO:500
  EndIf ; #DEBUG_LINE_NO:
  Game.AddAchievement(9) ; #DEBUG_LINE_NO:504
  Self.Stop() ; #DEBUG_LINE_NO:506
EndFunction
