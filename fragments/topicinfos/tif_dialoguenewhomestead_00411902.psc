ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_00411902 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const mandatory
Keyword Property FFNewHomesteadR02MiscQuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FFNewHomesteadR02QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:8
EndFunction
