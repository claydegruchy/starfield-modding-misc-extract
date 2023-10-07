ScriptName UC07_NiiraScrapperSlateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference[] Property MarkersToAdd Auto Const mandatory
{ Give the player all the map markers in and around 1-Of-A-Kind }
GlobalVariable Property UC07_PlayerKnowsAllMechyardMarkers Auto Const mandatory
{ Global used to shut down this loop so we're not processing it after the player
has all the markers }

;-- Functions ---------------------------------------

Event OnRead()
  If UC07_PlayerKnowsAllMechyardMarkers.GetValue() < 1.0 ; #DEBUG_LINE_NO:12
    Int I = 0 ; #DEBUG_LINE_NO:13
    Int iLength = MarkersToAdd.Length ; #DEBUG_LINE_NO:14
    While I < iLength ; #DEBUG_LINE_NO:16
      ObjectReference currMarker = MarkersToAdd[I] ; #DEBUG_LINE_NO:17
      If !currMarker.IsMapMarkerVisible() ; #DEBUG_LINE_NO:19
        currMarker.AddToMapScanned(False) ; #DEBUG_LINE_NO:20
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:23
    EndWhile ; #DEBUG_LINE_NO:
    UC07_PlayerKnowsAllMechyardMarkers.SetValue(1.0) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndEvent
