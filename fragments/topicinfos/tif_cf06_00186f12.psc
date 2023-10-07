ScriptName Fragments:TopicInfos:TIF_CF06_00186F12 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeon Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  DialogueFCNeon.SetStage(400) ; #DEBUG_LINE_NO:8
EndFunction
