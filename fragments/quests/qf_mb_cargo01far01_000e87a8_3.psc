ScriptName Fragments:Quests:QF_MB_Cargo01Far01_000E87A8_3 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.StopQuestTimer() ; #DEBUG_LINE_NO:15
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:16
EndFunction
