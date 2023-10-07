ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0016013E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_Seogka Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PlayerKnows_Seogka.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
