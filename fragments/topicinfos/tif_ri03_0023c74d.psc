ScriptName Fragments:TopicInfos:TIF_RI03_0023C74D Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  ri03_questscript kmyQuest = Self.GetOwningQuest() as ri03_questscript ; #DEBUG_LINE_NO:8
  kmyQuest.AddToSimonCount() ; #DEBUG_LINE_NO:11
EndFunction
