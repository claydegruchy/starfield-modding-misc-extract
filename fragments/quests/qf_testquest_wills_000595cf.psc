ScriptName Fragments:Quests:QF_TestQuest_WillS_000595CF Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:42
EndFunction
