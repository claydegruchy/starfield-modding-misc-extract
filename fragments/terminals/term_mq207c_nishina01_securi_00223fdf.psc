ScriptName Fragments:Terminals:TERM_MQ207C_Nishina01_Securi_00223FDF Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ207C Auto Const mandatory
Quest Property MQ207C_Support Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MQ207C.SetStage(22) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MQ207C.SetStage(22) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MQ207C_Support.SetStage(25) ; #DEBUG_LINE_NO:26
EndFunction
