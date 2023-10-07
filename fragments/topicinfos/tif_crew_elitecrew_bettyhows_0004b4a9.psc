ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_BettyHows_0004B4A9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BettyQuest Auto Const
MiscObject Property Credits Auto Const
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  BettyQuest.SetStage(700) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:9
EndFunction
