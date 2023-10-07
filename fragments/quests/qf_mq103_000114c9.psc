ScriptName Fragments:Quests:QF_MQ103_000114C9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ103 Auto Const mandatory
Scene Property MQ102_01_SamCoraScene Auto Const mandatory
Scene Property MQ102_02_SamPlayerIntroScene Auto Const mandatory
Scene Property MQ102_03_ArrriveAkilaScene Auto Const mandatory
Scene Property MQ103_09_SurveyScene Auto Const mandatory
Scene Property MQ103_12_ArtifactScene Auto Const mandatory
Scene Property MQ103_13_AftermathScene Auto Const mandatory
Scene Property MQ103_15_SmugglerAfterScene Auto Const mandatory
Scene Property MQ103_14_AmbushScene Auto Const mandatory
Scene Property MQ103_16_LodgeScene Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ103_17_EndScene Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ObjectReference Property MQ103SamStartMarker Auto Const mandatory
Scene Property MQ103_03_ArriveAkilaScene Auto Const mandatory
Scene Property MQ103_04_GalBankVaultScene Auto Const mandatory
Scene Property MQ103_06_CoeEstateIntroScene Auto Const mandatory
Scene Property MQ103_11b_JacobSamEndScene Auto Const mandatory
Scene Property MQ103_11a_JacobSamArgueScene Auto Const mandatory
Scene Property MQ103_12b_CoraJacobScene Auto Const mandatory
Scene Property MQ103_15_LockeGangSamScene Auto Const mandatory
Scene Property MQ103_16a_LockeGangEavesdrop Auto Const mandatory
Scene Property MQ103_16b_LockeGangEavesdrop Auto Const mandatory
Scene Property MQ103_17_ArtifactScene Auto Const mandatory
Scene Property MQ103_18_AftermathScene Auto Const mandatory
ObjectReference Property MQ103LockeEnableMarkerREF Auto Const mandatory
Scene Property MQ103_19_AmbushScene Auto Const mandatory
ReferenceAlias Property Alias_Locke Auto Const mandatory
RefCollectionAlias Property Alias_LockeBodyguard Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property MQ103_20_SmugglerAfterScene Auto Const mandatory
Scene Property MQ103_21_LodgeScene Auto Const mandatory
Scene Property MQ103_22_EndScene Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ObjectReference Property MQ103DungeonStart Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator Auto Const mandatory
ReferenceAlias Property Alias_MQ103ArtifactQuestObject Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Weapon Property Eon Auto Const mandatory
ObjectReference Property MQ103ArtifactSpawnMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ103_SamOutsideAkilaMarker Auto Const mandatory
Key Property MQ103CoeVaultKey Auto Const mandatory
Perk Property TraitFreestarCollectiveSettler Auto Const mandatory
Scene Property MQ103_04a_GalBankLockedScene Auto Const mandatory
ReferenceAlias Property Alias_GalBankVaultDoor Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property MQ103LockeGangExteriorEnableMarker Auto Const mandatory
ObjectReference Property MQ103AshtaEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_AshtaALL Auto Const mandatory
ReferenceAlias Property Alias_LockeGangMapMarker Auto Const mandatory
Scene Property MQ103_19b_AshtaScene Auto Const mandatory
Scene Property MQ103_21a_LodgeMoveScene Auto Const mandatory
Scene Property MQ103_04b_GalBankOpenScene Auto Const mandatory
ObjectReference Property LC006_CaveBlocker_EnableMarker Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SetStage300Trigger Auto Const mandatory
ReferenceAlias Property Alias_LockGang01 Auto Const mandatory
ReferenceAlias Property Alias_LockGang02 Auto Const mandatory
ReferenceAlias Property Alias_LockGang03 Auto Const mandatory
ReferenceAlias Property Alias_LockGang04 Auto Const mandatory
Faction Property MQ103LockeGangFaction Auto Const mandatory
ReferenceAlias Property Alias_CoeOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_CoeMainDoor Auto Const mandatory
ReferenceAlias Property Alias_SolomonMaps Auto Const mandatory
Key Property MQ103JacobOfficeKey Auto Const mandatory
ReferenceAlias Property Alias_JacobCoe Auto Const mandatory
Message Property MQ103SamLockInMSG Auto Const mandatory
Message Property MQ103SamLockInOverMSG Auto Const mandatory
Message Property MQ103SamLockInMidquestOverMSG Auto Const mandatory
Quest Property CREW_EliteCrew_CoraCoe Auto Const mandatory
LeveledItem Property LL_Weapon_Razorback_Upgraded Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ObjectReference Property MQ103_CoraSpaceportReadingMarker Auto Const mandatory
Perk Property BackgroundGangster Auto Const mandatory
ObjectReference Property LC006_LoadDoor_Ext Auto Const mandatory
ObjectReference Property CoeEstateFirstFloorDoorREF Auto Const mandatory
ObjectReference Property CoeEstateBalconyDoorREF Auto Const mandatory
ObjectReference Property CoeEstateFrontDoorREF Auto Const mandatory
Faction Property CoeEstateDoorFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Blake Auto Const mandatory
Keyword Property TeammateReadyWeapon_DO Auto Const mandatory
ReferenceAlias Property Alias_ArtifactSoundMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactSoundMarker02 Auto Const mandatory
ReferenceAlias Property Alias_LockeAshtaScreammer Auto Const mandatory
RefCollectionAlias Property PassengersRefColl Auto Const
RefCollectionAlias Property Alias_LockeGangInteriorNPCs Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const
ObjectReference Property CoeEstateFirstFloorDoorTwo Auto Const
Activator Property COM_MQ103_TxtReplace_QuestName_SamCoe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.SetStage(1150) ; #DEBUG_LINE_NO:10
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:13
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:14
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:15
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().additem(Credits as Form, 1500, False) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().additem(Eon as Form, 1, False) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().AddPerk(TraitFreestarCollectiveSettler, False) ; #DEBUG_LINE_NO:21
  Self.SetStage(10) ; #DEBUG_LINE_NO:22
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:26
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:27
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:36
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:37
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:38
  Self.SetStage(210) ; #DEBUG_LINE_NO:40
  Self.SetStage(610) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:43
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:46
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:47
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:48
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().MoveTo(MQ103DungeonStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
  Alias_SamCoe.GetActorRef().MoveTo(MQ103DungeonStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  Game.GetPlayer().additem(Credits as Form, 1500, False) ; #DEBUG_LINE_NO:54
  Game.GetPlayer().additem(Eon as Form, 1, False) ; #DEBUG_LINE_NO:55
  Game.GetPlayer().AddPerk(BackgroundGangster, False) ; #DEBUG_LINE_NO:56
  LC006_CaveBlocker_EnableMarker.Disable(False) ; #DEBUG_LINE_NO:59
  ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef()) ; #DEBUG_LINE_NO:62
  Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:71
  Alias_SamCoe.GetActorRef().MoveTo(MQ103SamStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:74
  Alias_CoraCoe.GetActorRef().MoveTo(MQ103SamStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:75
  ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef()) ; #DEBUG_LINE_NO:78
  Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF) ; #DEBUG_LINE_NO:79
  Self.SetActive(True) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ102_01_SamCoraScene.Start() ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:98
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:101
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:102
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(SamCoeREF) ; #DEBUG_LINE_NO:104
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(CoraCoeREF) ; #DEBUG_LINE_NO:105
  CREW_EliteCrew_CoraCoe.Start() ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0110_Item_00()
  ObjectReference PassengerMarkerREF = Alias_PlayerShipPassengerMarker.GetRef() ; #DEBUG_LINE_NO:117
  Actor SamREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:118
  Actor CoraREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:131
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:134
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(SamCoeREF) ; #DEBUG_LINE_NO:136
  PassengersRefColl.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:137
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:138
  SamCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:139
  SamCoeREF.MoveTo(MQ103_SamOutsideAkilaMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0202_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:148
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:149
  kmyQuest.ShowHelpMessage("FollowerWarn") ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0203_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0205_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:176
  (SQ_Companions as sq_companionsscript).SetRoleActive(SamREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:178
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, True, MQ103SamLockInMSG, COM_MQ103_TxtReplace_QuestName_SamCoe) ; #DEBUG_LINE_NO:179
  SamREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:181
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:183
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:184
  If FC01.GetStageDone(2000) ; #DEBUG_LINE_NO:187
    Self.SetStage(225) ; #DEBUG_LINE_NO:188
  ElseIf FC01.GetStageDone(110) ; #DEBUG_LINE_NO:190
    Self.SetStage(220) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0220_Item_00()
  MQ103_04a_GalBankLockedScene.Start() ; #DEBUG_LINE_NO:200
  Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:202
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0220_Item_01()
  Alias_SetStage300Trigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(240) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:228
  Self.SetObjectiveDisplayed(40, True, True) ; #DEBUG_LINE_NO:229
  MQ103_04b_GalBankOpenScene.Start() ; #DEBUG_LINE_NO:231
  Self.SetStage(240) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0240_Item_00()
  Alias_GalBankVaultDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:241
  Alias_SetStage300Trigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ103_04_GalBankVaultScene.Start() ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:260
  Game.GetPlayer().additem(MQ103CoeVaultKey as Form, 1, False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:270
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:271
  MQ103_04_GalBankVaultScene.Stop() ; #DEBUG_LINE_NO:273
  CoeEstateFirstFloorDoorREF.Lock(False, False, True) ; #DEBUG_LINE_NO:276
  CoeEstateBalconyDoorREF.Lock(False, False, True) ; #DEBUG_LINE_NO:277
  CoeEstateFrontDoorREF.Lock(False, False, True) ; #DEBUG_LINE_NO:278
  CoeEstateFirstFloorDoorTwo.Lock(False, False, True) ; #DEBUG_LINE_NO:279
  Game.GetPlayer().AddToFaction(CoeEstateDoorFaction) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:289
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:290
  Alias_SolomonMaps.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:293
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_SamCoe.GetRef().RemoveKeyword(TeammateReadyWeapon_DO) ; #DEBUG_LINE_NO:306
  MQ103_06_CoeEstateIntroScene.Start() ; #DEBUG_LINE_NO:308
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef() ; #DEBUG_LINE_NO:310
  OfficeDoorREF.SetOpen(False) ; #DEBUG_LINE_NO:311
  OfficeDoorREF.Lock(True, False, True) ; #DEBUG_LINE_NO:312
  OfficeDoorREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:313
  Self.SetStage(330) ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:331
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:332
  Alias_SamCoe.GetRef().AddKeyword(TeammateReadyWeapon_DO) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:344
  Self.SetObjectiveDisplayedAtTop(80) ; #DEBUG_LINE_NO:345
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:346
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:347
  Self.SetObjectiveDisplayed(95, True, False) ; #DEBUG_LINE_NO:348
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:351
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF) ; #DEBUG_LINE_NO:352
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:353
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:354
  CoraCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:355
  CoraCoeREF.MoveTo(MQ103_CoraSpaceportReadingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:356
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveFailed(85, True) ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_SolomonMaps.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:372
  Game.GetPlayer().additem(MQ103JacobOfficeKey as Form, 1, False) ; #DEBUG_LINE_NO:374
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:376
  Self.SetObjectiveDisplayed(80, True, True) ; #DEBUG_LINE_NO:378
  Self.SetObjectiveDisplayed(90, False, False) ; #DEBUG_LINE_NO:380
  Self.SetObjectiveDisplayed(95, False, False) ; #DEBUG_LINE_NO:381
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:383
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef() ; #DEBUG_LINE_NO:385
  OfficeDoorREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:386
EndFunction

Function Fragment_Stage_0470_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:394
  Self.SetObjectiveDisplayed(80, True, True) ; #DEBUG_LINE_NO:396
  Self.SetObjectiveDisplayed(85, False, False) ; #DEBUG_LINE_NO:398
  Self.SetObjectiveDisplayed(95, False, False) ; #DEBUG_LINE_NO:399
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef() ; #DEBUG_LINE_NO:401
  OfficeDoorREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:402
EndFunction

Function Fragment_Stage_0500_Item_00()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:411
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF) ; #DEBUG_LINE_NO:412
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:413
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:414
  CoraCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:415
  Self.SetObjectiveCompleted(95, True) ; #DEBUG_LINE_NO:417
EndFunction

Function Fragment_Stage_0510_Item_00()
  MQ103_12b_CoraJacobScene.Start() ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:433
  Alias_CoraCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:435
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:443
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:444
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:445
  Self.SetObjectiveDisplayed(85, False, False) ; #DEBUG_LINE_NO:446
  Self.SetObjectiveDisplayed(90, False, False) ; #DEBUG_LINE_NO:447
  Self.SetObjectiveDisplayed(95, False, False) ; #DEBUG_LINE_NO:448
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:450
  If MQ103_11a_JacobSamArgueScene.IsPlaying() ; #DEBUG_LINE_NO:453
    MQ103_11a_JacobSamArgueScene.Stop() ; #DEBUG_LINE_NO:454
    MQ103_11b_JacobSamEndScene.Start() ; #DEBUG_LINE_NO:455
  EndIf ; #DEBUG_LINE_NO:
  Alias_JacobCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:458
  ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef() ; #DEBUG_LINE_NO:460
  OfficeDoorREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:461
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:469
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:470
  Alias_LockeGangMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:472
  Alias_LockeGangMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:473
  LC006_LoadDoor_Ext.Lock(False, False, True) ; #DEBUG_LINE_NO:476
  LC006_CaveBlocker_EnableMarker.Disable(False) ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_0700_Item_00()
  MQ103_15_LockeGangSamScene.Start() ; #DEBUG_LINE_NO:487
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:489
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:490
EndFunction

Function Fragment_Stage_0710_Item_00()
  MQ103_16a_LockeGangEavesdrop.Start() ; #DEBUG_LINE_NO:498
EndFunction

Function Fragment_Stage_0720_Item_00()
  MQ103_16b_LockeGangEavesdrop.Start() ; #DEBUG_LINE_NO:506
EndFunction

Function Fragment_Stage_0800_Item_00()
  MQ103_17_ArtifactScene.Start() ; #DEBUG_LINE_NO:514
EndFunction

Function Fragment_Stage_0830_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:522
  mq103script kmyQuest = __temp as mq103script ; #DEBUG_LINE_NO:523
  Alias_ArtifactActivator.GetRef().Disable(False) ; #DEBUG_LINE_NO:527
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(4, MQ103ArtifactSpawnMarker) ; #DEBUG_LINE_NO:530
  Alias_MQ103ArtifactQuestObject.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:531
  ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:532
  Game.GetPlayer().additem(ArtifactREF as Form, 1, False) ; #DEBUG_LINE_NO:533
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(4) ; #DEBUG_LINE_NO:536
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:539
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(CoraCoeREF) ; #DEBUG_LINE_NO:540
  kmyQuest.MQ103EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:543
  kmyQuest.MQ103EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:544
  ArmillaryMountSwapEnableMarker.Disable(False) ; #DEBUG_LINE_NO:547
  Self.SetStage(900) ; #DEBUG_LINE_NO:549
EndFunction

Function Fragment_Stage_0900_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:557
  PlayerREF.AddToFaction(MQ103LockeGangFaction) ; #DEBUG_LINE_NO:560
  Alias_LockeGangInteriorNPCs.KillAll(None) ; #DEBUG_LINE_NO:563
  PlayerREF.StopCombatAlarm() ; #DEBUG_LINE_NO:564
  MQ103LockeEnableMarkerREF.Enable(False) ; #DEBUG_LINE_NO:567
  MQ103LockeGangExteriorEnableMarker.Disable(False) ; #DEBUG_LINE_NO:568
  MQ103_18_AftermathScene.Start() ; #DEBUG_LINE_NO:570
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:572
  Self.SetObjectiveDisplayed(125, True, False) ; #DEBUG_LINE_NO:573
EndFunction

Function Fragment_Stage_0910_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:581
  mq103script kmyQuest = __temp as mq103script ; #DEBUG_LINE_NO:582
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:586
  MQ103_19_AmbushScene.Start() ; #DEBUG_LINE_NO:587
  Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:589
  If !Self.GetStageDone(985) ; #DEBUG_LINE_NO:591
    Self.SetObjectiveDisplayed(127, True, False) ; #DEBUG_LINE_NO:592
    Self.SetObjectiveDisplayedAtTop(127) ; #DEBUG_LINE_NO:593
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.MQ103EnableLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:597
  kmyQuest.MQ103EnableLayer = None ; #DEBUG_LINE_NO:598
EndFunction

Function Fragment_Stage_0920_Item_00()
  Actor LockeREF = Alias_Locke.GetActorRef() ; #DEBUG_LINE_NO:606
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:607
  PlayerREF.RemoveFromFaction(MQ103LockeGangFaction) ; #DEBUG_LINE_NO:610
  LockeREF.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:612
  LockeREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:613
  Alias_LockeBodyguard.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:615
  Alias_LockeBodyguard.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:616
  If !Self.GetStageDone(950) ; #DEBUG_LINE_NO:622
    Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:623
    If !Self.GetStageDone(985) ; #DEBUG_LINE_NO:625
      Self.SetObjectiveDisplayed(127, True, False) ; #DEBUG_LINE_NO:626
      Self.SetObjectiveDisplayedAtTop(127) ; #DEBUG_LINE_NO:627
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStageNoWait(925) ; #DEBUG_LINE_NO:630
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(129, False, False) ; #DEBUG_LINE_NO:633
EndFunction

Function Fragment_Stage_0925_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:641
  MQ103AshtaEnableMarker.Enable(False) ; #DEBUG_LINE_NO:644
  Alias_AshtaALL.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:645
  MQ103_19b_AshtaScene.Start() ; #DEBUG_LINE_NO:647
  Self.SetStage(955) ; #DEBUG_LINE_NO:649
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(985) ; #DEBUG_LINE_NO:657
  MQ103AshtaEnableMarker.Enable(False) ; #DEBUG_LINE_NO:660
  Alias_AshtaALL.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:661
  MQ103_19b_AshtaScene.Start() ; #DEBUG_LINE_NO:663
EndFunction

Function Fragment_Stage_0955_Item_00()
  Self.SetObjectiveDisplayed(128, True, False) ; #DEBUG_LINE_NO:671
  Alias_Locke.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:673
  Alias_LockeBodyguard.EvaluateAll() ; #DEBUG_LINE_NO:674
EndFunction

Function Fragment_Stage_0956_Item_00()
  Self.SetObjectiveCompleted(128, True) ; #DEBUG_LINE_NO:682
  If Self.GetStageDone(950) && !Self.GetStageDone(960) ; #DEBUG_LINE_NO:684
    Self.SetObjectiveDisplayed(129, True, False) ; #DEBUG_LINE_NO:685
  EndIf ; #DEBUG_LINE_NO:
  Alias_LockeBodyguard.EvaluateAll() ; #DEBUG_LINE_NO:688
  Alias_Locke.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:689
  Alias_LockeAshtaScreammer.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:690
EndFunction

Function Fragment_Stage_0957_Item_00()
  Self.SetObjectiveCompleted(129, True) ; #DEBUG_LINE_NO:698
  Game.GetPlayer().additem(LL_Weapon_Razorback_Upgraded as Form, 1, False) ; #DEBUG_LINE_NO:699
EndFunction

Function Fragment_Stage_0960_Item_00()
  Self.SetStage(985) ; #DEBUG_LINE_NO:707
  Self.SetObjectiveDisplayed(129, False, False) ; #DEBUG_LINE_NO:708
EndFunction

Function Fragment_Stage_0985_Item_00()
  Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:716
  Self.SetObjectiveCompleted(127, True) ; #DEBUG_LINE_NO:717
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:718
EndFunction

Function Fragment_Stage_0987_Item_00()
  MQ103_20_SmugglerAfterScene.Start() ; #DEBUG_LINE_NO:726
EndFunction

Function Fragment_Stage_0990_Item_00()
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:735
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(CoraCoeREF) ; #DEBUG_LINE_NO:737
  DisembarkingCrew.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:738
  PassengersRefColl.RemoveRef(CoraCoeREF as ObjectReference) ; #DEBUG_LINE_NO:739
  CoraCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:740
  Actor SamREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:743
  (SQ_Companions as sq_companionsscript).SetRoleInActive(SamREF, False, False, True) ; #DEBUG_LINE_NO:744
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInMidquestOverMSG, None) ; #DEBUG_LINE_NO:745
  DisembarkingCrew.RemoveRef(SamREF as ObjectReference) ; #DEBUG_LINE_NO:746
  PassengersRefColl.RemoveRef(SamREF as ObjectReference) ; #DEBUG_LINE_NO:747
  Int iFailSafe = 0 ; #DEBUG_LINE_NO:749
  While iFailSafe < 15 && (SQ_PlayerShip as sq_playershipscript).DisembarkingCrew.Find(SamREF as ObjectReference) < 0 && (SQ_PlayerShip as sq_playershipscript).DismissedCrew.Find(SamREF as ObjectReference) < 0 ; #DEBUG_LINE_NO:750
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:751
    iFailSafe += 1 ; #DEBUG_LINE_NO:752
  EndWhile ; #DEBUG_LINE_NO:
  (SQ_PlayerShip as sq_playershipscript).DisembarkingCrew.RemoveRef(SamREF as ObjectReference) ; #DEBUG_LINE_NO:755
  (SQ_PlayerShip as sq_playershipscript).DismissedCrew.RemoveRef(SamREF as ObjectReference) ; #DEBUG_LINE_NO:756
  SamREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:757
EndFunction

Function Fragment_Stage_0995_Item_00()
  MQ103_21a_LodgeMoveScene.Start() ; #DEBUG_LINE_NO:765
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ArtifactCollection.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:773
  MQ103_21a_LodgeMoveScene.Stop() ; #DEBUG_LINE_NO:774
  MQ103_21_LodgeScene.Start() ; #DEBUG_LINE_NO:775
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:777
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:778
EndFunction

Function Fragment_Stage_1100_Item_00()
  MQ103_21_LodgeScene.Stop() ; #DEBUG_LINE_NO:786
  MQ103_22_EndScene.Start() ; #DEBUG_LINE_NO:787
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:789
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:790
EndFunction

Function Fragment_Stage_1110_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:798
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:799
EndFunction

Function Fragment_Stage_1120_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:807
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInOverMSG, None) ; #DEBUG_LINE_NO:808
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SamREF, True) ; #DEBUG_LINE_NO:809
  (SQ_Companions as sq_companionsscript).SetRoleActive(SamREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:810
  (SamREF as companionactorscript).AllowStoryGatesAndRestartTimer() ; #DEBUG_LINE_NO:811
  SamREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:812
  Self.SetStage(2000) ; #DEBUG_LINE_NO:814
EndFunction

Function Fragment_Stage_1130_Item_00()
  Actor SamREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:822
  (SQ_Companions as sq_companionsscript).LockInCompanion(SamREF as companionactorscript, False, MQ103SamLockInOverMSG, None) ; #DEBUG_LINE_NO:823
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(SamREF, True) ; #DEBUG_LINE_NO:824
  (SamREF as companionactorscript).AllowStoryGatesAndRestartTimer() ; #DEBUG_LINE_NO:825
  Self.SetStage(2000) ; #DEBUG_LINE_NO:827
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:835
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:837
  If MQ104A.GetStageDone(1000) && MQ104B.GetStageDone(1000) ; #DEBUG_LINE_NO:840
    MQ105.SetStage(10) ; #DEBUG_LINE_NO:841
  EndIf ; #DEBUG_LINE_NO:
  MQ103LockeGangExteriorEnableMarker.Enable(False) ; #DEBUG_LINE_NO:845
  PlayerREF.RemoveFromFaction(MQ103LockeGangFaction) ; #DEBUG_LINE_NO:848
  ObjectReference SamREF = Alias_SamCoe.GetRef() ; #DEBUG_LINE_NO:852
  If !SamREF.HasKeyword(TeammateReadyWeapon_DO) ; #DEBUG_LINE_NO:853
    SamREF.AddKeyword(TeammateReadyWeapon_DO) ; #DEBUG_LINE_NO:854
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:857
EndFunction
