ScriptName Fragments:TopicInfos:TIF_TraitQuest_00167679 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TraitSpaced Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().RemovePerk(TraitSpaced) ; #DEBUG_LINE_NO:9
EndFunction
