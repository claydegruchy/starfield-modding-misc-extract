ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0022E14A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript ; #DEBUG_LINE_NO:8
  kmyQuest.RepairPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
