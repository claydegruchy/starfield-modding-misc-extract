ScriptName Fragments:Quests:QF_BE_SC04_Misc_002B5690 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:21
  Self.CompleteQuest() ; #DEBUG_LINE_NO:22
  Self.Stop() ; #DEBUG_LINE_NO:23
EndFunction
