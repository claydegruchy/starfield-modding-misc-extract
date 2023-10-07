ScriptName SQ_CompanionsScript Extends SQ_ActorRolesScript

;-- Structs -----------------------------------------
Struct ActiveCompanionChangedArgs
  Actor NewActiveCompanion
  Actor OldActiveCompanion
EndStruct

Struct AffinityLevelDatum
  GlobalVariable AffinityLevel
  { filter for: COM_AffinityLevel* }
  Message MessageToDisplay
  { filter for: SQ_Companions_AffinityLevel*Message }
EndStruct

Struct AngerLevelDatum
  GlobalVariable AngerLevel
  { filter for: COM_AngerLevel* }
  Message MessageToDisplay
  { filter for: SQ_Companions_AngerLevel*Message }
  Float CoolDownTimerDuration = -1.0
  { (Default: -1; no timer) How long, in *game day hours*, of a duration for the "cool down" timer. }
  Bool AutoDismiss = False
  { (Default: false) if true, when setting this anger state, also have the companion dismiss themselves }
EndStruct


;-- Variables ---------------------------------------
companionactorscript PQ_LockedInActor
Actor PlayerRef
Float TimerDur_SleepWake = 2.0 Const
Int TimerID_SleepWake = 1 Const
Activator Txt_Replace_QuestName

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard LockedinCompanionGuard

;-- Properties --------------------------------------
Group Affinity
  ActorValue Property COM_Affinity Auto Const mandatory
  { autofill; holds value of accrued affinity "points" }
  ActorValue Property COM_AffinityLevel Auto Const mandatory
  { autofill; holds value equaling the related AffinityLevelData[i].AffinityLevel globalvariable }
  GlobalVariable Property COM_AffinityLevel_0_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory
  { autofill }
  GlobalVariable[] Property COM_AffinityLevel_EnumGlobals Auto hidden mandatory
  { an array of all possible values of the associated actorvalues created and filled in_Init_COM_AffinityLevel_EnumGlobals() which is called in OnInt() }
  sq_companionsscript:affinityleveldatum[] Property AffinityLevelData Auto Const mandatory
EndGroup

Group Anger
  ActorValue Property COM_AngerLevel Auto Const mandatory
  { autofill; holds the current anger level (see globals in AngerLevelData) and description field in the COM_AngerLevel actorvalue }
  ActorValue Property COM_AngerSceneCompleted Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_0_NotAngry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_1_Annoyed Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_2_Angry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerLevel_3_Furious Auto Const mandatory
  { autofill }
  GlobalVariable[] Property COM_AngerLevel_EnumGlobals Auto hidden
  { an array of all possible values of the associated actorvalues created and filled in_Init_COM_AngerLevel_EnumGlobals() which is called in OnInt() }
  sq_companionsscript:angerleveldatum[] Property AngerLevelData Auto Const mandatory
  ActorValue Property COM_AngerReason Auto Const mandatory
  { autofill; holds the last (or prioritized) anger reason - used to conditionalize anger scene dialogue }
  GlobalVariable[] Property COM_AngerReason_EnumGlobals Auto Const mandatory
  { an array of all possible values of the associated actorvalues.
Note: This includes common as well as "companion specific" anger reasons }
  GlobalVariable Property COM_AngerReason_Common_0_NotAngry Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_AngerReason_Common_3_BreakCommitment Auto Const mandatory
  { autofill }
EndGroup

Group Romance
  ActorValue Property COM_FlirtCount Auto Const mandatory
  { autofill }
  ActorValue Property COM_IsRomantic Auto Const mandatory
  { autofill }
  Keyword[] Property BedTypeKeywords Auto Const mandatory
  { used to find beds for companion placement when player sleeps }
  ReferenceAlias Property SleepCompanion Auto Const mandatory
  { autofill }
  ReferenceAlias Property SleepCompanionRomantic Auto Const mandatory
  { autofill }
  ReferenceAlias Property PlayerBedNoReuse Auto Const mandatory
  { autofill; forces non-romantic furniture to NOT be the player's bed when when refilling SleepCompanionFurniture, and to test romantic companions when they wake up if they are in the player's bed }
  ReferenceAlias Property SleepCompanionFurniture Auto Const mandatory
  { autofill }
  Keyword Property COM_SleepTopic_PlayerWakesUp Auto Const mandatory
  { autofill }
  Keyword Property COM_SleepTopic_WakeUpInPlayersBed Auto Const mandatory
  { autofill }
