ScriptName Fragments:Quests:QF_RQ_Settlement_Rescue_01 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_CaptiveTarget Auto Const mandatory
ReferenceAlias Property Alias_Item Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ActorValue Property SQ_CaptiveState Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_0_Unset Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_1_Captive Auto Const mandatory
GlobalVariable Property SQ_CaptiveState_2_Freed Auto Const mandatory
ReferenceAlias Property Alias_MysteryCaptiveMarker Auto Const mandatory
ReferenceAlias Property Alias_Boss Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DestinationMapMarker Auto Const mandatory
LocationAlias Property Alias_destinationLocation Auto Const mandatory
ReferenceAlias Property Alias_BonusContainer Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ActorValue Property isPlayerKiller Auto Const mandatory
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0330_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(255) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Actors.EvaluateAll() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:36
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0075_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:48
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:49
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:53
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:63
  Self.SetStage(5) ; #DEBUG_LINE_NO:67
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:69
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:71
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:72
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:75
  Alias_CaptiveTarget.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 0.0) ; #DEBUG_LINE_NO:78
  Alias_QuestGiver.GetActorRef().SetProtected(True) ; #DEBUG_LINE_NO:79
  Self.SetStage(75) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(75) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Alias_destinationLocation == None ; #DEBUG_LINE_NO:98
    Self.SetStage(475) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(255) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0255_Item_00()
  ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef() ; #DEBUG_LINE_NO:110
  ObjectReference DungeonMarker = Alias_Item.GetRef() ; #DEBUG_LINE_NO:111
  Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef() ; #DEBUG_LINE_NO:112
  If CaptiveMarker ; #DEBUG_LINE_NO:114
    CaptiveNPC.MoveTo(CaptiveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:115
  ElseIf DungeonMarker ; #DEBUG_LINE_NO:
    CaptiveNPC.MoveTo(DungeonMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  CaptiveNPC.Enable(False) ; #DEBUG_LINE_NO:120
  CaptiveNPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:121
  CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0) ; #DEBUG_LINE_NO:124
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:132
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:133
  defaultcaptivealias CaptiveNPC = Alias_CaptiveTarget as defaultcaptivealias ; #DEBUG_LINE_NO:136
  CaptiveNPC.FreePrisoner(True, False) ; #DEBUG_LINE_NO:139
  CaptiveNPC.TryToEvaluatePackage() ; #DEBUG_LINE_NO:142
  Alias_CaptiveTarget.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:143
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:146
  Alias_CaptiveTarget.GetRef().AddKeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:148
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0325_Item_00()
  Alias_BonusContainer.GetRef().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:157
  Self.SetStage(330) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:185
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:186
  kmyQuest.AddPassenger(Alias_CaptiveTarget) ; #DEBUG_LINE_NO:189
  kmyQuest.AddPassengers(Alias_Actors) ; #DEBUG_LINE_NO:190
  ((Self as Quest) as rqscript).SetDialogueAV_Hello_AboardShip() ; #DEBUG_LINE_NO:191
  If !Self.GetStageDone(425) ; #DEBUG_LINE_NO:193
    Self.SetStage(425) ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(405) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0405_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:205
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:206
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:210
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:211
  kmyQuest.SetDialogueAV_SecondaryObjectiveKnown() ; #DEBUG_LINE_NO:213
  Alias_DestinationMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:215
  kmyQuest.AgreeToTransportPassenger() ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:225
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:229
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0425_Item_00()
  Alias_CaptiveTarget.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:239
  Alias_CaptiveTarget.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:248
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:249
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:251
  Alias_QuestGiver.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:253
  If !Self.GetStageDone(850) ; #DEBUG_LINE_NO:255
    Self.SetStage(425) ; #DEBUG_LINE_NO:256
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:265
EndFunction

Function Fragment_Stage_0490_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:273
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:274
  kmyQuest.SetDialogueAV_Hello_DepartingShip() ; #DEBUG_LINE_NO:278
  If Self.GetStageDone(810) ; #DEBUG_LINE_NO:281
    Self.SetObjectiveFailed(500, True) ; #DEBUG_LINE_NO:282
    Self.SetStage(990) ; #DEBUG_LINE_NO:283
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:292
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:293
  kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:297
  If Self.GetStageDone(810) ; #DEBUG_LINE_NO:300
    Self.SetObjectiveFailed(500, True) ; #DEBUG_LINE_NO:301
    Self.SetStage(990) ; #DEBUG_LINE_NO:302
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:304
    Self.SetStage(995) ; #DEBUG_LINE_NO:305
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:314
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:315
  kmyQuest.SetDialogueAV_SecondaryObjectiveFail() ; #DEBUG_LINE_NO:318
  If Self.GetStageDone(75) && !Self.GetStageDone(999) ; #DEBUG_LINE_NO:321
    Self.SetStage(990) ; #DEBUG_LINE_NO:322
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:324
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0810_Item_00()
  If Self.GetStageDone(405) && !Self.GetStageDone(995) ; #DEBUG_LINE_NO:334
    Self.SetStage(990) ; #DEBUG_LINE_NO:335
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:337
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0815_Item_00()
  If !Self.GetStageDone(850) ; #DEBUG_LINE_NO:348
    Self.SetStage(820) ; #DEBUG_LINE_NO:349
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetStage(980) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0850_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:366
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:367
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:370
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:372
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:373
  Self.SetStage(425) ; #DEBUG_LINE_NO:374
EndFunction

Function Fragment_Stage_0850_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:382
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:383
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:386
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:387
  Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:388
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0860_Item_00()
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:397
    Self.SetStage(330) ; #DEBUG_LINE_NO:398
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(325) ; #DEBUG_LINE_NO:400
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(75) && !Self.GetStageDone(999) ; #DEBUG_LINE_NO:409
    Self.SetStage(990) ; #DEBUG_LINE_NO:410
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:412
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  If Self.GetStageDone(100) && !Self.GetStageDone(999) ; #DEBUG_LINE_NO:422
    Self.SetStage(990) ; #DEBUG_LINE_NO:423
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(994) ; #DEBUG_LINE_NO:425
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0980_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:434
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:435
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:438
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:439
  If Self.GetStageDone(825) ; #DEBUG_LINE_NO:441
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:442
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:447
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:455
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:456
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:459
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:460
  kmyQuest.SetDialogueAV_Hello_Stressed_Failure() ; #DEBUG_LINE_NO:461
  Self.SetStage(999) ; #DEBUG_LINE_NO:463
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:471
  rq_rescuescript kmyQuest = __temp as rq_rescuescript ; #DEBUG_LINE_NO:472
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:475
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:476
  If Self.GetStageDone(825) ; #DEBUG_LINE_NO:478
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:479
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:481
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:484
EndFunction

Function Fragment_Stage_0999_Item_00()
  If !Self.GetStageDone(425) ; #DEBUG_LINE_NO:492
    Self.SetStage(425) ; #DEBUG_LINE_NO:493
  EndIf ; #DEBUG_LINE_NO:
EndFunction
