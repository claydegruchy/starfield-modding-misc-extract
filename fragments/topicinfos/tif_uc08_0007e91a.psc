ScriptName Fragments:TopicInfos:TIF_UC08_0007E91A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC08_532_KaiserHadrian_FinalSampleSecure Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !UC08_532_KaiserHadrian_FinalSampleSecure.IsPlaying() ; #DEBUG_LINE_NO:8
    UC08_532_KaiserHadrian_FinalSampleSecure.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
