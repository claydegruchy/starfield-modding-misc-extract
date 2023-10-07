ScriptName Fragments:TopicInfos:TIF_UC01_ShipSimQuest_0003D508 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  uc01_shipsimulationquestscript kmyQuest = Self.GetOwningQuest() as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.StartCooldownTimer(15.0) ; #DEBUG_LINE_NO:11
EndFunction
