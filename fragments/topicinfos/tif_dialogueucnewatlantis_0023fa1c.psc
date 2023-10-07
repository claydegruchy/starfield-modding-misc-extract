ScriptName Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_0023FA1C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01_Tuala_Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If !UC01_Tuala_Misc.GetStageDone(100) ; #DEBUG_LINE_NO:8
    UC01_Tuala_Misc.SetStage(100) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
