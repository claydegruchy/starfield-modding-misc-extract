ScriptName Fragments:Quests:QF_LC088_Key_002BF36B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property LC088_Quickstart_Entrance Auto Const mandatory
ObjectReference Property LC088_Quickstart_LastNova Auto Const mandatory
ObjectReference Property LC088_Quickstart_Voss Auto Const mandatory
ObjectReference Property LC088_Quickstart_Range Auto Const mandatory
ObjectReference Property LC088_Quickstart_OperationsEntry Auto Const mandatory
ObjectReference Property LC088_Quickstart_Delgado Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
ObjectReference Property TheKey_CF08_EnableMarker Auto Const mandatory
ObjectReference Property TheKey_CF08_DisableMarker Auto Const mandatory
ObjectReference Property TheKey_CF08_GenericActorsDisableMarker Auto Const mandatory
ReferenceAlias Property Alias_JasmineRobot Auto Const mandatory
Scene Property LC088_Key_200_JasmineIntro Auto Const mandatory
Scene Property LC088_Key_300_BogIntro Auto Const mandatory
Scene Property LC088_Key_400_VossIntro Auto Const mandatory
Scene Property LC088_Key_410_VossDialogue Auto Const mandatory
Scene Property LC088_Key_420_VossAttacked Auto Const mandatory
Scene Property LC088_Key_550_RokovIntro Auto Const mandatory
Scene Property LC088_Key_570_AdlerIntro Auto Const mandatory
Scene Property LC088_Key_250_MathisIntro Auto Const mandatory
Scene Property LC088_Key_600_OperationsIntro Auto Const mandatory
Scene Property LC088_Key_710_HuanIntro Auto Const mandatory
Scene Property LC088_Key_790_Reactor01Complete Auto Const mandatory
Scene Property LC088_Key_890_Reactor02Complete Auto Const mandatory
Scene Property LC088_Key_990_Reactor03Complete Auto Const mandatory
ReferenceAlias Property Alias_Jasmine Auto Const mandatory
ReferenceAlias Property Alias_Voss Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_All Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_ReckonersCore Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor01Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor02Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor03Group Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Delgado Auto Const mandatory
RefCollectionAlias Property Alias_SecurityDoors_Reactor Auto Const mandatory
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_Reactor01Commander Auto Const mandatory
ReferenceAlias Property Alias_Reactor02Commander Auto Const mandatory
ReferenceAlias Property Alias_Reactor03Commander Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
RefCollectionAlias Property Alias_Reactor01Activators Auto Const mandatory
RefCollectionAlias Property Alias_Reactor02Activators Auto Const mandatory
RefCollectionAlias Property Alias_Reactor03Activators Auto Const mandatory
ReferenceAlias Property Alias_Ops_EntryDoor Auto Const mandatory
ReferenceAlias Property Alias_Jasmine_Terminal Auto Const mandatory
RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup1 Auto Const mandatory
RefCollectionAlias Property Alias_QuartersAmbushDoorsGroup2 Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_AtriumEntryTrigger Auto Const mandatory
Scene Property LC088_Key_490_VossDead Auto Const mandatory
Explosion Property ParticleGrenadeExplosion Auto Const mandatory
Scene Property LC088_Key_1090_SelfDestructAborted Auto Const mandatory
ReferenceAlias Property Alias_NaevaReplacement Auto Const mandatory
ReferenceAlias Property Alias_HuanReplacement Auto Const mandatory
ReferenceAlias Property Alias_EstelleReplacement Auto Const mandatory
ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const mandatory
ObjectReference Property LC088_OpsIntroScene_PlayerMoveToMarker Auto Const
Quest Property CF08_SysDef Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
RefCollectionAlias Property Alias_LoadElevators Auto Const mandatory
ReferenceAlias Property Alias_Rokov_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Rokov_CombatTravelTarget Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_TheKey Auto Const mandatory
RefCollectionAlias Property Alias_Reactor03_Robots Auto Const mandatory
ReferenceAlias Property Alias_DelgadosTerminal Auto Const mandatory
ReferenceAlias Property Alias_JessamineGriffin Auto Const mandatory
Spell Property CritLaser Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_JessamineGriffin_GagarinLocation Auto Const mandatory
Scene Property LC088_Key_Stage160_AludraDeath Auto Const mandatory
Scene Property LC088_Key_Stage170_TKDeath Auto Const mandatory
Scene Property LC088_Key_Stage180_IsraDeath Auto Const mandatory
Scene Property LC088_Key_Stage150_DepotEntry Auto Const mandatory
Quest Property CF_Post Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ActorBase Property CF_AdlerKemp Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
LocationAlias Property Alias_LC088KeyInteriorLocation Auto Const mandatory
wwiseevent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const mandatory
RefCollectionAlias Property Alias_CargoBayLoadDoorsNormal Auto Const mandatory
RefCollectionAlias Property Alias_CargoBayLoadDoorsLC088 Auto Const mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsLoad Auto Const mandatory
RefCollectionAlias Property Alias_OpsEntryDoorsNormal Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
Faction Property SQ_Followers_GroupFormation_Faction Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Mainframe Auto Const mandatory
Keyword Property LinkHome Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0250_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0520_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0530_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().MoveTo(LC088_Quickstart_Entrance, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().MoveTo(LC088_Quickstart_LastNova, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:38
  Self.SetStage(390) ; #DEBUG_LINE_NO:41
  Self.SetStage(400) ; #DEBUG_LINE_NO:42
  Game.GetPlayer().MoveTo(LC088_Quickstart_Voss, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:56
  Self.SetStage(490) ; #DEBUG_LINE_NO:59
  Game.GetPlayer().MoveTo(LC088_Quickstart_Range, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:73
  Game.GetPlayer().MoveTo(LC088_Quickstart_OperationsEntry, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:87
  Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:90
  Self.SetStage(601) ; #DEBUG_LINE_NO:91
  Self.SetStage(700) ; #DEBUG_LINE_NO:92
  If !CF_Post.GetStageDone(0) ; #DEBUG_LINE_NO:95
    Game.GetPlayer().MoveTo(LC088_OpsIntroScene_PlayerMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC088_Space.SetStage(45) ; #DEBUG_LINE_NO:112
  Alias_playerShip.GetShipRef().InstantDock(Alias_TheKey.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:115
  CF08_SysDef.SetStage(310) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:126
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:127
  Alias_LC088KeyInteriorLocation.GetLocation().Reset() ; #DEBUG_LINE_NO:133
  TheKey_CF08_EnableMarker.Enable(False) ; #DEBUG_LINE_NO:136
  TheKey_CF08_DisableMarker.Disable(False) ; #DEBUG_LINE_NO:137
  TheKey_CF08_GenericActorsDisableMarker.Disable(False) ; #DEBUG_LINE_NO:138
  Alias_CargoBayLoadDoorsNormal.DisableAll(False) ; #DEBUG_LINE_NO:139
  Alias_CargoBayLoadDoorsLC088.EnableAll(False) ; #DEBUG_LINE_NO:140
  Alias_OpsEntryDoorsLoad.EnableAll(False) ; #DEBUG_LINE_NO:141
  Alias_OpsEntryDoorsNormal.DisableAll(False) ; #DEBUG_LINE_NO:142
  kmyQuest.SetElevatorsLockedDown(True) ; #DEBUG_LINE_NO:145
  kmyQuest.SetupOpsEntryDoor() ; #DEBUG_LINE_NO:148
  DialogueCFTheKey.Start() ; #DEBUG_LINE_NO:151
  DialogueCFTheKey.SetStage(10000) ; #DEBUG_LINE_NO:152
  kmyQuest.SetupAllCaptainEvents() ; #DEBUG_LINE_NO:155
  kmyQuest.SetupOtherActors() ; #DEBUG_LINE_NO:156
  If !CF_Post.GetStageDone(1) ; #DEBUG_LINE_NO:157
    kmyQuest.SetupAllEnemyGroups() ; #DEBUG_LINE_NO:158
    kmyQuest.EnableEnemyGroup(1) ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  Actor vossRef = Alias_Voss.GetActorRef() ; #DEBUG_LINE_NO:163
  vossRef.Reset(None) ; #DEBUG_LINE_NO:164
  vossRef.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:165
  Actor delgadoRef = Alias_Delgado.GetActorRef() ; #DEBUG_LINE_NO:168
  delgadoRef.Reset(None) ; #DEBUG_LINE_NO:169
  delgadoRef.Enable(False) ; #DEBUG_LINE_NO:170
  delgadoRef.MoveToPackageLocation() ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_JessamineGriffin.GetRef().MoveTo(Alias_JessamineGriffin_GagarinLocation.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), SQ_LinkCompanionEliteCrewHomeMarker, True) ; #DEBUG_LINE_NO:190
  Alias_JessamineGriffin.GetRef().SetLinkedRef(Alias_JessamineGriffin_GagarinLocation.GetRef(), LinkHome, True) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor RokovRef = Alias_Rokov.GetActorRef() ; #DEBUG_LINE_NO:201
  RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False) ; #DEBUG_LINE_NO:202
  RokovRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_Mathis.GetActorRef().SetGroupFaction(None) ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Naeva.TryToDisable() ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0016_Item_00()
  Actor AdlerRef = Alias_Adler.GetActorRef() ; #DEBUG_LINE_NO:234
  AdlerRef.RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:236
  AdlerRef.RemoveFromFaction(CydoniaFaction) ; #DEBUG_LINE_NO:237
  AdlerRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:238
  AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False) ; #DEBUG_LINE_NO:239
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_Reactor01Commander.ForceRefTo(Alias_Huan.GetRef()) ; #DEBUG_LINE_NO:250
  Alias_HuanReplacement.TryToDisable() ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0018_Item_00()
  Alias_Reactor03Commander.ForceRefTo(Alias_Estelle.GetRef()) ; #DEBUG_LINE_NO:262
  Alias_EstelleReplacement.TryToDisable() ; #DEBUG_LINE_NO:263
  Actor EstelleRef = Alias_Estelle.GetActorRef() ; #DEBUG_LINE_NO:264
  EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False) ; #DEBUG_LINE_NO:265
  EstelleRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:266
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0019_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:275
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:276
  kmyQuest.VossBombTickStop() ; #DEBUG_LINE_NO:282
  CF08_SysDef.SetStage(440) ; #DEBUG_LINE_NO:285
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueCFTheKey.SetStage(10000) ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0160_Item_00()
  LC088_Key_Stage160_AludraDeath.Start() ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0170_Item_00()
  LC088_Key_Stage170_TKDeath.Start() ; #DEBUG_LINE_NO:312
EndFunction

Function Fragment_Stage_0180_Item_00()
  LC088_Key_Stage180_IsraDeath.Start() ; #DEBUG_LINE_NO:320
EndFunction

Function Fragment_Stage_0200_Item_00()
  LC088_Key_200_JasmineIntro.Start() ; #DEBUG_LINE_NO:331
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:334
  Self.SetStage(201) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0201_Item_00()
  Alias_JasmineRobot.GetActorRef().SetUnconscious(False) ; #DEBUG_LINE_NO:346
  Actor jasmineRef = Alias_Jasmine.GetActorRef() ; #DEBUG_LINE_NO:349
  jasmineRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:350
  jasmineRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:351
  CF08_SysDef.SetStage(315) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0210_Item_00()
  CF08_SysDef.SetStage(316) ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0210_Item_01()
  LC088_Key_Stage150_DepotEntry.Start() ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_0300_Item_00()
  LC088_Key_300_BogIntro.Start() ; #DEBUG_LINE_NO:396
  CF08_SysDef.SetStage(320) ; #DEBUG_LINE_NO:399
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:407
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:408
  Alias_AtriumEntryTrigger.TryToEnable() ; #DEBUG_LINE_NO:414
  CF08_SysDef.SetStage(330) ; #DEBUG_LINE_NO:417
EndFunction

Function Fragment_Stage_0400_Item_00()
  CF08_SysDef.SetStage(340) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0401_Item_00()
  LC088_Key_400_VossIntro.Start() ; #DEBUG_LINE_NO:439
EndFunction

Function Fragment_Stage_0405_Item_00()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:447
  LC088_Key_400_VossIntro.Stop() ; #DEBUG_LINE_NO:448
  Self.SetStage(410) ; #DEBUG_LINE_NO:449
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:457
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:458
  Alias_Voss.TryToEvaluatePackage() ; #DEBUG_LINE_NO:464
EndFunction

Function Fragment_Stage_0411_Item_00()
  Alias_Voss.TryToEvaluatePackage() ; #DEBUG_LINE_NO:475
EndFunction

Function Fragment_Stage_0415_Item_00()
  If !Self.GetStageDone(420) ; #DEBUG_LINE_NO:486
    LC088_Key_420_VossAttacked.Start() ; #DEBUG_LINE_NO:488
    Self.SetStage(420) ; #DEBUG_LINE_NO:491
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:500
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:501
  kmyQuest.VossBombArmed() ; #DEBUG_LINE_NO:507
  Actor vossRef = Alias_Voss.GetActorRef() ; #DEBUG_LINE_NO:510
  vossRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:511
  vossRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:512
  vossRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:513
  vossRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_0430_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:524
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:525
  CF08_SysDef.SetStage(345) ; #DEBUG_LINE_NO:531
  kmyQuest.VossWaitForSit() ; #DEBUG_LINE_NO:534
  Alias_Voss.TryToEvaluatePackage() ; #DEBUG_LINE_NO:537
  Alias_Voss.GetActorRef().AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:538
EndFunction

Function Fragment_Stage_0470_Item_00()
  If !Self.GetStageDone(19) ; #DEBUG_LINE_NO:550
    Alias_Voss.TryToKill(None) ; #DEBUG_LINE_NO:551
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0480_Item_00()
  LC088_Key_490_VossDead.Start() ; #DEBUG_LINE_NO:563
  CF08_SysDef.SetStage(350) ; #DEBUG_LINE_NO:566
EndFunction

Function Fragment_Stage_0490_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:574
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:575
  kmyQuest.EnableEnemyGroup(2) ; #DEBUG_LINE_NO:582
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_ReckonersCore) ; #DEBUG_LINE_NO:585
  CF08_SysDef.SetStage(350) ; #DEBUG_LINE_NO:588
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:612
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:613
  If Self.GetStageDone(13) && Self.GetStage() < 600 ; #DEBUG_LINE_NO:619
    LC088_Key_550_RokovIntro.Start() ; #DEBUG_LINE_NO:621
    kmyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup1) ; #DEBUG_LINE_NO:624
    Self.SetStage(570) ; #DEBUG_LINE_NO:627
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0570_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:636
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:637
  If Self.GetStageDone(16) && Self.GetStage() < 600 ; #DEBUG_LINE_NO:643
    LC088_Key_570_AdlerIntro.Start() ; #DEBUG_LINE_NO:645
    kmyQuest.OpenDoorCollection(Alias_QuartersAmbushDoorsGroup2) ; #DEBUG_LINE_NO:648
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:657
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:658
  CF08_SysDef.SetStage(360) ; #DEBUG_LINE_NO:664
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:672
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:673
  SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef(), None, True, True, False, False, False) ; #DEBUG_LINE_NO:679
  Alias_OpsEntryDoorsLoad.DisableAll(False) ; #DEBUG_LINE_NO:682
  Alias_OpsEntryDoorsNormal.EnableAll(False) ; #DEBUG_LINE_NO:683
  kmyQuest.SealOpsEntryDoor() ; #DEBUG_LINE_NO:684
  kmyQuest.SetupReactorBattleNoWait() ; #DEBUG_LINE_NO:687
EndFunction

Function Fragment_Stage_0650_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:695
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:696
  kmyQuest.AbortReactorBattleNoWait() ; #DEBUG_LINE_NO:702
  Self.SetStage(1100) ; #DEBUG_LINE_NO:705
  Alias_Delgado.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:708
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:716
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:717
  kmyQuest.LockPlayerControls(False) ; #DEBUG_LINE_NO:723
  kmyQuest.StartReactorBattle() ; #DEBUG_LINE_NO:726
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor01Group) ; #DEBUG_LINE_NO:729
  CF08_SysDef.SetStage(370) ; #DEBUG_LINE_NO:732
EndFunction

Function Fragment_Stage_0710_Item_00()
  LC088_Key_710_HuanIntro.Start() ; #DEBUG_LINE_NO:743
EndFunction

Function Fragment_Stage_0790_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:751
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:752
  kmyQuest.SetReactorState(1, kmyQuest.CONST_ReactorState_Active) ; #DEBUG_LINE_NO:758
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:761
  LC088_Key_790_Reactor01Complete.Start() ; #DEBUG_LINE_NO:762
  CF08_SysDef.SetStage(390) ; #DEBUG_LINE_NO:765
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:773
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:774
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor02Group) ; #DEBUG_LINE_NO:780
EndFunction

Function Fragment_Stage_0890_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:788
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:789
  kmyQuest.SetReactorState(2, kmyQuest.CONST_ReactorState_Active) ; #DEBUG_LINE_NO:795
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:798
  LC088_Key_890_Reactor02Complete.Start() ; #DEBUG_LINE_NO:799
  CF08_SysDef.SetStage(400) ; #DEBUG_LINE_NO:802
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:810
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:811
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Reactor03Group) ; #DEBUG_LINE_NO:817
  robotpodscript[] robots = Alias_Reactor03_Robots.GetArray() as robotpodscript[] ; #DEBUG_LINE_NO:820
  Int I = 0 ; #DEBUG_LINE_NO:821
  While I < robots.Length ; #DEBUG_LINE_NO:822
    If robots[I] != None ; #DEBUG_LINE_NO:823
      robots[I].WakeRobotFromPod() ; #DEBUG_LINE_NO:824
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:826
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:835
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:836
  kmyQuest.SetReactorState(3, kmyQuest.CONST_ReactorState_Active) ; #DEBUG_LINE_NO:842
  Alias_Mainframe.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:845
  LC088_Key_990_Reactor03Complete.Start() ; #DEBUG_LINE_NO:846
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_Delgado) ; #DEBUG_LINE_NO:849
  CF08_SysDef.SetStage(410) ; #DEBUG_LINE_NO:852
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:860
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:861
  CF08_SysDef.SetStage(420) ; #DEBUG_LINE_NO:867
EndFunction

Function Fragment_Stage_1010_Item_00()
  Alias_Delgado.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:878
EndFunction

Function Fragment_Stage_1070_Item_00()
  CF08_SysDef.SetStage(430) ; #DEBUG_LINE_NO:889
EndFunction

Function Fragment_Stage_1080_Item_00()
  CF08_SysDef.SetStage(435) ; #DEBUG_LINE_NO:898
EndFunction

Function Fragment_Stage_1090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:906
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:907
  kmyQuest.EndReactorBattleNoWait() ; #DEBUG_LINE_NO:913
  LC088_Key_1090_SelfDestructAborted.Start() ; #DEBUG_LINE_NO:916
  CF08_SysDef.SetStage(437) ; #DEBUG_LINE_NO:919
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:927
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:928
  kmyQuest.LockPlayerControls(False) ; #DEBUG_LINE_NO:934
  kmyQuest.EndReactorBattleNoWait() ; #DEBUG_LINE_NO:937
  kmyQuest.SetElevatorsLockedDown(False) ; #DEBUG_LINE_NO:940
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_All) ; #DEBUG_LINE_NO:943
  Alias_CargoBayLoadDoorsNormal.EnableAll(False) ; #DEBUG_LINE_NO:946
  Alias_CargoBayLoadDoorsLC088.DisableAll(False) ; #DEBUG_LINE_NO:947
  Alias_OpsEntryDoorsLoad.DisableAll(False) ; #DEBUG_LINE_NO:948
  Alias_OpsEntryDoorsNormal.EnableAll(False) ; #DEBUG_LINE_NO:949
  kmyQuest.OpenOpsEntryDoor() ; #DEBUG_LINE_NO:952
  Alias_DelgadosTerminal.GetRef().Unlock(False) ; #DEBUG_LINE_NO:955
  LC088_Space.SetStage(293) ; #DEBUG_LINE_NO:958
  CF_Post.SetStage(200) ; #DEBUG_LINE_NO:961
  CF08_SysDef.SetStage(510) ; #DEBUG_LINE_NO:964
