ScriptName Fragments:Quests:QF_MS02_0029A00C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS02_CluesCollected Auto Const mandatory
Scene Property MS02_1550_WarningMessage Auto Const mandatory
Scene Property MS02_0100_EmergencyBroadcast Auto Const mandatory
ReferenceAlias Property Alias_AdaLovelace Auto Const mandatory
ReferenceAlias Property Alias_GenghisKhan Auto Const mandatory
ReferenceAlias Property Alias_Amanirenas Auto Const mandatory
ReferenceAlias Property Alias_FDR Auto Const mandatory
ReferenceAlias Property Alias_CrucibleCOC Auto Const mandatory
ReferenceAlias Property Alias_AdaTempName Auto Const
ReferenceAlias Property Alias_FDRTempName Auto Const
Quest Property MS02_Delivery Auto Const mandatory
Scene Property MS02_1090_OriginDoorWarning Auto Const mandatory
RefCollectionAlias Property Alias_Renegades Auto Const mandatory
Faction Property MS02_BelieversFaction Auto Const mandatory
Faction Property MS02_PragmatistsFaction Auto Const mandatory
Faction Property MS02_RenegadesFaction Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property MS02_1900_PC_Kills_Crucible Auto Const mandatory
ReferenceAlias Property Alias_AlienSpawner Auto Const mandatory
RefCollectionAlias Property Alias_GenghisAliens Auto Const mandatory
RefCollectionAlias Property Alias_InitiallyHiddenPeople Auto Const mandatory
GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const mandatory
Quest Property AmeliaEliteCrewQuest Auto Const
ReferenceAlias Property Alias_FacilityMapMarker Auto Const mandatory
Scene Property MS02_0610_GenghisApproaches Auto Const mandatory
ReferenceAlias Property Alias_Beacon01_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_FacilityRestrictedTerminal Auto Const mandatory
MiscObject Property MS02_EncryptedSecurityOverrideCode Auto Const mandatory
ReferenceAlias Property Alias_EncryptedOverrideCode Auto Const mandatory
ReferenceAlias Property Alias_OverrideCode Auto Const mandatory
MiscObject Property MS02_SecurityOverrideCode Auto Const mandatory
ActorValue Property MS02_Foreknowledge Auto Const mandatory
ReferenceAlias Property Alias_DoorPragmatists Auto Const mandatory
RefCollectionAlias Property Alias_DoorsCrucible Auto Const mandatory
Faction Property CrimeFactionCrucible Auto Const mandatory
Faction Property CrucibleFaction Auto Const mandatory
RefCollectionAlias Property Alias_Believers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
RefCollectionAlias Property Alias_Pragmatists Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
ReferenceAlias Property Alias_BeagleMapMarker Auto Const mandatory
ActorValue Property MS02_LeaderReadyToFight Auto Const mandatory
Message Property MS02_BeagleNavBeaconMessage Auto Const mandatory
ReferenceAlias Property Alias_BackdoorFacility Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Quest Property Crucible01 Auto Const mandatory
ReferenceAlias Property Alias_Beagle Auto Const mandatory
GlobalVariable Property SE_Player_FAB18a_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
RefCollectionAlias Property Alias_NeutralClones Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:17
  Alias_InitiallyHiddenPeople.DisableAll(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  Self.SetStage(200) ; #DEBUG_LINE_NO:32
  Self.SetStage(210) ; #DEBUG_LINE_NO:33
  Self.SetStage(250) ; #DEBUG_LINE_NO:34
  Self.SetStage(300) ; #DEBUG_LINE_NO:35
  Self.SetStage(310) ; #DEBUG_LINE_NO:36
  Self.SetStage(400) ; #DEBUG_LINE_NO:37
  Self.SetStage(500) ; #DEBUG_LINE_NO:38
  Self.SetStage(600) ; #DEBUG_LINE_NO:39
  Self.SetStage(700) ; #DEBUG_LINE_NO:40
  Self.SetStage(800) ; #DEBUG_LINE_NO:41
  Self.SetStage(900) ; #DEBUG_LINE_NO:42
  Self.SetStage(1000) ; #DEBUG_LINE_NO:43
  Self.SetStage(1100) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:52
  Self.SetStage(1200) ; #DEBUG_LINE_NO:54
  Self.SetStage(1210) ; #DEBUG_LINE_NO:55
  Self.SetStage(1300) ; #DEBUG_LINE_NO:56
  Self.SetStage(1400) ; #DEBUG_LINE_NO:57
  Self.SetStage(1500) ; #DEBUG_LINE_NO:58
  Self.SetStage(1550) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:67
  Self.SetStage(1200) ; #DEBUG_LINE_NO:69
  Self.SetStage(1220) ; #DEBUG_LINE_NO:70
  Self.SetStage(1300) ; #DEBUG_LINE_NO:71
  Self.SetStage(1400) ; #DEBUG_LINE_NO:72
  Self.SetStage(1500) ; #DEBUG_LINE_NO:73
  Self.SetStage(1550) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:82
  Self.SetStage(1200) ; #DEBUG_LINE_NO:84
  Self.SetStage(1230) ; #DEBUG_LINE_NO:85
  Self.SetStage(1300) ; #DEBUG_LINE_NO:86
  Self.SetStage(1400) ; #DEBUG_LINE_NO:87
  Self.SetStage(1500) ; #DEBUG_LINE_NO:88
  Self.SetStage(1550) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:97
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:99
  MS02_0100_EmergencyBroadcast.Start() ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_AdaLovelace.GetRef().Enable(False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0250_Item_00()
  MS02_Delivery.Start() ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:137
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:138
  ObjectReference oTarg = Alias_DoorPragmatists.GetRef() ; #DEBUG_LINE_NO:141
  oTarg.Lock(False, False, True) ; #DEBUG_LINE_NO:142
  oTarg.SetOpen(True) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0310_Item_00()
  Alias_AdaTempName.Clear() ; #DEBUG_LINE_NO:152
  Alias_FDRTempName.Clear() ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:161
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:163
  Alias_InitiallyHiddenPeople.EnableAll(False) ; #DEBUG_LINE_NO:166
  Game.GetPlayer().SetValue(MS02_Foreknowledge, 1.0) ; #DEBUG_LINE_NO:169
  Alias_DoorsCrucible.GetAt(0).Lock(False, False, True) ; #DEBUG_LINE_NO:172
  Alias_DoorsCrucible.GetAt(1).Lock(False, False, True) ; #DEBUG_LINE_NO:173
  Alias_DoorsCrucible.GetAt(2).Lock(False, False, True) ; #DEBUG_LINE_NO:174
  Alias_DoorsCrucible.SetOpen(True) ; #DEBUG_LINE_NO:175
  Alias_GenghisKhan.GetActorRef().AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:187
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:190
    Self.SetStage(800) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(700) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:202
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:205
    Self.SetStage(800) ; #DEBUG_LINE_NO:206
  EndIf ; #DEBUG_LINE_NO:
  Alias_GenghisKhan.GetActorRef().RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:210
  Self.SetStage(700) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0610_Item_00()
  If !Self.GetStageDone(600) ; #DEBUG_LINE_NO:222
    Alias_GenghisAliens.EnableAll(False) ; #DEBUG_LINE_NO:224
    Alias_GenghisAliens.StartCombatAll(Alias_GenghisKhan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:225
    Alias_GenghisKhan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:228
    MS02_0610_GenghisApproaches.Start() ; #DEBUG_LINE_NO:229
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:238
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:246
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:247
  Alias_FacilityMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:250
  Crucible01.Start() ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_10000_Item_00()
  Crew_Elite_CanHireAmelia.SetValue(1.0) ; #DEBUG_LINE_NO:262
  AmeliaEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:271
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_1001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:280
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:281
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:285
EndFunction

Function Fragment_Stage_1002_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:293
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:294
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:298
EndFunction

Function Fragment_Stage_1003_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:306
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:307
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_1004_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:319
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:320
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:324
EndFunction

Function Fragment_Stage_1005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:332
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:333
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_1006_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:345
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:346
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_1007_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:358
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:359
  kmyQuest.CountClues() ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_1090_Item_00()
  MS02_1090_OriginDoorWarning.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:380
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:381
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:389
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:390
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:398
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:399
  Alias_Beagle.GetRef().Enable(False) ; #DEBUG_LINE_NO:402
  Alias_Beacon01_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_1310_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:411
  Self.SetObjectiveDisplayed(1310, True, False) ; #DEBUG_LINE_NO:412
  Alias_BeagleMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:415
  MS02_BeagleNavBeaconMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:418
EndFunction

Function Fragment_Stage_1320_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:427
EndFunction

Function Fragment_Stage_1330_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:436
EndFunction

Function Fragment_Stage_1335_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:445
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:453
  Self.SetObjectiveCompleted(1310, True) ; #DEBUG_LINE_NO:454
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:455
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True) ; #DEBUG_LINE_NO:463
  Self.SetObjectiveDisplayed(1880, True, False) ; #DEBUG_LINE_NO:464
  Game.GetPlayer().AddAliasedItem(MS02_EncryptedSecurityOverrideCode as Form, Alias_EncryptedOverrideCode as Alias, 1, False) ; #DEBUG_LINE_NO:467
EndFunction

Function Fragment_Stage_1550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:475
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:476
  MS02_1550_WarningMessage.Start() ; #DEBUG_LINE_NO:480
  If Self.GetStageDone(1210) ; #DEBUG_LINE_NO:483
    Self.SetStage(1600) ; #DEBUG_LINE_NO:484
  ElseIf Self.GetStageDone(1220) ; #DEBUG_LINE_NO:485
    Self.SetStage(1700) ; #DEBUG_LINE_NO:486
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1800) ; #DEBUG_LINE_NO:488
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveDisplayed(1600, True, False) ; #DEBUG_LINE_NO:497
EndFunction

Function Fragment_Stage_1610_Item_00()
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:505
  Self.SetObjectiveDisplayed(1610, True, False) ; #DEBUG_LINE_NO:506
  ObjectReference oTarg = None ; #DEBUG_LINE_NO:508
  ObjectReference oLinkedRef = None ; #DEBUG_LINE_NO:509
  oTarg = Alias_Amanirenas.GetRef() ; #DEBUG_LINE_NO:511
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:512
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:513
  oTarg = Alias_FDR.GetRef() ; #DEBUG_LINE_NO:515
  (oTarg as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:516
  oTarg = Alias_GenghisKhan.GetRef() ; #DEBUG_LINE_NO:520
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:521
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_1615_Item_00()
  Actor aTarg = Alias_GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:530
  Actor aTarg2 = Alias_Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:531
  aTarg.SetValue(MS02_LeaderReadyToFight, 1.0) ; #DEBUG_LINE_NO:535
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:536
  If !Self.GetStageDone(1622) ; #DEBUG_LINE_NO:539
    aTarg2.SetValue(MS02_LeaderReadyToFight, 1.0) ; #DEBUG_LINE_NO:540
    aTarg2.EvaluatePackage(False) ; #DEBUG_LINE_NO:541
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:544
  aTarg.MoveToPackageLocation() ; #DEBUG_LINE_NO:547
  If !Self.GetStageDone(1622) ; #DEBUG_LINE_NO:548
    aTarg2.MoveToPackageLocation() ; #DEBUG_LINE_NO:549
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1620_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:558
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:559
  Self.SetObjectiveCompleted(1610, True) ; #DEBUG_LINE_NO:562
  Self.SetObjectiveDisplayed(1620, True, False) ; #DEBUG_LINE_NO:563
  kmyQuest.RemoveFactions() ; #DEBUG_LINE_NO:566
  If !Self.GetStageDone(1622) ; #DEBUG_LINE_NO:569
    Self.SetObjectiveDisplayed(1625, True, False) ; #DEBUG_LINE_NO:570
  EndIf ; #DEBUG_LINE_NO:
  Actor aTarg = Alias_GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:575
  kmyQuest.GoHostile(aTarg) ; #DEBUG_LINE_NO:576
  If !Self.GetStageDone(1622) ; #DEBUG_LINE_NO:580
    aTarg = Alias_Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:582
    kmyQuest.GoHostile(aTarg) ; #DEBUG_LINE_NO:583
    MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, False, False) ; #DEBUG_LINE_NO:586
    Alias_Believers.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:587
  EndIf ; #DEBUG_LINE_NO:
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, False, False) ; #DEBUG_LINE_NO:591
  Alias_Renegades.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:592
