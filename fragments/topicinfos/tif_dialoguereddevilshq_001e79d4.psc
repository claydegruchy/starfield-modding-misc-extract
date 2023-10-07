ScriptName Fragments:TopicInfos:TIF_DialogueRedDevilsHQ_001E79D4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR04 Auto Const mandatory
Quest Property UCR04_Dupe00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If UCR04.IsRunning() && !UCR04.GetStageDone(100) ; #DEBUG_LINE_NO:8
    UCR04.SetStage(100) ; #DEBUG_LINE_NO:9
  ElseIf UCR04_Dupe00.IsRunning() && !UCR04_Dupe00.GetStageDone(100) ; #DEBUG_LINE_NO:10
    UCR04_Dupe00.SetStage(100) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction
