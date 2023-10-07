ScriptName Fragments:Quests:QF_City_NA_Aquilus01Misc_00253F58 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:15
  Self.Stop() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:24
  Self.Stop() ; #DEBUG_LINE_NO:25
EndFunction
