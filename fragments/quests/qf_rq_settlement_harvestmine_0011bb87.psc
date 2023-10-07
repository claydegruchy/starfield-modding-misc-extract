ScriptName Fragments:Quests:QF_RQ_Settlement_HarvestMine_0011BB87 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_MineralLocationMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript ; #DEBUG_LINE_NO:21
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:24
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:26
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:27
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:32
  Alias_MineralLocationMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:52
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:54
    Self.SetStage(995) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:65
    Self.SetStage(990) ; #DEBUG_LINE_NO:66
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:86
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript ; #DEBUG_LINE_NO:87
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:91
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:92
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:104
  rq_harvestminescript kmyQuest = __temp as rq_harvestminescript ; #DEBUG_LINE_NO:105
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:109
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:110
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:111
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:115
EndFunction
