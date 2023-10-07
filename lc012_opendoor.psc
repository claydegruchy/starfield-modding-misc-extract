ScriptName LC012_OpenDoor Extends ObjectReference Const
{ Opens linked door on trigger enter }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.GetLinkedRef(None).SetOpen(True) ; #DEBUG_LINE_NO:7
  Self.Disable(False) ; #DEBUG_LINE_NO:8
EndEvent
