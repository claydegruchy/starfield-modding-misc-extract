ScriptName Fragments:Terminals:TERM_DR033TerminalJackpot02__002276B5 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property DR033Jackpot Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  DR033Jackpot.SetValue(DR033Jackpot.GetValue() + 1.0) ; #DEBUG_LINE_NO:7
EndFunction
