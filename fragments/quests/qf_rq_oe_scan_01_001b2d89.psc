ScriptName Fragments:Quests:QF_RQ_OE_Scan_01_001B2D89 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
GlobalVariable Property RQ_OE_Scan_01_CreditsReward Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:20
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayedAtTop(100) ; #DEBUG_LINE_NO:38
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:40
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:41
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:45
  Self.SetStage(200) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:55
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:56
  Self.SetObjectiveFailed(150, True) ; #DEBUG_LINE_NO:59
  kmyQuest.SetDialogueAV_SecondaryObjectiveFail() ; #DEBUG_LINE_NO:60
  Float reward = RQ_OE_Scan_01_CreditsReward.GetValue() * 0.75 ; #DEBUG_LINE_NO:62
  RQ_OE_Scan_01_CreditsReward.SetValueInt(reward as Int) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:71
  If !Self.GetStageDone(150) ; #DEBUG_LINE_NO:73
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0300_Item_01()
  Self.SetStage(990) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:93
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:95
    Self.SetStage(995) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:106
    Self.SetStage(990) ; #DEBUG_LINE_NO:107
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:127
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:128
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:132
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:133
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:145
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:146
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:150
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:151
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:152
    kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:156
EndFunction
