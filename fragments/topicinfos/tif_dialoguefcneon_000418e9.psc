ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_000418E9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Sleepcrate_Quest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Sleepcrate_Quest.setstage(30) ; #DEBUG_LINE_NO:8
EndFunction
