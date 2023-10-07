ScriptName Fragments:TopicInfos:TIF_DialogueGenericGuards_001933AA Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory
Quest Property MS02_Intro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !MS02.GetStageDone(100) && !MS02.GetStageDone(9000) && !MS02_Intro.GetStageDone(100) ; #DEBUG_LINE_NO:8
    MS02_Intro.SetStage(100) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
