ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_0021D3FE Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
Quest Property FFNewHomesteadR02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02Misc.IsRunning() ; #DEBUG_LINE_NO:8
    FFNewHomesteadR02Misc.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
