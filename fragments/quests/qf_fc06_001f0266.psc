ScriptName Fragments:Quests:QF_FC06_001F0266 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC06_BenWalkAndTalkScene Auto Const mandatory
Scene Property FC06_BenAriScene Auto Const mandatory
ObjectReference Property FC06_PT1 Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_PrivacyWingKeycard Auto Const mandatory
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
ReferenceAlias Property Alias_MayaEncryptedDataslate Auto Const mandatory
ReferenceAlias Property Alias_MayaCruz Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property FC06_ClinicSystemsDisrupted Auto Const mandatory
ObjectReference Property FC06_MayasHideoutMapMarkerRef Auto Const mandatory
Scene Property FC06_MayaCruzPAGreetingScene Auto Const mandatory
ReferenceAlias Property Alias_PrivacyWingGuard Auto Const mandatory
ReferenceAlias Property Alias_VIPWingDoor Auto Const mandatory
Scene Property FC06_AriWalkToTerminal Auto Const mandatory
Scene Property FC06_AriSearchRecords Auto Const mandatory
ReferenceAlias Property Alias_AriMiller Auto Const mandatory
Key Property FC06_ClinicVIPWingKeycard Auto Const mandatory
ActorValue Property FC06_Completed Auto Const mandatory
ReferenceAlias Property Alias_ClinicShip Auto Const mandatory
Faction Property FC06_MayaCruzBoardingFaction Auto Const
Faction Property LC056MayaCruzFaction Auto Const mandatory
Quest Property FC06Post Auto Const mandatory
ReferenceAlias Property Alias_MayasHideoutMapMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_MayasHideoutMapMarker Auto Const mandatory
ReferenceAlias Property Alias_BenArmistead Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_LC056_LoadElevatorController Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1050_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, 500, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:26
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:27
  FC06_ClinicSystemsDisrupted.SetValue(1.0) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:40
  FC06_BenWalkAndTalkScene.Start() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0300_Item_00()
  FC06_BenAriScene.Start() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_BenArmistead.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0410_Item_00()
  FC06_AriWalkToTerminal.Start() ; #DEBUG_LINE_NO:77
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:79
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0420_Item_00()
  FC06_AriSearchRecords.Start() ; #DEBUG_LINE_NO:90
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveDisplayed(320, True, False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(320, True) ; #DEBUG_LINE_NO:103
  Self.SetObjectiveDisplayed(330, True, False) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_AriMiller.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:120
  Self.SetStage(500) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(330, True) ; #DEBUG_LINE_NO:132
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0525_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:142
  Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:143
  Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:144
  Self.SetStage(900) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0570_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:153
  Int CreditAmountSmall = NPCDemandMoney_Small.GetValue() as Int ; #DEBUG_LINE_NO:156
  Int CreditAmountLarge = NPCDemandMoney_Large.GetValue() as Int ; #DEBUG_LINE_NO:157
  If Self.GetStageDone(760) ; #DEBUG_LINE_NO:159
    Alias_Player.GetActorRef().AddItem(Credits as Form, CreditAmountLarge, False) ; #DEBUG_LINE_NO:160
  Else ; #DEBUG_LINE_NO:
    Alias_Player.GetActorRef().AddItem(Credits as Form, CreditAmountSmall, False) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0580_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:181
  If Self.GetStageDone(700) ; #DEBUG_LINE_NO:183
    Self.SetStage(800) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:194
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:196
    Self.SetStage(800) ; #DEBUG_LINE_NO:197
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:216
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0900_Item_01()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:225
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0900_Item_02()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:234
  Self.SetStage(1100) ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0900_Item_03()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:244
  Self.SetStage(1100) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_PrivacyWingGuard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(1050) ; #DEBUG_LINE_NO:262
  If Self.IsObjectiveDisplayed(650) == True ; #DEBUG_LINE_NO:264
    Self.SetStage(1100) ; #DEBUG_LINE_NO:265
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0975_Item_00()
  Self.SetStage(1050) ; #DEBUG_LINE_NO:274
  If Self.IsObjectiveDisplayed(650) == True ; #DEBUG_LINE_NO:276
    Self.SetStage(1100) ; #DEBUG_LINE_NO:277
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_PrivacyWingKeycard.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:286
  Self.SetStage(1050) ; #DEBUG_LINE_NO:288
  Self.SetStage(1100) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_1100_Item_00()
  If Self.IsObjectiveDisplayed(600) ; #DEBUG_LINE_NO:305
    Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:306
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:309
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:310
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetObjectiveDisplayed(700, False, False) ; #DEBUG_LINE_NO:318
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:319
EndFunction

Function Fragment_Stage_1175_Item_00()
  Self.SetStage(1200) ; #DEBUG_LINE_NO:327
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:335
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:336
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:344
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_1325_Item_00()
  FC06_ClinicSystemsDisrupted.SetValue(0.0) ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_1340_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:362
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:363
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:364
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:365
  Self.SetObjectiveCompleted(320, True) ; #DEBUG_LINE_NO:366
  Self.SetObjectiveCompleted(330, True) ; #DEBUG_LINE_NO:367
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:368
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:369
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:370
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:372
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:373
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:374
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:375
  Self.SetObjectiveCompleted(950, True) ; #DEBUG_LINE_NO:376
  Alias_MayasHideoutMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:378
  Self.SetStage(1350) ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_1350_Item_00()
  Self.SetObjectiveDisplayed(975, True, False) ; #DEBUG_LINE_NO:388
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(975, True) ; #DEBUG_LINE_NO:396
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:397
  Alias_MayasHideoutMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:400
  Alias_ClinicShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:403
  Game.GetPlayer().addtoFaction(FC06_MayaCruzBoardingFaction) ; #DEBUG_LINE_NO:406
EndFunction

Function Fragment_Stage_1402_Item_00()
  FC06_MayaCruzPAGreetingScene.Start() ; #DEBUG_LINE_NO:414
EndFunction

Function Fragment_Stage_1405_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:422
  Self.SetObjectiveDisplayed(1025, True, False) ; #DEBUG_LINE_NO:423
  Actor MayaCruz = Alias_MayaCruz.GetActorRef() ; #DEBUG_LINE_NO:425
  MayaCruz.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:427
  MayaCruz.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:428
  MayaCruz.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:429
  MayaCruz.RemoveFromFaction(LC056MayaCruzFaction) ; #DEBUG_LINE_NO:430
  MayaCruz.addtoFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:431
  MayaCruz.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:432
  MayaCruz.StopCombat() ; #DEBUG_LINE_NO:433
  Alias_Companion.GetActorRef().StopCombat() ; #DEBUG_LINE_NO:436
EndFunction

Function Fragment_Stage_1410_Item_00()
  Actor MayaCruz = Alias_MayaCruz.GetActorRef() ; #DEBUG_LINE_NO:444
  MayaCruz.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:446
  MayaCruz.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:447
  MayaCruz.ResetHealthAndLimbs() ; #DEBUG_LINE_NO:448
  MayaCruz.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:449
EndFunction

Function Fragment_Stage_1425_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_MayaEncryptedDataslate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:458
  Self.SetStage(1600) ; #DEBUG_LINE_NO:460
  Alias_MayaCruz.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:462
EndFunction

Function Fragment_Stage_1440_Item_00()
  Self.SetObjectiveCompleted(1025, True) ; #DEBUG_LINE_NO:470
  Self.SetObjectiveDisplayed(1050, True, False) ; #DEBUG_LINE_NO:471
  Actor MayaCruz = Alias_MayaCruz.GetActorRef() ; #DEBUG_LINE_NO:473
  MayaCruz.AllowBleedoutDialogue(False) ; #DEBUG_LINE_NO:475
  MayaCruz.SetEssential(False) ; #DEBUG_LINE_NO:476
  MayaCruz.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:477
  MayaCruz.StartCombat(Alias_Player.GetActorRef() as ObjectReference, False) ; #DEBUG_LINE_NO:478
  MayaCruz.ResetHealthAndLimbs() ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_1450_Item_00()
  Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:489
  Self.SetStage(1500) ; #DEBUG_LINE_NO:491
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:499
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:500
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1025, True) ; #DEBUG_LINE_NO:508
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:509
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:510
  Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1.0) ; #DEBUG_LINE_NO:513
  If !FC_EncryptedSlateQuest.IsRunning() ; #DEBUG_LINE_NO:516
    FC_EncryptedSlateQuest.Start() ; #DEBUG_LINE_NO:517
  EndIf ; #DEBUG_LINE_NO:
  loadelevatorfloorscript floorScript = Alias_LC056_LoadElevatorController.GetRef() as loadelevatorfloorscript ; #DEBUG_LINE_NO:521
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:530
  If Alias_MayaCruz.GetActorRef().IsDead() == False ; #DEBUG_LINE_NO:533
    FC06Post.Start() ; #DEBUG_LINE_NO:534
  EndIf ; #DEBUG_LINE_NO:
  Alias_Player.GetActorRef().RemoveItem(Alias_MayaEncryptedDataslate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:538
  Alias_Player.GetActorRef().SetValue(FC06_Completed, 1.0) ; #DEBUG_LINE_NO:541
  Game.AddAchievement(15) ; #DEBUG_LINE_NO:544
  Self.Stop() ; #DEBUG_LINE_NO:546
EndFunction
