ScriptName Fragments:TopicInfos:TIF_UC01_002FC335 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property UC01_DEBUG_FinalScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  UC01_DEBUG_FinalScene.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:8
EndFunction
