ScriptName Fragments:TopicInfos:TIF_COM_Quest_SarahMorgan_Q0_0028910C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_SMQ01_TrustToggle Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  COM_SMQ01_TrustToggle.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
