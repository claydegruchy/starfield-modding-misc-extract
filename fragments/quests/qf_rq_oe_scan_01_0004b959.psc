ScriptName Fragments:Quests:QF_RQ_OE_Scan_01_0004B959 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
GlobalVariable Property RQ_Settlement_Scan_01_CreditsReward Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Calm_PreAccept() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:20
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayedAtTop(100) ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:41
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:42
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:46
  Self.SetStage(200) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:56
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:57
  Self.SetObjectiveFailed(150, True) ; #DEBUG_LINE_NO:60
  kmyQuest.SetDialogueAV_SecondaryObjectiveFail() ; #DEBUG_LINE_NO:61
  Float reward = RQ_Settlement_Scan_01_CreditsReward.GetValue() * 0.75 ; #DEBUG_LINE_NO:63
  RQ_Settlement_Scan_01_CreditsReward.SetValueInt(reward as Int) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:72
  If !Self.GetStageDone(150) ; #DEBUG_LINE_NO:74
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:86
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:88
    Self.SetStage(995) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:99
    Self.SetStage(990) ; #DEBUG_LINE_NO:100
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:120
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:121
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:125
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:126
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:138
  rq_scancreaturesscript kmyQuest = __temp as rq_scancreaturesscript ; #DEBUG_LINE_NO:139
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:143
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:144
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:145
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:149
EndFunction
