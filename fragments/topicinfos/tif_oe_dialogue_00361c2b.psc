ScriptName Fragments:TopicInfos:TIF_OE_Dialogue_00361C2B Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  oe_dialogueavscript kmyQuest = Self.GetOwningQuest() as oe_dialogueavscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetHowsLife(akSpeakerRef, 4) ; #DEBUG_LINE_NO:11
EndFunction
