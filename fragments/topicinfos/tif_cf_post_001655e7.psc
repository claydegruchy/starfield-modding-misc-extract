ScriptName Fragments:TopicInfos:TIF_CF_Post_001655E7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  cf_postquestscript kmyQuest = Self.GetOwningQuest() as cf_postquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.DialogueShipServices.RepairPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
