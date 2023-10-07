ScriptName Fragments:Quests:QF_MB_Steal01Far_CFR03_0019B984 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const mandatory
ReferenceAlias Property Alias_GuardSpawn Auto Const mandatory
ReferenceAlias Property Alias_TargetContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Alias_GuardSpawn.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:8
  Alias_TargetContainer.GetRef().Enable(False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:26
  missionstealquestscript kmyQuest = __temp as missionstealquestscript ; #DEBUG_LINE_NO:27
  CF_TheKey_MissionBoardCounter.Mod(1.0) ; #DEBUG_LINE_NO:31
  Alias_GuardSpawn.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:32
  Alias_TargetContainer.GetRef().Disable(False) ; #DEBUG_LINE_NO:33
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:43
  missionstealquestscript kmyQuest = __temp as missionstealquestscript ; #DEBUG_LINE_NO:44
  kmyQuest.MissionFailed() ; #DEBUG_LINE_NO:47
EndFunction
