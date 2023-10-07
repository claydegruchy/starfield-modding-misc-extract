ScriptName LC119RobotPodActivation Extends ObjectReference
{ Robot pod chain activation script for LC119. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SparedLivvyStage = 400 Auto Const
Int Property LivvyBetrayStage = 475 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory
Quest Property MS04 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    If MS04.GetStageDone(SparedLivvyStage) && MS04.GetStageDone(LivvyBetrayStage) ; #DEBUG_LINE_NO:12
      Self.GoToState("Done") ; #DEBUG_LINE_NO:13
      robotpodscript[] linkedRobots = Self.GetLinkedRefChain(LinkCustom01, 100) as robotpodscript[] ; #DEBUG_LINE_NO:14
      Int I = 0 ; #DEBUG_LINE_NO:15
      While I < linkedRobots.Length ; #DEBUG_LINE_NO:16
        If linkedRobots[I] != None ; #DEBUG_LINE_NO:17
          linkedRobots[I].WakeRobotFromPod() ; #DEBUG_LINE_NO:18
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:20
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