EndGroup

Group Personal_Quest
  Message Property COM_PQ_AdvancingQuestWarning Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInMsg Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInReleasedMsg Auto Const mandatory
  { autofill }
  Message Property COM_PQ_LockedInReminder Auto Const mandatory
  { autofill }
  GlobalVariable Property COM_PQ_LockedInCompanion Auto Const mandatory
  { autofill; will hold ID of companion who is locked in. Will be -1 if no one is locked in }
  ActorValue Property COM_PQ_LockedIn Auto Const mandatory
  { autofill; 0 = not locked in, 1 = locked in }
EndGroup

Group Misc
  Faction Property PotentialCrewFaction Auto Const mandatory
  { autofill }
  sq_traitsquestscript Property SQ_Traits Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeElite Auto Const mandatory
  { autofill }
  ReferenceAlias Property ActiveEliteCrew Auto Const mandatory
  { autofill }
  achievements_companionsandelitecrew Property Achievements_Quest Auto Const mandatory
  { autofill }
  RefCollectionAlias Property CommitmentGifts Auto Const mandatory
  { autofill }
EndGroup

Keyword Property COM_NoSleepTeleportLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function StartTimer_SleepWake()
  Self.StartTimer(TimerDur_SleepWake, TimerID_SleepWake) ; #DEBUG_LINE_NO:171
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_SleepWake ; #DEBUG_LINE_NO:177
    Self.HandleTimer_SleepWake() ; #DEBUG_LINE_NO:178
  EndIf ; #DEBUG_LINE_NO:
EndEvent

sq_companionsscript:activecompanionchangedargs Function GetActiveCompanionChangedArgsStruct(Var[] akArgsFromEvent)
  Return akArgsFromEvent[0] as sq_companionsscript:activecompanionchangedargs ; #DEBUG_LINE_NO:195
EndFunction

Function _SendActiveCompanionChanged(Actor NewActiveCompanion, Actor OldActiveCompanion)
  sq_companionsscript:activecompanionchangedargs eventArgsStruct = new sq_companionsscript:activecompanionchangedargs ; #DEBUG_LINE_NO:199
  eventArgsStruct.NewActiveCompanion = NewActiveCompanion ; #DEBUG_LINE_NO:200
  eventArgsStruct.OldActiveCompanion = OldActiveCompanion ; #DEBUG_LINE_NO:201
  Var[] args = new Var[1] ; #DEBUG_LINE_NO:203
  args[0] = eventArgsStruct as Var ; #DEBUG_LINE_NO:204
  Self.SendCustomEvent("sq_companionsscript_ActiveCompanionChanged", args) ; #DEBUG_LINE_NO:206
EndFunction

Event OnInit()
  PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:219
  Self._Init_COM_AngerLevel_EnumGlobals() ; #DEBUG_LINE_NO:220
  Self._Init_COM_AffinityLevel_EnumGlobals() ; #DEBUG_LINE_NO:221
EndEvent

Event OnQuestInit()
  Self.RegisterForPlayerSleep() ; #DEBUG_LINE_NO:225
EndEvent

Function _Init_COM_AngerLevel_EnumGlobals()
  COM_AngerLevel_EnumGlobals = new GlobalVariable[0] ; #DEBUG_LINE_NO:230
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_0_NotAngry, 1) ; #DEBUG_LINE_NO:231
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_1_Annoyed, 1) ; #DEBUG_LINE_NO:232
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_2_Angry, 1) ; #DEBUG_LINE_NO:233
  COM_AngerLevel_EnumGlobals.add(COM_AngerLevel_3_Furious, 1) ; #DEBUG_LINE_NO:234
EndFunction

Function _Init_COM_AffinityLevel_EnumGlobals()
  COM_AffinityLevel_EnumGlobals = new GlobalVariable[0] ; #DEBUG_LINE_NO:241
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_0_Neutral, 1) ; #DEBUG_LINE_NO:242
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_1_Friendship, 1) ; #DEBUG_LINE_NO:243
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_2_Affection, 1) ; #DEBUG_LINE_NO:244
  COM_AffinityLevel_EnumGlobals.add(COM_AffinityLevel_3_Commitment, 1) ; #DEBUG_LINE_NO:245
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate) ; #DEBUG_LINE_NO:261
  ActorToUpdate.AddtoFaction(PotentialCrewFaction) ; #DEBUG_LINE_NO:262
  SQ_Crew.SetRoleAvailable(ActorToUpdate, True) ; #DEBUG_LINE_NO:263
