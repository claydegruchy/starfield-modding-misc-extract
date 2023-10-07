ScriptName Fragments:Terminals:TERM_SY_Deimos_SalesSubTermi_00227CF4 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01_Education Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Experience Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application01 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application02 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application03 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application04 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Application05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  City_CY_RedTape01_Education.SetValue(0.0) ; #DEBUG_LINE_NO:7
  City_CY_RedTape01_Experience.SetValue(0.0) ; #DEBUG_LINE_NO:8
  City_CY_RedTape01Application01.SetValue(0.0) ; #DEBUG_LINE_NO:9
  City_CY_RedTape01Application02.SetValue(0.0) ; #DEBUG_LINE_NO:10
  City_CY_RedTape01Application03.SetValue(0.0) ; #DEBUG_LINE_NO:11
  City_CY_RedTape01Application04.SetValue(0.0) ; #DEBUG_LINE_NO:12
  City_CY_RedTape01Application05.SetValue(0.0) ; #DEBUG_LINE_NO:13
EndFunction
