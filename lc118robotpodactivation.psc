ScriptName LC118RobotPodActivation Extends ObjectReference
{ Robot pod chain activation script for LC118. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Robot1 Auto Const
ObjectReference Property Robot2 Auto Const
ObjectReference Property Robot3 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:12
    robotpodscript[] linkedRobots = Self.GetLinkedRefChain(LinkCustom01, 100) as robotpodscript[] ; #DEBUG_LINE_NO:13
    Int I = 0 ; #DEBUG_LINE_NO:14
    While I < linkedRobots.Length ; #DEBUG_LINE_NO:15
      If linkedRobots[I] != None ; #DEBUG_LINE_NO:16
        linkedRobots[I].WakeRobotFromPod() ; #DEBUG_LINE_NO:17
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:19
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
