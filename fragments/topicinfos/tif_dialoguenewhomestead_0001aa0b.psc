ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0001AA0B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR05Misc Auto Const mandatory
Quest Property FFNewHomesteadR05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !FFNewHomesteadR05.IsRunning() && !FFNewHomesteadR05Misc.IsRunning() ; #DEBUG_LINE_NO:8
    FFNewHomesteadR05Misc.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
