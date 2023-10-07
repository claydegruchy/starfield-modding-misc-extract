ScriptName BQ01_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property MapMarker_Temple Auto Const mandatory
  LocationAlias Property Location_Temple Auto Const mandatory
  LocationAlias Property Location_TemplePlanet Auto Const mandatory
  Keyword Property MQTempleQuestActive Auto Const mandatory
  Keyword Property BQ01_Keyword_TempleLocation Auto Const mandatory
  Quest Property MQ_TempleQuest_SpawnTemple Auto Const mandatory
  Quest Property StarbornTempleQuest Auto Const mandatory
  inputenablelayer Property BQ01_EnableLayer Auto
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Location TemplePlanetLocation = Location_TemplePlanet.GetLocation().GetCurrentPlanet().GetLocation() ; #DEBUG_LINE_NO:16
  Location TempleLocation = Location_Temple.GetLocation() ; #DEBUG_LINE_NO:17
  TemplePlanetLocation.AddKeyword(MQTempleQuestActive) ; #DEBUG_LINE_NO:18
  TempleLocation.AddKeyword(BQ01_Keyword_TempleLocation) ; #DEBUG_LINE_NO:19
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
  akMapMarker.Enable(False) ; #DEBUG_LINE_NO:23
  akMapMarker.AddtoMapScanned(True) ; #DEBUG_LINE_NO:24
  akMapMarker.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:25
  akMapMarker.SetRequiresScanning(False) ; #DEBUG_LINE_NO:26
  akMapMarker.EnableFastTravel(True) ; #DEBUG_LINE_NO:27
EndFunction

Function TempleDiscovered()
  Self.SetMapMarkerFlags(MapMarker_Temple.GetRef()) ; #DEBUG_LINE_NO:36
  Int iArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).FindSigmaArtifactBarrett() ; #DEBUG_LINE_NO:39
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, Location_Temple.GetLocation()) ; #DEBUG_LINE_NO:40
EndFunction
