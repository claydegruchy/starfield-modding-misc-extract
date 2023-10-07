ScriptName Fragments:Quests:QF_City_NA_Botany01_MiscPoin_000A4BB8 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:16
  Self.CompleteQuest() ; #DEBUG_LINE_NO:17
  Self.Stop() ; #DEBUG_LINE_NO:18
EndFunction
