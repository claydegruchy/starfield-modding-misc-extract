ScriptName DefaultAlias Extends DefaultAliasParent hidden
{ Master script for the DefaultAlias scripts.
<QuestToSetOrCheck> is THIS ReferenceAlias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing THIS ReferenceAlias.
<LocationToCheck> is the current location of THIS ReferenceAlias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RefToCheck_Optional_Properties
  Bool Property PlayerOnly = True Auto Const
  { If true (default), <RefToCheck> must be player and all other <RefToCheck> properties will be IGNORED. }
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

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

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
