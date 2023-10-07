ScriptName Fragments:TopicInfos:TIF_FFClinicR02_001C2C0C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFClinicR02SealantValue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Credits as Form, FFClinicR02SealantValue.GetValueInt() * 5, False) ; #DEBUG_LINE_NO:8
EndFunction
