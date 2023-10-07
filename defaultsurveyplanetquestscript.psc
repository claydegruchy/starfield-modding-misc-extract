ScriptName DefaultSurveyPlanetQuestScript Extends Quest default
{ script to set a stage when a specified planet has been surveyed }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
{ should point to SQ_PlayerShip, PlayerShip alias }
LocationAlias Property TargetSystemLocation Auto Const
LocationAlias Property TargetPlanetLocation Auto Const
Keyword Property LocTypeMajorOrbital Auto Const mandatory
{ used to check if something is a planet or moon }
Int Property SurveyCompleteStage = -1 Auto Const mandatory
{ stage to set when planet survey is complete }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete") ; #DEBUG_LINE_NO:19
EndEvent

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, planet akPlanet)
  spaceshipreference playershipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:24
  Location currentLocation = playershipRef.GetCurrentLocation() ; #DEBUG_LINE_NO:25
  If currentLocation.IsSameLocation(TargetPlanetLocation.GetLocation(), LocTypeMajorOrbital) && Self.GetStageDone(SurveyCompleteStage) == False ; #DEBUG_LINE_NO:29
    Self.SetStage(SurveyCompleteStage) ; #DEBUG_LINE_NO:30
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerPlanetSurveyComplete") ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent
