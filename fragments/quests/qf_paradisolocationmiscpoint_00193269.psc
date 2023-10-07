ScriptName Fragments:Quests:QF_ParadisoLocationMiscPoint_00193269 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:15
  Self.SetStage(1000) ; #DEBUG_LINE_NO:16
EndFunction
