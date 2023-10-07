ScriptName Fragments:Quests:QF_RedMile_HandlerQuest_003999D7 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  redmilehandlerquestscript kmyQuest = __temp as redmilehandlerquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.RespawnCreatures(0) ; #DEBUG_LINE_NO:12
EndFunction
