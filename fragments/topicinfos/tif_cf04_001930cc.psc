ScriptName Fragments:TopicInfos:TIF_CF04_001930CC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF04_DumbroskyFirst Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  CF04_DumbroskyFirst.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
