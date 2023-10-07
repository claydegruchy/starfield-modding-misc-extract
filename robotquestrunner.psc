ScriptName RobotQuestRunner Extends Actor

;-- Variables ---------------------------------------
Float AcceptableDistance = 2.299999952
Float AcceptableDistanceSpace = 100.0
Int CombatState = 3
ObjectReference CombatTarget
Quest CurrentQuest
ObjectReference CurrentTarget
Int CurrentTimePassedInDialog = 0
Int CurrentTimePassedSelectingQuest = 0
Int CurrentTimePassedSelectingTarget = 0
Int DialogueState = 2
Int DialogueStateIterator = 0
inputenablelayer DisableForTesting
Int FailedInteractionThreshold = 10
Int IdleState = 0
Int InteractState = 4
Int MaxQuestsToComplete = 1
Int MaxTimeBeforeDialogFailure = 240
Int MaxTimeBeforeFailureSelectingQuest = 150
Int MaxTimeBeforeFailureSelectingTarget = 300
Int MaxTimeBeforeKillAllSelectingTarget = 180
Int MenuState = 5
Int PathingState = 1
Int QuestsComplete = 0
Bool TestPaused = False
Bool TestSuccessful = False
Int WaitDuration = 1
String lastState = "None"
Int previousStage = -1
Int previousTarget = 0

;-- Properties --------------------------------------
Int Property Dialogue_Substate_Exit = 0 AutoReadOnly
Int Property Dialogue_Substate_Skip = 1 AutoReadOnly
Int Property Dialogue_Substate_MAX = 2 AutoReadOnly

;-- Functions ---------------------------------------

Function UpdateState()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Bool Function StateRequestsFinish()
  Return False ; #DEBUG_LINE_NO:320
EndFunction

Bool Function IsValidState(String asState)
  If asState == "None" ; #DEBUG_LINE_NO:328
    Return False ; #DEBUG_LINE_NO:329
  ElseIf asState != "PlayerInDialogue" || asState != "PlayerInMessageBox" || asState != "Inert" || asState != "TestCompleted" || asState != "SelectingTarget" || asState != "SelectingQuest" ; #DEBUG_LINE_NO:330
    Return False ; #DEBUG_LINE_NO:331
  Else ; #DEBUG_LINE_NO:
    Return True ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MakeGameplayBotRequest(ObjectReference Target, Int aiState)
  If Self.GetState() != "CodeControlled" ; #DEBUG_LINE_NO:340
    Game.RequestGameplayBotState(Target, aiState) ; #DEBUG_LINE_NO:341
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RequestToggleCodeControl(Bool abCodeWantsControl, String NewState)
  String currentState = Self.GetState() ; #DEBUG_LINE_NO:346
  If currentState == "CodeControlled" && !abCodeWantsControl ; #DEBUG_LINE_NO:347
    If Game.IsPlayerInDialogue() ; #DEBUG_LINE_NO:349
      Self.GotoState("PlayerInDialogue") ; #DEBUG_LINE_NO:350
    ElseIf Game.IsPlayerInMessageBox() ; #DEBUG_LINE_NO:351
      Self.GotoState("PlayerInMessageBox") ; #DEBUG_LINE_NO:352
    ElseIf Self.IsValidQuestTarget(CurrentQuest, CurrentTarget) && Self.IsValidState(NewState) ; #DEBUG_LINE_NO:353
      Self.GotoState(NewState) ; #DEBUG_LINE_NO:354
    ElseIf Self.IsValidQuestTarget(CurrentQuest, CurrentTarget) ; #DEBUG_LINE_NO:357
      If !Self.IsBestInteractionTarget() ; #DEBUG_LINE_NO:358
        Self.GotoState("SelectingTarget") ; #DEBUG_LINE_NO:359
      ElseIf Self.GetDistance(CurrentTarget) < AcceptableDistance ; #DEBUG_LINE_NO:360
        Game.RequestGameplayBotState(CurrentTarget, InteractState) ; #DEBUG_LINE_NO:362
      Else ; #DEBUG_LINE_NO:
        Game.RequestGameplayBotState(CurrentTarget, PathingState) ; #DEBUG_LINE_NO:365
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.CheckTransitionToNewQuestOrTarget() ; #DEBUG_LINE_NO:368
    EndIf ; #DEBUG_LINE_NO:
  ElseIf currentState != "CodeControlled" && abCodeWantsControl ; #DEBUG_LINE_NO:372
    Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:373
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartTest()
  Actor currentCombatTarget = None ; #DEBUG_LINE_NO:383
  If Self.IsInCombat() ; #DEBUG_LINE_NO:384
    currentCombatTarget = Self.GetCombatTarget() ; #DEBUG_LINE_NO:385
    Self.StopCombat() ; #DEBUG_LINE_NO:386
  EndIf ; #DEBUG_LINE_NO:
  Self.SetupPlayerForRobotTest() ; #DEBUG_LINE_NO:389
  TestSuccessful = True ; #DEBUG_LINE_NO:390
  If currentCombatTarget != None ; #DEBUG_LINE_NO:392
    Self.StartCombat(currentCombatTarget as ObjectReference, False) ; #DEBUG_LINE_NO:393
    CombatTarget = currentCombatTarget as ObjectReference ; #DEBUG_LINE_NO:394
    Game.RequestGameplayBotState(CombatTarget, CombatState) ; #DEBUG_LINE_NO:395
    Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:396
  Else ; #DEBUG_LINE_NO:
    Self.GotoState("SelectingQuest") ; #DEBUG_LINE_NO:398
  EndIf ; #DEBUG_LINE_NO:
  While !Self.StateRequestsFinish() ; #DEBUG_LINE_NO:401
    String currentState = Self.GetState() ; #DEBUG_LINE_NO:402
    If currentState != lastState ; #DEBUG_LINE_NO:404
      lastState = currentState ; #DEBUG_LINE_NO:406
    EndIf ; #DEBUG_LINE_NO:
    If !TestPaused && Self.GetState() != "CodeControlled" ; #DEBUG_LINE_NO:408
      If Game.IsPlayerInDialogue() && Self.GetState() != "PlayerInDialogue" ; #DEBUG_LINE_NO:409
        Self.GotoState("PlayerInDialogue") ; #DEBUG_LINE_NO:410
      EndIf ; #DEBUG_LINE_NO:
      If Game.IsPlayerInMessageBox() && Self.GetState() != "PlayerInMessageBox" ; #DEBUG_LINE_NO:412
        Self.GotoState("PlayerInMessageBox") ; #DEBUG_LINE_NO:413
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.UpdateState() ; #DEBUG_LINE_NO:416
    Utility.WaitMenuPause(WaitDuration as Float) ; #DEBUG_LINE_NO:417
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Quest Function SelectQuest()
  Quest[] activeQuestList = Game.GetPlayerActiveQuests() ; #DEBUG_LINE_NO:423
  Quest selectedQuest = None ; #DEBUG_LINE_NO:424
  If activeQuestList.Length > 0 ; #DEBUG_LINE_NO:425
    selectedQuest = activeQuestList[0] ; #DEBUG_LINE_NO:427
  EndIf ; #DEBUG_LINE_NO:
  Return selectedQuest ; #DEBUG_LINE_NO:429
EndFunction

ObjectReference Function SelectQuestTarget(Quest aQuest)
  ObjectReference returnTarget = None ; #DEBUG_LINE_NO:435
  If aQuest != None ; #DEBUG_LINE_NO:436
    Int currStage = aQuest.GetStage() ; #DEBUG_LINE_NO:437
    Int Target = 0 ; #DEBUG_LINE_NO:438
    ObjectReference[] targets = aQuest.GetCurrentStageTargets() ; #DEBUG_LINE_NO:440
    If previousStage != currStage ; #DEBUG_LINE_NO:442
      previousStage = currStage ; #DEBUG_LINE_NO:443
    ElseIf targets.Length > 1 ; #DEBUG_LINE_NO:444
      Target = previousTarget + 1 ; #DEBUG_LINE_NO:445
      If Target > targets.Length ; #DEBUG_LINE_NO:447
        Target = 0 ; #DEBUG_LINE_NO:448
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If targets.Length > 0 ; #DEBUG_LINE_NO:452
      returnTarget = targets[Target] ; #DEBUG_LINE_NO:454
    EndIf ; #DEBUG_LINE_NO:
    previousTarget = Target ; #DEBUG_LINE_NO:457
  EndIf ; #DEBUG_LINE_NO:
  Return returnTarget ; #DEBUG_LINE_NO:459
EndFunction

Bool Function IsBestInteractionTarget()
  Bool isBest = True ; #DEBUG_LINE_NO:463
  If CurrentQuest != None ; #DEBUG_LINE_NO:464
    ObjectReference[] targets = CurrentQuest.GetCurrentStageTargets() ; #DEBUG_LINE_NO:465
    isBest = targets.Length == 1 ; #DEBUG_LINE_NO:466
  EndIf ; #DEBUG_LINE_NO:
  Return isBest ; #DEBUG_LINE_NO:468
