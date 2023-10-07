ScriptName Fragments:Quests:QF_TestObjectivesMQ_00021B54 Extends Quest Const hidden

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

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0053_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:75
EndFunction
