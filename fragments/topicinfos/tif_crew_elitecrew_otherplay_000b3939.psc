ScriptName Fragments:TopicInfos:TIF_CREW_EliteCrew_OtherPlay_000B3939 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property thisQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If thisQuest.GetStageDone(100) == False && thisQuest.GetStageDone(200) == False ; #DEBUG_LINE_NO:8
    thisQuest.SetStage(100) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
