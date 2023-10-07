ScriptName Fragments:TopicInfos:TIF_SE_Player_DB_04_02_00602EE7 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
Form Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().removeitem(Credits, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:8
EndFunction
