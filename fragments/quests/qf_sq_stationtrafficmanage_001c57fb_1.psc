ScriptName Fragments:Quests:QF_SQ_StationTrafficManage_001C57FB_1 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  sq_stationtrafficmanagerquestscript kmyQuest = __temp as sq_stationtrafficmanagerquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.InitOnStartupStage() ; #DEBUG_LINE_NO:15
EndFunction
