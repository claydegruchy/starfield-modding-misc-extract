ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D896 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettCommitmentQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(77) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(78) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  BarrettCommitmentQuest.SetStage(80) ; #DEBUG_LINE_NO:23
EndFunction
