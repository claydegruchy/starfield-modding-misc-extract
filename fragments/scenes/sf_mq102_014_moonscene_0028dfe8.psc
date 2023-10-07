ScriptName Fragments:Scenes:SF_MQ102_014_MoonScene_0028DFE8 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ102 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script ; #DEBUG_LINE_NO:7
  kmyQuest.BlockSpaceTravel() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_End()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script ; #DEBUG_LINE_NO:18
  kmyQuest.UnblockSpaceTravel() ; #DEBUG_LINE_NO:21
  Self.GetOwningQuest().SetStage(510) ; #DEBUG_LINE_NO:22
EndFunction
