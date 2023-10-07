ScriptName Fragments:TopicInfos:TIF_CF05_0021197E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_CargoBaySecurityDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Alias_CF05_CargoBaySecurityDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:8
EndFunction
