ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuardsShi_001933E8 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property GagarinLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  GagarinLocationMiscPointer.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction
