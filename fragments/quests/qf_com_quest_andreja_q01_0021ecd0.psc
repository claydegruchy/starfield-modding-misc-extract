ScriptName Fragments:Quests:QF_COM_Quest_Andreja_Q01_0021ECD0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_AkilaTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene12_2_RaisaShout Auto Const mandatory
ReferenceAlias Property Alias_StationDoor Auto Const mandatory
ReferenceAlias Property Alias_DenTestMarker Auto Const mandatory
ReferenceAlias Property Alias_RaisaTestMarker Auto Const mandatory
ReferenceAlias Property Alias_ErvinTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene12_ZealotStage210 Auto Const mandatory
ReferenceAlias Property Alias_StationTestMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene14_AndrejaStage310 Auto Const mandatory
Cell Property StationUCN48 Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340 Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Scene19_AndrejaTomisarStage390 Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage140_JaedaHail02 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property COM_Quest_Andreja_JaedaFaction Auto Const mandatory
ReferenceAlias Property Alias_Jaeda_Ship Auto Const mandatory
ReferenceAlias Property Alias_Tomisar Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage381_TomisarBarks Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship02 Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave1_Ship03 Auto Const mandatory
ReferenceAlias Property Alias_Eren_Slate Auto Const mandatory
ReferenceAlias Property Alias_ErenCampMapMarker Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage170_JaedaShout Auto Const mandatory
ReferenceAlias Property Alias_Zealot_Wave02_ShipCaptain Auto Const mandatory
ReferenceAlias Property Alias_Aggies_AndrejaMarker Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
ActorValue Property COM_Quest_Andreja_Q01_Complete_AV Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival Auto Const mandatory
ReferenceAlias Property Alias_Aggie Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Andreja Auto Const mandatory
Scene Property COM_Quest_Andreja_Q01_Stage330_Andreja Auto Const mandatory
GlobalVariable Property COM_AndrejaQ01_WaitToggle Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Jaeda Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0331_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:8
  MQ104A.Stop() ; #DEBUG_LINE_NO:11
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:14
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0001_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:24
  MQ104A.Stop() ; #DEBUG_LINE_NO:27
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:30
  Self.SetStage(10) ; #DEBUG_LINE_NO:33
  Self.SetStage(20) ; #DEBUG_LINE_NO:34
  Utility.wait(1.0) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().MoveTo(Alias_AkilaTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:36
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0002_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:46
  MQ104A.Stop() ; #DEBUG_LINE_NO:49
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:52
  Self.SetStage(10) ; #DEBUG_LINE_NO:55
  Self.SetStage(20) ; #DEBUG_LINE_NO:56
  Self.SetStage(25) ; #DEBUG_LINE_NO:57
  Self.SetStage(30) ; #DEBUG_LINE_NO:58
  Self.SetStage(31) ; #DEBUG_LINE_NO:59
  Self.SetStage(40) ; #DEBUG_LINE_NO:60
  Self.SetStage(45) ; #DEBUG_LINE_NO:61
  Self.SetStage(50) ; #DEBUG_LINE_NO:62
  Utility.wait(1.0) ; #DEBUG_LINE_NO:63
  Game.GetPlayer().MoveTo(Alias_ErvinTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
  COM_AndrejaQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0003_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:77
  MQ104A.Stop() ; #DEBUG_LINE_NO:80
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:83
  Self.SetStage(10) ; #DEBUG_LINE_NO:86
  Self.SetStage(20) ; #DEBUG_LINE_NO:87
  Self.SetStage(30) ; #DEBUG_LINE_NO:88
  Self.SetStage(31) ; #DEBUG_LINE_NO:89
  Self.SetStage(40) ; #DEBUG_LINE_NO:90
  Self.SetStage(45) ; #DEBUG_LINE_NO:91
  Self.SetStage(50) ; #DEBUG_LINE_NO:92
  Self.SetStage(55) ; #DEBUG_LINE_NO:93
  Self.SetStage(60) ; #DEBUG_LINE_NO:94
  Self.SetStage(70) ; #DEBUG_LINE_NO:95
  Self.SetStage(75) ; #DEBUG_LINE_NO:96
  Self.SetStage(80) ; #DEBUG_LINE_NO:97
  Self.SetStage(85) ; #DEBUG_LINE_NO:98
  Utility.wait(1.0) ; #DEBUG_LINE_NO:99
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:100
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0004_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:110
  MQ104A.Stop() ; #DEBUG_LINE_NO:113
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:116
  Self.SetStage(10) ; #DEBUG_LINE_NO:119
  Self.SetStage(20) ; #DEBUG_LINE_NO:120
  Self.SetStage(30) ; #DEBUG_LINE_NO:121
  Self.SetStage(31) ; #DEBUG_LINE_NO:122
  Self.SetStage(40) ; #DEBUG_LINE_NO:123
  Self.SetStage(45) ; #DEBUG_LINE_NO:124
  Self.SetStage(50) ; #DEBUG_LINE_NO:125
  Self.SetStage(55) ; #DEBUG_LINE_NO:126
  Self.SetStage(60) ; #DEBUG_LINE_NO:127
  Self.SetStage(70) ; #DEBUG_LINE_NO:128
  Self.SetStage(75) ; #DEBUG_LINE_NO:129
  Self.SetStage(80) ; #DEBUG_LINE_NO:130
  Self.SetStage(85) ; #DEBUG_LINE_NO:131
  Self.SetStage(90) ; #DEBUG_LINE_NO:132
  Self.SetStage(100) ; #DEBUG_LINE_NO:133
  Utility.wait(1.0) ; #DEBUG_LINE_NO:136
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:137
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:138
  Alias_Andreja.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0005_Item_00()
  COM_Companion_Andreja.SetStage(100) ; #DEBUG_LINE_NO:148
  MQ104A.Stop() ; #DEBUG_LINE_NO:151
  SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:154
  Self.SetStage(10) ; #DEBUG_LINE_NO:157
  Self.SetStage(20) ; #DEBUG_LINE_NO:158
  Self.SetStage(30) ; #DEBUG_LINE_NO:160
  Self.SetStage(31) ; #DEBUG_LINE_NO:161
  Self.SetStage(40) ; #DEBUG_LINE_NO:162
  Self.SetStage(45) ; #DEBUG_LINE_NO:163
  Self.SetStage(50) ; #DEBUG_LINE_NO:164
  Self.SetStage(55) ; #DEBUG_LINE_NO:165
  Self.SetStage(60) ; #DEBUG_LINE_NO:166
  Self.SetStage(70) ; #DEBUG_LINE_NO:167
  Self.SetStage(75) ; #DEBUG_LINE_NO:168
  Self.SetStage(80) ; #DEBUG_LINE_NO:169
  Self.SetStage(85) ; #DEBUG_LINE_NO:170
  Self.SetStage(90) ; #DEBUG_LINE_NO:171
  Self.SetStage(100) ; #DEBUG_LINE_NO:172
  Self.SetStage(110) ; #DEBUG_LINE_NO:173
  Self.SetStage(120) ; #DEBUG_LINE_NO:174
  Self.SetStage(130) ; #DEBUG_LINE_NO:175
  Self.SetStage(140) ; #DEBUG_LINE_NO:176
  Self.SetStage(150) ; #DEBUG_LINE_NO:177
  Self.SetStage(160) ; #DEBUG_LINE_NO:178
  Self.SetStage(170) ; #DEBUG_LINE_NO:179
  Self.SetStage(300) ; #DEBUG_LINE_NO:180
  Self.SetStage(305) ; #DEBUG_LINE_NO:181
  COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Stop() ; #DEBUG_LINE_NO:184
  COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Stop() ; #DEBUG_LINE_NO:185
  COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Stop() ; #DEBUG_LINE_NO:186
  Utility.wait(1.0) ; #DEBUG_LINE_NO:188
  Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:189
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Andreja) ; #DEBUG_LINE_NO:199
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:201
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:210
  Alias_Aggie.GetRef().MoveTo(Alias_Aggies_AndrejaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:213
  Alias_Aggie.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Andreja.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:222
  If Game.GetPlayer().HasDirectLOS(Alias_Andreja.GetReference(), "", "") == False ; #DEBUG_LINE_NO:225
    If Game.GetPlayer().GetDistance(Alias_Andreja.GetReference()) > 20.0 ; #DEBUG_LINE_NO:226
      Alias_Andreja.GetReference().MoveTo(Alias_Aggies_AndrejaMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:227
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0029_Item_00()
  Alias_Andreja.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:245
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:246
  Alias_Andreja.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:255
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:264
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:265
  Alias_ErenCampMapMarker.GetReference().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:275
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:276
  COM_AndrejaQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:279
  SQ_Followers.CommandFollow(Alias_Andreja.GetActorRef()) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.IsObjectiveDisplayed(50) ; #DEBUG_LINE_NO:297
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:298
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(55) ; #DEBUG_LINE_NO:300
    Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:301
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:312
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:313
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:314
  COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Start() ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:323
  Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:324
  If Game.GetPlayer().GetItemCount(Alias_Eren_Slate.GetReference() as Form) > 0 ; #DEBUG_LINE_NO:327
    Self.SetStage(80) ; #DEBUG_LINE_NO:328
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:337
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:338
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:346
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:347
  COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Stop() ; #DEBUG_LINE_NO:350
  COM_AndrejaQ01_WaitToggle.SetValue(0.0) ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_0089_Item_00()
  Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:361
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:362
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:370
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:371
  COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:381
  Self.SetStage(100) ; #DEBUG_LINE_NO:384
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:392
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:393
  Alias_Jaeda_Ship.GetReference().Enable(False) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0109_Item_00()
  Game.GetPlayer().MoveTo(Alias_RaisaTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:402
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:403
  Utility.wait(5.0) ; #DEBUG_LINE_NO:404
  Self.SetStage(120) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:413
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:414
  COM_Quest_Andreja_JaedaFaction.SetAlly(PlayerFaction, False, False) ; #DEBUG_LINE_NO:415
  COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Start() ; #DEBUG_LINE_NO:416
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:424
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:425
  Alias_Zealot_Wave1_Ship01.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:426
  Utility.wait(0.400000006) ; #DEBUG_LINE_NO:427
  Alias_Zealot_Wave1_Ship02.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:428
  Utility.wait(0.200000003) ; #DEBUG_LINE_NO:429
  Alias_Zealot_Wave1_Ship03.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:430
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133) ; #DEBUG_LINE_NO:438
    Self.SetStage(140) ; #DEBUG_LINE_NO:439
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133) ; #DEBUG_LINE_NO:448
    Self.SetStage(140) ; #DEBUG_LINE_NO:449
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) ; #DEBUG_LINE_NO:458
    Self.SetStage(140) ; #DEBUG_LINE_NO:459
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:468
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:469
  COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Start() ; #DEBUG_LINE_NO:470
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:478
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:479
  Alias_Jaeda_Ship.GetReference().SetValue(DockingPermission, 2.0) ; #DEBUG_LINE_NO:482
  Alias_Jaeda.GetActorReference().SetValue(Game.GetInvulnerableAV(), 1.0) ; #DEBUG_LINE_NO:483
  Alias_Jaeda.GetActorReference().SetGhost(True) ; #DEBUG_LINE_NO:484
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:492
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:493
  COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Start() ; #DEBUG_LINE_NO:494
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:502
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:503
  COM_Quest_Andreja_Q01_Stage170_JaedaShout.Start() ; #DEBUG_LINE_NO:504
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_Zealot_Wave02_ShipCaptain.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:512
  Self.SetStage(200) ; #DEBUG_LINE_NO:513
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:521
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_0210_Item_00()
  If Self.IsObjectiveDisplayed(170) ; #DEBUG_LINE_NO:530
    Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:531
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:533
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:534
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:536
  COM_Quest_Andreja_Q01_Scene12_ZealotStage210.Start() ; #DEBUG_LINE_NO:537
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:545
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:546
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:555
  Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:556
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(170) ; #DEBUG_LINE_NO:564
    Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:565
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:567
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:568
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:576
  Self.SetObjectiveDisplayed(305, True, False) ; #DEBUG_LINE_NO:577
  StationUCN48.SetGravityScale(1.0) ; #DEBUG_LINE_NO:578
EndFunction

Function Fragment_Stage_0306_Item_00()
  Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:586
  Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:587
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(305, True) ; #DEBUG_LINE_NO:595
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:596
  Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(), 1.0) ; #DEBUG_LINE_NO:597
  Alias_Tomisar.GetActorReference().SetGhost(True) ; #DEBUG_LINE_NO:598
  COM_Quest_Andreja_Q01_Scene14_AndrejaStage310.Start() ; #DEBUG_LINE_NO:599
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:607
  Self.SetObjectiveDisplayed(320, True, False) ; #DEBUG_LINE_NO:608
EndFunction

Function Fragment_Stage_0330_Item_00()
  COM_Quest_Andreja_Q01_Stage330_Andreja.Start() ; #DEBUG_LINE_NO:619
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetObjectiveCompleted(320, True) ; #DEBUG_LINE_NO:635
  Self.SetObjectiveDisplayed(340, True, False) ; #DEBUG_LINE_NO:636
  Alias_StationDoor.GetReference().SetOpen(True) ; #DEBUG_LINE_NO:637
  COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340.Start() ; #DEBUG_LINE_NO:638
EndFunction

Function Fragment_Stage_0342_Item_00()
  Alias_Tomisar.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:646
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(340, True) ; #DEBUG_LINE_NO:654
  Self.SetObjectiveDisplayed(360, True, False) ; #DEBUG_LINE_NO:655
  Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(), 0.0) ; #DEBUG_LINE_NO:657
  Alias_Tomisar.GetActorReference().SetGhost(False) ; #DEBUG_LINE_NO:658
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(360, True) ; #DEBUG_LINE_NO:666
  Self.SetObjectiveDisplayed(370, True, False) ; #DEBUG_LINE_NO:667
EndFunction

Function Fragment_Stage_0375_Item_00()
  Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:675
  Self.SetObjectiveDisplayed(375, True, False) ; #DEBUG_LINE_NO:676
  Alias_Tomisar.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:677
