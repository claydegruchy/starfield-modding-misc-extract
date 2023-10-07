ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0014A833 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
MiscObject Property Credits Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript ; #DEBUG_LINE_NO:8
  kmyQuest.RepairPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
