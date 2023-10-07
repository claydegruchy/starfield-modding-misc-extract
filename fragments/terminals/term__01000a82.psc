ScriptName Fragments:Terminals:TERM__01000A82 Extends Terminal Const hidden

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:7
  Int I = 0 ; #DEBUG_LINE_NO:8
  While I < linkedRefChain.Length ; #DEBUG_LINE_NO:9
    linkedRefChain[I].Unlock(False) ; #DEBUG_LINE_NO:10
    I += 1 ; #DEBUG_LINE_NO:11
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
