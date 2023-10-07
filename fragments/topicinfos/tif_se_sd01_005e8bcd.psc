ScriptName Fragments:TopicInfos:TIF_SE_SD01_005E8BCD Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const
ReferenceAlias Property PlayerShip Auto Const
ReferenceAlias Property EscortShip01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  HailingShip.GetShipReference().StartCombat(PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:8
  EscortShip01.GetShipReference().StartCombat(PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:9
EndFunction
