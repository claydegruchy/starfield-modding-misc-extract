ScriptName Fragments:Quests:QF_MB_Passenger01Far00_000E75D4_1 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.StopQuestTimer() ; #DEBUG_LINE_NO:15
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:16
EndFunction
