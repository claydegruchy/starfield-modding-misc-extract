ScriptName Fragments:TopicInfos:TIF_OE_AustinF_Prospectors_0004BD43 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  akSpeaker.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:8
EndFunction
