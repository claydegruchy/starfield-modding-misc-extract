ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_00267691 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  fcneon_kosmosorgresourcesscript kmyQuest = Self.GetOwningQuest() as fcneon_kosmosorgresourcesscript ; #DEBUG_LINE_NO:8
  kmyQuest.SellResource(kmyQuest.RESOURCETYPE_POLYMER) ; #DEBUG_LINE_NO:11
EndFunction
