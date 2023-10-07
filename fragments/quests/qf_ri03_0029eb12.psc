ScriptName Fragments:Quests:QF_RI03_0029EB12 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StanleyFile Auto Const mandatory
ReferenceAlias Property Alias_StanleyAudio Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Malai Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property RI01 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
Scene Property RI03_350_Malai_HailingScene Auto Const mandatory
GlobalVariable Property RI03_TESTHailGlobal Auto Const mandatory
ReferenceAlias Property Alias_MalaiGun Auto Const mandatory
Scene Property RI03_100_Ularu_OfficeScene Auto Const mandatory
ReferenceAlias Property Alias_TESTStartRef Auto Const mandatory
Scene Property RI03_1200_Masako_MeetingScene Auto Const mandatory
ReferenceAlias Property Alias_SlateProjectDominion Auto Const mandatory
Quest Property RI03_SpaceEncounter Auto Const mandatory
ReferenceAlias Property Alias_MalaiShip Auto Const mandatory
Keyword Property RI03_SayCustom_ImogeneToUlaru_Keyword Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_StanleyAccessCard Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_StanleyMarker Auto Const mandatory
GlobalVariable Property RI03_PlayerMentionsSimon Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RI04 Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_Genevieve Auto Const mandatory
ReferenceAlias Property Alias_GenevieveOfficeSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeSceneMarker Auto Const mandatory
Scene Property RI03_100_Maeve_CalloutScene Auto Const mandatory
GlobalVariable Property RI03_PlayerMetStanley Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_SimonMarker Auto Const mandatory
Weapon Property RI03_Eon_MalaiLiskovaGun Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property RI03_StanleyBribe Auto Const mandatory
GlobalVariable Property RI03_Simon_Credits Auto Const mandatory
GlobalVariable Property RI03_Simon_MoreCredits Auto Const mandatory
GlobalVariable Property RI03_Simon_AndrejaCredits Auto Const mandatory
GlobalVariable Property RI03_Simon_LessCredits Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ActorValue Property RI03_Foreknowledge_MetUlaruAV Auto Const mandatory
ActorValue Property RI03_Foreknowledge_KnowsProjectDominionAV Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_GenevieveOfficeWaitMarker Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_RI03_Ember Auto Const mandatory
GlobalVariable Property RI03_MalaiDead Auto Const mandatory
RefCollectionAlias Property Alias_MalaiShipTurrets Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_InfinityLTDMarker Auto Const mandatory
ReferenceAlias Property Alias_StanleyTerminal Auto Const mandatory
ReferenceAlias Property Alias_Simon Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property RI03_MalaiBoardingFaction Auto Const mandatory
GlobalVariable Property RI03_SimonDead Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Quest Property BE_RI03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:7
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:8
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:10
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:11
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Self.SetStage(100) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:22
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:23
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:26
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Self.SetStage(200) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0003_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:37
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:38
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:40
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:41
  Self.SetStage(300) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0004_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:51
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:52
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:54
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:55
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
  Self.SetStage(300) ; #DEBUG_LINE_NO:58
  Self.SetStage(400) ; #DEBUG_LINE_NO:59
  Self.SetStage(600) ; #DEBUG_LINE_NO:60
  Self.SetStage(650) ; #DEBUG_LINE_NO:61
  Self.SetStage(700) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:70
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:71
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:72
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:73
  Self.SetStage(1100) ; #DEBUG_LINE_NO:74
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:76
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:77
  PlayerRef.MoveTo(Alias_Ularu.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0006_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:86
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:87
  Self.SetStage(360) ; #DEBUG_LINE_NO:88
  Self.SetStage(500) ; #DEBUG_LINE_NO:89
  Self.SetStage(525) ; #DEBUG_LINE_NO:90
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:92
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0007_Item_00()
  RI03_SpaceEncounter.Start() ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0008_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:109
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:110
  Self.SetStage(120) ; #DEBUG_LINE_NO:111
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:113
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:114
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:123
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:124
  Self.SetStage(1000) ; #DEBUG_LINE_NO:125
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:127
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:128
  PlayerRef.MoveTo(Alias_SimonMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:137
  Alias_Stanley.GetRef().MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:138
  Alias_StanleyTerminal.GetRef().Enable(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0011_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:147
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:148
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:150
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:151
  PlayerRef.MoveTo(Alias_TESTStartRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:152
  Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:153
  Self.SetStage(120) ; #DEBUG_LINE_NO:155
  Self.SetStage(130) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0100_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:164
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:165
  RIR05.Stop() ; #DEBUG_LINE_NO:166
  Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:168
  Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:170
  Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveOfficeWaitMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:171
  ObjectReference DoorRef = Alias_UlaruOfficeDoor.GetRef() ; #DEBUG_LINE_NO:173
  DoorRef.SetOpen(False) ; #DEBUG_LINE_NO:174
  DoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:175
  DoorRef.SetLockLevel(254) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0110_Item_00()
  RI03_100_Maeve_CalloutScene.Start() ; #DEBUG_LINE_NO:184
  Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:186
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:196
  Self.SetStage(125) ; #DEBUG_LINE_NO:198
  Alias_Imogene.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:200
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:208
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:209
  If !Self.GetStageDone(130) ; #DEBUG_LINE_NO:211
    RI03_100_Ularu_OfficeScene.Start() ; #DEBUG_LINE_NO:212
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:221
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:222
  Alias_Genevieve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:223
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0135_Item_00()
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:232
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:240
  Alias_Imogene.GetActorRef().SayCustom(RI03_SayCustom_ImogeneToUlaru_Keyword, None, False, None) ; #DEBUG_LINE_NO:241
  Self.SetStage(170) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0160_Item_00()
  Alias_Imogene.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:260
  Actor StanleyRef = Alias_Stanley.GetActorRef() ; #DEBUG_LINE_NO:262
  StanleyRef.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:263
  StanleyRef.MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:272
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:273
  Actor StanleyRef = Alias_Stanley.GetActorRef() ; #DEBUG_LINE_NO:275
  StanleyRef.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:276
  StanleyRef.MoveTo(Alias_StanleyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:285
  Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:286
  Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:287
  Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveDisplayed(525, False, False) ; #DEBUG_LINE_NO:289
  Self.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:290
  Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:291
  Self.SetObjectiveDisplayed(700, False, False) ; #DEBUG_LINE_NO:292
  If !Self.GetStageDone(800) ; #DEBUG_LINE_NO:294
    Self.SetStage(710) ; #DEBUG_LINE_NO:295
  EndIf ; #DEBUG_LINE_NO:
  RI03_SimonDead.SetValue(1.0) ; #DEBUG_LINE_NO:298
EndFunction

Function Fragment_Stage_0229_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_AndrejaCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_LessCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_0231_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_Credits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_0232_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI03_Simon_MoreCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:338
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:339
EndFunction

Function Fragment_Stage_0350_Item_00()
  RI03_SpaceEncounter.Start() ; #DEBUG_LINE_NO:347
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:348
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:349
  RI03_350_Malai_HailingScene.Start() ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0361_Item_00()
  RI03_PlayerMentionsSimon.SetValue(1.0) ; #DEBUG_LINE_NO:366
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:374
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3.0) ; #DEBUG_LINE_NO:375
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:383
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:384
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:385
  RI03_SpaceEncounter.SetStage(200) ; #DEBUG_LINE_NO:388
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3.0) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_0420_Item_00()
  If !Self.GetStageDone(700) && Game.GetPlayer().GetItemCount(LL_Weapon_Reward_RI03_Ember as Form) == 0 ; #DEBUG_LINE_NO:405
    Alias_MalaiShip.GetShipRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember as Form, Alias_MalaiGun as Alias, 1, True) ; #DEBUG_LINE_NO:407
    Self.SetStage(450) ; #DEBUG_LINE_NO:408
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:419
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:420
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:422
  RI03_MalaiDead.SetValue(1.0) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:432
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:433
EndFunction

Function Fragment_Stage_0525_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:441
  Self.SetObjectiveDisplayed(525, True, False) ; #DEBUG_LINE_NO:442
  Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:443
EndFunction

Function Fragment_Stage_0550_Item_00()
  If !Self.GetStageDone(410) ; #DEBUG_LINE_NO:451
    Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:452
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:461
  If Self.GetStageDone(400) && Alias_MalaiShip.GetShipRef().IsDead() ; #DEBUG_LINE_NO:462
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:463
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:465
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:467
    Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:468
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(525) ; #DEBUG_LINE_NO:470
    Self.SetObjectiveCompleted(525, True) ; #DEBUG_LINE_NO:471
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:473
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:474
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:476
  If Self.GetStageDone(430) ; #DEBUG_LINE_NO:478
    Self.SetStage(620) ; #DEBUG_LINE_NO:479
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(650) && !Self.GetStageDone(450) ; #DEBUG_LINE_NO:488
    Self.SetStage(550) ; #DEBUG_LINE_NO:489
  EndIf ; #DEBUG_LINE_NO:
  Actor MalaiRef = Alias_Malai.GetActorRef() ; #DEBUG_LINE_NO:492
  MalaiRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:493
  MalaiRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:494
  MalaiRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:495
  Alias_MalaiShipTurrets.SetUnconscious(False) ; #DEBUG_LINE_NO:497
EndFunction

Function Fragment_Stage_0625_Item_00()
  Alias_Malai.GetRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember as Form, Alias_MalaiGun as Alias, 1, True) ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_0650_Item_00()
  Game.GetPlayer().AddItem(Alias_MalaiGun.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:513
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:521
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:522
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:524
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:525
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:527
    Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:528
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(525) ; #DEBUG_LINE_NO:530
    Self.SetObjectiveCompleted(525, True) ; #DEBUG_LINE_NO:531
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:533
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:534
  EndIf ; #DEBUG_LINE_NO:
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:537
  If PlayerRef.GetItemCount(RI03_Eon_MalaiLiskovaGun as Form) == 0 ; #DEBUG_LINE_NO:539
    PlayerRef.AddItem(Alias_MalaiGun.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:540
  EndIf ; #DEBUG_LINE_NO:
  BE_RI03.SetStage(150) ; #DEBUG_LINE_NO:543
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveDisplayed(710, True, False) ; #DEBUG_LINE_NO:551
EndFunction

Function Fragment_Stage_0720_Item_00()
  If Self.GetStageDone(730) && Self.GetStageDone(740) ; #DEBUG_LINE_NO:559
    Self.SetObjectiveCompleted(710, True) ; #DEBUG_LINE_NO:560
    Self.SetStage(800) ; #DEBUG_LINE_NO:561
    Self.SetStage(900) ; #DEBUG_LINE_NO:562
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0730_Item_00()
  If Self.GetStageDone(720) && Self.GetStageDone(740) ; #DEBUG_LINE_NO:571
    Self.SetObjectiveCompleted(710, True) ; #DEBUG_LINE_NO:572
    Self.SetStage(800) ; #DEBUG_LINE_NO:573
    Self.SetStage(900) ; #DEBUG_LINE_NO:574
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0740_Item_00()
  If Self.GetStageDone(720) && Self.GetStageDone(730) ; #DEBUG_LINE_NO:583
    Self.SetObjectiveCompleted(710, True) ; #DEBUG_LINE_NO:584
    Self.SetStage(800) ; #DEBUG_LINE_NO:585
    Self.SetStage(900) ; #DEBUG_LINE_NO:586
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0750_Item_00()
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:595
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:596
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:598
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(800) ; #DEBUG_LINE_NO:600
  Self.SetStage(900) ; #DEBUG_LINE_NO:601
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:604
  MyPlayer.AddItem(Alias_StanleyFile.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:606
  MyPlayer.AddItem(Alias_StanleyAudio.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:607
  MyPlayer.AddItem(Alias_DataDisk.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:608
  If Self.GetStageDone(700) ; #DEBUG_LINE_NO:610
    Alias_MalaiGun.Clear() ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:620
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:628
  If Self.GetStageDone(950) ; #DEBUG_LINE_NO:629
    Self.SetStage(1000) ; #DEBUG_LINE_NO:630
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:639
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:647
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:648
    Self.SetStage(1000) ; #DEBUG_LINE_NO:649
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_10000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:658
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:659
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:662
  RI04.SetStage(100) ; #DEBUG_LINE_NO:663
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:664
  Game.GetPlayer().SetValue(RI03_Foreknowledge_MetUlaruAV, 1.0) ; #DEBUG_LINE_NO:665
  Game.GetPlayer().SetValue(RI03_Foreknowledge_KnowsProjectDominionAV, 1.0) ; #DEBUG_LINE_NO:666
  Actor StanleyRef = Alias_Stanley.GetActorRef() ; #DEBUG_LINE_NO:670
  StanleyRef.RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:671
  StanleyRef.SetCrimeFaction(None) ; #DEBUG_LINE_NO:672
  StanleyRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:673
  Alias_Simon.GetRef().Disable(False) ; #DEBUG_LINE_NO:675
  Alias_StanleyTerminal.GetRef().Disable(False) ; #DEBUG_LINE_NO:676
  Self.Stop() ; #DEBUG_LINE_NO:678
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:686
  Alias_UlaruChairSwapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:687
EndFunction

Function Fragment_Stage_1010_Item_00()
  RI03_PlayerMetStanley.SetValue(1.0) ; #DEBUG_LINE_NO:695
EndFunction

Function Fragment_Stage_1070_Item_00()
  Self.SetStage(1080) ; #DEBUG_LINE_NO:703
EndFunction

Function Fragment_Stage_1080_Item_00()
  Alias_Stanley.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:711
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:719
  ri03_questscript kmyQuest = __temp as ri03_questscript ; #DEBUG_LINE_NO:720
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:723
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:724
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:726
    Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:727
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:729
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:730
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:732
    Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:733
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(525) ; #DEBUG_LINE_NO:735
    Self.SetObjectiveDisplayed(525, False, False) ; #DEBUG_LINE_NO:736
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:738
    Self.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:739
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(600) ; #DEBUG_LINE_NO:741
    Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:742
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(700) ; #DEBUG_LINE_NO:744
    Self.SetObjectiveDisplayed(700, False, False) ; #DEBUG_LINE_NO:745
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(710) ; #DEBUG_LINE_NO:747
    Self.SetObjectiveDisplayed(710, False, False) ; #DEBUG_LINE_NO:748
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:750
    Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:751
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(800) ; #DEBUG_LINE_NO:754
    Self.SetObjectiveDisplayed(800, False, False) ; #DEBUG_LINE_NO:755
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:758
    Self.SetObjectiveDisplayed(900, False, False) ; #DEBUG_LINE_NO:759
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:762
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:764
  PlayerRef.RemoveItem(Alias_DataDisk.GetRef() as Form, 1, True, None) ; #DEBUG_LINE_NO:766
  PlayerRef.AddItem(Alias_SlateProjectDominion.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:767
EndFunction

Function Fragment_Stage_1110_Item_00()
  Alias_Ularu.GetRef().AddItem(Alias_SlateProjectDominion.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:775
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:783
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:784
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:786
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:787
  Alias_Ularu.GetRef().RemoveItem(Alias_SlateProjectDominion.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:788
EndFunction

Function Fragment_Stage_1210_Item_00()
  RI03_1200_Masako_MeetingScene.Start() ; #DEBUG_LINE_NO:796
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:804
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:805
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:807
EndFunction

Function Fragment_Stage_1310_Item_00()
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:815
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:823
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:824
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:827
EndFunction
