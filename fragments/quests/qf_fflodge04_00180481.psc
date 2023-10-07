ScriptName Fragments:Quests:QF_FFLodge04_00180481 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:39
  Self.SetStage(50) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:48
  fflodge04questscript kmyQuest = __temp as fflodge04questscript ; #DEBUG_LINE_NO:49
  kmyQuest.EnablePlaque() ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:60
EndFunction
