ScriptName DR023_FlowControlScript Extends ObjectReference

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State RandomDoorState

  Event OnCellLoad()
    Self.GotoState("Done") ; #DEBUG_LINE_NO:7
    ObjectReference[] DR023doors = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:8
    ObjectReference DoorUnlocked = DR023doors[Utility.RandomInt(0, DR023doors.Length - 1)] ; #DEBUG_LINE_NO:9
    DoorUnlocked.SetOpen(True) ; #DEBUG_LINE_NO:10
  EndEvent
EndState
