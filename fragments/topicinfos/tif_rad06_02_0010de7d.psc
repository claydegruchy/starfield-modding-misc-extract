ScriptName Fragments:TopicInfos:TIF_RAD06_02_0010DE7D Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  rad06script kmyQuest = Self.GetOwningQuest() as rad06script ; #DEBUG_LINE_NO:8
  kmyQuest.CargoHoldResourceCheck() ; #DEBUG_LINE_NO:11
EndFunction
