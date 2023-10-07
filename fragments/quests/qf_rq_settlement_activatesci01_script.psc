ScriptName Fragments:Quests:QF_RQ_Settlement_ActivateSci01_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
ReferenceAlias Property Alias_InteractionLocationMapMarker Auto Const mandatory

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
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:27
  Alias_InteractionLocationMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:48
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:50
    Self.SetStage(995) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:61
    Self.SetStage(990) ; #DEBUG_LINE_NO:62
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:73
  Self.SetStage(990) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:82
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:83
  Self.SetStage(990) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:95
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:96
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:100
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:101
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:102
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:106
EndFunction
