ScriptName Fragments:TopicInfos:TIF_SE_JP01_00134BDB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const
ReferenceAlias Property Attacking Auto Const
ReferenceAlias Property AttackingShip01 Auto Const
ReferenceAlias Property AttackingShip02 Auto Const
ReferenceAlias Property playerShip Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Self.GetOwningQuest().SetStage(200) ; #DEBUG_LINE_NO:8
  AttackingShip01.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:10
  AttackingShip01.GetShipReference().StartCombat(playerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:11
  AttackingShip02.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:13
  AttackingShip02.GetShipReference().StartCombat(playerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:14
EndFunction
