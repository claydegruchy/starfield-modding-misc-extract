ScriptName Fragments:TopicInfos:TIF_FC02_00201B23 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC02_EmmaReportToBlakeScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  FC02_EmmaReportToBlakeScene.Start() ; #DEBUG_LINE_NO:8
EndFunction
