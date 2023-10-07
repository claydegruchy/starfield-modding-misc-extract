ScriptName Fragments:Quests:QF_CF07_001EF7F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
Quest Property LC107 Auto Const mandatory
ReferenceAlias Property Alias_CF07_DataCoreEmpty Auto Const mandatory
ReferenceAlias Property Alias_CF07_Jazz Auto Const mandatory
ReferenceAlias Property Alias_CF07_Delgado Auto Const mandatory
ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const mandatory
ObjectReference Property CF07_JazzSceneMarkerRef Auto Const mandatory
Scene Property CF07_Stage000_Delgado_PreScene Auto Const mandatory
ObjectReference Property CF07_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF07_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF07_Toft Auto Const mandatory
Scene Property CF07_zLegacy002_Callout_VaultAccess Auto Const mandatory
Scene Property CF07_Stage110_Kibwe_PreScene Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Message Property CF07_Stage500_Message Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088 Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Message Property CF06_ConductionGridMessage Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF07_KibweMarkerRef Auto Const mandatory
ObjectReference Property CF07_ToftMarkerRef Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Message Property CF05_ComSpikeMessage Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ObjectReference Property CF01PlayerOpsMarker Auto Const mandatory
Location Property LC107LegacyLocation Auto Const mandatory
Location Property LC107LegacySpaceCellLocation Auto Const mandatory
ReferenceAlias Property Alias_CF07_VigilanceShip Auto Const mandatory
ReferenceAlias Property Alias_CF07_CGDecryptedSlate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0240_Item_01()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:9
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:12
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:13
  Self.SetStage(10) ; #DEBUG_LINE_NO:15
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:19
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:21
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
  LC082.UpdateVigilanceLocation("CF07") ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:36
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:39
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:40
  Self.SetStage(10) ; #DEBUG_LINE_NO:42
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:43
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:44
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:46
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:47
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:48
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:50
  Game.GetPlayer().MoveTo(CF07_StartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
  LC082.UpdateVigilanceLocation("CF07") ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:64
  CF05.SetStage(2200) ; #DEBUG_LINE_NO:67
  CF05.SetStage(11000) ; #DEBUG_LINE_NO:68
  Self.SetStage(10) ; #DEBUG_LINE_NO:70
  Self.SetStage(20) ; #DEBUG_LINE_NO:71
  Self.SetStage(40) ; #DEBUG_LINE_NO:72
  Self.SetStage(110) ; #DEBUG_LINE_NO:73
  Self.SetStage(120) ; #DEBUG_LINE_NO:74
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:75
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:76
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:78
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:79
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:80
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:81
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:82
  Game.GetPlayer().MoveTo(CF01PlayerOpsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Alias_CF07_CGDecryptedSlate.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:91
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:93
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:96
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:97
  LC082.UpdateVigilanceLocation("CF07") ; #DEBUG_LINE_NO:100
  Self.SetActive(True) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0012_Item_00()
  CF07_Stage000_Delgado_PreScene.Start() ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0015_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF07_CGDecryptedSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(110) == True ; #DEBUG_LINE_NO:130
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:131
    Self.SetStage(210) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(120) == True ; #DEBUG_LINE_NO:135
    Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:136
    Self.SetStage(210) ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:146
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:147
  Game.GetPlayer().AddItem(Alias_CF07_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:150
  CF06_ConductionGridMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:153
  Alias_CF07_Delgado.TryToEvaluatePackage() ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:164
  Self.SetStage(110) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0040_Item_01()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:173
  Self.SetStage(210) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:182
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:184
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:185
  DialogueUCVigilance.SetStage(5) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:196
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0125_Item_00()
  CF07_Stage110_Kibwe_PreScene.Start() ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0150_Item_00()
  CF_Main.SetStage(275) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:215
  Self.SetStage(210) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0160_Item_00()
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:224
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:226
  Self.SetStage(210) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:236
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:237
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:238
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:239
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:240
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:241
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:242
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:243
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:244
  LC107LegacyLocation.Reset() ; #DEBUG_LINE_NO:245
  LC107LegacySpaceCellLocation.Reset() ; #DEBUG_LINE_NO:246
  LC107.SetStage(0) ; #DEBUG_LINE_NO:247
  Self.SetStage(230) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0201_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:257
  Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:258
  Alias_CF07_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:259
  Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:260
  Alias_CF07_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:261
  Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:262
  Alias_CF07_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:263
  Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:264
  Alias_CF07_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:265
  LC107LegacyLocation.Reset() ; #DEBUG_LINE_NO:266
  LC107LegacySpaceCellLocation.Reset() ; #DEBUG_LINE_NO:267
  LC107.SetStage(4) ; #DEBUG_LINE_NO:268
  Self.SetStage(230) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:277
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:278
  LC107LegacyLocation.Reset() ; #DEBUG_LINE_NO:281
  LC107LegacySpaceCellLocation.Reset() ; #DEBUG_LINE_NO:282
  LC107.SetStage(20) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:291
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:300
  Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveDisplayed(240, True, False) ; #DEBUG_LINE_NO:309
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(240, True) ; #DEBUG_LINE_NO:325
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0255_Item_00()
  CF07_zLegacy002_Callout_VaultAccess.Start() ; #DEBUG_LINE_NO:335
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:336
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveDisplayed(260, True, False) ; #DEBUG_LINE_NO:344
EndFunction

Function Fragment_Stage_0265_Item_00()
  Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_0266_Item_00()
  If !Self.IsObjectiveCompleted(260) ; #DEBUG_LINE_NO:363
    Self.SetObjectiveDisplayed(260, False, False) ; #DEBUG_LINE_NO:364
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:373
  Self.SetObjectiveDisplayed(270, True, False) ; #DEBUG_LINE_NO:374
EndFunction

Function Fragment_Stage_0275_Item_00()
  If Self.GetStageDone(276) == True ; #DEBUG_LINE_NO:382
    Self.SetStage(280) ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0276_Item_00()
  If Self.GetStageDone(275) == True ; #DEBUG_LINE_NO:392
    Self.SetStage(280) ; #DEBUG_LINE_NO:393
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:402
  Self.SetObjectiveDisplayed(280, True, False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(280, True) ; #DEBUG_LINE_NO:411
  Self.SetObjectiveDisplayed(290, True, False) ; #DEBUG_LINE_NO:412
  LC107.SetStage(330) ; #DEBUG_LINE_NO:415
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(290, True) ; #DEBUG_LINE_NO:424
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:434
  Self.SetObjectiveDisplayed(360, True, False) ; #DEBUG_LINE_NO:435
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(360, True) ; #DEBUG_LINE_NO:444
  Self.SetObjectiveDisplayed(370, True, False) ; #DEBUG_LINE_NO:445
EndFunction

Function Fragment_Stage_0380_Item_00()
  Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:454
  Self.SetObjectiveDisplayed(380, True, False) ; #DEBUG_LINE_NO:455
EndFunction

Function Fragment_Stage_0390_Item_00()
  LC107.SetStage(500) ; #DEBUG_LINE_NO:466
EndFunction

Function Fragment_Stage_0395_Item_00()
  LC107.SetStage(510) ; #DEBUG_LINE_NO:477
EndFunction

Function Fragment_Stage_0397_Item_00()
  LC107.SetStage(520) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(380, True) ; #DEBUG_LINE_NO:497
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:498
  If !Self.IsObjectiveCompleted(270) ; #DEBUG_LINE_NO:501
    Self.SetObjectiveDisplayed(270, False, False) ; #DEBUG_LINE_NO:502
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(280) ; #DEBUG_LINE_NO:504
    Self.SetObjectiveDisplayed(280, False, False) ; #DEBUG_LINE_NO:505
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(290) ; #DEBUG_LINE_NO:507
    Self.SetObjectiveDisplayed(290, False, False) ; #DEBUG_LINE_NO:508
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(300) ; #DEBUG_LINE_NO:510
    Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:511
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(360) ; #DEBUG_LINE_NO:513
    Self.SetObjectiveDisplayed(360, False, False) ; #DEBUG_LINE_NO:514
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(370) ; #DEBUG_LINE_NO:516
    Self.SetObjectiveDisplayed(370, False, False) ; #DEBUG_LINE_NO:517
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(380) ; #DEBUG_LINE_NO:519
    Self.SetObjectiveDisplayed(380, False, False) ; #DEBUG_LINE_NO:520
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0499_Item_00()
  CF07_Stage500_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:529
EndFunction

Function Fragment_Stage_0500_Item_00()
  LC107.SetStageNoWait(1000) ; #DEBUG_LINE_NO:538
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:540
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:541
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:542
  Self.SetStage(550) ; #DEBUG_LINE_NO:543
  LC088.Start() ; #DEBUG_LINE_NO:546
  LC088_Space.Start() ; #DEBUG_LINE_NO:547
EndFunction

Function Fragment_Stage_0500_Item_01()
  LC107.SetStage(1000) ; #DEBUG_LINE_NO:556
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:558
  Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:559
  LC088.Start() ; #DEBUG_LINE_NO:562
  LC088_Space.Start() ; #DEBUG_LINE_NO:563
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Alias_Companion.GetRef() != None ; #DEBUG_LINE_NO:572
    Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:573
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0555_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:582
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:590
  Self.SetObjectiveDisplayed(420, False, False) ; #DEBUG_LINE_NO:591
  LC107.SetStage(2000) ; #DEBUG_LINE_NO:592
  CF_Main.SetStage(200) ; #DEBUG_LINE_NO:595
  Self.Stop() ; #DEBUG_LINE_NO:597
EndFunction

Function Fragment_Stage_1500_Item_00()
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:606
    CF_Main.SetStage(300) ; #DEBUG_LINE_NO:607
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(420) == True ; #DEBUG_LINE_NO:610
    Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(430) == True ; #DEBUG_LINE_NO:613
    Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:614
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(410, False, False) ; #DEBUG_LINE_NO:616
  LC107.SetStage(2000) ; #DEBUG_LINE_NO:617
  Self.Stop() ; #DEBUG_LINE_NO:618
EndFunction

Function Fragment_Stage_1500_Item_01()
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:627
    CF_Main.SetStage(300) ; #DEBUG_LINE_NO:628
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(420) == True ; #DEBUG_LINE_NO:631
    Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:632
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(430) == True ; #DEBUG_LINE_NO:634
    Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:635
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(410, False, False) ; #DEBUG_LINE_NO:637
  LC107.SetStage(2000) ; #DEBUG_LINE_NO:638
  Self.Stop() ; #DEBUG_LINE_NO:639
EndFunction
