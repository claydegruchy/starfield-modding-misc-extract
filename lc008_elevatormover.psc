ScriptName LC008_ElevatorMover Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
{ End Position }
Keyword Property LinkCustom02 Auto Const
{ Start Position }
Keyword Property LinkCustom03 Auto Const mandatory
{ Door to Slayton }
Float Property TranslationSpeed = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference StartPosition = Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:12
  Self.SetPosition(StartPosition.GetPositionX(), StartPosition.GetPositionY(), StartPosition.GetPositionZ()) ; #DEBUG_LINE_NO:13
  Self.TranslateToRef(Self.GetLinkedRef(LinkCustom01), TranslationSpeed, 0.0) ; #DEBUG_LINE_NO:14
EndEvent

Event OnTranslationComplete()
  Self.GetLinkedRef(LinkCustom03).SetOpen(True) ; #DEBUG_LINE_NO:19
EndEvent
