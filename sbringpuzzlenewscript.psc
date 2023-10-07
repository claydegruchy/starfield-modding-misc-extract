ScriptName SBRingPuzzleNEWScript Extends ObjectReference conditional
{ New Ring Puzzle script. }

;-- Structs -----------------------------------------
Struct ringData
  wwiseevent ringToneEvent
  Int ringToneInstance = -1
  wwiseevent successEvent
  String ringTuningSoundString
  Float solutionPosition = 0.0
EndStruct

Struct solutionData
  ObjectReference solutionRef
  Float solutionPositionX = 0.0
  Float solutionPositionY = 0.0
  Float solutionPositionZ = 0.0
EndStruct


;-- Variables ---------------------------------------
Int currentSolutionIndex = 0
Int overallTuningCount = 0
Int playerMovementTimerID = 1 Const
Float playerMovementTimerSeconds = 0.5 Const
ObjectReference puzzleSolutionRef
sbringpuzzlenewscript:solutiondata[] puzzleSolutions
Float puzzleX
Float puzzleY
Float puzzleZ
Int requiredTuningCount
Int solutionMovementTimerID = 2 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ringRotationGuard

;-- Properties --------------------------------------
Group keywords
  Keyword Property SBRingsPuzzleKeyword Auto Const mandatory
  Keyword Property SBPowerTriggerEnableMarkerKeyword Auto Const mandatory
  Keyword Property SBRumbleDebrisEnableMarkerKeyword Auto Const mandatory
EndGroup

Group effects
  Form Property MarkerDummyA Auto Const mandatory
  { used to test solution distance }
EndGroup

Group soundData
  wwiseevent Property AllRingsToneEvent Auto Const mandatory
  wwiseevent Property wSuccessEvent Auto Const mandatory
  wwiseevent Property wCloseAnimationEvent Auto Const mandatory
  wwiseevent Property wRingsIdleSoundEvent Auto Const mandatory
  wwiseevent Property wRumble Auto Const mandatory
  wwiseevent Property wRingsRelease Auto Const mandatory
  wwiseevent Property wOpenAnimation Auto Const mandatory
  wwiseevent Property wRingRotationSoundEvent Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
  wwiseevent Property WwiseEvent_ShakeController_p5_p5_02 Auto Const mandatory
  Int Property instanceRingsIdling = -1 Auto hidden
  Int Property instanceAllTuning = -1 Auto hidden
  wwiseevent Property wAnomalySuccessEvent Auto Const mandatory
  wwiseevent Property wMoveAnomalyEvent Auto Const mandatory
EndGroup

Group PuzzleData
  sbringpuzzlenewscript:ringdata[] Property Rings Auto mandatory
  Float Property fRingSpeedMin = 0.100000001 Auto Const
  Float Property fRingSpeedMax = 10.0 Auto Const
  Float Property minPuzzleTuningOrientation = 0.800000012 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  Float Property puzzlePositionMaxXY = 20.0 Auto Const
  { how far away max can the "solution" position be? }
  Float Property puzzlePositionMinZ = 8.0 Auto Const
  { min Z for solution }
  Float Property puzzlePositionMaxZ = 15.5 Auto Const
  { max Z for solution }
  Float Property puzzleposition_angleVmin = 0.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleVmax = 90.0 Auto Const
  { horizontal angle max }
  Float Property puzzleposition_angleHmin = 15.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleHmax = 345.0 Auto Const
  { horizontal angle max }
  Float Property requiredTuningSeconds = 0.5 Auto Const
  { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }
  String Property puzzleAnimationString_PlayerPos = "fRingTarget" Auto Const
  { animation variable to update puzzle animation based on player position }
  String Property puzzleAnimationString_OpenStart = "Open" Auto Const
  { animation to open the puzzle rings }
  String Property puzzleAnimationString_OpenFinish = "Opened" Auto Const
  { event when open animation is done }
  String Property puzzleAnimationString_Close = "Close" Auto Const
  { animation to show puzzle success }
  String Property puzzleAnimationString_Reset = "Reset" Auto Const
  { animation to reset the puzzle }
  String Property puzzleEventString_ReactionEnd = "ReactionEnd" Auto Const
  { custom animation event sent when puzzle is done reacting to player on completion }
  String Property puzzleWwiseEventString_RingsAll_Tuning = "ArtifactPuzzle_RingsAll_Tuning" Auto Const
  { puzzle "tuning" Wwise event }
  Int Property solutionCount = 5 Auto
  { how many times does the player need to solve the puzzle? }
  Float Property solutionMovementTimeStart = 10.0 Auto
  { starting time for solution to move }
  Float Property solutionMovementTimeMin = 2.5 Auto
  { fastest solution movement time (on last solution) - so each time you solve a step, actual movement timer will be reduced by:
        (solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex / solutionCount }
  Float Property minSolutionMoveDistance = 15.0 Auto
  { try to make sure next solution is at least this far from previous }
EndGroup

Group SolutionVisibility
  Form Property SolutionVisibilityMarker Auto Const
  { placed at solution position }
  Float Property minPuzzleTuningOrientationSolution = 0.920000017 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  String Property solutionAnimationString_Hide = "Stage1" Auto Const
  { animation to hide solution }
  String Property solutionAnimationString_Appear = "Stage2" Auto Const
  { animation to show solution }
  String Property solutionAnimationString_Success = "Stage3" Auto Const
  { animation to show solution success }
  String Property solutionAnimationString_Move = "Stage4" Auto Const
  { animation when solution moves }
  String Property solutionAnimationString_Finish = "FXAnimFinish" Auto Const
  { event when all solution animations are done }
EndGroup

Group quests
  Quest Property QuestToCheck Auto Const
  Int Property StageToSet Auto Const
  Quest Property MQ104A Auto Const mandatory
  Int Property MQ104APuzzleStartedStage = 402 Auto Const
  Int Property MQ104APuzzleCompletedStage = 500 Auto Const
EndGroup

Group flags
  Bool Property PuzzleInitialized = False Auto conditional hidden
  Bool Property PuzzleComplete = False Auto conditional hidden
  Bool Property PlayerIsInTrigger = False Auto conditional hidden
  Bool Property DisableCheckRings = False Auto Const
  { For LC165, using this to disable the CheckRings function and avoid script spam. }
  GlobalVariable Property MQAutoSolvePuzzle Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  puzzleSolutions = new sbringpuzzlenewscript:solutiondata[0] ; #DEBUG_LINE_NO:185
  requiredTuningCount = Math.Floor(requiredTuningSeconds / playerMovementTimerSeconds) ; #DEBUG_LINE_NO:188
  Self.ResetPuzzleSolutions() ; #DEBUG_LINE_NO:190
EndEvent

Function PlayPuzzleAnimation(ObjectReference akRef, String asAnimation, String asEndEvent, Bool tryAgainOnFail)
  Bool animSuccess = False ; #DEBUG_LINE_NO:200
  Int maxAnimAttemptCount = 10 ; #DEBUG_LINE_NO:201
  Int animAttemptCount = 0 ; #DEBUG_LINE_NO:202
  If !tryAgainOnFail ; #DEBUG_LINE_NO:204
    maxAnimAttemptCount = 1 ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  If akRef.WaitFor3DLoad() ; #DEBUG_LINE_NO:208
    While !animSuccess && animAttemptCount < maxAnimAttemptCount ; #DEBUG_LINE_NO:209
      If asEndEvent ; #DEBUG_LINE_NO:210
        animSuccess = akRef.PlayAnimationAndWait(asAnimation, asEndEvent) ; #DEBUG_LINE_NO:211
      Else ; #DEBUG_LINE_NO:
        animSuccess = akRef.PlayAnimation(asAnimation) ; #DEBUG_LINE_NO:213
      EndIf ; #DEBUG_LINE_NO:
      If !animSuccess && tryAgainOnFail ; #DEBUG_LINE_NO:216
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:217
      EndIf ; #DEBUG_LINE_NO:
      animAttemptCount += 1 ; #DEBUG_LINE_NO:221
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If animSuccess ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetPuzzleSolutions()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:236
  puzzleX = puzzleRef.GetPositionX() ; #DEBUG_LINE_NO:238
  puzzleY = puzzleRef.GetPositionY() ; #DEBUG_LINE_NO:239
  puzzleZ = puzzleRef.GetPositionZ() ; #DEBUG_LINE_NO:240
  currentSolutionIndex = 0 ; #DEBUG_LINE_NO:242
  puzzleSolutions.clear() ; #DEBUG_LINE_NO:243
  Int I = 0 ; #DEBUG_LINE_NO:245
  ObjectReference lastSolution = None ; #DEBUG_LINE_NO:246
  While I < solutionCount ; #DEBUG_LINE_NO:247
    sbringpuzzlenewscript:solutiondata newPuzzleSolution = Self.ResetPuzzleSolution(lastSolution) ; #DEBUG_LINE_NO:248
    puzzleSolutions.add(newPuzzleSolution, 1) ; #DEBUG_LINE_NO:250
    lastSolution = newPuzzleSolution.solutionRef ; #DEBUG_LINE_NO:251
    I += 1 ; #DEBUG_LINE_NO:252
  EndWhile ; #DEBUG_LINE_NO:
  Self.DebugTraceSolutionData() ; #DEBUG_LINE_NO:255
  Self.SetPuzzleSolutionRef(False) ; #DEBUG_LINE_NO:258
EndFunction

sbringpuzzlenewscript:solutiondata Function ResetPuzzleSolution(ObjectReference distanceTestRef)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:264
  sbringpuzzlenewscript:solutiondata puzzleSolutionData = new sbringpuzzlenewscript:solutiondata ; #DEBUG_LINE_NO:265
  Float solutionX = 0.0 ; #DEBUG_LINE_NO:267
  Float solutionY = 0.0 ; #DEBUG_LINE_NO:268
  Float solutionZ = 0.0 ; #DEBUG_LINE_NO:269
  Bool foundSolution = False ; #DEBUG_LINE_NO:272
  Int failsafeCount = 5 ; #DEBUG_LINE_NO:273
  While foundSolution == False && failsafeCount > 0 ; #DEBUG_LINE_NO:275
    Float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax) ; #DEBUG_LINE_NO:278
    Float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax) ; #DEBUG_LINE_NO:279
    Float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ) ; #DEBUG_LINE_NO:280
    solutionZ = solutionRadius * Math.sin(angleV) ; #DEBUG_LINE_NO:290
    Float radiusH = Math.sqrt(solutionRadius * solutionRadius - solutionZ * solutionZ) ; #DEBUG_LINE_NO:296
    solutionY = Math.sin(angleH) * radiusH ; #DEBUG_LINE_NO:302
    solutionX = Math.cos(angleH) * radiusH ; #DEBUG_LINE_NO:306
    If distanceTestRef ; #DEBUG_LINE_NO:311
      ObjectReference testRef = puzzleRef.PlaceAtMe(MarkerDummyA, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:313
      testRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ, True, False) ; #DEBUG_LINE_NO:314
      Float moveDistance = testRef.GetDistance(distanceTestRef) ; #DEBUG_LINE_NO:315
      If moveDistance >= minSolutionMoveDistance ; #DEBUG_LINE_NO:317
        foundSolution = True ; #DEBUG_LINE_NO:318
      Else ; #DEBUG_LINE_NO:
        failsafeCount += 1 ; #DEBUG_LINE_NO:321
      EndIf ; #DEBUG_LINE_NO:
      testRef.Delete() ; #DEBUG_LINE_NO:323
    Else ; #DEBUG_LINE_NO:
      foundSolution = True ; #DEBUG_LINE_NO:325
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  puzzleSolutionData.solutionPositionX = solutionX ; #DEBUG_LINE_NO:329
  puzzleSolutionData.solutionPositionY = solutionY ; #DEBUG_LINE_NO:330
  puzzleSolutionData.solutionPositionZ = solutionZ ; #DEBUG_LINE_NO:331
  puzzleSolutionData.solutionRef = puzzleRef.PlaceAtMe(SolutionVisibilityMarker, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:334
  puzzleSolutionData.solutionRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ, True, False) ; #DEBUG_LINE_NO:337
  Return puzzleSolutionData ; #DEBUG_LINE_NO:341
