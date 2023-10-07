ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_BettyHows_0003772A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CrewHiringCost Auto Const
Quest Property BettyECQuest Auto Const
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  BettyECQuest.SetStage(700) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().RemoveItem(Credits as Form, CrewHiringCost.GetValueInt(), False, None) ; #DEBUG_LINE_NO:9
EndFunction
