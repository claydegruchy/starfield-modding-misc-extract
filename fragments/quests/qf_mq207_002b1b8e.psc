ScriptName Fragments:Quests:QF_MQ207_002B1B8E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Emissary Auto Const mandatory
Message Property MQ207HelmetRemovalMSG Auto Const mandatory
Message Property MQ207HunterHelmetRemovalMSG Auto Const mandatory
Scene Property MQ207_002_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Scene Property MQ207_004_LeaveScene Auto Const mandatory
ReferenceAlias Property Alias_HelixShip Auto Const mandatory
ReferenceAlias Property Alias_ScorpiusShip Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
Faction Property MQ_EmissaryAllyFaction Auto Const mandatory
Message Property TestMQ206AMSG Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
Quest Property MQ206B Auto Const mandatory
ObjectReference Property MQ207_FinalScene_EmissaryMarker Auto Const mandatory
VoiceType Property NPCFSarahMorgan Auto Const mandatory
VoiceType Property NPCMSamCoe Auto Const mandatory
ReferenceAlias Property Alias_CompanionWhoDies Auto Const mandatory
VoiceType Property NPCFAndreja Auto Const mandatory
VoiceType Property NPCMBarrett Auto Const mandatory
Quest Property MQ301 Auto Const mandatory
Quest Property MQ206C Auto Const mandatory
Key Property MQ301MoonBaseKey Auto Const mandatory
Quest Property MQ207_PostQuestDialogue Auto Const mandatory
Scene Property MQ207_001b_AcceptHail Auto Const mandatory
Faction Property MQ_HunterAllyFaction Auto Const mandatory
Scene Property MQ207_001b_AcceptHail_NGPlus Auto Const mandatory
ActorValue Property MQ207_NGPlusCouncilAV Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Idle Property Stage2 Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearC Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Idle Property Stage1 Auto Const mandatory
Faction Property MQEmissaryHunterCrimeFaction Auto Const mandatory
Faction Property MQHunterCrimeFaction Auto Const mandatory
Idle Property Stage3 Auto Const mandatory
Idle Property Stage4 Auto Const mandatory
Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Auto Const mandatory
Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Auto Const mandatory
Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Auto Const mandatory
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:7
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:9
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:10
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:11
    Alias_SarahMorgan.GetActorRef().disable(False) ; #DEBUG_LINE_NO:12
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:13
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:14
    Alias_SamCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:15
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:16
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:17
    Alias_Andreja.GetActorRef().disable(False) ; #DEBUG_LINE_NO:18
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:19
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:20
    Alias_Barrett.GetActorRef().disable(False) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  MQ206B.SetStage(800) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0005_Item_00()
  spaceshipreference HelixREF = Alias_HelixShip.GetShipRef() ; #DEBUG_LINE_NO:32
  spaceshipreference ScorpiusREF = Alias_ScorpiusShip.GetShipRef() ; #DEBUG_LINE_NO:33
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:34
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:35
  HelixREF.disable(False) ; #DEBUG_LINE_NO:38
  ScorpiusREF.Reset(None) ; #DEBUG_LINE_NO:40
  ScorpiusREF.MoveTo(HelixOborumMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
  ScorpiusREF.Enable(False) ; #DEBUG_LINE_NO:42
  EmissaryREF.MoveTo(MQ207_EmissaryMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  HunterREF.MoveTo(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:46
  HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:49
  EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:50
  ScorpiusREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:59
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:60
  Game.SetInChargen(True, False, False) ; #DEBUG_LINE_NO:64
  kmyQuest.MQ207EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:65
  kmyQuest.MQ207EnableLayer.DisablePlayerControls(False, True, False, False, False, False, True, False, False, False, False) ; #DEBUG_LINE_NO:66
  kmyQuest.MQ207EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:67
  kmyQuest.MQ207EnableLayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:68
  kmyQuest.MQ207EnableLayer.EnableGravJump(False) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:71
  MQ207_001b_AcceptHail.Start() ; #DEBUG_LINE_NO:73
  Self.SetActive(True) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0010_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:83
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:84
  kmyQuest.MQ207EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:88
  kmyQuest.MQ207EnableLayer.DisablePlayerControls(False, True, False, False, False, False, False, False, False, False, False) ; #DEBUG_LINE_NO:89
  kmyQuest.MQ207EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:90
  kmyQuest.MQ207EnableLayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:91
  kmyQuest.MQ207EnableLayer.EnableGravJump(False) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:94
  MQ207_001b_AcceptHail_NGPlus.Start() ; #DEBUG_LINE_NO:96
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:99
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:100
  If DeadCompanionREF == Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:102
    EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan) ; #DEBUG_LINE_NO:103
  ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:104
    EmissaryREF.SetOverrideVoicetype(NPCMSamCoe) ; #DEBUG_LINE_NO:105
  ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:106
    EmissaryREF.SetOverrideVoicetype(NPCFAndreja) ; #DEBUG_LINE_NO:107
  ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:108
    EmissaryREF.SetOverrideVoicetype(NPCMBarrett) ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
  MQ_EmissaryRevealed.SetValueInt(1) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:120
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:121
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:125
  kmyQuest.MQ207EnableLayer.EnablePlayerControls(True, False, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:126
  Game.GetPlayer().addtoFaction(MQ_HunterAllyFaction) ; #DEBUG_LINE_NO:129
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:131
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:140
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:141
  kmyQuest.FollowersToldtoWait = (SQ_Followers as sq_followersscript).AllFollowersWait(None, True, False) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:147
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Hunter.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:156
  MUSGenesisStingerStarbornAppearC.Add() ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0205_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:166
  EmissaryREF.PlayIdle(Stage2) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:178
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:179
  If DeadCompanionREF == Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:181
    EmissaryREF.SetOverrideVoicetype(NPCFSarahMorgan) ; #DEBUG_LINE_NO:182
  ElseIf DeadCompanionREF == Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:183
    EmissaryREF.SetOverrideVoicetype(NPCMSamCoe) ; #DEBUG_LINE_NO:184
  ElseIf DeadCompanionREF == Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:185
    EmissaryREF.SetOverrideVoicetype(NPCFAndreja) ; #DEBUG_LINE_NO:186
  ElseIf DeadCompanionREF == Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:187
    EmissaryREF.SetOverrideVoicetype(NPCMBarrett) ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
  EmissaryREF.PlayIdle(Stage3) ; #DEBUG_LINE_NO:191
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(EmissaryREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:192
  MQ_EmissaryRevealed.SetValueInt(1) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0215_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:202
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:203
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:206
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:207
  EmissaryREF.PlayIdle(Stage1) ; #DEBUG_LINE_NO:208
  HunterREF.PlayIdle(Stage1) ; #DEBUG_LINE_NO:209
  EmissaryREF.RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE as Form, 1, False, None) ; #DEBUG_LINE_NO:211
  EmissaryREF.EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower as Form, False, False) ; #DEBUG_LINE_NO:212
  (EmissaryREF.GetBaseObject() as ActorBase).SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True) ; #DEBUG_LINE_NO:213
  EmissaryREF.SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True) ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0305_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:222
  HunterREF.PlayIdle(Stage2) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:232
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:233
  kmyQuest.SwitchToAquilus() ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:244
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:245
  kmyQuest.SwitchToHunter() ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:256
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:257
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:258
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:259
  Self.SetStage(215) ; #DEBUG_LINE_NO:261
