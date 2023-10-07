ScriptName Fragments:TopicInfos:TIF_Dialogue1OfAKindUC07_001F43C4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerKnows_Ecliptic Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PlayerKnows_Ecliptic.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
