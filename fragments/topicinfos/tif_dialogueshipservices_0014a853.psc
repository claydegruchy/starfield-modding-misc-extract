ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0014A853 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript ; #DEBUG_LINE_NO:8
  kmyQuest.RefuelPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