EndFunction

Function Fragment_Stage_0380_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:685
EndFunction

Function Fragment_Stage_0381_Item_00()
  Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:693
  Self.SetStage(400) ; #DEBUG_LINE_NO:694
  Self.SetStage(500) ; #DEBUG_LINE_NO:695
  COM_Quest_Andreja_Q01_Stage381_TomisarBarks.Start() ; #DEBUG_LINE_NO:696
EndFunction

Function Fragment_Stage_0385_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:704
EndFunction

Function Fragment_Stage_0390_Item_00()
  Alias_Tomisar.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:713
EndFunction

Function Fragment_Stage_0399_Item_00()
  Alias_Andreja.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:721
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(370) ; #DEBUG_LINE_NO:730
    Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:731
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(375) ; #DEBUG_LINE_NO:733
    Self.SetObjectiveCompleted(375, True) ; #DEBUG_LINE_NO:734
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(381) == False ; #DEBUG_LINE_NO:736
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:737
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:754
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:755
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:757
  Alias_Andreja.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:758
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:766
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:767
  Alias_Andreja.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:768
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:776
  (Alias_Andreja.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest() ; #DEBUG_LINE_NO:779
  SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:782
  Game.GetPlayer().SetValue(COM_Quest_Andreja_Q01_Complete_AV, 1.0) ; #DEBUG_LINE_NO:785
  Self.Stop() ; #DEBUG_LINE_NO:788
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:796
  Self.Stop() ; #DEBUG_LINE_NO:797
EndFunction
