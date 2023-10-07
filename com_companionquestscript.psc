ScriptName COM_CompanionQuestScript Extends Quest
{ Script attached to COM_Companion_<CompanionName> quest }

;-- Structs -----------------------------------------
Struct StoryGateDatum
  Int GateNumber
  GlobalVariable TimerDuration
  { in seconds, how long does the companion need to be following player to unlock the gate?
filter for: COM_StoryGate_TimerDuration }
EndStruct


;-- Variables ---------------------------------------
companionactorscript CompanionRef
Int GameTimerID_AngerCoolDown = 2
Bool StartedStoryGateTimerOnce
Int TimerID_StoryGate = 1
Int iAngerTimerNotRunning = 0
Int iAngerTimerRunning = 1

;-- Properties --------------------------------------
Group autofill
  sq_followersscript Property SQ_Followers Auto Const mandatory
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
  ActorValue Property COM_CurrentStoryGateTimerExpired Auto Const mandatory
  ActorValue Property COM_PersonalQuest_Started Auto Const mandatory
  ActorValue Property COM_PersonalQuest_Finished Auto Const mandatory
  ActorValue Property COM_CommitmentQuest_Started Auto Const mandatory
  ActorValue Property COM_AngerCoolDownTimerExpired Auto Const mandatory
  { 0 = not expired (timer currently running)
1 = expired (timer not currently running) }
  ActorValue Property COM_AngerSceneCompleted Auto Const mandatory
  { 0 = not completed yet
1 = completed }
  ActorValue Property COM_AngerSecondChances Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
  GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
  ActorValue Property COM_IsRomantic Auto Const mandatory
  ActorValue Property COM_HasBeenRomantic Auto Const mandatory
  ActorValue Property COM_CommitmentPossible Auto Const mandatory
  ActorValue Property COM_CommitmentDesired Auto Const mandatory
  ActorValue Property COM_IsCommitted Auto Const mandatory
  ActorValue Property COM_CommitmentRefusedPermanently Auto Const mandatory
  ActorBase Property Companion_Andreja Auto Const mandatory
  affinityevent Property COM_Event_PlayerBecomesRomantic_AndrejaJealous Auto Const mandatory
EndGroup

Group Aliases
  ReferenceAlias Property Alias_Companion Auto Const mandatory
  { The companion who this COM_Companion quest belongs to }
  ReferenceAlias Property Alias_PlayerShipCrewMarker Auto Const mandatory
  LocationAlias Property Alias_PlayerShipInteriorLocation Auto Const mandatory
EndGroup

Group StoryGates
  com_companionquestscript:storygatedatum[] Property StoryGateData Auto Const mandatory
  ActorValue Property COM_StarbornSaveActorValue_MaxStoryGate Auto Const mandatory
  { The av used to store the maximum story gate reach in any play through
	IMPORTANT: this also needs to be in the formlist: StarbornSaveActorValues
	filter for: COM_StarbornSaveActorValue_MaxStoryGate_* }
EndGroup

Group Quests
  Quest Property PersonalQuest Auto Const mandatory
  { The quest that takes player from friendship to affection }
  Quest Property CommitmentQuest Auto Const mandatory
  { The quest that implements the "commitment ceremony" }
EndGroup

Group AdditionalData
  Perk Property CompanionCheckPerk Auto Const mandatory
  { The perk used to pick companion speak for player lines in dialogue
filter for: CompanionCheck }
EndGroup

Group WantsToTalk
  Scene Property WantsToTalkAnnouncementScene Auto Const mandatory
  { where the companion blurts out they want to talk - this is likely just a one line scene
NOTE: conditions on the scene dialogue should cover cool downs, etc. as various things will trigger this scene to start }
  conditionform Property WantsToTalkConditionForm Auto Const mandatory
  { condition form that will be test against to turn on "wants to talk" functionality, will need to be true in all cases, such as affinity gates, anger, important quest response scenes, etc.
Filter for: COM_CND_WantsToTalk_* }
  Int Property WantsToTalkObjective = 10 Auto Const
EndGroup

Group Anger
  GlobalVariable[] Property PrioritizedAngerReasons Auto Const mandatory
  { Lower indexes = higher priority.
Filter for: COM_AngerReason_*
New anger reasons are ignored if current anger reason is in this list, and has lower index than the new reason.
This should normally only include things like murder that wouldn't be superceded by other, even more recent reasons to be angry.
There might only be one thing in this list (ex: murder). }
EndGroup

