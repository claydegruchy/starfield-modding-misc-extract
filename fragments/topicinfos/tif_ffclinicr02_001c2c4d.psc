ScriptName Fragments:TopicInfos:TIF_FFClinicR02_001C2C4D Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFClinicR02MembraneValue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(Credits as Form, FFClinicR02MembraneValue.GetValueInt() * 7, False) ; #DEBUG_LINE_NO:8
EndFunction
