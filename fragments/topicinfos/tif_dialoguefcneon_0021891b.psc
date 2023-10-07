ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_0021891B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Drug03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  City_Neon_Drug03.Reset() ; #DEBUG_LINE_NO:9
  City_Neon_Drug03.SetStage(100) ; #DEBUG_LINE_NO:10
EndFunction