Group Flirting
  GlobalVariable Property COM_FlirtCooldownDays Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtCount Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtCooldownExpiry Auto Const mandatory
  { autofill }
  ActorValue Property COM_FlirtChoice Auto Const mandatory
  { autofill; 0 to FlirtChoiceMax - used to conditionalize scene phases of variations of flirt dialogue choices for the player }
  Int Property FlirtChoiceMax = 2 Auto Const
  { COM_FlirtChoice will be 0 to FlirtChoiceMax - represents which sets choices player will get each flirt scene play through
Example: three sets of flirt phases, set FlirtChoiceMax to 2 }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  CompanionRef = Alias_Companion.GetActorRef() as companionactorscript ; #DEBUG_LINE_NO:139
  Self.RegisterForRemoteEvent(CompanionRef as ScriptObject, "OnAffinityEvent") ; #DEBUG_LINE_NO:141
  Self.RegisterForRemoteEvent(CompanionRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:142
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:143
  Self.RegisterForCustomEvent(SQ_Companions as ScriptObject, "sq_companionsscript_ActiveCompanionChanged") ; #DEBUG_LINE_NO:144
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_StoryGate ; #DEBUG_LINE_NO:151
    CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 1.0) ; #DEBUG_LINE_NO:153
    Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == GameTimerID_AngerCoolDown ; #DEBUG_LINE_NO:160
    CompanionRef.setValue(COM_AngerCoolDownTimerExpired, 1.0) ; #DEBUG_LINE_NO:164
    Self.CheckAngerAndSetNotAngry() ; #DEBUG_LINE_NO:165
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_CompanionsScript.ActiveCompanionChanged(sq_companionsscript akSender, Var[] akArgs)
  If CompanionRef as Actor == SQ_Companions.GetActiveCompanionChangedArgsStruct(akArgs).NewActiveCompanion ; #DEBUG_LINE_NO:172
    Self.PickedUpAsCompanion() ; #DEBUG_LINE_NO:173
  Else ; #DEBUG_LINE_NO:
    Self.DismissedAsCompanion() ; #DEBUG_LINE_NO:175
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnAffinityEvent(Actor akSender, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:183
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == CompanionRef as Actor ; #DEBUG_LINE_NO:189
    Self.CheckAndSetWantsToTalk(False) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckAngerAndSetNotAngry()
  Bool angerSceneCompelted = CompanionRef.GetValue(COM_AngerSceneCompleted) == 1.0 ; #DEBUG_LINE_NO:197
  Bool angerCoolDownExpired = CompanionRef.GetValue(COM_AngerCoolDownTimerExpired) == 1.0 ; #DEBUG_LINE_NO:198
  GlobalVariable angerLevelGlobal = SQ_Companions.GetAngerLevel(CompanionRef as Actor) ; #DEBUG_LINE_NO:199
  If angerSceneCompelted && angerCoolDownExpired && angerLevelGlobal == SQ_Companions.COM_AngerLevel_2_Angry ; #DEBUG_LINE_NO:204
    Self.MakeNotAngry() ; #DEBUG_LINE_NO:206
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PickupSceneEnded()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:212
  If SQ_Companions.IsCompanionLockedIn(None) == False ; #DEBUG_LINE_NO:214
    SQ_Companions.SetRoleActive(CompanionRef as Actor, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:215
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DismissSceneEnded()
  If SQ_Companions.IsCompanionLockedIn(CompanionRef) == False ; #DEBUG_LINE_NO:222
    SQ_Companions.SetRoleInactive(CompanionRef as Actor, True, False, True) ; #DEBUG_LINE_NO:223
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function WaitSceneEnded()
  SQ_Followers.CommandWait(CompanionRef as Actor, None) ; #DEBUG_LINE_NO:229
EndFunction

Function FollowSceneEnded()
  SQ_Followers.CommandFollow(CompanionRef as Actor) ; #DEBUG_LINE_NO:234
EndFunction

Function TalkAboutQuestEventSceneEnded(ActorValue AssociatedActorValue)
  CompanionRef.setValue(AssociatedActorValue, 0.0) ; #DEBUG_LINE_NO:240
  Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:242
EndFunction

Function GiveItemSceneEnded()
  (Alias_Companion.GetReference() as com_crew_giveitemactorscript).GiveItems() ; #DEBUG_LINE_NO:246
EndFunction

Function FlirtSceneEnded()
  Float flirtExpiryDay = Utility.ExpiryDay(COM_FlirtCooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:252
  CompanionRef.setValue(COM_FlirtCooldownExpiry, flirtExpiryDay) ; #DEBUG_LINE_NO:254
  Float newFlirtCount = CompanionRef.GetValue(COM_FlirtCount) + 1.0 ; #DEBUG_LINE_NO:257
  CompanionRef.setValue(COM_FlirtCount, newFlirtCount) ; #DEBUG_LINE_NO:259
  Int nextFlirtChoice = CompanionRef.IncrementLoopingValue(COM_FlirtChoice, FlirtChoiceMax, 1) ; #DEBUG_LINE_NO:262
EndFunction

Function PickedUpAsCompanion()
  Game.GetPlayer().AddPerk(CompanionCheckPerk, False) ; #DEBUG_LINE_NO:271
  If StartedStoryGateTimerOnce == False ; #DEBUG_LINE_NO:274
    StartedStoryGateTimerOnce = True ; #DEBUG_LINE_NO:276
    Self.StoryGateSceneCompleted(False) ; #DEBUG_LINE_NO:277
  Else ; #DEBUG_LINE_NO:
    Self.PauseTimer(TimerID_StoryGate, False) ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DismissedAsCompanion()
  Game.GetPlayer().RemovePerk(CompanionCheckPerk) ; #DEBUG_LINE_NO:287
  Self.PauseTimer(TimerID_StoryGate, True) ; #DEBUG_LINE_NO:290
EndFunction

Bool Function OnPlayerShip(Actor ActorToCheck, Location LocationToCheck)
  Return ActorToCheck.GetCurrentLocation() == Alias_PlayerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:296
EndFunction

Function CheckAndSetWantsToTalk(Bool SayDialogue)
  Bool WantsToTalk = WantsToTalkConditionForm.IsTrue(CompanionRef as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:302
  If WantsToTalk ; #DEBUG_LINE_NO:305
    If SayDialogue ; #DEBUG_LINE_NO:307
      WantsToTalkAnnouncementScene.Start() ; #DEBUG_LINE_NO:309
    EndIf ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(WantsToTalkObjective, False) ; #DEBUG_LINE_NO:313
    Self.SetObjectiveDisplayed(WantsToTalkObjective, True, False) ; #DEBUG_LINE_NO:314
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(WantsToTalkObjective, True) ; #DEBUG_LINE_NO:318
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StoryGateSceneCompleted(Bool IncrementAV)
  Float currentAV = CompanionRef.GetValue(COM_StoryGatesCompleted) ; #DEBUG_LINE_NO:330
  Float newAV = currentAV ; #DEBUG_LINE_NO:331
  If IncrementAV ; #DEBUG_LINE_NO:333
    newAV += 1.0 ; #DEBUG_LINE_NO:334
  EndIf ; #DEBUG_LINE_NO:
  CompanionRef.setValue(COM_StoryGatesCompleted, newAV) ; #DEBUG_LINE_NO:339
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:342
  Float maxStoryGate = Math.Max(newAV, PlayerRef.GetValue(COM_StarbornSaveActorValue_MaxStoryGate)) ; #DEBUG_LINE_NO:343
  PlayerRef.setValue(COM_StarbornSaveActorValue_MaxStoryGate, maxStoryGate) ; #DEBUG_LINE_NO:344
  Int nextGateNumber = (newAV + 1.0) as Int ; #DEBUG_LINE_NO:347
  Self.StartStoryGateTimer(nextGateNumber) ; #DEBUG_LINE_NO:348
  Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:351
EndFunction

Function StartStoryGateTimer(Int nextGateNumber)
  com_companionquestscript:storygatedatum nextStoryGateDatum = Self.GetStoryGateDatum(nextGateNumber) ; #DEBUG_LINE_NO:355
  If nextStoryGateDatum ; #DEBUG_LINE_NO:358
    CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 0.0) ; #DEBUG_LINE_NO:361
    Float nextGateTimerDuration = nextStoryGateDatum.TimerDuration.GetValue() ; #DEBUG_LINE_NO:363
    Self.StartTimer(nextGateTimerDuration, TimerID_StoryGate) ; #DEBUG_LINE_NO:365
  EndIf ; #DEBUG_LINE_NO:
EndFunction

com_companionquestscript:storygatedatum Function GetStoryGateDatum(Int GateNumber)
  Int iFound = StoryGateData.findstruct("GateNumber", GateNumber, 0) ; #DEBUG_LINE_NO:372
  com_companionquestscript:storygatedatum foundStoryGateDatum = None ; #DEBUG_LINE_NO:373
  If iFound > -1 ; #DEBUG_LINE_NO:374
    foundStoryGateDatum = StoryGateData[iFound] ; #DEBUG_LINE_NO:375
  EndIf ; #DEBUG_LINE_NO:
  Return foundStoryGateDatum ; #DEBUG_LINE_NO:380
EndFunction

Function SetAngerLevel(GlobalVariable AngerLevelToSet, GlobalVariable AngerReason)
  SQ_Companions.SetAngerLevel(CompanionRef, AngerLevelToSet, AngerReason) ; #DEBUG_LINE_NO:388
  Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:391
EndFunction

Function MakeNotAngry()
  Self.SetAngerLevel(SQ_Companions.COM_AngerLevel_0_NotAngry, SQ_Companions.COM_AngerReason_Common_0_NotAngry) ; #DEBUG_LINE_NO:396
EndFunction

Function StartAngerCoolDownTimer()
  Float coolDownTimerDur = SQ_Companions.GetAngerCoolDownTimerDuration(CompanionRef as Actor) ; #DEBUG_LINE_NO:402
  If coolDownTimerDur > -1.0 ; #DEBUG_LINE_NO:404
    Self.StartTimerGameTime(coolDownTimerDur, GameTimerID_AngerCoolDown) ; #DEBUG_LINE_NO:406
    CompanionRef.setValue(COM_AngerCoolDownTimerExpired, 0.0) ; #DEBUG_LINE_NO:409
  Else ; #DEBUG_LINE_NO:
    Self.CancelTimerGameTime(GameTimerID_AngerCoolDown) ; #DEBUG_LINE_NO:412
  EndIf ; #DEBUG_LINE_NO:
  Self.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:416
EndFunction

Function ExpireAngerCoolDownTimer()
  Self.CancelTimerGameTime(GameTimerID_AngerCoolDown) ; #DEBUG_LINE_NO:421
  Self.OnTimerGameTime(GameTimerID_AngerCoolDown) ; #DEBUG_LINE_NO:422
EndFunction

Function SetAffinityLevel(GlobalVariable AffinityLevel)
  SQ_Companions.SetAffinityLevel(CompanionRef as Actor, AffinityLevel) ; #DEBUG_LINE_NO:429
EndFunction

Function StartPersonalQuest()
  Self.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:434
  Self.SetAffinityLevel(COM_AffinityLevel_1_Friendship) ; #DEBUG_LINE_NO:435
  PersonalQuest.Start() ; #DEBUG_LINE_NO:436
  CompanionRef.setValue(COM_PersonalQuest_Started, 1.0) ; #DEBUG_LINE_NO:437
  Activator QuestName = CompanionRef.COM_PQ_TxtReplace_QuestName ; #DEBUG_LINE_NO:438
  ObjectReference QuestNameRef = CompanionRef.PlaceAtMe(QuestName as Form, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:439
  SQ_Companions.ShowTextReplacedMessage(CompanionRef as Actor, SQ_Companions.COM_PQ_AdvancingQuestWarning, True, QuestNameRef, 0.0, 0.0) ; #DEBUG_LINE_NO:440
EndFunction

Function FinishedPersonalQuest()
  Self.SetAffinityLevel(COM_AffinityLevel_2_Affection) ; #DEBUG_LINE_NO:445
  CompanionRef.setValue(COM_PersonalQuest_Finished, 1.0) ; #DEBUG_LINE_NO:446
EndFunction

Function PersonalQuestReminder()
  SQ_Companions.PersonalQuestReminder() ; #DEBUG_LINE_NO:453
EndFunction

Function StartCommitmentQuest()
  Self.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:458
  CompanionRef.setValue(COM_CommitmentQuest_Started, 1.0) ; #DEBUG_LINE_NO:459
  CommitmentQuest.Start() ; #DEBUG_LINE_NO:460
EndFunction

Function RomanceSceneEndedRomantic()
  CompanionRef.setValue(COM_HasBeenRomantic, 1.0) ; #DEBUG_LINE_NO:466
  Self.PossiblyMakeAndrejaJealous() ; #DEBUG_LINE_NO:467
EndFunction

Function MakeRomantic()
  CompanionRef.setValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:472
  If CompanionRef.GetValue(COM_HasBeenRomantic) < 1.0 ; #DEBUG_LINE_NO:474
    CompanionRef.setValue(COM_HasBeenRomantic, 1.0) ; #DEBUG_LINE_NO:475
  EndIf ; #DEBUG_LINE_NO:
  Self.PossiblyMakeAndrejaJealous() ; #DEBUG_LINE_NO:478
EndFunction

Function PossiblyMakeAndrejaJealous()
  Actor romanticCompanion = Alias_Companion.GetActorRef() ; #DEBUG_LINE_NO:482
  companionactorscript andrejaRef = Companion_Andreja.GetUniqueActor() as companionactorscript ; #DEBUG_LINE_NO:483
  If (romanticCompanion != andrejaRef as Actor) && andrejaRef.IsRomantic() ; #DEBUG_LINE_NO:484
    COM_Event_PlayerBecomesRomantic_AndrejaJealous.Send(romanticCompanion as ObjectReference) ; #DEBUG_LINE_NO:487
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MakeNotRomantic()
  CompanionRef.setValue(COM_IsRomantic, 0.0) ; #DEBUG_LINE_NO:493
  Self.CommitmentDesired(False) ; #DEBUG_LINE_NO:495
EndFunction

Function CommitmentDesired(Bool Desired)
  If Desired ; #DEBUG_LINE_NO:503
    CompanionRef.setValue(COM_CommitmentDesired, 1.0) ; #DEBUG_LINE_NO:504
    If CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 1.0 ; #DEBUG_LINE_NO:506
      CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 0.0) ; #DEBUG_LINE_NO:510
      Self.StartTimer(600.0, TimerID_StoryGate) ; #DEBUG_LINE_NO:511
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    CompanionRef.setValue(COM_CommitmentDesired, 0.0) ; #DEBUG_LINE_NO:515
  EndIf ; #DEBUG_LINE_NO:
  CompanionRef.setValue(COM_CommitmentPossible, 1.0) ; #DEBUG_LINE_NO:519
EndFunction

Function MakeCommitted()
  Self.SetAffinityLevel(COM_AffinityLevel_3_Commitment) ; #DEBUG_LINE_NO:524
  CompanionRef.setValue(COM_IsCommitted, 1.0) ; #DEBUG_LINE_NO:525
EndFunction

Function MakeNotCommitted(Bool Permanent)
  Self.SetAffinityLevel(COM_AffinityLevel_2_Affection) ; #DEBUG_LINE_NO:530
  CompanionRef.setValue(COM_IsCommitted, 0.0) ; #DEBUG_LINE_NO:531
  If Permanent ; #DEBUG_LINE_NO:533
    CompanionRef.setValue(COM_CommitmentRefusedPermanently, 1.0) ; #DEBUG_LINE_NO:534
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function BreakCommitment()
  Self.MakeNotCommitted(True) ; #DEBUG_LINE_NO:540
  Self.MakeNotRomantic() ; #DEBUG_LINE_NO:541
  Self.SetAngerLevel(SQ_Companions.COM_AngerLevel_2_Angry, SQ_Companions.COM_AngerReason_Common_3_BreakCommitment) ; #DEBUG_LINE_NO:542
  Self.StartAngerCoolDownTimer() ; #DEBUG_LINE_NO:545
EndFunction

Function AwardSecondChance()
  Float newVal = CompanionRef.GetValue(COM_AngerSecondChances) + 1.0 ; #DEBUG_LINE_NO:549
  CompanionRef.setValue(COM_AngerSecondChances, newVal) ; #DEBUG_LINE_NO:550
EndFunction

Function ReedemSecondChance()
  Float newVal = CompanionRef.GetValue(COM_AngerSecondChances) - 1.0 ; #DEBUG_LINE_NO:556
  CompanionRef.setValue(COM_AngerSecondChances, newVal) ; #DEBUG_LINE_NO:557
  Self._AngerSceneCancelAnger() ; #DEBUG_LINE_NO:561
EndFunction

Function AngerSpeechChallengeSuccess()
  Self._AngerSceneCancelAnger() ; #DEBUG_LINE_NO:567
EndFunction

Function _AngerSceneCancelAnger()
  Self.CancelTimerGameTime(GameTimerID_AngerCoolDown) ; #DEBUG_LINE_NO:572
  Self.MakeNotAngry() ; #DEBUG_LINE_NO:575
EndFunction

Function AngerSceneCompleted()
  CompanionRef.setValue(COM_AngerSceneCompleted, 1.0) ; #DEBUG_LINE_NO:581
  Self.StartAngerCoolDownTimer() ; #DEBUG_LINE_NO:582
EndFunction

Function DebugSetStoryGateTimerComplete()
  If CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 0.0 ; #DEBUG_LINE_NO:588
    Self.CancelTimer(0) ; #DEBUG_LINE_NO:589
    Self.OnTimer(TimerID_StoryGate) ; #DEBUG_LINE_NO:590
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:603
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:607
EndFunction
