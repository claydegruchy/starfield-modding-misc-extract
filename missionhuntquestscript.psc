ScriptName MissionHuntQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MissionTypeData
  ReferenceAlias Property MapMarker Auto Const mandatory
  { map marker of target location }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:10
    ObjectReference mapMarkerRef = MapMarker.GetRef() ; #DEBUG_LINE_NO:12
    If mapMarkerRef ; #DEBUG_LINE_NO:13
      mapMarkerRef.AddToMapScanned(False) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:17
EndFunction
