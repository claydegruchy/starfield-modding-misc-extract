ScriptName Fragments:Quests:QF_FFCydoniaR03Misc_01004E5C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFCydoniaR03QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_1000_Item_00()
  FFCydoniaR03QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:15
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:16
  Self.Stop() ; #DEBUG_LINE_NO:17
EndFunction
