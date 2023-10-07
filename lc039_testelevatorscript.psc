ScriptName LC039_TestElevatorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference linkedDoor = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:5
  linkedDoor.Activate(akActionRef, False) ; #DEBUG_LINE_NO:7
EndEvent
