ScriptName Fragments:Quests:QF_COM_Companion_Barrett_004D16FC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(311) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetStage(311) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(311) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0152_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0153_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0154_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(212) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0221_Item_00()
  Self.SetStage(212) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0222_Item_00()
  Self.SetStage(212) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0251_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0252_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0253_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0451_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0452_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:135
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:136
  COM_Quest_Barrett_Q01.SetStage(1000) ; #DEBUG_LINE_NO:139
EndFunction
