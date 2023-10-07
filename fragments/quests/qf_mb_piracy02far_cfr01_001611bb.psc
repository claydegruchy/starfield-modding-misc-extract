ScriptName Fragments:Quests:QF_MB_Piracy02Far_CFR01_001611BB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  missionpiracyquestscript kmyQuest = __temp as missionpiracyquestscript ; #DEBUG_LINE_NO:43
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:46
  CF_TheKey_MissionBoardCounter.Mod(1.0) ; #DEBUG_LINE_NO:49
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:59
  missionpiracyquestscript kmyQuest = __temp as missionpiracyquestscript ; #DEBUG_LINE_NO:60
  kmyQuest.MissionFailed() ; #DEBUG_LINE_NO:63
EndFunction
