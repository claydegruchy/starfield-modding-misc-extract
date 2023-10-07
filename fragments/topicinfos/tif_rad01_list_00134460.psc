ScriptName Fragments:TopicInfos:TIF_Rad01_LIST_00134460 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  rad01_list_questscript kmyQuest = Self.GetOwningQuest() as rad01_list_questscript ; #DEBUG_LINE_NO:8
  kmyQuest.PurchasePamphlets() ; #DEBUG_LINE_NO:11
EndFunction
