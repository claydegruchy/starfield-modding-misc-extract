ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0100BA1C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property pNeon_VoliiHotel_RentCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  pNeon_VoliiHotel_RentCount.Mod(1.0) ; #DEBUG_LINE_NO:8
EndFunction
