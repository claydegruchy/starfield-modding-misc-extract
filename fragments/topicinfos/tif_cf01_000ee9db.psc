ScriptName Fragments:TopicInfos:TIF_CF01_000EE9DB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_UCSysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PlayerKnows_UCSysDef.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
