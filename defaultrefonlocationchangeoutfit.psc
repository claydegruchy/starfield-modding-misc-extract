ScriptName DefaultRefOnLocationChangeOutfit Extends Actor Const default
{ change outfits on location change }

;-- Structs -----------------------------------------
Struct OutfitChange
  Location NewLocation
  { change outfit when moving TO this location }
  Location OldLocation
  { change outfit when moving FROM this location }
  Outfit ChangeToOutfit
  { outfit to change into }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultrefonlocationchangeoutfit:outfitchange[] Property OutfitChangeList Auto Const
{ list of location/outfit combinations }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Int I = 0 ; #DEBUG_LINE_NO:17
  While I < OutfitChangeList.Length ; #DEBUG_LINE_NO:18
    defaultrefonlocationchangeoutfit:outfitchange theOutfitChange = OutfitChangeList[I] ; #DEBUG_LINE_NO:19
    If theOutfitChange.NewLocation == akNewLoc ; #DEBUG_LINE_NO:20
      Self.SetOutfit(theOutfitChange.ChangeToOutfit, False) ; #DEBUG_LINE_NO:21
    ElseIf theOutfitChange.OldLocation == akOldLoc ; #DEBUG_LINE_NO:22
      Self.SetOutfit(theOutfitChange.ChangeToOutfit, False) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
