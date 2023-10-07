ScriptName Fragments:Scenes:SF_MQ102_007_SarahVenusSce_0028C697_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script ; #DEBUG_LINE_NO:7
  kmyQuest.BlockSpaceTravel() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_End()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script ; #DEBUG_LINE_NO:19
  kmyQuest.UnBlockSpaceTravel() ; #DEBUG_LINE_NO:22
  Self.GetOwningQuest().SetStage(410) ; #DEBUG_LINE_NO:23
EndFunction
