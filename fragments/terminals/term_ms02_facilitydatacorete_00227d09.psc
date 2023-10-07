ScriptName Fragments:Terminals:TERM_MS02_FacilityDatacoreTe_00227D09 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MS02.SetStage(1950) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MS02.SetStage(1940) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MS02.SetStage(1930) ; #DEBUG_LINE_NO:23
EndFunction
