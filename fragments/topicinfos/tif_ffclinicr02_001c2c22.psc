ScriptName Fragments:TopicInfos:TIF_FFClinicR02_001C2C22 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFClinicR02ToxinValue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Credits as Form, FFClinicR02ToxinValue.GetValueInt() * 10, False) ; #DEBUG_LINE_NO:8
EndFunction
