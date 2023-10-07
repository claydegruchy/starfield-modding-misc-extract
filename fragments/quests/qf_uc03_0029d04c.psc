ScriptName Fragments:Quests:QF_UC03_0029D04C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
ReferenceAlias Property Alias_Andy Auto Const mandatory
Scene Property UC03_590_HadrianRequestsPlayersHelp Auto Const mandatory
Scene Property UC03_700_CambridgeRadioScene Auto Const mandatory
Scene Property UC03_890_HadrianSpotsDevilsHQ Auto Const mandatory
Scene Property UC03_900_MarcusAndHadrian Auto Const mandatory
ObjectReference Property HadrianTeleportMarkerScene900 Auto Const mandatory
ReferenceAlias Property Alias_Marcus Auto Const mandatory
Scene Property UC03_930_MarcusInsideScene Auto Const mandatory
Scene Property UC03_970_MarcusAnalyzesSample Auto Const mandatory
Scene Property UC03_750_CambridgeWrapUp Auto Const mandatory
MiscObject Property InorgUniqueBloodstone Auto Const mandatory
Quest Property UC04 Auto Const
ObjectReference Property HadTeleportMarker01 Auto Const
ObjectReference Property DebugMarker01 Auto Const
Scene Property UC03_510_AndyHadrianLouIntro Auto Const mandatory
ObjectReference Property HadrianTeleStage500 Auto Const
ObjectReference Property DebugMarker02 Auto Const
ObjectReference Property HadTeleportMarker02 Auto Const
ObjectReference Property DebugMarker03 Auto Const
ObjectReference Property HadTeleportMarker05 Auto Const
ObjectReference Property DebugMarker05 Auto Const
LeveledItem Property TestVSWeapons Auto Const mandatory
ObjectReference Property DebugMarker07 Auto Const
ObjectReference Property DebugMarker08 Auto Const
ObjectReference Property HadrianTeleportMarker940 Auto Const
ReferenceAlias Property Alias_Oktai Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const mandatory
Scene Property UC03_410_AndyShoutsScene Auto Const mandatory
Scene Property UC03_420_LouAttractScene Auto Const mandatory
MiscObject Property Credits Auto Const
Scene Property UC03_510_CambridgeAttractScene Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCellSample Auto Const mandatory
Scene Property UC03_900_JakobAttractScene Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadriansPast_Xenowarfare Auto Const mandatory
Quest Property UC03_DeepMinesQuest Auto Const mandatory
Scene Property UC03_810_CambridgeCommsScene Auto Const mandatory
Weapon Property Cutter Auto Const mandatory
ReferenceAlias Property Alias_LaserCutter Auto Const mandatory
MiscObject Property InorgUniqueHematite Auto Const mandatory
ReferenceAlias Property Alias_ThresherTrigger Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_HematiteQuestItem Auto Const mandatory
Scene Property UC03_825_Thresher_HematiteDeposited Auto Const mandatory
Scene Property UC03_830_ThresherAnalysisSequence Auto Const mandatory
ReferenceAlias Property Alias_ThresherDataTrigger Auto Const mandatory
Scene Property UC03_845_CambridgeResearchCollected Auto Const mandatory
Message Property UC03_DEBUG_TradeAuthorityVaultDoesntExist Auto Const mandatory
Key Property UC03_CydoniaUtilityKey Auto Const mandatory
ReferenceAlias Property Alias_ResearchData Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
Key Property UC03_DeepMineDrillKey Auto Const mandatory
ReferenceAlias Property Alias_RedHQMainDoor Auto Const mandatory
ActorValue Property UC03_PlayerLearnedPickMeUpRecipe Auto Const mandatory
GlobalVariable Property UC03_Reward_OktaiFindersFee Auto Const mandatory
GlobalVariable Property UC03_Reward_OktaiFindersFee_Better Auto Const mandatory
GlobalVariable Property UC03_Result Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisCrewSpawner Auto Const mandatory
ReferenceAlias Property Alias_ResearchDataSpawn Auto Const mandatory
Key Property UC03_RedDevilsHQKey Auto Const mandatory
ObjectReference Property HadrianTeleportMarker940a Auto Const mandatory
ObjectReference Property JakobTeleportMarker943 Auto Const
Scene Property UC03_940a_HadrianLouJakobScene Auto Const mandatory
ReferenceAlias Property Alias_TriggerScene410 Auto Const mandatory
LeveledItem Property LL_Drink_Any Auto Const mandatory
ObjectReference Property JakobDisSceneMarker Auto Const
GlobalVariable Property UC_PlayerKnows_ArmisticeArchives Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
ReferenceAlias Property Alias_RedDevilsHQMapMarker Auto Const mandatory
GlobalVariable Property UC03_BloodstoneAvailable Auto Const mandatory
ObjectReference Property UC04_Percival_TeleportMarker_Stage943 Auto Const mandatory
ReferenceAlias Property Alias_Trigger943 Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
Key Property UC03_DeepMineQuickExitKey Auto Const mandatory
Scene Property UC03_891_DrillDoorActivated Auto Const mandatory
Scene Property UC03_895_DoorAccessRestored Auto Const mandatory
ReferenceAlias Property Alias_DrillExit Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property UC03_940b_HadrianJakobScene Auto Const mandatory
ReferenceAlias Property Alias_TriggerSixthCircleInterior Auto Const mandatory
ActorValue Property UC03_Starborn_QuestCompleted Auto Const mandatory
ReferenceAlias Property Alias_DrillExitMarker Auto Const mandatory
ObjectReference Property UC03_DebugMarker06a Auto Const mandatory
GlobalVariable Property UC03_PlayerKnows_TerrormorphProjectFailed Auto Const mandatory
GlobalVariable Property UC_Hadrian_ECCombatDialogueActive Auto Const mandatory
ReferenceAlias Property Alias_RedDevilsMinePostQuestEnableMarker Auto Const mandatory
Quest Property UC03_DeepMinesSupportQuest Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const mandatory
LocationAlias Property Alias_DeepMines Auto Const mandatory
LocationAlias Property Alias_LC028RedDevilMinesLocation Auto Const mandatory
ReferenceAlias Property Alias_ThresherSoundSource Auto Const mandatory
ReferenceAlias Property Alias_HadrianShip Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
ReferenceAlias Property Alias_HematiteObj Auto Const mandatory
LeveledItem Property LargeNegotiateReward Auto Const
ReferenceAlias Property Alias_EmployeeExitKey Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference HadREF = Alias_Hadrian.GetRef() ; #DEBUG_LINE_NO:7
  Self.SetStage(100) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
  Self.SetStage(100) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
  Self.SetStage(400) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:36
  Self.SetStage(400) ; #DEBUG_LINE_NO:37
  Self.SetStage(442) ; #DEBUG_LINE_NO:38
  Self.SetStage(500) ; #DEBUG_LINE_NO:39
  Self.SetStage(510) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().MoveTo(DebugMarker05, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
  Self.SetStage(400) ; #DEBUG_LINE_NO:51
  Self.SetStage(440) ; #DEBUG_LINE_NO:52
  Self.SetStage(442) ; #DEBUG_LINE_NO:53
  Self.SetStage(500) ; #DEBUG_LINE_NO:54
  Self.SetStage(510) ; #DEBUG_LINE_NO:55
  Self.SetStage(600) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0007_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:66
  PlayREF.AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:67
  PlayREF.MoveTo(DebugMarker07, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:68
  Self.SetStage(899) ; #DEBUG_LINE_NO:69
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:70
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0008_Item_00()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:79
  Alias_Marcus.GetRef().MoveTo(UC04_Percival_TeleportMarker_Stage943, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:80
  PlayREF.AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:81
  PlayREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
  Self.SetStage(942) ; #DEBUG_LINE_NO:84
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0009_Item_00()
  ObjectReference HadREF = Alias_Hadrian.GetRef() ; #DEBUG_LINE_NO:94
  HadREF.Enable(False) ; #DEBUG_LINE_NO:95
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:96
  PlayREF.AddItem(TestVSWeapons as Form, 1, False) ; #DEBUG_LINE_NO:97
  PlayREF.MoveTo(DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:98
  Self.SetStage(950) ; #DEBUG_LINE_NO:99
  Self.SetStage(990) ; #DEBUG_LINE_NO:100
  Self.SetStage(1000) ; #DEBUG_LINE_NO:101
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:102
  Self.SetObjectiveCompleted(940, True) ; #DEBUG_LINE_NO:103
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:104
  HadREF.MoveTo(HadrianTeleportMarker940, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0011_Item_00()
  Game.GetPlayer().MoveTo(UC03_DebugMarker06a, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:113
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:114
  Self.SetStage(810) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0019_Item_00()
  Actor PA = Game.GetPlayer() ; #DEBUG_LINE_NO:123
  PA.AddPerk(Intimidation, False) ; #DEBUG_LINE_NO:124
  PA.AddPerk(BackgroundIndustrialist, False) ; #DEBUG_LINE_NO:125
  PA.AddPerk(BackgroundCombatMedic, False) ; #DEBUG_LINE_NO:126
  PA.AddPerk(BackgroundXenobiologist, False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_DeepMines.ForceLocationTo(Alias_LC028RedDevilMinesLocation.GetLocation()) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:152
  Alias_Andy.GetRef().Enable(False) ; #DEBUG_LINE_NO:153
  Alias_LaserCutter.GetRef().Enable(False) ; #DEBUG_LINE_NO:154
  Alias_EmployeeExitKey.GetRef().Enable(False) ; #DEBUG_LINE_NO:155
  Alias_HematiteObj.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:158
  (Alias_Player as uc03_playeraliasscript).RegisterPlayerForBloodstoneCollection() ; #DEBUG_LINE_NO:159
  Self.SetActive(True) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_Oktai.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0320_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:185
  If !Self.GetStageDone(850) ; #DEBUG_LINE_NO:186
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0410_Item_00()
  UC03_410_AndyShoutsScene.Start() ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0420_Item_00()
  UC03_420_LouAttractScene.Start() ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_0442_Item_00()
  Self.SetStage(330) ; #DEBUG_LINE_NO:229
EndFunction

Function Fragment_Stage_0443_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 5, False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0445_Item_00()
  Self.SetStage(320) ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_0447_Item_00()
  Self.SetStage(438) ; #DEBUG_LINE_NO:261
EndFunction

Function Fragment_Stage_0503_Item_00()
  Self.SetObjectiveCompleted(503, True) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:277
  Self.SetObjectiveDisplayed(501, True, False) ; #DEBUG_LINE_NO:278
  Self.SetObjectiveDisplayedAtTop(500) ; #DEBUG_LINE_NO:279
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:280
  UC03_510_CambridgeAttractScene.Start() ; #DEBUG_LINE_NO:281
  Self.SetObjectiveDisplayed(510, True, False) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_0521_Item_00()
  Game.GetPlayer().AddItem(LL_Drink_Any as Form, 1, False) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:298
  Self.SetObjectiveDisplayedAtTop(550) ; #DEBUG_LINE_NO:299
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(510, True) ; #DEBUG_LINE_NO:307
  If !UC03_DeepMinesSupportQuest.GetStageDone(100) ; #DEBUG_LINE_NO:311
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:312
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(800) ; #DEBUG_LINE_NO:314
    Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:315
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(850) && !Self.GetStageDone(890) && Self.GetStageDone(510) ; #DEBUG_LINE_NO:324
    Self.SetObjectiveCompleted(501, True) ; #DEBUG_LINE_NO:325
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:326
    Self.SetObjectiveDisplayed(502, True, False) ; #DEBUG_LINE_NO:327
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0750_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, UC03_JakobsDebtNewValue_00.GetValueInt(), False) ; #DEBUG_LINE_NO:336
  Self.SetObjectiveCompleted(502, True) ; #DEBUG_LINE_NO:337
  If !Self.IsObjectiveCompleted(600) ; #DEBUG_LINE_NO:339
    Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:340
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(800) ; #DEBUG_LINE_NO:343
    Self.SetObjectiveDisplayed(800, False, False) ; #DEBUG_LINE_NO:344
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(810) ; #DEBUG_LINE_NO:347
    Self.SetObjectiveDisplayed(810, False, False) ; #DEBUG_LINE_NO:348
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(811) ; #DEBUG_LINE_NO:351
    Self.SetObjectiveDisplayed(811, False, False) ; #DEBUG_LINE_NO:352
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(820) ; #DEBUG_LINE_NO:355
    Self.SetObjectiveDisplayed(820, False, False) ; #DEBUG_LINE_NO:356
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(825) ; #DEBUG_LINE_NO:359
    Self.SetObjectiveDisplayed(825, False, False) ; #DEBUG_LINE_NO:360
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(830) ; #DEBUG_LINE_NO:363
    Self.SetObjectiveDisplayed(830, False, False) ; #DEBUG_LINE_NO:364
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(835) ; #DEBUG_LINE_NO:367
    Self.SetObjectiveDisplayed(835, False, False) ; #DEBUG_LINE_NO:368
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(840) ; #DEBUG_LINE_NO:371
    Self.SetObjectiveDisplayed(840, False, False) ; #DEBUG_LINE_NO:372
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(845) ; #DEBUG_LINE_NO:375
    Self.SetObjectiveDisplayed(845, False, False) ; #DEBUG_LINE_NO:376
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(600) && !Self.GetStageDone(750) && !Self.GetStageDone(890) ; #DEBUG_LINE_NO:385
    Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:386
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:387
    Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:388
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0810_Item_00()
  UC03_810_CambridgeCommsScene.Start() ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_0811_Item_00()
  Alias_LaserCutter.Clear() ; #DEBUG_LINE_NO:405
  Self.SetObjectiveCompleted(811, True) ; #DEBUG_LINE_NO:406
EndFunction

Function Fragment_Stage_0815_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:414
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:416
    Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:418
    If Player.GetItemCount(InorgUniqueHematite as Form) < 1 ; #DEBUG_LINE_NO:420
      Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:421
      Self.SetObjectiveDisplayed(810, True, False) ; #DEBUG_LINE_NO:422
      If Player.GetItemCount(Cutter as Form) < 1 ; #DEBUG_LINE_NO:424
        Self.SetObjectiveDisplayed(811, True, False) ; #DEBUG_LINE_NO:425
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Player.RemoveItem(InorgUniqueHematite as Form, 1, True, None) ; #DEBUG_LINE_NO:428
      Player.AddAliasedItem(InorgUniqueHematite as Form, Alias_HematiteQuestItem as Alias, 1, True) ; #DEBUG_LINE_NO:429
      Self.SetStage(820) ; #DEBUG_LINE_NO:430
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  Alias_LaserCutter.Clear() ; #DEBUG_LINE_NO:440
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:442
    Alias_ThresherTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:443
    Self.SetObjectiveCompleted(810, True) ; #DEBUG_LINE_NO:444
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:445
    If !Self.IsObjectiveCompleted(811) ; #DEBUG_LINE_NO:447
      Self.SetObjectiveDisplayed(811, False, False) ; #DEBUG_LINE_NO:448
    EndIf ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(820, True, False) ; #DEBUG_LINE_NO:451
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0825_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:460
    Alias_ThresherTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:461
    Alias_ThresherSoundSource.GetRef().Enable(False) ; #DEBUG_LINE_NO:462
    Game.GetPlayer().RemoveItem(Alias_HematiteQuestItem.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:463
    Self.SetObjectiveCompleted(820, True) ; #DEBUG_LINE_NO:464
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:465
    Self.SetObjectiveDisplayed(830, True, False) ; #DEBUG_LINE_NO:466
    UC03_825_Thresher_HematiteDeposited.Start() ; #DEBUG_LINE_NO:467
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0830_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:476
    UC03_830_ThresherAnalysisSequence.Start() ; #DEBUG_LINE_NO:477
    Self.SetObjectiveCompleted(825, True) ; #DEBUG_LINE_NO:478
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:479
    Self.SetObjectiveDisplayed(830, True, False) ; #DEBUG_LINE_NO:480
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0835_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:489
    Alias_ThresherDataTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:490
    Alias_ThresherSoundSource.GetRef().Disable(False) ; #DEBUG_LINE_NO:491
    Self.SetObjectiveCompleted(830, True) ; #DEBUG_LINE_NO:492
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:493
    Self.SetObjectiveDisplayed(835, True, False) ; #DEBUG_LINE_NO:494
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0840_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:503
    Game.GetPlayer().AddItem(Alias_ResearchData.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:504
    Alias_ThresherDataTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:505
    Self.SetObjectiveCompleted(835, True) ; #DEBUG_LINE_NO:506
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:507
    Self.SetObjectiveDisplayed(840, True, False) ; #DEBUG_LINE_NO:508
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0843_Item_00()
  If !Self.GetStageDone(890) && !Self.GetStageDone(750) ; #DEBUG_LINE_NO:517
    UC03_845_CambridgeResearchCollected.Start() ; #DEBUG_LINE_NO:518
    Self.SetObjectiveCompleted(840, True) ; #DEBUG_LINE_NO:519
    If Game.GetPlayer().GetItemCount(UC03_DeepMineQuickExitKey as Form) >= 1 ; #DEBUG_LINE_NO:521
      Self.SetStage(845) ; #DEBUG_LINE_NO:522
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:524
      Self.SetObjectiveDisplayed(843, True, False) ; #DEBUG_LINE_NO:525
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0844_Item_00()
  ObjectReference DrillMM = Alias_DrillExitMarker.GetRef() ; #DEBUG_LINE_NO:535
  DrillMM.Enable(False) ; #DEBUG_LINE_NO:536
  DrillMM.AddToMapScanned(True) ; #DEBUG_LINE_NO:537
EndFunction

Function Fragment_Stage_0845_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:545
    Self.SetObjectiveCompleted(843, True) ; #DEBUG_LINE_NO:546
    Self.SetObjectiveDisplayed(500, True, True) ; #DEBUG_LINE_NO:547
    Self.SetObjectiveDisplayed(845, True, False) ; #DEBUG_LINE_NO:548
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(750) ; #DEBUG_LINE_NO:557
    Self.SetStage(856) ; #DEBUG_LINE_NO:560
    Game.GetPlayer().SetValue(UC03_PlayerLearnedPickMeUpRecipe, 1.0) ; #DEBUG_LINE_NO:563
    Self.SetObjectiveCompleted(845, True) ; #DEBUG_LINE_NO:565
    Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:566
    If !Self.IsObjectiveCompleted(500) ; #DEBUG_LINE_NO:568
      Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:569
    EndIf ; #DEBUG_LINE_NO:
    If !Self.IsObjectiveCompleted(501) ; #DEBUG_LINE_NO:572
      Self.SetObjectiveDisplayed(501, False, False) ; #DEBUG_LINE_NO:573
    EndIf ; #DEBUG_LINE_NO:
    If !Self.IsObjectiveCompleted(502) ; #DEBUG_LINE_NO:576
      Self.SetObjectiveDisplayed(502, False, False) ; #DEBUG_LINE_NO:577
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0860_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:587
  PlayACT.RemoveItem(Alias_ResearchData.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:588
  If Self.GetStageDone(870) ; #DEBUG_LINE_NO:590
    PlayACT.AddItem(LargeNegotiateReward as Form, 1, False) ; #DEBUG_LINE_NO:591
  Else ; #DEBUG_LINE_NO:
    PlayACT.AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False) ; #DEBUG_LINE_NO:593
  EndIf ; #DEBUG_LINE_NO:
  UC03_JakobsDebtAmount.SetValue(0.0) ; #DEBUG_LINE_NO:595
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:596
  UC03_Result.SetValue(1.0) ; #DEBUG_LINE_NO:599
  Self.SetStage(890) ; #DEBUG_LINE_NO:600
EndFunction

Function Fragment_Stage_0880_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC03_JakobsDebtAmount.GetValueInt(), False, None) ; #DEBUG_LINE_NO:608
  Self.SetStage(890) ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0890_Item_00()
  Self.SetStage(856) ; #DEBUG_LINE_NO:618
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:620
  If !Self.IsObjectiveCompleted(501) ; #DEBUG_LINE_NO:622
    Self.SetObjectiveDisplayed(501, False, False) ; #DEBUG_LINE_NO:623
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(502) ; #DEBUG_LINE_NO:626
    Self.SetObjectiveDisplayed(502, False, False) ; #DEBUG_LINE_NO:627
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(503) ; #DEBUG_LINE_NO:630
    Self.SetObjectiveDisplayed(503, False, False) ; #DEBUG_LINE_NO:631
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(510) ; #DEBUG_LINE_NO:634
    Self.SetObjectiveDisplayed(510, False, False) ; #DEBUG_LINE_NO:635
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(600) ; #DEBUG_LINE_NO:638
    Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:639
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(800) ; #DEBUG_LINE_NO:642
    Self.SetObjectiveDisplayed(800, False, False) ; #DEBUG_LINE_NO:643
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(810) ; #DEBUG_LINE_NO:646
    Self.SetObjectiveDisplayed(810, False, False) ; #DEBUG_LINE_NO:647
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(811) ; #DEBUG_LINE_NO:650
    Self.SetObjectiveDisplayed(811, False, False) ; #DEBUG_LINE_NO:651
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(820) ; #DEBUG_LINE_NO:654
    Self.SetObjectiveDisplayed(820, False, False) ; #DEBUG_LINE_NO:655
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(825) ; #DEBUG_LINE_NO:658
    Self.SetObjectiveDisplayed(825, False, False) ; #DEBUG_LINE_NO:659
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(830) ; #DEBUG_LINE_NO:662
    Self.SetObjectiveDisplayed(830, False, False) ; #DEBUG_LINE_NO:663
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(835) ; #DEBUG_LINE_NO:666
    Self.SetObjectiveDisplayed(835, False, False) ; #DEBUG_LINE_NO:667
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(840) ; #DEBUG_LINE_NO:670
    Self.SetObjectiveDisplayed(840, False, False) ; #DEBUG_LINE_NO:671
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(845) ; #DEBUG_LINE_NO:674
    Self.SetObjectiveDisplayed(845, False, False) ; #DEBUG_LINE_NO:675
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(850) ; #DEBUG_LINE_NO:678
    Self.SetObjectiveDisplayed(850, False, False) ; #DEBUG_LINE_NO:679
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(890, True, False) ; #DEBUG_LINE_NO:682
EndFunction

Function Fragment_Stage_0891_Item_00()
  If !Self.GetStageDone(895) ; #DEBUG_LINE_NO:690
    UC03_891_DrillDoorActivated.Start() ; #DEBUG_LINE_NO:691
    Self.SetObjectiveDisplayed(900, False, False) ; #DEBUG_LINE_NO:692
    Self.SetObjectiveDisplayed(891, True, False) ; #DEBUG_LINE_NO:693
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0895_Item_00()
  Self.SetObjectiveCompleted(891, True) ; #DEBUG_LINE_NO:702
  If !Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:703
    Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:704
  EndIf ; #DEBUG_LINE_NO:
  Alias_DrillExit.GetRef().Unlock(False) ; #DEBUG_LINE_NO:707
  UC03_895_DoorAccessRestored.Start() ; #DEBUG_LINE_NO:708
EndFunction

Function Fragment_Stage_0899_Item_00()
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:716
  Self.SetObjectiveCompleted(890, True) ; #DEBUG_LINE_NO:717
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:718
  Game.GetPlayer().AddItem(UC03_DeepMineDrillKey as Form, 1, False) ; #DEBUG_LINE_NO:720
  If Self.GetStageDone(442) && !Self.GetStageDone(750) ; #DEBUG_LINE_NO:722
    Self.SetStage(750) ; #DEBUG_LINE_NO:723
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  UC03_900_JakobAttractScene.Start() ; #DEBUG_LINE_NO:732
  Alias_Marcus.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:733
EndFunction

Function Fragment_Stage_0901_Item_00()
  Alias_Marcus.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:741
  ObjectReference HadREF = Alias_Hadrian.GetRef() ; #DEBUG_LINE_NO:744
  HadREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:745
EndFunction

Function Fragment_Stage_0905_Item_00()
  Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:753
EndFunction

Function Fragment_Stage_0910_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:761
  Self.SetObjectiveDisplayed(910, True, False) ; #DEBUG_LINE_NO:762
EndFunction

Function Fragment_Stage_0920_Item_00()
  Alias_RedHQMainDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:770
  Alias_Marcus.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:771
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:772
  Self.SetObjectiveDisplayed(920, True, False) ; #DEBUG_LINE_NO:773
EndFunction

Function Fragment_Stage_0930_Item_00()
  UC03_930_MarcusInsideScene.Start() ; #DEBUG_LINE_NO:781
EndFunction

Function Fragment_Stage_0939_Item_00()
  Actor JakobRef = Alias_Marcus.GetActorRef() ; #DEBUG_LINE_NO:790
  (SQ_Followers as sq_followersscript).SetRoleInactive(JakobRef, True, False, True) ; #DEBUG_LINE_NO:791
EndFunction

Function Fragment_Stage_0940_Item_00()
  Alias_Marcus.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:799
EndFunction

Function Fragment_Stage_0942_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, False) ; #DEBUG_LINE_NO:808
  DialogueRedDevilsHQ.SetStage(7) ; #DEBUG_LINE_NO:809
  Actor PA = Alias_Marcus.GetActorRef() ; #DEBUG_LINE_NO:812
  (SQ_Followers as sq_followersscript).SetRoleActive(PA, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:813
  (SQ_Followers as sq_followersscript).CommandFollow(PA) ; #DEBUG_LINE_NO:814
  Actor HadREF = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:817
  HadREF.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:818
  HadREF.Enable(False) ; #DEBUG_LINE_NO:819
  HadREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:820
  Alias_HadrianShip.TryToEnable() ; #DEBUG_LINE_NO:823
  UC_Hadrian_ECCombatDialogueActive.SetValue(1.0) ; #DEBUG_LINE_NO:826
  ObjectReference MMRef = Alias_RedDevilsHQMapMarker.GetRef() ; #DEBUG_LINE_NO:829
  MMRef.Enable(False) ; #DEBUG_LINE_NO:830
  MMRef.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:831
  MMRef.SetMarkerDiscovered() ; #DEBUG_LINE_NO:832
  Self.SetObjectiveCompleted(920, True) ; #DEBUG_LINE_NO:834
  Self.SetObjectiveDisplayed(942, True, False) ; #DEBUG_LINE_NO:835
EndFunction

Function Fragment_Stage_0943_Item_00()
  Actor JakobRef = Alias_Marcus.GetActorRef() ; #DEBUG_LINE_NO:844
  (SQ_Followers as sq_followersscript).SetRoleInactive(JakobRef, True, False, True) ; #DEBUG_LINE_NO:845
  If !Game.GetPlayer().HasDetectionLOS(JakobRef as ObjectReference) ; #DEBUG_LINE_NO:847
    JakobRef.MoveTo(DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:848
  EndIf ; #DEBUG_LINE_NO:
  JakobRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:851
  UC03_940b_HadrianJakobScene.Start() ; #DEBUG_LINE_NO:852
EndFunction

Function Fragment_Stage_0945_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:860
EndFunction

Function Fragment_Stage_0949_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:868
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(942, True) ; #DEBUG_LINE_NO:876
  Self.SetObjectiveDisplayed(950, True, False) ; #DEBUG_LINE_NO:877
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:879
  Alias_Marcus.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:880
EndFunction

Function Fragment_Stage_0955_Item_00()
  UC_PlayerKnows_HadriansPast_Xenowarfare.SetValue(1.0) ; #DEBUG_LINE_NO:888
EndFunction

Function Fragment_Stage_0956_Item_00()
  UC03_PlayerKnows_TerrormorphProjectFailed.SetValue(1.0) ; #DEBUG_LINE_NO:896
EndFunction

Function Fragment_Stage_0957_Item_00()
  UC_PlayerKnows_ArmisticeArchives.SetValue(1.0) ; #DEBUG_LINE_NO:904
EndFunction

Function Fragment_Stage_0960_Item_00()
  Self.SetObjectiveCompleted(950, True) ; #DEBUG_LINE_NO:912
  Self.SetObjectiveDisplayed(960, True, False) ; #DEBUG_LINE_NO:913
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:915
EndFunction

Function Fragment_Stage_0961_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:923
EndFunction

Function Fragment_Stage_0970_Item_00()
  UC03_970_MarcusAnalyzesSample.Start() ; #DEBUG_LINE_NO:931
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetObjectiveCompleted(940, True) ; #DEBUG_LINE_NO:939
  Self.SetObjectiveDisplayed(980, True, False) ; #DEBUG_LINE_NO:940
EndFunction

Function Fragment_Stage_0990_Item_00()
  UC_PlayerKnows_ArmisticeArchives.SetValue(1.0) ; #DEBUG_LINE_NO:948
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:956
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_NewAtlantisCrewSpawner.GetRef().Disable(False) ; #DEBUG_LINE_NO:965
  If !UC03_DeepMinesSupportQuest.GetStageDone(200) ; #DEBUG_LINE_NO:968
    UC03_DeepMinesSupportQuest.SetStage(200) ; #DEBUG_LINE_NO:969
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(860) ; #DEBUG_LINE_NO:974
    UC03_BloodstoneAvailable.SetValue(1.0) ; #DEBUG_LINE_NO:975
    Alias_RedDevilsMinePostQuestEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:978
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(UC03_Starborn_QuestCompleted, 1.0) ; #DEBUG_LINE_NO:982
  Self.SetStage(844) ; #DEBUG_LINE_NO:985
  (SQ_Followers as sq_followersscript).SetRoleInactive(Alias_Marcus.GetActorRef(), True, False, True) ; #DEBUG_LINE_NO:988
  UC04.Start() ; #DEBUG_LINE_NO:990
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:991
  Self.Stop() ; #DEBUG_LINE_NO:992
EndFunction

Function Fragment_Stage_1015_Item_00()
  Self.SetObjectiveCompleted(1010, True) ; #DEBUG_LINE_NO:1000
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:1010
  Self.SetObjectiveCompleted(1010, True) ; #DEBUG_LINE_NO:1011
  Self.SetObjectiveDisplayed(1050, True, False) ; #DEBUG_LINE_NO:1012
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:1020
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:1021
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:1029
  Self.Stop() ; #DEBUG_LINE_NO:1030
  UC04.Start() ; #DEBUG_LINE_NO:1031
EndFunction
