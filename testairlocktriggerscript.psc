ScriptName TestAirlockTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ArmorTypeHelmet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (Self.GetLinkedRef(None) as testairlockscript01).bPowerered == False ; #DEBUG_LINE_NO:7
     ; #DEBUG_LINE_NO:
  ElseIf Self.GetLinkedRef(None).GetOpenState() == 3 && Self.GetLinkedRef(None).IsLocked() == False ; #DEBUG_LINE_NO:11
    If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet) ; #DEBUG_LINE_NO:12
      Self.GetLinkedRef(None).Activate(akActionRef, True) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If (Self.GetLinkedRef(None) as testairlockscript01).bPowerered == False ; #DEBUG_LINE_NO:24
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    While Self.GetLinkedRef(None).GetOpenState() == 2 ; #DEBUG_LINE_NO:28
      Utility.Wait(0.25) ; #DEBUG_LINE_NO:29
    EndWhile ; #DEBUG_LINE_NO:
    If Self.GetLinkedRef(None).GetOpenState() == 1 ; #DEBUG_LINE_NO:33
      If Self.GetTriggerObjectCount() == 0 ; #DEBUG_LINE_NO:34
        Self.GetLinkedRef(None).Activate(akActionRef, True) ; #DEBUG_LINE_NO:35
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
