ScriptName Fragments:Quests:QF_UC05_Realty_Misc_000BC8FA Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:15
  Self.Stop() ; #DEBUG_LINE_NO:16
EndFunction
