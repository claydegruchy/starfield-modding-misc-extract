ScriptName Fragments:Quests:QF_MQ202_00017CE7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CaptainPetrov Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
Scene Property MQ202_002_ScowScene Auto Const mandatory
Scene Property MQ202_003a_TaoXun_HostileScene Auto Const mandatory
Scene Property MQ202_004_PetrovScene Auto Const mandatory
Scene Property MQ202_006_PetrovEscortScene Auto Const mandatory
ReferenceAlias Property Alias_TaoXun Auto Const mandatory
ReferenceAlias Property Alias_VaultDoor Auto Const mandatory
ReferenceAlias Property Alias_AlarmSoundMarker Auto Const mandatory
Faction Property MQ202PetrovFaction Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ObjectReference Property MQ106_BarrettMarker01 Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
ReferenceAlias Property Alias_PetrovShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Faction Property MQ202PetrovBoardingFaction Auto Const mandatory
Scene Property MQ202_003b_TaoXun_PeacefulScene Auto Const mandatory
ReferenceAlias Property Alias_MQ202Artifact Auto Const mandatory
ReferenceAlias Property MQ00_MQ202ArtifactHolder Auto Const
Faction Property MQ202PetrovEnemyFaction Auto Const mandatory
ObjectReference Property MQ202ScowStart Auto Const mandatory
Key Property MQ202VaultKey Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_ArtifactHolder Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Faction Property MQ202PetrovGuardsFriendsFaction Auto Const mandatory
ReferenceAlias Property Alias_LockVaultActivator Auto Const mandatory
Scene Property MQ202_008_Petrov_BleedoutScene Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Message Property MQ202BountyMSG Auto Const mandatory
Key Property LC012Scow_ZooPassword Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_Bull Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_ErinSeptember Auto Const mandatory
ReferenceAlias Property Alias_BountyHunter_Raptor Auto Const mandatory
LocationAlias Property Alias_ScowShipLocation Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_ZooCreatures Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Message Property MQ202CompanionLockInMSG Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory
ObjectReference Property MQ201B_Eye_EnableMarker Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const mandatory
ObjectReference Property ScowMapMarkerREF Auto Const mandatory
Quest Property SQ_Crew Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
Perk Property MQ202ScowReduceDamage Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Activator Property COM_MQ202_TxtReplace_QuestName_Any Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:10
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:13
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:14
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:15
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:16
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:17
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:18
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:19
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7) ; #DEBUG_LINE_NO:20
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8) ; #DEBUG_LINE_NO:21
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9) ; #DEBUG_LINE_NO:22
  Game.GetPlayer().moveto(MQ104AStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:27
  Self.SetStage(10) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:37
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:38
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:39
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:40
  MQ102.Stop() ; #DEBUG_LINE_NO:41
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:44
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:45
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:46
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:47
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:48
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:49
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:50
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7) ; #DEBUG_LINE_NO:51
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8) ; #DEBUG_LINE_NO:52
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9) ; #DEBUG_LINE_NO:53
  Self.SetStage(10) ; #DEBUG_LINE_NO:55
  Self.SetStage(20) ; #DEBUG_LINE_NO:56
  Self.SetStage(30) ; #DEBUG_LINE_NO:57
  Self.SetStage(50) ; #DEBUG_LINE_NO:58
  Game.GetPlayer().moveto(MQ202ScowStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:68
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:69
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:70
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:71
  MQ102.Stop() ; #DEBUG_LINE_NO:72
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:75
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:76
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:77
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:78
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:79
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:80
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:81
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7) ; #DEBUG_LINE_NO:82
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(8) ; #DEBUG_LINE_NO:83
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(9) ; #DEBUG_LINE_NO:84
  Self.SetStage(10) ; #DEBUG_LINE_NO:86
  Self.SetStage(20) ; #DEBUG_LINE_NO:87
  Self.SetStage(30) ; #DEBUG_LINE_NO:88
  Self.SetStage(60) ; #DEBUG_LINE_NO:89
  Game.GetPlayer().moveto(MQ202ScowStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0005_Item_00()
  ScowMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:101
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipRef() ; #DEBUG_LINE_NO:103
  PetrovShipREF.Enable(False) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:112
  ObjectReference PlacementREF = Alias_MQ202Artifact.GetRef() ; #DEBUG_LINE_NO:115
  ObjectReference AttachREF = Alias_ArtifactHolder.GetRef() ; #DEBUG_LINE_NO:116
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifactAndAttach(10, PlacementREF, AttachREF) ; #DEBUG_LINE_NO:117
  Alias_MQ202Artifact.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:118
  ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:119
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:121
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:122
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:123
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:124
  Actor VascoREF = Alias_Vasco.GetActorRef() ; #DEBUG_LINE_NO:125
  (SQ_Companions as sq_companionsscript).SetRoleInactive(AndrejaREF, False, True, False) ; #DEBUG_LINE_NO:128
  (SQ_Companions as sq_companionsscript).SetRoleInactive(BarrettREF, False, True, False) ; #DEBUG_LINE_NO:129
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SamCoeREF, False, True, False) ; #DEBUG_LINE_NO:130
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SarahMorganREF, False, True, False) ; #DEBUG_LINE_NO:131
  (SQ_Crew as sq_crewscript).SetRoleInactive(AndrejaREF, False, True, False) ; #DEBUG_LINE_NO:133
  (SQ_Crew as sq_crewscript).SetRoleInactive(BarrettREF, False, True, False) ; #DEBUG_LINE_NO:134
  (SQ_Crew as sq_crewscript).SetRoleInactive(SamCoeREF, False, True, False) ; #DEBUG_LINE_NO:135
  (SQ_Crew as sq_crewscript).SetRoleInactive(SarahMorganREF, False, True, False) ; #DEBUG_LINE_NO:136
  (SQ_Crew as sq_crewscript).SetRoleInactive(VascoREF, False, True, False) ; #DEBUG_LINE_NO:137
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:139
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:140
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:141
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:142
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:143
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:144
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:145
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:146
  If MQ00_CompanionAtLodge.GetActorRef() == None ; #DEBUG_LINE_NO:149
    MQ00_CompanionAtLodge.ForceRefTo(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  If MQ00_CompanionAtEye.GetActorRef() == None ; #DEBUG_LINE_NO:153
    MQ00_CompanionAtEye.ForceRefTo(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
  Self.SetActive(True) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:165
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:166
  kmyQuest.ShowHelpMessage("FollowerWarnAndreja") ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0012_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:177
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:178
  kmyQuest.ShowHelpMessage("FollowerWarnBarrett") ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0012_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:189
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:190
  kmyQuest.ShowHelpMessage("FollowerWarnSam") ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0012_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:201
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:202
  kmyQuest.ShowHelpMessage("FollowerWarnSarah") ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0013_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_0015_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0018_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:229
  Self.SetStage(15) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0020_Item_00()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:239
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:241
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:242
  Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef() ; #DEBUG_LINE_NO:245
  (SQ_Companions as sq_companionsscript).SetRoleActive(CompanionAtLodgeREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:246
  (SQ_Companions as sq_companionsscript).LockInCompanion(CompanionAtLodgeREF as companionactorscript, True, MQ202CompanionLockInMSG, COM_MQ202_TxtReplace_QuestName_Any) ; #DEBUG_LINE_NO:247
  CompanionAtLodgeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:256
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:257
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:258
  Self.SetObjectiveDisplayed(32, True, False) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(34, True, False) ; #DEBUG_LINE_NO:260
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipRef() ; #DEBUG_LINE_NO:262
  PetrovShipREF.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:263
  PetrovShipREF.EnablePartRepair(ShipSystemEngineHealth, False) ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_0033_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(32, True) ; #DEBUG_LINE_NO:280
  Self.SetObjectiveDisplayed(34, False, False) ; #DEBUG_LINE_NO:281
  Self.SetObjectiveDisplayed(30, True, True) ; #DEBUG_LINE_NO:282
  Game.GetPlayer().addtoFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:284
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveDisplayed(32, False, False) ; #DEBUG_LINE_NO:292
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:294
  PetrovShipREF.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:296
  PetrovShipREF.StartCombat(Alias_playerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:297
  PetrovShipREF.EnablePartRepair(SpaceshipEngineHealth, False) ; #DEBUG_LINE_NO:300
  Game.GetPlayer().RemoveFromFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:303
  Self.SetStage(70) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:313
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:314
  Self.SetObjectiveDisplayed(32, False, False) ; #DEBUG_LINE_NO:315
  Self.SetObjectiveDisplayed(34, False, False) ; #DEBUG_LINE_NO:316
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:317
  Self.SetObjectiveDisplayedAtTop(40) ; #DEBUG_LINE_NO:318
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ202_003a_TaoXun_HostileScene.Start() ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0130_Item_00()
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:335
  PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:337
  PetrovShipREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:338
  PetrovShipREF.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:339
EndFunction

Function Fragment_Stage_0140_Item_00()
  Actor TaoXunREF = Alias_TaoXun.GetActorRef() ; #DEBUG_LINE_NO:347
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:348
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:350
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:351
  PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:352
  TaoXunREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:353
  Self.SetStage(70) ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_0190_Item_00()
  MQ202_003b_TaoXun_PeacefulScene.Start() ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveDisplayed(32, False, False) ; #DEBUG_LINE_NO:372
  Self.SetObjectiveDisplayed(34, False, False) ; #DEBUG_LINE_NO:373
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:374
  Self.SetObjectiveDisplayedAtTop(40) ; #DEBUG_LINE_NO:375
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ202_004_PetrovScene.Start() ; #DEBUG_LINE_NO:383
EndFunction

Function Fragment_Stage_0213_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:391
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:393
EndFunction

Function Fragment_Stage_0214_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:401
  Game.GetPlayer().additem(LC012Scow_ZooPassword as Form, 1, False) ; #DEBUG_LINE_NO:402
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:404
EndFunction

Function Fragment_Stage_0215_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:412
  Actor BullREF = Alias_BountyHunter_Bull.GetActorRef() ; #DEBUG_LINE_NO:415
  Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef() ; #DEBUG_LINE_NO:416
  Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef() ; #DEBUG_LINE_NO:417
  BullREF.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:419
  BullREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:420
  ErinSeptemberREF.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:421
  ErinSeptemberREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:422
  RaptorREF.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:423
  RaptorREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0217_Item_00()
  Actor BullREF = Alias_BountyHunter_Bull.GetActorRef() ; #DEBUG_LINE_NO:432
  Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef() ; #DEBUG_LINE_NO:433
  Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef() ; #DEBUG_LINE_NO:434
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:435
  BullREF.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:437
  BullREF.addtoFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:438
  ErinSeptemberREF.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:439
  ErinSeptemberREF.addtoFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:440
  RaptorREF.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:441
  RaptorREF.addtoFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:442
  BullREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:444
  ErinSeptemberREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:445
  RaptorREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:446
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:454
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:455
  Self.SetObjectiveDisplayedAtTop(50) ; #DEBUG_LINE_NO:456
  Self.SetObjectiveDisplayed(52, True, False) ; #DEBUG_LINE_NO:457
  Self.SetObjectiveDisplayed(54, True, False) ; #DEBUG_LINE_NO:458
  Self.SetObjectiveDisplayed(56, True, False) ; #DEBUG_LINE_NO:459
EndFunction

Function Fragment_Stage_0236_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:467
  Self.SetObjectiveCompleted(52, True) ; #DEBUG_LINE_NO:468
  Self.SetObjectiveDisplayed(54, False, False) ; #DEBUG_LINE_NO:469
  Self.SetObjectiveDisplayed(56, False, False) ; #DEBUG_LINE_NO:470
  Self.SetObjectiveDisplayed(50, True, True) ; #DEBUG_LINE_NO:472
EndFunction

Function Fragment_Stage_0240_Item_00()
  MQ202_006_PetrovEscortScene.Start() ; #DEBUG_LINE_NO:480
  Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:483
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:485
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:486
  Self.SetObjectiveDisplayed(52, False, False) ; #DEBUG_LINE_NO:487
  Self.SetObjectiveDisplayed(54, False, False) ; #DEBUG_LINE_NO:488
  Self.SetObjectiveDisplayed(56, False, False) ; #DEBUG_LINE_NO:489
  Self.SetObjectiveDisplayed(57, True, False) ; #DEBUG_LINE_NO:490
EndFunction

Function Fragment_Stage_0242_Item_00()
  Alias_ArtifactHolder.GetRef().Activate(Alias_CaptainPetrov.GetActorRef() as ObjectReference, False) ; #DEBUG_LINE_NO:498
EndFunction

Function Fragment_Stage_0245_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:506
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:507
  Self.SetObjectiveDisplayed(52, False, False) ; #DEBUG_LINE_NO:508
  Self.SetObjectiveDisplayed(54, False, False) ; #DEBUG_LINE_NO:509
  Self.SetObjectiveDisplayed(56, False, False) ; #DEBUG_LINE_NO:510
  Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:511
  Self.SetObjectiveDisplayed(210, False, False) ; #DEBUG_LINE_NO:512
  Self.SetObjectiveDisplayed(220, False, False) ; #DEBUG_LINE_NO:513
  Self.SetObjectiveDisplayed(230, False, False) ; #DEBUG_LINE_NO:514
  Self.SetObjectiveDisplayed(250, False, False) ; #DEBUG_LINE_NO:515
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:524
  mq202_questscript kmyQuest = __temp as mq202_questscript ; #DEBUG_LINE_NO:525
  kmyQuest.CheckPetrov() ; #DEBUG_LINE_NO:528
EndFunction

Function Fragment_Stage_0250_Item_01()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:536
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:537
  Self.SetObjectiveDisplayedAtTop(50) ; #DEBUG_LINE_NO:538
  Self.SetObjectiveDisplayed(52, False, False) ; #DEBUG_LINE_NO:539
  Self.SetObjectiveDisplayed(54, True, False) ; #DEBUG_LINE_NO:540
  Self.SetObjectiveDisplayed(56, True, False) ; #DEBUG_LINE_NO:541
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_VaultDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:549
  Self.SetStage(290) ; #DEBUG_LINE_NO:550
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(57, True) ; #DEBUG_LINE_NO:558
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:559
  Self.SetStage(260) ; #DEBUG_LINE_NO:561
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().additem(Alias_MQ202Artifact.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:569
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:577
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:578
  Self.SetObjectiveCompleted(52, True) ; #DEBUG_LINE_NO:579
  Self.SetObjectiveCompleted(54, True) ; #DEBUG_LINE_NO:580
  Self.SetObjectiveCompleted(56, True) ; #DEBUG_LINE_NO:581
  Self.SetObjectiveCompleted(57, True) ; #DEBUG_LINE_NO:582
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:583
EndFunction

Function Fragment_Stage_0310_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:591
  Alias_ArtifactCollection.GetRef().Enable(False) ; #DEBUG_LINE_NO:592
  MQ202_006_PetrovEscortScene.Stop() ; #DEBUG_LINE_NO:594
  If Self.GetStageDone(410) == False ; #DEBUG_LINE_NO:597
    Alias_AlarmSoundMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:598
    PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:599
    PlayerREF.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:600
    Alias_CaptainPetrov.GetActorRef().StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:601
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(10) ; #DEBUG_LINE_NO:606
  CrimeFactionUC.ModCrimeGold(500, False) ; #DEBUG_LINE_NO:609
  MQ202BountyMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:610
  ArmillaryMountSwapEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:613
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:615
  Self.SetObjectiveCompleted(52, True) ; #DEBUG_LINE_NO:616
  Self.SetObjectiveCompleted(54, True) ; #DEBUG_LINE_NO:617
  Self.SetObjectiveCompleted(56, True) ; #DEBUG_LINE_NO:618
  Self.SetObjectiveCompleted(57, True) ; #DEBUG_LINE_NO:619
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:620
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:621
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:629
  mq202_questscript kmyQuest = __temp as mq202_questscript ; #DEBUG_LINE_NO:630
  kmyQuest.CheckPetrov() ; #DEBUG_LINE_NO:633
EndFunction

Function Fragment_Stage_0410_Item_00()
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:641
  Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:644
  PetrovREF.RestoreValue(Health, 9999.0) ; #DEBUG_LINE_NO:647
  PetrovREF.SetEssential(False) ; #DEBUG_LINE_NO:648
  PetrovREF.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:649
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:652
  PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:654
  PetrovShipREF.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:655
  PetrovShipREF.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:656
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetStage(410) ; #DEBUG_LINE_NO:664
  Self.SetStage(290) ; #DEBUG_LINE_NO:665
  Alias_VaultDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:667
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:669
  If PlayerREF.GetItemCount(MQ202VaultKey as Form) == 0 && Self.GetStageDone(310) == False ; #DEBUG_LINE_NO:670
    PlayerREF.additem(MQ202VaultKey as Form, 1, False) ; #DEBUG_LINE_NO:671
  EndIf ; #DEBUG_LINE_NO:
  Alias_CaptainPetrov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:674
EndFunction

Function Fragment_Stage_0420_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:682
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:683
  Self.SetStage(410) ; #DEBUG_LINE_NO:685
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:688
  PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction) ; #DEBUG_LINE_NO:689
  PlayerREF.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:690
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:692
  PetrovREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:693
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:701
  Self.SetObjectiveDisplayed(250, False, False) ; #DEBUG_LINE_NO:702
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:703
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:706
  PetrovShipREF.SetEssential(False) ; #DEBUG_LINE_NO:707
  Alias_AlarmSoundMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:710
  MQ204.Start() ; #DEBUG_LINE_NO:713
EndFunction

Function Fragment_Stage_0510_Item_00()
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:721
  PetrovShipREF.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:722
  PetrovShipREF.SetEssential(False) ; #DEBUG_LINE_NO:723
  PetrovShipREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:724
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:726
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction) ; #DEBUG_LINE_NO:727
  PlayerREF.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:728
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:729
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:731
  PetrovREF.SetEssential(False) ; #DEBUG_LINE_NO:732
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:740
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:741
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:749
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:750
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:751
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:759
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:760
  Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:761
  Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:762
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:770
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:771
  Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:772
  Self.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:773
  Self.SetStage(245) ; #DEBUG_LINE_NO:774
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:782
  Alias_ZooCreatures.RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:784
  Alias_ZooCreatures.addtoFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:785
  Alias_ZooCreatures.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:786
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:794
  MQ204.SetStage(60) ; #DEBUG_LINE_NO:795
  RAD02.SetStage(200) ; #DEBUG_LINE_NO:798
  Self.Stop() ; #DEBUG_LINE_NO:800
EndFunction

Function Fragment_Stage_2000_Item_00()
  MQ00_MQ202ArtifactHolder.ForceRefTo(Alias_MQ202Artifact.GetRef()) ; #DEBUG_LINE_NO:809
  spaceshipreference PetrovShipREF = Alias_PetrovShip.GetShipReference() ; #DEBUG_LINE_NO:812
  PetrovShipREF.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:813
  PetrovShipREF.SetEssential(False) ; #DEBUG_LINE_NO:814
  PetrovShipREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:815
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:817
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:818
  Actor PetrovREF = Alias_CaptainPetrov.GetActorRef() ; #DEBUG_LINE_NO:820
  PetrovREF.SetEssential(False) ; #DEBUG_LINE_NO:821
  MQ201BSparksEnableMarker_Andreja.DisableNoWait(False) ; #DEBUG_LINE_NO:824
  MQ201BSparksEnableMarker_Barrett.DisableNoWait(False) ; #DEBUG_LINE_NO:825
  MQ201BSparksEnableMarker_Sam.DisableNoWait(False) ; #DEBUG_LINE_NO:826
  MQ201BSparksEnableMarker_Sarah.DisableNoWait(False) ; #DEBUG_LINE_NO:827
  MQ201B_Eye_EnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:828
EndFunction
