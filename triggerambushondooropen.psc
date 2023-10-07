ScriptName TriggerAmbushOnDoorOpen Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  defaultrefambushtrigger2 ambushTriggerVolume = Self.GetLinkedRef(None) as defaultrefambushtrigger2 ; #DEBUG_LINE_NO:4
  ambushTriggerVolume.TriggerAmbush() ; #DEBUG_LINE_NO:6
EndEvent
