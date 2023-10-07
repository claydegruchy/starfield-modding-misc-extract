ScriptName DefaultRefOnDeath Extends DefaultActorParent default
{ Sets stage when THIS actor dies.
<RefToCheck> is the killer of THIS actor's reference.
<LocationToCheck> is the current location of THIS actor's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property UseOnDyingInstead = False Auto Const
  { (Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent. }
EndGroup

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
  Return PlayerOnly ; #DEBUG_LINE_NO:43
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return ReferencesToCheckAgainst ; #DEBUG_LINE_NO:46
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return AliasesToCheckAgainst ; #DEBUG_LINE_NO:49
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return FactionsToCheckAgainst ; #DEBUG_LINE_NO:52
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst ; #DEBUG_LINE_NO:55
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst ; #DEBUG_LINE_NO:58
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild ; #DEBUG_LINE_NO:61
EndFunction

Event OnDeath(ObjectReference akKiller)
  If UseOnDyingInstead == False ; #DEBUG_LINE_NO:68
    Self.DeathComplete(akKiller) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  If UseOnDyingInstead == True ; #DEBUG_LINE_NO:74
    Self.DeathComplete(akKiller) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DeathComplete(ObjectReference akKiller)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akKiller, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:82
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:84
EndFunction
