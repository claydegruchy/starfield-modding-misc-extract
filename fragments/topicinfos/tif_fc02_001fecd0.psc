ScriptName Fragments:TopicInfos:TIF_FC02_001FECD0 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Emma Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Emma.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:8
EndFunction
