ScriptName LC107HullBreachVFXScript Extends ObjectReference
{ Script for the Hull Breach VFX in LC107. }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:5
    Self.PlayAnimation("Reset") ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent
