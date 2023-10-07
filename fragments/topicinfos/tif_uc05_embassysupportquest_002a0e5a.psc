ScriptName Fragments:TopicInfos:TIF_UC05_EmbassySupportQuest_002A0E5A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If UC05.IsRunning() && UC05.GetStageDone(300) ; #DEBUG_LINE_NO:8
    UC05.SetStage(340) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
