ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Found_00036944 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2132) ; #DEBUG_LINE_NO:7
  BarrettQuest.SetStage(2135) ; #DEBUG_LINE_NO:8
EndFunction
