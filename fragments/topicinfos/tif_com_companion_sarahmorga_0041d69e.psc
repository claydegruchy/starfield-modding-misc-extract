ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_0041D69E Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:11
EndFunction
