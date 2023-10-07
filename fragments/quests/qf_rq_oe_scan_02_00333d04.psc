ScriptName Fragments:Quests:QF_RQ_OE_Scan_02_00333D04 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:40
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:61
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:63
    Self.SetStage(995) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !Self.GetStageDone(995) && Self.GetStageDone(100) ; #DEBUG_LINE_NO:73
    Self.SetStage(990) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:92
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:93
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:97
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:98
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:110
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:111
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:115
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:116
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:117
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:121
EndFunction
