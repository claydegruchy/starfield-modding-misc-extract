ScriptName Fragments:Quests:QF_MS06_00258694 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
Book Property MS06_ConstantSchematics Auto Const mandatory
ReferenceAlias Property Alias_Diana Auto Const mandatory
ReferenceAlias Property Alias_Bomani Auto Const mandatory
ReferenceAlias Property Alias_Mabhuti Auto Const mandatory
ReferenceAlias Property Alias_Colonist01 Auto Const mandatory
ReferenceAlias Property Alias_Colonist02 Auto Const mandatory
ReferenceAlias Property Alias_Colonist03 Auto Const mandatory
ReferenceAlias Property Alias_DianaInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_BomaniInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_MabhutiInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist01InitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist02InitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist03InitParadisoMarker Auto Const mandatory
Scene Property MS06_1610_FerryLandingScene Auto Const mandatory
Book Property MS06_GravDriveManual Auto Const mandatory
ReferenceAlias Property Alias_ConstantSchematics Auto Const mandatory
ReferenceAlias Property Alias_GravDriveManual Auto Const mandatory
Book Property MS06_ResourceList_Slate Auto Const mandatory
Quest Property MS06Intro Auto Const mandatory
RefCollectionAlias Property Alias_SecurityGuards Auto Const mandatory
RefCollectionAlias Property Alias_SecurityGuardsHostile Auto Const mandatory
ReferenceAlias Property Alias_Amin Auto Const mandatory
Topic Property MS06_2400_Amin_AllSetTopic Auto Const mandatory
ReferenceAlias Property Alias_Oliver Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
ReferenceAlias Property Alias_OrbitMapMarker Auto Const mandatory
ActorValue Property MS06_ECSForeknowledgeAV Auto Const mandatory
ActorValue Property MS06_EndForeknowledgeAV Auto Const mandatory
Message Property MS06_ECSConstantOrbitalNameMSG Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantName Auto Const mandatory
Keyword Property MapMarkerLinkedRefNameOverride Auto Const mandatory
ReferenceAlias Property Alias_PorrimaIIOrbitName Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
Faction Property CrimeFactionECSConstant Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
ReferenceAlias Property Alias_StorageRoomCombatMarker Auto Const mandatory
RefCollectionAlias Property Alias_Lights Auto Const mandatory
ReferenceAlias Property Alias_KlaxonSoundMarker Auto Const mandatory
Quest Property DialogueECSConstantRoaming Auto Const mandatory
RefCollectionAlias Property Alias_Klaxons Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
Faction Property ECSConstantSecurityFaction Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
LocationAlias Property Alias_ECSConstant Auto Const mandatory
ReferenceAlias Property Alias_PassengerFailsafeMarker Auto Const mandatory
ReferenceAlias[] Property PassengerArray Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:8
  Self.SetStage(200) ; #DEBUG_LINE_NO:9
  Self.SetStage(300) ; #DEBUG_LINE_NO:10
  Self.SetStage(400) ; #DEBUG_LINE_NO:11
  Self.SetStage(500) ; #DEBUG_LINE_NO:12
  Self.SetStage(600) ; #DEBUG_LINE_NO:13
  Self.SetStage(700) ; #DEBUG_LINE_NO:14
  DialogueECSConstant.SetStage(1) ; #DEBUG_LINE_NO:17
  DialogueECSConstant.SetStage(100) ; #DEBUG_LINE_NO:18
  DialogueECSConstant.SetStage(110) ; #DEBUG_LINE_NO:19
  MS06Intro.Stop() ; #DEBUG_LINE_NO:22
  Game.GetPlayer().MoveTo(Alias_Oliver.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:33
  kmyQuest.DebugGiveResources() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(1605) ; #DEBUG_LINE_NO:44
  Alias_Diana.GetRef().MoveTo(Alias_DianaInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  Alias_Bomani.GetRef().MoveTo(Alias_BomaniInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:46
  Alias_Mabhuti.GetRef().MoveTo(Alias_MabhutiInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:47
  Alias_Colonist01.GetRef().MoveTo(Alias_Colonist01InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
  Alias_Colonist02.GetRef().MoveTo(Alias_Colonist02InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  Alias_Colonist03.GetRef().MoveTo(Alias_Colonist03InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:51
  Self.SetStage(1610) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0100_Item_00()
  If DialogueECSConstant.GetStageDone(110) ; #DEBUG_LINE_NO:60
    Self.SetStage(500) ; #DEBUG_LINE_NO:61
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0106_Item_00()
  Self.SetStage(101) ; #DEBUG_LINE_NO:72
  Self.SetStage(102) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:90
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:103
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:106
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:118
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:119
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:132
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:135
  Alias_ECSConstantShip.GetRef().SetOverrideName(None) ; #DEBUG_LINE_NO:138
  Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_ECSConstantName.GetRef(), MapMarkerLinkedRefNameOverride, True) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:147
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0605_Item_00()
  Game.GetPlayer().SetValue(MS06_ECSForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:156
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:160
    Self.SetStage(700) ; #DEBUG_LINE_NO:161
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(650) ; #DEBUG_LINE_NO:163
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:172
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:174
    Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:175
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetObjectiveDisplayed(690, True, False) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0691_Item_00()
  Self.SetObjectiveCompleted(690, True) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:200
  If Self.GetStageDone(650) ; #DEBUG_LINE_NO:202
    Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:203
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:206
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().AddItem(MS06_ResourceList_Slate as Form, 1, False) ; #DEBUG_LINE_NO:214
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:215
  Self.SetObjectiveDisplayed(999, True, False) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_PorrimaIIOrbitName.GetRef(), MapMarkerLinkedRefNameOverride, True) ; #DEBUG_LINE_NO:225
  If Self.GetStageDone(1710) || Self.GetStageDone(2410) ; #DEBUG_LINE_NO:227
    DialogueECSConstantRoaming.Start() ; #DEBUG_LINE_NO:228
  EndIf ; #DEBUG_LINE_NO:
  MS06Intro.SetStage(1000) ; #DEBUG_LINE_NO:233
  Game.GetPlayer().SetValue(MS06_EndForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:243
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:244
  Self.SetObjectiveCompleted(999, True) ; #DEBUG_LINE_NO:247
  Self.SetObjectiveDisplayed(1010, True, False) ; #DEBUG_LINE_NO:248
  Self.SetObjectiveDisplayed(1020, True, False) ; #DEBUG_LINE_NO:249
  Self.SetObjectiveDisplayed(1030, True, False) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveDisplayed(1040, True, False) ; #DEBUG_LINE_NO:251
  kmyQuest.RegisterPlayerforInventoryFilter() ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveDisplayed(1050, True, False) ; #DEBUG_LINE_NO:260
EndFunction

Function Fragment_Stage_1060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:268
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:269
  Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:272
  kmyQuest.ConstantGiveResources() ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_1070_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:281
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:282
  Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:285
  kmyQuest.ConstantGiveGoods() ; #DEBUG_LINE_NO:286
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:294
  Self.SetObjectiveCompleted(1010, True) ; #DEBUG_LINE_NO:295
  Self.SetObjectiveCompleted(1020, True) ; #DEBUG_LINE_NO:296
  Self.SetObjectiveCompleted(1030, True) ; #DEBUG_LINE_NO:297
  Self.SetObjectiveCompleted(1040, True) ; #DEBUG_LINE_NO:298
  Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:299
EndFunction

Function Fragment_Stage_1600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:307
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:308
  Self.SetObjectiveCompleted(1500, True) ; #DEBUG_LINE_NO:311
  Self.SetObjectiveDisplayed(1600, True, False) ; #DEBUG_LINE_NO:312
  DialogueECSConstant.SetStage(1600) ; #DEBUG_LINE_NO:314
  kmyQuest.AddPassenger(Alias_Diana) ; #DEBUG_LINE_NO:316
  kmyQuest.AddPassenger(Alias_Bomani) ; #DEBUG_LINE_NO:317
  kmyQuest.AddPassenger(Alias_Mabhuti) ; #DEBUG_LINE_NO:318
  kmyQuest.AddPassenger(Alias_Colonist01) ; #DEBUG_LINE_NO:319
  kmyQuest.AddPassenger(Alias_Colonist02) ; #DEBUG_LINE_NO:320
  kmyQuest.AddPassenger(Alias_Colonist03) ; #DEBUG_LINE_NO:321
EndFunction

Function Fragment_Stage_1600_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:329
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:330
  kmyQuest.RemoveResources() ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_1601_Item_00()
  Alias_Passengers.RemoveFromFaction(ECSConstantSecurityFaction) ; #DEBUG_LINE_NO:342
  Alias_Passengers.RemoveFromFaction(CrimeFactionECSConstant) ; #DEBUG_LINE_NO:343
  Alias_Passengers.AddToFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:344
  Alias_Passengers.AddToFaction(ParadisoFaction) ; #DEBUG_LINE_NO:345
  Int I = 0 ; #DEBUG_LINE_NO:347
  Int iCount = Alias_Passengers.GetCount() ; #DEBUG_LINE_NO:348
  While I < iCount ; #DEBUG_LINE_NO:349
    Actor myPassenger = Alias_Passengers.GetAt(I) as Actor ; #DEBUG_LINE_NO:350
    myPassenger.SetCrimeFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:351
    myPassenger.SetGhost(True) ; #DEBUG_LINE_NO:352
    I += 1 ; #DEBUG_LINE_NO:353
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:362
  Self.SetObjectiveDisplayed(1605, True, False) ; #DEBUG_LINE_NO:363
  Int I = 0 ; #DEBUG_LINE_NO:365
  Int iCount = Alias_Passengers.GetCount() ; #DEBUG_LINE_NO:366
  While I < iCount ; #DEBUG_LINE_NO:367
    Actor myPassenger = Alias_Passengers.GetAt(I) as Actor ; #DEBUG_LINE_NO:368
    myPassenger.SetGhost(False) ; #DEBUG_LINE_NO:369
    I += 1 ; #DEBUG_LINE_NO:370
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1610_Item_00()
  MS06_1610_FerryLandingScene.Start() ; #DEBUG_LINE_NO:379
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveCompleted(1605, True) ; #DEBUG_LINE_NO:387
  Self.SetObjectiveDisplayed(1700, True, False) ; #DEBUG_LINE_NO:388
EndFunction

Function Fragment_Stage_1710_Item_00()
  Self.SetObjectiveCompleted(1700, True) ; #DEBUG_LINE_NO:396
  If Self.IsObjectiveDisplayed(3100) ; #DEBUG_LINE_NO:400
    Self.SetObjectiveCompleted(3100, True) ; #DEBUG_LINE_NO:401
  EndIf ; #DEBUG_LINE_NO:
  ECS_EndState.SetValue(1.0) ; #DEBUG_LINE_NO:404
  DialogueParadiso.SetStage(2000) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_1711_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:413
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:422
  Self.SetObjectiveDisplayed(2000, True, False) ; #DEBUG_LINE_NO:423
EndFunction

Function Fragment_Stage_2100_Item_00()
  Self.SetObjectiveCompleted(2000, True) ; #DEBUG_LINE_NO:431
  Self.SetObjectiveDisplayed(2100, True, False) ; #DEBUG_LINE_NO:432
EndFunction

Function Fragment_Stage_2111_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:440
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:441
  kmyQuest.RemoveCredits(True) ; #DEBUG_LINE_NO:444
EndFunction

Function Fragment_Stage_2121_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:452
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:453
  kmyQuest.RemoveCredits(False) ; #DEBUG_LINE_NO:456
EndFunction

Function Fragment_Stage_2200_Item_00()
  Self.SetObjectiveCompleted(2100, True) ; #DEBUG_LINE_NO:464
  Self.SetObjectiveDisplayed(2200, True, False) ; #DEBUG_LINE_NO:465
  Game.GetPlayer().AddItem(Alias_GravDriveManual.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:466
EndFunction

Function Fragment_Stage_2300_Item_00()
  Self.SetObjectiveCompleted(2200, True) ; #DEBUG_LINE_NO:474
  Self.SetObjectiveDisplayed(2300, True, False) ; #DEBUG_LINE_NO:475
EndFunction

Function Fragment_Stage_2400_Item_00()
  Alias_Amin.GetRef().Say(MS06_2400_Amin_AllSetTopic, None, False, None) ; #DEBUG_LINE_NO:483
  Self.SetObjectiveCompleted(2300, True) ; #DEBUG_LINE_NO:484
  Self.SetObjectiveDisplayed(2400, True, False) ; #DEBUG_LINE_NO:485
EndFunction

Function Fragment_Stage_2410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:493
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:494
  Self.SetObjectiveCompleted(2400, True) ; #DEBUG_LINE_NO:497
  If Self.IsObjectiveDisplayed(3100) ; #DEBUG_LINE_NO:501
    Self.SetObjectiveCompleted(3100, True) ; #DEBUG_LINE_NO:502
  EndIf ; #DEBUG_LINE_NO:
  ECS_EndState.SetValue(2.0) ; #DEBUG_LINE_NO:505
  DialogueECSConstant.SetStage(2000) ; #DEBUG_LINE_NO:508
EndFunction

Function Fragment_Stage_2411_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_3100_Item_00()
  Self.SetObjectiveDisplayed(3100, True, False) ; #DEBUG_LINE_NO:524
EndFunction

Function Fragment_Stage_3150_Item_00()
  Self.SetObjectiveCompleted(3100, True) ; #DEBUG_LINE_NO:532
  Self.SetObjectiveDisplayed(3150, True, False) ; #DEBUG_LINE_NO:533
EndFunction

Function Fragment_Stage_3200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:541
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:542
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:545
  Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:546
  Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:547
  Self.SetObjectiveFailed(400, True) ; #DEBUG_LINE_NO:548
  Self.SetObjectiveFailed(500, True) ; #DEBUG_LINE_NO:549
  Self.SetObjectiveFailed(600, True) ; #DEBUG_LINE_NO:550
  Self.SetObjectiveFailed(650, True) ; #DEBUG_LINE_NO:551
  Self.SetObjectiveFailed(700, True) ; #DEBUG_LINE_NO:552
  Self.SetObjectiveFailed(999, True) ; #DEBUG_LINE_NO:553
  Self.SetObjectiveFailed(1010, True) ; #DEBUG_LINE_NO:554
  Self.SetObjectiveFailed(1020, True) ; #DEBUG_LINE_NO:555
  Self.SetObjectiveFailed(1030, True) ; #DEBUG_LINE_NO:556
  Self.SetObjectiveFailed(1040, True) ; #DEBUG_LINE_NO:557
  Self.SetObjectiveFailed(1050, True) ; #DEBUG_LINE_NO:558
  Self.SetObjectiveFailed(1500, True) ; #DEBUG_LINE_NO:559
  Self.SetObjectiveFailed(1600, True) ; #DEBUG_LINE_NO:560
  Self.SetObjectiveFailed(1700, True) ; #DEBUG_LINE_NO:561
  Self.SetObjectiveFailed(2000, True) ; #DEBUG_LINE_NO:562
  Self.SetObjectiveFailed(2100, True) ; #DEBUG_LINE_NO:563
  Self.SetObjectiveFailed(2200, True) ; #DEBUG_LINE_NO:564
  Self.SetObjectiveFailed(2300, True) ; #DEBUG_LINE_NO:565
  Self.SetObjectiveFailed(2400, True) ; #DEBUG_LINE_NO:566
  Self.SetObjectiveCompleted(3150, True) ; #DEBUG_LINE_NO:567
  Self.SetObjectiveDisplayed(3200, True, False) ; #DEBUG_LINE_NO:568
  kmyQuest.SetECSConstantSelfDestruct() ; #DEBUG_LINE_NO:572
  Alias_StorageRoomCombatMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:574
  Alias_SecurityGuards.RemoveFromFaction(GuardFaction) ; #DEBUG_LINE_NO:576
  Alias_SecurityGuardsHostile.AddRefCollection(Alias_SecurityGuards) ; #DEBUG_LINE_NO:577
EndFunction

Function Fragment_Stage_3200_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:585
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:586
  Int I = 0 ; #DEBUG_LINE_NO:589
  Int iCount = PassengerArray.Length ; #DEBUG_LINE_NO:590
  Location myECSLocation = Alias_ECSConstant.GetLocation() ; #DEBUG_LINE_NO:591
  While I < iCount ; #DEBUG_LINE_NO:592
    Actor myPassenger = PassengerArray[I].GetActorRef() ; #DEBUG_LINE_NO:593
    kmyQuest.RemovePassengerActor(myPassenger) ; #DEBUG_LINE_NO:594
    ObjectReference myFailsafeMarker = Alias_PassengerFailsafeMarker.GetRef() ; #DEBUG_LINE_NO:595
    If !myPassenger.IsInLocation(myECSLocation) ; #DEBUG_LINE_NO:596
      myPassenger.MoveTo(myFailsafeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:597
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:599
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_3250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:616
  ms06_questscript kmyQuest = __temp as ms06_questscript ; #DEBUG_LINE_NO:617
  kmyQuest.ECSConstantExplode() ; #DEBUG_LINE_NO:620
EndFunction

Function Fragment_Stage_3300_Item_00()
  Self.SetObjectiveCompleted(3200, True) ; #DEBUG_LINE_NO:628
  Self.SetObjectiveDisplayed(3300, True, False) ; #DEBUG_LINE_NO:629
EndFunction

Function Fragment_Stage_3300_Item_01()
  Self.SetObjectiveCompleted(3200, True) ; #DEBUG_LINE_NO:637
  Self.SetStage(3330) ; #DEBUG_LINE_NO:638
EndFunction

Function Fragment_Stage_3310_Item_00()
  Self.SetObjectiveCompleted(3300, True) ; #DEBUG_LINE_NO:646
  ECS_EndState.SetValue(3.0) ; #DEBUG_LINE_NO:647
  PD_Hotel_RoomCost_Daily.SetValue(0.0) ; #DEBUG_LINE_NO:650
  PD_Hotel_RoomCost_Weekly.SetValue(0.0) ; #DEBUG_LINE_NO:651
EndFunction

Function Fragment_Stage_3311_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:659
EndFunction

Function Fragment_Stage_3320_Item_00()
  Self.SetObjectiveCompleted(3300, True) ; #DEBUG_LINE_NO:667
EndFunction

Function Fragment_Stage_3321_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:675
EndFunction

Function Fragment_Stage_3330_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:683
EndFunction

Function Fragment_Stage_3331_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:691
EndFunction
