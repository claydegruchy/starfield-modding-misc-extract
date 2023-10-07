ScriptName EnableDisableToggle Extends ObjectReference conditional
{ Toggles between enabling and disabling linkedref }

;-- Variables ---------------------------------------
Bool isEnabled = True
ObjectReference linkedref

;-- Functions ---------------------------------------

Event OnLoad()
  linkedref = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:11
EndEvent

Event onActivate(ObjectReference triggerRef)
  If isEnabled ; #DEBUG_LINE_NO:15
    isEnabled = False ; #DEBUG_LINE_NO:16
    linkedref.disable(False) ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    isEnabled = True ; #DEBUG_LINE_NO:19
    linkedref.enable(False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
