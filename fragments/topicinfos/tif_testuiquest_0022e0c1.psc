ScriptName Fragments:TopicInfos:TIF_TestUIQuest_0022E0C1 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  akSpeakerRef.ShowHangarMenu(0, akSpeaker, None, False) ; #DEBUG_LINE_NO:8
EndFunction
