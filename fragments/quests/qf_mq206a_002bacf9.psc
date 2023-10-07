ScriptName Fragments:Quests:QF_MQ206A_002BACF9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestMQ206AMSG Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
Scene Property MQ206A_002_TransitionFuneral Auto Const mandatory
ReferenceAlias Property Alias_Casket Auto Const mandatory
ReferenceAlias Property Alias_JacobCoe Auto Const mandatory
ReferenceAlias Property Alias_AjaMamasa Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Quest Property DialogueUCTheLodge Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
ObjectReference Property LodgeStartMarker Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_Podium Auto Const mandatory
Scene Property MQ206A_006_PodiumDone Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property MQ206A_PlayerContemplatesMarker Auto Const mandatory
Scene Property MQ206A_004_Casket Auto Const mandatory
ReferenceAlias Property Alias_SetStage35Trigger Auto Const mandatory
Scene Property MQ206A_007a_SarahSpeech Auto Const mandatory
Scene Property MQ206A_007b_BarrettSpeech Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
ReferenceAlias Property Alias_LodgeBed Auto Const mandatory
Scene Property MQ206A_002b_PlayerSkip Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
Scene Property MQ206A_007b_MatteoSpeech Auto Const mandatory
Quest Property MQ204xPostQuest Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ReferenceAlias Property Alias_LilianHart Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
ObjectReference Property MQ204EyeAttackEnableMarker Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
ReferenceAlias Property Alias_Sona Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
Keyword Property AnimFaceArchetypeDepressed Auto Const mandatory
LeveledItem Property LL_Drink_Alcohol_Expensive Auto Const mandatory
ReferenceAlias Property Alias_PodiumFurniture Auto Const mandatory
ReferenceAlias Property Alias_PictureAndreja Auto Const mandatory
ReferenceAlias Property Alias_PictureBarrett Auto Const mandatory
ReferenceAlias Property Alias_PictureSamCoe Auto Const mandatory
ReferenceAlias Property Alias_PictureSarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_MemorialEaselTrigger Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
ReferenceAlias Property Alias_Vasco Auto Const mandatory
Quest Property COM_Quest_Andreja_Commitment Auto Const mandatory
Quest Property COM_Quest_Andreja_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:9
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:10
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:11
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:12
  MQ102.Stop() ; #DEBUG_LINE_NO:13
  MQ204.SetStage(620) ; #DEBUG_LINE_NO:14
  MQ204.SetStage(1000) ; #DEBUG_LINE_NO:15
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:17
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:18
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:19
    Alias_SarahMorgan.getActorRef().disable(False) ; #DEBUG_LINE_NO:20
    COM_Quest_SarahMorgan_Q01.SetStage(1000) ; #DEBUG_LINE_NO:21
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:22
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:23
    Alias_SamCoe.getActorRef().disable(False) ; #DEBUG_LINE_NO:24
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:25
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:26
    Alias_Andreja.getActorRef().disable(False) ; #DEBUG_LINE_NO:27
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:28
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:29
    Alias_Barrett.getActorRef().disable(False) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  DialogueUCTheLodge.SetStage(10) ; #DEBUG_LINE_NO:35
  DialogueUCTheLodge.SetStage(20) ; #DEBUG_LINE_NO:36
  Self.SetStage(10) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:47
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:49
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:50
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:51
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:52
  MQ102.Stop() ; #DEBUG_LINE_NO:53
  MQ204.SetStage(620) ; #DEBUG_LINE_NO:54
  MQ204.SetStage(1000) ; #DEBUG_LINE_NO:55
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:57
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:58
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:59
    Alias_SarahMorgan.getActorRef().disable(False) ; #DEBUG_LINE_NO:60
    COM_Quest_SarahMorgan_Q01.SetStage(1000) ; #DEBUG_LINE_NO:61
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:62
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:63
    Alias_SamCoe.getActorRef().disable(False) ; #DEBUG_LINE_NO:64
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:65
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:66
    Alias_Andreja.getActorRef().disable(False) ; #DEBUG_LINE_NO:67
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:68
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef() as ObjectReference) ; #DEBUG_LINE_NO:69
    Alias_Barrett.getActorRef().disable(False) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:73
  DialogueUCTheLodge.SetStage(10) ; #DEBUG_LINE_NO:75
  DialogueUCTheLodge.SetStage(20) ; #DEBUG_LINE_NO:76
  Self.SetStage(10) ; #DEBUG_LINE_NO:79
  Self.SetStage(15) ; #DEBUG_LINE_NO:80
  Self.SetStage(20) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Noel.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_Noel.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:107
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:108
  kmyQuest.SetMemorialWaitGameDay() ; #DEBUG_LINE_NO:111
  Alias_LodgeBed.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:114
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0017_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:124
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:125
  MQ206A_002b_PlayerSkip.Start() ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0018_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:136
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:137
  kmyQuest.UpdateGameTimeOnSkip() ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:148
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:149
  kmyQuest.CallMemorialTimer() ; #DEBUG_LINE_NO:153
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:155
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:156
  Self.SetObjectiveDisplayedAtTop(20) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0020_Item_01()
  Self.SetStage(30) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:174
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:175
  Alias_SetStage35Trigger.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:178
  Actor AndrejaREF = Alias_Andreja.getActorRef() ; #DEBUG_LINE_NO:180
  Actor BarrettREF = Alias_Barrett.getActorRef() ; #DEBUG_LINE_NO:181
  Actor SamCoeREF = Alias_SamCoe.getActorRef() ; #DEBUG_LINE_NO:182
  Actor SarahMorganREF = Alias_SarahMorgan.getActorRef() ; #DEBUG_LINE_NO:183
  Actor CoraCoeREF = Alias_CoraCoe.getActorRef() ; #DEBUG_LINE_NO:184
  Actor MatteoKhatriREF = Alias_MatteoKhatri.getActorRef() ; #DEBUG_LINE_NO:185
  Actor NoelREF = Alias_Noel.getActorRef() ; #DEBUG_LINE_NO:186
  Actor WalterREF = Alias_WalterStroud.getActorRef() ; #DEBUG_LINE_NO:187
  Actor VladimirREF = Alias_VladimirSall.getActorRef() ; #DEBUG_LINE_NO:188
  Actor VascoREF = Alias_Vasco.getActorRef() ; #DEBUG_LINE_NO:189
  Actor CompanionREF = Alias_Companion.getActorRef() ; #DEBUG_LINE_NO:192
  (SQ_Companions as sq_companionsscript).SetRoleInActive(CompanionREF, True, False, True) ; #DEBUG_LINE_NO:193
  DismissedCrew.RemoveRef(CompanionREF as ObjectReference) ; #DEBUG_LINE_NO:194
  DisembarkingCrew.RemoveRef(CompanionREF as ObjectReference) ; #DEBUG_LINE_NO:195
  MQ204LodgeAttackClutterEnableMarker.disable(False) ; #DEBUG_LINE_NO:198
  Alias_LodgeBed.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:201
  Alias_Casket.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:204
  ObjectReference PodiumREF = Alias_Podium.GetRef() ; #DEBUG_LINE_NO:205
  PodiumREF.Enable(False) ; #DEBUG_LINE_NO:206
  PodiumREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:207
  Alias_PodiumFurniture.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:209
  kmyQuest.SetMemorialTalksTotal() ; #DEBUG_LINE_NO:212
  AndrejaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:215
  AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:216
  BarrettREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:217
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:218
  SamCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:219
  SamCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:220
  SarahMorganREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:221
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:222
  CoraCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:223
  CoraCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:224
  MatteoKhatriREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:225
  MatteoKhatriREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:226
  NoelREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:227
  NoelREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:228
  WalterREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:229
  WalterREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:230
  VladimirREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:231
  VladimirREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:232
  Actor DeadCompanionREF = MQ00_CompanionWhoDies.getActorRef() ; #DEBUG_LINE_NO:235
  If DeadCompanionREF == SamCoeREF ; #DEBUG_LINE_NO:236
    Actor JacobCoeREF = Alias_JacobCoe.getActorRef() ; #DEBUG_LINE_NO:237
    Actor LilianREF = Alias_LilianHart.getActorRef() ; #DEBUG_LINE_NO:238
    JacobCoeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:239
    JacobCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:240
    JacobCoeREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:241
    LilianREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:242
    LilianREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:243
    LilianREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:244
    LilianREF.EnableNoWait(False) ; #DEBUG_LINE_NO:245
    Alias_PictureSamCoe.GetRef().Enable(False) ; #DEBUG_LINE_NO:246
  ElseIf DeadCompanionREF == SarahMorganREF ; #DEBUG_LINE_NO:247
    Actor AjaREF = Alias_AjaMamasa.getActorRef() ; #DEBUG_LINE_NO:248
    Actor SonaREF = Alias_Sona.getActorRef() ; #DEBUG_LINE_NO:249
    AjaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:250
    AjaREF.disable(False) ; #DEBUG_LINE_NO:251
    AjaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:252
    AjaREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:253
    AjaREF.Enable(False) ; #DEBUG_LINE_NO:254
    If COM_Quest_SarahMorgan_Q01.GetStageDone(1000) ; #DEBUG_LINE_NO:255
      SonaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:256
      SonaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:257
      SonaREF.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:258
    EndIf ; #DEBUG_LINE_NO:
    Alias_PictureSarahMorgan.GetRef().Enable(False) ; #DEBUG_LINE_NO:260
  ElseIf DeadCompanionREF == BarrettREF ; #DEBUG_LINE_NO:261
    Actor ajaref = Alias_AjaMamasa.getActorRef() ; #DEBUG_LINE_NO:262
    ajaref.ChangeAnimFaceArchetype(AnimFaceArchetypeDepressed) ; #DEBUG_LINE_NO:263
    ajaref.disable(False) ; #DEBUG_LINE_NO:264
    ajaref.EvaluatePackage(False) ; #DEBUG_LINE_NO:265
    ajaref.MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:266
    ajaref.Enable(False) ; #DEBUG_LINE_NO:267
    Alias_PictureBarrett.GetRef().Enable(False) ; #DEBUG_LINE_NO:268
  ElseIf DeadCompanionREF == AndrejaREF ; #DEBUG_LINE_NO:269
    Alias_PictureAndreja.GetRef().Enable(False) ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:274
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:275
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:276
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:277
  DismissedCrew.RemoveRef(VascoREF as ObjectReference) ; #DEBUG_LINE_NO:278
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:279
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:280
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:281
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:282
  DisembarkingCrew.RemoveRef(VascoREF as ObjectReference) ; #DEBUG_LINE_NO:283
  MQ206A_002_TransitionFuneral.Start() ; #DEBUG_LINE_NO:286