EndFunction

Actor Function SelectCombatTarget()
  Actor returnTarget = None ; #DEBUG_LINE_NO:472
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:474
  Actor[] allActors = player.GetCurrentLocation().GetActors(None, None) ; #DEBUG_LINE_NO:475
  Float closestDistance = -1.0 ; #DEBUG_LINE_NO:477
  Int actorToTest = 0 ; #DEBUG_LINE_NO:478
  While actorToTest < allActors.Length ; #DEBUG_LINE_NO:479
    If !allActors[actorToTest].IsDead() && !allActors[actorToTest].IsUnconscious() && allActors[actorToTest].IsHostileToActor(player) ; #DEBUG_LINE_NO:480
      Float checkDistance = Self.GetDistance(allActors[actorToTest] as ObjectReference) ; #DEBUG_LINE_NO:481
      If closestDistance < 0.0 || checkDistance < closestDistance ; #DEBUG_LINE_NO:482
        closestDistance = checkDistance ; #DEBUG_LINE_NO:483
        returnTarget = allActors[actorToTest] ; #DEBUG_LINE_NO:484
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    actorToTest += 1 ; #DEBUG_LINE_NO:487
  EndWhile ; #DEBUG_LINE_NO:
  If returnTarget != None ; #DEBUG_LINE_NO:490
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnTarget ; #DEBUG_LINE_NO:496
EndFunction

Bool Function IsValidQuestTarget(Quest aQuest, ObjectReference aQuestTarget)
  Bool returnValue = False ; #DEBUG_LINE_NO:500
  If aQuest != None && aQuestTarget != None ; #DEBUG_LINE_NO:501
    ObjectReference[] targets = aQuest.GetCurrentStageTargets() ; #DEBUG_LINE_NO:502
    Int targetToTest = 0 ; #DEBUG_LINE_NO:503
    While targetToTest < targets.Length && !returnValue ; #DEBUG_LINE_NO:504
      returnValue = targets[targetToTest] == aQuestTarget ; #DEBUG_LINE_NO:505
      targetToTest += 1 ; #DEBUG_LINE_NO:506
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnValue ; #DEBUG_LINE_NO:509
EndFunction

; Fixup hacks for debug-only function: MakeQuestNameSave
Function MakeQuestNameSave(String asStringToInsertToName)
  String questName = "NoQuest" ; #DEBUG_LINE_NO:513
  Int questStage = 0 ; #DEBUG_LINE_NO:514
  If CurrentQuest != None ; #DEBUG_LINE_NO:515
    questName = questName ; #DEBUG_LINE_NO:516
    questStage = CurrentQuest.GetStage() ; #DEBUG_LINE_NO:517
  EndIf ; #DEBUG_LINE_NO:
  String saveName = "RobotTest" + asStringToInsertToName + "_" + questName + "_" + questStage as String ; #DEBUG_LINE_NO:519
EndFunction

Function CheckTransitionToNewQuestOrTarget()
  If Self.GetState() != "Inert" ; #DEBUG_LINE_NO:524
    If CurrentQuest == None || CurrentQuest.IsCompleted() ; #DEBUG_LINE_NO:525
      Self.GotoState("SelectingQuest") ; #DEBUG_LINE_NO:526
    Else ; #DEBUG_LINE_NO:
      CurrentTarget = None ; #DEBUG_LINE_NO:528
      Self.GotoState("SelectingTarget") ; #DEBUG_LINE_NO:529
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SaveAndCheckTransitionToNewQuestOrTarget()
  If Self.GetState() != "Inert" ; #DEBUG_LINE_NO:535
    Self.MakeQuestNameSave("") ; #DEBUG_LINE_NO:536
    Self.CheckTransitionToNewQuestOrTarget() ; #DEBUG_LINE_NO:537
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SucceedAutomatedTest()
  TestSuccessful = True ; #DEBUG_LINE_NO:543
  Self.GotoState("TestCompleted") ; #DEBUG_LINE_NO:544
EndFunction

Function FailAutomatedTest()
  TestSuccessful = False ; #DEBUG_LINE_NO:550
  Self.GotoState("TestCompleted") ; #DEBUG_LINE_NO:551
EndFunction

