ScriptName Fragments:Terminals:TERM_UC03_TradeAuthority_Hal_00227D3A Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
Quest Property UC03 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_01 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_02 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_03 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_04 Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtNewValue_05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:7
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_01.GetValueInt() as Float) ; #DEBUG_LINE_NO:8
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:12
    UC03.SetStage(700) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:22
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_02.GetValueInt() as Float) ; #DEBUG_LINE_NO:23
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:27
    UC03.SetStage(700) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:37
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_00.GetValueInt() as Float) ; #DEBUG_LINE_NO:38
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:42
    UC03.SetStage(700) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:52
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_03.GetValueInt() as Float) ; #DEBUG_LINE_NO:53
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:57
    UC03.SetStage(700) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:67
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_04.GetValueInt() as Float) ; #DEBUG_LINE_NO:68
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:72
    UC03.SetStage(700) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:82
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_05.GetValueInt() as Float) ; #DEBUG_LINE_NO:83
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:87
    UC03.SetStage(700) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
  If !UC03.GetStageDone(899) ; #DEBUG_LINE_NO:97
    UC03_JakobsDebtAmount.SetValue(1.0) ; #DEBUG_LINE_NO:98
    UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  If UC03.GetStageDone(510) && !UC03.GetStageDone(700) ; #DEBUG_LINE_NO:102
    UC03.SetStage(700) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
EndFunction