EndFunction

Function Fragment_Stage_1621_Item_00()
  Self.SetStage(1622) ; #DEBUG_LINE_NO:601
EndFunction

Function Fragment_Stage_1625_Item_00()
  Self.SetStage(1622) ; #DEBUG_LINE_NO:610
EndFunction

Function Fragment_Stage_1630_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:618
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:619
  Self.SetObjectiveCompleted(1620, True) ; #DEBUG_LINE_NO:622
  Self.SetObjectiveDisplayed(1630, True, False) ; #DEBUG_LINE_NO:623
  Self.SetStage(1870) ; #DEBUG_LINE_NO:625
EndFunction

Function Fragment_Stage_1632_Item_00()
  If Self.GetStageDone(1622) || Self.GetStageDone(1634) ; #DEBUG_LINE_NO:634
    Self.SetStage(1630) ; #DEBUG_LINE_NO:635
  EndIf ; #DEBUG_LINE_NO:
  Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:639
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:640
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True) ; #DEBUG_LINE_NO:641
  Alias_Renegades.StopCombat() ; #DEBUG_LINE_NO:644
  Alias_Renegades.EvaluateAll() ; #DEBUG_LINE_NO:645
  Self.SetObjectiveCompleted(1620, True) ; #DEBUG_LINE_NO:647
