ScriptName TestEnableDisableRefOnTrigger Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property enableLinkedRef Auto Const
Bool Property useLinkedRefChain Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:7
    Return  ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] linkRefs = None ; #DEBUG_LINE_NO:11
  If useLinkedRefChain ; #DEBUG_LINE_NO:13
    linkRefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:14
  Else ; #DEBUG_LINE_NO:
    linkRefs = new ObjectReference[1] ; #DEBUG_LINE_NO:16
    linkRefs[0] = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:20
  While I < linkRefs.Length ; #DEBUG_LINE_NO:21
    If enableLinkedRef ; #DEBUG_LINE_NO:22
      linkRefs[I].Enable(False) ; #DEBUG_LINE_NO:23
    Else ; #DEBUG_LINE_NO:
      linkRefs[I].Disable(False) ; #DEBUG_LINE_NO:25
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:28
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:33
    Return  ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] linkRefs = None ; #DEBUG_LINE_NO:37
  If useLinkedRefChain ; #DEBUG_LINE_NO:39
    linkRefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    linkRefs = new ObjectReference[1] ; #DEBUG_LINE_NO:42
    linkRefs[0] = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:46
  While I < linkRefs.Length ; #DEBUG_LINE_NO:47
    If enableLinkedRef ; #DEBUG_LINE_NO:48
      linkRefs[I].Disable(False) ; #DEBUG_LINE_NO:49
    Else ; #DEBUG_LINE_NO:
      linkRefs[I].Enable(False) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:54
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
