ScriptName Fragments:TopicInfos:TIF_FFCydoniaZ06_0003B5F5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaZ06_LoganWorried Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FFCydoniaZ06_LoganWorried.Mod(1.0) ; #DEBUG_LINE_NO:8
EndFunction
