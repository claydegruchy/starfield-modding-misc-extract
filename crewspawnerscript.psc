ScriptName CrewSpawnerScript Extends ObjectReference
{ Used to set spawn limits for the location by setting this data on the reference found by SQ_Crew_SpawnManager to spawn at }

;-- Variables ---------------------------------------
Bool canSpawnCrew = True
Int respawnIntervalTimerID = 1 Const
Actor[] spawnedCrew

;-- Properties --------------------------------------
Group SpawnLimits
  Int Property MaxNumberToSpawn = 6 Auto Const
  { the max number to spawn }
  Int Property RespawnIntervalLocalDays = 3 Auto Const
  { the interval to respawn these actors in local days }
EndGroup

Group ActorData
  Faction Property CrewCrimeFaction Auto Const
  { the crime faction to assign }
EndGroup

Group Autofill
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { the keyword that links generic crew members to this spawn marker }
EndGroup


;-- Functions ---------------------------------------

Bool Function GetCanSpawnCrew()
  Return canSpawnCrew ; #DEBUG_LINE_NO:27
EndFunction

Function StartRespawnTimer()
  canSpawnCrew = False ; #DEBUG_LINE_NO:31
  Self.GoToState("RespawnTimer") ; #DEBUG_LINE_NO:32
EndFunction

Function ClearSpawnedCrewArray()
  spawnedCrew.clear() ; #DEBUG_LINE_NO:64
EndFunction

Function AddToSpawnedCrewArray(Actor crewMember)
  If !spawnedCrew ; #DEBUG_LINE_NO:71
    spawnedCrew = new Actor[0] ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
  spawnedCrew.add(crewMember, 1) ; #DEBUG_LINE_NO:75
  crewMember.SetLinkedRef(Self as ObjectReference, LinkGenericCrewSpawnMarker, True) ; #DEBUG_LINE_NO:78
EndFunction

Function RemoveFromSpawnedCrewArray(Actor crewMember)
  Int foundIndex = spawnedCrew.find(crewMember, 0) ; #DEBUG_LINE_NO:86
  If foundIndex > -1 ; #DEBUG_LINE_NO:87
    spawnedCrew.remove(foundIndex, 1) ; #DEBUG_LINE_NO:88
    crewMember.SetLinkedRef(None, LinkGenericCrewSpawnMarker, True) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PrepareForRespawn()
  Int I = 0 ; #DEBUG_LINE_NO:100
  While I < spawnedCrew.Length ; #DEBUG_LINE_NO:101
    Actor theCrew = spawnedCrew[I] ; #DEBUG_LINE_NO:102
    If theCrew.GetCrewAssignment() == None ; #DEBUG_LINE_NO:103
      theCrew.DisableNoWait(False) ; #DEBUG_LINE_NO:104
      theCrew.Delete() ; #DEBUG_LINE_NO:105
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:107
  EndWhile ; #DEBUG_LINE_NO:
  Self.ClearSpawnedCrewArray() ; #DEBUG_LINE_NO:114
  canSpawnCrew = True ; #DEBUG_LINE_NO:117
EndFunction

;-- State -------------------------------------------
State LoadedAfterTimerComplete

  Event OnBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    Self.PrepareForRespawn() ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State RespawnTimer

  Event OnTimerGameTime(Int aiTimerID)
    If aiTimerID == respawnIntervalTimerID ; #DEBUG_LINE_NO:
      If Self.Is3DLoaded() ; #DEBUG_LINE_NO:
        Self.GoToState("LoadedAfterTimerComplete") ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.PrepareForRespawn() ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimerGameTime(RespawnIntervalLocalDays as Float * Self.GetDayLength(), respawnIntervalTimerID) ; #DEBUG_LINE_NO:38
  EndEvent
EndState
