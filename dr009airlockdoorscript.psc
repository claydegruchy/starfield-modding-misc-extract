ScriptName DR009AirlockDoorScript Extends ObjectReference

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:4
  If akActionRef == player ; #DEBUG_LINE_NO:5
    ObjectReference cosmeticDoor = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:6
    If cosmeticDoor != None ; #DEBUG_LINE_NO:8
      Int openState = cosmeticDoor.GetOpenState() ; #DEBUG_LINE_NO:9
      If openState == 1 || openState == 2 ; #DEBUG_LINE_NO:11
        cosmeticDoor.SetOpen(False) ; #DEBUG_LINE_NO:12
      ElseIf openState == 3 || openState == 4 ; #DEBUG_LINE_NO:13
        cosmeticDoor.SetOpen(True) ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
