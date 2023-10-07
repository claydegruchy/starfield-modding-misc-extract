ScriptName MQ207CEthanTerminalScript Extends TerminalScript
{ Variant terminal script for Ethan's Terminal in MQ207C, which Ethan 'uses' as part of the entry scene. }

;-- Functions ---------------------------------------

Function EndScriptControl()
  Self.GotoState("") ; #DEBUG_LINE_NO:15
EndFunction

;-- State -------------------------------------------
Auto State ScriptControl

  Function CheckOpenState()
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction

  Event OnCellLoad()
    Self.PlayAnimation("Play01") ; #DEBUG_LINE_NO:6
  EndEvent
EndState
