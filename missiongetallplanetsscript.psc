ScriptName MissionGetAllPlanetsScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
LocationAlias[] Property AllPlanets Auto Const mandatory
{ array of all planet location aliases }

;-- Functions ---------------------------------------

Int Function DebugGetPlanetCount()
  Int planetCount = 0 ; #DEBUG_LINE_NO:10
  Int I = 0 ; #DEBUG_LINE_NO:12
  While I < AllPlanets.Length ; #DEBUG_LINE_NO:13
    Location thePlanet = AllPlanets[I].GetLocation() ; #DEBUG_LINE_NO:14
    If thePlanet ; #DEBUG_LINE_NO:15
      planetCount += 1 ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
  Debug.trace((Self as String + " DebugGetPlanetCount: ") + planetCount as String, 0) ; #DEBUG_LINE_NO:20
  Return planetCount ; #DEBUG_LINE_NO:21
EndFunction

Int Function GetSystemTraitValue()
  Int totalTraitValue = 0 ; #DEBUG_LINE_NO:26
  Int I = 0 ; #DEBUG_LINE_NO:28
  While I < AllPlanets.Length ; #DEBUG_LINE_NO:29
    Location thePlanetLocation = AllPlanets[I].GetLocation() ; #DEBUG_LINE_NO:30
    If thePlanetLocation ; #DEBUG_LINE_NO:31
      planet thePlanet = thePlanetLocation.GetCurrentPlanet() ; #DEBUG_LINE_NO:32
      Int planetTraitValue = SQ_Parent.GetPlanetTraitValue(thePlanet) ; #DEBUG_LINE_NO:33
      totalTraitValue += planetTraitValue ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
  Return totalTraitValue ; #DEBUG_LINE_NO:40
EndFunction