Event OnInit()
  ActorValue playerConfidence = Game.GetForm(701) as ActorValue ; #DEBUG_LINE_NO:559
  If playerConfidence != None ; #DEBUG_LINE_NO:560
    Self.SetValue(playerConfidence, 4.0) ; #DEBUG_LINE_NO:561
  EndIf ; #DEBUG_LINE_NO:
  Self.GotoState("Idle") ; #DEBUG_LINE_NO:563
EndEvent

; WARNING: possibly inoperative debug function OnPlayerLoadGame
Event OnPlayerLoadGame()
  If !::temp221 ; #DEBUG_LINE_NO:568
    If Self.IsInCombat() ; #DEBUG_LINE_NO:570
      Self.StopCombat() ; #DEBUG_LINE_NO:571
    EndIf ; #DEBUG_LINE_NO:
    TestPaused = False ; #DEBUG_LINE_NO:573
    Self.GotoState("Inert") ; #DEBUG_LINE_NO:574
  Else ; #DEBUG_LINE_NO:
    Self.CheckTransitionToNewQuestOrTarget() ; #DEBUG_LINE_NO:576
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DebugTraceAndLogError(String asTextToPrint)
  Debug.AutomatedTestLogError(asTextToPrint) ; #DEBUG_LINE_NO:583
  Debug.Trace((Self as String + " ") + asTextToPrint, 0) ; #DEBUG_LINE_NO:584
EndFunction

Function DebugTraceAndLogProgress(String asTextToPrint)
  Debug.AutomatedTestLogProgress(asTextToPrint) ; #DEBUG_LINE_NO:588
  Debug.Trace((Self as String + " ") + asTextToPrint, 0) ; #DEBUG_LINE_NO:589
EndFunction

Function TogglePauseTest()
  If TestPaused ; #DEBUG_LINE_NO:593
    Self.SetupPlayerForRobotTest() ; #DEBUG_LINE_NO:595
    TestPaused = False ; #DEBUG_LINE_NO:596
    If CurrentQuest == None || CurrentQuest.IsCompleted() ; #DEBUG_LINE_NO:597
      Self.GotoState("SelectingQuest") ; #DEBUG_LINE_NO:598
    Else ; #DEBUG_LINE_NO:
      CurrentTarget = None ; #DEBUG_LINE_NO:600
      Self.GotoState("SelectingTarget") ; #DEBUG_LINE_NO:601
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.ResetPlayerStateFromRobotTest() ; #DEBUG_LINE_NO:605
    TestPaused = True ; #DEBUG_LINE_NO:607
    Self.GotoState("Inert") ; #DEBUG_LINE_NO:608
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupPlayerForRobotTest()
  If DisableForTesting == None ; #DEBUG_LINE_NO:613
    DisableForTesting = inputenablelayer.Create() ; #DEBUG_LINE_NO:614
    DisableForTesting.DisablePlayerControls(False, True, True, False, True, False, False, True, True, True, False) ; #DEBUG_LINE_NO:615
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetPlayerStateFromRobotTest()
  DisableForTesting = None ; #DEBUG_LINE_NO:620
EndFunction

Function RoboKillAllHostile()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:635
  Actor[] allCombatTargetActors = player.GetAllCombatTargets() ; #DEBUG_LINE_NO:636
  Int actorToTest = 0 ; #DEBUG_LINE_NO:638
  While actorToTest < allCombatTargetActors.Length ; #DEBUG_LINE_NO:639
    If !allCombatTargetActors[actorToTest].IsDead() && !allCombatTargetActors[actorToTest].IsUnconscious() ; #DEBUG_LINE_NO:640
      allCombatTargetActors[actorToTest].Kill(None) ; #DEBUG_LINE_NO:642
    EndIf ; #DEBUG_LINE_NO:
    actorToTest += 1 ; #DEBUG_LINE_NO:644
  EndWhile ; #DEBUG_LINE_NO:
  spaceshipreference playerSpaceship = Self.GetCurrentShipRef() ; #DEBUG_LINE_NO:648
  spaceshipreference[] allCombatTargetShips = playerSpaceship.GetAllCombatTargets() ; #DEBUG_LINE_NO:649
  Int shipToTest = 0 ; #DEBUG_LINE_NO:651
  While shipToTest < allCombatTargetShips.Length ; #DEBUG_LINE_NO:652
    allCombatTargetShips[shipToTest].Kill(None) ; #DEBUG_LINE_NO:654
    shipToTest += 1 ; #DEBUG_LINE_NO:655
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State CodeControlled

  Event OnBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Bool Function StateRequestsFinish()
    Return False ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
