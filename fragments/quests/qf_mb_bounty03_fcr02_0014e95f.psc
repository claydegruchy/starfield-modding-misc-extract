ScriptName Fragments:Quests:QF_MB_Bounty03_FCR02_0014E95F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:14
    FC02.SetStage(170) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:24
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:25
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:29
    FC02.SetStage(180) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:33
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript ; #DEBUG_LINE_NO:34
  myFCRQuest.FCRMissionComplete() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:43
  missionquestscript kmyQuest = __temp as missionquestscript ; #DEBUG_LINE_NO:44
  kmyQuest.MissionShutdown() ; #DEBUG_LINE_NO:47
EndFunction
