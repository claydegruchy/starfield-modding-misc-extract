ScriptName TestLockLinkedRefChildrenScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference[] linkedRefs = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:4
  Int I = 0 ; #DEBUG_LINE_NO:5
  While I < linkedRefs.Length ; #DEBUG_LINE_NO:6
    linkedRefs[I].Lock(True, False, True) ; #DEBUG_LINE_NO:7
    I += 1 ; #DEBUG_LINE_NO:8
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