EndFunction

Function Fragment_Stage_0500_Item_01()
  Game.GetPlayer().SetValue(MQ207_NGPlusCouncilAV, 1.0) ; #DEBUG_LINE_NO:270
  Self.SetStage(1000) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0530_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:288
EndFunction

Function Fragment_Stage_0900_Item_00()
  MQ207_004_LeaveScene.Start() ; #DEBUG_LINE_NO:303
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_Emissary.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:311
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:313
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False) ; #DEBUG_LINE_NO:322
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:323
  MQ301.SetStage(10) ; #DEBUG_LINE_NO:324
  MQ206C.SetStage(10) ; #DEBUG_LINE_NO:325
EndFunction

Function Fragment_Stage_1000_Item_01()
  Game.GetPlayer().additem(MQ301MoonBaseKey as Form, 1, False) ; #DEBUG_LINE_NO:334
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:335
  MQ301.SetStage(10) ; #DEBUG_LINE_NO:336
  MQ206C.SetStage(10) ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_1000_Item_02()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:346
  MQ301.SetStage(130) ; #DEBUG_LINE_NO:347
  MQ206C.SetStage(10) ; #DEBUG_LINE_NO:348
EndFunction

Function Fragment_Stage_1000_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:357
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:358
  kmyQuest.MQ207EnableLayer = None ; #DEBUG_LINE_NO:361
  Game.AddAchievement(7) ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_1010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:372
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:373
  (SQ_Followers as sq_followersscript).AllFollowersFollow(kmyQuest.FollowersToldtoWait) ; #DEBUG_LINE_NO:377
  kmyQuest.FollowersToldtoWait = None ; #DEBUG_LINE_NO:378
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:386
  mq207script kmyQuest = __temp as mq207script ; #DEBUG_LINE_NO:387
  Self.Stop() ; #DEBUG_LINE_NO:390
EndFunction

Function Fragment_Stage_2000_Item_00()
  spaceshipreference HunterShipREF = Alias_ScorpiusShip.GetShipReference() ; #DEBUG_LINE_NO:398
  spaceshipreference EmissaryShipREF = Alias_HelixShip.GetShipReference() ; #DEBUG_LINE_NO:399
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:400
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:401
  Game.GetPlayer().RemoveFromFaction(MQ_HunterAllyFaction) ; #DEBUG_LINE_NO:404
  EmissaryShipREF.disable(False) ; #DEBUG_LINE_NO:407
  HunterShipREF.disable(False) ; #DEBUG_LINE_NO:408
  MQ207_PostQuestDialogue.Start() ; #DEBUG_LINE_NO:411
  HunterREF.SetCrimeFaction(MQHunterCrimeFaction) ; #DEBUG_LINE_NO:414
  HunterShipREF.SetCrimeFaction(MQHunterCrimeFaction) ; #DEBUG_LINE_NO:415
  EmissaryREF.SetCrimeFaction(None) ; #DEBUG_LINE_NO:416
  HunterShipREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:418
  HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:419
  EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:420
  (MQ00 as mq00questscript).StartMQ207BFailsafeTimer() ; #DEBUG_LINE_NO:423
EndFunction
