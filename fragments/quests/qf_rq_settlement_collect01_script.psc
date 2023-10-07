ScriptName Fragments:Quests:QF_RQ_Settlement_Collect01_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
RefCollectionAlias Property Alias_Creatures Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_collectscript kmyQuest = __temp as rq_collectscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_collectscript kmyQuest = __temp as rq_collectscript ; #DEBUG_LINE_NO:21
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:24
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:26
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:27
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:32
  Alias_DungeonMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:35
  kmyQuest.StartTrackingCollection() ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:46
  rq_collectscript kmyQuest = __temp as rq_collectscript ; #DEBUG_LINE_NO:47
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:59
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:61
    Self.SetStage(995) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:72
    Self.SetStage(990) ; #DEBUG_LINE_NO:73
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:93
  rq_collectscript kmyQuest = __temp as rq_collectscript ; #DEBUG_LINE_NO:94
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:98
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:99
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:111
  rq_collectscript kmyQuest = __temp as rq_collectscript ; #DEBUG_LINE_NO:112
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:116
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:117
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:118
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemoveItem(RQS_CollectColonist_Meat as Form, 99, True, None) ; #DEBUG_LINE_NO:131
  RQS_CollectColonist_MaxMeat.SetValue(0.0) ; #DEBUG_LINE_NO:134
EndFunction
