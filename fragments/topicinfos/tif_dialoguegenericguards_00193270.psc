ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_00193270 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property GagarinLocationMiscPointer Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  GagarinLocationMiscPointer.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction
