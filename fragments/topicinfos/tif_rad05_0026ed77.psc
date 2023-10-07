ScriptName Fragments:TopicInfos:TIF_RAD05_0026ED77 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD05_Mercenary_Debt Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().removeitem(Credits as Form, RAD05_Mercenary_Debt.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:9
EndFunction
