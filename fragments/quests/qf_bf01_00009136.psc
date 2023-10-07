ScriptName Fragments:Quests:QF_BF01_00009136 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF01_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF01_UCSGuard01 Auto Const mandatory
ReferenceAlias Property Alias_CF01_UCSGuard02 Auto Const mandatory
ObjectReference Property CF01PlayerStartMarker Auto Const mandatory
Scene Property CF01_Stage120_InitialGuardScene Auto Const mandatory
Message Property CF01_Stage10Temp_Message Auto Const mandatory
MiscObject Property CF01_AuroraShipSample Auto Const mandatory
ReferenceAlias Property Alias_CF01_AuroraSample Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
ObjectReference Property CF01KibweOpsMarker Auto Const mandatory
ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const mandatory
ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const mandatory
ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const mandatory
ObjectReference Property CF01UCSGuard01AfterLtMarker Auto Const mandatory
Scene Property CF01_Stage165_UCSGuard01_EnterRoomScene Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ReferenceAlias Property Alias_CF01_KarlFielding Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Scene Property CF01_Stage140_Kibwe_AcceptOfferScene Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF01KibweStartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF01_AdlerKemp Auto Const mandatory
Scene Property CF01_Stage180_UCSGuard01_EscortingScene Auto Const mandatory
Scene Property CF01_Stage185_UCSGuard01_EscortingSceneEnding Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Message Property CF01_Stage205Debug_Message Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
Scene Property CF01_Stage209_UCSoldier_AssignmentFinalScene Auto Const mandatory
ObjectReference Property CF01_AltMeet_UCGuard01Marker Auto Const mandatory
Scene Property CF01_Stage208_UCSoldier_AssignmentEscortScene Auto Const mandatory
ReferenceAlias Property Alias_CF01_Sebastian Auto Const mandatory
ReferenceAlias Property Alias_CF01_InviteSlate Auto Const mandatory
ObjectReference Property CF01_InterrogationChairRef Auto Const mandatory
ObjectReference Property LoadElevator_ProximityTrigger017 Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
GlobalVariable Property CF01_KarlDebt Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const
ObjectReference Property CF01_FollowerWaitMarker Auto Const mandatory
Quest Property CF01_KarlFielding_SpeechChallenges Auto Const mandatory
ReferenceAlias Property Alias_CF01_Toft Auto Const mandatory
Cell Property LC082Vigilance01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew02 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew03 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew04 Auto Const mandatory
ReferenceAlias Property Alias_Ops_Crew05 Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Quest Property DialogueCrimeGuards Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
Faction Property CrimeFactionUCSysDef Auto Const mandatory
ReferenceAlias Property Alias_HomeShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0309_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:9
  CF01_Stage10Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(205) ; #DEBUG_LINE_NO:18
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor SysDef01 = Alias_Ops_Crew01.GetActorRef() ; #DEBUG_LINE_NO:29
  Actor SysDef02 = Alias_Ops_Crew02.GetActorRef() ; #DEBUG_LINE_NO:30
  Actor SysDef03 = Alias_Ops_Crew03.GetActorRef() ; #DEBUG_LINE_NO:31
  Actor SysDef04 = Alias_Ops_Crew04.GetActorRef() ; #DEBUG_LINE_NO:32
  Actor SysDef05 = Alias_Ops_Crew05.GetActorRef() ; #DEBUG_LINE_NO:33
  VigilanceMainActors.AddRef(SysDef01 as ObjectReference) ; #DEBUG_LINE_NO:35
  VigilanceMainActors.AddRef(SysDef02 as ObjectReference) ; #DEBUG_LINE_NO:36
  VigilanceMainActors.AddRef(SysDef03 as ObjectReference) ; #DEBUG_LINE_NO:37
  VigilanceMainActors.AddRef(SysDef04 as ObjectReference) ; #DEBUG_LINE_NO:38
  VigilanceMainActors.AddRef(SysDef05 as ObjectReference) ; #DEBUG_LINE_NO:39
  SysDef01.SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:41
  SysDef02.SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:42
  SysDef03.SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:43
  SysDef04.SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:44
  SysDef05.SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:53
  cf01questscript kmyQuest = __temp as cf01questscript ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:57
  LC082.UpdateVigilanceLocation("CF01") ; #DEBUG_LINE_NO:59
  LC082Vigilance01.EnableFastTravel(False) ; #DEBUG_LINE_NO:61
  Alias_playerShip.GetShipRef().StopCombatAlarm() ; #DEBUG_LINE_NO:64
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:65
  LC082_InterrogationRoomDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:68
  LC082_InterrogationRoomDoorRef.SetLockLevel(253) ; #DEBUG_LINE_NO:69
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:73
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:76
  Alias_CF01_UCSGuard02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:77
  LoadElevator_ProximityTrigger017.Disable(False) ; #DEBUG_LINE_NO:80
  kmyQuest.RemovePlayerContraband() ; #DEBUG_LINE_NO:83
  CrimeFactionUC.SetPlayerEnemy(False) ; #DEBUG_LINE_NO:86
  Actor[] waitingFollowers = SQ_Followers.AllFollowersWait(CF01_FollowerWaitMarker, False, False) ; #DEBUG_LINE_NO:88
  SQ_Followers.TeleportFollowers(CF01_FollowerWaitMarker, waitingFollowers, True, True, False, False, False) ; #DEBUG_LINE_NO:89
  Game.GetPlayer().MoveTo(CF01PlayerStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:92
  Game.GetPlayer().SnapIntoInteraction(CF01_InterrogationChairRef) ; #DEBUG_LINE_NO:93
  Game.GetPlayer().SetRestrained(True) ; #DEBUG_LINE_NO:94
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:97
  Alias_HomeShip.TryToInstantDock(Alias_Vigilance) ; #DEBUG_LINE_NO:99
  Self.SetStage(120) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0120_Item_00()
  CF01_Stage120_InitialGuardScene.Start() ; #DEBUG_LINE_NO:110
  (DialogueCrimeGuards as cf01dialoguecrimeguardsscript).EnablePlayerControlsAfterCF01Arrest() ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:121
  Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01UCSGuard01AfterLtMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetStage(160) ; #DEBUG_LINE_NO:130
  CrimeFactionUC.SetCrimeGold(0) ; #DEBUG_LINE_NO:133
  CrimeFactionUC.SetCrimeGoldViolent(0) ; #DEBUG_LINE_NO:134
  CrimeFactionUC.SetPlayerEnemy(False) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(160) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0165_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:151
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:152
  LC082_InterrogationRoomDoorRef.Unlock(False) ; #DEBUG_LINE_NO:155
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:156
  LC082.SetStage(200) ; #DEBUG_LINE_NO:159
  Alias_CF01_UCSGuard01.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:162
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:163
  CF01_Stage165_UCSGuard01_EnterRoomScene.Start() ; #DEBUG_LINE_NO:164
  Game.GetPlayer().SetRestrained(False) ; #DEBUG_LINE_NO:167
  SQ_Followers.AllFollowersFollow(None) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0166_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:184
  cf01questscript kmyQuest = __temp as cf01questscript ; #DEBUG_LINE_NO:185
  Game.GetPlayer().SetRestrained(False) ; #DEBUG_LINE_NO:191
  SQ_Followers.AllFollowersFollow(None) ; #DEBUG_LINE_NO:192
  kmyQuest.SendPlayerToJail() ; #DEBUG_LINE_NO:194
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:195
  Self.SetStage(175) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:207
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:208
  LC082_InterrogationRoomDoorRef.Unlock(False) ; #DEBUG_LINE_NO:209
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:210
  Self.SetStage(245) ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:222
  CF01_Stage180_UCSGuard01_EscortingScene.Start() ; #DEBUG_LINE_NO:223
  CF01_Stage140_Kibwe_AcceptOfferScene.Stop() ; #DEBUG_LINE_NO:226
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:227
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:228
EndFunction

Function Fragment_Stage_0185_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0190_Item_00()
  CF01_Stage185_UCSGuard01_EscortingSceneEnding.Start() ; #DEBUG_LINE_NO:245
EndFunction

Function Fragment_Stage_0195_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:253
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:254
  LoadElevator_ProximityTrigger017.Enable(False) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:267
  Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:270
  Alias_CF01_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:271
  LC082.UpdateVigilanceLocation("CF01") ; #DEBUG_LINE_NO:274
  Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01_AltMeet_UCGuard01Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:277
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:278
  LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:282
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0206_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:291
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:292
  LC082.SetStage(200) ; #DEBUG_LINE_NO:295
  LoadElevator_ProximityTrigger017.Disable(False) ; #DEBUG_LINE_NO:298
EndFunction

Function Fragment_Stage_0207_Item_00()
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:306
  Self.SetObjectiveDisplayed(36, True, False) ; #DEBUG_LINE_NO:307
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:310
  CF01_Stage208_UCSoldier_AssignmentEscortScene.Start() ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_0208_Item_00()
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:320
EndFunction

Function Fragment_Stage_0209_Item_00()
  CF01_Stage209_UCSoldier_AssignmentFinalScene.Start() ; #DEBUG_LINE_NO:328
EndFunction

Function Fragment_Stage_0210_Item_00()
  If Self.IsObjectiveDisplayed(36) == True ; #DEBUG_LINE_NO:337
    Self.SetObjectiveCompleted(36, True) ; #DEBUG_LINE_NO:338
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(230) == False ; #DEBUG_LINE_NO:340
    If Self.IsObjectiveDisplayed(40) == False ; #DEBUG_LINE_NO:341
      Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:342
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(205) == True ; #DEBUG_LINE_NO:347
    LoadElevator_ProximityTrigger017.Enable(False) ; #DEBUG_LINE_NO:348
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:352
EndFunction

Function Fragment_Stage_0215_Item_00()
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:360
  Alias_CF01_Kibwe.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:362
  Alias_CF01_Kibwe.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:363
  Alias_CF01_Toft.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:364
  Alias_CF01_Toft.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:373
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:374
  Alias_CF01_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:376
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:385
    Self.SetObjectiveDisplayed(10, False, False) ; #DEBUG_LINE_NO:386
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:388
    Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:389
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(30) ; #DEBUG_LINE_NO:391
    Self.SetObjectiveDisplayed(30, False, False) ; #DEBUG_LINE_NO:392
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(35) ; #DEBUG_LINE_NO:394
    Self.SetObjectiveDisplayed(35, False, False) ; #DEBUG_LINE_NO:395
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(36) ; #DEBUG_LINE_NO:397
    Self.SetObjectiveDisplayed(36, False, False) ; #DEBUG_LINE_NO:398
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(37) ; #DEBUG_LINE_NO:400
    Self.SetObjectiveDisplayed(37, False, False) ; #DEBUG_LINE_NO:401
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(40) ; #DEBUG_LINE_NO:403
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:404
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(50) ; #DEBUG_LINE_NO:406
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:407
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(52, True, False) ; #DEBUG_LINE_NO:409
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:414
  LC082Vigilance01.EnableFastTravel(True) ; #DEBUG_LINE_NO:415
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(52, True) ; #DEBUG_LINE_NO:424
  Self.SetStage(250) ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_0245_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:434
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:435
  Self.SetStage(250) ; #DEBUG_LINE_NO:436
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:437
  LC082Vigilance01.EnableFastTravel(True) ; #DEBUG_LINE_NO:438
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(54, True, False) ; #DEBUG_LINE_NO:446
  Alias_CF01_Sebastian.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:449
  Alias_CF01_Sebastian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:450
EndFunction

Function Fragment_Stage_0255_Item_00()
  Alias_CF01_Sebastian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:458
EndFunction

Function Fragment_Stage_0260_Item_00()
  Game.GetPlayer().AddItem(Alias_CF01_InviteSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:467
  Self.SetObjectiveCompleted(54, True) ; #DEBUG_LINE_NO:468
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:469
  Alias_CF01_AdlerKemp.TryToEnable() ; #DEBUG_LINE_NO:472
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:498
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:499
  Game.GetPlayer().AddItem(Alias_CF01_AuroraSample.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:501
  LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:504
  CF_Main.SetStage(20) ; #DEBUG_LINE_NO:507
  CFSD01.SetStage(5) ; #DEBUG_LINE_NO:510
  CF01_KarlFielding_SpeechChallenges.Start() ; #DEBUG_LINE_NO:513
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(270) == False ; #DEBUG_LINE_NO:522
    Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:523
    Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:524
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(270) == True ; #DEBUG_LINE_NO:527
    Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:528
    Self.SetStage(340) ; #DEBUG_LINE_NO:529
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0336_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:539
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:547
    Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:548
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:550
  Alias_CF01_AdlerKemp.TryToEnable() ; #DEBUG_LINE_NO:552
EndFunction

Function Fragment_Stage_0340_Item_01()
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:561
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:562
  Alias_CF01_AdlerKemp.TryToEnable() ; #DEBUG_LINE_NO:564
EndFunction

Function Fragment_Stage_0347_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF01_AuroraSample.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:573
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:581
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:582
  Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef() ; #DEBUG_LINE_NO:584
  KarlRef.Enable(False) ; #DEBUG_LINE_NO:585
  KarlRef.SetEssential(False) ; #DEBUG_LINE_NO:586
  KarlRef.SetProtected(True) ; #DEBUG_LINE_NO:587
  Alias_CF01_Sebastian.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:590
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:599
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:600
  Alias_CF01_KarlFielding.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:601
EndFunction

Function Fragment_Stage_0367_Item_00()
  Self.SetStage(370) ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.IsObjectiveDisplayed(90) ; #DEBUG_LINE_NO:617
    Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:618
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:620
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:621
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:623
  If Self.GetStageDone(365) == True ; #DEBUG_LINE_NO:626
    Game.GetPlayer().AddItem(Credits as Form, CF01_KarlDebt.GetValueInt(), False) ; #DEBUG_LINE_NO:627
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0375_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CF01_KarlDebt.GetValueInt(), False, None) ; #DEBUG_LINE_NO:637
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef() ; #DEBUG_LINE_NO:646
  KarlRef.Disable(False) ; #DEBUG_LINE_NO:647
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:649
  CF02.SetStage(10) ; #DEBUG_LINE_NO:650
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew01.GetRef()) ; #DEBUG_LINE_NO:653
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew02.GetRef()) ; #DEBUG_LINE_NO:654
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew03.GetRef()) ; #DEBUG_LINE_NO:655
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew04.GetRef()) ; #DEBUG_LINE_NO:656
  VigilanceMainActors.RemoveRef(Alias_Ops_Crew05.GetRef()) ; #DEBUG_LINE_NO:657
  Alias_Ops_Crew01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:659
  Alias_Ops_Crew02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:660
  Alias_Ops_Crew03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:661
  Alias_Ops_Crew04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:662
  Alias_Ops_Crew05.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:663
  Self.Stop() ; #DEBUG_LINE_NO:664
EndFunction
