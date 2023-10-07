ScriptName SBRingPuzzleScript Extends ObjectReference conditional
{ runs the starborn temple puzzle
    starts tracking the player's position relative to the "solution spot" when player enters trigger
    updates animation variables on puzzle to modify how "tuned" each ring is
    complete puzzle when the player is at "solution spot" (within a tolerance) }

;-- Structs -----------------------------------------
Struct ringData
  wwiseevent ringToneEvent
  Int ringToneInstance = -1
  wwiseevent successEvent
  String ringTuningSoundString
  Float solutionPosition = 0.0
EndStruct


;-- Variables ---------------------------------------
Int instanceRingMovement
Int overallTuningCount = 0
Int playerMovementTimerID = 1 Const
Float playerMovementTimerSeconds = 0.5 Const
ObjectReference puzzleSolutionRef
Float puzzleX
Float puzzleY
Float puzzleZ
Int requiredTuningCount
ObjectReference visibleSolutionRef

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
  { placed at solution position }
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
EndGroup

Group PuzzleData
  sbringpuzzlescript:ringdata[] Property Rings Auto mandatory
  Float Property fRingSpeedMin = 0.100000001 Auto Const
  Float Property fRingSpeedMax = 10.0 Auto Const
  Float Property minPuzzleTuningOrientation = 0.800000012 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
  Float Property puzzlePositionMaxXY = 20.0 Auto Const
  { how far away max can the "solution" position be? }
  Float Property puzzlePositionMinZ = 8.0 Auto Const
  { min Z for solution }
  Float Property puzzlePositionMaxZ = 18.0 Auto Const
  { max Z for solution; (min is always 0) }
  Float Property puzzleposition_angleVmin = 0.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleVmax = 90.0 Auto Const
  { horizontal angle max }
  Float Property puzzleposition_angleHmin = 15.0 Auto Const
  { horizontal angle min }
  Float Property puzzleposition_angleHmax = 345.0 Auto Const
  { horizontal angle max }
  Float Property requiredTuningSeconds = 3.0 Auto Const
  { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }
  String Property puzzleAnimationString = "fRingTarget" Auto Const
  { animation variable to update puzzle animation based on player position }
EndGroup

Group SolutionVisibility
  GlobalVariable Property SBPuzzleSolutionVisible Auto Const
  { set to 1 to use solution visibility ref }
  String Property solutionAnimationString = "fHintVisibility" Auto Const
  { animation variable to update solution animation based on player position }
  Form Property SolutionVisibilityMarker Auto Const
  { placed at solution position if SBPuzzleSolutionVisible > 0 }
  Float Property minPuzzleTuningOrientationSolution = 0.920000017 Auto Const
  { how close is required to total puzzle completion to count as "tuned"? }
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
  { TEMP. For LC165, using this to disable the CheckRings function and avoid script spam. }
  GlobalVariable Property MQAutoSolvePuzzle Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  requiredTuningCount = Math.Floor(requiredTuningSeconds / playerMovementTimerSeconds) ; #DEBUG_LINE_NO:149
  Self.ResetPuzzleSolution(False) ; #DEBUG_LINE_NO:151
EndEvent

Function ResetPuzzleSolution(Bool bUseMax)
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:156
  puzzleX = puzzleRef.GetPositionX() ; #DEBUG_LINE_NO:158
  puzzleY = puzzleRef.GetPositionY() ; #DEBUG_LINE_NO:159
  puzzleZ = puzzleRef.GetPositionZ() ; #DEBUG_LINE_NO:160
  Float solutionX = 0.0 ; #DEBUG_LINE_NO:162
  Float solutionY = 0.0 ; #DEBUG_LINE_NO:163
  Float solutionZ = 0.0 ; #DEBUG_LINE_NO:164
  Float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax) ; #DEBUG_LINE_NO:169
  Float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax) ; #DEBUG_LINE_NO:170
  Float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ) ; #DEBUG_LINE_NO:171
  If bUseMax ; #DEBUG_LINE_NO:172
    solutionRadius = puzzlePositionMaxZ ; #DEBUG_LINE_NO:173
  EndIf ; #DEBUG_LINE_NO:
  solutionZ = solutionRadius * Math.sin(angleV) ; #DEBUG_LINE_NO:184
  Float radiusH = Math.sqrt(solutionRadius * solutionRadius - solutionZ * solutionZ) ; #DEBUG_LINE_NO:190
  solutionY = Math.sin(angleH) * radiusH ; #DEBUG_LINE_NO:196
  solutionX = Math.cos(angleH) * radiusH ; #DEBUG_LINE_NO:200
  Rings[0].solutionPosition = solutionX ; #DEBUG_LINE_NO:205
  Rings[1].solutionPosition = solutionY ; #DEBUG_LINE_NO:206
  Rings[2].solutionPosition = solutionZ ; #DEBUG_LINE_NO:207
  Self.DebugTraceRingData() ; #DEBUG_LINE_NO:211
  Self.CreateSolutionRef() ; #DEBUG_LINE_NO:213
EndFunction

Function CreateSolutionRef()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:218
  If puzzleSolutionRef == None ; #DEBUG_LINE_NO:221
    puzzleSolutionRef = puzzleRef.PlaceAtMe(MarkerDummyA, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:223
  EndIf ; #DEBUG_LINE_NO:
  puzzleSolutionRef.MoveTo(puzzleRef, Rings[0].solutionPosition, Rings[1].solutionPosition, Rings[2].solutionPosition, True, False) ; #DEBUG_LINE_NO:228
  If SBPuzzleSolutionVisible.GetValue() > 0.0 ; #DEBUG_LINE_NO:230
    If visibleSolutionRef == None ; #DEBUG_LINE_NO:231
      visibleSolutionRef = puzzleSolutionRef.PlaceAtMe(SolutionVisibilityMarker, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:232
    Else ; #DEBUG_LINE_NO:
      visibleSolutionRef.MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:234
    EndIf ; #DEBUG_LINE_NO:
    visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0) ; #DEBUG_LINE_NO:236
    visibleSolutionRef.Enable(False) ; #DEBUG_LINE_NO:237
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearSolutionRef()
  puzzleSolutionRef = None ; #DEBUG_LINE_NO:243
  If visibleSolutionRef ; #DEBUG_LINE_NO:244
    visibleSolutionRef.Disable(False) ; #DEBUG_LINE_NO:245
    visibleSolutionRef.Delete() ; #DEBUG_LINE_NO:246
    visibleSolutionRef = None ; #DEBUG_LINE_NO:247
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.getplayer() as ObjectReference) ; #DEBUG_LINE_NO:252
    Self.CheckRotateRingsStart() ; #DEBUG_LINE_NO:254
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If PuzzleComplete == False && (akActionRef == Game.getplayer() as ObjectReference) ; #DEBUG_LINE_NO:259
    Self.CheckRotateRingsStart() ; #DEBUG_LINE_NO:261
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == playerMovementTimerID ; #DEBUG_LINE_NO:267
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:268
      Self.RotateRings(True) ; #DEBUG_LINE_NO:269
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckRotateRingsStart()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:276
    PlayerIsInTrigger = Self.IsInTrigger(Game.getplayer() as ObjectReference) ; #DEBUG_LINE_NO:277
    Cell myCell = Self.GetParentCell() ; #DEBUG_LINE_NO:278
    If PlayerIsInTrigger ; #DEBUG_LINE_NO:280
      myCell.SetGravityScale(0.0) ; #DEBUG_LINE_NO:282
      Self.InitializePuzzle() ; #DEBUG_LINE_NO:283
      Self.RotateRings(True) ; #DEBUG_LINE_NO:284
    Else ; #DEBUG_LINE_NO:
      Self.RotateRings(False) ; #DEBUG_LINE_NO:286
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RotateRings(Bool usePlayerPosition)
  If PuzzleComplete == False && (PlayerIsInTrigger || usePlayerPosition == False) ; #DEBUG_LINE_NO:292
    ObjectReference playerRef = Game.getplayer() as ObjectReference ; #DEBUG_LINE_NO:294
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:296
    Float distanceToSolution = Game.getplayer().GetDistance(puzzleSolutionRef) ; #DEBUG_LINE_NO:298
    Float maxDistanceToSolution = puzzlePositionMaxZ * 2.0 ; #DEBUG_LINE_NO:299
    distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution) ; #DEBUG_LINE_NO:301
    Float fTotalPuzzleComplete = 1.0 - distanceToSolution / maxDistanceToSolution ; #DEBUG_LINE_NO:304
    wwiseevent.UpdateInstanceRTPC(instanceAllTuning, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete) ; #DEBUG_LINE_NO:308
    wwiseevent.UpdateInstanceRTPC(instanceRingsIdling, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete) ; #DEBUG_LINE_NO:309
    puzzleRef.SetAnimationVariableFloat(puzzleAnimationString, fTotalPuzzleComplete) ; #DEBUG_LINE_NO:312
    If visibleSolutionRef ; #DEBUG_LINE_NO:313
      visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, fTotalPuzzleComplete) ; #DEBUG_LINE_NO:314
    EndIf ; #DEBUG_LINE_NO:
    If fTotalPuzzleComplete >= minPuzzleTuningOrientation && visibleSolutionRef == None || fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution ; #DEBUG_LINE_NO:317
      overallTuningCount += 1 ; #DEBUG_LINE_NO:318
      If overallTuningCount >= requiredTuningCount ; #DEBUG_LINE_NO:320
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:321
        Self.CompletePuzzle() ; #DEBUG_LINE_NO:323
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      overallTuningCount = 0 ; #DEBUG_LINE_NO:326
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(playerMovementTimerSeconds, playerMovementTimerID) ; #DEBUG_LINE_NO:330
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function testmovetosolution()
  Game.getplayer().MoveTo(puzzleSolutionRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:335
EndFunction

Function DebugTraceRingData()
  Int I = 0 ; #DEBUG_LINE_NO:339
  While I < 3 ; #DEBUG_LINE_NO:340
    sbringpuzzlescript:ringdata theRing = Rings[I] ; #DEBUG_LINE_NO:341
    I += 1 ; #DEBUG_LINE_NO:343
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function InitializePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:349
    If PuzzleInitialized == False ; #DEBUG_LINE_NO:351
      PuzzleInitialized = True ; #DEBUG_LINE_NO:352
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:354
      If PuzzleComplete ; #DEBUG_LINE_NO:363
        Return  ; #DEBUG_LINE_NO:363
      EndIf ; #DEBUG_LINE_NO:
      Int instanceRumble = wRumble.Play(Game.getplayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:366
      Self.GetLinkedRef(SBRumbleDebrisEnableMarkerKeyword).Enable(False) ; #DEBUG_LINE_NO:367
      WwiseEvent_ShakeController_p5_p5_05.Play(Game.getplayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:368
      Utility.Wait(2.0) ; #DEBUG_LINE_NO:370
      If puzzleRef ; #DEBUG_LINE_NO:372
        wRingsRelease.Play(puzzleRef, None, None) ; #DEBUG_LINE_NO:373
        Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:374
        wOpenAnimation.Play(puzzleRef, None, None) ; #DEBUG_LINE_NO:375
        puzzleRef.PlayAnimationAndWait("Open", "Opened") ; #DEBUG_LINE_NO:377
      EndIf ; #DEBUG_LINE_NO:
      If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False ; #DEBUG_LINE_NO:383
        MQ104A.SetStage(MQ104APuzzleStartedStage) ; #DEBUG_LINE_NO:384
      EndIf ; #DEBUG_LINE_NO:
      Self.InitializeRings() ; #DEBUG_LINE_NO:388
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function InitializeRings()
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:396
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:397
  puzzleRef.SetAnimationVariableFloat("Speed", 0.029999999) ; #DEBUG_LINE_NO:398
  Int count = 0 ; #DEBUG_LINE_NO:399
  ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:400
  While count < myDebris.Length ; #DEBUG_LINE_NO:402
    ObjectReference currentObjectReference = myDebris[count] ; #DEBUG_LINE_NO:403
    If currentObjectReference.Is3DLoaded() ; #DEBUG_LINE_NO:404
      currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False) ; #DEBUG_LINE_NO:405
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:407
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:409
  If DisableCheckRings ; #DEBUG_LINE_NO:412
    Return  ; #DEBUG_LINE_NO:413
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:416
  While I < Rings.Length ; #DEBUG_LINE_NO:417
    sbringpuzzlescript:ringdata theRing = Rings[I] ; #DEBUG_LINE_NO:418
    theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0) ; #DEBUG_LINE_NO:419
    I += 1 ; #DEBUG_LINE_NO:420
  EndWhile ; #DEBUG_LINE_NO:
  instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0) ; #DEBUG_LINE_NO:423
  instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0) ; #DEBUG_LINE_NO:424
