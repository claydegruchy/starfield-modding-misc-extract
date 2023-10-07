ScriptName Fragments:Quests:QF_RI06_001A9560 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RI06StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Veena Auto Const mandatory
ReferenceAlias Property Alias_Camden Auto Const mandatory
ReferenceAlias Property Alias_MasakoIntroSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_CamdenIntroSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_VeenaIntroSceneMarker Auto Const mandatory
Quest Property RI05 Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostKeyCamden Auto Const mandatory
Key Property RI06_CMOutpostRC1AccessKey Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property RI06_Bribe Auto Const mandatory
GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
ReferenceAlias Property Alias_SecureWingAccessKey Auto Const mandatory
Scene Property RI06_1200_Guard_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostTerminalQS Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostMapMarker Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Scene Property RI06_0100_Masako_TriggeredScene Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeDoor Auto Const mandatory
Scene Property RI06_1375_Guard_DrOsianScene Auto Const mandatory
ReferenceAlias Property Alias_DrOsian Auto Const mandatory
ReferenceAlias Property Alias_DrOsianSceneFurniture Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Scene Property RI06_1220_SecureWing_TriggeredScene Auto Const mandatory
ReferenceAlias Property Alias_TheClinicMapMarker Auto Const mandatory
GlobalVariable Property RI05_Track_BayuDispleased Auto Const mandatory
Quest Property RI07 Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeSceneTrigger Auto Const mandatory
ReferenceAlias Property Alias_GuardSecureWingMoveTo Auto Const mandatory
Scene Property RI06_1258_Sean_CallSecurityScene Auto Const mandatory
Scene Property RI06_1258_DrLane_CallSecurityScene Auto Const mandatory
ReferenceAlias Property Alias_AriQS Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
GlobalVariable Property RI06_Extort Auto Const mandatory
Faction Property RI06_SecureWingFaction Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_RothiciteShipment Auto Const mandatory
ReferenceAlias Property Alias_DrLane Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Sean Auto Const mandatory
ReferenceAlias Property Alias_DrLaneTerminal Auto Const mandatory
Book Property RI05_KumihoSlate Auto Const mandatory
ReferenceAlias Property Alias_Guard_SecureWing Auto Const mandatory
Keyword Property RIR06_QuestStartKeyword Auto Const mandatory
ActorValue Property RI06_Foreknowledge_LucasDrexlerEvilAV Auto Const mandatory
GlobalVariable Property RI06_SeanDead Auto Const mandatory
GlobalVariable Property RI06_KendrickDead Auto Const mandatory
ReferenceAlias Property Alias_SecureWingDoor Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
MiscObject Property RI06_RothiciteShipment Auto Const mandatory
ReferenceAlias Property Alias_RothiciteShipmentPost Auto Const mandatory
Cell Property StationTheClinicSecureWing01 Auto Const mandatory
ReferenceAlias Property Alias_CMOutpostTowerNPCsEnableMarker Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_UnlockRothicite Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:7
  RI05.SetStage(15) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:16
  Self.SetStage(100) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:27
  Self.SetStage(100) ; #DEBUG_LINE_NO:28
  Self.SetStage(120) ; #DEBUG_LINE_NO:29
  Self.SetStage(200) ; #DEBUG_LINE_NO:30
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:34
    Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  Alias_VeenaOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:40
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:49
  Self.SetStage(300) ; #DEBUG_LINE_NO:50
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:59
  Self.SetStage(400) ; #DEBUG_LINE_NO:60
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:69
  Self.SetStage(100) ; #DEBUG_LINE_NO:70
  Self.SetStage(120) ; #DEBUG_LINE_NO:71
  Self.SetStage(130) ; #DEBUG_LINE_NO:72
  Self.SetStage(200) ; #DEBUG_LINE_NO:73
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:74
    Self.SetStage(410) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:85
  Self.SetStage(100) ; #DEBUG_LINE_NO:86
  Self.SetStage(120) ; #DEBUG_LINE_NO:87
  Self.SetStage(130) ; #DEBUG_LINE_NO:88
  Self.SetStage(200) ; #DEBUG_LINE_NO:89
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:90
    Self.SetStage(410) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:93
  Self.SetStage(600) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:102
  Self.SetStage(120) ; #DEBUG_LINE_NO:103
  Self.SetStage(130) ; #DEBUG_LINE_NO:104
  Self.SetStage(200) ; #DEBUG_LINE_NO:105
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:106
    Self.SetStage(410) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:109
  Self.SetStage(600) ; #DEBUG_LINE_NO:110
  Self.SetStage(700) ; #DEBUG_LINE_NO:111
  Self.SetStage(750) ; #DEBUG_LINE_NO:112
  Game.GetPlayer().MoveTo(Alias_CMOutpostTerminalQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:122
  Self.SetStage(120) ; #DEBUG_LINE_NO:123
  Self.SetStage(130) ; #DEBUG_LINE_NO:124
  Self.SetStage(200) ; #DEBUG_LINE_NO:125
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:126
    Self.SetStage(410) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:129
  Self.SetStage(600) ; #DEBUG_LINE_NO:130
  Self.SetStage(700) ; #DEBUG_LINE_NO:131
  Self.SetStage(750) ; #DEBUG_LINE_NO:132
  Self.SetStage(800) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:141
  Self.SetStage(100) ; #DEBUG_LINE_NO:142
  Self.SetStage(120) ; #DEBUG_LINE_NO:143
  Self.SetStage(130) ; #DEBUG_LINE_NO:144
  Self.SetStage(200) ; #DEBUG_LINE_NO:145
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:146
    Self.SetStage(410) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:149
  Self.SetStage(600) ; #DEBUG_LINE_NO:150
  Self.SetStage(610) ; #DEBUG_LINE_NO:151
  Self.SetStage(700) ; #DEBUG_LINE_NO:152
  Self.SetStage(710) ; #DEBUG_LINE_NO:153
  Self.SetStage(750) ; #DEBUG_LINE_NO:154
  Self.SetStage(751) ; #DEBUG_LINE_NO:155
  Self.SetStage(755) ; #DEBUG_LINE_NO:156
  Self.SetStage(760) ; #DEBUG_LINE_NO:157
  Self.SetStage(850) ; #DEBUG_LINE_NO:158
  Self.SetStage(860) ; #DEBUG_LINE_NO:159
  Self.SetStage(900) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:170
  Self.SetStage(100) ; #DEBUG_LINE_NO:171
  Self.SetStage(120) ; #DEBUG_LINE_NO:172
  Self.SetStage(130) ; #DEBUG_LINE_NO:173
  Self.SetStage(200) ; #DEBUG_LINE_NO:174
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:175
    Self.SetStage(410) ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:178
  Self.SetStage(600) ; #DEBUG_LINE_NO:179
  Self.SetStage(610) ; #DEBUG_LINE_NO:180
  Self.SetStage(700) ; #DEBUG_LINE_NO:181
  Self.SetStage(710) ; #DEBUG_LINE_NO:182
  Self.SetStage(750) ; #DEBUG_LINE_NO:183
  Self.SetStage(751) ; #DEBUG_LINE_NO:184
  Self.SetStage(755) ; #DEBUG_LINE_NO:185
  Self.SetStage(760) ; #DEBUG_LINE_NO:186
  Self.SetStage(850) ; #DEBUG_LINE_NO:187
  Self.SetStage(860) ; #DEBUG_LINE_NO:188
  Self.SetStage(900) ; #DEBUG_LINE_NO:189
  Self.SetStage(1000) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:200
  Self.SetStage(100) ; #DEBUG_LINE_NO:201
  Self.SetStage(120) ; #DEBUG_LINE_NO:202
  Self.SetStage(130) ; #DEBUG_LINE_NO:203
  Self.SetStage(200) ; #DEBUG_LINE_NO:204
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:205
    Self.SetStage(410) ; #DEBUG_LINE_NO:206
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:208
  Self.SetStage(600) ; #DEBUG_LINE_NO:209
  Self.SetStage(610) ; #DEBUG_LINE_NO:210
  Self.SetStage(700) ; #DEBUG_LINE_NO:211
  Self.SetStage(710) ; #DEBUG_LINE_NO:212
  Self.SetStage(750) ; #DEBUG_LINE_NO:213
  Self.SetStage(751) ; #DEBUG_LINE_NO:214
  Self.SetStage(755) ; #DEBUG_LINE_NO:215
  Self.SetStage(760) ; #DEBUG_LINE_NO:216
  Self.SetStage(850) ; #DEBUG_LINE_NO:217
  Self.SetStage(860) ; #DEBUG_LINE_NO:218
  Self.SetStage(900) ; #DEBUG_LINE_NO:219
  Self.SetStage(1000) ; #DEBUG_LINE_NO:220
  Self.SetStage(1100) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:231
  Self.SetStage(100) ; #DEBUG_LINE_NO:232
  Self.SetStage(120) ; #DEBUG_LINE_NO:233
  Self.SetStage(130) ; #DEBUG_LINE_NO:234
  Self.SetStage(200) ; #DEBUG_LINE_NO:235
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:236
    Self.SetStage(410) ; #DEBUG_LINE_NO:237
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:239
  Self.SetStage(600) ; #DEBUG_LINE_NO:240
  Self.SetStage(610) ; #DEBUG_LINE_NO:241
  Self.SetStage(700) ; #DEBUG_LINE_NO:242
  Self.SetStage(710) ; #DEBUG_LINE_NO:243
  Self.SetStage(750) ; #DEBUG_LINE_NO:244
  Self.SetStage(751) ; #DEBUG_LINE_NO:245
  Self.SetStage(755) ; #DEBUG_LINE_NO:246
  Self.SetStage(760) ; #DEBUG_LINE_NO:247
  Self.SetStage(850) ; #DEBUG_LINE_NO:248
  Self.SetStage(860) ; #DEBUG_LINE_NO:249
  Self.SetStage(900) ; #DEBUG_LINE_NO:250
  Self.SetStage(1000) ; #DEBUG_LINE_NO:251
  Self.SetStage(1100) ; #DEBUG_LINE_NO:252
  Self.SetStage(1200) ; #DEBUG_LINE_NO:253
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:255
  PlayerRef.MoveTo(Alias_AriQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:265
  Self.SetStage(100) ; #DEBUG_LINE_NO:266
  Self.SetStage(120) ; #DEBUG_LINE_NO:267
  Self.SetStage(130) ; #DEBUG_LINE_NO:268
  Self.SetStage(200) ; #DEBUG_LINE_NO:269
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:270
    Self.SetStage(410) ; #DEBUG_LINE_NO:271
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:273
  Self.SetStage(600) ; #DEBUG_LINE_NO:274
  Self.SetStage(610) ; #DEBUG_LINE_NO:275
  Self.SetStage(700) ; #DEBUG_LINE_NO:276
  Self.SetStage(710) ; #DEBUG_LINE_NO:277
  Self.SetStage(750) ; #DEBUG_LINE_NO:278
  Self.SetStage(751) ; #DEBUG_LINE_NO:279
  Self.SetStage(755) ; #DEBUG_LINE_NO:280
  Self.SetStage(760) ; #DEBUG_LINE_NO:281
  Self.SetStage(850) ; #DEBUG_LINE_NO:282
  Self.SetStage(860) ; #DEBUG_LINE_NO:283
  Self.SetStage(900) ; #DEBUG_LINE_NO:284
  Self.SetStage(1000) ; #DEBUG_LINE_NO:285
  Self.SetStage(1100) ; #DEBUG_LINE_NO:286
  Self.SetStage(1200) ; #DEBUG_LINE_NO:287
  Self.SetStage(1300) ; #DEBUG_LINE_NO:288
  Self.SetStage(1305) ; #DEBUG_LINE_NO:289
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:291
  PlayerRef.MoveTo(Alias_AriQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:300
  Self.SetStage(1400) ; #DEBUG_LINE_NO:301
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:302
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:303
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:312
  Self.SetStage(1600) ; #DEBUG_LINE_NO:313
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:314
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:315
  Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:324
  Self.SetStage(100) ; #DEBUG_LINE_NO:325
  Self.SetStage(120) ; #DEBUG_LINE_NO:326
  Self.SetStage(130) ; #DEBUG_LINE_NO:327
  Self.SetStage(200) ; #DEBUG_LINE_NO:328
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:329
    Self.SetStage(410) ; #DEBUG_LINE_NO:330
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:332
  Self.SetStage(600) ; #DEBUG_LINE_NO:333
  Self.SetStage(610) ; #DEBUG_LINE_NO:334
  Self.SetStage(850) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0020_Item_00()
  RI_Support.SetStage(3) ; #DEBUG_LINE_NO:343
  Alias_RothiciteShipment.GetRef().SetActorRefOwner(Alias_DrLane.GetActorRef(), False) ; #DEBUG_LINE_NO:344
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:346
  PlayerRef.AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:347
  PlayerRef.AddItem(Drug_Aurora as Form, 5, False) ; #DEBUG_LINE_NO:348
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:358
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:359
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:360
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:361
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:362
    Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:363
  Else ; #DEBUG_LINE_NO:
    Alias_Camden.GetRef().Disable(False) ; #DEBUG_LINE_NO:365
  EndIf ; #DEBUG_LINE_NO:
  Alias_VeenaOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:370
EndFunction

Function Fragment_Stage_0110_Item_00()
  RI06_0100_Masako_TriggeredScene.Start() ; #DEBUG_LINE_NO:379
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:387
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:395
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:403
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:404
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:412
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:413
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:421
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:422
EndFunction

Function Fragment_Stage_0410_Item_00()
  Game.GetPlayer().AddItem(Alias_CMOutpostKeyCamden.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:430
  Self.SetStage(820) ; #DEBUG_LINE_NO:431
EndFunction

Function Fragment_Stage_0500_Item_00()
  If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0.0 ; #DEBUG_LINE_NO:439
    Self.SetStage(410) ; #DEBUG_LINE_NO:440
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:443
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:446
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:447
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:449
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:450
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:452
  Alias_CMOutpostMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:455
  Alias_CMOutpostMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:456
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:464
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:465
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:473
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:474
  Self.SetStage(850) ; #DEBUG_LINE_NO:476
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:484
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:492
  If Self.GetStageDone(755) ; #DEBUG_LINE_NO:494
    Self.SetStage(900) ; #DEBUG_LINE_NO:495
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveDisplayed(750, True, False) ; #DEBUG_LINE_NO:504
EndFunction

Function Fragment_Stage_0751_Item_00()
  Self.SetObjectiveDisplayed(751, True, False) ; #DEBUG_LINE_NO:512
EndFunction

Function Fragment_Stage_0755_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:520
  Self.SetStage(760) ; #DEBUG_LINE_NO:521
  Self.SetObjectiveCompleted(751, True) ; #DEBUG_LINE_NO:522
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:523
EndFunction

Function Fragment_Stage_0760_Item_00()
  Self.SetObjectiveCompleted(750, True) ; #DEBUG_LINE_NO:531
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:539
EndFunction

Function Fragment_Stage_0805_Item_00()
  Alias_CMOutpostTowerNPCsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:547
EndFunction

Function Fragment_Stage_0810_Item_00()
  If Self.IsObjectiveDisplayed(800) ; #DEBUG_LINE_NO:555
    Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:556
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.IsObjectiveDisplayed(800) ; #DEBUG_LINE_NO:565
    Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:566
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:575
EndFunction

Function Fragment_Stage_0860_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:583
  Self.SetStage(700) ; #DEBUG_LINE_NO:584
  Self.SetStage(750) ; #DEBUG_LINE_NO:585
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:593
  Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:595
  Alias_TheClinicMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:596
  Alias_SecureWingDoor.GetRef().SetLockLevel(25) ; #DEBUG_LINE_NO:597
EndFunction

Function Fragment_Stage_10000_Item_00()
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction) ; #DEBUG_LINE_NO:605
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:607
  If RI05_Track_BayuDispleased.GetValue() == 0.0 ; #DEBUG_LINE_NO:609
    RI07.SetStage(100) ; #DEBUG_LINE_NO:610
    RIR06_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(RI06_Foreknowledge_LucasDrexlerEvilAV, 1.0) ; #DEBUG_LINE_NO:614
  RI_UnlockRothicite.SetValue(1.0) ; #DEBUG_LINE_NO:617
  Self.Stop() ; #DEBUG_LINE_NO:619
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:627
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:628
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:636
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:637
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:638
EndFunction

Function Fragment_Stage_1200_Item_00()
  If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:646
    Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:647
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:649
    Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:650
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(1100) ; #DEBUG_LINE_NO:652
    Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:653
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:655
  Self.SetObjectiveDisplayedAtTop(1200) ; #DEBUG_LINE_NO:656
  Self.SetStage(1250) ; #DEBUG_LINE_NO:657
  Alias_SecureWingDoor.GetRef().SetLockLevel(25) ; #DEBUG_LINE_NO:658
EndFunction

Function Fragment_Stage_1210_Item_00()
  RI06_1200_Guard_IntroScene.Start() ; #DEBUG_LINE_NO:666
EndFunction

Function Fragment_Stage_1220_Item_00()
  RI06_1220_SecureWing_TriggeredScene.Start() ; #DEBUG_LINE_NO:674
EndFunction

Function Fragment_Stage_1221_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:682
  Alias_DrLane.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:683
EndFunction

Function Fragment_Stage_1225_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:691
  Alias_DrLane.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:692
EndFunction

Function Fragment_Stage_1230_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:700
  ri06_questscript kmyQuest = __temp as ri06_questscript ; #DEBUG_LINE_NO:701
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:704
  If Self.GetStageDone(1280) ; #DEBUG_LINE_NO:706
    Self.SetStage(1400) ; #DEBUG_LINE_NO:707
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.CheckForAccess(Alias_RothiciteShipment.GetRef()) ; #DEBUG_LINE_NO:710
EndFunction

Function Fragment_Stage_1235_Item_00()
  ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef() ; #DEBUG_LINE_NO:718
  TerminalRef.SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:719
  TerminalRef.Lock(False, False, True) ; #DEBUG_LINE_NO:720
  Alias_RothiciteShipment.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:721
EndFunction

Function Fragment_Stage_1236_Item_00()
  Alias_SecureWingDoor.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:729
  Actor SecureWingGuardRef = Alias_Guard_SecureWing.GetActorRef() ; #DEBUG_LINE_NO:732
  If SecureWingGuardRef.IsDisabled() ; #DEBUG_LINE_NO:734
    Alias_Guard.GetRef().Disable(False) ; #DEBUG_LINE_NO:735
    SecureWingGuardRef.Enable(False) ; #DEBUG_LINE_NO:736
    SecureWingGuardRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:737
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction) ; #DEBUG_LINE_NO:741
  RI06_SecureWingFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:744
  StationTheClinicSecureWing01.SetPublic(False) ; #DEBUG_LINE_NO:745
EndFunction

Function Fragment_Stage_1240_Item_00()
  RI06_1220_SecureWing_TriggeredScene.Stop() ; #DEBUG_LINE_NO:753
  Alias_Sean.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:754
  Alias_DrLane.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:755
EndFunction

Function Fragment_Stage_1245_Item_00()
  Alias_Sean.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:763
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:764
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveDisplayedAtTop(1250) ; #DEBUG_LINE_NO:772
EndFunction

Function Fragment_Stage_1257_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:780
  ri06_questscript kmyQuest = __temp as ri06_questscript ; #DEBUG_LINE_NO:781
  kmyQuest.SeanStartTimer() ; #DEBUG_LINE_NO:784
EndFunction

Function Fragment_Stage_1258_Item_00()
  RI06_1258_Sean_CallSecurityScene.Start() ; #DEBUG_LINE_NO:792
  Self.SetStage(1236) ; #DEBUG_LINE_NO:793
EndFunction

Function Fragment_Stage_1259_Item_00()
  Self.SetObjectiveDisplayed(1259, True, False) ; #DEBUG_LINE_NO:801
EndFunction

Function Fragment_Stage_1260_Item_00()
  Self.SetStage(1280) ; #DEBUG_LINE_NO:809
EndFunction

Function Fragment_Stage_1261_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:817
  ri06_questscript kmyQuest = __temp as ri06_questscript ; #DEBUG_LINE_NO:818
  kmyQuest.CheckForAccess(Alias_DrLaneTerminal.GetRef()) ; #DEBUG_LINE_NO:821
EndFunction

Function Fragment_Stage_1270_Item_00()
  Self.SetStage(1235) ; #DEBUG_LINE_NO:829
EndFunction

Function Fragment_Stage_1271_Item_00()
  ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef() ; #DEBUG_LINE_NO:837
  TerminalRef.SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:838
  TerminalRef.Lock(False, False, True) ; #DEBUG_LINE_NO:839
  Alias_DrLane.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:840
  Self.SetObjectiveCompleted(1259, True) ; #DEBUG_LINE_NO:841
EndFunction

Function Fragment_Stage_1272_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:849
  ri06_questscript kmyQuest = __temp as ri06_questscript ; #DEBUG_LINE_NO:850
  kmyQuest.DrLaneStartTimer() ; #DEBUG_LINE_NO:853
EndFunction

Function Fragment_Stage_1273_Item_00()
  RI06_1258_DrLane_CallSecurityScene.Start() ; #DEBUG_LINE_NO:861
  Self.SetStage(1236) ; #DEBUG_LINE_NO:862
EndFunction

Function Fragment_Stage_1275_Item_00()
  If Self.IsObjectiveDisplayed(1259) ; #DEBUG_LINE_NO:870
    Self.SetObjectiveCompleted(1259, True) ; #DEBUG_LINE_NO:871
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(1235) ; #DEBUG_LINE_NO:873
EndFunction

Function Fragment_Stage_1276_Item_00()
  Alias_DrLane.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:881
EndFunction

Function Fragment_Stage_1280_Item_00()
  Self.SetObjectiveCompleted(1250, True) ; #DEBUG_LINE_NO:889
  If Self.GetStageDone(1230) ; #DEBUG_LINE_NO:891
    Self.SetStage(1400) ; #DEBUG_LINE_NO:892
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1282_Item_00()
  Self.SetStage(1235) ; #DEBUG_LINE_NO:901
EndFunction

Function Fragment_Stage_1283_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RI06_Extort.GetValueInt(), False) ; #DEBUG_LINE_NO:909
  Self.SetStage(1235) ; #DEBUG_LINE_NO:910
EndFunction

Function Fragment_Stage_1290_Item_00()
  RI06_SeanDead.SetValue(1.0) ; #DEBUG_LINE_NO:918
EndFunction

Function Fragment_Stage_1295_Item_00()
  RI06_KendrickDead.SetValue(1.0) ; #DEBUG_LINE_NO:926
  If Self.IsObjectiveDisplayed(1259) ; #DEBUG_LINE_NO:927
    Self.SetObjectiveDisplayed(1259, False, False) ; #DEBUG_LINE_NO:928
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:937
EndFunction

Function Fragment_Stage_1305_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:945
EndFunction

Function Fragment_Stage_1310_Item_00()
  Self.SetStage(1394) ; #DEBUG_LINE_NO:953
EndFunction

Function Fragment_Stage_1330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI06_Bribe.GetValueInt(), False, None) ; #DEBUG_LINE_NO:961
  Self.SetStage(1394) ; #DEBUG_LINE_NO:962
