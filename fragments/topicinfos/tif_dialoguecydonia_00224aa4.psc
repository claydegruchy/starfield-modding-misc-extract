ScriptName Fragments:TopicInfos:TIF_DialogueCydonia_00224AA4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFCydoniaR02QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FFCydoniaR02QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:8
EndFunction
