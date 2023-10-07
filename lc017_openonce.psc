ScriptName LC017_OpenOnce Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToPowerSource Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If Self.GetLinkedRef(LinkToPowerSource).IsPowered() ; #DEBUG_LINE_NO:6
    Self.GetLinkedRef(None).SetOpen(True) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
