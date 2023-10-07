ScriptName DefaultAliasOnShipTakeOff Extends DefaultAliasParent default
{ Sets stage when THIS Alias takes off.
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
  Bool Property SetStageWhenTakeOffComplete = True Auto Const
  { If true (default) stage will be set when take of is complete. If false, stage will be set when take of begins. }
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

Event OnShipTakeOff(Bool abComplete)
  If SetStageWhenTakeOffComplete == abComplete ; #DEBUG_LINE_NO:44
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:47
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent
