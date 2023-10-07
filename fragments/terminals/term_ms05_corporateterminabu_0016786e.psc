ScriptName Fragments:Terminals:TERM_MS05_CorporateTerminaBu_0016786E Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS05BudgetProposalLevel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  MS05BudgetProposalLevel.SetValue(0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MS05BudgetProposalLevel.SetValue(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MS05BudgetProposalLevel.SetValue(2.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MS05BudgetProposalLevel.SetValue(3.0) ; #DEBUG_LINE_NO:31
EndFunction
