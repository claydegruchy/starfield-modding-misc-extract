ScriptName DefaultEnableRefOnLoadOrReset Extends ObjectReference
{ Enables this ref on load or reset }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Actions
  Bool Property EnableOnLoad = False Auto
  { If this is true, this will be enabled every time it recieves OnLoad }
  Bool Property EnableOnReset = False Auto
  { If this is true, this will be enabled every time it recieves OnReset }
  Bool Property ShouldFadeIn = False Auto
  { Set if you want this to fade in on load }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If EnableOnLoad ; #DEBUG_LINE_NO:18
    Self.Enable(ShouldFadeIn) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnReset()
  If EnableOnReset ; #DEBUG_LINE_NO:25
    Self.Enable(ShouldFadeIn) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndEvent
