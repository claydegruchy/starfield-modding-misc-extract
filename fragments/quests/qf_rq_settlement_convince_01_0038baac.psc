ScriptName Fragments:Quests:QF_RQ_Settlement_Convince_01_0038BAAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_TargetNPC Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
Potion Property Aid_MedPack Auto Const
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
ActorValue Property SQ_WoundedState Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
ReferenceAlias Property Alias_TargetMarker Auto Const mandatory
ReferenceAlias Property Alias_OverlayMapMarker Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:12
  Self.SetStage(25) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0025_Item_00()
  ObjectReference TargetREF = Alias_TargetNPC.GetRef() ; #DEBUG_LINE_NO:23
  ObjectReference MarkerREF = Alias_TargetMarker.GetRef() ; #DEBUG_LINE_NO:24
  TargetREF.Disable(False) ; #DEBUG_LINE_NO:27
  TargetREF.MoveTo(MarkerREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:28
  TargetREF.Enable(False) ; #DEBUG_LINE_NO:29
  (TargetREF as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:38
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:39
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:51
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:55
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:57
  kmyQuest.SetDialogueAV_Hello_Calm_PostAccept() ; #DEBUG_LINE_NO:58
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:71
  Self.SetStage(300) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0275_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:88
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:89
  If !Self.GetStageDone(995) ; #DEBUG_LINE_NO:92
    Self.SetStage(990) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor targetNPC = Alias_TargetNPC.GetActorRef() ; #DEBUG_LINE_NO:102
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:104
  targetNPC.SetProtected(False) ; #DEBUG_LINE_NO:106
  targetNPC.AddKeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:107
  targetNPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:116
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:117
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:120
  Alias_TargetNPC.GetActorRef().RemoveKeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:122
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:124
    Self.SetStage(995) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:134
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:135
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:139
    Self.SetStage(990) ; #DEBUG_LINE_NO:140
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:152
    Self.SetStage(990) ; #DEBUG_LINE_NO:153
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:173
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:174
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:178
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:179
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:180
    kmyQuest.SetDialogueAV_Hello_Stressed_Failure() ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:192
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:193
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:197
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:198
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:199
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:200
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:203
EndFunction
