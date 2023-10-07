ScriptName Fragments:TopicInfos:TIF_DialogueParadiso_PD_004BF5CB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PD_EnhanceSpecialVouchers.SetValue(0.0) ; #DEBUG_LINE_NO:8
EndFunction
