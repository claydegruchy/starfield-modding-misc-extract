ScriptName Fragments:Quests:QF_MB_BountySpace03_FCR03_0014E95A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:10
    FC02.SetStage(170) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:29
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript ; #DEBUG_LINE_NO:30
  If FC02.IsRunning() && FC02.GetStageDone(160) ; #DEBUG_LINE_NO:34
    FC02.SetStage(180) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:38
  fcrquestscript myFCRQuest = (kmyQuest as Quest) as fcrquestscript ; #DEBUG_LINE_NO:39
  myFCRQuest.FCRMissionComplete() ; #DEBUG_LINE_NO:40
EndFunction
