ScriptName Fragments:TopicInfos:TIF_UC07_001F439A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Quest myOQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If !myOQ.GetStageDone(545) ; #DEBUG_LINE_NO:9
    myOQ.SetStage(562) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction
