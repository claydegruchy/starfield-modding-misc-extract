ScriptName Fragments:Quests:QF_RI08_PostQuest_000C41A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const mandatory
Keyword Property MissionStoryKeywordHack_RIR01 Auto Const mandatory
Keyword Property MissionStoryKeywordPlantEvidence_RIR02 Auto Const mandatory
Keyword Property MissionStoryKeywordSabotage_RIR04 Auto Const mandatory
GlobalVariable Property RI08_AcquiredInfinity Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_InfinityShutdownEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityRyujinEnableMarker Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
Quest Property RI08 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_InfinityDeziEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityPosterEnableMarker Auto Const mandatory
Quest Property LC051 Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_ImogeneOfficeMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ri08_postquestscript kmyQuest = __temp as ri08_postquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.StartPostQuestTimer() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:19
  Alias_Imogene.GetRef().Enable(False) ; #DEBUG_LINE_NO:20
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneOfficeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.IsObjectiveDisplayed(100) == True ; #DEBUG_LINE_NO:29
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:30
    MissionBoardAccessAllowed_RI.SetValue(1.0) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:34
  MissionStoryKeywordHack_RIR01.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:36
  MissionStoryKeywordPlantEvidence_RIR02.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:37
  MissionStoryKeywordSabotage_RIR04.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:46
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:48
    Self.SetStage(10000) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If RI08_AcquiredInfinity.GetValue() == 1.0 ; #DEBUG_LINE_NO:59
    LC044.SetStage(2000) ; #DEBUG_LINE_NO:60
    LC051.SetStage(1000) ; #DEBUG_LINE_NO:61
    Alias_InfinityRyujinEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:62
    Alias_InfinityPosterEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:63
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:64
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:65
  Else ; #DEBUG_LINE_NO:
    Alias_InfinityShutdownEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:67
    Alias_InfinityDeziEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:68
    Alias_Angelo.GetRef().Disable(False) ; #DEBUG_LINE_NO:69
    Alias_Stanley.GetRef().Disable(False) ; #DEBUG_LINE_NO:70
    LC051.SetStage(2000) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
  If RI06_Track_PlayerWitholdsClinicNames.GetValue() == 1.0 ; #DEBUG_LINE_NO:75
    RI_Support.SetStage(2100) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0 && RI08_MasakoRemainedCEO.GetValue() == 1.0 && RI08.GetStageDone(1010) ; #DEBUG_LINE_NO:81
    RI_Support.SetStage(4000) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:86
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:88
    Self.SetStage(10000) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue() ; #DEBUG_LINE_NO:98
  If fMasakoCEO == 1.0 ; #DEBUG_LINE_NO:100
    Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:101
  ElseIf fMasakoCEO == 0.0 ; #DEBUG_LINE_NO:102
    Alias_Masako.GetRef().Disable(False) ; #DEBUG_LINE_NO:103
    RI_Support.SetStage(3000) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  Alias_ExecutiveGenericNPCs.GetRef().Enable(False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:115
  Self.Stop() ; #DEBUG_LINE_NO:116
EndFunction