EndFunction

Function Fragment_Stage_1634_Item_00()
  If Self.GetStageDone(1632) ; #DEBUG_LINE_NO:656
    Self.SetStage(1630) ; #DEBUG_LINE_NO:657
  EndIf ; #DEBUG_LINE_NO:
  Alias_Believers.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:661
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:662
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True) ; #DEBUG_LINE_NO:663
  Alias_Believers.StopCombat() ; #DEBUG_LINE_NO:666
  Alias_Believers.EvaluateAll() ; #DEBUG_LINE_NO:667
  Self.SetObjectiveCompleted(1625, True) ; #DEBUG_LINE_NO:669
EndFunction

Function Fragment_Stage_1640_Item_00()
  Self.SetObjectiveCompleted(1630, True) ; #DEBUG_LINE_NO:677
  Self.SetStage(1875) ; #DEBUG_LINE_NO:680
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveDisplayed(1601, True, False) ; #DEBUG_LINE_NO:688
EndFunction

Function Fragment_Stage_1710_Item_00()
  Self.SetObjectiveCompleted(1601, True) ; #DEBUG_LINE_NO:696
  Self.SetObjectiveDisplayed(1610, True, False) ; #DEBUG_LINE_NO:697
  ObjectReference oTarg = None ; #DEBUG_LINE_NO:699
  ObjectReference oLinkedRef = None ; #DEBUG_LINE_NO:700
  oTarg = Alias_Amanirenas.GetRef() ; #DEBUG_LINE_NO:702
  (oTarg as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:703
  oTarg = Alias_FDR.GetRef() ; #DEBUG_LINE_NO:707
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:708
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:709
  oTarg = Alias_GenghisKhan.GetRef() ; #DEBUG_LINE_NO:711
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:712
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:713
EndFunction

Function Fragment_Stage_1715_Item_00()
  Alias_GenghisKhan.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0) ; #DEBUG_LINE_NO:721
