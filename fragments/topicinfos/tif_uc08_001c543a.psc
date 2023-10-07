ScriptName Fragments:TopicInfos:TIF_UC08_001C543A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  uc08questscript kmyQuest = Self.GetOwningQuest() as uc08questscript ; #DEBUG_LINE_NO:8
  kmyQuest.ToggleFollowerState(-1) ; #DEBUG_LINE_NO:11
EndFunction
