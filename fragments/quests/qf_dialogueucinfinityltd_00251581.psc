ScriptName Fragments:Quests:QF_DialogueUCInfinityLTD_00251581 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  RI07.SetStage(1448) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0105_Item_00()
  RI07.SetStage(1444) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0120_Item_00()
  RI07.SetStage(1510) ; #DEBUG_LINE_NO:23
  Self.SetStage(100) ; #DEBUG_LINE_NO:24
EndFunction
