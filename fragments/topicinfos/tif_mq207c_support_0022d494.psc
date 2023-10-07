ScriptName Fragments:TopicInfos:TIF_MQ207C_Support_0022D494 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ207C Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  MQ207C.SetStage(22) ; #DEBUG_LINE_NO:9
EndFunction
