ScriptName Fragments:TopicInfos:TIF_Rad01_LIST_00192084 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Rad01_DialoguePhaseTracker Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Rad01_DialoguePhaseTracker.SetValue(4.0) ; #DEBUG_LINE_NO:8
EndFunction