EndFunction

Function CompletePuzzle()
  Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:429
    If MQ104A.IsRunning() && MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False ; #DEBUG_LINE_NO:432
      MQ104A.SetStage(MQ104APuzzleCompletedStage) ; #DEBUG_LINE_NO:433
    EndIf ; #DEBUG_LINE_NO:
    PuzzleComplete = True ; #DEBUG_LINE_NO:436
    Self.DisableNoWait(False) ; #DEBUG_LINE_NO:437
    If visibleSolutionRef ; #DEBUG_LINE_NO:439
      visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0) ; #DEBUG_LINE_NO:440
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:443
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:444
    Int I = 0 ; #DEBUG_LINE_NO:446
    While I < Rings.Length ; #DEBUG_LINE_NO:447
      sbringpuzzlescript:ringdata theRing = Rings[I] ; #DEBUG_LINE_NO:448
      wwiseevent.StopInstance(theRing.ringToneInstance) ; #DEBUG_LINE_NO:449
      I += 1 ; #DEBUG_LINE_NO:450
    EndWhile ; #DEBUG_LINE_NO:
    wwiseevent.StopInstance(instanceAllTuning) ; #DEBUG_LINE_NO:452
    WwiseEvent_ShakeController_p5_p5_02.Play(Game.getplayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:454
    Int instanceSuccess = wSuccessEvent.Play(Game.getplayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:456
    Self.RegisterForAnimationEvent(puzzleRef, "ReactionEnd") ; #DEBUG_LINE_NO:457
    puzzleRef.PlayAnimation("Close") ; #DEBUG_LINE_NO:458
    Int instanceCloseAnimation = wCloseAnimationEvent.Play(puzzleRef, None, None) ; #DEBUG_LINE_NO:459
    Int count = 0 ; #DEBUG_LINE_NO:460
    ObjectReference[] myDebris = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:461
    While count < myDebris.Length ; #DEBUG_LINE_NO:462
      ObjectReference currentObjectReference = myDebris[count] ; #DEBUG_LINE_NO:463
      currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, False) ; #DEBUG_LINE_NO:464
      count += 1 ; #DEBUG_LINE_NO:465
    EndWhile ; #DEBUG_LINE_NO:
    WwiseEvent_ShakeController_p5_p5_05.Play(Game.getplayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:468
    count = 0 ; #DEBUG_LINE_NO:470
    While count < myDebris.Length ; #DEBUG_LINE_NO:471
      Float fRandom = Utility.RandomFloat(0.300000012, 1.399999976) ; #DEBUG_LINE_NO:472
      ObjectReference currentobjectreference = myDebris[count] ; #DEBUG_LINE_NO:473
      currentobjectreference.ApplyHavokImpulse(0.0, 0.0, 1.0, fRandom) ; #DEBUG_LINE_NO:474
      count += 1 ; #DEBUG_LINE_NO:475
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "ReactionEnd" ; #DEBUG_LINE_NO:486
    If QuestToCheck as Bool && StageToSet > -1 ; #DEBUG_LINE_NO:487
      QuestToCheck.SetStage(StageToSet) ; #DEBUG_LINE_NO:488
    EndIf ; #DEBUG_LINE_NO:
    Self.SendCustomEvent("sbringpuzzlescript_PuzzleSolvedEvent", None) ; #DEBUG_LINE_NO:493
    ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:495
    If powerTriggerEnableMarkerRef ; #DEBUG_LINE_NO:496
      powerTriggerEnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:497
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:500
    wwiseevent.StopInstance(instanceRingsIdling) ; #DEBUG_LINE_NO:501
    ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:504
    Self.UnregisterForAnimationEvent(puzzleRef, "ReactionEnd") ; #DEBUG_LINE_NO:505
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.ResetPuzzle(False) ; #DEBUG_LINE_NO:511
EndEvent

Event OnUnload()
  Self.ClearSolutionRef() ; #DEBUG_LINE_NO:516
EndEvent

Function ResetPuzzle(Bool override)
  If PuzzleComplete == False || override ; #DEBUG_LINE_NO:521
    Guard ringRotationGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:522
      Self.CreateSolutionRef() ; #DEBUG_LINE_NO:524
      ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword) ; #DEBUG_LINE_NO:526
      puzzleRef.PlayAnimation("Reset") ; #DEBUG_LINE_NO:527
      wwiseevent.StopInstance(instanceRingsIdling) ; #DEBUG_LINE_NO:528
      ObjectReference powerTriggerEnableMarkerRef = Self.GetLinkedRef(SBPowerTriggerEnableMarkerKeyword) ; #DEBUG_LINE_NO:530
      If powerTriggerEnableMarkerRef ; #DEBUG_LINE_NO:531
        powerTriggerEnableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:532
      EndIf ; #DEBUG_LINE_NO:
      Self.EnableNoWait(False) ; #DEBUG_LINE_NO:535
      PlayerIsInTrigger = False ; #DEBUG_LINE_NO:536
      PuzzleInitialized = False ; #DEBUG_LINE_NO:537
      If override ; #DEBUG_LINE_NO:538
        PuzzleComplete = False ; #DEBUG_LINE_NO:539
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StopSounds()
  Int I = 0 ; #DEBUG_LINE_NO:546
  While I < Rings.Length ; #DEBUG_LINE_NO:547
    wwiseevent.StopInstance(Rings[I].ringToneInstance) ; #DEBUG_LINE_NO:548
    I += 1 ; #DEBUG_LINE_NO:549
  EndWhile ; #DEBUG_LINE_NO:
  wwiseevent.StopInstance(instanceAllTuning) ; #DEBUG_LINE_NO:551
  wwiseevent.StopInstance(instanceRingsIdling) ; #DEBUG_LINE_NO:552
EndFunction
