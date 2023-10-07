ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D2885 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:8
EndFunction
