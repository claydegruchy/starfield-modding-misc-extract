ScriptName Fragments:TopicInfos:TIF_MS02_00339224 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.FadeOutGame(True, True, 1.0, 1.0, True) ; #DEBUG_LINE_NO:8
EndFunction