EndFunction

Function Fragment_Stage_1720_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:729
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:730
  Self.SetObjectiveCompleted(1610, True) ; #DEBUG_LINE_NO:733
  Self.SetObjectiveDisplayed(1620, True, False) ; #DEBUG_LINE_NO:734
  kmyQuest.RemoveFactions() ; #DEBUG_LINE_NO:737
  Actor aTarg = Alias_GenghisKhan.GetActorRef() ; #DEBUG_LINE_NO:741
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:742
  kmyQuest.GoHostile(aTarg) ; #DEBUG_LINE_NO:743
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, False, False) ; #DEBUG_LINE_NO:746
EndFunction

Function Fragment_Stage_1730_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:755
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:756
  Self.SetObjectiveCompleted(1620, True) ; #DEBUG_LINE_NO:759
  Self.SetObjectiveDisplayed(1730, True, False) ; #DEBUG_LINE_NO:760
  Self.SetStage(1870) ; #DEBUG_LINE_NO:762
  Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:765
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True) ; #DEBUG_LINE_NO:766
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:767
EndFunction

Function Fragment_Stage_1740_Item_00()
  Self.SetObjectiveCompleted(1730, True) ; #DEBUG_LINE_NO:776
  Self.SetStage(1875) ; #DEBUG_LINE_NO:779
EndFunction

Function Fragment_Stage_1800_Item_00()
  Self.SetObjectiveDisplayed(1602, True, False) ; #DEBUG_LINE_NO:787
EndFunction

Function Fragment_Stage_1810_Item_00()
  Self.SetObjectiveCompleted(1602, True) ; #DEBUG_LINE_NO:795
  Self.SetObjectiveDisplayed(1610, True, False) ; #DEBUG_LINE_NO:796
  ObjectReference oTarg = None ; #DEBUG_LINE_NO:798
  ObjectReference oLinkedRef = None ; #DEBUG_LINE_NO:799
  oTarg = Alias_Amanirenas.GetRef() ; #DEBUG_LINE_NO:801
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:802
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:803
  oTarg = Alias_FDR.GetRef() ; #DEBUG_LINE_NO:805
  oLinkedRef = oTarg.GetLinkedRef(None) ; #DEBUG_LINE_NO:806
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:807
  oTarg = Alias_GenghisKhan.GetRef() ; #DEBUG_LINE_NO:809
  (oTarg as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:810
EndFunction

Function Fragment_Stage_1815_Item_00()
  Alias_Amanirenas.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0) ; #DEBUG_LINE_NO:820
  If !Self.GetStageDone(1822) ; #DEBUG_LINE_NO:823
    Alias_FDR.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0) ; #DEBUG_LINE_NO:824
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1820_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:833
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:834
  Self.SetObjectiveCompleted(1610, True) ; #DEBUG_LINE_NO:837
  Self.SetObjectiveDisplayed(1625, True, False) ; #DEBUG_LINE_NO:838
  If !Self.GetStageDone(1822) ; #DEBUG_LINE_NO:841
    Self.SetObjectiveDisplayed(1627, True, False) ; #DEBUG_LINE_NO:842
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.RemoveFactions() ; #DEBUG_LINE_NO:846
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:848
  aPlayer.AddToFaction(MS02_RenegadesFaction) ; #DEBUG_LINE_NO:851
  Actor aTarg = Alias_Amanirenas.GetActorRef() ; #DEBUG_LINE_NO:855
  kmyQuest.GoHostile(aTarg) ; #DEBUG_LINE_NO:856
  If !Self.GetStageDone(1822) ; #DEBUG_LINE_NO:859
    aTarg = Alias_FDR.GetActorRef() ; #DEBUG_LINE_NO:861
    kmyQuest.GoHostile(aTarg) ; #DEBUG_LINE_NO:862
    MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, False, False) ; #DEBUG_LINE_NO:865
  EndIf ; #DEBUG_LINE_NO:
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, False, False) ; #DEBUG_LINE_NO:870
EndFunction

Function Fragment_Stage_1823_Item_00()
  Self.SetStage(1622) ; #DEBUG_LINE_NO:880
EndFunction

Function Fragment_Stage_1830_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:888
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:889
  Self.SetObjectiveDisplayed(1830, True, False) ; #DEBUG_LINE_NO:892
  Self.SetStage(1870) ; #DEBUG_LINE_NO:894
EndFunction

Function Fragment_Stage_1832_Item_00()
  If Self.GetStageDone(1822) || Self.GetStageDone(1834) ; #DEBUG_LINE_NO:903
    Self.SetStage(1830) ; #DEBUG_LINE_NO:904
  EndIf ; #DEBUG_LINE_NO:
  Alias_Believers.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:908
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True) ; #DEBUG_LINE_NO:909
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True) ; #DEBUG_LINE_NO:910
  Alias_Believers.StopCombat() ; #DEBUG_LINE_NO:913
  Alias_Believers.EvaluateAll() ; #DEBUG_LINE_NO:914
  Self.SetObjectiveCompleted(1625, True) ; #DEBUG_LINE_NO:916
EndFunction

Function Fragment_Stage_1834_Item_00()
  Self.SetObjectiveCompleted(1627, True) ; #DEBUG_LINE_NO:924
  If Self.GetStageDone(1832) ; #DEBUG_LINE_NO:927
    Self.SetStage(1830) ; #DEBUG_LINE_NO:928
  EndIf ; #DEBUG_LINE_NO:
  Alias_Pragmatists.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:932
  MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, True, True) ; #DEBUG_LINE_NO:933
  MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, True, True) ; #DEBUG_LINE_NO:934
  Alias_Pragmatists.StopCombat() ; #DEBUG_LINE_NO:937
  Alias_Pragmatists.EvaluateAll() ; #DEBUG_LINE_NO:938
EndFunction

Function Fragment_Stage_1840_Item_00()
  Self.SetObjectiveCompleted(1830, True) ; #DEBUG_LINE_NO:946
  Self.SetStage(1875) ; #DEBUG_LINE_NO:949
EndFunction

Function Fragment_Stage_1870_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:957
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:958
  kmyQuest.EveryoneStopFighting() ; #DEBUG_LINE_NO:962
EndFunction

Function Fragment_Stage_1872_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:970
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:971
  kmyQuest.ResetBaseFactions() ; #DEBUG_LINE_NO:974
EndFunction

Function Fragment_Stage_1875_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:982
  ms02script kmyQuest = __temp as ms02script ; #DEBUG_LINE_NO:983
  kmyQuest.ResetBaseFactions() ; #DEBUG_LINE_NO:987
  Alias_BackdoorFacility.GetRef().Disable(False) ; #DEBUG_LINE_NO:990
EndFunction

Function Fragment_Stage_1880_Item_00()
  Self.SetObjectiveCompleted(1880, True) ; #DEBUG_LINE_NO:998
  Self.SetObjectiveDisplayed(1900, True, False) ; #DEBUG_LINE_NO:999
  Game.GetPlayer().RemoveItem(Alias_EncryptedOverrideCode.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1002
  Game.GetPlayer().AddAliasedItem(MS02_SecurityOverrideCode as Form, Alias_OverrideCode as Alias, 1, False) ; #DEBUG_LINE_NO:1005
EndFunction

Function Fragment_Stage_1890_Item_00()
  ObjectReference oDoor = Alias_FacilityRestrictedTerminal.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:1014
  oDoor.Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1015
  Game.GetPlayer().RemoveItem(Alias_OverrideCode.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1018
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(1900, True) ; #DEBUG_LINE_NO:1026
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:1027
  Self.SetObjectiveCompleted(1601, True) ; #DEBUG_LINE_NO:1028
  Self.SetObjectiveCompleted(1602, True) ; #DEBUG_LINE_NO:1029
EndFunction

Function Fragment_Stage_1910_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:1037
  Self.SetStage(9000) ; #DEBUG_LINE_NO:1042
EndFunction

Function Fragment_Stage_1920_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:1050
  MS02_1900_PC_Kills_Crucible.Start() ; #DEBUG_LINE_NO:1056
  Self.SetStage(9000) ; #DEBUG_LINE_NO:1058
EndFunction

Function Fragment_Stage_1930_Item_00()
  Self.SetStage(1900) ; #DEBUG_LINE_NO:1067
  Self.SetObjectiveDisplayed(2010, True, False) ; #DEBUG_LINE_NO:1069
EndFunction

Function Fragment_Stage_1940_Item_00()
  Self.SetStage(1900) ; #DEBUG_LINE_NO:1078
  Self.SetObjectiveDisplayed(2020, True, False) ; #DEBUG_LINE_NO:1080
EndFunction

Function Fragment_Stage_1950_Item_00()
  Self.SetStage(1900) ; #DEBUG_LINE_NO:1089
  Self.SetObjectiveDisplayed(2030, True, False) ; #DEBUG_LINE_NO:1091
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:1099
  If Self.GetStageDone(1950) ; #DEBUG_LINE_NO:1102
    MS02_GenghisReactivity.SetValue(1.0) ; #DEBUG_LINE_NO:1103
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:1104
    SE_Player_FAB18a_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:1105
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(9000) ; #DEBUG_LINE_NO:1108
EndFunction

Function Fragment_Stage_8810_Item_00()
  If Self.GetStageDone(1820) && !Self.GetStageDone(1822) ; #DEBUG_LINE_NO:1117
    Self.SetStage(1834) ; #DEBUG_LINE_NO:1118
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(8900) ; #DEBUG_LINE_NO:1120
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8820_Item_00()
  If Self.GetStageDone(1620) && !Self.GetStageDone(1622) ; #DEBUG_LINE_NO:1133
    Self.SetStage(1634) ; #DEBUG_LINE_NO:1135
  ElseIf Self.GetStageDone(1820) ; #DEBUG_LINE_NO:1138
    Self.SetStage(1832) ; #DEBUG_LINE_NO:1139
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(8900) ; #DEBUG_LINE_NO:1143
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8830_Item_00()
  If Self.GetStageDone(1620) ; #DEBUG_LINE_NO:1155
    Self.SetStage(1632) ; #DEBUG_LINE_NO:1157
  ElseIf Self.GetStageDone(1720) ; #DEBUG_LINE_NO:1158
    Self.SetStage(1730) ; #DEBUG_LINE_NO:1159
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(8900) ; #DEBUG_LINE_NO:1161
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8840_Item_00()
  If !Self.GetStageDone(1300) ; #DEBUG_LINE_NO:1171
    Self.SetStage(8900) ; #DEBUG_LINE_NO:1172
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:1181
  Self.Stop() ; #DEBUG_LINE_NO:1183
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:1191
EndFunction
