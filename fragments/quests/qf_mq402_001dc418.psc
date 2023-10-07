ScriptName Fragments:Quests:QF_MQ402_001DC418 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker03 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker04 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker06 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker05 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker06 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker05 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker04 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker03 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker04 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker05 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker06 Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
Quest Property MQ302 Auto Const mandatory
ReferenceAlias Property Alias_Scorpius Auto Const mandatory
ReferenceAlias Property Alias_Helix Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Scene Property MQ402_003_HunterEmissary Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Quest Property MQ_TempleQuest_01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator03 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator04 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator05 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator06 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArmillary Auto Const mandatory
ObjectReference Property LC165_Adversary01ShipStartMarker Auto Const mandatory
ObjectReference Property LC165_Adversary02ShipStartMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_Starborn02 Auto Const mandatory
ReferenceAlias Property Alias_Starborn04 Auto Const mandatory
ReferenceAlias Property Alias_Starborn06 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker04 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker06 Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  MQAlllowArmillaryGravDrive.SetValueInt(1) ; #DEBUG_LINE_NO:10
  MQ_EmissaryRandom.SetValueInt(1) ; #DEBUG_LINE_NO:13
  MQ_EmissaryRevealed.SetValueInt(1) ; #DEBUG_LINE_NO:14
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(0) ; #DEBUG_LINE_NO:17
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(1) ; #DEBUG_LINE_NO:18
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(2) ; #DEBUG_LINE_NO:19
  Self.SetActive(True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ_TempleQuest_01.Start() ; #DEBUG_LINE_NO:29
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:39
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(5, Alias_ArtifactActivator01.GetRef()) ; #DEBUG_LINE_NO:42
  Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF) ; #DEBUG_LINE_NO:43
  ArtifactActivator01REF.EnableNoWait(False) ; #DEBUG_LINE_NO:44
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(6, Alias_ArtifactActivator02.GetRef()) ; #DEBUG_LINE_NO:46
  Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF) ; #DEBUG_LINE_NO:47
  ArtifactActivator02REF.EnableNoWait(False) ; #DEBUG_LINE_NO:48
  ObjectReference ArtifactActivator03REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator03.GetRef()) ; #DEBUG_LINE_NO:50
  Alias_ArtifactActivator03.ForceRefTo(ArtifactActivator03REF) ; #DEBUG_LINE_NO:51
  ArtifactActivator03REF.EnableNoWait(False) ; #DEBUG_LINE_NO:52
  ObjectReference ArtifactActivator04REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator04.GetRef()) ; #DEBUG_LINE_NO:54
  Alias_ArtifactActivator04.ForceRefTo(ArtifactActivator04REF) ; #DEBUG_LINE_NO:55
  ArtifactActivator04REF.EnableNoWait(False) ; #DEBUG_LINE_NO:56
  ObjectReference ArtifactActivator05REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(11, Alias_ArtifactActivator05.GetRef()) ; #DEBUG_LINE_NO:58
  Alias_ArtifactActivator05.ForceRefTo(ArtifactActivator05REF) ; #DEBUG_LINE_NO:59
  ArtifactActivator05REF.EnableNoWait(False) ; #DEBUG_LINE_NO:60
  ObjectReference ArtifactActivator06REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(12, Alias_ArtifactActivator06.GetRef()) ; #DEBUG_LINE_NO:62
  Alias_ArtifactActivator06.ForceRefTo(ArtifactActivator06REF) ; #DEBUG_LINE_NO:63
  ArtifactActivator06REF.EnableNoWait(False) ; #DEBUG_LINE_NO:64
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:67
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:68
  Alias_OpenCaveEnableMarker03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:69
  Alias_OpenCaveEnableMarker04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:70
  Alias_OpenCaveEnableMarker05.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:71
  Alias_OpenCaveEnableMarker06.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:72
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:74
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:75
  Alias_ClosedCaveEnableMarker03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:76
  Alias_ClosedCaveEnableMarker04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:77
  Alias_ClosedCaveEnableMarker05.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:78
  Alias_ClosedCaveEnableMarker06.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:79
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef() ; #DEBUG_LINE_NO:82
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:83
  ObjectReference MapMarker03REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:84
  ObjectReference MapMarker04REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:85
  ObjectReference MapMarker05REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:86
  ObjectReference MapMarker06REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:87
  MapMarker01REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:89
  MapMarker01REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:90
  MapMarker01REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:91
  MapMarker02REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:93
  MapMarker02REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:94
  MapMarker02REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:95
  MapMarker03REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:97
  MapMarker03REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:98
  MapMarker03REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:99
  MapMarker04REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:101
  MapMarker04REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:102
  MapMarker04REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:103
  MapMarker05REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:105
  MapMarker05REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:106
  MapMarker05REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:107
  MapMarker06REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:109
  MapMarker06REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:110
  MapMarker06REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:119
  If Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:122
    Self.SetStage(500) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(5, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:127
  ArtifactREF01.Enable(False) ; #DEBUG_LINE_NO:128
  Game.GetPlayer().additem(ArtifactREF01 as Form, 1, False) ; #DEBUG_LINE_NO:129
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(5) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:140
  If Self.GetStageDone(110) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:143
    Self.SetStage(500) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(6, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:148
  ArtifactREF02.Enable(False) ; #DEBUG_LINE_NO:149
  Game.GetPlayer().additem(ArtifactREF02 as Form, 1, False) ; #DEBUG_LINE_NO:150
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(6) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0122_Item_00()
  Actor Starborn02REF = Alias_Starborn02.GetActorRef() ; #DEBUG_LINE_NO:161
  Starborn02REF.Enable(False) ; #DEBUG_LINE_NO:163
  Starborn02REF.moveto(Alias_ArtifactRoomSpawnMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:164
  MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:175
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:178
    Self.SetStage(500) ; #DEBUG_LINE_NO:179
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(8, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:183
  ArtifactREF03.Enable(False) ; #DEBUG_LINE_NO:184
  Game.GetPlayer().additem(ArtifactREF03 as Form, 1, False) ; #DEBUG_LINE_NO:185
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(8) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:196
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(150) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:199
    Self.SetStage(500) ; #DEBUG_LINE_NO:200
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(9, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:204
  ArtifactREF04.Enable(False) ; #DEBUG_LINE_NO:205
  Game.GetPlayer().additem(ArtifactREF04 as Form, 1, False) ; #DEBUG_LINE_NO:206
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(9) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0142_Item_00()
  Actor Starborn04REF = Alias_Starborn04.GetActorRef() ; #DEBUG_LINE_NO:217
  Starborn04REF.Enable(False) ; #DEBUG_LINE_NO:219
  Starborn04REF.moveto(Alias_ArtifactRoomSpawnMarker04.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:220
  MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:231
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:234
    Self.SetStage(500) ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF05 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(11, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:239
  ArtifactREF05.Enable(False) ; #DEBUG_LINE_NO:240
  Game.GetPlayer().additem(ArtifactREF05 as Form, 1, False) ; #DEBUG_LINE_NO:241
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(11) ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:252
  If Self.GetStageDone(110) == True && Self.GetStageDone(120) == True && Self.GetStageDone(130) == True && Self.GetStageDone(140) == True && Self.GetStageDone(150) == True ; #DEBUG_LINE_NO:255
    Self.SetStage(500) ; #DEBUG_LINE_NO:256
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF06 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(12, MQHoldingCellCenterMarker) ; #DEBUG_LINE_NO:260
  ArtifactREF06.Enable(False) ; #DEBUG_LINE_NO:261
  Game.GetPlayer().additem(ArtifactREF06 as Form, 1, False) ; #DEBUG_LINE_NO:262
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(12) ; #DEBUG_LINE_NO:265
EndFunction

Function Fragment_Stage_0162_Item_00()
  Actor Starborn06REF = Alias_Starborn06.GetActorRef() ; #DEBUG_LINE_NO:273
  Starborn06REF.Enable(False) ; #DEBUG_LINE_NO:275
  Starborn06REF.moveto(Alias_ArtifactRoomSpawnMarker06.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:276
  MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:279
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:287
  mq402script kmyQuest = __temp as mq402script ; #DEBUG_LINE_NO:288
  kmyQuest.EnableLodgeActors() ; #DEBUG_LINE_NO:292
  ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef() ; #DEBUG_LINE_NO:295
  ArmillaryREF.DisableNoWait(False) ; #DEBUG_LINE_NO:296
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:298
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:299
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:300
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:301
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:302
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:303
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0500_Item_01()
  ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef() ; #DEBUG_LINE_NO:313
  ArmillaryREF.DisableNoWait(False) ; #DEBUG_LINE_NO:314
  Self.SetStage(600) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:324
  mq402script kmyQuest = __temp as mq402script ; #DEBUG_LINE_NO:325
  kmyQuest.AddLodgeArtifacts(Game.GetPlayer()) ; #DEBUG_LINE_NO:328
  MQ_TempleQuest_01.Start() ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_0600_Item_00()
  spaceshipreference HunterShipREF = Alias_Scorpius.GetShipReference() ; #DEBUG_LINE_NO:338
  spaceshipreference EmissaryShipREF = Alias_Helix.GetShipReference() ; #DEBUG_LINE_NO:339
  HunterShipREF.Enable(False) ; #DEBUG_LINE_NO:342
  EmissaryShipREF.Enable(False) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:345
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:354
  Self.SetObjectiveDisplayed(610, True, False) ; #DEBUG_LINE_NO:355
  MQ402_003_HunterEmissary.Start() ; #DEBUG_LINE_NO:357
EndFunction

Function Fragment_Stage_0620_Item_00()
  MQ302b.SetStage(20) ; #DEBUG_LINE_NO:366
  MQ302_SidedWithChoice.SetValueInt(0) ; #DEBUG_LINE_NO:368
  Self.SetStage(1000) ; #DEBUG_LINE_NO:370
EndFunction

Function Fragment_Stage_0630_Item_00()
  MQ302b.SetStage(21) ; #DEBUG_LINE_NO:379
  MQ302_SidedWithChoice.SetValueInt(1) ; #DEBUG_LINE_NO:381
  Self.SetStage(1000) ; #DEBUG_LINE_NO:383
EndFunction

Function Fragment_Stage_0640_Item_00()
  MQ302b.SetStage(22) ; #DEBUG_LINE_NO:392
  MQ302_SidedWithChoice.SetValueInt(2) ; #DEBUG_LINE_NO:394
  Self.SetStage(1000) ; #DEBUG_LINE_NO:396
EndFunction

Function Fragment_Stage_1000_Item_00()
  spaceshipreference HunterShipREF = Alias_Scorpius.GetShipReference() ; #DEBUG_LINE_NO:404
  spaceshipreference EmissaryShipREF = Alias_Helix.GetShipReference() ; #DEBUG_LINE_NO:405
  HunterShipREF.DisableWithGravJump() ; #DEBUG_LINE_NO:407
  EmissaryShipREF.DisableWithGravJump() ; #DEBUG_LINE_NO:408
  HunterShipREF.moveto(LC165_Adversary01ShipStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:410
  EmissaryShipREF.moveto(LC165_Adversary02ShipStartMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:411
  HunterShipREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:413
  EmissaryShipREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:414
  HunterShipREF.Enable(False) ; #DEBUG_LINE_NO:416
  EmissaryShipREF.Enable(False) ; #DEBUG_LINE_NO:417
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:419
  MQ302.SetStage(15) ; #DEBUG_LINE_NO:420
  Self.Stop() ; #DEBUG_LINE_NO:421
EndFunction
