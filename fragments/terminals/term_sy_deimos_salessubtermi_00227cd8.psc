ScriptName Fragments:Terminals:TERM_SY_Deimos_SalesSubTermi_00227CD8 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01Application05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01Application05.SetValue(2.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  City_CY_RedTape01Application05.SetValue(0.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  City_CY_RedTape01Application05.SetValue(0.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  City_CY_RedTape01Application05.SetValue(1.0) ; #DEBUG_LINE_NO:31
EndFunction