EndFunction

Function _CustomSetRoleUnavailable(Actor ActorToUpdate)
  SQ_Crew.SetRoleUnavailable(ActorToUpdate, True) ; #DEBUG_LINE_NO:268
EndFunction

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  If PriorActiveActor as Bool && PriorActiveActor != ActorToUpdate ; #DEBUG_LINE_NO:275
    Self.SetRoleInactive(PriorActiveActor, True, False, True) ; #DEBUG_LINE_NO:276
  EndIf ; #DEBUG_LINE_NO:
  SQ_Crew.SetEliteCrewInactive(ActiveEliteCrew.GetActorReference(), True) ; #DEBUG_LINE_NO:280
  SQ_Followers.SetRoleActive(ActorToUpdate, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:283
  SQ_Crew.SetRoleAvailable(ActorToUpdate, True) ; #DEBUG_LINE_NO:286
  If PriorActiveActor != ActorToUpdate ; #DEBUG_LINE_NO:289
    Self._SendActiveCompanionChanged(ActorToUpdate, PriorActiveActor) ; #DEBUG_LINE_NO:290
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  SQ_Followers.SetRoleInactive(ActorToUpdate, False, True, False) ; #DEBUG_LINE_NO:298
  Self._SendActiveCompanionChanged(None, ActorToUpdate) ; #DEBUG_LINE_NO:301
  ActorToUpdate.StopCombatAlarm() ; #DEBUG_LINE_NO:304
  ActorToUpdate.StopCombat() ; #DEBUG_LINE_NO:305
  If SQ_Crew.IsRoleActive(ActorToUpdate) == False && SQ_Crew.IsRoleAvailable(ActorToUpdate) ; #DEBUG_LINE_NO:309
    spaceshipreference playerShipRef = SQ_Crew.HomeShip.GetReference() as spaceshipreference ; #DEBUG_LINE_NO:310
    SQ_Crew.AssignCrew(ActorToUpdate, playerShipRef) ; #DEBUG_LINE_NO:311
    playerShipRef.UnassignCrew(ActorToUpdate) ; #DEBUG_LINE_NO:312
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsCompanion(Actor ActorToCheck, Bool IncludeAvailableCompanions)
  Return Self.IsRole(ActorToCheck, IncludeAvailableCompanions) ; #DEBUG_LINE_NO:323
EndFunction

Event OnPlayerSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime, ObjectReference akBed)
  Self.HandlePlayerSleepStart(akBed) ; #DEBUG_LINE_NO:333
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  Self.HandlePlayerSleepStop() ; #DEBUG_LINE_NO:338
EndEvent

