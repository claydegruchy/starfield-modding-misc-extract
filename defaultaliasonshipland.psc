ScriptName DefaultAliasOnShipLand Extends DefaultAliasParent default
{ Sets stage when THIS Alias lands.
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
  sq_playershipscript Property SQ_PlayerShip Auto Const
  { optional, if you want the ship to check for landing zone trigger to clear creatures when the ship lands }
EndGroup

Group Script_Specific_Properties
  Bool Property SetStageWhenLandingComplete = True Auto Const
  { If true (default), stage will be set when landing is complete; if false, stage will be set when landing begins. }
EndGroup


;-- Functions ---------------------------------------

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst ; #DEBUG_LINE_NO:27
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst ; #DEBUG_LINE_NO:30
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild ; #DEBUG_LINE_NO:33
EndFunction

Event OnShipLanding(Bool abComplete)
  If SQ_PlayerShip as Bool && abComplete == False ; #DEBUG_LINE_NO:45
    SQ_PlayerShip.ClearLandingZone(Self.GetShipRef()) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  If SetStageWhenLandingComplete == abComplete ; #DEBUG_LINE_NO:48
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:51
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent
