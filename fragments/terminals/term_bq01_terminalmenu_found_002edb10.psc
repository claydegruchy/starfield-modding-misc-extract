ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_Found_002EDB10 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  BarrettQuest.SetStage(2133) ; #DEBUG_LINE_NO:7
  BarrettQuest.SetStage(160) ; #DEBUG_LINE_NO:8
EndFunction