EndFunction

Function SetPuzzleSolutionRef(Bool bShowSolution)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:346
  sbringpuzzlenewscript:solutiondata currentSolution = puzzleSolutions[currentSolutionIndex] ; #DEBUG_LINE_NO:349
  puzzleSolutionRef = currentSolution.solutionRef ; #DEBUG_LINE_NO:350
  Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish, True) ; #DEBUG_LINE_NO:352
  If bShowSolution ; #DEBUG_LINE_NO:353
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear, solutionAnimationString_Finish, True) ; #DEBUG_LINE_NO:354
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearSolutionRef()
  If puzzleSolutionRef ; #DEBUG_LINE_NO:360
    puzzleSolutionRef.Disable(False) ; #DEBUG_LINE_NO:361
    puzzleSolutionRef.Delete() ; #DEBUG_LINE_NO:362
    puzzleSolutionRef = None ; #DEBUG_LINE_NO:363
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MoveSolution()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:369
    If PuzzleComplete == False ; #DEBUG_LINE_NO:370
      ObjectReference oldSolutionRef = puzzleSolutions[currentSolutionIndex].solutionRef ; #DEBUG_LINE_NO:372
      Self.PlayPuzzleAnimation(oldSolutionRef, solutionAnimationString_Move, solutionAnimationString_Finish, True) ; #DEBUG_LINE_NO:376
      wMoveAnomalyEvent.Play(oldSolutionRef, None, None) ; #DEBUG_LINE_NO:377
      sbringpuzzlenewscript:solutiondata newPuzzleSolution = Self.ResetPuzzleSolution(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:380
      puzzleSolutions[currentSolutionIndex] = newPuzzleSolution ; #DEBUG_LINE_NO:381
      Self.SetPuzzleSolutionRef(True) ; #DEBUG_LINE_NO:382
      oldSolutionRef.Delete() ; #DEBUG_LINE_NO:386
      Self.StartSolutionMovementTimer() ; #DEBUG_LINE_NO:389
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StartSolutionMovementTimer()
  Float solutionTimeDifference = ((solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex as Float) / solutionCount as Float ; #DEBUG_LINE_NO:396
  Float solutionTime = solutionMovementTimeStart - solutionTimeDifference ; #DEBUG_LINE_NO:397
  Self.StartTimer(solutionTime, solutionMovementTimerID) ; #DEBUG_LINE_NO:399
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:403
    Self.CheckRotateRingsStart() ; #DEBUG_LINE_NO:405
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:410
    Self.CheckRotateRingsStart() ; #DEBUG_LINE_NO:412
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:418
    If aiTimerID == playerMovementTimerID ; #DEBUG_LINE_NO:419
      Self.RotateRings(True) ; #DEBUG_LINE_NO:420
    ElseIf aiTimerID == solutionMovementTimerID ; #DEBUG_LINE_NO:421
      Self.MoveSolution() ; #DEBUG_LINE_NO:422
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function CancelAllTimers()
  Self.CancelTimer(playerMovementTimerID) ; #DEBUG_LINE_NO:428
  Self.CancelTimer(solutionMovementTimerID) ; #DEBUG_LINE_NO:429
EndFunction

Function CheckRotateRingsStart()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:434
    PlayerIsInTrigger = Self.IsInTrigger(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:435
    Cell myCell = Self.GetParentCell() ; #DEBUG_LINE_NO:436
    If PlayerIsInTrigger ; #DEBUG_LINE_NO:438
      myCell.SetGravityScale(0.0) ; #DEBUG_LINE_NO:440
      Self.InitializePuzzle() ; #DEBUG_LINE_NO:441
      Self.RotateRings(True) ; #DEBUG_LINE_NO:442
    Else ; #DEBUG_LINE_NO:
      Self.RotateRings(False) ; #DEBUG_LINE_NO:444
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RotateRings(Bool usePlayerPosition)
  If PuzzleComplete == False && (PlayerIsInTrigger || usePlayerPosition == False) ; #DEBUG_LINE_NO:450
    ObjectReference playerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:455
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:457
    Float distanceToSolution = Game.GetPlayer().GetDistance(puzzleSolutionRef) ; #DEBUG_LINE_NO:459
    Float maxDistanceToSolution = puzzlePositionMaxZ * 2.0 ; #DEBUG_LINE_NO:460
    distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution) ; #DEBUG_LINE_NO:462
    Float fTotalPuzzleComplete = 1.0 - distanceToSolution / maxDistanceToSolution ; #DEBUG_LINE_NO:465
    If fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution ; #DEBUG_LINE_NO:471
      overallTuningCount += 1 ; #DEBUG_LINE_NO:472
      If overallTuningCount >= requiredTuningCount ; #DEBUG_LINE_NO:474
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:475
        Self.CompletePuzzle() ; #DEBUG_LINE_NO:477
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      overallTuningCount = 0 ; #DEBUG_LINE_NO:480
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(playerMovementTimerSeconds, playerMovementTimerID) ; #DEBUG_LINE_NO:484
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function InitializePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:490
    If PuzzleInitialized == False ; #DEBUG_LINE_NO:491
      PuzzleInitialized = True ; #DEBUG_LINE_NO:492
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:494
      If PuzzleComplete ; #DEBUG_LINE_NO:503
        Return  ; #DEBUG_LINE_NO:503
      EndIf ; #DEBUG_LINE_NO:
      Int instanceRumble = wRumble.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:506
      Self.GetLinkedRef(SBRumbleDebrisEnableMarkerKeyword).Enable(False) ; #DEBUG_LINE_NO:507
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:508
      Utility.Wait(2.0) ; #DEBUG_LINE_NO:510
      If puzzleRef ; #DEBUG_LINE_NO:512
        wRingsRelease.Play(puzzleRef, None, None) ; #DEBUG_LINE_NO:513
        Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:514
        wOpenAnimation.Play(puzzleRef, None, None) ; #DEBUG_LINE_NO:515
        Self.PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_OpenStart, puzzleAnimationString_OpenFinish, True) ; #DEBUG_LINE_NO:516
      EndIf ; #DEBUG_LINE_NO:
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False ; #DEBUG_LINE_NO:521
        MQ104A.SetStage(MQ104APuzzleStartedStage) ; #DEBUG_LINE_NO:522
      EndIf ; #DEBUG_LINE_NO:
      Self.InitializeRings() ; #DEBUG_LINE_NO:526
      Self.StartSolutionMovementTimer() ; #DEBUG_LINE_NO:529
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function InitializeRings()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:537
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:538
  puzzleRef.SetAnimationVariableFloat("Speed", 0.029999999) ; #DEBUG_LINE_NO:539
  Int count = 0 ; #DEBUG_LINE_NO:540
  ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:541
  While count < myDebris.Length ; #DEBUG_LINE_NO:543
    ObjectReference currentObjectReference = myDebris[count] ; #DEBUG_LINE_NO:544
    If currentObjectReference.Is3DLoaded() ; #DEBUG_LINE_NO:545
      currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False) ; #DEBUG_LINE_NO:546
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:548
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:550
  If DisableCheckRings ; #DEBUG_LINE_NO:553
    Return  ; #DEBUG_LINE_NO:554
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:557
  While I < Rings.Length ; #DEBUG_LINE_NO:558
    sbringpuzzlenewscript:ringdata theRing = Rings[I] ; #DEBUG_LINE_NO:559
    theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0) ; #DEBUG_LINE_NO:560
    I += 1 ; #DEBUG_LINE_NO:561
  EndWhile ; #DEBUG_LINE_NO:
  instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0) ; #DEBUG_LINE_NO:564
  instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0) ; #DEBUG_LINE_NO:565
  If puzzleSolutionRef as Bool && !puzzleSolutionRef.IsDeleted() ; #DEBUG_LINE_NO:567
    puzzleSolutionRef.Enable(False) ; #DEBUG_LINE_NO:569
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish, True) ; #DEBUG_LINE_NO:570
    Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear, "", True) ; #DEBUG_LINE_NO:571
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CompletePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:578
    currentSolutionIndex += 1 ; #DEBUG_LINE_NO:581
    If currentSolutionIndex < puzzleSolutions.Length ; #DEBUG_LINE_NO:584
      Float fTotalPuzzleComplete = currentSolutionIndex as Float / puzzleSolutions.Length as Float ; #DEBUG_LINE_NO:586
      wwiseevent.UpdateInstanceRTPC(instanceAllTuning, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete) ; #DEBUG_LINE_NO:588
      wwiseevent.UpdateInstanceRTPC(instanceRingsIdling, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete) ; #DEBUG_LINE_NO:589
      wAnomalySuccessEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:591
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:594
      puzzleRef.SetAnimationVariableFloat(puzzleAnimationString_PlayerPos, fTotalPuzzleComplete) ; #DEBUG_LINE_NO:595
      Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success, solutionAnimationString_Finish, True) ; #DEBUG_LINE_NO:598
      Self.SetPuzzleSolutionRef(True) ; #DEBUG_LINE_NO:601
      Self.StartSolutionMovementTimer() ; #DEBUG_LINE_NO:603
    Else ; #DEBUG_LINE_NO:
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False ; #DEBUG_LINE_NO:607
        MQ104A.SetStage(MQ104APuzzleCompletedStage) ; #DEBUG_LINE_NO:608
      EndIf ; #DEBUG_LINE_NO:
      PuzzleComplete = True ; #DEBUG_LINE_NO:611
      Self.DisableNoWait(False) ; #DEBUG_LINE_NO:612
      If puzzleSolutionRef ; #DEBUG_LINE_NO:614
        Self.PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success, "", True) ; #DEBUG_LINE_NO:615
      EndIf ; #DEBUG_LINE_NO:
      ObjectReference puzzleref = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:618
      ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:619
      Int I = 0 ; #DEBUG_LINE_NO:621
      While I < Rings.Length ; #DEBUG_LINE_NO:622
        sbringpuzzlenewscript:ringdata theRing = Rings[I] ; #DEBUG_LINE_NO:623
        Self.StopSoundInstanceIfSet(theRing.ringToneInstance) ; #DEBUG_LINE_NO:624
        I += 1 ; #DEBUG_LINE_NO:625
      EndWhile ; #DEBUG_LINE_NO:
      Self.StopSoundInstanceIfSet(instanceAllTuning) ; #DEBUG_LINE_NO:627
      WwiseEvent_ShakeController_p5_p5_02.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:629
      Int instanceSuccess = wSuccessEvent.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:631
      Self.RegisterForAnimationEvent(puzzleref, puzzleEventString_ReactionEnd) ; #DEBUG_LINE_NO:632
      Self.PlayPuzzleAnimation(puzzleref, puzzleAnimationString_Close, "", True) ; #DEBUG_LINE_NO:633
      Int instanceCloseAnimation = wCloseAnimationEvent.Play(puzzleref, None, None) ; #DEBUG_LINE_NO:634
      Int count = 0 ; #DEBUG_LINE_NO:635
      ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:636
      While count < myDebris.Length ; #DEBUG_LINE_NO:637
        ObjectReference currentObjectReference = myDebris[count] ; #DEBUG_LINE_NO:638
        currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False) ; #DEBUG_LINE_NO:639
        count += 1 ; #DEBUG_LINE_NO:640
      EndWhile ; #DEBUG_LINE_NO:
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:643
      count = 0 ; #DEBUG_LINE_NO:645
      While count < myDebris.Length ; #DEBUG_LINE_NO:646
        Float fRandom = Utility.RandomFloat(0.300000012, 1.399999976) ; #DEBUG_LINE_NO:647
        ObjectReference currentobjectreference = myDebris[count] ; #DEBUG_LINE_NO:648
        currentobjectreference.ApplyHavokImpulse(0.0, 0.0, 1.0, fRandom) ; #DEBUG_LINE_NO:649
        count += 1 ; #DEBUG_LINE_NO:650
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == puzzleEventString_ReactionEnd ; #DEBUG_LINE_NO:661
    If QuestToCheck as Bool && StageToSet > -1 ; #DEBUG_LINE_NO:662
      QuestToCheck.SetStage(StageToSet) ; #DEBUG_LINE_NO:663
    EndIf ; #DEBUG_LINE_NO:
    Self.SendCustomEvent("sbringpuzzlenewscript_PuzzleSolvedEvent", None) ; #DEBUG_LINE_NO:668
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:670
    If powerTriggerEnableMarkerRef ; #DEBUG_LINE_NO:671
      powerTriggerEnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:672
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:675
    Self.StopSoundInstanceIfSet(instanceRingsIdling) ; #DEBUG_LINE_NO:676
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:679
    Self.UnregisterForAnimationEvent(puzzleRef, puzzleEventString_ReactionEnd) ; #DEBUG_LINE_NO:680
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.ResetPuzzle(False) ; #DEBUG_LINE_NO:686
EndEvent

