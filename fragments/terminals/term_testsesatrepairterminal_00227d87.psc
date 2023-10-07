ScriptName Fragments:Terminals:TERM_TestSESatRepairTerminal_00227D87 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestSESatRepairAddonQuest Auto Const mandatory
Bool Property bHaveDownloadedData Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  TestSESatRepairAddonQuest.Start() ; #DEBUG_LINE_NO:7
EndFunction
