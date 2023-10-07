ScriptName Location Extends Form Native hidden

;-- Functions ---------------------------------------

Function AddKeyword(Keyword akKeyword) Native

Function AddLinkedLocation(Location akLoc, Keyword akKeyword) Native

Int Function CountActors(Keyword apRequiredLinkedRefKeyword, Keyword apExcludeLinkedRefKeyword) Native

Bool Function DisableSpaceTravelToAllExcept(Quest akQuest, Bool abAddLocation) Native

Bool Function EnableSpaceTravel(Quest akQuest, Bool abEnable) Native

Actor[] Function GetActors(Keyword apRequiredLinkedRefKeyword, Keyword apExcludeLinkedRefKeyword) Native

Location[] Function GetAllLinkedLocations(Keyword akKeyword) Native

planet Function GetCurrentPlanet() Native

Float Function GetKeywordData(Keyword akKeyword) Native

Int Function GetMaxLevel() Native

Int Function GetMinLevel() Native

Location[] Function GetParentLocations(Keyword apKeyword) Native

Int Function GetRefTypeAliveCount(LocationRefType akRefType) Native

Int Function GetRefTypeDeadCount(LocationRefType akRefType) Native

Float Function GetValue(ActorValue akActorValue) Native

Bool Function HasCommonParent(Location akOther, Keyword akFilter) Native

Bool Function HasEverBeenExplored() Native

Bool Function HasRefType(LocationRefType akRefType) Native

Bool Function IsChild(Location akOther) Native

Bool Function IsExplored() Native

Bool Function IsLinkedLocation(Location akLocation, Keyword akKeyword) Native

Bool Function IsLoaded() Native

Event OnLocationExplored()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationLoaded()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function RemoveKeyword(Keyword akKeyword) Native

Function RemoveLinkedLocation(Location akLoc, Keyword akKeyword) Native

Function Reset() Native

Function SetExplored(Bool abExplored) Native

Function SetFactionOwner(Faction akFaction) Native

Function SetKeywordData(Keyword akKeyword, Float afData) Native

Function SetMaxLevel(Int aiMaxLevel) Native

Function SetMinLevel(Int aiMinLevel) Native

Function SetNeverResets(Bool abFlag) Native

Function SetValue(ActorValue akActorValue, Float afValue) Native

Bool Function IsSameLocation(Location akOtherLocation, Keyword akKeyword)
{ Returns true if the calling location is the same as the supplied location - if an optional keyword is supplied, it also returns true if the locations share a parent with that keyword, or if either location is a child of the other and the other has that keyword. }
  Bool bmatching = Self == akOtherLocation ; #DEBUG_LINE_NO:78
  If !bmatching && akKeyword as Bool ; #DEBUG_LINE_NO:79
    bmatching = Self.HasCommonParent(akOtherLocation, akKeyword) ; #DEBUG_LINE_NO:80
    If !bmatching && akOtherLocation.HasKeyword(akKeyword) ; #DEBUG_LINE_NO:82
      bmatching = akOtherLocation.IsChild(Self) ; #DEBUG_LINE_NO:83
    ElseIf !bmatching && Self.HasKeyword(akKeyword) ; #DEBUG_LINE_NO:84
      bmatching = Self.IsChild(akOtherLocation) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bmatching ; #DEBUG_LINE_NO:89
EndFunction

Function ModifyKeywordData(Keyword akKeyword, Float afData)
  Float currentValue = Self.GetKeywordData(akKeyword) ; #DEBUG_LINE_NO:94
  Self.SetKeywordData(akKeyword, currentValue + afData) ; #DEBUG_LINE_NO:95
EndFunction

Function ModValue(ActorValue akActorValue, Float afAmount)
  Float currentValue = Self.GetValue(akActorValue) ; #DEBUG_LINE_NO:129
  Self.SetValue(akActorValue, currentValue + afAmount) ; #DEBUG_LINE_NO:130
EndFunction
