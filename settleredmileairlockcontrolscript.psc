ScriptName SettleRedMileAirlockControlScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property InsideFrontDoor Auto Const mandatory
ObjectReference Property InsideCourseDoor Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  Int openStateFrontDoor = InsideFrontDoor.GetOpenState() ; #DEBUG_LINE_NO:9
  Int openStateCourseDoor = InsideCourseDoor.GetOpenState() ; #DEBUG_LINE_NO:10
  While openStateCourseDoor == 4 || openStateFrontDoor == 4 ; #DEBUG_LINE_NO:13
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:14
    openStateFrontDoor = InsideFrontDoor.GetOpenState() ; #DEBUG_LINE_NO:15
    openStateCourseDoor = InsideCourseDoor.GetOpenState() ; #DEBUG_LINE_NO:16
  EndWhile ; #DEBUG_LINE_NO:
  InsideFrontDoor.SetOpen(True) ; #DEBUG_LINE_NO:20
  InsideCourseDoor.SetOpen(True) ; #DEBUG_LINE_NO:21
EndEvent

Event OnCellDetach()
  InsideFrontDoor.SetOpen(False) ; #DEBUG_LINE_NO:29
  InsideCourseDoor.SetOpen(False) ; #DEBUG_LINE_NO:30
EndEvent
