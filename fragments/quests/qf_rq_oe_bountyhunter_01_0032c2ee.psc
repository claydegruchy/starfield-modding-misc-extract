ScriptName Fragments:Quests:QF_RQ_OE_BountyHunter_01_0032C2EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const mandatory
ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const mandatory
ReferenceAlias Property Alias_dungeonMapMarker Auto Const
ReferenceAlias Property Alias_OverlayMapMarker Auto Const
ReferenceAlias Property Alias_QuestGiver Auto Const
ReferenceAlias Property Alias_DungeonEdgeMarker Auto Const mandatory
Scene Property AssaultBarkScene Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const
Faction Property REPlayerAlly Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:23
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:25
  ObjectReference dungeonMapMarkerRef = Alias_dungeonMapMarker.GetRef() ; #DEBUG_LINE_NO:26
  dungeonMapMarkerRef.AddToMapScanned(False) ; #DEBUG_LINE_NO:27
  dungeonMapMarkerRef.SetMapMarkerCategory(0) ; #DEBUG_LINE_NO:28
  Alias_OverlayMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:32
  Alias_QuestGiver.TryToAddToFaction(REPlayerAlly) ; #DEBUG_LINE_NO:35
  Self.SetStage(120) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0120_Item_00()
  AssaultBarkScene.Start() ; #DEBUG_LINE_NO:46
  Alias_QuestGiver.GetActorRef().SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor QuestGiver = Alias_QuestGiver.GetActorRef() ; #DEBUG_LINE_NO:57
  ObjectReference EdgeMarker = Alias_DungeonEdgeMarker.GetRef() ; #DEBUG_LINE_NO:58
  QuestGiver.MoveTo(EdgeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
  QuestGiver.EvaluatePackage(False) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:70
  Actor QuestGiver = Alias_QuestGiver.GetActorRef() ; #DEBUG_LINE_NO:73
  QuestGiver.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:74
  QuestGiver.EvaluatePackage(False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:83
  Self.SetStage(990) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:92
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:93
  If !Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:96
    Self.SetStage(990) ; #DEBUG_LINE_NO:98
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:100
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:111
  rqscript kmyQuest = __temp as rqscript ; #DEBUG_LINE_NO:112
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:115
  Self.SetStage(995) ; #DEBUG_LINE_NO:116
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:117
  kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:118
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:135
  Self.SetStage(999) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0995_Item_00()
  Alias_QuestGiver.TryToRemoveFromFaction(REPlayerAlly) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0997_Item_00()
  Actor QuestGiver = Alias_QuestGiver.GetActorRef() ; #DEBUG_LINE_NO:155
  QuestGiver.MoveTo(Alias_CenterMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:157
  QuestGiver.EvaluatePackage(False) ; #DEBUG_LINE_NO:158
  Self.SetStage(999) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:168
EndFunction
