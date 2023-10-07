ScriptName Fragments:Quests:QF_RadiantGetItem01_0005AEFF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_QuestItem Auto Const mandatory

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
  Game.GetPlayer().RemoveItem(Alias_QuestItem.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:31
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:33
  Self.Stop() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:42
  Self.Stop() ; #DEBUG_LINE_NO:43
EndFunction
