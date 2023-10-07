ScriptName Fragments:Quests:QF_RQ_Settlement_KillHostile_000617BA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:21
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:24
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:26
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:27
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:29
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:41
    Self.SetStage(999) ; #DEBUG_LINE_NO:42
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:44
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:54
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:55
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:58
  kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:67
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:69
    Self.SetStage(995) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:79
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:80
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:84
    Self.SetStage(990) ; #DEBUG_LINE_NO:85
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:104
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:105
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:109
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:110
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:122
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:123
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:127
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:128
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:129
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:133
EndFunction
