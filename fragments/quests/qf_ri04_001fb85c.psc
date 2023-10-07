ScriptName Fragments:Quests:QF_RI04_001FB85C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nyx Auto Const mandatory
ReferenceAlias Property Alias_NyxFurniture Auto Const mandatory
ReferenceAlias Property Alias_NyxMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_DaltonQS Auto Const mandatory
ReferenceAlias Property Alias_NyxProgram Auto Const mandatory
ReferenceAlias Property Alias_Dalton Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvageQS Auto Const mandatory
ReferenceAlias Property Alias_NyxApartmentQS Auto Const mandatory
ReferenceAlias Property Alias_RyujinTowerQS Auto Const mandatory
MiscObject Property RI04_NyxProgram Auto Const mandatory
MiscObject Property RI04_EncryptedFiles Auto Const mandatory
Scene Property RI04_0000_Masako_DaltonIntercomScene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_NyxEncryptedData Auto Const mandatory
GlobalVariable Property RI04_RyujinTowerBodyCount Auto Const mandatory
GlobalVariable Property RI_TotalBodyCount Auto Const mandatory
GlobalVariable Property RI04_RyujinTowerArrestsCount Auto Const mandatory
GlobalVariable Property RI_TotalArrestCount Auto Const mandatory
Scene Property RI04_0400_Companion_InfiltrationCompleteScene Auto Const mandatory
Weapon Property Disruptor Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
ReferenceAlias Property Alias_UlaruQS Auto Const mandatory
ReferenceAlias Property Alias_CamdenQS Auto Const mandatory
Quest Property RI05 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Ammo Property AmmoNeuralDisrupter Auto Const mandatory
ReferenceAlias Property Alias_NovablastDisrupter Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor01 Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor02 Auto Const mandatory
ReferenceAlias Property Alias_NyxMonitor03 Auto Const mandatory
ReferenceAlias Property Alias_NyxLapTopEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_VentEntrance Auto Const mandatory
ReferenceAlias Property Alias_VentFinalExit Auto Const mandatory
ReferenceAlias Property Alias_CraneButton Auto Const mandatory
ReferenceAlias Property Alias_NyxBackpack Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const mandatory
ReferenceAlias Property Alias_DRONESanitationBot Auto Const mandatory
ReferenceAlias Property Alias_DRONESecurityBot Auto Const mandatory
Faction Property LC044RyujinGuardCrimeFaction Auto Const mandatory
ReferenceAlias Property Alias_NyxExteriorApartmentDoor Auto Const mandatory
GlobalVariable Property RI04_TowerGuardsEnteredCombat Auto Const mandatory
GlobalVariable Property SE_Player_ZW13_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:7
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:8
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(100) ; #DEBUG_LINE_NO:10
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:12
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:13
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:22
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:23
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:24
  Self.SetStage(100) ; #DEBUG_LINE_NO:25
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:27
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:28
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:37
  RI_Support.SetStage(1110) ; #DEBUG_LINE_NO:38
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:39
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:40
  Self.SetStage(200) ; #DEBUG_LINE_NO:41
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:43
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:44
  PlayerRef.MoveTo(Alias_MadameSauvageQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:46
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:55
  Self.SetStage(360) ; #DEBUG_LINE_NO:56
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:58
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:59
  PlayerRef.MoveTo(Alias_RyujinTowerQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:61
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:62
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0004_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:72
  LC044.SetStage(10) ; #DEBUG_LINE_NO:73
  Self.SetStage(400) ; #DEBUG_LINE_NO:74
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:76
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:77
  PlayerRef.MoveTo(Alias_UlaruQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:78
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:79
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:80
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:81
  LC044RyujinGuardCrimeFaction.ModCrimeGold(100, False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0005_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:90
  LC044.SetStage(10) ; #DEBUG_LINE_NO:91
  Self.SetStage(400) ; #DEBUG_LINE_NO:92
  Self.SetStage(500) ; #DEBUG_LINE_NO:93
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:95
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:96
  PlayerRef.MoveTo(Alias_CamdenQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:97
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:98
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:99
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:100
  LC044RyujinGuardCrimeFaction.ModCrimeGold(100, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0006_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:109
  Self.SetStage(600) ; #DEBUG_LINE_NO:110
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:112
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:113
  PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:114
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:115
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:116
  PlayerRef.AddItem(Alias_NyxProgram.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:117
  Alias_NyxExteriorApartmentDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0007_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:126
  Self.SetStage(900) ; #DEBUG_LINE_NO:127
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:129
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:130
  PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:131
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:132
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:133
  Alias_NyxExteriorApartmentDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:142
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:143
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:144
  Self.SetStage(1000) ; #DEBUG_LINE_NO:145
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:147
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:148
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:149
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:150
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:151
  PlayerRef.AddAliasedItem(RI04_EncryptedFiles as Form, Alias_NyxEncryptedData as Alias, 1, True) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:160
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:161
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:162
  Self.SetStage(1300) ; #DEBUG_LINE_NO:163
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:165
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:166
  PlayerRef.MoveTo(Alias_DaltonQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:167
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:168
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:177
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:178
  If Game.GetPlayer().GetDistance(Alias_Masako.GetRef()) < 100.0 ; #DEBUG_LINE_NO:180
    RI04_0000_Masako_DaltonIntercomScene.Start() ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
  RI04_RyujinTowerBodyCount.SetValue(RI_TotalBodyCount.GetValue()) ; #DEBUG_LINE_NO:184
  RI04_RyujinTowerArrestsCount.SetValue(RI_TotalArrestCount.GetValue()) ; #DEBUG_LINE_NO:185
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:201
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:202
  Alias_Nyx.GetRef().MoveTo(Alias_NyxFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:204
  Alias_NyxBackpack.GetRef().Disable(False) ; #DEBUG_LINE_NO:205
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:207
  PlayerRef.AddAliasedItem(Disruptor as Form, Alias_NovablastDisrupter as Alias, 1, False) ; #DEBUG_LINE_NO:208
  PlayerRef.AddItem(AmmoNeuralDisrupter as Form, 500, False) ; #DEBUG_LINE_NO:209
  Alias_NyxLapTopEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:219
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:228
EndFunction

Function Fragment_Stage_0335_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0340_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0360_Item_00()
  Game.GetPlayer().AddItem(Alias_NyxProgram.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:252
  Self.SetStage(375) ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_0375_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:261
  Self.SetObjectiveDisplayed(375, True, False) ; #DEBUG_LINE_NO:262
  LC044.SetStage(10) ; #DEBUG_LINE_NO:264
  ObjectReference VentRef = Alias_VentEntrance.GetRef() ; #DEBUG_LINE_NO:266
  VentRef.Lock(False, False, True) ; #DEBUG_LINE_NO:267
  ObjectReference VentExitRef = Alias_VentFinalExit.GetRef() ; #DEBUG_LINE_NO:269
  VentExitRef.Lock(False, False, True) ; #DEBUG_LINE_NO:270
  Alias_CraneButton.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:272
  Alias_DRONESanitationBot.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:274
  Alias_DRONESecurityBot.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0380_Item_00()
  Alias_CraneButton.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0385_Item_00()
  Alias_CraneButton.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_0390_Item_00()
  LC044.SetStage(11) ; #DEBUG_LINE_NO:299
  Self.SetStage(400) ; #DEBUG_LINE_NO:300
  If Self.GetStageDone(350) ; #DEBUG_LINE_NO:302
    Self.SetStage(500) ; #DEBUG_LINE_NO:303
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(375, True) ; #DEBUG_LINE_NO:313
  Self.SetObjectiveDisplayedAtTop(400) ; #DEBUG_LINE_NO:314
  Self.SetObjectiveDisplayed(405, True, False) ; #DEBUG_LINE_NO:316
  If Game.GetPlayer().GetEquippedWeapon(0) == Disruptor ; #DEBUG_LINE_NO:317
    Self.SetObjectiveCompleted(405, True) ; #DEBUG_LINE_NO:318
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0405_Item_00()
  RI04_TowerGuardsEnteredCombat.SetValue(1.0) ; #DEBUG_LINE_NO:327
EndFunction

Function Fragment_Stage_0406_Item_00()
  Self.SetObjectiveCompleted(405, True) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0450_Item_00()
  LC044.SetStage(15) ; #DEBUG_LINE_NO:343
EndFunction

Function Fragment_Stage_0460_Item_00()
  LC044.SetStage(13) ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_0480_Item_00()
  LC044.SetStage(30) ; #DEBUG_LINE_NO:359
EndFunction

Function Fragment_Stage_0499_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:367
  If Self.GetStageDone(350) ; #DEBUG_LINE_NO:369
    If Self.GetStageDone(550) ; #DEBUG_LINE_NO:370
      Self.SetStage(575) ; #DEBUG_LINE_NO:371
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(575) ; #DEBUG_LINE_NO:374
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayedAtTop(500) ; #DEBUG_LINE_NO:383
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:391
  If Self.GetStageDone(499) ; #DEBUG_LINE_NO:393
    Self.SetStage(575) ; #DEBUG_LINE_NO:394
  EndIf ; #DEBUG_LINE_NO:
  RI04_Track_PlayerStoleCamdenChoInfo.SetValue(1.0) ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveDisplayed(575, True, False) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_0590_Item_00()
  RI04_0400_Companion_InfiltrationCompleteScene.Start() ; #DEBUG_LINE_NO:413
  Self.SetStage(600) ; #DEBUG_LINE_NO:414
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(575, True) ; #DEBUG_LINE_NO:422
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:423
  If Self.IsObjectiveDisplayed(405) ; #DEBUG_LINE_NO:424
    Self.SetObjectiveDisplayed(405, False, False) ; #DEBUG_LINE_NO:425
  EndIf ; #DEBUG_LINE_NO:
  Alias_NyxLapTopEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:428
  Alias_Nyx.GetRef().MoveTo(Alias_NyxMoveToMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:429
  Alias_NyxBackpack.GetRef().Enable(False) ; #DEBUG_LINE_NO:430
  Alias_NyxExteriorApartmentDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:431
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:439
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_0750_Item_00()
  Game.GetPlayer().RemoveItem(RI04_NyxProgram as Form, 1, False, None) ; #DEBUG_LINE_NO:448
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:456
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:457
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_NyxMonitor01.GetRef().PlayAnimation("Play01") ; #DEBUG_LINE_NO:465
  Alias_NyxMonitor02.GetRef().PlayAnimation("Play01") ; #DEBUG_LINE_NO:466
  Alias_NyxMonitor03.GetRef().PlayAnimation("Play01") ; #DEBUG_LINE_NO:467
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_NyxMonitor01.GetRef().PlayAnimation("Play02") ; #DEBUG_LINE_NO:475
  Alias_NyxMonitor02.GetRef().PlayAnimation("Play02") ; #DEBUG_LINE_NO:476
  Alias_NyxMonitor03.GetRef().PlayAnimation("Play02") ; #DEBUG_LINE_NO:477
  Alias_Nyx.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:479
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:481
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:482
EndFunction

Function Fragment_Stage_0910_Item_00()
  Game.GetPlayer().AddAliasedItem(RI04_EncryptedFiles as Form, Alias_NyxEncryptedData as Alias, 1, True) ; #DEBUG_LINE_NO:490
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:498
  RI05.SetStage(100) ; #DEBUG_LINE_NO:499
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:502
  SE_Player_ZW13_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:503
  Self.Stop() ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:513
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:514
  LC044.SetStage(20) ; #DEBUG_LINE_NO:516
  ObjectReference VentRef = Alias_VentEntrance.GetRef() ; #DEBUG_LINE_NO:518
  VentRef.Lock(True, False, True) ; #DEBUG_LINE_NO:519
  VentRef.SetLockLevel(254) ; #DEBUG_LINE_NO:520
  ObjectReference VentExitRef = Alias_VentFinalExit.GetRef() ; #DEBUG_LINE_NO:522
  VentExitRef.Lock(True, False, True) ; #DEBUG_LINE_NO:523
  VentExitRef.SetLockLevel(254) ; #DEBUG_LINE_NO:524
  Float fBodyCount = RI_TotalBodyCount.GetValue() - RI04_RyujinTowerBodyCount.GetValue() ; #DEBUG_LINE_NO:527
  RI04_RyujinTowerBodyCount.SetValue(fBodyCount) ; #DEBUG_LINE_NO:528
  Float fArrestCount = RI_TotalArrestCount.GetValue() - RI04_RyujinTowerArrestsCount.GetValue() ; #DEBUG_LINE_NO:530
  RI04_RyujinTowerArrestsCount.SetValue(fArrestCount) ; #DEBUG_LINE_NO:531
  Alias_Nyx.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:533
  Alias_DRONESanitationBot.GetActorRef().SetUnconscious(False) ; #DEBUG_LINE_NO:534
  Alias_DRONESecurityBot.GetActorRef().SetUnconscious(False) ; #DEBUG_LINE_NO:535
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:543
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:544
EndFunction

Function Fragment_Stage_1110_Item_00()
  Game.GetPlayer().RemoveItem(RI04_EncryptedFiles as Form, 1, False, None) ; #DEBUG_LINE_NO:552
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:560
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:561
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:562
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:570
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:571
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:572
EndFunction

Function Fragment_Stage_1310_Item_00()
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:580
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:588
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:589
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:592
EndFunction
