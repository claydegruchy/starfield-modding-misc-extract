ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28EC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS03_Outcome Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  MS03_Outcome.SetValue(3.0) ; #DEBUG_LINE_NO:8
EndFunction
