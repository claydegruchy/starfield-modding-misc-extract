ScriptName Fragments:Quests:QF_FC02_002944B8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FC02_PT1 Auto Const mandatory
Scene Property FC02_EmmaWalktoHannahScene Auto Const mandatory
Scene Property FC02_EmmaHandoffToHannahScene Auto Const mandatory
ReferenceAlias Property Alias_Hannah Auto Const mandatory
ObjectReference Property FC02_HannahWaitNearShipMarker Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC02_TempPlayerStage600Marker Auto Const mandatory
ObjectReference Property FC02_TempHannahStage600Marker Auto Const mandatory
ReferenceAlias Property Alias_Molly Auto Const mandatory
ObjectReference Property FC02_MaryStage600PackageMarker Auto Const mandatory
Scene Property FC02_HannahStartTrackingScene Auto Const mandatory
ObjectReference Property FC02_RuffiansEnableMarkerRef Auto Const mandatory
ObjectReference Property FC02_PT4 Auto Const mandatory
ObjectReference Property FC02_PT4_HannahMarker Auto Const mandatory
Scene Property FC02_HannaConcludeScene Auto Const mandatory
ObjectReference Property FC02_PT2 Auto Const mandatory
ObjectReference Property FC02_SetStage420Trigger Auto Const mandatory
Message Property FC02_BanditTracksActivatorA_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorB_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorC_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorD_MSG Auto Const mandatory
Message Property FC02_BanditTracksActivatorE_MSG Auto Const mandatory
Faction Property FreestarRangerFaction Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksE Auto Const mandatory
Faction Property FC02_RuffianEnemyFaction Auto Const mandatory
Quest Property FC03 Auto Const mandatory
Scene Property FC02_MikaelaFlagDownScene Auto Const mandatory
Key Property TEMP_FreestarRangerBadge_Deputy Auto Const mandatory
Scene Property FC02_HelgaTrackingComment01Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment02Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment03Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment04Scene Auto Const mandatory
Scene Property FC02_HelgaTrackingComment05Scene Auto Const mandatory
Scene Property FC02_HelgaRuffiansDeadScene Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property AkilaCityShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ObjectReference Property FC_PTRockDoor Auto Const mandatory
GlobalVariable Property MissionBoardAccessAllowed_FCR Auto Const mandatory
Perk Property FactionFreestarCollectivePerk Auto Const mandatory
ReferenceAlias Property Alias_Emma Auto Const mandatory
Quest Property FC01 Auto Const mandatory
Scene Property FC02_EmmaReportToBlakeScene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment06Scene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment07Scene Auto Const mandatory
Scene Property FC02_EmmaTrackingComment08Scene Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Quest Property FC02_BE_Quest Auto Const mandatory
ReferenceAlias Property Alias_WFIntroTrigger Auto Const mandatory
ReferenceAlias Property Alias_Waylon Auto Const mandatory
ReferenceAlias Property Alias_MikaelaStage500Marker Auto Const mandatory
ReferenceAlias Property Alias_MissionTerminal Auto Const mandatory
ActorValue Property FreestarRangerRank Auto Const mandatory
ReferenceAlias Property Alias_FC02_BanditCamp_EnableMarker Auto Const mandatory
Scene Property FC02_BanditChatterScene Auto Const mandatory
ActorValue Property FC02_Completed Auto Const mandatory
Armor Property Clothes_Ranger_Vested_Deputy Auto Const mandatory
ObjectReference Property FC02_BootprintEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ruffian01 Auto Const mandatory
ObjectReference Property FC02_EmmaMoveToCampMarker Auto Const mandatory
GlobalVariable Property FC02_EmmaSandboxCampGlobal Auto Const mandatory
Armor Property Clothes_Ranger_Hat_Deputy Auto Const mandatory
GlobalVariable Property FC02_EmmaFollowing Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksA Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksD Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksC Auto Const mandatory
ReferenceAlias Property Alias_BanditTracksB Auto Const mandatory
ReferenceAlias Property Alias_RuffianLeader Auto Const mandatory
ObjectReference Property FC02_Ruffian02Ref Auto Const mandatory
ReferenceAlias Property Alias_DanielBlake Auto Const mandatory
LeveledItem Property LL_Weapon_FreestarRangersSidearm Auto Const mandatory
MiscObject Property FreeStarDeputyBadge Auto Const mandatory
ReferenceAlias Property Alias_DeputyBadge Auto Const mandatory
ObjectReference Property FC02_BlakeReadingBookMarker Auto Const mandatory
ObjectReference Property FC03_PT1 Auto Const mandatory
wwiseevent Property WwiseEvent_QST_FC02_InvestigateTracks Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0120_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0170_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0220_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1025_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().moveto(FC02_PT1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Alias_DanielBlake.GetRef().moveto(FC02_BlakeReadingBookMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Frontier_ModularREF.moveto(AkilaCityShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:15
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:16
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:28
  Alias_WFIntroTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:31
  Alias_Waylon.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:32
  Alias_Molly.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:86
  FC02_EmmaWalktoHannahScene.Start() ; #DEBUG_LINE_NO:88
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_DeputyBadge.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:121
  Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersSidearm as Form, 1, False) ; #DEBUG_LINE_NO:122
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Vested_Deputy as Form, 1, False) ; #DEBUG_LINE_NO:123
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Hat_Deputy as Form, 1, False) ; #DEBUG_LINE_NO:124
  Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 1.0) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:139
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_Hannah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:150
  Self.SetStage(400) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0417_Item_00()
  Alias_Hannah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:190
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript ; #DEBUG_LINE_NO:191
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:196
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:197
  FC02_EmmaFollowing.SetValue(1.0) ; #DEBUG_LINE_NO:200
  kmyQuest.CheckConditions(None) ; #DEBUG_LINE_NO:202
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:204
  Actor EmmaWilcoxREF = Alias_Emma.GetActorRef() ; #DEBUG_LINE_NO:207
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(EmmaWilcoxREF) ; #DEBUG_LINE_NO:208
  Alias_FC02_BanditCamp_EnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:212
  FC02_BootprintEnableMarker.Enable(False) ; #DEBUG_LINE_NO:213
  Alias_BanditTracksA.GetReference().Enable(False) ; #DEBUG_LINE_NO:214
  Alias_BanditTracksB.GetReference().Enable(False) ; #DEBUG_LINE_NO:215
  Alias_BanditTracksC.GetReference().Enable(False) ; #DEBUG_LINE_NO:216
  Alias_BanditTracksD.GetReference().Enable(False) ; #DEBUG_LINE_NO:217
  Alias_BanditTracksE.GetReference().Enable(False) ; #DEBUG_LINE_NO:218
  Alias_Molly.GetActorRef().moveto(Alias_MikaelaStage500Marker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_Player.GetRef().moveto(FC02_TempPlayerStage600Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:231
  Alias_Hannah.GetRef().moveto(FC02_TempHannahStage600Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:232
  Alias_Molly.GetRef().moveto(FC02_MaryStage600PackageMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:243
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:244
  Actor HelgaDubrayREF = Alias_Hannah.GetActorRef() ; #DEBUG_LINE_NO:247
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(HelgaDubrayREF) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0610_Item_00()
  FC02_MikaelaFlagDownScene.Start() ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0615_Item_00()
  Alias_Emma.GetReference().moveto(FC03_PT1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:266
EndFunction

Function Fragment_Stage_0620_Item_00()
  Alias_Molly.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0800_Item_00()
  FC02_RuffiansEnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:288
  Alias_RuffianLeader.GetActorRef().AddItem(Alias_Slate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:291
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:293
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:294
  FC02_HannahStartTrackingScene.Start() ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0820_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:304
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:305
  FC02_BanditTracksActivatorA_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:306
  FC02_HelgaTrackingComment01Scene.Start() ; #DEBUG_LINE_NO:308
  Alias_BanditTracksA.GetReference().Disable(False) ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_0830_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:319
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:320
  FC02_BanditTracksActivatorB_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:321
  FC02_HelgaTrackingComment02Scene.Start() ; #DEBUG_LINE_NO:323
  Alias_BanditTracksB.GetReference().Disable(False) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0840_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:334
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:335
  FC02_BanditTracksActivatorC_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:336
  FC02_HelgaTrackingComment03Scene.Start() ; #DEBUG_LINE_NO:338
  Alias_BanditTracksC.GetReference().Disable(False) ; #DEBUG_LINE_NO:341
EndFunction

Function Fragment_Stage_0850_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:349
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:350
  FC02_BanditTracksActivatorD_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:351
  FC02_HelgaTrackingComment04Scene.Start() ; #DEBUG_LINE_NO:353
  Alias_BanditTracksD.GetReference().Disable(False) ; #DEBUG_LINE_NO:356
EndFunction

Function Fragment_Stage_0900_Item_00()
  FC02_EmmaTrackingComment06Scene.Start() ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_0910_Item_00()
  FC02_EmmaTrackingComment07Scene.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0920_Item_00()
  FC02_EmmaTrackingComment08Scene.Start() ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_0950_Item_00()
  FC02_BanditChatterScene.Start() ; #DEBUG_LINE_NO:388
  If Self.IsObjectiveDisplayed(800) ; #DEBUG_LINE_NO:390
    Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:391
    Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:392
  EndIf ; #DEBUG_LINE_NO:
  (FC02_Ruffian02Ref as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:395
EndFunction

Function Fragment_Stage_0970_Item_00()
  Alias_RuffianLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_1000_Item_00()
  WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:413
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:414
  FC02_BanditTracksActivatorE_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:415
  FC02_HelgaTrackingComment05Scene.Start() ; #DEBUG_LINE_NO:417
  Alias_BanditTracksE.GetReference().Disable(False) ; #DEBUG_LINE_NO:420
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:422
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:423
  (FC02_Ruffian02Ref as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_1010_Item_00()
  If Alias_Player.GetActorRef().GetDistance(Alias_Emma.GetRef()) > 30.0 ; #DEBUG_LINE_NO:435
    Alias_Emma.GetRef().moveto(FC02_EmmaMoveToCampMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:436
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1050_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC02_RuffianEnemyFaction) ; #DEBUG_LINE_NO:456
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:458
  Self.SetObjectiveDisplayed(1050, True, False) ; #DEBUG_LINE_NO:459
EndFunction

Function Fragment_Stage_1100_Item_00()
  FC02_HelgaRuffiansDeadScene.Start() ; #DEBUG_LINE_NO:469
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:471
  Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:472
  If !Self.GetStageDOne(1400) ; #DEBUG_LINE_NO:474
    Self.SetObjectiveDisplayed(1075, True, False) ; #DEBUG_LINE_NO:475
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:484
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript ; #DEBUG_LINE_NO:485
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:488
    Self.SetObjectiveDisplayed(1000, False, False) ; #DEBUG_LINE_NO:489
  EndIf ; #DEBUG_LINE_NO:
  FC02_EmmaSandboxCampGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:493
  FC02_EmmaFollowing.SetValue(0.0) ; #DEBUG_LINE_NO:496
  kmyQuest.CheckConditions(None) ; #DEBUG_LINE_NO:498
  Self.SetObjectiveCompleted(1075, True) ; #DEBUG_LINE_NO:500
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:501
EndFunction

Function Fragment_Stage_1300_Item_00()
  If Self.IsObjectiveDisplayed(1075) ; #DEBUG_LINE_NO:511
    Self.SetObjectiveDisplayed(1075, False, False) ; #DEBUG_LINE_NO:512
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:515
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_1400_Item_00()
  If Self.IsObjectiveDisplayed(1075) ; #DEBUG_LINE_NO:526
    Self.SetObjectiveDisplayed(1075, False, False) ; #DEBUG_LINE_NO:527
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:530
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:531
EndFunction

Function Fragment_Stage_1500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:539
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript ; #DEBUG_LINE_NO:540
  Self.SetObjectiveCompleted(1400, True) ; #DEBUG_LINE_NO:543
  FC02_EmmaSandboxCampGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:546
  FC02_EmmaFollowing.SetValue(1.0) ; #DEBUG_LINE_NO:549
  kmyQuest.CheckConditions(None) ; #DEBUG_LINE_NO:551
  If Self.GetStageDOne(630) == True ; #DEBUG_LINE_NO:553
    Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:554
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetStage(2000) ; #DEBUG_LINE_NO:568
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:577
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:585
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript ; #DEBUG_LINE_NO:586
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:589
  MissionBoardAccessAllowed_FCR.SetValue(1.0) ; #DEBUG_LINE_NO:592
  FC02_EmmaFollowing.SetValue(0.0) ; #DEBUG_LINE_NO:595
  kmyQuest.CheckConditions(None) ; #DEBUG_LINE_NO:597
  Game.GetPlayer().AddPerk(FactionFreestarCollectivePerk, False) ; #DEBUG_LINE_NO:600
  Alias_Player.GetActorRef().SetValue(FC02_Completed, 1.0) ; #DEBUG_LINE_NO:603
  FC02_BE_Quest.SetStage(1000) ; #DEBUG_LINE_NO:606
  FC03.Start() ; #DEBUG_LINE_NO:609
  Game.AddAchievement(14) ; #DEBUG_LINE_NO:612
  Self.Stop() ; #DEBUG_LINE_NO:614
EndFunction
