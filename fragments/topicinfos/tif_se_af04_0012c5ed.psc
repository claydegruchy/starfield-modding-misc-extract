ScriptName Fragments:TopicInfos:TIF_SE_AF04_0012C5ED Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
LeveledItem Property creditsRewardList Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.getplayer().additem(creditsRewardList as Form, 1, False) ; #DEBUG_LINE_NO:8
EndFunction
