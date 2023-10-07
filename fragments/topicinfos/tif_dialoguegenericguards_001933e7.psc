ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_001933E7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RedMileLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  RedMileLocationMiscPointer.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction
