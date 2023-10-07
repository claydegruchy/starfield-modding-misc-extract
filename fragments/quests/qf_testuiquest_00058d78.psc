ScriptName Fragments:Quests:QF_TestUIQuest_00058D78 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:19
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:21
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:23
EndFunction
