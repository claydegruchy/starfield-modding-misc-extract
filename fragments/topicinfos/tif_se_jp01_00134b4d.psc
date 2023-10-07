ScriptName Fragments:TopicInfos:TIF_SE_JP01_00134B4D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  HailingShip.GetShipReference().DisableWithGravJump() ; #DEBUG_LINE_NO:8
EndFunction
