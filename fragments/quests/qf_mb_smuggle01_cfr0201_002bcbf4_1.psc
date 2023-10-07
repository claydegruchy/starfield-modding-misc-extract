ScriptName Fragments:Quests:QF_MB_Smuggle01_CFR0201_002BCBF4_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript ; #DEBUG_LINE_NO:16
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:19
  CF_TheKey_MissionBoardCounter.Mod(1.0) ; #DEBUG_LINE_NO:22
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript ; #DEBUG_LINE_NO:33
  kmyQuest.MissionFailed() ; #DEBUG_LINE_NO:36
EndFunction
