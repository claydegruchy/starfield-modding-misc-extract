ScriptName Fragments:TopicInfos:TIF_MS06_01003A44 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  ms06_questscript kmyQuest = Self.GetOwningQuest() as ms06_questscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetChoice(2) ; #DEBUG_LINE_NO:11
EndFunction
