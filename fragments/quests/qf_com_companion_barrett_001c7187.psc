ScriptName Fragments:Quests:QF_COM_Companion_Barrett_001C7187 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property SQ_Companions Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property SmallCredits Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
GlobalVariable Property LargeCredits Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ActorValue Property OnPlayerShip Auto Const mandatory
ActorValue Property AV_TimesRomanced Auto Const mandatory
ActorValue Property AV_TimesMarried Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory
Message Property BQ02_PQ_AdvancingQuestWarning Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_01_Small Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_02_Medium Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Faction_03_Large Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory
affinityevent Property COM_Barrett_QuestEvent_FrontierDestroyed Auto Const mandatory
ReferenceAlias Property Alias_BarrettShip Auto Const mandatory
affinityevent Property COM_Barrett_QuestEvent_FrontierDestroyed_Like Auto Const mandatory
Perk Property Crew_Ship_Weapons_ParticleBeam Auto Const mandatory
Perk Property Crew_Robotics Auto Const mandatory
Perk Property CREW_Ship_StarshipEngineering Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Alias_Barrett.GetActorRef().SetValue(COM_Affinity, 100.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0003_Item_00()
  COM_Barrett_QuestEvent_FrontierDestroyed.Send(None) ; #DEBUG_LINE_NO:15
  Alias_BarrettShip.Clear() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0003_Item_01()
  COM_Barrett_QuestEvent_FrontierDestroyed_Like.Send(None) ; #DEBUG_LINE_NO:24
  Alias_BarrettShip.Clear() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0019_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_03_Large as Form, 1, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0019_Item_01()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_02_Medium as Form, 1, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0019_Item_02()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Faction_01_Small as Form, 1, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0060_Item_00()
  COM_Quest_Barrett_Q01.SetStage(8301) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0069_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:81
  com_barrett_epiloguetimerscript kmyQuest = __temp as com_barrett_epiloguetimerscript ; #DEBUG_LINE_NO:82
  COM_Quest_Barrett_Q01.SetStage(7401) ; #DEBUG_LINE_NO:85
  kmyQuest.StartCooldownTimer() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0111_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0112_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0113_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0114_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetStage(130) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0122_Item_00()
  Self.SetStage(130) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:150
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:151
  (SQ_Companions as sq_companionsscript).SetRoleActive(Alias_Barrett.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0208_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:162
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:163
  COM_Quest_Barrett_Q02.Start() ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0213_Item_00()
  Self.SetStage(216) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0216_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0220_Item_00()
  If !Self.GetStageDone(211) ; #DEBUG_LINE_NO:190
    Self.SetStage(21) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0221_Item_00()
  Self.SetStage(230) ; #DEBUG_LINE_NO:200
EndFunction

Function Fragment_Stage_0222_Item_00()
  Self.SetStage(230) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(290) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetStage(290) ; #DEBUG_LINE_NO:232
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(390) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0421_Item_00()
  Self.SetStage(26) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0425_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:256
  Self.SetStage(27) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:266
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:267
  COM_WantsToTalkEvent_COM_Barrett_PersonalQuestFollowup.Send(None) ; #DEBUG_LINE_NO:270
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetStage(390) ; #DEBUG_LINE_NO:278
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(490) ; #DEBUG_LINE_NO:286
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:294
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetStage(490) ; #DEBUG_LINE_NO:302
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:310
EndFunction

Function Fragment_Stage_0560_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:318
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:328
  Self.SetStage(560) ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetStage(560) ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(690) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_0731_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:353
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:354
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:357
  Self.SetStage(750) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0732_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:366
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:367
  Self.SetStage(750) ; #DEBUG_LINE_NO:370
  COM_Quest_Barrett_Q01.SetStage(7401) ; #DEBUG_LINE_NO:371
EndFunction

Function Fragment_Stage_0740_Item_00()
  Self.SetStage(690) ; #DEBUG_LINE_NO:379
EndFunction

Function Fragment_Stage_0750_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:387
  com_barrett_epiloguetimerscript kmyQuest = __temp as com_barrett_epiloguetimerscript ; #DEBUG_LINE_NO:388
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:391
  Float TimesRomanced = PlayerREF.GetValue(AV_TimesRomanced) ; #DEBUG_LINE_NO:392
  Self.SetStage(740) ; #DEBUG_LINE_NO:394
  If Self.GetStageDone(732) ; #DEBUG_LINE_NO:395
    TimesRomanced += 1.0 ; #DEBUG_LINE_NO:396
    PlayerREF.SetValue(AV_TimesRomanced, TimesRomanced) ; #DEBUG_LINE_NO:397
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.StartCooldownTimer() ; #DEBUG_LINE_NO:400
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetStage(740) ; #DEBUG_LINE_NO:408
EndFunction

Function Fragment_Stage_0831_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:416
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:417
  kmyQuest.CommitmentDesired(True) ; #DEBUG_LINE_NO:420
  Self.SetStage(900) ; #DEBUG_LINE_NO:421
EndFunction

Function Fragment_Stage_0832_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:429
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:430
  kmyQuest.CommitmentDesired(True) ; #DEBUG_LINE_NO:433
  Self.SetStage(900) ; #DEBUG_LINE_NO:434
EndFunction

Function Fragment_Stage_0840_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:442
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:443
  Self.SetStage(740) ; #DEBUG_LINE_NO:446
  kmyQuest.CommitmentDesired(True) ; #DEBUG_LINE_NO:447
  kmyQuest.StartCommitmentQuest() ; #DEBUG_LINE_NO:449
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:451
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:459
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:460
  Self.SetStage(840) ; #DEBUG_LINE_NO:463
  Self.SetStage(870) ; #DEBUG_LINE_NO:464
  If Self.GetStageDone(832) ; #DEBUG_LINE_NO:466
    COM_Quest_Barrett_Commitment.SetStage(52) ; #DEBUG_LINE_NO:467
  Else ; #DEBUG_LINE_NO:
    COM_Quest_Barrett_Commitment.SetStage(51) ; #DEBUG_LINE_NO:469
  EndIf ; #DEBUG_LINE_NO:
  COM_Quest_Barrett_Commitment.SetStage(50) ; #DEBUG_LINE_NO:473
EndFunction

Function Fragment_Stage_0950_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:481
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:482
  kmyQuest.MakeNotRomantic() ; #DEBUG_LINE_NO:485
  kmyQuest.MakeNotCommitted(False) ; #DEBUG_LINE_NO:486
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:494
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:495
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:498
  Float TimesMarried = PlayerREF.GetValue(AV_TimesMarried) ; #DEBUG_LINE_NO:499
  TimesMarried += 1.0 ; #DEBUG_LINE_NO:501
  PlayerREF.SetValue(AV_TimesMarried, TimesMarried) ; #DEBUG_LINE_NO:502
  kmyQuest.MakeCommitted() ; #DEBUG_LINE_NO:504
EndFunction
