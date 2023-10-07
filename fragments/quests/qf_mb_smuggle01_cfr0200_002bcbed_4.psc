ScriptName Fragments:Quests:QF_MB_Smuggle01_CFR0200_002BCBED_4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript ; #DEBUG_LINE_NO:17
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  CF_TheKey_MissionBoardCounter.Mod(1.0) ; #DEBUG_LINE_NO:23
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  missioncargoquestscript kmyQuest = __temp as missioncargoquestscript ; #DEBUG_LINE_NO:34
  kmyQuest.MissionFailed() ; #DEBUG_LINE_NO:37
EndFunction
