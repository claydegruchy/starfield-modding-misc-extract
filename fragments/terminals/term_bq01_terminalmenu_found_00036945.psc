ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Found_00036945 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2134) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2132) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2131) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2133) ; #DEBUG_LINE_NO:31
  BarrettQuest.SetStage(160) ; #DEBUG_LINE_NO:32
EndFunction
