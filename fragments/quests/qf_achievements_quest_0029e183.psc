ScriptName Fragments:Quests:QF_Achievements_Quest_0029E183 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  achievements_trackedstatsscript kmyQuest = __temp as achievements_trackedstatsscript ; #DEBUG_LINE_NO:8
  kmyQuest.RegisterTrackedStats() ; #DEBUG_LINE_NO:11
EndFunction
