ScriptName DefaultAliasOnShipRefueled Extends DefaultAliasParent default
{ Sets stage when THIS Alias refuels.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group LocationToCheck_Optional_Properties
  Location[] Property LocationsToCheckAgainst Auto Const
  { <LocationToCheck> must be one of these references }
  LocationAlias[] Property LocationAliasesToCheckAgainst Auto Const
  { <LocationToCheck> must be in one of these location aliases }
  Bool Property LocationMatchIfChild = False Auto Const
  { (Default: false) If true, <LocationToCheck> may be a child of locations in LocationsToCheck or LocationAliasesToCheck }
EndGroup

Group Script_Specific_Properties
  ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
  { The actor value which holds current/max fuel value for ships }
  Bool Property RequireFullyRefueled = False Auto Const
  { If true (default), stage will be set when fueling is complete, only if completely refueled; if false, stage will be set when fueling completes, regardless of much fuel was added. }
EndGroup


;-- Functions ---------------------------------------

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst ; #DEBUG_LINE_NO:24
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst ; #DEBUG_LINE_NO:27
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild ; #DEBUG_LINE_NO:30
EndFunction

Event OnShipRefueled(Int aFuelAdded)
  If aFuelAdded > 0 ; #DEBUG_LINE_NO:47
    If RequireFullyRefueled == False ; #DEBUG_LINE_NO:48
      Self.RefuelSuccessful() ; #DEBUG_LINE_NO:49
    Else ; #DEBUG_LINE_NO:
      ObjectReference shipRef = Self.GetRef() ; #DEBUG_LINE_NO:52
      Float currentFuel = shipRef.GetValue(SpaceshipGravJumpFuel) ; #DEBUG_LINE_NO:53
      If currentFuel >= shipRef.GetBaseValue(SpaceshipGravJumpFuel) ; #DEBUG_LINE_NO:54
        Self.RefuelSuccessful() ; #DEBUG_LINE_NO:55
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RefuelSuccessful()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:64
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:66
EndFunction