State Idle

  Event OnBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnEndState(String asNewState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Inert

  Bool Function StateRequestsFinish()
    Return !TestPaused ; #DEBUG_LINE_NO:
  EndFunction

  Event OnBeginState(String asOldState)
    Self.ResetPlayerStateFromRobotTest() ; #DEBUG_LINE_NO:307
  EndEvent
EndState

;-- State -------------------------------------------
State PlayerInDialogue

  Event OnEndState(String asNewState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  ; Fixup hacks for debug-only function: UpdateState
  Function UpdateState()
    If CurrentTimePassedInDialog > MaxTimeBeforeDialogFailure ; #DEBUG_LINE_NO:
      Self.FailAutomatedTest() ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      CurrentTimePassedInDialog += WaitDuration ; #DEBUG_LINE_NO:
      Bool IsPlayerInDialogue = Game.IsPlayerInDialogue() ; #DEBUG_LINE_NO:
      If IsPlayerInDialogue ; #DEBUG_LINE_NO:
        Actor dialogueActor = None ; #DEBUG_LINE_NO:
        If dialogueActor != None && Self.GetParentCell() != dialogueActor.GetParentCell() ; #DEBUG_LINE_NO:
          Self.FailAutomatedTest() ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Int[] topics = Game.GetPlayerActiveDialogueUnsaidInfo() ; #DEBUG_LINE_NO:
        Int choiceIndex = -1 ; #DEBUG_LINE_NO:
        Int topicIndex = 0 ; #DEBUG_LINE_NO:
        While choiceIndex == -1 && topicIndex < topics.Length ; #DEBUG_LINE_NO:
          If topics[topicIndex] > 0 ; #DEBUG_LINE_NO:
            choiceIndex = topicIndex ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
          topicIndex += 1 ; #DEBUG_LINE_NO:
        EndWhile ; #DEBUG_LINE_NO:
        If choiceIndex != -1 ; #DEBUG_LINE_NO:
          Game.RequestDialogueSelect(choiceIndex) ; #DEBUG_LINE_NO:
        ElseIf DialogueStateIterator == Self.Dialogue_Substate_Exit ; #DEBUG_LINE_NO:
          Game.RequestDialogueExit() ; #DEBUG_LINE_NO:
        ElseIf DialogueStateIterator == Self.Dialogue_Substate_Skip ; #DEBUG_LINE_NO:
          Game.RequestDialogueSkip() ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        DialogueStateIterator = (DialogueStateIterator + 1) % Self.Dialogue_Substate_MAX ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.SaveAndCheckTransitionToNewQuestOrTarget() ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedInDialog = 0 ; #DEBUG_LINE_NO:218
    DialogueStateIterator = Self.Dialogue_Substate_Exit ; #DEBUG_LINE_NO:219
  EndEvent
EndState

;-- State -------------------------------------------
State PlayerInMessageBox

  Event OnBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnEndState(String asNewState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Function UpdateState()
    If Game.IsPlayerInMessageBox() ; #DEBUG_LINE_NO:
      Game.RequestMessageBoxSelect(1) ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.CheckTransitionToNewQuestOrTarget() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
State SelectingQuest

  Event OnEndState(String asNewState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Function UpdateState()
    If CurrentQuest != None && CurrentQuest.IsCompleted() ; #DEBUG_LINE_NO:
      QuestsComplete += 1 ; #DEBUG_LINE_NO:
      If QuestsComplete >= MaxQuestsToComplete ; #DEBUG_LINE_NO:
        Self.SucceedAutomatedTest() ; #DEBUG_LINE_NO:
        Return  ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      CurrentQuest = None ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If CurrentQuest == None ; #DEBUG_LINE_NO:
      CurrentQuest = Self.SelectQuest() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If CurrentQuest != None ; #DEBUG_LINE_NO:
      Self.GotoState("SelectingTarget") ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      CurrentTimePassedSelectingQuest += WaitDuration ; #DEBUG_LINE_NO:
      If CurrentTimePassedSelectingQuest > MaxTimeBeforeFailureSelectingQuest ; #DEBUG_LINE_NO:
        Self.FailAutomatedTest() ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedSelectingQuest = 0 ; #DEBUG_LINE_NO:76
  EndEvent
EndState

;-- State -------------------------------------------
State SelectingTarget

  Event OnEndState(String asNewState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Function UpdateState()
    ObjectReference prospectiveTarget = Self.SelectQuestTarget(CurrentQuest) ; #DEBUG_LINE_NO:
    If prospectiveTarget != None ; #DEBUG_LINE_NO:
      spaceshipreference playerSpaceship = Self.GetCurrentShipRef() ; #DEBUG_LINE_NO:
      Bool inCombatWithPlayer = False ; #DEBUG_LINE_NO:
      Actor targetActor = prospectiveTarget as Actor ; #DEBUG_LINE_NO:
      spaceshipreference targetShip = prospectiveTarget as spaceshipreference ; #DEBUG_LINE_NO:
      If targetActor != None ; #DEBUG_LINE_NO:
        Actor[] combatTargets = targetActor.GetAllCombatTargets() ; #DEBUG_LINE_NO:
        Int combatTargetIndex = 0 ; #DEBUG_LINE_NO:
        While combatTargetIndex < combatTargets.Length && !inCombatWithPlayer ; #DEBUG_LINE_NO:
          inCombatWithPlayer = combatTargets[combatTargetIndex] == Self as Actor ; #DEBUG_LINE_NO:
          combatTargetIndex += 1 ; #DEBUG_LINE_NO:
        EndWhile ; #DEBUG_LINE_NO:
      ElseIf targetShip != None ; #DEBUG_LINE_NO:
        spaceshipreference[] combattargets = targetShip.GetAllCombatTargets() ; #DEBUG_LINE_NO:
        Int combattargetindex = 0 ; #DEBUG_LINE_NO:
        While combattargetindex < combattargets.Length && !inCombatWithPlayer ; #DEBUG_LINE_NO:
          inCombatWithPlayer = combattargets[combattargetindex] == playerSpaceship ; #DEBUG_LINE_NO:
          combattargetindex += 1 ; #DEBUG_LINE_NO:
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If inCombatWithPlayer ; #DEBUG_LINE_NO:
        If targetActor ; #DEBUG_LINE_NO:
          CombatTarget = targetActor as ObjectReference ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          CombatTarget = targetShip as ObjectReference ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Self.MakeGameplayBotRequest(CombatTarget, CombatState) ; #DEBUG_LINE_NO:
        Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:
      ElseIf prospectiveTarget == Self.GetFurnitureUsing() ; #DEBUG_LINE_NO:
        Keyword PilotSeatKeyword = Game.GetForm(22055) as Keyword ; #DEBUG_LINE_NO:
        If prospectiveTarget.HasKeyword(PilotSeatKeyword) ; #DEBUG_LINE_NO:
          If playerSpaceship ; #DEBUG_LINE_NO:
            playerSpaceship.TakeOff() ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      ElseIf Self.GetDistance(prospectiveTarget) < AcceptableDistance ; #DEBUG_LINE_NO:
        CurrentTarget = prospectiveTarget ; #DEBUG_LINE_NO:
        Self.MakeGameplayBotRequest(CurrentTarget, InteractState) ; #DEBUG_LINE_NO:
        Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        CurrentTarget = prospectiveTarget ; #DEBUG_LINE_NO:
        Self.MakeGameplayBotRequest(CurrentTarget, PathingState) ; #DEBUG_LINE_NO:
        Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      CombatTarget = Self.SelectCombatTarget() as ObjectReference ; #DEBUG_LINE_NO:
      If CombatTarget != None ; #DEBUG_LINE_NO:
        Self.MakeGameplayBotRequest(CombatTarget, CombatState) ; #DEBUG_LINE_NO:
        Self.GotoState("CodeControlled") ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        CurrentTimePassedSelectingTarget += WaitDuration ; #DEBUG_LINE_NO:
        If CurrentTimePassedSelectingTarget > MaxTimeBeforeFailureSelectingTarget ; #DEBUG_LINE_NO:
          Self.FailAutomatedTest() ; #DEBUG_LINE_NO:
        ElseIf CurrentTimePassedSelectingTarget > MaxTimeBeforeKillAllSelectingTarget ; #DEBUG_LINE_NO:
          Self.RoboKillAllHostile() ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndFunction

  Event OnBeginState(String asOldState)
    CurrentTimePassedSelectingTarget = 0 ; #DEBUG_LINE_NO:121
  EndEvent
EndState

;-- State -------------------------------------------
State TestCompleted

  Bool Function StateRequestsFinish()
    Return True ; #DEBUG_LINE_NO:
  EndFunction

  Event OnBeginState(String asOldState)
    Self.ResetPlayerStateFromRobotTest() ; #DEBUG_LINE_NO:298
  EndEvent
EndState
