ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00027B69 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
Quest Property FFNewHomesteadR04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FFNewHomesteadR04Misc.SetStage(100) ; #DEBUG_LINE_NO:8
EndFunction
