ScriptName Fragments:Quests:QF_RI08_0018B717 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI08_BoardMemberCount Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeQS Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
Scene Property RI08_0910_Meeting_MasakoWinsScene Auto Const mandatory
GlobalVariable Property RI08_BoardMemberTotal Auto Const mandatory
ReferenceAlias Property Alias_ConferenceRoomQS Auto Const mandatory
GlobalVariable Property RI08_InfinityYayCount Auto Const mandatory
GlobalVariable Property RI08_InfinityNayCount Auto Const mandatory
GlobalVariable Property RI08_NeuroampNayCount Auto Const mandatory
GlobalVariable Property RI08_NeuroampYayCount Auto Const mandatory
GlobalVariable Property RI08_MasakoYayCount Auto Const mandatory
GlobalVariable Property RI08_MasakoNayCount Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_RyujinIndustriesSecurity Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeChair Auto Const mandatory
ReferenceAlias Property Alias_SecurityPostFurniture Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
GlobalVariable Property RI08_AcquiredInfinity Auto Const mandatory
GlobalVariable Property RI08_ContinuedNeuroampResearch Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Scene Property RI08_0910_Meeting_UlaruWinsScene Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeChair Auto Const mandatory
ReferenceAlias Property Alias_SecurityGuardMasakoFurniture Auto Const mandatory
ReferenceAlias Property Alias_Alexis Auto Const mandatory
ReferenceAlias Property Alias_Dalton Auto Const mandatory
ReferenceAlias Property Alias_Genevieve Auto Const mandatory
ReferenceAlias Property Alias_Linden Auto Const mandatory
ReferenceAlias Property Alias_Veena Auto Const mandatory
ReferenceAlias Property Alias_UlaruConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_VeenaConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_AlexisConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_DaltonConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_LindenConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_GenevieveConferenceChair Auto Const mandatory
Quest Property RI08_PostQuest Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ActorValue Property RI08_Foreknowledge_QuestLineCompletedAV Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const mandatory
ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const mandatory
Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const mandatory
GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const mandatory
Quest Property RI07 Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
GlobalVariable Property RI08_UlaruRemainedCFO Auto Const mandatory
Keyword Property RI08_PlayerFurnitureKeyword Auto Const mandatory
ReferenceAlias Property Alias_ConferenceRoomChairsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_UlaruConferencePlayerChair Auto Const mandatory
ReferenceAlias Property Alias_VeenaConferencePlayerChair Auto Const mandatory
ReferenceAlias Property Alias_DaltonConferencePlayerChair Auto Const mandatory
ReferenceAlias Property Alias_MasakoUlaruMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerEnteredConferenceRoomTrigger Auto Const mandatory
ReferenceAlias Property Alias_PlayerOfficeDoor Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_RyujinFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:8
  RI_Support.SetStage(2) ; #DEBUG_LINE_NO:11
  Alias_ExecutiveGenericNPCs.GetRef().Disable(False) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:22
  Self.SetStage(100) ; #DEBUG_LINE_NO:23
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:32
  Self.SetStage(200) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:42
  Self.SetStage(100) ; #DEBUG_LINE_NO:43
  Self.SetStage(670) ; #DEBUG_LINE_NO:44
  Self.SetStage(680) ; #DEBUG_LINE_NO:45
  Self.SetStage(695) ; #DEBUG_LINE_NO:46
  Self.SetStage(200) ; #DEBUG_LINE_NO:47
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:56
  Self.SetStage(200) ; #DEBUG_LINE_NO:57
  Self.SetStage(275) ; #DEBUG_LINE_NO:58
  Self.SetStage(280) ; #DEBUG_LINE_NO:59
  Self.SetStage(300) ; #DEBUG_LINE_NO:60
  Self.SetStage(375) ; #DEBUG_LINE_NO:61
  Self.SetStage(380) ; #DEBUG_LINE_NO:62
  Self.SetStage(400) ; #DEBUG_LINE_NO:63
  Self.SetStage(475) ; #DEBUG_LINE_NO:64
  Self.SetStage(480) ; #DEBUG_LINE_NO:65
  Self.SetStage(500) ; #DEBUG_LINE_NO:66
  Self.SetStage(575) ; #DEBUG_LINE_NO:67
  Self.SetStage(580) ; #DEBUG_LINE_NO:68
  Self.SetStage(600) ; #DEBUG_LINE_NO:69
  Self.SetStage(675) ; #DEBUG_LINE_NO:70
  Self.SetStage(680) ; #DEBUG_LINE_NO:71
  Self.SetStage(700) ; #DEBUG_LINE_NO:72
  Self.SetStage(775) ; #DEBUG_LINE_NO:73
  Self.SetStage(780) ; #DEBUG_LINE_NO:74
  Self.SetStage(800) ; #DEBUG_LINE_NO:75
  Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:96
  Self.SetStage(100) ; #DEBUG_LINE_NO:108
  Self.SetStage(200) ; #DEBUG_LINE_NO:109
  Self.SetStage(275) ; #DEBUG_LINE_NO:110
  Self.SetStage(285) ; #DEBUG_LINE_NO:111
  Self.SetStage(295) ; #DEBUG_LINE_NO:112
  Self.SetStage(300) ; #DEBUG_LINE_NO:113
  Self.SetStage(375) ; #DEBUG_LINE_NO:114
  Self.SetStage(385) ; #DEBUG_LINE_NO:115
  Self.SetStage(395) ; #DEBUG_LINE_NO:116
  Self.SetStage(400) ; #DEBUG_LINE_NO:117
  Self.SetStage(475) ; #DEBUG_LINE_NO:118
  Self.SetStage(485) ; #DEBUG_LINE_NO:119
  Self.SetStage(495) ; #DEBUG_LINE_NO:120
  Self.SetStage(500) ; #DEBUG_LINE_NO:121
  Self.SetStage(575) ; #DEBUG_LINE_NO:122
  Self.SetStage(585) ; #DEBUG_LINE_NO:123
  Self.SetStage(595) ; #DEBUG_LINE_NO:124
  Self.SetStage(600) ; #DEBUG_LINE_NO:125
  Self.SetStage(675) ; #DEBUG_LINE_NO:126
  Self.SetStage(685) ; #DEBUG_LINE_NO:127
  Self.SetStage(695) ; #DEBUG_LINE_NO:128
  Self.SetStage(700) ; #DEBUG_LINE_NO:129
  Self.SetStage(775) ; #DEBUG_LINE_NO:130
  Self.SetStage(785) ; #DEBUG_LINE_NO:131
  Self.SetStage(795) ; #DEBUG_LINE_NO:132
  Self.SetStage(800) ; #DEBUG_LINE_NO:133
  Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:143
  Self.SetStage(200) ; #DEBUG_LINE_NO:144
  Self.SetStage(300) ; #DEBUG_LINE_NO:145
  Self.SetStage(400) ; #DEBUG_LINE_NO:146
  Self.SetStage(500) ; #DEBUG_LINE_NO:147
  Self.SetStage(600) ; #DEBUG_LINE_NO:148
  Self.SetStage(700) ; #DEBUG_LINE_NO:149
  Self.SetStage(800) ; #DEBUG_LINE_NO:150
  If RI08_InfinityYayCount.GetValue() == 0.0 && RI08_InfinityNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:152
    RI08_InfinityYayCount.SetValue(7.0) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
  If RI08_NeuroampYayCount.GetValue() == 0.0 && RI08_NeuroampNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:155
    RI08_NeuroampNayCount.SetValue(7.0) ; #DEBUG_LINE_NO:156
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoYayCount.GetValue() == 0.0 && RI08_MasakoNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:158
    RI08_MasakoYayCount.SetValue(7.0) ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(900) ; #DEBUG_LINE_NO:162
  Self.SetStage(1000) ; #DEBUG_LINE_NO:163
  Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:173
  Self.SetStage(100) ; #DEBUG_LINE_NO:174
  Self.SetStage(200) ; #DEBUG_LINE_NO:175
  Self.SetStage(300) ; #DEBUG_LINE_NO:176
  Self.SetStage(400) ; #DEBUG_LINE_NO:177
  Self.SetStage(500) ; #DEBUG_LINE_NO:178
  Self.SetStage(600) ; #DEBUG_LINE_NO:179
  Self.SetStage(700) ; #DEBUG_LINE_NO:180
  Self.SetStage(800) ; #DEBUG_LINE_NO:181
  If RI08_InfinityYayCount.GetValue() == 0.0 && RI08_InfinityNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:183
    RI08_InfinityNayCount.SetValue(7.0) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
  If RI08_NeuroampYayCount.GetValue() == 0.0 && RI08_NeuroampNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:186
    RI08_NeuroampNayCount.SetValue(7.0) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoYayCount.GetValue() == 0.0 && RI08_MasakoNayCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:189
    RI08_MasakoNayCount.SetValue(7.0) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(900) ; #DEBUG_LINE_NO:193
  Self.SetStage(1100) ; #DEBUG_LINE_NO:194
  Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:205
  Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:217
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:219
    Alias_UlaruChairSwapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:222
  Else ; #DEBUG_LINE_NO:
    Self.ModObjectiveGlobal(-1.0, RI08_BoardMemberTotal, -1, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:224
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayedAtTop(200) ; #DEBUG_LINE_NO:227
  Self.SetObjectiveDisplayed(201, True, False) ; #DEBUG_LINE_NO:228
  Self.SetObjectiveDisplayed(202, True, False) ; #DEBUG_LINE_NO:229
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:230
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:231
    Self.SetObjectiveDisplayed(203, True, False) ; #DEBUG_LINE_NO:232
    Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:233
    Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:234
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(670) ; #DEBUG_LINE_NO:238
    Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(675) ; #DEBUG_LINE_NO:241
    Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:242
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(680) ; #DEBUG_LINE_NO:244
    Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:245
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(685) ; #DEBUG_LINE_NO:247
    Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(695) ; #DEBUG_LINE_NO:250
    Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:251
  EndIf ; #DEBUG_LINE_NO:
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:255
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:256
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:265
EndFunction

Function Fragment_Stage_0275_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0285_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:297
EndFunction

Function Fragment_Stage_0295_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:313
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:315
    Self.SetStage(900) ; #DEBUG_LINE_NO:316
    Alias_Alexis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:327
EndFunction

Function Fragment_Stage_0375_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:336
EndFunction

Function Fragment_Stage_0380_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_0385_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0395_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:380
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:382
    Self.SetStage(900) ; #DEBUG_LINE_NO:383
    Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:384
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0470_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0475_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_0480_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:412
EndFunction

Function Fragment_Stage_0485_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:421
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:430
EndFunction

Function Fragment_Stage_0495_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:439
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:447
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:449
    Self.SetStage(900) ; #DEBUG_LINE_NO:450
    Alias_Genevieve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:451
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0570_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:461
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:470
EndFunction

Function Fragment_Stage_0580_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_0585_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0590_Item_00()
  If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0 ; #DEBUG_LINE_NO:496
    Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:497
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0595_Item_00()
  If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0 ; #DEBUG_LINE_NO:506
    Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:507
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:516
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:518
    Self.SetStage(900) ; #DEBUG_LINE_NO:519
    Alias_Linden.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:520
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0670_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:529
    Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:530
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0675_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:539
    Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:540
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0680_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:549
    Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:550
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0685_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:559
    Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:560
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0690_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:569
    Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:570
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0695_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:579
    Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:580
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:589
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:591
    Self.SetStage(900) ; #DEBUG_LINE_NO:592
    Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:593
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0770_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampYayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:603
EndFunction

Function Fragment_Stage_0775_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_NeuroampNayCount, 202, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:612
EndFunction

Function Fragment_Stage_0780_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityYayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:621
EndFunction

Function Fragment_Stage_0785_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_InfinityNayCount, 201, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:630
EndFunction

Function Fragment_Stage_0790_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoYayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:639
EndFunction

Function Fragment_Stage_0795_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_MasakoNayCount, 203, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:648
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.ModObjectiveGlobal(1.0, RI08_BoardMemberCount, 200, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:656
  If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue() ; #DEBUG_LINE_NO:658
    Self.SetStage(900) ; #DEBUG_LINE_NO:659
    Alias_Veena.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:660
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:669
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:670
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:673
  Self.SetObjectiveDisplayed(201, False, False) ; #DEBUG_LINE_NO:674
  Self.SetObjectiveDisplayed(202, False, False) ; #DEBUG_LINE_NO:675
  Self.SetObjectiveDisplayed(203, False, False) ; #DEBUG_LINE_NO:676
  Self.SetObjectiveDisplayedAtTop(900) ; #DEBUG_LINE_NO:677
  Alias_ConferenceRoomChairsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:679
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:681
    Alias_UlaruConferenceChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:682
    Alias_UlaruConferencePlayerChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:683
  EndIf ; #DEBUG_LINE_NO:
  Alias_DaltonConferenceChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:685
  Alias_DaltonConferencePlayerChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:686
  Alias_VeenaConferenceChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:687
  Alias_VeenaConferencePlayerChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:688
  Alias_Alexis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:690
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:691
  Alias_Genevieve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:692
  Alias_Linden.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:693
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:694
  Alias_Veena.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:695
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:696
  kmyQuest.CalculateVotes() ; #DEBUG_LINE_NO:698
EndFunction

Function Fragment_Stage_0901_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:706
  Actor MasakoRef = Alias_Masako.GetActorRef() ; #DEBUG_LINE_NO:707
  Actor UlaruRef = Alias_Ularu.GetActorRef() ; #DEBUG_LINE_NO:708
  ObjectReference MoveMarkerRef = Alias_MasakoUlaruMoveToMarker.GetRef() ; #DEBUG_LINE_NO:709
  ObjectReference TriggerRef = Alias_PlayerEnteredConferenceRoomTrigger.GetRef() ; #DEBUG_LINE_NO:710
  If !PlayerRef.HasDetectionLOS(MasakoRef as ObjectReference) && !TriggerRef.IsInTrigger(MasakoRef as ObjectReference) ; #DEBUG_LINE_NO:711
    MasakoRef.MoveTo(MoveMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:712
  EndIf ; #DEBUG_LINE_NO:
  If !PlayerRef.HasDetectionLOS(UlaruRef as ObjectReference) && !TriggerRef.IsInTrigger(UlaruRef as ObjectReference) && RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:714
    UlaruRef.MoveTo(MoveMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:715
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0905_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:724
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:725
  kmyQuest.FreezeControlsMeeting() ; #DEBUG_LINE_NO:728
EndFunction

Function Fragment_Stage_0909_Item_00()
  Self.SetStage(925) ; #DEBUG_LINE_NO:736
EndFunction

Function Fragment_Stage_0910_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:744
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:745
  If Self.IsObjectiveDisplayed(927) ; #DEBUG_LINE_NO:748
    Self.SetObjectiveCompleted(927, True) ; #DEBUG_LINE_NO:749
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(925) ; #DEBUG_LINE_NO:751
    Self.SetObjectiveCompleted(925, True) ; #DEBUG_LINE_NO:752
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(918) ; #DEBUG_LINE_NO:755
    If !Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:756
      Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:757
    EndIf ; #DEBUG_LINE_NO:
    If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 ; #DEBUG_LINE_NO:759
      RI08_0910_Meeting_MasakoWinsScene.Start() ; #DEBUG_LINE_NO:760
    Else ; #DEBUG_LINE_NO:
      RI08_0910_Meeting_UlaruWinsScene.Start() ; #DEBUG_LINE_NO:762
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(925, True, False) ; #DEBUG_LINE_NO:765
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0911_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:774
    If Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(915) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:775
      Self.SetStage(918) ; #DEBUG_LINE_NO:776
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:779
    Self.SetStage(918) ; #DEBUG_LINE_NO:780
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0912_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:790
    If Self.GetStageDone(911) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(915) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:791
      Self.SetStage(918) ; #DEBUG_LINE_NO:792
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(911) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:795
    Self.SetStage(918) ; #DEBUG_LINE_NO:796
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0913_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:806
    If Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(914) && Self.GetStageDone(915) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:807
      Self.SetStage(918) ; #DEBUG_LINE_NO:808
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(914) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:811
    Self.SetStage(918) ; #DEBUG_LINE_NO:812
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0914_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:822
    If Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(915) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:823
      Self.SetStage(918) ; #DEBUG_LINE_NO:824
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:827
    Self.SetStage(918) ; #DEBUG_LINE_NO:828
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0915_Item_00()
  If Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:838
    Self.SetStage(918) ; #DEBUG_LINE_NO:839
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0916_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:848
    If Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(915) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:849
      Self.SetStage(918) ; #DEBUG_LINE_NO:850
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(916) && Self.GetStageDone(917) ; #DEBUG_LINE_NO:853
    Self.SetStage(918) ; #DEBUG_LINE_NO:854
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0917_Item_00()
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:864
    If Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(915) && Self.GetStageDone(916) ; #DEBUG_LINE_NO:865
      Self.SetStage(918) ; #DEBUG_LINE_NO:866
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(911) && Self.GetStageDone(912) && Self.GetStageDone(913) && Self.GetStageDone(914) && Self.GetStageDone(916) ; #DEBUG_LINE_NO:869
    Self.SetStage(918) ; #DEBUG_LINE_NO:870
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0918_Item_00()
  If Self.IsObjectiveDisplayed(925) ; #DEBUG_LINE_NO:880
    Self.SetObjectiveCompleted(925, True) ; #DEBUG_LINE_NO:881
  EndIf ; #DEBUG_LINE_NO:
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:884
  ObjectReference PlayerFurniture = PlayerRef.GetFurnitureUsing() ; #DEBUG_LINE_NO:885
  If PlayerRef.GetSitState() == 3 && PlayerFurniture.HasKeyword(RI08_PlayerFurnitureKeyword) == True ; #DEBUG_LINE_NO:887
    Utility.Wait(5.0) ; #DEBUG_LINE_NO:888
    Self.SetStage(910) ; #DEBUG_LINE_NO:889
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(927) ; #DEBUG_LINE_NO:892
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0920_Item_00()
  If !Self.GetStageDone(915) && RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:901
    Alias_Ularu.GetActorRef().SnapIntoInteraction(Alias_UlaruConferenceChair.GetRef()) ; #DEBUG_LINE_NO:902
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(916) ; #DEBUG_LINE_NO:904
    Alias_Veena.GetActorRef().SnapIntoInteraction(Alias_VeenaConferenceChair.GetRef()) ; #DEBUG_LINE_NO:905
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(911) ; #DEBUG_LINE_NO:907
    Alias_Alexis.GetActorRef().SnapIntoInteraction(Alias_AlexisConferenceChair.GetRef()) ; #DEBUG_LINE_NO:908
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(914) ; #DEBUG_LINE_NO:910
    Alias_Linden.GetActorRef().SnapIntoInteraction(Alias_LindenConferenceChair.GetRef()) ; #DEBUG_LINE_NO:911
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(913) ; #DEBUG_LINE_NO:913
    Alias_Genevieve.GetActorRef().SnapIntoInteraction(Alias_GenevieveConferenceChair.GetRef()) ; #DEBUG_LINE_NO:914
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(912) ; #DEBUG_LINE_NO:916
    Alias_Dalton.GetActorRef().SnapIntoInteraction(Alias_DaltonConferenceChair.GetRef()) ; #DEBUG_LINE_NO:917
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0925_Item_00()
  Self.SetObjectiveDisplayed(925, True, False) ; #DEBUG_LINE_NO:926
EndFunction

Function Fragment_Stage_0927_Item_00()
  Self.SetObjectiveDisplayed(927, True, False) ; #DEBUG_LINE_NO:934
EndFunction

Function Fragment_Stage_0980_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:942
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:943
  RI08_UlaruRemainedCFO.SetValue(0.0) ; #DEBUG_LINE_NO:946
  kmyQuest.ModifyVotes() ; #DEBUG_LINE_NO:947
EndFunction

Function Fragment_Stage_0985_Item_00()
  RI08_UlaruRemainedCFO.SetValue(1.0) ; #DEBUG_LINE_NO:955
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:963
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:964
  kmyQuest.ModifyVotes() ; #DEBUG_LINE_NO:967
EndFunction

Function Fragment_Stage_10000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:975
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:976
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:979
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:980
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:982
    Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:983
  ElseIf Self.IsObjectiveDisplayed(1100) ; #DEBUG_LINE_NO:984
    Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:985
  EndIf ; #DEBUG_LINE_NO:
  If RI05_ImogeneDead.GetValue() == 0.0 && RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 ; #DEBUG_LINE_NO:988
    RI08_PostQuest.SetStage(100) ; #DEBUG_LINE_NO:989
  Else ; #DEBUG_LINE_NO:
    MissionBoardAccessAllowed_RI.SetValue(1.0) ; #DEBUG_LINE_NO:991
    RI08_PostQuest.SetStage(200) ; #DEBUG_LINE_NO:992
  EndIf ; #DEBUG_LINE_NO:
  Alias_PlayerOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:996
  Game.GetPlayer().SetValue(RI08_Foreknowledge_QuestLineCompletedAV, 1.0) ; #DEBUG_LINE_NO:998
  If RI08_ContinuedNeuroampResearch.GetValue() == 1.0 ; #DEBUG_LINE_NO:1000
    MQ305_RI_NeuroampPromoted.SetValue(1.0) ; #DEBUG_LINE_NO:1001
  Else ; #DEBUG_LINE_NO:
    MQ305_RI_NeuroampNotPromoted.SetValue(1.0) ; #DEBUG_LINE_NO:1003
  EndIf ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_RyujinFaction.Send(None) ; #DEBUG_LINE_NO:1007
  Game.AddAchievement(19) ; #DEBUG_LINE_NO:1010
  Self.Stop() ; #DEBUG_LINE_NO:1012
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1020
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:1021
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1024
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:1025
  kmyQuest.UnfreezeControlsMeeting() ; #DEBUG_LINE_NO:1026
  Actor UlaruRef = Alias_Ularu.GetActorRef() ; #DEBUG_LINE_NO:1027
  UlaruRef.MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1029
  UlaruRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:1030
  Alias_RyujinIndustriesSecurity.GetRef().MoveTo(Alias_SecurityPostFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1031
  Game.GetPlayer().GetFurnitureUsing().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1033
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1034
  Alias_Alexis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1035
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1036
  Alias_Genevieve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1037
  Alias_Linden.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1038
  Alias_Veena.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1039
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1047
  ri08_questscript kmyQuest = __temp as ri08_questscript ; #DEBUG_LINE_NO:1048
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1051
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:1052
  kmyQuest.UnfreezeControlsMeeting() ; #DEBUG_LINE_NO:1053
  Actor MasakoRef = Alias_Masako.GetActorRef() ; #DEBUG_LINE_NO:1054
  MasakoRef.MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1056
  MasakoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:1057
  Alias_RyujinIndustriesSecurity.GetRef().MoveTo(Alias_SecurityGuardMasakoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1058
  Game.GetPlayer().GetFurnitureUsing().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1060
  Alias_Alexis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1061
  Alias_Dalton.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1062
  Alias_Genevieve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1063
  Alias_Linden.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1064
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1065
  Alias_Veena.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1066
EndFunction

Function Fragment_Stage_1200_Item_00()
  Alias_ConferenceRoomChairsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:1074
  If RI05_UlaruDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:1075
    Alias_UlaruConferenceChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:1076
    Alias_UlaruConferencePlayerChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:1077
  EndIf ; #DEBUG_LINE_NO:
  Alias_DaltonConferenceChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:1079
  Alias_DaltonConferencePlayerChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:1080
  Alias_VeenaConferenceChair.GetRef().Disable(False) ; #DEBUG_LINE_NO:1081
  Alias_VeenaConferencePlayerChair.GetRef().Enable(False) ; #DEBUG_LINE_NO:1082
EndFunction
