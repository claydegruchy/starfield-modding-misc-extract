ScriptName Fragments:TopicInfos:TIF_FFNeonZ08_0002C311 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property TLQuestion2 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  TLQuestion2.Mod(1.0) ; #DEBUG_LINE_NO:8
EndFunction
