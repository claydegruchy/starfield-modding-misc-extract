ScriptName Fragments:TopicInfos:TIF_UC04_0022649C Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  uc04_questscript kmyQuest = Self.GetOwningQuest() as uc04_questscript ; #DEBUG_LINE_NO:8
  kmyQuest.ToggleMarineFollowers(-1) ; #DEBUG_LINE_NO:11
EndFunction
