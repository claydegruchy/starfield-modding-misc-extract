ScriptName Fragments:TopicInfos:TIF_DialogueUCFactionNewAtla_000066B5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  uc01_orientationdisplayquestscript kmyQuest = Self.GetOwningQuest() as uc01_orientationdisplayquestscript ; #DEBUG_LINE_NO:8
  UCR01.Start() ; #DEBUG_LINE_NO:11
EndFunction
