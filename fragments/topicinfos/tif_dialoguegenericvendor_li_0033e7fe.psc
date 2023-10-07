ScriptName Fragments:TopicInfos:TIF_DialogueGenericVendor_LI_0033E7FE Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript ; #DEBUG_LINE_NO:8
  kmyQuest.RepairPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
