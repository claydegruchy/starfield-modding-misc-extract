ScriptName Fragments:Quests:QF_RQ_Settlement_CollectScie_0034BAA9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:40
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:63
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:65
    Self.SetStage(995) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:76
    Self.SetStage(990) ; #DEBUG_LINE_NO:77
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:88
  Self.SetStage(990) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:97
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:98
  Self.SetStage(990) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:110
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:111
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:115
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:116
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:117
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:121
EndFunction
