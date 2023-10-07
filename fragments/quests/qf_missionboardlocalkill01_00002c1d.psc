ScriptName Fragments:Quests:QF_MissionBoardLocalKill01_00002C1D Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  missionbountyquestscript kmyQuest = __temp as missionbountyquestscript ; #DEBUG_LINE_NO:16
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:27
  missionbountyquestscript kmyQuest = __temp as missionbountyquestscript ; #DEBUG_LINE_NO:28
  kmyQuest.MissionShutdown() ; #DEBUG_LINE_NO:31
EndFunction
