ScriptName Fragments:TopicInfos:TIF_UC09_PostQuestline_Hadri_001A2EDE Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property HadrianWrapUpComplete Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  HadrianWrapUpComplete.SetValue(1.0) ; #DEBUG_LINE_NO:10
EndFunction
