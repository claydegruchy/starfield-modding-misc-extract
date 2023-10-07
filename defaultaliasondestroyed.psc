ScriptName DefaultAliasOnDestroyed Extends DefaultAliasParent default
{ Sets stage when THIS Alias is destroyed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the destroyer of THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RefToCheck_Optional_Properties
  Bool Property PlayerOnly = False Auto Const
  { If true, <RefToCheck> must be player and all other <RefToCheck> properties will be IGNORED. }
  ObjectReference[] Property ReferencesToCheckAgainst Auto Const
  { <RefToCheck> must be one of these references. IGNORED if PlayerOnly is true. }
  ReferenceAlias[] Property AliasesToCheckAgainst Auto Const
  { <RefToCheck> must be one in one of these references. IGNORED if PlayerOnly is true. }
  Faction[] Property FactionsToCheckAgainst Auto Const
  { <RefToCheck> must be in one of these factions. IGNORED if PlayerOnly is true. }
EndGroup

Group LocationToCheck_Optional_Properties
  Location[] Property LocationsToCheckAgainst Auto Const
  { <LocationToCheck> must be one of these references }
  LocationAlias[] Property LocationAliasesToCheckAgainst Auto Const
  { <LocationToCheck> must be in one of these location aliases }
  Bool Property LocationMatchIfChild = False Auto Const
  { (Default: false) If true, <LocationToCheck> may be a child of locations in LocationsToCheck or LocationAliasesToCheck }
EndGroup


;-- Functions ---------------------------------------

Bool Function GetPlayerOnly()
  Return PlayerOnly ; #DEBUG_LINE_NO:39
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return ReferencesToCheckAgainst ; #DEBUG_LINE_NO:42
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return AliasesToCheckAgainst ; #DEBUG_LINE_NO:45
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return FactionsToCheckAgainst ; #DEBUG_LINE_NO:48
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst ; #DEBUG_LINE_NO:51
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst ; #DEBUG_LINE_NO:54
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild ; #DEBUG_LINE_NO:57
EndFunction

Event OnDestroyed(ObjectReference akDestroyer)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akDestroyer, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:66
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:68
EndEvent
