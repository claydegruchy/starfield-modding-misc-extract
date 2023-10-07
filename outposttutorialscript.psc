ScriptName OutpostTutorialScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct WorkshopTutorial
  Int tutorialID
  { the ID of this tutorial (which is made up of 1 or more TutorialItems ) }
  String description
  { describe this so it's easier to parse later }
  Bool bDone
  { if true, this whole sequence is done }
  Int startingStep = -1
  { set to index of starting step in TutorialSteps array }
  Int activeStep = -1
  { -1 = not active, otherwise the active step (index to TutorialSteps array) }
  ObjectReference outpostRef
  { the workshop where this tutorial is happening }
  ReferenceAlias AliasToFill
  { optional - put the object into this alias
		will be cleared when step is completed }
  Int mutuallyExclusiveTutorialID = -1
  { if this tutorial is currently running, don't start this one
		AND automatically complete me if mutually exclusive tutorial completes }
  conditionform requiredCondition
  { if this condition isn't true, don't start this tutorial }
  Int UnregisterForEventTypeOnCompletion = -1
  { if this is the final event of a type, unregister for that event when done }
  GlobalVariable completionGlobal
  { optional - set this global when complete }
EndStruct

Struct WorkshopTutorialStep
  Int tutorialID = -1
  { which tutorial do I go with? (since we can't put arrays into structs) - matches ID of WorkshopTutorial }
  Bool bStartingStep
  { TRUE for the step that starts a tutorial sequence - should be only 1 of these }
  Bool bFinalStep
  { TRUE for the step that completes a tutorial sequence }
  Message TriggerMessage
  { message to display when starting this tutorial step - optional }
  Message TriggerMessagePC
  { if this exists, use this instead of TriggerMessage if not using gamepad }
  Bool bTriggerIsMessageBox = False
  { set to true to display trigger messages as message boxes instead of help messages }
  Message HelpMessage
  { help message to display during this step }
  Message CompletionMessage
  { message to display when completing this tutorial step - optional - usually just the final step needs this }
  Message CompletionMessage2
  Message CompletionMessage3
  conditionform TriggerCondition
  { OPTIONAL - condition must evaluate to TRUE for this to even consider triggering }
  Int TriggerEvent
  { event type that STARTS this step
		(I think this only applies to starting steps) }
  Bool TriggerOnEventOnly = False
  { if TRUE don't check anything but getting the event }
  Int CompletionEvent
  { event that completes this step
		-1 = immediately complete the step (no additional event needed) }
  Bool CompletionOnEventOnly = False
  { if TRUE don't check anything but getting the event }
  conditionform CompletionCondition
  { condition must evaluate to TRUE for this to complete }
  Int Status = -1
  { -1 = not started
	  0 = active
	  1 = done }
EndStruct


;-- Variables ---------------------------------------
String HelpMessageString = "OutpostTutorialEvent"
Bool debugAllowMiscObjective = False conditional
Float helpMessageDurationLong = 10.0
Float helpMessageDurationShort = 3.0
Float helpMessageInterval = 10.0
Float messageBoxDelay = 0.200000003

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard workshopEventGuard

;-- Properties --------------------------------------
Group MiscObjective
  conditionform Property OutpostTutorialConditionMiscObjective Auto Const mandatory
  { condition to check for when to trigger outpost misc objective }
  Keyword Property OutpostPreventPlacement Auto Const mandatory
  { keyword on location that prevents outpost placement }
  Keyword Property LocTypeSurface Auto Const mandatory
  { find planet surface }
  Int Property MiscObjectiveStartStage = 10 Auto Const
  Int Property MiscObjectiveDoneStage = 20 Auto Const
EndGroup

Group EventTypes
  Int Property EventType_Build = 0 Auto Const
  Int Property EventType_Move = 1 Auto Const
  Int Property EventType_Destroy = 2 Auto Const
  Int Property EventType_Assign = 3 Auto Const
  Int Property EventType_Unassign = 4 Auto Const
  Int Property EventType_DestructionState = 5 Auto Const
  Int Property EventType_PowerOn = 6 Auto Const
  Int Property EventType_EnterMenu = 7 Auto Const
  Int Property EventType_PlaceBeacon = 8 Auto Const
  Int Property EventType_OutputLink = 9 Auto Const
  Int Property EventType_EnterBeaconPlacement = 10 Auto Const
  Int Property EventType_PowerOff = 11 Auto Const
  Int Property EventType_Flycam = 12 Auto Const
EndGroup

ReferenceAlias Property Alias_Outpost Auto Const
ReferenceAlias Property Alias_PowerRequiredObject Auto Const
ReferenceAlias Property Alias_SourceObject Auto Const
ReferenceAlias Property Alias_TargetObject Auto Const
Keyword Property WorkshopNoRepairKeyword Auto Const mandatory
{ keyword on object which indicates it can't be repaired }
ActorValue Property OutpostTutorialObject Auto Const mandatory
{ script only checks refs with this AV }
GlobalVariable Property OutpostTutorialEnterMenuCount Auto Const mandatory
{ count how many times player has entered build menu }
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
{ check this on start - no tutorials for new game plus }
Int Property PlaceOutpostAchievement = 23 Auto Const
{ achievement for placing an outpost }
outposttutorialscript:workshoptutorial[] Property Tutorials Auto
{ list of tutorials }
outposttutorialscript:workshoptutorialstep[] Property TutorialSteps Auto
{ complete list of all tutorial steps - grouped by tutorialID }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:169
  If playerRef.GetValue(PlayerUnityTimesEntered) > 0.0 ; #DEBUG_LINE_NO:170
    Self.Stop() ; #DEBUG_LINE_NO:171
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnEnterOutpostBeaconMode") ; #DEBUG_LINE_NO:174
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnOutpostPlaced") ; #DEBUG_LINE_NO:175
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectPlaced") ; #DEBUG_LINE_NO:176
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectGrabbed") ; #DEBUG_LINE_NO:177
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectMoved") ; #DEBUG_LINE_NO:178
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectDestroyed") ; #DEBUG_LINE_NO:179
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectRepaired") ; #DEBUG_LINE_NO:180
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectRemoved") ; #DEBUG_LINE_NO:181
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOn") ; #DEBUG_LINE_NO:182
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOff") ; #DEBUG_LINE_NO:183
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopOutputLink") ; #DEBUG_LINE_NO:184
    Self.RegisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopFlycam") ; #DEBUG_LINE_NO:185
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:195
  If akSender == playerRef ; #DEBUG_LINE_NO:196
    If OutpostTutorialConditionMiscObjective.IsTrue(playerRef as ObjectReference, None) ; #DEBUG_LINE_NO:199
      Location currentLocation = playerRef.GetCurrentLocation() ; #DEBUG_LINE_NO:201
      If currentLocation.HasKeyword(OutpostPreventPlacement) == False ; #DEBUG_LINE_NO:203
        If currentLocation.HasKeyword(LocTypeSurface) ; #DEBUG_LINE_NO:204
          Self.setStage(MiscObjectiveStartStage) ; #DEBUG_LINE_NO:205
          Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:207
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleWorkshopEvent(ObjectReference outpostRef, ObjectReference newObject, Int iEventType, ObjectReference targetObject)
  Guard workshopEventGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:216
    Int completedCount = 0 ; #DEBUG_LINE_NO:218
    If newObject ; #DEBUG_LINE_NO:221
      Alias_SourceObject.ForceRefTo(newObject) ; #DEBUG_LINE_NO:222
    Else ; #DEBUG_LINE_NO:
      Alias_SourceObject.Clear() ; #DEBUG_LINE_NO:224
    EndIf ; #DEBUG_LINE_NO:
    If targetObject ; #DEBUG_LINE_NO:226
      Alias_TargetObject.ForceRefTo(targetObject) ; #DEBUG_LINE_NO:227
    EndIf ; #DEBUG_LINE_NO:
    Int tutorialIndex = 0 ; #DEBUG_LINE_NO:230
    While tutorialIndex < Tutorials.Length ; #DEBUG_LINE_NO:231
      outposttutorialscript:workshoptutorial theTutorial = Tutorials[tutorialIndex] ; #DEBUG_LINE_NO:232
      If theTutorial.bDone == False ; #DEBUG_LINE_NO:233
        If theTutorial.activeStep > -1 ; #DEBUG_LINE_NO:235
          If theTutorial.outpostRef == outpostRef ; #DEBUG_LINE_NO:239
            Self.EvaluateEvent(theTutorial, theTutorial.activeStep, outpostRef, newObject, targetObject, iEventType) ; #DEBUG_LINE_NO:241
          Else ; #DEBUG_LINE_NO:
            Self.RollBackTutorial(theTutorial) ; #DEBUG_LINE_NO:244
            Self.EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType) ; #DEBUG_LINE_NO:246
          EndIf ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          Self.EvaluateEvent(theTutorial, theTutorial.startingStep, outpostRef, newObject, targetObject, iEventType) ; #DEBUG_LINE_NO:251
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        If theTutorial.UnregisterForEventTypeOnCompletion > -1 ; #DEBUG_LINE_NO:255
          Self.UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion) ; #DEBUG_LINE_NO:256
        EndIf ; #DEBUG_LINE_NO:
        completedCount += 1 ; #DEBUG_LINE_NO:258
      EndIf ; #DEBUG_LINE_NO:
      tutorialIndex += 1 ; #DEBUG_LINE_NO:260
    EndWhile ; #DEBUG_LINE_NO:
    Int stepIndex = 0 ; #DEBUG_LINE_NO:264
    While stepIndex < TutorialSteps.Length ; #DEBUG_LINE_NO:266
      outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[stepIndex] ; #DEBUG_LINE_NO:267
      If theStep.Status == 0 && theStep.CompletionEvent == -1 ; #DEBUG_LINE_NO:270
        Self.CompleteTutorialStep(Tutorials[theStep.tutorialID], stepIndex, newObject) ; #DEBUG_LINE_NO:273
      EndIf ; #DEBUG_LINE_NO:
      stepIndex += 1 ; #DEBUG_LINE_NO:275
    EndWhile ; #DEBUG_LINE_NO:
    If completedCount >= Tutorials.Length ; #DEBUG_LINE_NO:278
      Self.Stop() ; #DEBUG_LINE_NO:280
    EndIf ; #DEBUG_LINE_NO:
    Alias_SourceObject.Clear() ; #DEBUG_LINE_NO:286
    Alias_TargetObject.Clear() ; #DEBUG_LINE_NO:287
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RollBackTutorial(outposttutorialscript:workshoptutorial theTutorial)
  theTutorial.outpostRef = None ; #DEBUG_LINE_NO:294
  theTutorial.activeStep = -1 ; #DEBUG_LINE_NO:295
  Int stepIndex = 0 ; #DEBUG_LINE_NO:297
  While stepIndex < TutorialSteps.Length ; #DEBUG_LINE_NO:298
    outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[stepIndex] ; #DEBUG_LINE_NO:299
    If theStep.tutorialID == theTutorial.tutorialID ; #DEBUG_LINE_NO:300
      theStep.Status = -1 ; #DEBUG_LINE_NO:301
      If theStep.TriggerMessage ; #DEBUG_LINE_NO:303
        theStep.TriggerMessage.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:305
      EndIf ; #DEBUG_LINE_NO:
      If theStep.TriggerMessagePC ; #DEBUG_LINE_NO:307
        theStep.TriggerMessagePC.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:309
      EndIf ; #DEBUG_LINE_NO:
      If theStep.HelpMessage ; #DEBUG_LINE_NO:311
        theStep.HelpMessage.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:313
      EndIf ; #DEBUG_LINE_NO:
      If theStep.CompletionMessage ; #DEBUG_LINE_NO:315
        theStep.CompletionMessage.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:317
      EndIf ; #DEBUG_LINE_NO:
      If theStep.CompletionMessage2 ; #DEBUG_LINE_NO:319
        theStep.CompletionMessage2.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:321
      EndIf ; #DEBUG_LINE_NO:
      If theStep.CompletionMessage3 ; #DEBUG_LINE_NO:323
        theStep.CompletionMessage3.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:325
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    stepIndex += 1 ; #DEBUG_LINE_NO:330
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HelpMessage(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, Bool bShowMessage)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex] ; #DEBUG_LINE_NO:337
  If theStep.HelpMessage ; #DEBUG_LINE_NO:338
    If bShowMessage ; #DEBUG_LINE_NO:339
      String eventString = (HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String ; #DEBUG_LINE_NO:340
      theStep.HelpMessage.ShowAsHelpMessage(eventString, helpMessageDurationShort, helpMessageInterval, 0, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:341
    Else ; #DEBUG_LINE_NO:
      theStep.HelpMessage.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:344
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EvaluateEvent(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, Int iEventType)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex] ; #DEBUG_LINE_NO:351
  If outpostRef as Bool && outpostRef.Is3dLoaded() == False ; #DEBUG_LINE_NO:355
    Return  ; #DEBUG_LINE_NO:356
  EndIf ; #DEBUG_LINE_NO:
  If theStep.Status == 1 ; #DEBUG_LINE_NO:360
    Return  ; #DEBUG_LINE_NO:362
  ElseIf theStep.Status == -1 ; #DEBUG_LINE_NO:363
    If theTutorial.requiredCondition ; #DEBUG_LINE_NO:367
      If Self.IsConditionTrue(theTutorial.requiredCondition, theObject, targetObject) == False ; #DEBUG_LINE_NO:370
        Return  ; #DEBUG_LINE_NO:373
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If theTutorial.mutuallyExclusiveTutorialID > -1 ; #DEBUG_LINE_NO:378
      outposttutorialscript:workshoptutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID] ; #DEBUG_LINE_NO:379
      If nemesisTutorial as Bool && nemesisTutorial.activeStep > -1 ; #DEBUG_LINE_NO:381
        Return  ; #DEBUG_LINE_NO:384
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsValidEvent(True, theStep, outpostRef, theObject, targetObject, iEventType) ; #DEBUG_LINE_NO:388
      Self.StartTutorialStep(theTutorial, iStepIndex, theObject) ; #DEBUG_LINE_NO:390
      theTutorial.outpostRef = outpostRef ; #DEBUG_LINE_NO:391
    EndIf ; #DEBUG_LINE_NO:
  ElseIf theStep.Status == 0 ; #DEBUG_LINE_NO:393
    If Self.IsValidEvent(False, theStep, outpostRef, theObject, targetObject, iEventType) ; #DEBUG_LINE_NO:396
      Self.CompleteTutorialStep(theTutorial, iStepIndex, theObject) ; #DEBUG_LINE_NO:398
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsValidEvent(Bool bTriggerEvent, outposttutorialscript:workshoptutorialstep theStep, ObjectReference outpostRef, ObjectReference theObject, ObjectReference targetObject, Int iEventType)
  Bool bIsValid = False ; #DEBUG_LINE_NO:409
  Int eventToCheck = 0 ; #DEBUG_LINE_NO:411
  conditionform conditionToCheck = None ; #DEBUG_LINE_NO:412
  Bool checkEventOnly = False ; #DEBUG_LINE_NO:413
  If bTriggerEvent ; #DEBUG_LINE_NO:415
    eventToCheck = theStep.TriggerEvent ; #DEBUG_LINE_NO:416
    conditionToCheck = theStep.TriggerCondition ; #DEBUG_LINE_NO:417
    checkEventOnly = theStep.TriggerOnEventOnly ; #DEBUG_LINE_NO:418
  Else ; #DEBUG_LINE_NO:
    eventToCheck = theStep.CompletionEvent ; #DEBUG_LINE_NO:420
    conditionToCheck = theStep.CompletionCondition ; #DEBUG_LINE_NO:421
    checkEventOnly = theStep.CompletionOnEventOnly ; #DEBUG_LINE_NO:422
  EndIf ; #DEBUG_LINE_NO:
  If iEventType == eventToCheck ; #DEBUG_LINE_NO:425
    If checkEventOnly ; #DEBUG_LINE_NO:427
      If iEventType == EventType_DestructionState ; #DEBUG_LINE_NO:429
        If theObject.HasKeyword(WorkshopNoRepairKeyword) == False ; #DEBUG_LINE_NO:430
          bIsValid = True ; #DEBUG_LINE_NO:431
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        bIsValid = True ; #DEBUG_LINE_NO:434
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.IsConditionTrue(conditionToCheck, theObject, targetObject) ; #DEBUG_LINE_NO:436
      bIsValid = True ; #DEBUG_LINE_NO:438
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bIsValid ; #DEBUG_LINE_NO:444
EndFunction

Bool Function IsConditionTrue(conditionform conditionToCheck, ObjectReference subjectRef, ObjectReference targetRef)
  Bool bIsTrue = True ; #DEBUG_LINE_NO:448
  If conditionToCheck ; #DEBUG_LINE_NO:449
    bIsTrue = conditionToCheck.IsTrue(subjectRef, targetRef) ; #DEBUG_LINE_NO:450
  EndIf ; #DEBUG_LINE_NO:
  Return bIsTrue ; #DEBUG_LINE_NO:453
EndFunction

Function StartTutorialStep(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference theObject)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex] ; #DEBUG_LINE_NO:459
  theStep.Status = 0 ; #DEBUG_LINE_NO:460
  theTutorial.activeStep = iStepIndex ; #DEBUG_LINE_NO:461
  If theTutorial.AliasToFill ; #DEBUG_LINE_NO:463
    theTutorial.AliasToFill.ForceRefTo(theObject) ; #DEBUG_LINE_NO:464
  EndIf ; #DEBUG_LINE_NO:
  If theStep.TriggerMessage ; #DEBUG_LINE_NO:466
    If theStep.bTriggerIsMessageBox ; #DEBUG_LINE_NO:467
      Utility.Wait(messageBoxDelay) ; #DEBUG_LINE_NO:469
      If theStep.TriggerMessagePC as Bool && Game.UsingGamePad() == False ; #DEBUG_LINE_NO:470
        theStep.TriggerMessagePC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:471
      Else ; #DEBUG_LINE_NO:
        theStep.TriggerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:473
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      String eventString = ((HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String) + "_START" ; #DEBUG_LINE_NO:476
      If theStep.TriggerMessagePC as Bool && Game.UsingGamePad() == False ; #DEBUG_LINE_NO:477
        theStep.TriggerMessagePC.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:478
      Else ; #DEBUG_LINE_NO:
        theStep.TriggerMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:480
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If theStep.HelpMessage ; #DEBUG_LINE_NO:484
    Self.HelpMessage(theTutorial, iStepIndex, True) ; #DEBUG_LINE_NO:485
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CompleteTutorialStep(outposttutorialscript:workshoptutorial theTutorial, Int iStepIndex, ObjectReference theObject)
  outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[iStepIndex] ; #DEBUG_LINE_NO:491
  theStep.Status = 1 ; #DEBUG_LINE_NO:492
  If theStep.HelpMessage ; #DEBUG_LINE_NO:494
    Self.HelpMessage(theTutorial, iStepIndex, False) ; #DEBUG_LINE_NO:495
  EndIf ; #DEBUG_LINE_NO:
  If theStep.CompletionMessage ; #DEBUG_LINE_NO:499
    String eventString = ((HelpMessageString + "_" + theTutorial.tutorialID as String) + "_" + iStepIndex as String) + "_COMPLETE" ; #DEBUG_LINE_NO:500
    theStep.CompletionMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:501
    If theStep.CompletionMessage2 ; #DEBUG_LINE_NO:502
      theStep.CompletionMessage2.ShowAsHelpMessage(eventString + "2", helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:503
    EndIf ; #DEBUG_LINE_NO:
    If theStep.CompletionMessage3 ; #DEBUG_LINE_NO:505
      theStep.CompletionMessage3.ShowAsHelpMessage(eventString + "3", helpMessageDurationLong, 0.0, 1, "WorkshopMenu", 0, None) ; #DEBUG_LINE_NO:506
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If theTutorial.AliasToFill ; #DEBUG_LINE_NO:510
    theTutorial.AliasToFill.Clear() ; #DEBUG_LINE_NO:511
  EndIf ; #DEBUG_LINE_NO:
  Bool bFoundNextStep = False ; #DEBUG_LINE_NO:515
  Int I = iStepIndex + 1 ; #DEBUG_LINE_NO:516
  While I < TutorialSteps.Length && bFoundNextStep == False ; #DEBUG_LINE_NO:517
    outposttutorialscript:workshoptutorialstep nextStep = TutorialSteps[I] ; #DEBUG_LINE_NO:518
    If nextStep.tutorialID == theTutorial.tutorialID ; #DEBUG_LINE_NO:519
      bFoundNextStep = True ; #DEBUG_LINE_NO:522
      Self.StartTutorialStep(theTutorial, I, theObject) ; #DEBUG_LINE_NO:523
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:525
  EndWhile ; #DEBUG_LINE_NO:
  If bFoundNextStep == False ; #DEBUG_LINE_NO:527
    theTutorial.bDone = True ; #DEBUG_LINE_NO:530
    theTutorial.activeStep = -1 ; #DEBUG_LINE_NO:531
    theTutorial.outpostRef = None ; #DEBUG_LINE_NO:532
    If theTutorial.UnregisterForEventTypeOnCompletion > -1 ; #DEBUG_LINE_NO:534
      Self.UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion) ; #DEBUG_LINE_NO:535
    EndIf ; #DEBUG_LINE_NO:
    If theTutorial.completionGlobal ; #DEBUG_LINE_NO:539
      theTutorial.completionGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:540
    EndIf ; #DEBUG_LINE_NO:
    If theTutorial.mutuallyExclusiveTutorialID > -1 ; #DEBUG_LINE_NO:544
      outposttutorialscript:workshoptutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID] ; #DEBUG_LINE_NO:545
      If nemesisTutorial ; #DEBUG_LINE_NO:546
        nemesisTutorial.bDone = True ; #DEBUG_LINE_NO:547
        nemesisTutorial.outpostRef = None ; #DEBUG_LINE_NO:548
        If nemesisTutorial.UnregisterForEventTypeOnCompletion > -1 ; #DEBUG_LINE_NO:550
          Self.UnregisterForWorkshopEvent(nemesisTutorial.UnregisterForEventTypeOnCompletion) ; #DEBUG_LINE_NO:551
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:561
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Build, None) ; #DEBUG_LINE_NO:563
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopObjectGrabbed(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:568
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move, None) ; #DEBUG_LINE_NO:570
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopObjectMoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:575
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Move, None) ; #DEBUG_LINE_NO:577
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnObjectDestroyed(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:582
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState, None) ; #DEBUG_LINE_NO:584
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnObjectRepaired(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:589
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_DestructionState, None) ; #DEBUG_LINE_NO:591
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference == Alias_Outpost.GetRef() ; #DEBUG_LINE_NO:597
    Self.ClearAllOutpostAliases() ; #DEBUG_LINE_NO:599
  ElseIf akReference.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:600
    Self.HandleWorkshopEvent(akSource.GetRef(), akReference, EventType_Destroy, None) ; #DEBUG_LINE_NO:602
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOn(ReferenceAlias akSource, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  If akPoweredItem.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:607
    Self.HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOn, akPowerGenerator) ; #DEBUG_LINE_NO:609
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnOutpostItemPowerOff(ReferenceAlias akSource, ObjectReference akPoweredItem)
  If akPoweredItem.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:614
    Self.HandleWorkshopEvent(akSource.GetRef(), akPoweredItem, EventType_PowerOff, None) ; #DEBUG_LINE_NO:616
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopOutputLink(ReferenceAlias akSourceAlias, ObjectReference akSource, ObjectReference akTarget)
  If akSource.GetValue(OutpostTutorialObject) > 0.0 || akTarget.GetValue(OutpostTutorialObject) > 0.0 ; #DEBUG_LINE_NO:621
    Self.HandleWorkshopEvent(akSourceAlias.GetRef(), akSource, EventType_OutputLink, akTarget) ; #DEBUG_LINE_NO:623
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopFlyCam(ReferenceAlias akSourceAlias, Bool aStart)
  If aStart ; #DEBUG_LINE_NO:628
    ObjectReference outpostBeaconRef = akSourceAlias.GetRef() ; #DEBUG_LINE_NO:629
    Self.HandleWorkshopEvent(outpostBeaconRef, None, EventType_Flycam, None) ; #DEBUG_LINE_NO:631
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Alias_Outpost.ForceRefTo(akOutpostBeacon) ; #DEBUG_LINE_NO:637
  If Self.GetStageDone(MiscObjectiveStartStage) && Self.GetStageDone(MiscObjectiveDoneStage) == False ; #DEBUG_LINE_NO:638
    Self.setStage(MiscObjectiveDoneStage) ; #DEBUG_LINE_NO:639
  EndIf ; #DEBUG_LINE_NO:
  Self.HandleWorkshopEvent(akOutpostBeacon, None, EventType_PlaceBeacon, None) ; #DEBUG_LINE_NO:641
  Game.AddAchievement(PlaceOutpostAchievement) ; #DEBUG_LINE_NO:642
EndEvent

Event Actor.OnEnterOutpostBeaconMode(Actor akSource)
  Self.HandleWorkshopEvent(None, None, EventType_EnterBeaconPlacement, None) ; #DEBUG_LINE_NO:647
EndEvent

Function EnterWorkshopMenu(ObjectReference akOutpostBeacon)
  Alias_Outpost.ForceRefTo(akOutpostBeacon) ; #DEBUG_LINE_NO:653
  OutpostTutorialEnterMenuCount.Mod(1.0) ; #DEBUG_LINE_NO:654
  Self.HandleWorkshopEvent(akOutpostBeacon, None, EventType_EnterMenu, None) ; #DEBUG_LINE_NO:655
EndFunction

Function UnregisterForWorkshopEvent(Int eventType)
  If eventType == EventType_Build ; #DEBUG_LINE_NO:660
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectPlaced") ; #DEBUG_LINE_NO:661
  ElseIf eventType == EventType_Move ; #DEBUG_LINE_NO:662
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectMoved") ; #DEBUG_LINE_NO:663
  ElseIf eventType == EventType_Destroy ; #DEBUG_LINE_NO:664
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopObjectRemoved") ; #DEBUG_LINE_NO:665
  ElseIf eventType == EventType_Assign ; #DEBUG_LINE_NO:666
     ; #DEBUG_LINE_NO:
  ElseIf eventType == EventType_Unassign ; #DEBUG_LINE_NO:668
     ; #DEBUG_LINE_NO:
  ElseIf eventType == EventType_DestructionState ; #DEBUG_LINE_NO:670
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnObjectDestroyed") ; #DEBUG_LINE_NO:671
  ElseIf eventType == EventType_PowerOn ; #DEBUG_LINE_NO:672
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOn") ; #DEBUG_LINE_NO:673
  ElseIf eventType == EventType_EnterMenu ; #DEBUG_LINE_NO:674
     ; #DEBUG_LINE_NO:
  ElseIf eventType == EventType_OutputLink ; #DEBUG_LINE_NO:676
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnWorkshopOutputLink") ; #DEBUG_LINE_NO:677
  ElseIf eventType == EventType_EnterBeaconPlacement ; #DEBUG_LINE_NO:678
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnEnterOutpostBeaconMode") ; #DEBUG_LINE_NO:679
  ElseIf eventType == EventType_PowerOff ; #DEBUG_LINE_NO:680
    Self.UnregisterForRemoteEvent(Alias_Outpost as ScriptObject, "OnOutpostItemPowerOff") ; #DEBUG_LINE_NO:681
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearAllOutpostAliases()
  Alias_Outpost.Clear() ; #DEBUG_LINE_NO:686
  Alias_PowerRequiredObject.Clear() ; #DEBUG_LINE_NO:687
  Alias_SourceObject.Clear() ; #DEBUG_LINE_NO:688
  Alias_TargetObject.Clear() ; #DEBUG_LINE_NO:689
EndFunction

Function TestDisplay()
  Int I = 0 ; #DEBUG_LINE_NO:694
  While I < TutorialSteps.Length ; #DEBUG_LINE_NO:695
    outposttutorialscript:workshoptutorialstep theStep = TutorialSteps[I] ; #DEBUG_LINE_NO:696
    I += 1 ; #DEBUG_LINE_NO:698
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:701
  While I < Tutorials.Length ; #DEBUG_LINE_NO:702
    outposttutorialscript:workshoptutorial theTutorial = Tutorials[I] ; #DEBUG_LINE_NO:703
    I += 1 ; #DEBUG_LINE_NO:705
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function TestMiscObjective()
  debugAllowMiscObjective = True ; #DEBUG_LINE_NO:711
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Debug.TraceLog(CallingObject, asTextToPrint, "OutpostTutorial", "", 0, False, False, False, True) ; #DEBUG_LINE_NO:721
EndFunction
