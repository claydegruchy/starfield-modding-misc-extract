ScriptName Fragments:TopicInfos:TIF_UC01_002E8599 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MostRecentSceneMarker Auto Const mandatory
ReferenceAlias Property SectorASceneMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  MostRecentSceneMarker.ForceRefTo(SectorASceneMarker.GetRef()) ; #DEBUG_LINE_NO:8
EndFunction
