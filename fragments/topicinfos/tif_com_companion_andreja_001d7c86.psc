ScriptName Fragments:TopicInfos:TIF_COM_Companion_Andreja_001D7C86 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.AngerSceneCompleted() ; #DEBUG_LINE_NO:11
EndFunction
