ScriptName Fragments:Quests:QF_COM_Quest_SamCoe_Q01_00263262 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property COM_SamCoeQ01_0310_SamStallsForTime Auto Const mandatory
ReferenceAlias Property Alias_JaylenPryce Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
Scene Property COM_SamCoeQ01_0311_SamStallsEnds Auto Const mandatory
Scene Property COM_SamCoeQ01_0510_ArrivedOutsideCI Auto Const mandatory
Scene Property COM_SamCoeQ01_0520_CIDoorScene Auto Const mandatory
Scene Property COM_SamCoeQ01_0600_MurderScene Auto Const mandatory
ReferenceAlias Property Alias_CI_Door Auto Const mandatory
Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const mandatory
GlobalVariable Property COM_SamCoeRecruited Auto Const mandatory
Scene Property COM_SamCoeQ01_0920_DumasHailed Auto Const mandatory
Scene Property COM_SamCoeQ01_1000_DumasLooted Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
RefCollectionAlias Property Alias_FirstWaveEnemies Auto Const mandatory
RefCollectionAlias Property Alias_SecondWaveEnemies Auto Const mandatory
ReferenceAlias Property Alias_ValerieMosquera Auto Const mandatory
GlobalVariable Property COM_PlayerMet_LilianHart Auto Const mandatory
ObjectReference Property LC123LandingREF Auto Const mandatory
Scene Property COM_SamCoeQ01_0875_LillianCoraReunion Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01_SpaceEnc Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
ObjectReference Property COM_SC_CacheEntranceREF Auto Const mandatory
ReferenceAlias Property Alias_LillianHart Auto Const mandatory
ReferenceAlias Property Alias_LillianTempNonHostile Auto Const mandatory
Scene Property COM_SamCoeQ01_0825_LillianShedsCover Auto Const mandatory
ActorValue Property COM_StoryGatesCompleted Auto Const mandatory
GlobalVariable Property COM_StoryGate_AffinityRequired_07_Standard Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory
ActorValue Property COM_CurrentStoryGateTimerExpired Auto Const mandatory
ActorValue Property COM_TEMP_OnPlayerShip Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_CoraState Auto Const mandatory
ReferenceAlias Property Alias_CI_Clue Auto Const mandatory
Scene Property COM_SamCoeQ01_1150_LillianRepeatsMission Auto Const mandatory
ReferenceAlias Property Alias_CacheMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VictorMapMarker Auto Const mandatory
ReferenceAlias Property Alias_LillianSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_CoraSceneMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipModule Auto Const mandatory
Outfit Property Outfit_FreestarRanger Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
ReferenceAlias Property Alias_VictorCompoundPapers Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_JaylenBusy Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Message Property SamCoe_AlarmMessage Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
ReferenceAlias Property Alias_CacheSecurity Auto Const mandatory
ActorValue Property COM_Quest_SamCoe_Q01_Complete_AV Auto Const mandatory
ObjectReference Property COM_SCQ01_ApartmentOverrideMarker Auto Const mandatory
Cell Property CityNeonSamCoeCIApartment Auto Const mandatory
ReferenceAlias Property Alias_VictorCompoundFinalAmbush Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const
ReferenceAlias Property Alias_ElevatorManagerApartment Auto Const mandatory
GlobalVariable Property COM_Cora_FollowingAllowed Auto Const mandatory
ReferenceAlias Property Alias_ValerieSlate Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_SamCoe Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB07_Timestamp Auto Const mandatory
GlobalVariable Property SamCoe_Q01_JaylenPrice_BlockedByFC04 Auto Const mandatory
Quest Property FC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference oTarg = Alias_SamCoe.GetRef() ; #DEBUG_LINE_NO:8
  ObjectReference oJaylen = Alias_DebugMarker.GetRef() ; #DEBUG_LINE_NO:9
  oTarg.Enable(False) ; #DEBUG_LINE_NO:10
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  oTarg = Alias_CoraCoe.GetRef() ; #DEBUG_LINE_NO:13
  oTarg.Enable(False) ; #DEBUG_LINE_NO:14
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
  oTarg = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:17
  oTarg.MoveTo(oJaylen, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  oTarg = Alias_SamCoe.GetRef() ; #DEBUG_LINE_NO:21
  oTarg.SetValue(COM_StoryGatesCompleted, 6.0) ; #DEBUG_LINE_NO:23
  oTarg.SetValue(COM_Affinity, COM_StoryGate_AffinityRequired_07_Standard.GetValue()) ; #DEBUG_LINE_NO:26
  oTarg.SetValue(COM_CurrentStoryGateTimerExpired, 1.0) ; #DEBUG_LINE_NO:29
  oTarg.SetValue(COM_TEMP_OnPlayerShip, 1.0) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0001_Item_00()
  If COM_SamCoeRecruited.GetValue() == 0.0 ; #DEBUG_LINE_NO:40
    COM_SamCoeRecruited.SetValue(1.0) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  SQ_Companions.SetRoleActive(Alias_SamCoe.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:45
  SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_SamCoe) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:50
  Self.SetStage(100) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:59
  Self.SetStage(700) ; #DEBUG_LINE_NO:61
  Alias_CoraCoe.GetRef().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  Alias_SamCoe.GetRef().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
  Game.GetPlayer().MoveTo(LC123LandingREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:74
  Self.SetStage(850) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:76
  Self.SetStage(1100) ; #DEBUG_LINE_NO:77
  Alias_CoraCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:80
  Alias_SamCoe.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:81
  Alias_LillianHart.GetRef().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
  Game.GetPlayer().MoveTo(COM_SC_CacheEntranceREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:91
  If FC04.IsRunning() && !FC04.GetStageDone(900) ; #DEBUG_LINE_NO:93
    Self.SetStage(110) ; #DEBUG_LINE_NO:94
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:105
    SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(1.0) ; #DEBUG_LINE_NO:106
    Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:107
    If Self.IsObjectiveDisplayed(75) && !Self.IsObjectiveCompleted(75) ; #DEBUG_LINE_NO:110
      Self.SetObjectiveDisplayed(75, False, False) ; #DEBUG_LINE_NO:111
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:114
      Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:115
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(200) && !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:118
      Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:119
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  SamCoe_Q01_JaylenPrice_BlockedByFC04.SetValue(0.0) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:131
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:134
    If Self.GetStageDone(200) ; #DEBUG_LINE_NO:135
      Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:136
    ElseIf Self.GetStageDone(150) ; #DEBUG_LINE_NO:137
      Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:138
    ElseIf Self.GetStageDone(100) ; #DEBUG_LINE_NO:139
      Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:140
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  If SamCoe_Q01_JaylenPrice_BlockedByFC04.GetValue() < 1.0 ; #DEBUG_LINE_NO:150
    Self.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:151
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
  Alias_SamCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:155
  COM_Cora_FollowingAllowed.SetValue(1.0) ; #DEBUG_LINE_NO:158
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:167
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0215_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:192
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:193
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:194
  Alias_CI_Clue.GetRef().Enable(False) ; #DEBUG_LINE_NO:197
  Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 1.0) ; #DEBUG_LINE_NO:201
  Alias_JaylenPryce.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0310_Item_00()
  COM_SamCoeQ01_0310_SamStallsForTime.Start() ; #DEBUG_LINE_NO:211
  Self.SetStage(300) ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:221
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:222
  Self.SetStage(400) ; #DEBUG_LINE_NO:223
  Alias_JaylenPryce.GetActorRef().SetValue(COM_Quest_SamCoe_JaylenBusy, 0.0) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:234
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:235
  COM_SamCoeQ01_0310_SamStallsForTime.Stop() ; #DEBUG_LINE_NO:238
  If Self.GetStageDone(310) ; #DEBUG_LINE_NO:241
    COM_SamCoeQ01_0311_SamStallsEnds.Start() ; #DEBUG_LINE_NO:242
  EndIf ; #DEBUG_LINE_NO:
  Alias_VictorCompoundPapers.GetRef().Enable(False) ; #DEBUG_LINE_NO:246
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:249
    Self.SetStage(120) ; #DEBUG_LINE_NO:250
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:260
  (Alias_ElevatorManagerApartment.GetRef() as loadelevatormanagerscript).SetElevatorOperational(True) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Alias_CoraCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment ; #DEBUG_LINE_NO:272
    Alias_CoraCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
  SQ_Followers.CommandFollow(Alias_SamCoe.GetActorRef()) ; #DEBUG_LINE_NO:277
  If Alias_SamCoe.GetRef().GetParentCell() != CityNeonSamCoeCIApartment ; #DEBUG_LINE_NO:278
    Alias_SamCoe.GetActorRef().MoveTo(COM_SCQ01_ApartmentOverrideMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
  COM_SamCoeQ01_0510_ArrivedOutsideCI.Start() ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0520_Item_00()
  COM_SamCoeQ01_0520_CIDoorScene.Start() ; #DEBUG_LINE_NO:293
EndFunction

Function Fragment_Stage_0530_Item_00()
  Alias_CI_Door.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:302
  Alias_CI_Door.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:303
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:311
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:312
  SQ_Followers.SetRoleInactive(Alias_SamCoe.GetActorReference(), True, False, True) ; #DEBUG_LINE_NO:315
  COM_SamCoeQ01_0600_MurderScene.Start() ; #DEBUG_LINE_NO:318
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:326
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:327
EndFunction

Function Fragment_Stage_0675_Item_00()
  COM_SamCoeQ01_0600_MurderScene.Stop() ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:344
  Alias_VictorMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:347
  SQ_Followers.SetRoleActive(Alias_SamCoe.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:358
  Self.SetObjectiveDisplayed(750, True, False) ; #DEBUG_LINE_NO:359
  ObjectReference oTarg = Alias_SamCoe.GetRef() ; #DEBUG_LINE_NO:362
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:363
  oTarg = Alias_CoraCoe.GetRef() ; #DEBUG_LINE_NO:364
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom04), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:365
  COM_SamCoeQ01_0750_LillianAlert.Start() ; #DEBUG_LINE_NO:368
EndFunction

Function Fragment_Stage_0775_Item_00()
  Self.SetObjectiveCompleted(750, True) ; #DEBUG_LINE_NO:376
  Self.SetObjectiveDisplayed(775, True, False) ; #DEBUG_LINE_NO:377
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(775, True) ; #DEBUG_LINE_NO:385
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:386
  Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 1.0) ; #DEBUG_LINE_NO:392
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:393
  Alias_LillianHart.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0825_Item_00()
  Actor aLillian = Alias_LillianHart.GetRef() as Actor ; #DEBUG_LINE_NO:402
  Alias_LillianTempNonHostile.Clear() ; #DEBUG_LINE_NO:405
  COM_SamCoeQ01_0825_LillianShedsCover.Start() ; #DEBUG_LINE_NO:407
  aLillian.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:410
  aLillian.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:411
  aLillian.EvaluatePackage(False) ; #DEBUG_LINE_NO:412
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:420
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:421
  COM_PlayerMet_LilianHart.SetValue(1.0) ; #DEBUG_LINE_NO:424
  Alias_PlayerShipModule.RefillAlias() ; #DEBUG_LINE_NO:427
  Alias_LillianSceneMarker.RefillAlias() ; #DEBUG_LINE_NO:428
  Alias_CoraSceneMarker.RefillAlias() ; #DEBUG_LINE_NO:429
  Alias_LillianHart.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:432
  Alias_VictorCompoundFinalAmbush.GetRef().Enable(False) ; #DEBUG_LINE_NO:435
EndFunction

Function Fragment_Stage_0860_Item_00()
  Actor aTarg = None ; #DEBUG_LINE_NO:444
  aTarg = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:445
  aTarg.MoveTo(Alias_CoraSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:446
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:447
  aTarg = Alias_LillianHart.GetActorRef() ; #DEBUG_LINE_NO:449
  aTarg.MoveTo(Alias_LillianSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:450
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:451
  aTarg.SetOutfit(Outfit_FreestarRanger, False) ; #DEBUG_LINE_NO:452
EndFunction

Function Fragment_Stage_0875_Item_00()
  Alias_CoraCoe.GetRef().SetValue(COM_Quest_SamCoe_CoraState, 2.0) ; #DEBUG_LINE_NO:464
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:465
  COM_SamCoeQ01_0875_LillianCoraReunion.Start() ; #DEBUG_LINE_NO:468
EndFunction

Function Fragment_Stage_0890_Item_00()
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:477
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:485
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:486
EndFunction

Function Fragment_Stage_0920_Item_00()
  COM_Quest_SamCoe_Q01_SpaceEnc.Start() ; #DEBUG_LINE_NO:495
  COM_SamCoeQ01_0920_DumasHailed.Start() ; #DEBUG_LINE_NO:498
EndFunction

Function Fragment_Stage_0930_Item_00()
  COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(200) ; #DEBUG_LINE_NO:507
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:515
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:516
  COM_SamCoeQ01_1000_DumasLooted.Start() ; #DEBUG_LINE_NO:519
  COM_Quest_SamCoe_Q01_SpaceEnc.SetStage(600) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:530
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:531
  Alias_CacheMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:535
  Alias_CacheSecurity.GetRef().Enable(False) ; #DEBUG_LINE_NO:538
EndFunction

Function Fragment_Stage_1150_Item_00()
  Actor aTarg = Alias_LillianHart.GetActorRef() ; #DEBUG_LINE_NO:547
  aTarg.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:548
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:549
  COM_SamCoeQ01_1150_LillianRepeatsMission.Start() ; #DEBUG_LINE_NO:552
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:560
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:565
EndFunction

Function Fragment_Stage_1250_Item_00()
  Alias_ValerieMosquera.GetActorRef().AddItem(Alias_ValerieSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:577
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:590
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:591
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:599
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:600
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True) ; #DEBUG_LINE_NO:608
  Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:609
  COM_Cora_FollowingAllowed.SetValue(0.0) ; #DEBUG_LINE_NO:612
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:613
EndFunction

Function Fragment_Stage_1575_Item_00()
  Actor aTarg = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:622
  aTarg.AddKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:623
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:624
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:632
  Actor aTarg = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:635
  aTarg.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:636
  Self.SetStage(9000) ; #DEBUG_LINE_NO:639
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:647
  Self.Stop() ; #DEBUG_LINE_NO:648
EndFunction

Function Fragment_Stage_9000_Item_00()
  SQ_Companions.LockInCompanion(Alias_SamCoe.GetActorReference() as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:657
  Game.GetPlayer().SetValue(COM_Quest_SamCoe_Q01_Complete_AV, 1.0) ; #DEBUG_LINE_NO:660
  (Alias_SamCoe.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest() ; #DEBUG_LINE_NO:663
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:666
  SE_Player_FAB07_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:667
  Self.Stop() ; #DEBUG_LINE_NO:669
EndFunction
