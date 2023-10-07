ScriptName TeleportPlayerToLinkedRefScript Extends ObjectReference

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:4
  ObjectReference moveToRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:5
  If moveToRef != None ; #DEBUG_LINE_NO:7
    player.MoveTo(moveToRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
