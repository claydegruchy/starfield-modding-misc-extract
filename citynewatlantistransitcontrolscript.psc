ScriptName CityNewAtlantisTransitControlScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property FastTravelOverEncumbered Auto Const mandatory
  { 0 = don't allow fast travel when Over Encumbered, any other value = allow it }
EndGroup

Scene Property CityNewAtlantisTransitScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Travel(ObjectReference DestinationRef)
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  playerRef.SetValue(FastTravelOverEncumbered, 1.0) ; #DEBUG_LINE_NO:11
  CityNewAtlantisTransitScene.Stop() ; #DEBUG_LINE_NO:12
  Game.FastTravel(DestinationRef) ; #DEBUG_LINE_NO:13
  playerRef.SetValue(FastTravelOverEncumbered, 0.0) ; #DEBUG_LINE_NO:14
EndFunction
