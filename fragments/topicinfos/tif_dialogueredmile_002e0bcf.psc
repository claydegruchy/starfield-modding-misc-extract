ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002E0BCF Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFRedMileR01Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If FFRedMileR01Misc.IsRunning() ; #DEBUG_LINE_NO:9
    FFRedMileR01Misc.SetStage(110) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction
