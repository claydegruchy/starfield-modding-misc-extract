ScriptName Fragments:Quests:QF_MB_BountySpace01Far00_000E87AA_4 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:24
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript ; #DEBUG_LINE_NO:25
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:28
EndFunction