Function ShowAffinityLevelMessage(Actor Companion)
  GlobalVariable affinityEnumGlobal = Companion.GetValueEnumGlobal(COM_AffinityLevel, COM_AffinityLevel_EnumGlobals) ; #DEBUG_LINE_NO:345
  If affinityEnumGlobal ; #DEBUG_LINE_NO:347
    sq_companionsscript:affinityleveldatum foundDatum = Self.GetAffinityLevelDatum(affinityEnumGlobal) ; #DEBUG_LINE_NO:348
    If foundDatum ; #DEBUG_LINE_NO:349
      Message msg = foundDatum.MessageToDisplay ; #DEBUG_LINE_NO:350
      If msg ; #DEBUG_LINE_NO:351
        Self.ShowTextReplacedMessage(Companion, msg, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:352
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

sq_companionsscript:affinityleveldatum Function GetAffinityLevelDatum(GlobalVariable AffinityLevel)
  Int iFound = AffinityLevelData.findstruct("AffinityLevel", AffinityLevel, 0) ; #DEBUG_LINE_NO:359
  If iFound > -1 ; #DEBUG_LINE_NO:360
    Return AffinityLevelData[iFound] ; #DEBUG_LINE_NO:361
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetAffinityLevel(Actor Companion, GlobalVariable AffinityLevel)
  Companion.SetValue(COM_AffinityLevel, AffinityLevel.GetValue()) ; #DEBUG_LINE_NO:371
  Self.ShowAffinityLevelMessage(Companion) ; #DEBUG_LINE_NO:372
  Achievements_Quest.AffinityLevelReached(Companion) ; #DEBUG_LINE_NO:375
  If AffinityLevel == SQ_Companions.COM_AffinityLevel_1_Friendship ; #DEBUG_LINE_NO:377
    (Companion as companionactorscript).COM_CompanionQuest.AwardSecondChance() ; #DEBUG_LINE_NO:379
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SortCompanionArrayByAffinity(companionactorscript[] CompanionArray, Bool ExcludeLockedInCompanion)
  If ExcludeLockedInCompanion ; #DEBUG_LINE_NO:388
    Int i = CompanionArray.Length - 1 ; #DEBUG_LINE_NO:389
    While i > -1 ; #DEBUG_LINE_NO:390
      If Self.IsCompanionLockedIn(CompanionArray[i]) ; #DEBUG_LINE_NO:391
        CompanionArray.remove(i, 1) ; #DEBUG_LINE_NO:392
      EndIf ; #DEBUG_LINE_NO:
      i -= 1 ; #DEBUG_LINE_NO:395
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:402
  While I < CompanionArray.Length - 1 ; #DEBUG_LINE_NO:403
    Int j = 0 ; #DEBUG_LINE_NO:404
    While j < CompanionArray.Length - I - 1 ; #DEBUG_LINE_NO:405
      companionactorscript companionA = CompanionArray[j] ; #DEBUG_LINE_NO:406
      companionactorscript companionB = CompanionArray[j + 1] ; #DEBUG_LINE_NO:407
      If companionB.HasGreaterAffinityThanTestedCompanion(companionA) ; #DEBUG_LINE_NO:409
        CompanionArray[j] = companionB ; #DEBUG_LINE_NO:411
        CompanionArray[j + 1] = companionA ; #DEBUG_LINE_NO:412
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:415
    EndWhile ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:419
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetAngerLevel(companionactorscript Companion, GlobalVariable AngerLevel, GlobalVariable AngerReason)
  If AngerReason != COM_AngerReason_Common_0_NotAngry ; #DEBUG_LINE_NO:434
    AngerReason = Self._GetPrioritizedAngerReason(Companion as Actor, AngerReason, Companion.COM_CompanionQuest.PrioritizedAngerReasons) ; #DEBUG_LINE_NO:436
  EndIf ; #DEBUG_LINE_NO:
  If AngerLevel == COM_AngerLevel_0_NotAngry ; #DEBUG_LINE_NO:441
    AngerReason = COM_AngerReason_Common_0_NotAngry ; #DEBUG_LINE_NO:443
  EndIf ; #DEBUG_LINE_NO:
  Companion.SetValue(COM_AngerReason, AngerReason.GetValue()) ; #DEBUG_LINE_NO:447
  sq_companionsscript:angerleveldatum foundDatum = Self.GetAngerLevelDatum(AngerLevel) ; #DEBUG_LINE_NO:450
  If foundDatum ; #DEBUG_LINE_NO:452
    Companion.SetValue(COM_AngerLevel, foundDatum.AngerLevel.GetValue()) ; #DEBUG_LINE_NO:453
    If foundDatum.MessageToDisplay ; #DEBUG_LINE_NO:455
      Self.ShowTextReplacedMessage(Companion as Actor, foundDatum.MessageToDisplay, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:457
    EndIf ; #DEBUG_LINE_NO:
    If foundDatum.AutoDismiss ; #DEBUG_LINE_NO:460
      If SQ_Companions.IsCompanionLockedIn(Companion) ; #DEBUG_LINE_NO:462
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.SetRoleInactive(Companion as Actor, True, False, True) ; #DEBUG_LINE_NO:466
      EndIf ; #DEBUG_LINE_NO:
      If AngerReason == COM_AngerReason_Common_3_BreakCommitment ; #DEBUG_LINE_NO:469
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Companion.SetValue(COM_AngerSceneCompleted, 0.0) ; #DEBUG_LINE_NO:473
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

GlobalVariable Function _GetPrioritizedAngerReason(Actor Companion, GlobalVariable NewReason, GlobalVariable[] PrioritizedAngerReasons)
  GlobalVariable returnVal = NewReason ; #DEBUG_LINE_NO:484
  GlobalVariable currentReason = Companion.GetValueEnumGlobal(COM_AngerReason, COM_AngerReason_EnumGlobals) ; #DEBUG_LINE_NO:485
  If currentReason != None ; #DEBUG_LINE_NO:490
    Int iCurrentReason = PrioritizedAngerReasons.find(currentReason, 0) ; #DEBUG_LINE_NO:491
    Int iNewReason = PrioritizedAngerReasons.find(NewReason, 0) ; #DEBUG_LINE_NO:492
    If iCurrentReason > -1 && iNewReason > -1 ; #DEBUG_LINE_NO:496
      If iCurrentReason < iNewReason ; #DEBUG_LINE_NO:498
        returnVal = currentReason ; #DEBUG_LINE_NO:499
      Else ; #DEBUG_LINE_NO:
        returnVal = NewReason ; #DEBUG_LINE_NO:501
      EndIf ; #DEBUG_LINE_NO:
    ElseIf iCurrentReason > -1 ; #DEBUG_LINE_NO:505
      returnVal = currentReason ; #DEBUG_LINE_NO:506
    ElseIf iNewReason > -1 ; #DEBUG_LINE_NO:507
      returnVal = NewReason ; #DEBUG_LINE_NO:508
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:514
EndFunction

GlobalVariable Function GetAngerLevel(Actor Companion)
  GlobalVariable returnVar = Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals) ; #DEBUG_LINE_NO:519
  Return returnVar ; #DEBUG_LINE_NO:522
EndFunction

Float Function GetAngerCoolDownTimerDuration(Actor Companion)
  Float returnVal = -1.0 ; #DEBUG_LINE_NO:530
  sq_companionsscript:angerleveldatum foundDatum = Self.GetAngerLevelDatum(Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals)) ; #DEBUG_LINE_NO:532
  If foundDatum ; #DEBUG_LINE_NO:534
    returnVal = foundDatum.CoolDownTimerDuration ; #DEBUG_LINE_NO:535
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:539
EndFunction

