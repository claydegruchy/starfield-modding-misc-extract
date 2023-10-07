ScriptName Fragments:TopicInfos:TIF_DialogueFCAkilaCity_0005D84B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property EleosLocationMiscPointer Auto Const mandatory
Quest Property MS02 Auto Const mandatory
Quest Property MS02_Intro Auto Const mandatory
Quest Property ParadisoLocationMiscPointer Auto Const mandatory
Quest Property RedMileLocationMiscPointer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  RedMileLocationMiscPointer.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction
