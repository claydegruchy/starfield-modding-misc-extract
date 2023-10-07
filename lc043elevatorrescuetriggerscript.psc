ScriptName LC043ElevatorRescueTriggerScript Extends ObjectReference Const
{ Script for the elevator triggers in LC043. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef.GetEditorLocation() != akActionRef.GetCurrentLocation() ; #DEBUG_LINE_NO:8
    akActionRef.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
