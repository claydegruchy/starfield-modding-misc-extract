ScriptName Fragments:TopicInfos:TIF_DialogueParadiso_PD_004BF615 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PD_PlayerHasHotelRoomDiscount.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
