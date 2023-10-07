ScriptName Fragments:Quests:QF_MS05Intro_00299E7A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const
Quest Property MQ102 Auto Const
Quest Property MQ105 Auto Const
ObjectReference Property MS05StartMarker Auto Const
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
Quest Property DialogueUCTheLodge Auto Const mandatory
Quest Property MS05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:7
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:8
  DialogueUCTheLodge.SetStage(20) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().MoveTo(Alias_WalterStroud.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_1000_Item_00()
  MS05.Start() ; #DEBUG_LINE_NO:26
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:27
  Self.Stop() ; #DEBUG_LINE_NO:28
EndFunction
