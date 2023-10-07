ScriptName Fragments:TopicInfos:TIF_DialogueNewHomestead_000212C4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GameDaysPassed Auto Const mandatory
GlobalVariable Property FFNewHomesteadR02_CooldownTime Auto Const mandatory
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
Quest Property FFNewHomesteadR02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02Misc.IsRunning() && GameDaysPassed.GetValue() >= FFNewHomesteadR02_CooldownTime.GetValue() ; #DEBUG_LINE_NO:8
    FFNewHomesteadR02Misc.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
