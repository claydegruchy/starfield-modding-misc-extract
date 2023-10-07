ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00005AB9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property BQ01_PQ_LockedInReminder Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  BQ01_PQ_LockedInReminder.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:8
EndFunction
