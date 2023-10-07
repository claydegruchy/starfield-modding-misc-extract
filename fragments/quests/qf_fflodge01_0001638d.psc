ScriptName Fragments:Quests:QF_FFLodge01_0001638D Extends Quest Const hidden

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
ObjectReference Property MQ104BHellerMoveToMarker Auto Const mandatory
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
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Alias_DoorToSensorArray.GetRef().Disable(False) ; #DEBUG_LINE_NO:19
  Self.SetStage(10) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:28
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:29
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:30
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:31
  Game.GetPlayer().moveto(Alias_HellerCrashStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().additem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:34
  Self.SetStage(5) ; #DEBUG_LINE_NO:35
  Self.SetStage(110) ; #DEBUG_LINE_NO:36
  Self.SetStage(115) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:45
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:46
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:47
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:48
  Game.GetPlayer().moveto(MQ104B_BarrettDungeonStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
  Game.GetPlayer().additem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:51
  Game.GetPlayer().AddPerk(Medicine, False) ; #DEBUG_LINE_NO:52
  Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:53
  Self.SetStage(5) ; #DEBUG_LINE_NO:54
  Self.SetStage(130) ; #DEBUG_LINE_NO:55
  Self.SetStage(132) ; #DEBUG_LINE_NO:56
  MQ104B_BarrettCell_EnableMaker.Disable(False) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_VecteraMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:67
  VecteraExteriorNPCEnableMarker001.Disable(False) ; #DEBUG_LINE_NO:70
  VecteraInteriorNPCEnableMarker.Disable(False) ; #DEBUG_LINE_NO:71
  Alias_Heller.GetActorRef().moveto(Alias_HellerWoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  Alias_Barrett.GetActorRef().moveto(MQ104B_BarrettMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:73
  Alias_BarrettDungeonDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:76
  Alias_CommsComputer.GetRef().Enable(False) ; #DEBUG_LINE_NO:78
  Alias_CommsComputer.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:79
  Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:89
  Self.SetStage(5) ; #DEBUG_LINE_NO:92
  MQ104B_LinHeller_BaseDialogue.Start() ; #DEBUG_LINE_NO:95
  MQ104B_BarrettCell_EnableMaker.Disable(False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:114
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:115
  MQ104B_001_LinScene.Start() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:125
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:127
  Alias_BrokenComputerTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:138
  PlayerREF.RemoveItem(Power_Cell as Form, 3, False, None) ; #DEBUG_LINE_NO:140
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:142
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:143
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:144
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:146
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:148
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:149
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:150
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:161
  Alias_MedBenchTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:163
  Alias_BotTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:172
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:173
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:174
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:176
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:178
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:179
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:180
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:191
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:192
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:193
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:194
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:196
  Game.GetPlayer().addaliaseditem(MQ104BHellerBarrettSlate as Form, Alias_FirstBarrettSlateQuestObject as Alias, 1, True) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:207
  If Self.GetStageDone(80) && Self.GetStageDone(70) ; #DEBUG_LINE_NO:209
    Self.SetStage(90) ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  MQ104BVectera_MedBenchMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:219
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:220
  If Self.GetStageDone(60) && Self.GetStageDone(80) ; #DEBUG_LINE_NO:222
    Self.SetStage(90) ; #DEBUG_LINE_NO:223
  EndIf ; #DEBUG_LINE_NO:
  Alias_MedBenchTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:226
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:229
EndFunction

Function Fragment_Stage_0080_Item_00()
  MQ104BVectera_RobotMSG02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:237
  Game.GetPlayer().additem(Power_Cell as Form, 1, False) ; #DEBUG_LINE_NO:238
  If Self.GetStageDone(60) && Self.GetStageDone(70) ; #DEBUG_LINE_NO:240
    Self.SetStage(90) ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
  Alias_BotTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:244
  OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:255
EndFunction

Function Fragment_Stage_0095_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:263
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:265
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:266
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:267
  ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef() ; #DEBUG_LINE_NO:269
  Alias_BrokenComputerTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:271
  CommsComputerREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:272
  CommsComputerREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:273
  OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:284
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:285
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:286
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:287
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:289
  If PlayerREF.GetItemCount(MQ104BHellerBarrettSlate as Form) == 0 ; #DEBUG_LINE_NO:290
    PlayerREF.additem(MQ104BHellerBarrettSlate as Form, 1, False) ; #DEBUG_LINE_NO:291
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:300
  Self.SetObjectiveDisplayed(65, True, False) ; #DEBUG_LINE_NO:301
  Self.SetObjectiveDisplayed(67, True, False) ; #DEBUG_LINE_NO:302
  LinEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:303
EndFunction

Function Fragment_Stage_0112_Item_00()
  Self.SetObjectiveCompleted(67, True) ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:319
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:320
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:328
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(92, True) ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0130_Item_00()
  Game.GetPlayer().addaliaseditem(MQ104BPirateBarrettSlate as Form, Alias_SecondBarrettSlateQuestObject as Alias, 1, True) ; #DEBUG_LINE_NO:345
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:347
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:348
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:349
  Self.SetObjectiveDisplayed(92, True, False) ; #DEBUG_LINE_NO:350
  HellerEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:352
  Alias_Heller.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_0131_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:361
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:362
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:370
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:371
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0140_Item_00()
  MQ104B_005_OutsideScene.Start() ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_0150_Item_00()
  MQ104B_005_OutsideScene.Stop() ; #DEBUG_LINE_NO:388
  MQ104B_006_BarrettScene.Start() ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0240_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:397
  Self.SetStage(300) ; #DEBUG_LINE_NO:399
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:407
EndFunction

Function Fragment_Stage_0260_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef() ; #DEBUG_LINE_NO:415
  MatsuraREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:416
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:417
  MatsuraREF.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:418
  Self.SetObjectiveDisplayed(105, True, False) ; #DEBUG_LINE_NO:420
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:428
  Self.SetStage(300) ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:437
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:438
  If Self.GetStageDone(260) == False ; #DEBUG_LINE_NO:441
    MQ104B_EnableExteriorPiratesMarker.Disable(False) ; #DEBUG_LINE_NO:442
  EndIf ; #DEBUG_LINE_NO:
  (SQ_Followers as sq_followersscript).SetRoleActive(Alias_Barrett.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:446
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:454
  Self.SetObjectiveDisplayed(115, True, False) ; #DEBUG_LINE_NO:455
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:457
  (SQ_Followers as sq_followersscript).SetRoleInActive(BarrettREF, True, False, True) ; #DEBUG_LINE_NO:460
  BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:462
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:463
EndFunction

Function Fragment_Stage_0400_Item_00()
  MQ104B_014_LodgeScene.Start() ; #DEBUG_LINE_NO:471
  Self.SetObjectiveCompleted(115, True) ; #DEBUG_LINE_NO:473
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:474
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:482
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:483
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:485
EndFunction

Function Fragment_Stage_0407_Item_00()
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:493
EndFunction

Function Fragment_Stage_0410_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:501
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True) ; #DEBUG_LINE_NO:502
  (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:503
  BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:504
  Self.SetStage(1000) ; #DEBUG_LINE_NO:506
EndFunction

Function Fragment_Stage_0420_Item_00()
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:514
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(BarrettREF, True) ; #DEBUG_LINE_NO:515
  Self.SetStage(1000) ; #DEBUG_LINE_NO:517
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:525
  If MQ103.GetStageDone(2000) && MQ104A.GetStageDone(1000) ; #DEBUG_LINE_NO:528
    MQ105.SetStage(10) ; #DEBUG_LINE_NO:529
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor MatsuraREF = Alias_Matsura.GetActorRef() ; #DEBUG_LINE_NO:541
  MatsuraREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:542
  Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:543
EndFunction
