ScriptName Fragments:TopicInfos:TIF_SE_KMK01_0005B464 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property ShipRepairKit Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  sescript kmyQuest = Self.GetOwningQuest() as sescript ; #DEBUG_LINE_NO:8
  kmyQuest.RemoveItemFromPlayerOrShip(ShipRepairKit as Form, 1, 10, True) ; #DEBUG_LINE_NO:11
EndFunction
