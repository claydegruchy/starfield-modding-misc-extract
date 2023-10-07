ScriptName Fragments:Terminals:TERM_LC082_OperationsCenterK_00227D55 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Vigilance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC088_Vigilance.SetStage(1100) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  LC088_Vigilance.SetStage(1070) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  LC088_Vigilance.SetStage(1071) ; #DEBUG_LINE_NO:23
EndFunction
