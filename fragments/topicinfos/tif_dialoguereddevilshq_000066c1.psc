ScriptName Fragments:TopicInfos:TIF_DialogueRedDevilsHQ_000066C1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR04 Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  UCR04.SetStage(100) ; #DEBUG_LINE_NO:8
EndFunction
