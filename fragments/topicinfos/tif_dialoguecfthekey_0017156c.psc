ScriptName Fragments:TopicInfos:TIF_DialogueCFTheKey_0017156C Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialoguecfthekeyquestscript kmyQuest = Self.GetOwningQuest() as dialoguecfthekeyquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.DialogueShipServices.RepairPlayerShip() ; #DEBUG_LINE_NO:11
EndFunction
