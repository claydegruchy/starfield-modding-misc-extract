ScriptName Fragments:TopicInfos:TIF_UC07_001F43C3 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_SirenXenoweapons Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PlayerKnows_SirenXenoweapons.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
