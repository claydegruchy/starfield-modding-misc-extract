ScriptName Fragments:Quests:QF_TestQuest_Danny_0005B48F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TestQuest_Danny_Chat01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  TestQuest_Danny_Chat01.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:16
  Self.Stop() ; #DEBUG_LINE_NO:17
EndFunction
