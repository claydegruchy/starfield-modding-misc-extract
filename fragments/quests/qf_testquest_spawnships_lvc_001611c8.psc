ScriptName Fragments:Quests:QF_TestQuest_SpawnShips_LVC_001611C8 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:15
EndFunction