EndFunction

Function Fragment_Stage_1340_Item_00()
  Game.GetPlayer().RemoveItem(Drug_Aurora as Form, 1, False, None) ; #DEBUG_LINE_NO:970
  Self.SetStage(1390) ; #DEBUG_LINE_NO:971
  Self.SetStage(1394) ; #DEBUG_LINE_NO:972
EndFunction

Function Fragment_Stage_1370_Item_00()
  Actor DrOsianRef = Alias_DrOsian.GetActorRef() ; #DEBUG_LINE_NO:980
  DrOsianRef.MoveTo(Alias_DrOsianSceneFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:982
  DrOsianRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:983
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:985
EndFunction

Function Fragment_Stage_1375_Item_00()
  RI06_1375_Guard_DrOsianScene.Start() ; #DEBUG_LINE_NO:993
EndFunction

Function Fragment_Stage_1376_Item_00()
  Alias_DrOsian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1001
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1002
EndFunction

Function Fragment_Stage_1385_Item_00()
  Self.SetStage(1390) ; #DEBUG_LINE_NO:1010
  Self.SetStage(1394) ; #DEBUG_LINE_NO:1011
EndFunction

Function Fragment_Stage_1390_Item_00()
  Game.GetPlayer().AddItem(Alias_SecureWingAccessKey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:1019
  If Self.IsObjectiveDisplayed(1300) ; #DEBUG_LINE_NO:1020
    Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1021
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1394_Item_00()
  If Self.IsObjectiveDisplayed(1300) ; #DEBUG_LINE_NO:1030
    Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1031
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1395_Item_00()
  If Self.IsObjectiveDisplayed(1300) ; #DEBUG_LINE_NO:1040
    Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1041
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1400_Item_00()
  If Self.IsObjectiveDisplayed(1300) ; #DEBUG_LINE_NO:1050
    Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1051
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:1054
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:1055
  If Self.IsObjectiveDisplayed(1259) ; #DEBUG_LINE_NO:1057
    Self.SetObjectiveDisplayed(1259, False, False) ; #DEBUG_LINE_NO:1058
  EndIf ; #DEBUG_LINE_NO:
  Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1062
  Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1063
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True) ; #DEBUG_LINE_NO:1071
  Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:1072
EndFunction

Function Fragment_Stage_1510_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:1080
  PlayerRef.RemoveItem(Alias_RothiciteShipmentPost.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1081
  PlayerRef.RemoveItem(Alias_RothiciteShipment.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1082
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1500, True) ; #DEBUG_LINE_NO:1090
  Self.SetObjectiveDisplayed(1600, True, False) ; #DEBUG_LINE_NO:1091
  If RI05_Track_BayuDispleased.GetValue() == 1.0 || RI05_Track_BayuDispleased.GetValue() == -1.0 ; #DEBUG_LINE_NO:1093
    RIR06_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:1094
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1610_Item_00()
  Game.GetPlayer().RemoveItem(RI05_KumihoSlate as Form, 99, False, None) ; #DEBUG_LINE_NO:1103
EndFunction

Function Fragment_Stage_1620_Item_00()
  RI06_Track_PlayerWitholdsClinicNames.SetValue(1.0) ; #DEBUG_LINE_NO:1111
EndFunction
