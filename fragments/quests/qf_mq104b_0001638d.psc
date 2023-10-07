ScriptName Fragments:Quests:QF_MQ104B_0001638D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFLodge01_001_OutsideScene Auto Const mandatory
Scene Property FFLodge01_003_LodgeScene Auto Const mandatory
ObjectReference Property MQ104BStart001 Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Heller Auto Const mandatory
Scene Property FFLodge01_002_BarrettScene Auto Const mandatory
Message Property FFLodge01LodgeMSG Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
ObjectReference Property VecteraExteriorNPCEnableMarker Auto Const mandatory
ObjectReference Property VecteraInteriorNPCEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Lin Auto Const mandatory
ReferenceAlias Property Alias_DoorToSensorArray Auto Const mandatory
ObjectReference Property MQ104B_BarrettMovetoMarker Auto Const mandatory
Message Property MQ104BVectera_MedBenchMSG02 Auto Const mandatory
ReferenceAlias Property Alias_MedBenchTrigger Auto Const mandatory
ReferenceAlias Property Alias_BotTrigger Auto Const mandatory
ReferenceAlias Property Alias_CommsComputer Auto Const mandatory
Message Property MQ104BVectera_RobotMSG02 Auto Const mandatory
Book Property MQ104BHellerBarrettSlate Auto Const mandatory
Book Property MQ104BPirateBarrettSlate Auto Const mandatory
Scene Property MQ104B_005_OutsideScene Auto Const mandatory
ReferenceAlias Property Alias_Matsura Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property MQ104B_015_LodgeScene Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B_LinHeller_BaseDialogue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_MatsuraBodyguards Auto Const mandatory
ReferenceAlias Property Alias_HellerWoundedMarker Auto Const mandatory
ObjectReference Property MQ104B_BarrettDungeonStart Auto Const mandatory
ReferenceAlias Property Alias_HellerCrashStartMarker Auto Const mandatory
ReferenceAlias Property Alias_BarrettDungeonDoor Auto Const mandatory
ObjectReference Property MQ104B_EnableExteriorPiratesMarker Auto Const mandatory
Perk Property OutpostEngineering Auto Const mandatory
Perk Property InformationSystems Auto Const mandatory
Perk Property TraitEmpath Auto Const mandatory
ReferenceAlias Property Alias_BrokenComputerTrigger Auto Const mandatory
ReferenceAlias Property Alias_FirstBarrettSlateQuestObject Auto Const mandatory
MiscObject Property Mfg_Power_Circuit Auto Const mandatory
Scene Property MQ104B_001_LinScene Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
Scene Property MQ104B_014_LodgeScene Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property MQ104B_Lodge_MarkerBarrett01 Auto Const mandatory
ObjectReference Property MQ104BLinTravelMarker Auto Const mandatory
ObjectReference Property VecteraExteriorNPCEnableMarker001 Auto Const mandatory
Scene Property MQ104B_006_BarrettScene Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Perk Property Medicine Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Scene Property MQ104B_006d_MatsuraDeadScene Auto Const mandatory
ReferenceAlias Property Alias_VecteraMapMarker Auto Const mandatory
Quest Property LinEliteCrewQuest Auto Const
Quest Property HellerEliteCrewQuest Auto Const
ReferenceAlias Property Alias_SecondBarrettSlateQuestObject Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
wwiseevent Property OBJ_MQ104B_Computer_Repair Auto Const mandatory
wwiseevent Property OBJ_MQ104B_Power_Circuit Auto Const mandatory
ObjectReference Property MQ104B_BarrettCell_EnableMaker Auto Const mandatory
MiscObject Property Power_Cell Auto Const mandatory
ObjectReference Property MQ104BBarrettDungeonLandingMarker Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const mandatory
GlobalVariable Property COM_PQ_LockedInCompanion Auto Const mandatory
RefCollectionAlias Property Passengers Auto Const
RefCollectionAlias Property DisembarkingCrew Auto Const
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ102.SetStage(1150) ; #DEBUG_LINE_NO:9
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().moveto(MQ104BStart001, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().additem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:12
  Game.GetPlayer().AddPerk(OutpostEngineering, False) ; #DEBUG_LINE_NO:13
  Game.GetPlayer().AddPerk(InformationSystems, False) ; #DEBUG_LINE_NO:14
  Game.GetPlayer().AddPerk(TraitEmpath, False) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().AddPerk(Medicine, False) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:17
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:20
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:21
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:22
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:23
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:24
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:25
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:26
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:28
  Alias_DoorToSensorArray.GetRef().Disable(False) ; #DEBUG_LINE_NO:29
  Self.SetStage(10) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:38
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:39
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:40
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:41
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:44
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:45
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:46
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:47
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:48
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:49
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:50
  Game.GetPlayer().moveto(Alias_HellerCrashStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  Game.GetPlayer().additem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:53
  Self.SetStage(5) ; #DEBUG_LINE_NO:54
  Self.SetStage(110) ; #DEBUG_LINE_NO:55
  Self.SetStage(115) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:64
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:65
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:66
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:67
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:70
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:71
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:72
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:73
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:74
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:75
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().moveto(MQ104B_BarrettDungeonStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:78
  Game.GetPlayer().additem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:79
  Game.GetPlayer().AddPerk(Medicine, False) ; #DEBUG_LINE_NO:80
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:81
  Frontier_ModularREF.moveto(MQ104BBarrettDungeonLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
  Frontier_ModularREF.setlinkedref(MQ104BBarrettDungeonLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:85
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:86
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:87
  Self.SetStage(5) ; #DEBUG_LINE_NO:90
  Self.SetStage(130) ; #DEBUG_LINE_NO:91
  Self.SetStage(132) ; #DEBUG_LINE_NO:92
  MQ104B_BarrettCell_EnableMaker.Disable(False) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor HellerREF = Alias_Heller.GetActorRef() ; #DEBUG_LINE_NO:102
  Alias_VecteraMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:105
  VecteraExteriorNPCEnableMarker001.Disable(False) ; #DEBUG_LINE_NO:108
  VecteraInteriorNPCEnableMarker.Disable(False) ; #DEBUG_LINE_NO:109
  HellerREF.moveto(Alias_HellerWoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:110
  HellerREF.SetGhost(True) ; #DEBUG_LINE_NO:111
  HellerREF.AddtoFaction(CaptiveFaction) ; #DEBUG_LINE_NO:112
  Alias_Barrett.GetActorRef().moveto(MQ104B_BarrettMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:113
  Alias_BarrettDungeonDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:116
  Alias_CommsComputer.GetRef().Enable(False) ; #DEBUG_LINE_NO:118
  Alias_CommsComputer.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:119
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:129
  Self.SetStage(5) ; #DEBUG_LINE_NO:132
  MQ104B_LinHeller_BaseDialogue.Start() ; #DEBUG_LINE_NO:135
  MQ104B_BarrettCell_EnableMaker.Disable(False) ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:154
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:155
  MQ104B_001_LinScene.Start() ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:165
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:166
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:167
  Alias_BrokenComputerTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:170
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:178
  PlayerREF.RemoveItem(Power_Cell as Form, 3, False, None) ; #DEBUG_LINE_NO:180
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:182
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:183
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:184
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:186
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:188
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:189
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:190
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:201
  Alias_MedBenchTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:203
  Alias_BotTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:214
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:216
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:218
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:219
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:220
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:231
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:232
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:233
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:234
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:236
  Game.GetPlayer().addaliaseditem(MQ104BHellerBarrettSlate as Form, Alias_FirstBarrettSlateQuestObject as Alias, 1, True) ; #DEBUG_LINE_NO:239
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:247
  If Self.GetStageDone(80) && Self.GetStageDone(70) ; #DEBUG_LINE_NO:249
    Self.SetStage(90) ; #DEBUG_LINE_NO:250
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  MQ104BVectera_MedBenchMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:259
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:260
  If Self.GetStageDone(60) && Self.GetStageDone(80) ; #DEBUG_LINE_NO:262
    Self.SetStage(90) ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
  Alias_MedBenchTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:266
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0080_Item_00()
  MQ104BVectera_RobotMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:277
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:278
  If Self.GetStageDone(60) && Self.GetStageDone(70) ; #DEBUG_LINE_NO:280
    Self.SetStage(90) ; #DEBUG_LINE_NO:281
  EndIf ; #DEBUG_LINE_NO:
  Alias_BotTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:284
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:287
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:295
EndFunction

Function Fragment_Stage_0095_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:303
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:305
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:306
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:307
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:309
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:311
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:312
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:313
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(30) ; #DEBUG_LINE_NO:324
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:326
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:327
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:328
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:329
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:331
  If PlayerREF.GetItemCount(MQ104BHellerBarrettSlate as Form) == 0 ; #DEBUG_LINE_NO:332
    PlayerREF.additem(MQ104BHellerBarrettSlate as Form, 1, False) ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:342
  Self.SetObjectiveDisplayed(65, True, False) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveDisplayed(67, True, False) ; #DEBUG_LINE_NO:344
  Self.SetObjectiveDisplayedAtTop(65) ; #DEBUG_LINE_NO:345
  LinEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0112_Item_00()
  Self.SetObjectiveCompleted(67, True) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:362
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(92, True) ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_0130_Item_00()
  Actor HellerREF = Alias_Heller.GetActorRef() ; #DEBUG_LINE_NO:388
  Game.GetPlayer().addaliaseditem(MQ104BPirateBarrettSlate as Form, Alias_SecondBarrettSlateQuestObject as Alias, 1, True) ; #DEBUG_LINE_NO:390
  HellerEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:392
  HellerREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:393
  HellerREF.SetGhost(False) ; #DEBUG_LINE_NO:394
  HellerREF.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:395
  Self.SetStage(100) ; #DEBUG_LINE_NO:398
  Self.SetStage(110) ; #DEBUG_LINE_NO:399
  Self.SetStage(115) ; #DEBUG_LINE_NO:400
  Self.SetStage(120) ; #DEBUG_LINE_NO:401
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:403
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:404
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:405
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:406
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:407
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:408
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:409
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:410
  Self.SetObjectiveDisplayed(92, True, False) ; #DEBUG_LINE_NO:411
  Self.SetObjectiveDisplayedAtTop(85) ; #DEBUG_LINE_NO:412
EndFunction

Function Fragment_Stage_0131_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:420
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:421
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:429
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:430
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:431
EndFunction

Function Fragment_Stage_0140_Item_00()
  MQ104B_005_OutsideScene.Start() ; #DEBUG_LINE_NO:439
EndFunction

Function Fragment_Stage_0150_Item_00()
  MQ104B_005_OutsideScene.Stop() ; #DEBUG_LINE_NO:447
  MQ104B_006_BarrettScene.Start() ; #DEBUG_LINE_NO:448
EndFunction

Function Fragment_Stage_0240_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:456
  Self.SetStage(300) ; #DEBUG_LINE_NO:458
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:466
EndFunction

Function Fragment_Stage_0260_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef() ; #DEBUG_LINE_NO:474
  MatsuraREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:475
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:476
  MatsuraREF.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:477
  Self.SetObjectiveDisplayed(105, True, False) ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:487
  Self.SetStage(300) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:496
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:497
  If Self.GetStageDone(260) == False ; #DEBUG_LINE_NO:500
    MQ104B_EnableExteriorPiratesMarker.Disable(False) ; #DEBUG_LINE_NO:501
  EndIf ; #DEBUG_LINE_NO:
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:504
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_0305_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:513
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(BarrettREF) ; #DEBUG_LINE_NO:516
  BarrettREF.moveto(Alias_PlayerShipPassengerMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:517
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:518
EndFunction

Function Fragment_Stage_0310_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:526
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(BarrettREF) ; #DEBUG_LINE_NO:529
  Passengers.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:530
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:531
  BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:533
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:535
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:543
  Self.SetObjectiveDisplayed(115, True, False) ; #DEBUG_LINE_NO:544
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:546
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(BarrettREF) ; #DEBUG_LINE_NO:549
  Passengers.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:550
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:551
  BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:553
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:554
EndFunction

Function Fragment_Stage_0400_Item_00()
  MQ104B_014_LodgeScene.Start() ; #DEBUG_LINE_NO:562
  Self.SetObjectiveCompleted(115, True) ; #DEBUG_LINE_NO:564
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:565
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:573
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:574
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:576
EndFunction

Function Fragment_Stage_0407_Item_00()
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:584
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:592
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:593
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:596
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True) ; #DEBUG_LINE_NO:597
  If COM_PQ_LockedInCompanion.GetValueInt() > -1 ; #DEBUG_LINE_NO:600
    kmyQuest.ShowHelpMessage("CompanionBlocked") ; #DEBUG_LINE_NO:601
  Else ; #DEBUG_LINE_NO:
    (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:603
    BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:604
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(1000) ; #DEBUG_LINE_NO:607
EndFunction

Function Fragment_Stage_0420_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:615
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True) ; #DEBUG_LINE_NO:616
  Self.SetStage(1000) ; #DEBUG_LINE_NO:618
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:626
  If MQ103.GetStageDone(2000) && MQ104A.GetStageDone(1000) ; #DEBUG_LINE_NO:629
    MQ105.SetStage(10) ; #DEBUG_LINE_NO:630
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:633
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef() ; #DEBUG_LINE_NO:642
  MatsuraREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:643
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:644
  Alias_Heller.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:647
EndFunction
