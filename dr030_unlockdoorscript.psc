ScriptName DR030_UnlockDoorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference doorRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:4
  If doorRef != None ; #DEBUG_LINE_NO:6
    If doorRef.IsLocked() ; #DEBUG_LINE_NO:7
      doorRef.Unlock(False) ; #DEBUG_LINE_NO:8
      doorRef.SetOpen(True) ; #DEBUG_LINE_NO:9
    Else ; #DEBUG_LINE_NO:
      Int OpenState = doorRef.GetOpenState() ; #DEBUG_LINE_NO:11
      If OpenState == 1 ; #DEBUG_LINE_NO:13
        doorRef.SetOpen(False) ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
      doorRef.SetOpen(False) ; #DEBUG_LINE_NO:17
      doorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
