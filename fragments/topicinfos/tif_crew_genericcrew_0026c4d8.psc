ScriptName Fragments:TopicInfos:TIF_CREW_GenericCrew_0026C4D8 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  crew_genericcrewquestscript kmyQuest = Self.GetOwningQuest() as crew_genericcrewquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SpeechChallengeAttempted() ; #DEBUG_LINE_NO:11
EndFunction