ScriptName Fragments:Quests:QF_FavorTemplate01_0001C59E Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:19
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:30
  Self.Stop() ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:39
  Self.Stop() ; #DEBUG_LINE_NO:40
EndFunction
