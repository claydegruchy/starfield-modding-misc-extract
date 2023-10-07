ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063C9C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Credits as Form, 15, False) ; #DEBUG_LINE_NO:8
EndFunction
