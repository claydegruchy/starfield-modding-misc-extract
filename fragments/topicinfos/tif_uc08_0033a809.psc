ScriptName Fragments:TopicInfos:TIF_UC08_0033A809 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC08_AB_AnomalyBattle Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  UC08_AB_AnomalyBattle.SetStage(100) ; #DEBUG_LINE_NO:8
EndFunction
