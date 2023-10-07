ScriptName Fragments:Quests:QF_SG02_001E7332 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SG02_0100_DistressCall Auto Const mandatory
ReferenceAlias Property Alias_AlbanLopez Auto Const mandatory
ReferenceAlias Property Alias_AlbanMarker Auto Const mandatory
Scene Property SG02_0300_FixedAlbanSatellite Auto Const mandatory
ReferenceAlias Property Alias_WenSatellite Auto Const mandatory
ReferenceAlias Property Alias_LemaireSatellite Auto Const mandatory
ReferenceAlias Property Alias_BandaSatellite Auto Const mandatory
ReferenceAlias Property Alias_AlbanSatellite Auto Const mandatory
Scene Property SG02_0400_FixedLemaireSatellite Auto Const mandatory
Scene Property SG02_0500_FixedBandaSatellite Auto Const mandatory
Scene Property SG02_0600_FixedWenSatellite Auto Const mandatory
ReferenceAlias Property Alias_LemaireCaptainMarker Auto Const mandatory
ReferenceAlias Property Alias_ChandaBanda Auto Const mandatory
ReferenceAlias Property Alias_JacquelynLemaire Auto Const mandatory
Scene Property SG02_0775_ApproachOverhear Auto Const mandatory
RefCollectionAlias Property Alias_Spacers01 Auto Const mandatory
RefCollectionAlias Property Alias_Spacers02 Auto Const mandatory
RefCollectionAlias Property Alias_SpacerContact01Group Auto Const mandatory
RefCollectionAlias Property Alias_SpacerContact02Group Auto Const mandatory
ReferenceAlias Property Alias_ChandaMarker Auto Const mandatory
ReferenceAlias Property Alias_JackieMarker Auto Const mandatory
Keyword Property SG02FamilyShipMeetupKeyword Auto Const mandatory
RefCollectionAlias Property Alias_Spacers01_Allies Auto Const mandatory
RefCollectionAlias Property Alias_Spacers02_Allies Auto Const mandatory
LocationRefType Property AutofillGeneric03 Auto Const mandatory
RefCollectionAlias Property Alias_SpacersStation_Allies Auto Const mandatory
LocationRefType Property AutofillGeneric04 Auto Const mandatory
RefCollectionAlias Property Alias_SpacersStation Auto Const mandatory
Keyword Property SG02FinaleKeyword Auto Const mandatory
Scene Property SG02_1210_JackieBark Auto Const mandatory
Scene Property SG02_1500a_ChandaJackieConflict Auto Const mandatory
LocationAlias Property Alias_AlbanFarmLocation Auto Const mandatory
RefCollectionAlias Property Alias_AlbanSatelliteEnemies Auto Const mandatory
RefCollectionAlias Property Alias_BandaSatelliteEnemies Auto Const mandatory
RefCollectionAlias Property Alias_LemaireSatelliteEnemies Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Alban Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Banda Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Lemaire Auto Const mandatory
ReferenceAlias Property Alias_SatelliteMapMarker_Wen Auto Const mandatory
ReferenceAlias Property Alias_MapMarker_Rendezvous Auto Const mandatory
ReferenceAlias Property Alias_SpacersStation_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Spacers02_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Spacers01_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_LemaireShip Auto Const mandatory
ReferenceAlias Property Alias_LemaireShipMarker Auto Const mandatory
ReferenceAlias Property Alias_Starstation Auto Const mandatory
ReferenceAlias Property Alias_StarstationPlacementMarker Auto Const mandatory
ActorValue Property SG02_ForeknowledgeAV Auto Const mandatory
Scene Property SG02_Reaction_1175_Reinforcements Auto Const mandatory
Scene Property SG02_Reaction_1200_StationShipsKilled Auto Const mandatory
Scene Property SG02_Reaction_1010_Spacers01Killed Auto Const mandatory
Scene Property SG02_Reaction_1020_Spacers02Killed Auto Const mandatory
Quest Property SG02_AlbanFarmDialogue Auto Const mandatory
Quest Property SG02_AlbanFarm Auto Const mandatory
ReferenceAlias Property Alias_LemaireStationMarker Auto Const mandatory
ReferenceAlias Property Alias_BandaStationMarker Auto Const mandatory
ReferenceAlias Property Alias_AlbanStationMarker Auto Const mandatory
Keyword Property LinkCustom09 Auto Const mandatory
wwiseevent Property QST_SG02_SatelliteRepair Auto Const mandatory
RefCollectionAlias Property Alias_StationNPCs_Settlers Auto Const mandatory
Faction Property SG02_PlayerAllyFaction Auto Const mandatory
ReferenceAlias Property Alias_AlbanInitialMarker Auto Const mandatory
RefCollectionAlias Property Alias_StationSpacers_Group02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
RefCollectionAlias Property Alias_InteriorEnemiesUpperFloor Auto Const mandatory
ReferenceAlias Property Alias_AlbanFightMarker Auto Const mandatory
ReferenceAlias Property Alias_BandaFightMarker Auto Const mandatory
ReferenceAlias Property Alias_JackieFightMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1210_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor AlACT = Alias_AlbanLopez.GetActorRef() ; #DEBUG_LINE_NO:8
  ObjectReference AlMarker = Alias_AlbanInitialMarker.GetRef() ; #DEBUG_LINE_NO:9
  AlACT.MoveTo(AlMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Self.SetStage(100) ; #DEBUG_LINE_NO:13
  Alias_Spacers01_MapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:16
  Alias_Spacers02_MapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:17
  Alias_SpacersStation_MapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:18
  Alias_SatelliteMapMarker_Alban.GetRef().Disable(False) ; #DEBUG_LINE_NO:19
  Alias_SatelliteMapMarker_Banda.GetRef().Disable(False) ; #DEBUG_LINE_NO:20
  Alias_SatelliteMapMarker_Lemaire.GetRef().Disable(False) ; #DEBUG_LINE_NO:21
  Alias_SatelliteMapMarker_Wen.GetRef().Disable(False) ; #DEBUG_LINE_NO:22
  Alias_MapMarker_Rendezvous.GetRef().Disable(False) ; #DEBUG_LINE_NO:23
  Alias_LemaireShip.GetRef().MoveTo(Alias_LemaireShipMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
  SG02_AlbanFarmDialogue.Start() ; #DEBUG_LINE_NO:29
  SG02_AlbanFarm.Start() ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_WenSatellite.RefillAlias() ; #DEBUG_LINE_NO:38
  Alias_AlbanMarker.RefillAlias() ; #DEBUG_LINE_NO:39
  Alias_ChandaMarker.RefillAlias() ; #DEBUG_LINE_NO:40
  Alias_JackieMarker.RefillAlias() ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0004_Item_00()
  SG02_0775_ApproachOverhear.Stop() ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:65
  Game.GetPlayer().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:74
  SG02_0100_DistressCall.Start() ; #DEBUG_LINE_NO:77
  Alias_AlbanFarmLocation.GetLocation().SetExplored(True) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0125_Item_00()
  SG02_0100_DistressCall.Stop() ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:98
  Alias_BandaSatellite.RefillAlias() ; #DEBUG_LINE_NO:101
  Alias_LemaireSatellite.RefillAlias() ; #DEBUG_LINE_NO:102
  Alias_WenSatellite.RefillAlias() ; #DEBUG_LINE_NO:103
  Alias_AlbanSatellite.RefillAlias() ; #DEBUG_LINE_NO:104
  Alias_AlbanSatelliteEnemies.EnableAll(False) ; #DEBUG_LINE_NO:107
  Alias_BandaSatelliteEnemies.EnableAll(False) ; #DEBUG_LINE_NO:108
  Alias_SatelliteMapMarker_Alban.GetRef().Enable(False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:120
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:121
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:122
  Alias_AlbanSatellite.GetRef().ClearDestruction() ; #DEBUG_LINE_NO:125
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:126
  Alias_AlbanSatellite.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:129
  SG02_0300_FixedAlbanSatellite.Start() ; #DEBUG_LINE_NO:132
  Alias_SatelliteMapMarker_Banda.GetRef().Enable(False) ; #DEBUG_LINE_NO:135
  Alias_SatelliteMapMarker_Lemaire.GetRef().Enable(False) ; #DEBUG_LINE_NO:136
  Alias_SatelliteMapMarker_Wen.GetRef().Enable(False) ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0400_Item_00()
  SG02_0500_FixedBandaSatellite.Stop() ; #DEBUG_LINE_NO:145
  SG02_0600_FixedWenSatellite.Stop() ; #DEBUG_LINE_NO:146
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:148
  Alias_LemaireSatellite.GetRef().ClearDestruction() ; #DEBUG_LINE_NO:151
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:152
  Alias_LemaireSatellite.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:155
  If Self.GetStageDone(500) && Self.GetStageDone(600) ; #DEBUG_LINE_NO:158
    Self.SetStage(700) ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  SG02_0400_FixedLemaireSatellite.Start() ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0425_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:172
  While I < Alias_LemaireSatelliteEnemies.GetCount() ; #DEBUG_LINE_NO:173
    ObjectReference theRef = Alias_LemaireSatelliteEnemies.GetAt(I) ; #DEBUG_LINE_NO:174
    If theRef ; #DEBUG_LINE_NO:175
      (theRef as spaceshipreference).EnableWithGravJump() ; #DEBUG_LINE_NO:176
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:178
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  SG02_0400_FixedLemaireSatellite.Stop() ; #DEBUG_LINE_NO:187
  SG02_0600_FixedWenSatellite.Stop() ; #DEBUG_LINE_NO:188
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:190
  Alias_BandaSatellite.GetRef().ClearDestruction() ; #DEBUG_LINE_NO:193
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:194
  Alias_BandaSatellite.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:197
  If Self.GetStageDone(400) && Self.GetStageDone(600) ; #DEBUG_LINE_NO:200
    Self.SetStage(700) ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  SG02_0500_FixedBandaSatellite.Start() ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0600_Item_00()
  SG02_0400_FixedLemaireSatellite.Stop() ; #DEBUG_LINE_NO:213
  SG02_0500_FixedBandaSatellite.Stop() ; #DEBUG_LINE_NO:214
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:216
  Alias_WenSatellite.GetRef().ClearDestruction() ; #DEBUG_LINE_NO:219
  QST_SG02_SatelliteRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:220
  Alias_WenSatellite.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:223
  If Self.GetStageDone(400) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:226
    Self.SetStage(700) ; #DEBUG_LINE_NO:227
  EndIf ; #DEBUG_LINE_NO:
  SG02_0600_FixedWenSatellite.Start() ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:239
  ObjectReference oTarg = Alias_AlbanLopez.GetRef() ; #DEBUG_LINE_NO:242
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:243
  oTarg = Alias_ChandaBanda.GetRef() ; #DEBUG_LINE_NO:244
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:245
  oTarg = Alias_JacquelynLemaire.GetRef() ; #DEBUG_LINE_NO:246
  oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:247
  Alias_MapMarker_Rendezvous.GetRef().Enable(False) ; #DEBUG_LINE_NO:250
EndFunction

Function Fragment_Stage_0775_Item_00()
  SG02_0775_ApproachOverhear.Start() ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(780, True, False) ; #DEBUG_LINE_NO:262
  Self.SetObjectiveDisplayed(700, False, False) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0780_Item_00()
  Self.SetObjectiveCompleted(780, True) ; #DEBUG_LINE_NO:272
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:273
  Alias_ChandaBanda.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:276
  Alias_JacquelynLemaire.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0800_Item_00()
  Actor ChandaACT = Alias_ChandaBanda.GetActorRef() ; #DEBUG_LINE_NO:285
  Actor JackyACT = Alias_JacquelynLemaire.GetActorRef() ; #DEBUG_LINE_NO:286
  ChandaACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:287
  JackyACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:290
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:291
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0825_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:300
  Self.SetObjectiveDisplayed(875, True, False) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:309
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !Self.GetStageDone(850) ; #DEBUG_LINE_NO:318
    Self.SetObjectiveDisplayed(850, False, False) ; #DEBUG_LINE_NO:319
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(875, True) ; #DEBUG_LINE_NO:322
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:323
  Self.SetObjectiveDisplayed(950, True, False) ; #DEBUG_LINE_NO:324
  Alias_SpacerContact01Group.RefillAlias() ; #DEBUG_LINE_NO:327
  Alias_Spacers01.RefillAlias() ; #DEBUG_LINE_NO:328
  Alias_SpacerContact02Group.RefillAlias() ; #DEBUG_LINE_NO:329
  Alias_Spacers02.RefillAlias() ; #DEBUG_LINE_NO:330
  Alias_Spacers01_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:333
  Alias_Spacers02_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_0910_Item_00()
  Self.SetObjectiveFailed(850, True) ; #DEBUG_LINE_NO:342
EndFunction

Function Fragment_Stage_0930_Item_00()
  Self.SetStage(850) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:366
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:367
  Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:370
  Alias_ChandaBanda.GetRef().MoveTo(Alias_ChandaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:371
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:374
    Alias_JacquelynLemaire.GetRef().MoveTo(Alias_JackieMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:375
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1005_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:386
  If !Self.GetStageDone(950) ; #DEBUG_LINE_NO:388
    I = 99 ; #DEBUG_LINE_NO:389
  EndIf ; #DEBUG_LINE_NO:
  Bool bLemaire = Self.GetStageDone(850) ; #DEBUG_LINE_NO:393
  While I < Alias_Spacers01_Allies.GetCount() ; #DEBUG_LINE_NO:395
    spaceshipreference theRef = Alias_Spacers01_Allies.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:396
    If theRef ; #DEBUG_LINE_NO:397
      If bLemaire || !theRef.HasLocRefType(AutofillGeneric03) ; #DEBUG_LINE_NO:400
        theRef.EnableWithGravJump() ; #DEBUG_LINE_NO:401
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:404
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1010_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:413
  If Self.GetStageDone(1020) ; #DEBUG_LINE_NO:416
    Self.SetStage(1000) ; #DEBUG_LINE_NO:417
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(950) && Alias_Spacers01_Allies.GetCount() > 0 ; #DEBUG_LINE_NO:421
    SG02_Reaction_1010_Spacers01Killed.Start() ; #DEBUG_LINE_NO:422
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1015_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:433
  If !Self.GetStageDone(950) ; #DEBUG_LINE_NO:435
    I = 99 ; #DEBUG_LINE_NO:436
  EndIf ; #DEBUG_LINE_NO:
  Bool bLemaire = Self.GetStageDone(850) ; #DEBUG_LINE_NO:440
  While I < Alias_Spacers02_Allies.GetCount() ; #DEBUG_LINE_NO:442
    spaceshipreference theRef = Alias_Spacers02_Allies.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:443
    If theRef ; #DEBUG_LINE_NO:444
      If bLemaire || !theRef.HasLocRefType(AutofillGeneric03) ; #DEBUG_LINE_NO:447
        theRef.EnableWithGravJump() ; #DEBUG_LINE_NO:448
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:451
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1020_Item_00()
  Self.SetObjectiveCompleted(950, True) ; #DEBUG_LINE_NO:460
  If Self.GetStageDone(1010) ; #DEBUG_LINE_NO:463
    Self.SetStage(1000) ; #DEBUG_LINE_NO:464
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(950) && Alias_Spacers02_Allies.GetCount() > 0 ; #DEBUG_LINE_NO:468
    SG02_Reaction_1020_Spacers02Killed.Start() ; #DEBUG_LINE_NO:469
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:478
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:479
  (Alias_Starstation.GetRef() as spaceshipreference).SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:482
  Alias_SpacersStation_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:485
EndFunction

Function Fragment_Stage_1150_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:494
  Bool bLemaire = Self.GetStageDone(850) ; #DEBUG_LINE_NO:497
  Bool bNoReserves = Self.GetStageDone(950) ; #DEBUG_LINE_NO:499
  Bool bEnable = False ; #DEBUG_LINE_NO:500
  While I < Alias_SpacersStation_Allies.GetCount() ; #DEBUG_LINE_NO:502
    spaceshipreference theRef = Alias_SpacersStation_Allies.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:503
    If theRef ; #DEBUG_LINE_NO:504
      bEnable = True ; #DEBUG_LINE_NO:505
      If !bLemaire && theRef.HasLocRefType(AutofillGeneric03) ; #DEBUG_LINE_NO:507
        bEnable = False ; #DEBUG_LINE_NO:508
      EndIf ; #DEBUG_LINE_NO:
      If bNoReserves && theRef.HasLocRefType(AutofillGeneric04) ; #DEBUG_LINE_NO:512
        bEnable = False ; #DEBUG_LINE_NO:513
      EndIf ; #DEBUG_LINE_NO:
      If bEnable ; #DEBUG_LINE_NO:516
        theRef.EnableWithGravJump() ; #DEBUG_LINE_NO:517
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:521
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1175_Item_00()
  SG02_Reaction_1175_Reinforcements.Start() ; #DEBUG_LINE_NO:536
  Int I = 0 ; #DEBUG_LINE_NO:539
  While I <= Alias_StationSpacers_Group02.GetCount() ; #DEBUG_LINE_NO:541
    spaceshipreference theRef = Alias_SpacersStation.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:542
    If theRef ; #DEBUG_LINE_NO:543
      If !theRef.IsEnabled() ; #DEBUG_LINE_NO:544
        theRef.EnableWithGravJump() ; #DEBUG_LINE_NO:545
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:548
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:557
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:558
  SG02_Reaction_1200_StationShipsKilled.Start() ; #DEBUG_LINE_NO:561
  Actor oTarg = Alias_AlbanLopez.GetActorRef() ; #DEBUG_LINE_NO:564
  oTarg.MoveTo(Alias_AlbanFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:565
  oTarg = Alias_ChandaBanda.GetActorRef() ; #DEBUG_LINE_NO:566
  oTarg.MoveTo(Alias_BandaFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:567
  oTarg.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:568
  oTarg = Alias_AlbanLopez.GetActorRef() ; #DEBUG_LINE_NO:571
  oTarg.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:572
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:575
    oTarg = Alias_JacquelynLemaire.GetActorRef() ; #DEBUG_LINE_NO:576
    oTarg.MoveTo(Alias_JackieFightMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:577
    oTarg.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:578
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:589
  Int iCount = Alias_StationNPCs_Settlers.GetCount() ; #DEBUG_LINE_NO:590
  While I < iCount ; #DEBUG_LINE_NO:592
    Actor currAct = Alias_StationNPCs_Settlers.GetAt(I) as Actor ; #DEBUG_LINE_NO:593
    currAct.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:594
    I += 1 ; #DEBUG_LINE_NO:596
  EndWhile ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddtoFaction(SG02_PlayerAllyFaction) ; #DEBUG_LINE_NO:599
  (Alias_Starstation.GetRef() as spaceshipreference).SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:602
EndFunction

Function Fragment_Stage_1220_Item_00()
  Self.SetStage(1240) ; #DEBUG_LINE_NO:624
EndFunction

Function Fragment_Stage_1230_Item_00()
  Self.SetStage(1240) ; #DEBUG_LINE_NO:633
  Self.SetObjectiveDisplayed(1250, True, False) ; #DEBUG_LINE_NO:635
  Alias_AlbanLopez.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:638
EndFunction

Function Fragment_Stage_1240_Item_00()
  Self.SetObjectiveCompleted(1210, True) ; #DEBUG_LINE_NO:646
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveCompleted(1250, True) ; #DEBUG_LINE_NO:654
EndFunction

Function Fragment_Stage_1300_Item_00()
  Game.GetPlayer().RemoveFromFaction(SG02_PlayerAllyFaction) ; #DEBUG_LINE_NO:662
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:664
  If Self.GetStageDone(1250) ; #DEBUG_LINE_NO:666
    Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:667
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:669
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1230) && !Self.GetStageDone(1250) ; #DEBUG_LINE_NO:673
    Alias_AlbanLopez.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:675
    Self.SetObjectiveDisplayed(1250, False, False) ; #DEBUG_LINE_NO:676
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference oTarg = Alias_AlbanLopez.GetRef() ; #DEBUG_LINE_NO:680
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:681
  oTarg = Alias_ChandaBanda.GetRef() ; #DEBUG_LINE_NO:682
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:683
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:686
    oTarg = Alias_JacquelynLemaire.GetRef() ; #DEBUG_LINE_NO:687
    oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:688
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:697
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:707
  SG02_1500a_ChandaJackieConflict.Start() ; #DEBUG_LINE_NO:710
EndFunction

Function Fragment_Stage_9000_Item_00()
  If Self.GetStageDone(1400) ; #DEBUG_LINE_NO:721
    Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:722
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(SG02_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:726
  Self.Stop() ; #DEBUG_LINE_NO:728
EndFunction
