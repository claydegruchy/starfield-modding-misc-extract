ScriptName Fragments:TopicInfos:TIF_DialogueFCAkilaCity_001A468B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  EleosLocationMiscPointer.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction
