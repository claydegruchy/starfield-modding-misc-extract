ScriptName Fragments:Terminals:TERM_UC03_TradeAuthority_Pub_00227D37 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property UC03_JakobsDebtAmount Auto Const mandatory
Quest Property UC03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  Game.GetPlayer().RemoveItem(Credits as Form, UC03_JakobsDebtAmount.GetValueInt(), False, None) ; #DEBUG_LINE_NO:7
  UC03_JakobsDebtAmount.SetValue(0.0) ; #DEBUG_LINE_NO:8
  If !UC03.GetStageDone(890) && !UC03.GetStageDone(880) ; #DEBUG_LINE_NO:10
    UC03.SetStage(880) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction
