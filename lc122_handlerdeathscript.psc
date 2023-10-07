ScriptName LC122_HandlerDeathScript Extends Actor Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  If akKiller == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:4
    ObjectReference enableMarker = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:5
    enableMarker.Disable(False) ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent
