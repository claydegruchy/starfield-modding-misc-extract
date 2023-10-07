ScriptName Fragments:Quests:QF_City_CY_RedTape02_Blackma_000F437A Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:15
  Self.Stop() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:24
  Self.Stop() ; #DEBUG_LINE_NO:25
EndFunction
