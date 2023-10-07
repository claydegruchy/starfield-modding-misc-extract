ScriptName TestOpenCloseSyncScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Function ToggleState()
  Int currentState = Self.GetOpenState() ; #DEBUG_LINE_NO:4
  Self.SetOpen(currentState >= 3) ; #DEBUG_LINE_NO:5
EndFunction

Function SetState(Bool bOpenMe)
  Self.SetOpen(bOpenMe) ; #DEBUG_LINE_NO:9
EndFunction
