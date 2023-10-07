ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_Hadrian_001B3E67 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property HadrianECQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  HadrianECQuest.SetStage(450) ; #DEBUG_LINE_NO:8
EndFunction