sq_companionsscript:angerleveldatum Function GetAngerLevelDatum(GlobalVariable AngerLevel)
  Int iFound = AngerLevelData.findstruct("AngerLevel", AngerLevel, 0) ; #DEBUG_LINE_NO:543
  If iFound > -1 ; #DEBUG_LINE_NO:544
    Return AngerLevelData[iFound] ; #DEBUG_LINE_NO:545
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function IncrementFlirtCount(companionactorscript Companion)
  Companion.SetValue(COM_FlirtCount, Companion.GetValue(COM_FlirtCount) + 1.0) ; #DEBUG_LINE_NO:553
EndFunction

Function HandlePlayerSleepStart(ObjectReference PlayerBedRef)
  If PlayerBedRef.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == True ; #DEBUG_LINE_NO:560
    Return  ; #DEBUG_LINE_NO:562
  EndIf ; #DEBUG_LINE_NO:
  PlayerBedNoReuse.ForceRefTo(PlayerBedRef) ; #DEBUG_LINE_NO:566
  companionactorscript companionRef = Self.GetActiveActor() as companionactorscript ; #DEBUG_LINE_NO:569
  If companionRef ; #DEBUG_LINE_NO:571
    SleepCompanion.ForceRefTo(companionRef as ObjectReference) ; #DEBUG_LINE_NO:573
  Else ; #DEBUG_LINE_NO:
    SleepCompanionRomantic.RefillAlias() ; #DEBUG_LINE_NO:576
  EndIf ; #DEBUG_LINE_NO:
  If SleepCompanion.GetReference() == None ; #DEBUG_LINE_NO:580
    SleepCompanion.RefillAlias() ; #DEBUG_LINE_NO:582
  EndIf ; #DEBUG_LINE_NO:
  companionRef = SleepCompanion.GetReference() as companionactorscript ; #DEBUG_LINE_NO:586
  If companionRef ; #DEBUG_LINE_NO:589
    If Self.IsCompanionRomantic(companionRef) ; #DEBUG_LINE_NO:590
      SleepCompanionFurniture.ForceRefTo(PlayerBedRef) ; #DEBUG_LINE_NO:592
    Else ; #DEBUG_LINE_NO:
      SleepCompanionFurniture.RefillAlias() ; #DEBUG_LINE_NO:595
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference() ; #DEBUG_LINE_NO:598
    If !companionRef.IsInScene() ; #DEBUG_LINE_NO:601
      If (sleepCompanionFurnitureRef as Bool && sleepCompanionFurnitureRef.GetActorOwner() == None) && sleepCompanionFurnitureRef.GetFactionOwner() == None && (PlayerRef.HasDetectionLOS(sleepCompanionFurnitureRef) || SleepCompanionFurniture.GetRef() == PlayerBedRef) ; #DEBUG_LINE_NO:602
        Bool snappedIntoFurnitureSuccess = companionRef.MoveToFurniture(sleepCompanionFurnitureRef) ; #DEBUG_LINE_NO:603
      Else ; #DEBUG_LINE_NO:
        companionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:608
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerSleepStop()
  companionactorscript sleepCompanionRef = SleepCompanion.GetReference() as companionactorscript ; #DEBUG_LINE_NO:622
  If sleepCompanionRef ; #DEBUG_LINE_NO:624
    ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference() ; #DEBUG_LINE_NO:626
    If sleepCompanionFurnitureRef == PlayerBedNoReuse.GetReference() ; #DEBUG_LINE_NO:628
      sleepCompanionRef.SayCustom(COM_SleepTopic_WakeUpInPlayersBed, None, False, None) ; #DEBUG_LINE_NO:630
    Else ; #DEBUG_LINE_NO:
      sleepCompanionRef.SayCustom(COM_SleepTopic_PlayerWakesUp, None, False, None) ; #DEBUG_LINE_NO:633
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.StartTimer_SleepWake() ; #DEBUG_LINE_NO:637
EndFunction

Function HandleTimer_SleepWake()
  Actor sleepCompanionRef = SleepCompanion.GetActorReference() ; #DEBUG_LINE_NO:642
  PlayerBedNoReuse.Clear() ; #DEBUG_LINE_NO:643
  SleepCompanionRomantic.Clear() ; #DEBUG_LINE_NO:644
  SleepCompanion.Clear() ; #DEBUG_LINE_NO:645
  SleepCompanionFurniture.Clear() ; #DEBUG_LINE_NO:646
  sleepCompanionRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:647
EndFunction

companionactorscript[] Function GetRomanticCompanions(Float MaxDistance, Bool GetFirstOnly)
  companionactorscript[] availableCompanions = Self.GetAvailableActors() as companionactorscript[] ; #DEBUG_LINE_NO:654
  companionactorscript[] romanticCompanions = new companionactorscript[0] ; #DEBUG_LINE_NO:655
  Int I = 0 ; #DEBUG_LINE_NO:657
  While I < availableCompanions.Length ; #DEBUG_LINE_NO:658
    companionactorscript currentCompanionRef = availableCompanions[I] ; #DEBUG_LINE_NO:659
    If currentCompanionRef.IsRomantic() && (MaxDistance <= 0.0 || currentCompanionRef.GetDistance(Game.GetPlayer() as ObjectReference) <= MaxDistance) ; #DEBUG_LINE_NO:661
      romanticCompanions.add(currentCompanionRef, 1) ; #DEBUG_LINE_NO:662
      If GetFirstOnly ; #DEBUG_LINE_NO:663
        I = availableCompanions.Length ; #DEBUG_LINE_NO:664
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:668
  EndWhile ; #DEBUG_LINE_NO:
  Return romanticCompanions ; #DEBUG_LINE_NO:672
EndFunction

Bool Function IsCompanionRomantic(companionactorscript Companion)
  Bool returnVal = Companion.GetValue(SQ_Companions.COM_IsRomantic) >= 1.0 ; #DEBUG_LINE_NO:678
  Return returnVal ; #DEBUG_LINE_NO:682
EndFunction

