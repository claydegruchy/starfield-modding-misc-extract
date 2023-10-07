ScriptName Fragments:Terminals:TERM_LC017_RobotLabTerminal_000B109A Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100) ; #DEBUG_LINE_NO:8
  Int I = 0 ; #DEBUG_LINE_NO:9
  While I < linkedSecurityDoors.Length ; #DEBUG_LINE_NO:10
    linkedSecurityDoors[I].Unlock(False) ; #DEBUG_LINE_NO:11
    linkedSecurityDoors[I].SetOpen(True) ; #DEBUG_LINE_NO:12
    I += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
