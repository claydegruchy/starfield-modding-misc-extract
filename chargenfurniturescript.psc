ScriptName CharGenFurnitureScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart") ; #DEBUG_LINE_NO:4
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.UnRegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart") ; #DEBUG_LINE_NO:8
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:9
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:14
    Self.RegisterForAnimationEvent(Game.GetPlayer() as ObjectReference, "CharacterGenStart") ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
