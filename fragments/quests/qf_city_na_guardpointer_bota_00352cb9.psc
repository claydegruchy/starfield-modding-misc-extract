ScriptName Fragments:Quests:QF_City_NA_GuardPointer_Bota_00352CB9 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:15
EndFunction
