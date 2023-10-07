ScriptName Fragments:Quests:QF_City_ER_Dead_0017134F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_ER_Dead_Misc Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Message Property ER_DEBUG_Dead_PCMBusted Auto Const mandatory
ReferenceAlias Property Alias_Kilman Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property City_ER_Dead_0400_KilmanReturns Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker01 Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker02a Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Kilman Auto Const mandatory
Quest Property City_ER_Ghost Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker01a Auto Const mandatory
Scene Property City_ER_Dead_390_ConstWorkers_KilmanGreeting Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerM02 Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerF02 Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerF01 Auto Const mandatory
Perk Property TRAIT_Empath Auto Const mandatory
Scene Property City_ER_Dead_0205_Kilman_Attract Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker03 Auto Const mandatory
ObjectReference Property ER_Dead_DebugMarker_Kilman Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Monika Auto Const mandatory
ReferenceAlias Property Alias_Petra Auto Const mandatory
ReferenceAlias Property Alias_Sloan Auto Const mandatory
ReferenceAlias Property Alias_Halftown Auto Const mandatory
ReferenceAlias Property Alias_ConstructionWorkerM01 Auto Const mandatory
ObjectReference Property ER_Dead_Scene400Marker_Halftown Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
GlobalVariable Property ER_Ghost_BetterReward Auto Const mandatory
ReferenceAlias Property Alias_DungeonBoss Auto Const mandatory
ReferenceAlias Property Alias_DungeonBossReplacement Auto Const mandatory
ReferenceAlias Property Alias_CowerMarker Auto Const mandatory
ObjectReference Property City_ER_Dead_KilmanStage400_TeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_TriggerStage400 Auto Const mandatory
GlobalVariable Property ER_Ghost_BetterRewardUnlocked Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueEleosRetreat.SetStage(25) ; #DEBUG_LINE_NO:7
  DialogueEleosRetreat.SetStage(40) ; #DEBUG_LINE_NO:8
  DialogueEleosRetreat.SetStage(50) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker01a, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:18
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker02a, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor KilACT = Alias_Kilman.GetActorRef() ; #DEBUG_LINE_NO:29
  KilACT.Enable(False) ; #DEBUG_LINE_NO:30
  Self.SetStage(300) ; #DEBUG_LINE_NO:31
  Game.GetPlayer().Moveto(ER_Dead_DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  KilACT.Moveto(ER_Dead_DebugMarker_Kilman, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_Petra.GetRef().Moveto(ER_Dead_Scene400Marker_Monika, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
  Alias_Sloan.GetRef().Moveto(ER_Dead_Scene400Marker_Monika, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:43
  Alias_Halftown.GetRef().Moveto(ER_Dead_Scene400Marker_Halftown, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddPerk(TRAIT_Empath, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0100_Item_00()
  If City_ER_Dead_Misc.IsRunning() ; #DEBUG_LINE_NO:61
    City_ER_Dead_Misc.SetStage(1000) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  DialogueEleosRetreat.SetStage(2100) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:68
  Self.SetActive(True) ; #DEBUG_LINE_NO:69
  Alias_DungeonBoss.GetRef().Disable(False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor KilACT = Alias_Kilman.GetActorRef() ; #DEBUG_LINE_NO:80
  KilACT.Moveto(Alias_CowerMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:81
  KilACT.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:82
  KilACT.Enable(False) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_Kilman.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:94
  City_ER_Dead_0205_Kilman_Attract.Start() ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0207_Item_00()
  Alias_Kilman.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(207) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:120
  uc09questscript kmyQuest = __temp as uc09questscript ; #DEBUG_LINE_NO:121
  sq_followersscript myFollow = SQ_Followers as sq_followersscript ; #DEBUG_LINE_NO:125
  Actor KilACT = Alias_Kilman.GetActorRef() ; #DEBUG_LINE_NO:126
  myFollow.SetRoleActive(KilACT, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:127
  myFollow.CommandFollow(KilACT) ; #DEBUG_LINE_NO:128
  kmyQuest.GetNPCsInPlace() ; #DEBUG_LINE_NO:131
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:142
    City_ER_Dead_390_ConstWorkers_KilmanGreeting.Start() ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
  Alias_ConstructionWorkerF02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:146
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:147
  Alias_ConstructionWorkerM02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:148
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:149
  Alias_ConstructionWorkerF01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0400_Item_00()
  sq_followersscript myFollow = SQ_Followers as sq_followersscript ; #DEBUG_LINE_NO:160
  Actor KilACT = Alias_Kilman.GetActorRef() ; #DEBUG_LINE_NO:161
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:162
  myFollow.SetRoleInactive(KilACT, True, False, True) ; #DEBUG_LINE_NO:163
  If !Alias_TriggerStage400.GetRef().IsInTrigger(KilACT as ObjectReference) && !PlayACT.HasDetectionLOS(KilACT as ObjectReference) && PlayACT.GetDistance(KilACT as ObjectReference) >= 15.0 ; #DEBUG_LINE_NO:166
    KilACT.Moveto(City_ER_Dead_KilmanStage400_TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
  City_ER_Dead_0400_KilmanReturns.Start() ; #DEBUG_LINE_NO:170
  ER_Dead_KilmansReturned.SetValue(1.0) ; #DEBUG_LINE_NO:171
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:173
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0405_Item_00()
  Alias_Petra.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:182
  Alias_Sloan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Halftown.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:191
  Alias_ConstructionWorkerM01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:192
  Alias_Petra.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:193
  Alias_Kilman.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:194
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:196
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0510_Item_00()
  ER_Ghost_BetterRewardUnlocked.SetValue(1.0) ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Ghost.Start() ; #DEBUG_LINE_NO:213
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:214
  Self.Stop() ; #DEBUG_LINE_NO:215
EndFunction