EndFunction

Function Fragment_Stage_1101_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:972
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:973
  kmyQuest.LockPlayerControls(False) ; #DEBUG_LINE_NO:981
  kmyQuest.EndReactorBattleAndWait() ; #DEBUG_LINE_NO:982
  kmyQuest.SetElevatorsLockedDown(False) ; #DEBUG_LINE_NO:983
  kmyQuest.OpenDoorCollection(Alias_SecurityDoors_All) ; #DEBUG_LINE_NO:984
  Alias_CargoBayLoadDoorsNormal.EnableAll(False) ; #DEBUG_LINE_NO:985
  Alias_CargoBayLoadDoorsLC088.DisableAll(False) ; #DEBUG_LINE_NO:986
  Alias_OpsEntryDoorsLoad.DisableAll(False) ; #DEBUG_LINE_NO:987
  Alias_OpsEntryDoorsNormal.EnableAll(False) ; #DEBUG_LINE_NO:988
  kmyQuest.OpenOpsEntryDoor() ; #DEBUG_LINE_NO:989
  Alias_DelgadosTerminal.GetRef().Unlock(False) ; #DEBUG_LINE_NO:990
  CF_Post.SetStage(200) ; #DEBUG_LINE_NO:991
  CF08_SysDef.SetStage(510) ; #DEBUG_LINE_NO:992
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1000
  lc088_keyquestscript kmyQuest = __temp as lc088_keyquestscript ; #DEBUG_LINE_NO:1001
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:1007
  Self.Stop() ; #DEBUG_LINE_NO:1010
EndFunction
