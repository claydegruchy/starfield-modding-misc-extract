ScriptName SQ_Crew_SpawnManagerScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  ReferenceAlias Property SpawnMarker Auto Const mandatory
  { autofill }
  RefCollectionAlias Property Alias_SpawnedCrewCollection Auto Const mandatory
  { autofill; REMINDER: these are initially disabled refs }
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { autofill; the keyword to link spawned crew members to the spawn marker }
  Int Property StopStage = 9999 Auto Const
  { The stage to set to shut down this quest. }
EndGroup

Group EnableChances
  Int[] Property EnableChances Auto Const mandatory
  { chance for each roll to enable one of the refs in Alias_SpawnedCrewCollection }
EndGroup


;-- Functions ---------------------------------------

Function RollToEnableRefs()
  crewspawnerscript spawnMarkerRef = SpawnMarker.GetReference() as crewspawnerscript ; #DEBUG_LINE_NO:25
  If spawnMarkerRef.GetCanSpawnCrew() == False ; #DEBUG_LINE_NO:27
    Self.SetStopStage() ; #DEBUG_LINE_NO:29
    Return  ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  Int max = spawnMarkerRef.MaxNumberToSpawn ; #DEBUG_LINE_NO:35
  Faction CrewCrimeFaction = spawnMarkerRef.CrewCrimeFaction ; #DEBUG_LINE_NO:36
  ObjectReference[] crewArray = Alias_SpawnedCrewCollection.GetArray() ; #DEBUG_LINE_NO:40
  Int I = 0 ; #DEBUG_LINE_NO:44
  Int iMax = Math.min(max as Float, crewArray.Length as Float) as Int ; #DEBUG_LINE_NO:45
  If iMax > EnableChances.Length ; #DEBUG_LINE_NO:47
    iMax = EnableChances.Length ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  While I < iMax ; #DEBUG_LINE_NO:52
    Bool success = Game.GetDieRollSuccess(EnableChances[I], 1, 100, -1, -1) ; #DEBUG_LINE_NO:53
    If success ; #DEBUG_LINE_NO:55
      Actor theCrew = crewArray[I] as Actor ; #DEBUG_LINE_NO:56
      theCrew.Enable(False) ; #DEBUG_LINE_NO:58
      theCrew.SetCrimeFaction(CrewCrimeFaction) ; #DEBUG_LINE_NO:59
      spawnMarkerRef.AddToSpawnedCrewArray(theCrew) ; #DEBUG_LINE_NO:62
      (theCrew as crewrandomvoicescript).TryToSetCrewVoiceType() ; #DEBUG_LINE_NO:66
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:69
  EndWhile ; #DEBUG_LINE_NO:
  spawnMarkerRef.StartRespawnTimer() ; #DEBUG_LINE_NO:72
  Self.SetStopStage() ; #DEBUG_LINE_NO:73
EndFunction

Function SetStopStage()
  Self.SetStage(StopStage) ; #DEBUG_LINE_NO:79
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:87
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:91
EndFunction
