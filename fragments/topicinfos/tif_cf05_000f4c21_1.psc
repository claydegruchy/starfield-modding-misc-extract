ScriptName Fragments:TopicInfos:TIF_CF05_000F4C21_1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CF05_SpeechScenario_GuardPassedKeyword Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  akSpeaker.AddKeyword(CF05_SpeechScenario_GuardPassedKeyword) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:15
  CF05_Guard_SpeechChallenge01.Stop() ; #DEBUG_LINE_NO:17
EndFunction
