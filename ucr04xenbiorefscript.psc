ScriptName UCR04XenbioRefScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UCR04XenoBiologistActive Auto Const mandatory
{ Keyword applied to this NPC if they're actively in UCR04. If they don't have it, they shouldn't be standing around }

;-- Functions ---------------------------------------

Event OnUnload()
  If Self.IsEnabled() && !Self.HasKeyword(UCR04XenoBiologistActive) ; #DEBUG_LINE_NO:7
    Self.Disable(False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
