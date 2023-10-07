ScriptName DR030_ElevatorDoorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference moveToMarker = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:4
  If moveToMarker != None ; #DEBUG_LINE_NO:6
    akActionRef.moveto(moveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
