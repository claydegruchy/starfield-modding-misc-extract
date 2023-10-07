ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063A9B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Lead Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Lead as Form, 10, False) ; #DEBUG_LINE_NO:8
EndFunction
