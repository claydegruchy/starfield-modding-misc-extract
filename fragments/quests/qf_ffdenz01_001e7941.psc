ScriptName Fragments:Quests:QF_FFDenZ01_001E7941 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(15) ; #DEBUG_LINE_NO:15
    Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:26
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:52
  Self.Stop() ; #DEBUG_LINE_NO:53
EndFunction
