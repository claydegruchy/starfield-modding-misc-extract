ScriptName Fragments:TopicInfos:TIF_SE_Player_FAB04_0008169F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Credits as Form, 69, False) ; #DEBUG_LINE_NO:8
EndFunction
