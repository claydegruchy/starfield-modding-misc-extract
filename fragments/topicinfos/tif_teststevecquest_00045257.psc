ScriptName Fragments:TopicInfos:TIF_TestSteveCQuest_00045257 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  teststevecquestscript kmyQuest = Self.GetOwningQuest() as teststevecquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.TestGivingFood() ; #DEBUG_LINE_NO:11
EndFunction
