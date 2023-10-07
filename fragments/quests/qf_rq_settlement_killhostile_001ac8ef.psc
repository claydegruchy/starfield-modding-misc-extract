ScriptName Fragments:Quests:QF_RQ_Settlement_KillHostile_001AC8EF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
Perk Property FactionCrimsonFleetPerk Auto Const
MiscObject Property Credits Auto Const
GlobalVariable Property RQ_KillHostileHumans02_BossBribe Auto Const mandatory
ReferenceAlias Property Boss Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:16
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:29
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:32
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:33
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:35
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveDisplayedAtTop(100) ; #DEBUG_LINE_NO:47
  Self.SetStage(100) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:56
  Self.SetStage(125) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(250) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(260) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(250) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(150) ; #DEBUG_LINE_NO:90
    Self.SetStage(260) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:101
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:102
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:103
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(350) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveFailed(150, True) ; #DEBUG_LINE_NO:116
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:118
    Self.SetStage(350) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:128
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:129
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:133
    Self.SetStage(999) ; #DEBUG_LINE_NO:134
  Else ; #DEBUG_LINE_NO:
    If Self.GetStageDone(150) ; #DEBUG_LINE_NO:136
      Self.SetStage(260) ; #DEBUG_LINE_NO:138
    EndIf ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:140
    Self.SetStage(350) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:150
    If !Self.GetStageDone(250) && !Self.GetStageDone(260) ; #DEBUG_LINE_NO:151
      Self.SetObjectiveSkipped(150) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:164
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:166
    Self.SetStage(995) ; #DEBUG_LINE_NO:167
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:179
    Self.SetStage(990) ; #DEBUG_LINE_NO:180
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:182
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:200
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:201
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:205
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:206
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:207
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:218
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:219
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:223
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:224
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:225
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:229
EndFunction
