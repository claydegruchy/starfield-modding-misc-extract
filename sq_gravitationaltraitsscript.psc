ScriptName SQ_GravitationalTraitsScript Extends Quest
{ quest script to randomize gravitational anomaly traits }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlanetTrait26GravitationalAnomaly Auto Const mandatory
Keyword Property PlanetTrait26GravitationalAnomaly_Close Auto Const mandatory
LocationAlias[] Property OldPlanets Auto Const
{ list of planet location aliases - remove the trait from all of these }
LocationAlias[] Property NewPlanets Auto Const
{ list of planet location aliases - put the trait on all of these }
LocationAlias[] Property ClosePlanets Auto Const
{ List of location aliases for the designated "closer" planets }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int I = 0 ; #DEBUG_LINE_NO:19
  While I < OldPlanets.Length ; #DEBUG_LINE_NO:20
    Location thePlanetLocation = OldPlanets[I].GetLocation() ; #DEBUG_LINE_NO:21
    If thePlanetLocation ; #DEBUG_LINE_NO:22
      thePlanetLocation.RemoveKeyword(PlanetTrait26GravitationalAnomaly) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:29
  While I < NewPlanets.Length ; #DEBUG_LINE_NO:30
    Location theplanetlocation = NewPlanets[I].GetLocation() ; #DEBUG_LINE_NO:31
    If theplanetlocation ; #DEBUG_LINE_NO:32
      theplanetlocation.AddKeyword(PlanetTrait26GravitationalAnomaly) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:39
  While I < ClosePlanets.Length ; #DEBUG_LINE_NO:40
    Location theplanetlocation = ClosePlanets[I].GetLocation() ; #DEBUG_LINE_NO:41
    If theplanetlocation ; #DEBUG_LINE_NO:42
      theplanetlocation.AddKeyword(PlanetTrait26GravitationalAnomaly_Close) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:45
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
