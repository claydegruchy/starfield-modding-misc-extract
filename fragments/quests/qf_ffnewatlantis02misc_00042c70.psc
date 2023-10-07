ScriptName Fragments:Quests:QF_FFNewAtlantis02Misc_00042C70 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:47
  Self.Stop() ; #DEBUG_LINE_NO:48
EndFunction
