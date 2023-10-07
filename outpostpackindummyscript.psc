ScriptName OutpostPackinDummyScript Extends ObjectReference Const
{ passes events along to linked ref }

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  outposteventhandlerparent myEventRef = Self.GetLinkedRef(None) as outposteventhandlerparent ; #DEBUG_LINE_NO:5
  If myEventRef ; #DEBUG_LINE_NO:7
    myEventRef.HandleOnWorkshopObjectPlaced(akReference) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  outposteventhandlerparent myEventRef = Self.GetLinkedRef(None) as outposteventhandlerparent ; #DEBUG_LINE_NO:13
  If myEventRef ; #DEBUG_LINE_NO:15
    myEventRef.HandleOnWorkshopObjectRemoved(akReference) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
