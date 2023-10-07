ScriptName Fragments:Quests:QF_MissionBoardSurvey_TEST_000759BE Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:23
EndFunction
