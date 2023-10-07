ScriptName TopicInfoAddMapMarker Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ObjectReference Property MapMarkerToAdd Auto Const mandatory
  { The map marker we want to add to the player's map }
EndGroup

Group Optional_Properties
  Bool Property AddOnEnd = True Auto Const
  { If true, add the map marker to the player's map once the line completes (OnEnd). If FALSE, add the marker OnBegin }
  Bool Property AllowFastTravel = False Auto Const
  { If true, the player can immediately fast travel to this map marker }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !AddOnEnd ; #DEBUG_LINE_NO:17
    MapMarkerToAdd.AddToMapScanned(AllowFastTravel) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If AddOnEnd ; #DEBUG_LINE_NO:23
    MapMarkerToAdd.AddToMapScanned(AllowFastTravel) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
