ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_LyleBrewe_001C287F Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.Recruited() ; #DEBUG_LINE_NO:11
EndFunction
