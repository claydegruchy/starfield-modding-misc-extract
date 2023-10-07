ScriptName Fragments:Quests:QF_Temp_Gamejam_QuestConstel_01000828 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:16
EndFunction
