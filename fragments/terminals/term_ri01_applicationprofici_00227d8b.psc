ScriptName Fragments:Terminals:TERM_RI01_ApplicationProfici_00227D8B Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI01_Track_AppProficiency Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  RI01_Track_AppProficiency.SetValue(0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  RI01_Track_AppProficiency.SetValue(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  RI01_Track_AppProficiency.SetValue(2.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  RI01_Track_AppProficiency.SetValue(3.0) ; #DEBUG_LINE_NO:31
EndFunction
