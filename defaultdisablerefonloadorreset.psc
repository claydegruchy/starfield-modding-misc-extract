ScriptName DefaultDisableRefOnLoadOrReset Extends ObjectReference
{ Disables this ref on load or reset }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Actions
  Bool Property DisableOnLoad = False Auto
  { If this is true, this will be disabled every time it recieves OnLoad }
  Bool Property DisableOnReset = False Auto
  { If this is true, this will be disabled every time it recieves OnReset }
  Bool Property ShouldFadeOut = False Auto
  { Set if you want this to fade out }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If DisableOnLoad ; #DEBUG_LINE_NO:17
    Self.Disable(ShouldFadeOut) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnReset()
  If DisableOnReset ; #DEBUG_LINE_NO:24
    Self.Disable(ShouldFadeOut) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent
