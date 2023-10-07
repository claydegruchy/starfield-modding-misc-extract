ScriptName Fragments:TopicInfos:TIF_TestSteveCQuest_00160C25 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Variable01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  akSpeaker.SetValue(Variable01, 0.0) ; #DEBUG_LINE_NO:8
  akSpeaker.EvaluatePackage(False) ; #DEBUG_LINE_NO:9
EndFunction
