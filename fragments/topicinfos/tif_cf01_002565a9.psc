ScriptName Fragments:TopicInfos:TIF_CF01_002565A9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PlayerKnows_CrimsonFleet.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
