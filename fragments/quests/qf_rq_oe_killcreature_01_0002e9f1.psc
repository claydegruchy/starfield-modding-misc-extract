ScriptName Fragments:Quests:QF_RQ_OE_KillCreature_01_0002E9F1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const

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
  Alias_dungeonMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:42
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:54
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:55
  If !Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:59
    Self.SetStage(999) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:62
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:72
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:73
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:76
  kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:85
  Self.SetStage(450) ; #DEBUG_LINE_NO:86
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:88
    Self.SetStage(995) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:98
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:99
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:103
    Self.SetStage(990) ; #DEBUG_LINE_NO:104
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:124
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:125
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:129
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:130
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:142
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:143
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:147
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:148
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:149
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:153
EndFunction
