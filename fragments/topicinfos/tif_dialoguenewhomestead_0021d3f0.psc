ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0021D3F0 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR05Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FFNewHomesteadR05Misc.Start() ; #DEBUG_LINE_NO:8
EndFunction
