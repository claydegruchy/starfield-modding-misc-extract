ScriptName DefaultAliasOnShipGravJump Extends DefaultAliasParent default
{ Sets stage when THIS Alias Grav Jumps.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------
Location startingLocation

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
  Bool Property SetStageWhenJumpingComplete = True Auto Const
  { If true (default) stage will be set when Jump is complete; if false, stage will be set when jump begins. }
  Bool Property SetStageIfJumpingFails = False Auto Const
  { (Default: false) if true, stage will be set if Jump fails; if false, stage will be set if Jump does not fail. }
  Bool Property CheckDestinationLocation = True Auto Const
  { if true (default), <LocationToCheck> is the destination Location. If false, <LocationToCheck> is the starting location }
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

Event OnShipGravJump(Location aDestination, Int aState)
  If aState == 0 ; #DEBUG_LINE_NO:51
    startingLocation = Self.TryToGetCurrentLocation() ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  Bool shouldSetStage = False ; #DEBUG_LINE_NO:55
  If SetStageWhenJumpingComplete == True && aState == 2 || SetStageWhenJumpingComplete == False && aState == 0 || SetStageIfJumpingFails && aState == 3 ; #DEBUG_LINE_NO:56
    shouldSetStage = True ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  If shouldSetStage ; #DEBUG_LINE_NO:61
    Location locationToCheck = None ; #DEBUG_LINE_NO:63
    If CheckDestinationLocation ; #DEBUG_LINE_NO:64
      locationToCheck = aDestination ; #DEBUG_LINE_NO:65
    Else ; #DEBUG_LINE_NO:
      locationToCheck = startingLocation ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, locationToCheck, None) ; #DEBUG_LINE_NO:70
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndEvent
