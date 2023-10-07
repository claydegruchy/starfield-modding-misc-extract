ScriptName Fragments:TopicInfos:TIF_City_GG_Mark_0014B059 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  OQ.SetStage(960) ; #DEBUG_LINE_NO:9
  OQ.SetStage(963) ; #DEBUG_LINE_NO:10
  OQ.SetStage(980) ; #DEBUG_LINE_NO:11
EndFunction
