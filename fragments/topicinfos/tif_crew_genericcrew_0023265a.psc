ScriptName Fragments:TopicInfos:TIF_CREW_GenericCrew_0023265A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property CREW_MessageGenericCrew_Warning Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  CREW_MessageGenericCrew_Warning.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:8
EndFunction
