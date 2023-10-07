ScriptName Fragments:Quests:QF_CF06_0001BD20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF06Microdrive Auto Const mandatory
ReferenceAlias Property Alias_CF06Evidence Auto Const mandatory
ReferenceAlias Property Alias_CF06GenerdynePass Auto Const mandatory
GlobalVariable Property CF06Count Auto Const mandatory
ReferenceAlias Property Alias_CF06Naeva Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Komiko Auto Const mandatory
ReferenceAlias Property Alias_CF06_Cypher Auto Const mandatory
ReferenceAlias Property Alias_CF06_BreysonBayu Auto Const mandatory
ReferenceAlias Property Alias_CF06_CGSchematicsEncrypted Auto Const mandatory
ReferenceAlias Property Alias_CF06_CGSchematicsDecrypted Auto Const mandatory
ReferenceAlias Property Alias_CF06_Estelle Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const mandatory
ObjectReference Property CF06_AstralLoungeBayuMarker Auto Const mandatory
ReferenceAlias Property Alias_CF06_BenjaminBayu Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property CF06_MSPMarker Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ObjectReference Property CF06_NaevaWaitsMarker Auto Const mandatory
Scene Property CF06_Stage170_BenjaminBayu_CalloutScene Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeLow Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeHigh Auto Const mandatory
GlobalVariable Property CF06_KomikoBribeMedium Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_CF06_Receptionist Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
ObjectReference Property CF06_GDYMarker Auto Const mandatory
Quest Property LC039 Auto Const mandatory
ObjectReference Property CF06_GenerdyneInnerDoorRef01 Auto Const mandatory
ObjectReference Property CF06_GenerdyneInnerDoorRef02 Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF06_EPHMarker Auto Const mandatory
ObjectReference Property CF06_ASLMarker Auto Const mandatory
ObjectReference Property CF02_TheKeyStartRef Auto Const mandatory
Quest Property CF07 Auto Const mandatory
ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CF06_Delgado Auto Const mandatory
ObjectReference Property CF07_JazzSceneMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CF06_Jazz Auto Const mandatory
ReferenceAlias Property Alias_CF06_ReceptionistPass Auto Const mandatory
ReferenceAlias Property Alias_CF06_Safe Auto Const mandatory
ActorBase Property FC_Neon_BenjaminBayu Auto Const mandatory
Scene Property CF06_Stage200_BenjaminBayu_CalloutScene Auto Const mandatory
ObjectReference Property CF06_EnablerRef Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
GlobalVariable Property Neon_Euphorika_LoungeCost Auto Const mandatory
GlobalVariable Property CF06_MykaRefund Auto Const mandatory
ReferenceAlias Property Alias_CF06_Bodyguard01 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Bodyguard02 Auto Const mandatory
Key Property PCF06_GenerdyneExecutiveElevatorKey Auto Const mandatory
GlobalVariable Property CF06_EstelleShareHigh Auto Const mandatory
GlobalVariable Property CF06_EstelleShareMedium Auto Const mandatory
GlobalVariable Property CF06_EstelleShareLow Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0165_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0227_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:8
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:11
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:12
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:15
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:24
  Self.SetStage(20) ; #DEBUG_LINE_NO:25
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:30
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:31
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:34
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:43
  Self.SetStage(20) ; #DEBUG_LINE_NO:44
  Self.SetStage(30) ; #DEBUG_LINE_NO:45
  Self.SetStage(40) ; #DEBUG_LINE_NO:46
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:47
  Game.GetPlayer().MoveTo(CF06_EPHMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:51
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:52
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:55
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:64
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:65
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:66
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:67
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:68
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:69
  Game.GetPlayer().MoveTo(CF06_GDYMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:70
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:73
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:74
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:77
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:86
  Self.SetStage(122) ; #DEBUG_LINE_NO:87
  Self.SetStage(123) ; #DEBUG_LINE_NO:88
  Self.SetStage(124) ; #DEBUG_LINE_NO:89
  Self.SetStage(125) ; #DEBUG_LINE_NO:90
  Self.SetStage(130) ; #DEBUG_LINE_NO:91
  Self.SetStage(140) ; #DEBUG_LINE_NO:92
  Self.SetStage(150) ; #DEBUG_LINE_NO:93
  Self.SetStage(160) ; #DEBUG_LINE_NO:94
  Self.SetStage(175) ; #DEBUG_LINE_NO:95
  Self.SetStage(180) ; #DEBUG_LINE_NO:96
  Self.SetStage(185) ; #DEBUG_LINE_NO:97
  Self.SetStage(190) ; #DEBUG_LINE_NO:98
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:99
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:100
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:101
  Game.GetPlayer().MoveTo(CF06_ASLMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:105
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:106
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:109
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:118
  Self.SetStage(122) ; #DEBUG_LINE_NO:119
  Self.SetStage(123) ; #DEBUG_LINE_NO:120
  Self.SetStage(124) ; #DEBUG_LINE_NO:121
  Self.SetStage(125) ; #DEBUG_LINE_NO:122
  Self.SetStage(130) ; #DEBUG_LINE_NO:123
  Self.SetStage(140) ; #DEBUG_LINE_NO:124
  Self.SetStage(150) ; #DEBUG_LINE_NO:125
  Self.SetStage(160) ; #DEBUG_LINE_NO:126
  Self.SetStage(175) ; #DEBUG_LINE_NO:127
  Self.SetStage(180) ; #DEBUG_LINE_NO:128
  Self.SetStage(185) ; #DEBUG_LINE_NO:129
  Self.SetStage(190) ; #DEBUG_LINE_NO:130
  Self.SetStage(205) ; #DEBUG_LINE_NO:131
  Self.SetStage(207) ; #DEBUG_LINE_NO:132
  Self.SetStage(220) ; #DEBUG_LINE_NO:133
  Self.SetStage(230) ; #DEBUG_LINE_NO:134
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:135
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:136
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:137
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:138
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:141
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:142
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:145
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:154
  Self.SetStage(122) ; #DEBUG_LINE_NO:155
  Self.SetStage(123) ; #DEBUG_LINE_NO:156
  Self.SetStage(124) ; #DEBUG_LINE_NO:157
  Self.SetStage(125) ; #DEBUG_LINE_NO:158
  Self.SetStage(130) ; #DEBUG_LINE_NO:159
  Self.SetStage(140) ; #DEBUG_LINE_NO:160
  Self.SetStage(150) ; #DEBUG_LINE_NO:161
  Self.SetStage(160) ; #DEBUG_LINE_NO:162
  Self.SetStage(175) ; #DEBUG_LINE_NO:163
  Self.SetStage(180) ; #DEBUG_LINE_NO:164
  Self.SetStage(185) ; #DEBUG_LINE_NO:165
  Self.SetStage(190) ; #DEBUG_LINE_NO:166
  Self.SetStage(205) ; #DEBUG_LINE_NO:167
  Self.SetStage(207) ; #DEBUG_LINE_NO:168
  Self.SetStage(225) ; #DEBUG_LINE_NO:169
  Self.SetStage(230) ; #DEBUG_LINE_NO:170
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:171
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:172
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:173
  Game.GetPlayer().MoveTo(CF06_MSPMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:174
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:177
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:178
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:181
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:190
  Self.SetStage(122) ; #DEBUG_LINE_NO:191
  Self.SetStage(123) ; #DEBUG_LINE_NO:192
  Self.SetStage(124) ; #DEBUG_LINE_NO:193
  Self.SetStage(125) ; #DEBUG_LINE_NO:194
  Self.SetStage(130) ; #DEBUG_LINE_NO:195
  Self.SetStage(140) ; #DEBUG_LINE_NO:196
  Self.SetStage(150) ; #DEBUG_LINE_NO:197
  Self.SetStage(160) ; #DEBUG_LINE_NO:198
  Self.SetStage(175) ; #DEBUG_LINE_NO:199
  Self.SetStage(180) ; #DEBUG_LINE_NO:200
  Self.SetStage(185) ; #DEBUG_LINE_NO:201
  Self.SetStage(190) ; #DEBUG_LINE_NO:202
  Self.SetStage(205) ; #DEBUG_LINE_NO:203
  Self.SetStage(207) ; #DEBUG_LINE_NO:204
  Self.SetStage(210) ; #DEBUG_LINE_NO:205
  Self.SetStage(230) ; #DEBUG_LINE_NO:206
  Self.SetStage(280) ; #DEBUG_LINE_NO:207
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:208
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:209
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:210
  Game.GetPlayer().MoveTo(CF02_TheKeyStartRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:211
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:214
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:215
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:218
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:227
  Self.SetStage(122) ; #DEBUG_LINE_NO:228
  Self.SetStage(123) ; #DEBUG_LINE_NO:229
  Self.SetStage(124) ; #DEBUG_LINE_NO:230
  Self.SetStage(125) ; #DEBUG_LINE_NO:231
  Self.SetStage(130) ; #DEBUG_LINE_NO:232
  Self.SetStage(140) ; #DEBUG_LINE_NO:233
  Self.SetStage(150) ; #DEBUG_LINE_NO:234
  Self.SetStage(160) ; #DEBUG_LINE_NO:235
  Self.SetStage(175) ; #DEBUG_LINE_NO:236
  Self.SetStage(180) ; #DEBUG_LINE_NO:237
  Self.SetStage(185) ; #DEBUG_LINE_NO:238
  Self.SetStage(190) ; #DEBUG_LINE_NO:239
  Self.SetStage(205) ; #DEBUG_LINE_NO:240
  Self.SetStage(207) ; #DEBUG_LINE_NO:241
  Self.SetStage(220) ; #DEBUG_LINE_NO:242
  Self.SetStage(230) ; #DEBUG_LINE_NO:243
  Self.SetStage(280) ; #DEBUG_LINE_NO:244
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:245
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:246
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:247
  Game.GetPlayer().MoveTo(CF02_TheKeyStartRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:248
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:251
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:252
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:255
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:264
  Self.SetActive(True) ; #DEBUG_LINE_NO:266
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_CF06_Estelle.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:274
  Alias_CF06_Estelle.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:275
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:276
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:285
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:286
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:294
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:295
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:296
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:297
  CF06_EnablerRef.Enable(False) ; #DEBUG_LINE_NO:300
  Alias_CF06_Komiko.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:303
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:304
  Alias_CF06_Komiko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:305
  Alias_CF06Evidence.GetRef().Enable(False) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0042_Item_00()
  Alias_CF06_Safe.GetRef().SetLockLevel(0) ; #DEBUG_LINE_NO:315
  Alias_CF06_Safe.GetRef().Unlock(False) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:324
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:325
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0047_Item_00()
  If CF06_MykaRefund.GetValue() == 0.0 ; #DEBUG_LINE_NO:334
    Game.GetPlayer().AddItem(Credits as Form, Neon_Euphorika_LoungeCost.GetValueInt(), False) ; #DEBUG_LINE_NO:335
    CF06_MykaRefund.SetValue(1.0) ; #DEBUG_LINE_NO:336
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_CF06_Komiko.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:355
  Alias_CF06_Komiko.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:356
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:364
  If Self.IsObjectiveDisplayed(40) == True ; #DEBUG_LINE_NO:365
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:366
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:368
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:369
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:371
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:372
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:374
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False ; #DEBUG_LINE_NO:382
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:383
    Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:384
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:393
  If Self.IsObjectiveDisplayed(40) == True ; #DEBUG_LINE_NO:394
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:395
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:397
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:398
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:400
EndFunction

Function Fragment_Stage_0093_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:408
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:416
EndFunction

Function Fragment_Stage_0098_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.IsObjectiveDisplayed(40) == True ; #DEBUG_LINE_NO:432
    Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:433
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:435
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:436
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:438
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:439
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:441
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:442
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:444
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:452
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:453
  Alias_CF06_Receptionist.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:454
  Alias_CF06_Receptionist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:455
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:458
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:459
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:462
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:463
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:472
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:473
  LC039.SetStage(200) ; #DEBUG_LINE_NO:476
  Alias_CF06_Komiko.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:479
  CF06_EnablerRef.Disable(False) ; #DEBUG_LINE_NO:480
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_CF06_Receptionist.GetActorRef().AddItem(Alias_CF06_ReceptionistPass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:496
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:497
EndFunction

Function Fragment_Stage_0140_Item_00()
  Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsEncrypted.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:505
  LC039.SetStage(700) ; #DEBUG_LINE_NO:506
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:507
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:508
  Alias_CF06_BreysonBayu.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:511
  Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:512
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_CF06_Estelle.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:520
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:521
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:530
  Game.GetPlayer().AddItem(Alias_CF06_Cypher.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:531
  Self.SetStage(175) ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_0175_Item_00()
  If Self.IsObjectiveDisplayed(140) == True ; #DEBUG_LINE_NO:548
    Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:549
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:551
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:552
EndFunction

Function Fragment_Stage_0180_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF06_Cypher.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:560
  Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsEncrypted.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:561
  Game.GetPlayer().AddItem(Alias_CF06_CGSchematicsDecrypted.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:562
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:563
  If Self.GetStageDone(185) == True ; #DEBUG_LINE_NO:564
    Self.SetStage(190) ; #DEBUG_LINE_NO:565
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:574
  Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:575
  If Self.GetStageDone(180) == True ; #DEBUG_LINE_NO:576
    Self.SetStage(190) ; #DEBUG_LINE_NO:577
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:586
  Game.GetPlayer().AddItem(PCF06_GenerdyneExecutiveElevatorKey as Form, 1, True) ; #DEBUG_LINE_NO:589
  Alias_CF06_BenjaminBayu.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:592
  Alias_CF06_BenjaminBayu.GetActorRef().MoveTo(CF06_AstralLoungeBayuMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:593
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:594
EndFunction

Function Fragment_Stage_0195_Item_00()
  Alias_CF06_BreysonBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:602
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:610
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:611
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:619
EndFunction

Function Fragment_Stage_0210_Item_00()
  CrimsonFleetCaptainState_Estelle.SetValue(2.0) ; #DEBUG_LINE_NO:627
  Self.SetStage(227) ; #DEBUG_LINE_NO:628
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_CF06_BreysonBayu.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:636
  Self.SetStage(227) ; #DEBUG_LINE_NO:637
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(227) ; #DEBUG_LINE_NO:645
EndFunction

Function Fragment_Stage_0230_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:661
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:662
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:666
  Self.SetStage(280) ; #DEBUG_LINE_NO:667
  If City_NA_Viewport02.IsRunning() ; #DEBUG_LINE_NO:670
    City_NA_Viewport02.SetStage(22) ; #DEBUG_LINE_NO:671
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:675
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:676
  CrimsonFleetCaptainState_Estelle.SetValue(2.0) ; #DEBUG_LINE_NO:679
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:682
EndFunction

Function Fragment_Stage_0230_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:690
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:691
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:694
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:695
  If City_NA_Viewport02.IsRunning() ; #DEBUG_LINE_NO:698
    City_NA_Viewport02.SetStage(22) ; #DEBUG_LINE_NO:699
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:703
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:704
  Alias_CF06_Estelle.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:707
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:710
EndFunction

Function Fragment_Stage_0230_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:718
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:719
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:722
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:723
  If City_NA_Viewport02.IsRunning() ; #DEBUG_LINE_NO:726
    City_NA_Viewport02.SetStage(22) ; #DEBUG_LINE_NO:727
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF06Naeva.GetActorRef().MoveTo(CF06_NaevaWaitsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:731
  Alias_CF06Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:732
  Alias_CF06_Estelle.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:735
  Self.SetStage(400) ; #DEBUG_LINE_NO:738
  Alias_CF06_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:741
EndFunction

Function Fragment_Stage_0230_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:749
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:750
  kmyQuest.ReleasePlayer() ; #DEBUG_LINE_NO:754
EndFunction

Function Fragment_Stage_0235_Item_00()
  If Self.GetStageDone(210) == False ; #DEBUG_LINE_NO:764
    Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:765
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:766
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0240_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(1.0) ; #DEBUG_LINE_NO:775
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareLow.GetValueInt(), False, None) ; #DEBUG_LINE_NO:778
EndFunction

Function Fragment_Stage_0250_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(2.0) ; #DEBUG_LINE_NO:786
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:789
EndFunction

Function Fragment_Stage_0260_Item_00()
  CrimsonFleetCaptainStateDifficulty_Estelle.SetValue(3.0) ; #DEBUG_LINE_NO:797
  Game.GetPlayer().RemoveItem(Credits as Form, CF06_EstelleShareHigh.GetValueInt(), False, None) ; #DEBUG_LINE_NO:800
EndFunction

Function Fragment_Stage_0270_Item_00()
  CrimsonFleetCaptainState_Estelle.SetValue(1.0) ; #DEBUG_LINE_NO:808
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:816
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:817
EndFunction

Function Fragment_Stage_0280_Item_01()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:825
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:826
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:834
  Self.SetStage(320) ; #DEBUG_LINE_NO:835
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveDisplayed(320, True, False) ; #DEBUG_LINE_NO:843
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:851
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:852
  kmyQuest.StartGetOffPlanetTimer() ; #DEBUG_LINE_NO:857
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:865
  cf06questscript kmyQuest = __temp as cf06questscript ; #DEBUG_LINE_NO:866
  kmyQuest.CallNeonCrime() ; #DEBUG_LINE_NO:870
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(320, True) ; #DEBUG_LINE_NO:886
  LC039.SetStage(10000) ; #DEBUG_LINE_NO:887
  Game.GetPlayer().RemoveItem(Alias_CF06_CGSchematicsDecrypted.GetRef() as Form, 1, True, None) ; #DEBUG_LINE_NO:888
  CF07.SetStage(10) ; #DEBUG_LINE_NO:889
  Alias_CF06_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:892
  Alias_CF06_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:893
  Alias_CF06_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:894
  Alias_CF06_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:895
  Alias_CF06_BenjaminBayu.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:898
  Self.Stop() ; #DEBUG_LINE_NO:900
EndFunction
