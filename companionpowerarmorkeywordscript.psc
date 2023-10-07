ScriptName CompanionPowerArmorKeywordScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property pAttachPassenger Auto Const
Keyword Property pAttachSlot2 Auto Const
Keyword Property isPowerArmorFrame Auto Const

;-- Functions ---------------------------------------

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(isPowerArmorFrame) == True ; #DEBUG_LINE_NO:11
    Self.RemoveKeyword(pAttachPassenger) ; #DEBUG_LINE_NO:13
    Self.AddKeyword(pAttachSlot2) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(isPowerArmorFrame) == True ; #DEBUG_LINE_NO:21
    Self.RemoveKeyword(pAttachSlot2) ; #DEBUG_LINE_NO:23
    Self.AddKeyword(pAttachPassenger) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
