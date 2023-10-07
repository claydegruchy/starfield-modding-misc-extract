ScriptName Fragments:Terminals:TERM_TestPCM_CommsArrayTermi_00227DA8 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestPCM_CommsArrayProbeQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  TestPCM_CommsArrayProbeQuest.Start() ; #DEBUG_LINE_NO:7
EndFunction
