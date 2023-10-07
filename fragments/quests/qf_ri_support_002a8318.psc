ScriptName Fragments:Quests:QF_RI_Support_002A8318 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
GlobalVariable Property RIR03_RadiantCount Auto Const mandatory
GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const mandatory
ReferenceAlias Property Alias_PlayerOfficeQS Auto Const mandatory
GlobalVariable Property RI_NPCRadiantAvailable Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_PointerQuestNPCQS Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
Quest Property RI08 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
Keyword Property RIR05_QuestStartKeyword Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
GlobalVariable Property RIR05_RadiantCount Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property PlayerJoined_Ryujin Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property RI06 Auto Const mandatory
Quest Property RIR06 Auto Const mandatory
Keyword Property RIR06_QuestStartKeyword Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
Keyword Property RI_RadiantQuestStartKeyword Auto Const mandatory
Keyword Property RIR07_QuestStartKeyword Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
Quest Property DialogueFCRyujinTower Auto Const mandatory
RefCollectionAlias Property Alias_VentDoors Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellDoor Auto Const mandatory
ReferenceAlias Property Alias_Kendrick Auto Const mandatory
ReferenceAlias Property Alias_Sean Auto Const mandatory
ReferenceAlias Property Alias_Kai Auto Const mandatory
ReferenceAlias Property Alias_ClinicSecureWingDoor Auto Const mandatory
ReferenceAlias Property Alias_ClinicSecurityGuard Auto Const mandatory
GlobalVariable Property RI06_SeanDead Auto Const mandatory
GlobalVariable Property RI06_KendrickDead Auto Const mandatory
ReferenceAlias Property Alias_KendrickMoveMarker Auto Const mandatory
ReferenceAlias Property Alias_SeanMoveMarker Auto Const mandatory
Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const mandatory
GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_RI04_CraneButton Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_YukoOfficeDoor Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RI_LaneUnlockTLs Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_RadiantPointerFurniture Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
GlobalVariable Property RI02_NinaHartDead Auto Const mandatory
ReferenceAlias Property Alias_Nina Auto Const mandatory
ReferenceAlias Property Alias_Harper Auto Const mandatory
GlobalVariable Property RI02_AngeloSoldaniDead Auto Const mandatory
GlobalVariable Property RI03_StanleyDead Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
GlobalVariable Property RI08_UlaruRemainedCFO Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_PlayerOfficeDoor Auto Const mandatory
Quest Property RI08_PostQuest Auto Const mandatory
LocationAlias Property Alias_Location_LaredoLocation Auto Const mandatory
Keyword Property LocTypeCFR03NotAllowed Auto Const mandatory
LocationAlias Property Alias_Location_TridentLocation Auto Const mandatory
LocationAlias Property Alias_Location_AkilaCityLocation Auto Const mandatory
LocationAlias Property Alias_Location_AkilaTradeAuthorityLocation Auto Const mandatory
Keyword Property LocTypeRIRadiantsNotAllowed Auto Const mandatory
Keyword Property LocTypeShowClothing Auto Const mandatory
Keyword Property LocTypeShowSpacesuit Auto Const mandatory
LocationAlias Property Alias_Location_InfinityLTD Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:7
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:8
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:9
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:10
  RI01.SetStage(10000) ; #DEBUG_LINE_NO:11
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:12
  DialogueFCRyujinTower.SetStage(110) ; #DEBUG_LINE_NO:13
  LC044.SetStage(200) ; #DEBUG_LINE_NO:14
  LC044.SetStage(300) ; #DEBUG_LINE_NO:15
  LC044.SetStage(400) ; #DEBUG_LINE_NO:16
  RI01.Stop() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:26
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:27
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:28
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:31
  DialogueFCRyujinTower.SetStage(110) ; #DEBUG_LINE_NO:32
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:35
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:36
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:37
  RI01.SetStage(10000) ; #DEBUG_LINE_NO:38
  RI01.Stop() ; #DEBUG_LINE_NO:39
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:40
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:43
    Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:46
  Else ; #DEBUG_LINE_NO:
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:51
  If RI02_NinaHartDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:53
    Alias_Nina.GetRef().Disable(False) ; #DEBUG_LINE_NO:54
    Alias_Harper.GetRef().Enable(False) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  If RI02_AngeloSoldaniDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:59
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  If RI03_StanleyDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:64
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:69
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:78
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:79
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:80
  PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus, False) ; #DEBUG_LINE_NO:81
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:82
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:83
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:86
  DialogueFCRyujinTower.SetStage(110) ; #DEBUG_LINE_NO:87
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:90
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:91
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:92
  RI01.SetStage(10000) ; #DEBUG_LINE_NO:93
  RI01.Stop() ; #DEBUG_LINE_NO:94
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:95
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:98
    Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:101
  Else ; #DEBUG_LINE_NO:
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  If RI05_ImogeneDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:106
    Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoRemainedCEO.GetValue() == 1.0 && RI08_UlaruRemainedCFO.GetValue() != 1.0 ; #DEBUG_LINE_NO:110
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:114
  If RI02_NinaHartDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:116
    Alias_Nina.GetRef().Disable(False) ; #DEBUG_LINE_NO:117
    Alias_Harper.GetRef().Enable(False) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  If RI02_AngeloSoldaniDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:122
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
  If RI03_StanleyDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:127
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0 ; #DEBUG_LINE_NO:131
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:136
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:137
  Self.SetStage(5010) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:146
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:147
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:148
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:149
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:152
  DialogueFCRyujinTower.SetStage(110) ; #DEBUG_LINE_NO:153
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:156
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:157
  Alias_MasakoOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:158
  Alias_UlaruOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:159
  Alias_UlaruOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:160
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:161
  Alias_YukoOfficeDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:162
  RI01.SetStage(10000) ; #DEBUG_LINE_NO:163
  RI01.Stop() ; #DEBUG_LINE_NO:164
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:165
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:168
    Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:171
  Else ; #DEBUG_LINE_NO:
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:173
  EndIf ; #DEBUG_LINE_NO:
  If RI05_ImogeneDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:176
    Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:177
  EndIf ; #DEBUG_LINE_NO:
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:181
  If RI02_NinaHartDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:183
    Alias_Nina.GetRef().Disable(False) ; #DEBUG_LINE_NO:184
    Alias_Harper.GetRef().Enable(False) ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
  If RI02_AngeloSoldaniDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:189
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  If RI03_StanleyDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:194
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:195
  EndIf ; #DEBUG_LINE_NO:
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0 ; #DEBUG_LINE_NO:198
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:203
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:212
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:213
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:214
  PlayerRef.AddPerk(Skill_Manipulation_InternalNeuroampBonus, False) ; #DEBUG_LINE_NO:215
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:216
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:217
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:220
  DialogueFCRyujinTower.SetStage(110) ; #DEBUG_LINE_NO:221
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:224
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:225
  Alias_YukoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:226
  Alias_PlayerOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:227
  RI01.SetStage(10000) ; #DEBUG_LINE_NO:228
  RI01.Stop() ; #DEBUG_LINE_NO:229
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:230
  RI08_PostQuest.SetStage(600) ; #DEBUG_LINE_NO:231
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:234
    Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:237
  Else ; #DEBUG_LINE_NO:
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
  If RI05_ImogeneDead.GetValue() == 1.0 || RI08_MasakoRemainedCEO.GetValue() == 0.0 ; #DEBUG_LINE_NO:242
    Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:243
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoRemainedCEO.GetValue() == 1.0 ; #DEBUG_LINE_NO:246
    RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:247
    If RI08_UlaruRemainedCFO.GetValue() != 1.0 ; #DEBUG_LINE_NO:248
      Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:249
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:255
  If RI02_NinaHartDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:257
    Alias_Nina.GetRef().Disable(False) ; #DEBUG_LINE_NO:258
    Alias_Harper.GetRef().Enable(False) ; #DEBUG_LINE_NO:259
  EndIf ; #DEBUG_LINE_NO:
  If RI02_AngeloSoldaniDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:263
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:264
  EndIf ; #DEBUG_LINE_NO:
  If RI03_StanleyDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:268
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:269
  EndIf ; #DEBUG_LINE_NO:
  If RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 && RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0 ; #DEBUG_LINE_NO:272
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
  MissionBoardAccessAllowed_RI.SetValue(1.0) ; #DEBUG_LINE_NO:277
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:278
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:279
  Self.SetStage(5010) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:288
  RI08.SetStage(6) ; #DEBUG_LINE_NO:289
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:290
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:291
  RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:300
  RI08.SetStage(6) ; #DEBUG_LINE_NO:301
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:302
  Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:303
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:304
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:305
  RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:314
  RI08.SetStage(7) ; #DEBUG_LINE_NO:315
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:316
  Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:317
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:318
  RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:319
EndFunction

Function Fragment_Stage_0040_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:327
  Self.SetStage(4) ; #DEBUG_LINE_NO:328
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0050_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:337
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:338
  Self.SetStage(4) ; #DEBUG_LINE_NO:339
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:340
EndFunction

Function Fragment_Stage_0060_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:348
  Self.SetStage(4) ; #DEBUG_LINE_NO:349
  Game.GetPlayer().MoveTo(Alias_PlayerOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0070_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:358
  Self.SetStage(4) ; #DEBUG_LINE_NO:359
  RI_NPCRadiantAvailable.SetValue(1.0) ; #DEBUG_LINE_NO:360
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:361
  RI_RadiantPointerQuest.SetStage(10) ; #DEBUG_LINE_NO:362
  Actor ImogeneRef = Alias_Imogene.GetActorRef() ; #DEBUG_LINE_NO:364
  ImogeneRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:365
  ImogeneRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:366
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:368
EndFunction

Function Fragment_Stage_0080_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:376
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:377
  Self.SetStage(4) ; #DEBUG_LINE_NO:378
  RI_NPCRadiantAvailable.SetValue(1.0) ; #DEBUG_LINE_NO:379
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:380
  RI_RadiantPointerQuest.SetStage(10) ; #DEBUG_LINE_NO:381
  Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:383
  YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:384
  YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:385
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:387
EndFunction

Function Fragment_Stage_0090_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:395
  Self.SetStage(4) ; #DEBUG_LINE_NO:396
  RI_NPCRadiantAvailable.SetValue(1.0) ; #DEBUG_LINE_NO:397
  RI_RadiantQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:398
  RI_RadiantPointerQuest.SetStage(10) ; #DEBUG_LINE_NO:399
  Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:401
  YukoRef.MoveTo(Alias_RadiantPointerFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:402
  YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:403
  Game.GetPlayer().MoveTo(Alias_PointerQuestNPCQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_0300_Item_00()
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:413
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:414
  RIR03.SetStage(0) ; #DEBUG_LINE_NO:415
EndFunction

Function Fragment_Stage_0310_Item_00()
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:423
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:424
  RIR03.SetStage(1) ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:433
  Self.SetStage(5010) ; #DEBUG_LINE_NO:434
  RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:435
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:436
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:437
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:438
  RIR03.SetStage(2) ; #DEBUG_LINE_NO:439
  Game.GetPlayer().AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:448
  Self.SetStage(5010) ; #DEBUG_LINE_NO:449
  RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:450
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:451
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:452
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:453
  RIR03.SetStage(3) ; #DEBUG_LINE_NO:454
  Game.GetPlayer().AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:455
EndFunction

Function Fragment_Stage_0500_Item_00()
  RIR04.SetStage(2) ; #DEBUG_LINE_NO:463
EndFunction

Function Fragment_Stage_0510_Item_00()
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:471
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:472
  RIR05.SetStage(1) ; #DEBUG_LINE_NO:473
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:481
  Self.SetStage(5010) ; #DEBUG_LINE_NO:482
  RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:483
  RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:484
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:485
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:486
  RIR05.SetStage(2) ; #DEBUG_LINE_NO:487
  Game.GetPlayer().AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0600_Item_00()
  RI06.SetStage(15) ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_0610_Item_00()
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:504
  RIR06.SetStage(1) ; #DEBUG_LINE_NO:505
  Self.SetStage(1) ; #DEBUG_LINE_NO:506
EndFunction

Function Fragment_Stage_0620_Item_00()
  RI01_TomoDead.SetValue(1.0) ; #DEBUG_LINE_NO:514
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:515
  RIR06.SetStage(1) ; #DEBUG_LINE_NO:516
  Self.SetStage(1) ; #DEBUG_LINE_NO:517
EndFunction

Function Fragment_Stage_0630_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:525
  Self.SetStage(5010) ; #DEBUG_LINE_NO:526
  RI01_TomoDead.SetValue(1.0) ; #DEBUG_LINE_NO:527
  RIR06_RadiantCount.SetValue(2.0) ; #DEBUG_LINE_NO:528
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:529
  RIR06.SetStage(3) ; #DEBUG_LINE_NO:530
  Self.SetStage(2) ; #DEBUG_LINE_NO:531
  Game.GetPlayer().AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_0640_Item_00()
  RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:540
  Self.SetStage(5010) ; #DEBUG_LINE_NO:541
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:542
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:543
  RI01_TomoDead.SetValue(1.0) ; #DEBUG_LINE_NO:544
  RIR06_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:545
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:546
  RIR06.SetStage(3) ; #DEBUG_LINE_NO:547
  Self.SetStage(2) ; #DEBUG_LINE_NO:548
EndFunction

Function Fragment_Stage_0650_Item_00()
  RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:556
  Self.SetStage(5010) ; #DEBUG_LINE_NO:557
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:558
  RIR06_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:559
  RIR06_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:560
  RIR06.SetStage(3) ; #DEBUG_LINE_NO:561
  Self.SetStage(2) ; #DEBUG_LINE_NO:562
  Game.GetPlayer().AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:563
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:571
  RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:572
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:573
  RIR07_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:574
  RIR07.SetStage(1) ; #DEBUG_LINE_NO:575
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:583
  RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:584
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:585
  RIR07_QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:586
  RIR07.SetStage(2) ; #DEBUG_LINE_NO:587
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:595
  ri_radiantsupportquestscript kmyQuest = __temp as ri_radiantsupportquestscript ; #DEBUG_LINE_NO:596
  Alias_VentDoors.BlockActivation(True, True) ; #DEBUG_LINE_NO:599
  Alias_HoldingCellDoor.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:600
  kmyQuest.LockVentDoors() ; #DEBUG_LINE_NO:601
EndFunction

Function Fragment_Stage_1100_Item_00()
  Alias_RI04_CraneButton.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_ClinicSecurityGuard.GetRef().Disable(False) ; #DEBUG_LINE_NO:617
  Alias_ClinicSecureWingDoor.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:618
  Alias_Kendrick.GetRef().Disable(False) ; #DEBUG_LINE_NO:619
  Alias_Sean.GetRef().Disable(False) ; #DEBUG_LINE_NO:620
EndFunction

Function Fragment_Stage_2100_Item_00()
  ObjectReference SeanRef = Alias_Sean.GetRef() ; #DEBUG_LINE_NO:628
  ObjectReference KendrickRef = Alias_Kendrick.GetRef() ; #DEBUG_LINE_NO:629
  If RI06_SeanDead.GetValue() == 0.0 && RI06_KendrickDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:631
    SeanRef.Enable(False) ; #DEBUG_LINE_NO:632
    SeanRef.MoveTo(Alias_SeanMoveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:633
    KendrickRef.Enable(False) ; #DEBUG_LINE_NO:634
    KendrickRef.MoveTo(Alias_KendrickMoveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:635
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_3000_Item_00()
  Alias_UlaruOfficeEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:644
  Alias_MasakoOfficeEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:645
EndFunction

Function Fragment_Stage_4000_Item_00()
  Alias_Imogene.GetRef().Enable(False) ; #DEBUG_LINE_NO:653
EndFunction

Function Fragment_Stage_5000_Item_00()
  Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed) ; #DEBUG_LINE_NO:662
  Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeCFR03NotAllowed) ; #DEBUG_LINE_NO:663
  Alias_Location_LaredoLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:667
  Alias_Location_TridentLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:668
  Alias_Location_AkilaCityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:669
  Alias_Location_AkilaTradeAuthorityLocation.GetLocation().AddKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:670
EndFunction

Function Fragment_Stage_5010_Item_00()
  Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed) ; #DEBUG_LINE_NO:678
  Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeCFR03NotAllowed) ; #DEBUG_LINE_NO:679
  Alias_Location_LaredoLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:681
  Alias_Location_TridentLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:682
  Alias_Location_AkilaCityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:683
  Alias_Location_AkilaTradeAuthorityLocation.GetLocation().RemoveKeyword(LocTypeRIRadiantsNotAllowed) ; #DEBUG_LINE_NO:684
EndFunction

Function Fragment_Stage_6000_Item_00()
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing) ; #DEBUG_LINE_NO:692
EndFunction

Function Fragment_Stage_6010_Item_00()
  Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowClothing) ; #DEBUG_LINE_NO:700
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowSpacesuit) ; #DEBUG_LINE_NO:701
EndFunction

Function Fragment_Stage_6020_Item_00()
  Alias_Location_InfinityLTD.GetLocation().RemoveKeyword(LocTypeShowSpacesuit) ; #DEBUG_LINE_NO:709
  Alias_Location_InfinityLTD.GetLocation().AddKeyword(LocTypeShowClothing) ; #DEBUG_LINE_NO:710
EndFunction