EndFunction

Function Fragment_Stage_0035_Item_00()
  MQ206A_007a_SarahSpeech.Start() ; #DEBUG_LINE_NO:294
EndFunction

Function Fragment_Stage_0035_Item_01()
  MQ206A_007b_MatteoSpeech.Start() ; #DEBUG_LINE_NO:302
EndFunction

Function Fragment_Stage_0035_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:310
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:311
  MQ206A_002_TransitionFuneral.Stop() ; #DEBUG_LINE_NO:314
  kmyQuest.CancelMemorialTimer() ; #DEBUG_LINE_NO:317
  Self.SetObjectiveDisplayed(25, False, False) ; #DEBUG_LINE_NO:319
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:327
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:328
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:331
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:339
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:340
  Alias_Noel.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:343
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:353
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:354
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:357
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().additem(LL_Drink_Alcohol_Expensive as Form, 1, False) ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:373
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:374
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:377
EndFunction

Function Fragment_Stage_0080_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:385
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:386
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:398
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:399
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:402
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:410
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:411
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:414
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:422
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:423
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:426
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:434
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:435
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:438
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:446
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:447
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:450
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:458
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:459
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:462
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:470
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:471
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:474
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:482
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:483
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:486
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:494
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:495
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:498
  COM_Quest_SarahMorgan_Q01_Post.SetStage(20) ; #DEBUG_LINE_NO:501
