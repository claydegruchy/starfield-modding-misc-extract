ScriptName Fragments:TopicInfos:TIF_UC04_00226482 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  uc04_questscript kmyQuest = Self.GetOwningQuest() as uc04_questscript ; #DEBUG_LINE_NO:8
  Self.GetOwningQuest().SetStage(810) ; #DEBUG_LINE_NO:11
  kmyQuest.ToggleMarineFollowers(-1) ; #DEBUG_LINE_NO:12
EndFunction
