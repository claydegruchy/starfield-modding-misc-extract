ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00005ABA Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property BQ01_PQ_LockedInReminder Auto Const mandatory
Message Property BQ02_PQ_LockedInReminder Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  BQ02_PQ_LockedInReminder.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:11
EndFunction
