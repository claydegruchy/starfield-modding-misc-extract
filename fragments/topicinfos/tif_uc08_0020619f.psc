ScriptName Fragments:TopicInfos:TIF_UC08_0020619F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC08_475_HadrianKaiser_Analysis Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !UC08_475_HadrianKaiser_Analysis.IsPlaying() ; #DEBUG_LINE_NO:8
    UC08_475_HadrianKaiser_Analysis.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
