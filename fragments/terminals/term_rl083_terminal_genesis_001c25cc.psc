ScriptName Fragments:Terminals:TERM_RL083_Terminal_Genesis_001C25CC Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RL083 Auto Const
ObjectReference Property TurretRef Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  (TurretRef as Actor).SetUnconscious(True) ; #DEBUG_LINE_NO:7
  RL083.setstage(20) ; #DEBUG_LINE_NO:8
EndFunction
