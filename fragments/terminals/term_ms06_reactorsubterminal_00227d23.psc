ScriptName Fragments:Terminals:TERM_MS06_ReactorSubTerminal_00227D23 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS06ReactorValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  MS06ReactorValue.SetValue(125.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MS06ReactorValue.SetValue(100.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MS06ReactorValue.SetValue(75.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MS06ReactorValue.SetValue(50.0) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MS06ReactorValue.SetValue(25.0) ; #DEBUG_LINE_NO:39
EndFunction
