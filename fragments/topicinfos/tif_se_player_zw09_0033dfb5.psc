ScriptName Fragments:TopicInfos:TIF_SE_Player_ZW09_0033DFB5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property PSE_Player_ZW09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  PSE_Player_ZW09.setstage(250) ; #DEBUG_LINE_NO:8
EndFunction
