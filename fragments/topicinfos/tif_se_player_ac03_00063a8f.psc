ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063A8F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Vanadium Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().RemoveItem(Vanadium as Form, 5, False, None) ; #DEBUG_LINE_NO:8
EndFunction
