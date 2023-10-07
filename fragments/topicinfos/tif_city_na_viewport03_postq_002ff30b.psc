ScriptName Fragments:TopicInfos:TIF_City_NA_Viewport03_PostQ_002FF30B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Credits_Medium Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(LL_Credits_Medium as Form, 1, False) ; #DEBUG_LINE_NO:8
EndFunction
