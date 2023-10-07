ScriptName DefaultAliasOnLocationChange Extends DefaultAliasParent
{ Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is either the New or Old location. }

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
  Bool Property CheckNewLocation = True Auto Const
  { if true (default), <LocationToCheck> is the New Location. If false, <LocationToCheck> is the Old Location }
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

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location LocToCheck = akOldLoc ; #DEBUG_LINE_NO:43
  Location OtherLocToCheck = akNewLoc ; #DEBUG_LINE_NO:44
  If CheckNewLocation ; #DEBUG_LINE_NO:45
    LocToCheck = akNewLoc ; #DEBUG_LINE_NO:46
    OtherLocToCheck = akOldLoc ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, LocToCheck, OtherLocToCheck) ; #DEBUG_LINE_NO:52
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:54
EndEvent
