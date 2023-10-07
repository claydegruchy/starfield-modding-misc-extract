ScriptName Fragments:TopicInfos:TIF_FFCydoniaR02_001E61A7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  ffcydoniar02questscript kmyQuest = Self.GetOwningQuest() as ffcydoniar02questscript ; #DEBUG_LINE_NO:8
  kmyQuest.CheckItems() ; #DEBUG_LINE_NO:11
EndFunction
