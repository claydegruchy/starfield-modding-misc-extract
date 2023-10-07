ScriptName Fragments:Terminals:TERM_UC02_LivestockScanner_F_00227D5C Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC02_ScannerQuest Auto Const mandatory
Quest Property UC02 Auto Const mandatory
GlobalVariable Property UC02_TrackerSystemTuned Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  If UC02_TrackerSystemTuned.GetValue() <= 0.0 ; #DEBUG_LINE_NO:10
    UC02_TrackerSystemTuned.SetValue(1.0) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  If !UC02_ScannerQuest.IsRunning() ; #DEBUG_LINE_NO:14
    UC02_ScannerQuest.Start() ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
  If UC02.GetStageDone(605) && !UC02.GetStageDone(700) ; #DEBUG_LINE_NO:18
    UC02.SetStage(607) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction
