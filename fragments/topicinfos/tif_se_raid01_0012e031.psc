ScriptName Fragments:TopicInfos:TIF_SE_Raid01_0012E031 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  se_raidscript kmyQuest = Self.GetOwningQuest() as se_raidscript ; #DEBUG_LINE_NO:8
  kmyQuest.RemoveItems(5) ; #DEBUG_LINE_NO:11
EndFunction
