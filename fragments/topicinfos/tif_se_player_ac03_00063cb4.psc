ScriptName Fragments:TopicInfos:TIF_SE_Player_AC03_00063CB4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Lithium Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().RemoveItem(Lithium as Form, 5, False, None) ; #DEBUG_LINE_NO:8
EndFunction
