ScriptName Fragments:Quests:QF_FC04_0026621E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property FC04_OpenWarehouseDoor Auto Const mandatory
Faction Property FC04_EmmettEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_EmmettAndHenchman Auto Const mandatory
Scene Property FC04_JaylenBackupScene Auto Const mandatory
Scene Property FC04_JaylenBillyChatScene Auto Const mandatory
Scene Property FC04_GraceConfessScene Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property FC04_JaylenTalkToBilly Auto Const mandatory
ReferenceAlias Property Alias_JaylenPryce Auto Const mandatory
ReferenceAlias Property Alias_BillyClayton Auto Const mandatory
ReferenceAlias Property Alias_GraceEarly Auto Const mandatory
Quest Property FC05 Auto Const mandatory
Quest Property FC06 Auto Const mandatory
ReferenceAlias Property Alias_WarehouseDoor Auto Const mandatory
ReferenceAlias Property Alias_EmmetGoodman Auto Const mandatory
ReferenceAlias Property Alias_SyndicateDoorman Auto Const mandatory
Cell Property CityNeonWarehouseEmmetsLair Auto Const mandatory
ObjectReference Property FC04_PT1 Auto Const mandatory
Scene Property FC04_JaylenWalkTalkScene Auto Const mandatory
Scene Property FC04_JaylenBillyIntroductionScene Auto Const mandatory
ReferenceAlias Property Alias_WarehouseKey Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
ObjectReference Property FC04_JaylenSt800SceneMarker Auto Const mandatory
ReferenceAlias Property Alias_GraceSlate Auto Const mandatory
ActorValue Property FC04_Completed Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const mandatory
Quest Property FC_EvidenceSlateHolderQuest Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ObjectReference Property FC04_CompanionStandMarker Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000) ; #DEBUG_LINE_NO:10
  FC01_PostQuest.SetStage(2000) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:19
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:20
  Alias_BillyClayton.GetRef().Enable(False) ; #DEBUG_LINE_NO:23
  If COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300) ; #DEBUG_LINE_NO:25
    COM_Quest_SamCoe_Q01.SetStage(110) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:35
    Self.SetStage(500) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0210_Item_00()
  FC04_JaylenWalkTalkScene.Start() ; #DEBUG_LINE_NO:63
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0250_Item_00()
  FC04_JaylenWalkTalkScene.Stop() ; #DEBUG_LINE_NO:76
  FC04_JaylenBillyIntroductionScene.Start() ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:87
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0330_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, 500, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0380_Item_00()
  If Alias_SyndicateDoorman.GetActorRef().IsDead() || Alias_SyndicateDoorman.GetActorRef() == None ; #DEBUG_LINE_NO:107
    Alias_WarehouseDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:108
    Self.SetStage(500) ; #DEBUG_LINE_NO:109
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:110
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:111
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(400) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_SyndicateDoorman.GetRef().Enable(False) ; #DEBUG_LINE_NO:125
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:127
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:129
    Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:130
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:143
  Alias_SyndicateDoorman.GetActorRef().AddItem(Credits as Form, NPCDemandMoney_Small.GetValue() as Int, False) ; #DEBUG_LINE_NO:144
  Self.SetStage(460) ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_WarehouseKey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:157
  FC04_OpenWarehouseDoor.Start() ; #DEBUG_LINE_NO:160
  CityNeonWarehouseEmmetsLair.SetPublic(True) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(250) ; #DEBUG_LINE_NO:174
    Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:175
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_EmmetGoodman.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:185
  Alias_Companion.GetRef().MoveTo(FC04_CompanionStandMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0520_Item_00()
  Int CreditAmount = NPCDemandMoney_Large.GetValue() as Int ; #DEBUG_LINE_NO:198
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, CreditAmount, False, None) ; #DEBUG_LINE_NO:200
  Alias_EmmetGoodman.GetActorRef().AddItem(Credits as Form, CreditAmount, False) ; #DEBUG_LINE_NO:201
  If Self.IsObjectiveDisplayed(320) ; #DEBUG_LINE_NO:203
    Self.SetObjectiveCompleted(320, True) ; #DEBUG_LINE_NO:204
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveDisplayed(320, True, False) ; #DEBUG_LINE_NO:215
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0560_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC04_EmmettEnemyFaction) ; #DEBUG_LINE_NO:232
  Alias_EmmettAndHenchman.EvaluateAll() ; #DEBUG_LINE_NO:235
  Alias_EmmettAndHenchman.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0570_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:244
  If Self.IsObjectiveDisplayed(320) ; #DEBUG_LINE_NO:246
    Self.SetObjectiveDisplayed(320, False, False) ; #DEBUG_LINE_NO:247
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:256
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:257
  Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenTalkToBilly, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:260
  FC04_JaylenBillyChatScene.Start() ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0700_Item_00()
  FC04_JaylenBackupScene.Start() ; #DEBUG_LINE_NO:272
  Alias_BillyClayton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:275
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:278
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:281
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:282
  EndIf ; #DEBUG_LINE_NO:
  Alias_GraceEarly.GetRef().Enable(False) ; #DEBUG_LINE_NO:286
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenSt800SceneMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:298
EndFunction

Function Fragment_Stage_0800_Item_00()
  FC04_GraceConfessScene.Start() ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_GraceSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:324
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:326
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:327
  If COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300) ; #DEBUG_LINE_NO:331
    COM_Quest_SamCoe_Q01.SetStage(120) ; #DEBUG_LINE_NO:332
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0925_Item_00()
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:341
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:342
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Alias_GraceSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:359
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:360
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:368
  Alias_Player.GetActorRef().SetValue(FC04_Completed, 1.0) ; #DEBUG_LINE_NO:371
  FCQuests_MeetingRoomPackages.SetValue(1.0) ; #DEBUG_LINE_NO:374
  FC_EncryptedSlateQuest.Start() ; #DEBUG_LINE_NO:377
  FC05.Start() ; #DEBUG_LINE_NO:380
  FC06.Start() ; #DEBUG_LINE_NO:383
  FC_EvidenceSlateHolderQuest.Start() ; #DEBUG_LINE_NO:386
  Self.Stop() ; #DEBUG_LINE_NO:389
EndFunction
