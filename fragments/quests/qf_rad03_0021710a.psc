ScriptName Fragments:Quests:QF_RAD03_0021710A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Alias_MissionBoardLoc Auto Const mandatory
Keyword Property Mission_LocationPriorityCargoMission Auto Const mandatory
missionparentscript Property MB_Parent Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rad03questscript kmyQuest = __temp as rad03questscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:19
  Self.Stop() ; #DEBUG_LINE_NO:20
EndFunction