EndFunction

Function Fragment_Stage_0200_Item_00()
  MQ206A_006_PodiumDone.Start() ; #DEBUG_LINE_NO:509
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:511
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:512
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:513
  Self.SetObjectiveDisplayedAtTop(50) ; #DEBUG_LINE_NO:514
  ObjectReference PodiumREF = Alias_Podium.GetRef() ; #DEBUG_LINE_NO:516
  PodiumREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:517
  Alias_MemorialEaselTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:519
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:527
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:528
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:529
  Alias_SarahMorgan.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:531
  ObjectReference PodiumREF = Alias_Podium.GetRef() ; #DEBUG_LINE_NO:533
  PodiumREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:534
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_MatteoKhatri.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:542
EndFunction

Function Fragment_Stage_0220_Item_01()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:550
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:551
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:552
  ObjectReference PodiumREF = Alias_Podium.GetRef() ; #DEBUG_LINE_NO:554
  PodiumREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:555
EndFunction

Function Fragment_Stage_0230_Item_00()
  Alias_Barrett.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:563
  Self.SetStage(250) ; #DEBUG_LINE_NO:565
EndFunction

Function Fragment_Stage_0240_Item_00()
  Alias_WalterStroud.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:573
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_MatteoKhatri.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:582
  Alias_Andreja.getActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:583
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:591
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:592
  kmyQuest.CheckMemorialTalks() ; #DEBUG_LINE_NO:595
  Alias_MemorialEaselTrigger.GetRef().disable(False) ; #DEBUG_LINE_NO:597
EndFunction

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:605
  mq206ascript kmyQuest = __temp as mq206ascript ; #DEBUG_LINE_NO:606
  MQ206A_004_Casket.Stop() ; #DEBUG_LINE_NO:609
  kmyQuest.MQ206AEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:610
  kmyQuest.MQ206AEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:611
  Game.ForceThirdPerson() ; #DEBUG_LINE_NO:612
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:613
  Game.ForceFirstPerson() ; #DEBUG_LINE_NO:614
  kmyQuest.MQ206AEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:615
  kmyQuest.MQ206AEnableLayer = None ; #DEBUG_LINE_NO:616
  Self.SetStage(300) ; #DEBUG_LINE_NO:617
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:625
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:633
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:641
  Self.Stop() ; #DEBUG_LINE_NO:642
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Casket.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:651
  Alias_Podium.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:652
  Alias_PodiumFurniture.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:653
  Alias_PictureAndreja.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:654
  Alias_PictureBarrett.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:655
  Alias_PictureSamCoe.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:656
  Alias_PictureSarahMorgan.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:657
  Alias_MemorialEaselTrigger.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:658
  MQ204EyeAttackEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:661
  Actor AndrejaREF = Alias_Andreja.getActorRef() ; #DEBUG_LINE_NO:664
  Actor BarrettREF = Alias_Barrett.getActorRef() ; #DEBUG_LINE_NO:665
  Actor SamCoeREF = Alias_SamCoe.getActorRef() ; #DEBUG_LINE_NO:666
  Actor SarahMorganREF = Alias_SarahMorgan.getActorRef() ; #DEBUG_LINE_NO:667
  Actor CoraCoeREF = Alias_CoraCoe.getActorRef() ; #DEBUG_LINE_NO:668
  Actor MatteoKhatriREF = Alias_MatteoKhatri.getActorRef() ; #DEBUG_LINE_NO:669
  Actor NoelREF = Alias_Noel.getActorRef() ; #DEBUG_LINE_NO:670
  Actor WalterREF = Alias_WalterStroud.getActorRef() ; #DEBUG_LINE_NO:671
  Actor VladimirREF = Alias_VladimirSall.getActorRef() ; #DEBUG_LINE_NO:672
  AndrejaREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:674
  BarrettREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:675
  SamCoeREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:676
  SarahMorganREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:677
  CoraCoeREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:678
  MatteoKhatriREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:679
  NoelREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:680
  WalterREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:681
  VladimirREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:682
  Actor DeadCompanionREF = MQ00_CompanionWhoDies.getActorRef() ; #DEBUG_LINE_NO:685
  If DeadCompanionREF == SamCoeREF ; #DEBUG_LINE_NO:686
    Actor JacobCoeREF = Alias_JacobCoe.getActorRef() ; #DEBUG_LINE_NO:687
    Actor LilianREF = Alias_LilianHart.getActorRef() ; #DEBUG_LINE_NO:688
    JacobCoeREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:689
    LilianREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:690
    JacobCoeREF.DisableNoWait(False) ; #DEBUG_LINE_NO:691
    LilianREF.DisableNoWait(False) ; #DEBUG_LINE_NO:692
    CoraCoeREF.DisableNoWait(False) ; #DEBUG_LINE_NO:693
  ElseIf DeadCompanionREF == SarahMorganREF ; #DEBUG_LINE_NO:694
    Actor AjaREF = Alias_AjaMamasa.getActorRef() ; #DEBUG_LINE_NO:695
    Actor SonaREF = Alias_Sona.getActorRef() ; #DEBUG_LINE_NO:696
    AjaREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:697
    AjaREF.MovetoMyEditorLocation() ; #DEBUG_LINE_NO:698
    If COM_Quest_SarahMorgan_Q01.GetStageDone(1000) ; #DEBUG_LINE_NO:699
      SonaREF.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:700
      SonaREF.disable(False) ; #DEBUG_LINE_NO:701
    EndIf ; #DEBUG_LINE_NO:
  ElseIf DeadCompanionREF == BarrettREF ; #DEBUG_LINE_NO:703
    Actor ajaref = Alias_AjaMamasa.getActorRef() ; #DEBUG_LINE_NO:704
    ajaref.ChangeAnimFaceArchetype(None) ; #DEBUG_LINE_NO:705
    ajaref.MovetoMyEditorLocation() ; #DEBUG_LINE_NO:706
  EndIf ; #DEBUG_LINE_NO:
  If COM_Quest_Andreja_Commitment.IsRunning() || COM_Quest_Andreja_Q01.IsRunning() ; #DEBUG_LINE_NO:710
    (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:711
    AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:712
  ElseIf COM_Quest_Barrett_Commitment.IsRunning() || COM_Quest_Barrett_Q01.IsRunning() || COM_Quest_Barrett_Q02.IsRunning() ; #DEBUG_LINE_NO:713
    (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:714
    BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:715
  ElseIf COM_Quest_SamCoe_Commitment.IsRunning() || COM_Quest_SamCoe_Q01.IsRunning() ; #DEBUG_LINE_NO:716
    (SQ_Companions as sq_companionsscript).SetRoleActive(SamCoeREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:717
    SamCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:718
  ElseIf COM_Quest_SarahMorgan_Commitment.IsRunning() || COM_Quest_SarahMorgan_Q01.IsRunning() ; #DEBUG_LINE_NO:719
    (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:720
    SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:721
  EndIf ; #DEBUG_LINE_NO:
EndFunction