Bool Function IsCompanionLockedIn(companionactorscript SpecificCompanionToTest)
  Guard LockedinCompanionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:686
    Bool returnVal = False ; #DEBUG_LINE_NO:689
    If SpecificCompanionToTest != None ; #DEBUG_LINE_NO:691
      returnVal = SpecificCompanionToTest == PQ_LockedInActor ; #DEBUG_LINE_NO:692
    Else ; #DEBUG_LINE_NO:
      returnVal = COM_PQ_LockedInCompanion.GetValue() > -1.0 ; #DEBUG_LINE_NO:694
    EndIf ; #DEBUG_LINE_NO:
    Return returnVal ; #DEBUG_LINE_NO:699
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function LockInCompanion(companionactorscript Companion, Bool LockedIn, Message CustomMessage, Activator TextReplaceActivator)
  Guard LockedinCompanionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:706
    Txt_Replace_QuestName = TextReplaceActivator ; #DEBUG_LINE_NO:709
    ObjectReference QuestNameRef = Companion.PlaceAtMe(Txt_Replace_QuestName as Form, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:710
    Alias_MessageTextReplaceRef.ForceRefTo(QuestNameRef) ; #DEBUG_LINE_NO:711
    Message messageToShow = CustomMessage ; #DEBUG_LINE_NO:713
    If LockedIn ; #DEBUG_LINE_NO:715
      If COM_PQ_LockedInCompanion.GetValue() > -1.0 ; #DEBUG_LINE_NO:717
        PQ_LockedInActor.SetValue(COM_PQ_LockedIn, 0.0) ; #DEBUG_LINE_NO:719
        If CustomMessage == None ; #DEBUG_LINE_NO:721
          messageToShow = COM_PQ_LockedInReleasedMsg ; #DEBUG_LINE_NO:722
        EndIf ; #DEBUG_LINE_NO:
        Self.ShowTextReplacedMessage(PQ_LockedInActor as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0) ; #DEBUG_LINE_NO:725
      EndIf ; #DEBUG_LINE_NO:
      If CustomMessage == None ; #DEBUG_LINE_NO:728
        messageToShow = COM_PQ_LockedInMsg ; #DEBUG_LINE_NO:729
      EndIf ; #DEBUG_LINE_NO:
      Self.ShowTextReplacedMessage(Companion as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0) ; #DEBUG_LINE_NO:732
      If Self.IsCompanion(Companion as Actor, False) == False ; #DEBUG_LINE_NO:736
        If Self.IsRoleAvailable(Companion as Actor) ; #DEBUG_LINE_NO:738
          Self.SetRoleActive(Companion as Actor, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:739
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Companion.SetValue(COM_PQ_LockedIn, 1.0) ; #DEBUG_LINE_NO:745
      COM_PQ_LockedInCompanion.SetValue(Companion.GetCompanionIDValue()) ; #DEBUG_LINE_NO:746
      PQ_LockedInActor = Companion ; #DEBUG_LINE_NO:747
      companionactorscript[] availableCompanions = Self.GetAvailableActors() as companionactorscript[] ; #DEBUG_LINE_NO:749
      Int I = 0 ; #DEBUG_LINE_NO:750
      While I < availableCompanions.Length ; #DEBUG_LINE_NO:751
        companionactorscript currentCompanion = availableCompanions[I] ; #DEBUG_LINE_NO:752
        currentCompanion.COM_CompanionQuest.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:754
        I += 1 ; #DEBUG_LINE_NO:755
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Companion.SetValue(COM_PQ_LockedIn, 0.0) ; #DEBUG_LINE_NO:759
      COM_PQ_LockedInCompanion.SetValue(-1.0) ; #DEBUG_LINE_NO:760
      If CustomMessage as Bool == False ; #DEBUG_LINE_NO:762
        messageToShow = COM_PQ_LockedInReleasedMsg ; #DEBUG_LINE_NO:763
      EndIf ; #DEBUG_LINE_NO:
      Self.ShowTextReplacedMessage(Companion as Actor, messageToShow, True, QuestNameRef, 0.0, 0.0) ; #DEBUG_LINE_NO:766
      PQ_LockedInActor = None ; #DEBUG_LINE_NO:768
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function PersonalQuestReminder()
  ObjectReference QuestNameRef = PQ_LockedInActor.PlaceAtMe(Txt_Replace_QuestName as Form, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:778
  Self.ShowTextReplacedMessage(PQ_LockedInActor as Actor, COM_PQ_LockedInReminder, True, QuestNameRef, 0.0, 0.0) ; #DEBUG_LINE_NO:779
EndFunction

Function DebugCompanion(Actor Companion)
  Self.SetRoleActive(Companion, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:787
  Companion.MoveTo(PlayerRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:788
EndFunction

Function DebugModAffinity(Actor Companion, Float Amount)
  Companion.AddPassiveAffinity(Amount) ; #DEBUG_LINE_NO:794
EndFunction
