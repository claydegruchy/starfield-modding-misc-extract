ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0033A8DB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Neon_VoliiHotel_RentCount.Mod(1.0) ; #DEBUG_LINE_NO:8
EndFunction
