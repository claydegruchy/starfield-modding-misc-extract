ScriptName Fragments:Quests:QF_MB_BountySpace02Far00_002640BF Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:19
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript ; #DEBUG_LINE_NO:29
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:32
EndFunction
