ScriptName Fragments:TopicInfos:TIF_SE_Player_FAB04_00302701 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  se_fab04_mathcount kmyQuest = Self.GetOwningQuest() as se_fab04_mathcount ; #DEBUG_LINE_NO:8
  kmyQuest.CountShipParts() ; #DEBUG_LINE_NO:11
EndFunction
