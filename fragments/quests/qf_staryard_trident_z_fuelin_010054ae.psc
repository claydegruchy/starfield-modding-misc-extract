ScriptName Fragments:Quests:QF_Staryard_Trident_Z_Fuelin_010054AE Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:15
  Self.Stop() ; #DEBUG_LINE_NO:16
EndFunction
