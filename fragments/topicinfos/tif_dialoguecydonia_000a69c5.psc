ScriptName Fragments:TopicInfos:TIF_DialogueCydonia_000A69C5 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  dialoguecydoniaquestscript kmyQuest = Self.GetOwningQuest() as dialoguecydoniaquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.HorusAid() ; #DEBUG_LINE_NO:11
EndFunction
