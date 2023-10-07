ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_0041D8AD Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.CommitmentDesired(True) ; #DEBUG_LINE_NO:11
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:12
EndFunction
