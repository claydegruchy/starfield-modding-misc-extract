ScriptName DefaultAliasOnDeath Extends DefaultAliasParent default
{ Sets stage when THIS Alias dies.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the killer of THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property UseOnDyingInstead = False Auto Const
  { (Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent. }
  Bool Property ClearAliasOnDeath = False Auto Const
  { (Default: False) If true, this alias will be cleared when the Actor dies. Note the Alias must be Optional to successfully clear. }
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
  Return PlayerOnly ; #DEBUG_LINE_NO:47
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return ReferencesToCheckAgainst ; #DEBUG_LINE_NO:50
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return AliasesToCheckAgainst ; #DEBUG_LINE_NO:53
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return FactionsToCheckAgainst ; #DEBUG_LINE_NO:56
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return LocationsToCheckAgainst ; #DEBUG_LINE_NO:59
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return LocationAliasesToCheckAgainst ; #DEBUG_LINE_NO:62
EndFunction

Bool Function GetLocationMatchIfChild()
  Return LocationMatchIfChild ; #DEBUG_LINE_NO:65
EndFunction

Event OnDeath(ObjectReference akKiller)
  If UseOnDyingInstead == False ; #DEBUG_LINE_NO:72
    Self.DeathComplete(akKiller) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If ClearAliasOnDeath == True ; #DEBUG_LINE_NO:76
    Self.Clear() ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  If UseOnDyingInstead == True ; #DEBUG_LINE_NO:82
    Self.DeathComplete(akKiller) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DeathComplete(ObjectReference akKiller)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akKiller, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:90
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:92
EndFunction
