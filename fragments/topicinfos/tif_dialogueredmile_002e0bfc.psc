ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002E0BFC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFRedMileR01Misc Auto Const mandatory
Quest Property FFRedMileR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !FFRedMileR01.IsRunning() && !FFRedMileR01Misc.IsRunning() ; #DEBUG_LINE_NO:8
    FFRedMileR01Misc.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
