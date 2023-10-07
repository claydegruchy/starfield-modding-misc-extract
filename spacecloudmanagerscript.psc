ScriptName SpaceCloudManagerScript Extends ObjectReference
{ Parent script for Space Cloud Manager Objects.
When placed in a cell with space cloud hazards, a manager handles adding or removing effects from ships under the influence of the cloud.
This allows us to do things like add or remove perks, or periodically cast scripted spells, which the hazard system doesn't normally support. }

;-- Variables ---------------------------------------
Int CONST_FarTravelStateDeparture = 0 Const
Int CONST_GravJumpStateAnimStarted = 1 Const
Float CONST_HazardValueMax = 100000.0 Const
Float CONST_SpaceCloudHazardTimerDelay = 0.25 Const
Int CONST_SpaceCloudHazardTimerID = 1 Const
Bool spaceTransitionInProgress

;-- Properties --------------------------------------
Group RequiredProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { SQ_PlayerShip's PlayerShip alias. }
  ActorValue Property UpdateTimestampValue Auto Const
  { Actor value used to timestamp when each ship was last updated by this script. }
EndGroup

Group GeneralProperties
  RefCollectionAlias Property PotentialTargets Auto Const
  { Optional. RefCollection of ships that may be affected in addition to the player's ship.
	NPC ships not in this collection will not be affected.
	Space clouds are not generic-- you have to know in advance which ships might end up in the cell. }
  ActorValue Property HazardValue Auto Const
  { Optional.
	If set, apply our effects only to to ships where this value is <0.
	If not set, apply our effects to all target ships. }
  Bool Property ShouldOverrideConditionsForNPCShips = False Auto Const
  { Default=False. Should we apply our effects to all NPC ships in the PotentialTargets array, ignoring the Docked and Dead states? }
EndGroup


;-- Functions ---------------------------------------

Function ApplyCloudEffect(spaceshipreference target, Float currentTime)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function RemoveCloudEffect(spaceshipreference target)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  Self.StartTimer(0.0, CONST_SpaceCloudHazardTimerID) ; #DEBUG_LINE_NO:42
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel") ; #DEBUG_LINE_NO:43
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:44
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If aState == CONST_FarTravelStateDeparture ; #DEBUG_LINE_NO:48
    spaceTransitionInProgress = True ; #DEBUG_LINE_NO:49
  Else ; #DEBUG_LINE_NO:
    spaceTransitionInProgress = False ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, Int aState)
  If aState == CONST_GravJumpStateAnimStarted ; #DEBUG_LINE_NO:56
    spaceTransitionInProgress = True ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    spaceTransitionInProgress = False ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int timerID)
  If timerID == CONST_SpaceCloudHazardTimerID ; #DEBUG_LINE_NO:65
    spaceshipreference[] potentialTargetRefs = None ; #DEBUG_LINE_NO:68
    If PotentialTargets != None ; #DEBUG_LINE_NO:69
      potentialTargetRefs = PotentialTargets.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    If potentialTargetRefs == None ; #DEBUG_LINE_NO:72
      potentialTargetRefs = new spaceshipreference[0] ; #DEBUG_LINE_NO:73
    EndIf ; #DEBUG_LINE_NO:
    potentialTargetRefs.insert(PlayerShip.GetShipRef(), 0) ; #DEBUG_LINE_NO:75
    If Self.Is3DLoaded() ; #DEBUG_LINE_NO:78
      Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:80
      Int I = 0 ; #DEBUG_LINE_NO:81
      While I < potentialTargetRefs.Length ; #DEBUG_LINE_NO:82
        If potentialTargetRefs[I] != None ; #DEBUG_LINE_NO:83
          Self.TryToApplyCloudEffect(potentialTargetRefs[I], currentTime) ; #DEBUG_LINE_NO:84
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:86
      EndWhile ; #DEBUG_LINE_NO:
      Self.StartTimer(CONST_SpaceCloudHazardTimerDelay, CONST_SpaceCloudHazardTimerID) ; #DEBUG_LINE_NO:88
    Else ; #DEBUG_LINE_NO:
      Int i = 0 ; #DEBUG_LINE_NO:91
      While i < potentialTargetRefs.Length ; #DEBUG_LINE_NO:92
        If potentialTargetRefs[i] != None ; #DEBUG_LINE_NO:93
          Self.TryToClearCloudEffect(potentialTargetRefs[i]) ; #DEBUG_LINE_NO:94
        EndIf ; #DEBUG_LINE_NO:
        i += 1 ; #DEBUG_LINE_NO:96
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TryToApplyCloudEffect(spaceshipreference target, Float currentTime)
  If !spaceTransitionInProgress && target.IsEnabled() && (ShouldOverrideConditionsForNPCShips && target != PlayerShip.GetShipRef() || !target.IsDead() && !target.IsDocked()) ; #DEBUG_LINE_NO:104,105,106
    If HazardValue != None && target == PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:107
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If HazardValue == None || target.GetValue(HazardValue) < 0.0 ; #DEBUG_LINE_NO:110
      Self.ApplyCloudEffect(target, currentTime) ; #DEBUG_LINE_NO:111
      If HazardValue != None ; #DEBUG_LINE_NO:112
        target.RestoreValue(HazardValue, CONST_HazardValueMax) ; #DEBUG_LINE_NO:113
      EndIf ; #DEBUG_LINE_NO:
      target.SetValue(UpdateTimestampValue, currentTime) ; #DEBUG_LINE_NO:115
    ElseIf target.GetValue(UpdateTimestampValue) > 0.0 ; #DEBUG_LINE_NO:116
      Self.RemoveCloudEffect(target) ; #DEBUG_LINE_NO:117
      target.SetValue(UpdateTimestampValue, 0.0) ; #DEBUG_LINE_NO:118
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToClearCloudEffect(spaceshipreference target)
  Self.RemoveCloudEffect(target) ; #DEBUG_LINE_NO:125
  If HazardValue != None ; #DEBUG_LINE_NO:126
    target.RestoreValue(HazardValue, CONST_HazardValueMax) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  target.SetValue(UpdateTimestampValue, 0.0) ; #DEBUG_LINE_NO:129
EndFunction
