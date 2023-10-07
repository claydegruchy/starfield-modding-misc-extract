ScriptName Fragments:Terminals:TERM_RL010ElevatorControlsTe_0005038F Extends TerminalMenu Const hidden

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  loadelevatormanagerscript loadElevatorManager = akTerminalRef.GetLinkedRef(None) as loadelevatormanagerscript ; #DEBUG_LINE_NO:7
  loadElevatorManager.SetElevatorOperational(True) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  loadelevatormanagerscript loadElevatorManager = akTerminalRef.GetLinkedRef(None) as loadelevatormanagerscript ; #DEBUG_LINE_NO:17
  loadElevatorManager.SetElevatorOperational(False) ; #DEBUG_LINE_NO:19
EndFunction
