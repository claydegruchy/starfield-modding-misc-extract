ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Commitm_001C7185 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property BQ01_ForeknowledgeBarrettAV Auto Const mandatory
Quest Property COM_Companion_Barrett Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LibertySquare_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_GuestHome_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LawOffice_Ellie Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LizzyBar_Ellie Auto Const mandatory
ReferenceAlias Property Alias_Ellie Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
GlobalVariable Property GlobalTimesMarried Auto Const mandatory
ActorValue Property AVTimesEnteredUnity Auto Const mandatory
ActorValue Property AVTimesMarried Auto Const mandatory
Scene Property COM_Scene_Barrett_Commitment_Vasco_GREET_AskToOfficiate Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Message Property BQ01_BarrettCommitmentMSG Auto Const mandatory
Message Property BQ01_BarretCommitmentQuestOverMSG Auto Const mandatory
ReferenceAlias Property Alias_BarrettCommitmentPosition Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LibertySquare_Barrett Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LawOffice_Barrett01 Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Lodge_Barrett Auto Const mandatory
MiscObject Property CommitmentGift_Barrett_MiscObj Auto Const mandatory
ReferenceAlias Property HarveyGiftName Auto Const mandatory
ReferenceAlias Property Alias_XMarker_LizzyBar_Barrett Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Lodge_Vasco Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_Barrett Auto Const mandatory
sq_crewscript Property SQ_Crew Auto Const mandatory
ActorValue Property CrewReassignDisabled Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(51) || Self.GetStageDone(52) ; #DEBUG_LINE_NO:7
    Self.SetStage(100) ; #DEBUG_LINE_NO:8
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
  GlobalTimesMarried.SetValue((Game.GetPlayer().GetValue(AVTimesMarried) as Int) as Float) ; #DEBUG_LINE_NO:14
  Actor BarrettRef = Alias_Barrett.GetActorReference() ; #DEBUG_LINE_NO:16
  SQ_Companions.SetRoleActive(BarrettRef, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:19
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, BQ01_BarrettCommitmentMSG, COM_CQ_TxtReplace_QuestName_Barrett) ; #DEBUG_LINE_NO:20
  COM_BQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:21
  SQ_Followers.CommandFollow(BarrettRef) ; #DEBUG_LINE_NO:22
  Self.SetStage(87) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0071_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0072_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0073_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0074_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0076_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0079_Item_00()
  Self.SetStage(85) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0081_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0082_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0083_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0084_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0088_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:127
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript ; #DEBUG_LINE_NO:128
  kmyQuest.GiveCommitmentGift() ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0091_Item_00()
  If Self.GetStageDone(52) ; #DEBUG_LINE_NO:147
    Self.SetStage(190) ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0092_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0093_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0094_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:181
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_Lodge_Barrett.GetRef()) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0096_Item_00()
  Self.SetStage(190) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:198
  If Self.GetStageDone(52) ; #DEBUG_LINE_NO:200
    Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:201
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:203
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:221
  Self.SetStage(201) ; #DEBUG_LINE_NO:223
  If Self.GetStageDone(52) ; #DEBUG_LINE_NO:225
    Self.SetStage(300) ; #DEBUG_LINE_NO:226
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(400) ; #DEBUG_LINE_NO:228
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:245
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetStage(520) ; #DEBUG_LINE_NO:261
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:277
  Self.SetStage(60) ; #DEBUG_LINE_NO:278
  Self.SetStage(350) ; #DEBUG_LINE_NO:279
  Self.SetStage(500) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0320_Item_01()
  Alias_Ellie.GetRef().MoveTo(Alias_XMarker_LibertySquare_Ellie.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:288
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LibertySquare_Barrett.GetRef()) ; #DEBUG_LINE_NO:289
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:290
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef() ; #DEBUG_LINE_NO:291
  If BarrettRef.GetDistance(BarrettPosition) > 5.0 ; #DEBUG_LINE_NO:293
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:294
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_02()
  Alias_Ellie.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:303
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LawOffice_Barrett01.GetRef()) ; #DEBUG_LINE_NO:304
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:305
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef() ; #DEBUG_LINE_NO:306
  If BarrettRef.GetDistance(BarrettPosition) > 5.0 ; #DEBUG_LINE_NO:308
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:309
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_03()
  Alias_Ellie.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:318
  Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LizzyBar_Barrett.GetRef()) ; #DEBUG_LINE_NO:319
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:320
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef() ; #DEBUG_LINE_NO:321
  If BarrettRef.GetDistance(BarrettPosition) > 5.0 ; #DEBUG_LINE_NO:323
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:324
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0340_Item_00()
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:333
  ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef() ; #DEBUG_LINE_NO:334
  If BarrettRef.GetDistance(BarrettPosition) > 10.0 ; #DEBUG_LINE_NO:336
    BarrettRef.MoveTo(BarrettPosition, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:337
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Vasco.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0400_Item_01()
  Self.SetStage(500) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0400_Item_02()
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:362
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:370
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:372
  Actor VascoRef = Alias_Vasco.GetActorRef() ; #DEBUG_LINE_NO:373
  Self.SetStage(60) ; #DEBUG_LINE_NO:374
  If Self.GetStageDone(51) ; #DEBUG_LINE_NO:376
    Self.SetStage(510) ; #DEBUG_LINE_NO:377
    If Self.GetStageDone(95) ; #DEBUG_LINE_NO:378
      VascoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:379
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(505) ; #DEBUG_LINE_NO:382
  EndIf ; #DEBUG_LINE_NO:
  SQ_Crew.SetRoleInactive(VascoRef, False, True, False) ; #DEBUG_LINE_NO:385
  CrewGoingToOutposts.RemoveRef(VascoRef as ObjectReference) ; #DEBUG_LINE_NO:386
  DisembarkingCrew.RemoveRef(VascoRef as ObjectReference) ; #DEBUG_LINE_NO:387
  DismissedCrew.RemoveRef(VascoRef as ObjectReference) ; #DEBUG_LINE_NO:388
  VascoRef.SetValue(CrewReassignDisabled, 1.0) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0500_Item_01()
  Actor VascoRef = Alias_Vasco.GetActorRef() ; #DEBUG_LINE_NO:397
  VascoRef.MoveTo(Alias_XMarker_Lodge_Vasco.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:398
  VascoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:399
EndFunction

Function Fragment_Stage_0505_Item_00()
  Alias_Ellie.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:407
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.GetStageDone(90) ; #DEBUG_LINE_NO:415
    SQ_Followers.SetRoleActive(Alias_Vasco.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:416
    SQ_Followers.CommandFollow(Alias_Vasco.GetActorRef()) ; #DEBUG_LINE_NO:417
    Alias_Vasco.TryToEvaluatePackage() ; #DEBUG_LINE_NO:418
  Else ; #DEBUG_LINE_NO:
    Alias_Vasco.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:420
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0535_Item_00()
  Self.SetStage(5000) ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_0557_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:437
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:438
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:439
  Self.SetStage(60) ; #DEBUG_LINE_NO:440
  Self.SetStage(500) ; #DEBUG_LINE_NO:441
EndFunction

Function Fragment_Stage_0558_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:449
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:450
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:451
  Self.SetStage(60) ; #DEBUG_LINE_NO:452
  Self.SetStage(500) ; #DEBUG_LINE_NO:453
EndFunction

Function Fragment_Stage_4000_Item_00()
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None) ; #DEBUG_LINE_NO:464
EndFunction

Function Fragment_Stage_5000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:472
  com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript ; #DEBUG_LINE_NO:473
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:476
  COM_Companion_Barrett.SetStage(1000) ; #DEBUG_LINE_NO:477
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None) ; #DEBUG_LINE_NO:478
  COM_BQ01_WaitToggle.SetValue(0.0) ; #DEBUG_LINE_NO:479
  kmyQuest.MakeCommitted() ; #DEBUG_LINE_NO:480
  Self.Stop() ; #DEBUG_LINE_NO:482
EndFunction

Function Fragment_Stage_6000_Item_00()
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, BQ01_BarretCommitmentQuestOverMSG, None) ; #DEBUG_LINE_NO:491
  COM_Companion_Barrett.SetStage(950) ; #DEBUG_LINE_NO:492
EndFunction

Function Fragment_Stage_9000_Item_00()
  Actor VascoRef = Alias_Vasco.GetActorRef() ; #DEBUG_LINE_NO:500
  If VascoRef.GetValue(CrewReassignDisabled) == 1.0 ; #DEBUG_LINE_NO:501
    VascoRef.SetValue(CrewReassignDisabled, 0.0) ; #DEBUG_LINE_NO:502
  EndIf ; #DEBUG_LINE_NO:
EndFunction
