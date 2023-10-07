ScriptName Fragments:Quests:QF_CREW_GenericCrew_0026C4EA Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.SetCostMultAndUpdateCost(1.0) ; #DEBUG_LINE_NO:24
EndFunction