Event OnUnload()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:691
    Self.CancelAllTimers() ; #DEBUG_LINE_NO:692
    Self.ClearSolutionRef() ; #DEBUG_LINE_NO:693
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function ResetPuzzle(Bool override)
  If PuzzleComplete == False || override ; #DEBUG_LINE_NO:699
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:700
      currentSolutionIndex = 0 ; #DEBUG_LINE_NO:702
      Self.SetPuzzleSolutionRef(False) ; #DEBUG_LINE_NO:703
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:705
      Self.PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_Reset, "", False) ; #DEBUG_LINE_NO:706
      Self.StopSoundInstanceIfSet(instanceRingsIdling) ; #DEBUG_LINE_NO:707
      ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:709
      If powerTriggerEnableMarkerRef ; #DEBUG_LINE_NO:710
        powerTriggerEnableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:711
      EndIf ; #DEBUG_LINE_NO:
      Self.EnableNoWait(False) ; #DEBUG_LINE_NO:714
      PlayerIsInTrigger = False ; #DEBUG_LINE_NO:715
      PuzzleInitialized = False ; #DEBUG_LINE_NO:716
      If override ; #DEBUG_LINE_NO:717
        PuzzleComplete = False ; #DEBUG_LINE_NO:718
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StopSoundInstanceIfSet(Int aiSoundInstance)
  If aiSoundInstance > -1 ; #DEBUG_LINE_NO:725
    wwiseevent.StopInstance(aiSoundInstance) ; #DEBUG_LINE_NO:726
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StopSounds()
  Int I = 0 ; #DEBUG_LINE_NO:731
  While I < Rings.Length ; #DEBUG_LINE_NO:732
    Self.StopSoundInstanceIfSet(Rings[I].ringToneInstance) ; #DEBUG_LINE_NO:733
    I += 1 ; #DEBUG_LINE_NO:734
  EndWhile ; #DEBUG_LINE_NO:
  Self.StopSoundInstanceIfSet(instanceAllTuning) ; #DEBUG_LINE_NO:736
  Self.StopSoundInstanceIfSet(instanceRingsIdling) ; #DEBUG_LINE_NO:737
EndFunction

Function testmovetosolution()
  Game.GetPlayer().MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:741
EndFunction

Function DebugTraceSolutionData()
  Int I = 0 ; #DEBUG_LINE_NO:746
  While I < puzzleSolutions.Length ; #DEBUG_LINE_NO:747
    sbringpuzzlenewscript:solutiondata thePuzzleSolution = puzzleSolutions[I] ; #DEBUG_LINE_NO:748
    I += 1 ; #DEBUG_LINE_NO:750
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function debugSetSolutionCount(Int newCount)
  solutionCount = newCount ; #DEBUG_LINE_NO:756
  Self.ResetPuzzleSolutions() ; #DEBUG_LINE_NO:757
  Self.ResetPuzzle(False) ; #DEBUG_LINE_NO:758
  Self.CheckRotateRingsStart() ; #DEBUG_LINE_NO:759
EndFunction

Function debugSetSolutionTimes(Float startTime, Float minTime)
  solutionMovementTimeStart = startTime ; #DEBUG_LINE_NO:763
  solutionMovementTimeMin = minTime ; #DEBUG_LINE_NO:764
EndFunction
