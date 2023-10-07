ScriptName Fragments:Quests:QF_MB_Bounty05_UC_003303A5 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:32
  kmyQuest.MissionShutdown() ; #DEBUG_LINE_NO:35
EndFunction
