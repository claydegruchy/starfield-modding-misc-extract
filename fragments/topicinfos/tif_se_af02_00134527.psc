ScriptName Fragments:TopicInfos:TIF_SE_AF02_00134527 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property SE_AF02_CreditCount Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.getplayer().additem(Credits as Form, SE_AF02_CreditCount.getvalue() as Int, False) ; #DEBUG_LINE_NO:8
EndFunction
