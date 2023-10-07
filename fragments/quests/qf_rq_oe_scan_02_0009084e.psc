ScriptName Fragments:Quests:QF_RQ_OE_Scan_02_0009084E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:36
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:37
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(900) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:58
    Self.SetStage(990) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:68
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:69
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:73
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:74
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:75
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:96
  rq_scantraitscript kmyQuest = __temp as rq_scantraitscript ; #DEBUG_LINE_NO:97
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:101
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:102
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:106
EndFunction
