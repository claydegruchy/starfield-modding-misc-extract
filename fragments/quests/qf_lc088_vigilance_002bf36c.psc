ScriptName Fragments:Quests:QF_LC088_Vigilance_002BF36C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF_Post Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SpeechChallenge_Kibwe Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Rokov_Ally01 Auto Const mandatory
ReferenceAlias Property Alias_Rokov_Ally02 Auto Const mandatory
ReferenceAlias Property Alias_Rokov_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Mathis_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis_EndMarker Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Allies Auto Const mandatory
ReferenceAlias Property Alias_Naeva_StartMarker Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room1CollisionMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room2CollisionMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Naeva_Room3CollisionMarkers Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_Adler_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Adler_StealthDoor Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_HuanCombat Auto Const mandatory
ReferenceAlias Property Alias_Huan_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Estelle_StartMarker Auto Const mandatory
RefCollectionAlias Property Alias_Estelle_Level2_QuartersAllies Auto Const mandatory
RefCollectionAlias Property Alias_Estelle_Level3_QuartersAllies Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort01 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort02 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort03 Auto Const mandatory
ReferenceAlias Property Alias_Flee_DockingPort04 Auto Const mandatory
RefCollectionAlias Property Alias_Brig_Clutter Auto Const mandatory
RefCollectionAlias Property Alias_Brig_ReleasedPrisoners Auto Const mandatory
RefCollectionAlias Property Alias_Flee_NonBossBattleEnemies Auto Const mandatory
RefCollectionAlias Property Alias_Mess_AmbushEnemies Auto Const mandatory
RefCollectionAlias Property Alias_Ops_RobotsAndTurrets Auto Const mandatory
RefCollectionAlias Property Alias_Ops_SurrenderedEnemies Auto Const mandatory
ReferenceAlias Property Alias_Adler_SecurityOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_Mathis_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Mathis_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard01 Auto Const mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard02 Auto Const mandatory
ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_NaevaSurrenderWaitMarker Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Robotics_EventManager Auto Const mandatory
ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_Toft Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
Scene Property LC088_000_Announcements Auto Const mandatory
Scene Property LC088_100_BoardingAnnouncement Auto Const mandatory
Scene Property LC088_200_Vigilance_BrigPrisonersCheer Auto Const mandatory
Scene Property LC088_300_Rokov_Start Auto Const mandatory
Scene Property LC088_380_Rokov_End Auto Const mandatory
Scene Property LC088_410_Mathis_Start Auto Const mandatory
Scene Property LC088_480_Mathis_End Auto Const mandatory
Scene Property LC088_480_RoboticsEndAnnouncement Auto Const mandatory
Scene Property LC088_511_Naeva_Start Auto Const mandatory
Scene Property LC088_530_Naeva_Breach_1 Auto Const mandatory
Scene Property LC088_550_Naeva_Breach_2 Auto Const mandatory
Scene Property LC088_570_Naeva_Breach_3 Auto Const mandatory
Scene Property LC088_580_EngineEndAnnouncement Auto Const mandatory
Scene Property LC088_581_Naeva_Clear Auto Const mandatory
Scene Property LC088_581_Naeva_End Auto Const mandatory
Scene Property LC088_610_Adler_Start Auto Const mandatory
Scene Property LC088_620_Adler_Greet Auto Const mandatory
Scene Property LC088_650_WeaponsAmbushDoorStuck Auto Const mandatory
Scene Property LC088_650_WeaponsAmbushStart Auto Const mandatory
Scene Property LC088_680_Adler_End Auto Const mandatory
Scene Property LC088_710_Huan_Start Auto Const mandatory
Scene Property LC088_710_Huan_Start_InCombat Auto Const mandatory
Scene Property LC088_750_MessAmbushStart Auto Const mandatory
Scene Property LC088_780_Huan_End Auto Const mandatory
Scene Property LC088_810_Estelle_Start Auto Const mandatory
Scene Property LC088_880_Estelle_End Auto Const mandatory
Scene Property LC088_910_Flee_Start Auto Const mandatory
Scene Property LC088_921_Flee_Shuttle01 Auto Const mandatory
Scene Property LC088_922_Flee_Shuttle02 Auto Const mandatory
Scene Property LC088_923_Flee_Shuttle03 Auto Const mandatory
Scene Property LC088_924_Flee_Shuttle04 Auto Const mandatory
Scene Property LC088_1010_KibweConfrontation Auto Const mandatory
Scene Property LC088_1019_SurrenderScene Auto Const mandatory
Scene Property LC088_1020_ExecutionScene Auto Const mandatory
ObjectReference Property LC082_CFMain_EnableMarker Auto Const mandatory
ObjectReference Property LC088_EnableMarker Auto Const mandatory
ObjectReference Property LC088_DisableMarker Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
ObjectReference Property LC088_Quickstart_Rokov Auto Const mandatory
ObjectReference Property LC088_Quickstart_Mathis Auto Const mandatory
ObjectReference Property LC088_Quickstart_Naeva Auto Const mandatory
ObjectReference Property LC088_Quickstart_Adler Auto Const mandatory
ObjectReference Property LC088_Quickstart_Estelle Auto Const mandatory
ObjectReference Property LC088_Quickstart_Huan Auto Const mandatory
ObjectReference Property LC088_Quickstart_Flee Auto Const mandatory
ObjectReference Property LC088_Quickstart_Kibwe Auto Const mandatory
lc082_brigmanagerrefscript Property LC082_BrigManagerRef Auto Const mandatory
ObjectReference Property CF08_NaevaSurrenderEntryMarker Auto Const mandatory
ObjectReference Property LC082_AbandonShipAlarmMarkerRef Auto Const mandatory
ObjectReference Property LC082_BoardingAlarmMarkerRef Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
LeveledItem Property LLI_CrimsonFleet_Heavy Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const mandatory
Perk Property LC088_Vigilance_MathisInitialDebuffPerk Auto Const mandatory
Scene Property LC088_1010_KibweConfrontationIntroCamera Auto Const mandatory
LocationAlias Property Alias_LC088VigilanceLocation Auto Const mandatory
wwiseevent Property DRS_QST_CF08_ShipA_VerticalA_Open Auto Const mandatory
ReferenceAlias Property Alias_Ops_Door_EntryDoor Auto Const mandatory
wwiseevent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_02 Auto Const mandatory
ReferenceAlias Property Alias_CF08BattleAlarm Auto Const mandatory
wwiseevent Property WwiseEvent_QST_CF08_Shuttle_Disembark Auto Const mandatory
wwiseevent Property WwiseEvent_ShakeController_p25_p25_03 Auto Const mandatory
ActorValue Property LC088_Vigilance_PlayAnnouncementValue Auto Const mandatory
ReferenceAlias Property Alias_Ops_NaevaSurrenderStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Ops_CrowdWalla Auto Const mandatory
Keyword Property LocTypeShowClothing Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallNavcutRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_QTMarkerWeaponsRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_QTMarkerQuartersRef Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom01EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom02EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_EngineRoom03EndBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallStartBreadcrumb Auto Const mandatory
ObjectReference Property LC088_Vigilance_MessHallEndBreadcrumb Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0470_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().MoveTo(LC088_Quickstart_Rokov, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().MoveTo(LC088_Quickstart_Mathis, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().MoveTo(LC088_Quickstart_Naeva, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:63
  Game.GetPlayer().MoveTo(LC088_Quickstart_Adler, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:74
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:75
  Self.SetStage(9) ; #DEBUG_LINE_NO:81
  Game.GetPlayer().MoveTo(LC088_Quickstart_Huan, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:95
  Game.GetPlayer().MoveTo(LC088_Quickstart_Estelle, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:109
  Game.GetPlayer().MoveTo(LC088_Quickstart_Flee, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0008_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:120
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:121
  Self.SetStage(9) ; #DEBUG_LINE_NO:127
  Alias_Flee_NonBossBattleEnemies.DisableAll(False) ; #DEBUG_LINE_NO:130
  If !CF_Post.GetStageDone(0) ; #DEBUG_LINE_NO:133
    Game.GetPlayer().MoveTo(LC088_Quickstart_Kibwe, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0009_Item_00()
  LC088_Space.SetStage(40) ; #DEBUG_LINE_NO:150
  Alias_playerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:153
  CF08_Fleet.SetStage(310) ; #DEBUG_LINE_NO:156
  If !Self.GetStageDone(0) ; #DEBUG_LINE_NO:160
    Self.SetStage(110) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(8) ; #DEBUG_LINE_NO:165
    LC088_000_Announcements.Stop() ; #DEBUG_LINE_NO:166
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:170
  While !Self.GetStageDone(12) ; #DEBUG_LINE_NO:175
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:176
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:185
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:186
  Location vigilanceLoc = Alias_LC088VigilanceLocation.GetLocation() ; #DEBUG_LINE_NO:192
  vigilanceLoc.Reset() ; #DEBUG_LINE_NO:193
  vigilanceLoc.RemoveKeyword(LocTypeShowClothing) ; #DEBUG_LINE_NO:196
  LC082_CFMain_EnableMarker.Disable(False) ; #DEBUG_LINE_NO:199
  LC088_DisableMarker.Disable(False) ; #DEBUG_LINE_NO:200
  LC088_EnableMarker.Enable(False) ; #DEBUG_LINE_NO:201
  Alias_Brig_Clutter.EnableAll(False) ; #DEBUG_LINE_NO:202
  Alias_Flee_NonBossBattleEnemies.EnableAll(False) ; #DEBUG_LINE_NO:203
  Alias_Ops_CrowdWalla.TryToDisable() ; #DEBUG_LINE_NO:204
  Alias_Ops_RobotsAndTurrets.EnableAll(False) ; #DEBUG_LINE_NO:205
  kmyQuest.Ops_InitSecurityDoors() ; #DEBUG_LINE_NO:208
  LC082_BoardingAlarmMarkerRef.Enable(False) ; #DEBUG_LINE_NO:211
  kmyQuest.Ops_SetElevatorLockedDown(True) ; #DEBUG_LINE_NO:214
  kmyQuest.Ops_SetupOps() ; #DEBUG_LINE_NO:217
  Self.SetStageNoWait(11) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:228
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:229
  While !LC082_BrigManagerRef.HasInitilized() ; #DEBUG_LINE_NO:240
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:241
  EndWhile ; #DEBUG_LINE_NO:
  kmyQuest.SetupBrigPrisoners() ; #DEBUG_LINE_NO:245
  kmyQuest.SetupAllCaptainEvents() ; #DEBUG_LINE_NO:248
  Self.SetStage(12) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor RokovRef = Alias_Rokov.GetActorRef() ; #DEBUG_LINE_NO:261
  RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False) ; #DEBUG_LINE_NO:262
  RokovRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor MathisRef = Alias_Mathis.GetActorRef() ; #DEBUG_LINE_NO:273
  MathisRef.AddPerk(LC088_Vigilance_MathisInitialDebuffPerk, False) ; #DEBUG_LINE_NO:274
  MathisRef.AddItem(LLI_CrimsonFleet_Heavy as Form, 1, False) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0016_Item_00()
  ObjectReference adlerDoor = Alias_Adler_SecurityOfficeDoor.GetRef() ; #DEBUG_LINE_NO:295
  adlerDoor.Unlock(False) ; #DEBUG_LINE_NO:296
  adlerDoor.SetOpen(True) ; #DEBUG_LINE_NO:297
  Actor AdlerRef = Alias_Adler.GetActorRef() ; #DEBUG_LINE_NO:300
  AdlerRef.RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:301
  AdlerRef.RemoveFromFaction(CydoniaFaction) ; #DEBUG_LINE_NO:302
  AdlerRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:303
  AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0017_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:312
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:313
  kmyQuest.EnableCaptain(Alias_Huan, Alias_Huan_StartMarker) ; #DEBUG_LINE_NO:320
  Alias_Huan.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_02, False) ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_0018_Item_00()
  Actor EstelleRef = Alias_Estelle.GetActorRef() ; #DEBUG_LINE_NO:333
  EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04, False) ; #DEBUG_LINE_NO:334
  EstelleRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:335
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:336
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:347
EndFunction

Function Fragment_Stage_0100_Item_00()
  LC088_100_BoardingAnnouncement.Start() ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0110_Item_00()
  LC082_BoardingAlarmMarkerRef.Disable(False) ; #DEBUG_LINE_NO:369
  LC088_000_Announcements.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF08_Fleet.SetStage(320) ; #DEBUG_LINE_NO:383
EndFunction

Function Fragment_Stage_0210_Item_00()
  CF08_Fleet.SetStage(350) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0280_Item_00()
  CF08_Fleet.SetStage(330) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0) ; #DEBUG_LINE_NO:416
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.GetStageDone(13) ; #DEBUG_LINE_NO:427
    LC088_300_Rokov_Start.Start() ; #DEBUG_LINE_NO:429
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:433
  While I < Alias_Brig_ReleasedPrisoners.GetCount() ; #DEBUG_LINE_NO:434
    (Alias_Brig_ReleasedPrisoners.GetAt(I) as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:435
    I += 1 ; #DEBUG_LINE_NO:436
  EndWhile ; #DEBUG_LINE_NO:
  CF08_Fleet.SetStage(700) ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:448
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:449
  kmyQuest.EnableCaptainAlly(Alias_Rokov_Ally01) ; #DEBUG_LINE_NO:455
  kmyQuest.EnableCaptainAlly(Alias_Rokov_Ally02) ; #DEBUG_LINE_NO:456
  kmyQuest.EnableCaptain(Alias_Rokov, Alias_Rokov_StartMarker) ; #DEBUG_LINE_NO:457
EndFunction

Function Fragment_Stage_0380_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:465
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:466
  If Self.GetStageDone(13) ; #DEBUG_LINE_NO:472
    kmyQuest.SetCaptainComplete(Alias_Rokov.GetActorRef()) ; #DEBUG_LINE_NO:473
    kmyQuest.SetCaptainComplete(Alias_Rokov_Ally01.GetActorRef()) ; #DEBUG_LINE_NO:474
    kmyQuest.SetCaptainComplete(Alias_Rokov_Ally02.GetActorRef()) ; #DEBUG_LINE_NO:475
    If Self.GetStage() < 400 ; #DEBUG_LINE_NO:476
      CF08_Fleet.SetStage(605) ; #DEBUG_LINE_NO:477
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.SetCaptainAlliesComplete(Alias_Brig_ReleasedPrisoners) ; #DEBUG_LINE_NO:482
EndFunction

Function Fragment_Stage_0390_Item_00()
  CF08_Fleet.SetStage(610) ; #DEBUG_LINE_NO:493
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:501
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:502
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0) ; #DEBUG_LINE_NO:508
  If Self.GetStageDone(14) ; #DEBUG_LINE_NO:512
    kmyQuest.EnableCaptain(Alias_Mathis, Alias_Mathis_StartMarker) ; #DEBUG_LINE_NO:513
    LC088_410_Mathis_Start.Start() ; #DEBUG_LINE_NO:514
    kmyQuest.Robotics_StartRoboticsBayBattle() ; #DEBUG_LINE_NO:517
  EndIf ; #DEBUG_LINE_NO:
  If !CF08_Fleet.GetStageDone(610) ; #DEBUG_LINE_NO:521
    CF08_Fleet.SetStage(615) ; #DEBUG_LINE_NO:522
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:531
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:532
  If Self.GetStageDone(14) ; #DEBUG_LINE_NO:537
    Alias_Mathis.GetActorRef().RemovePerk(LC088_Vigilance_MathisInitialDebuffPerk) ; #DEBUG_LINE_NO:540
  Else ; #DEBUG_LINE_NO:
    kmyQuest.Robotics_StartRoboticsBayBattle() ; #DEBUG_LINE_NO:544
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.Robotics_SealRoboticsBayDoors() ; #DEBUG_LINE_NO:548
EndFunction

Function Fragment_Stage_0480_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:564
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:565
  LC088_000_Announcements.Stop() ; #DEBUG_LINE_NO:571
  LC088_480_RoboticsEndAnnouncement.Start() ; #DEBUG_LINE_NO:572
  If Self.GetStageDone(14) ; #DEBUG_LINE_NO:575
    kmyQuest.SetCaptainComplete(Alias_Mathis.GetActorRef()) ; #DEBUG_LINE_NO:576
    If Self.GetStage() < 500 ; #DEBUG_LINE_NO:577
      CF08_Fleet.SetStage(620) ; #DEBUG_LINE_NO:578
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0481_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:588
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:589
  kmyQuest.Robotics_UnsealRoboticsBayDoors() ; #DEBUG_LINE_NO:595
EndFunction

Function Fragment_Stage_0490_Item_00()
  CF08_Fleet.SetStage(625) ; #DEBUG_LINE_NO:608
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:616
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:617
  If Self.GetStageDone(15) ; #DEBUG_LINE_NO:623
    kmyQuest.EnableCaptain(Alias_Naeva, Alias_Naeva_StartMarker) ; #DEBUG_LINE_NO:624
    Int I = 0 ; #DEBUG_LINE_NO:625
    Int count = Alias_Naeva_Allies.GetCount() ; #DEBUG_LINE_NO:626
    While I < count ; #DEBUG_LINE_NO:627
      kmyQuest.EnableCaptainAllyRef(Alias_Naeva_Allies.GetAt(I) as Actor) ; #DEBUG_LINE_NO:628
      I += 1 ; #DEBUG_LINE_NO:629
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !CF08_Fleet.GetStageDone(625) ; #DEBUG_LINE_NO:634
    CF08_Fleet.SetStage(630) ; #DEBUG_LINE_NO:635
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:644
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:645
  kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:651
EndFunction

Function Fragment_Stage_0511_Item_00()
  LC088_511_Naeva_Start.Start() ; #DEBUG_LINE_NO:665
EndFunction

Function Fragment_Stage_0520_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:673
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:674
  kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:680
EndFunction

Function Fragment_Stage_0530_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:688
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:689
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom01EndBreadcrumb, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:695
  Alias_Naeva_Room1CollisionMarkers.DisableAll(False) ; #DEBUG_LINE_NO:698
  If Self.GetStageDone(15) ; #DEBUG_LINE_NO:700
    LC088_511_Naeva_Start.Stop() ; #DEBUG_LINE_NO:702
    LC088_530_Naeva_Breach_1.Start() ; #DEBUG_LINE_NO:705
    kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:709
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:710
    kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:711
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:712
    kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:713
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:722
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:723
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom02EndBreadcrumb, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:729
  Alias_Naeva_Room2CollisionMarkers.DisableAll(False) ; #DEBUG_LINE_NO:732
  If Self.GetStageDone(15) ; #DEBUG_LINE_NO:734
    LC088_550_Naeva_Breach_2.Start() ; #DEBUG_LINE_NO:736
    kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:739
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0570_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:748
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:749
  LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom03EndBreadcrumb, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:755
  Alias_Naeva_Room3CollisionMarkers.DisableAll(False) ; #DEBUG_LINE_NO:758
  If Self.GetStageDone(15) ; #DEBUG_LINE_NO:760
    LC088_570_Naeva_Breach_3.Start() ; #DEBUG_LINE_NO:762
    kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:765
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0580_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:774
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:775
  kmyQuest.EVPNaevaAndAllies() ; #DEBUG_LINE_NO:781
  If Self.GetStageDone(15) && Alias_Naeva.GetActorRef().GetCombatState() == 0 ; #DEBUG_LINE_NO:784
    Self.SetStage(581) ; #DEBUG_LINE_NO:785
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(585) ; #DEBUG_LINE_NO:787
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0581_Item_00()
  LC088_581_Naeva_Clear.Start() ; #DEBUG_LINE_NO:800
EndFunction

Function Fragment_Stage_0582_Item_00()
  Self.SetStage(585) ; #DEBUG_LINE_NO:811
EndFunction

Function Fragment_Stage_0585_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:819
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:820
  LC088_000_Announcements.Stop() ; #DEBUG_LINE_NO:826
  LC088_580_EngineEndAnnouncement.Start() ; #DEBUG_LINE_NO:827
  If Self.GetStageDone(15) ; #DEBUG_LINE_NO:830
    kmyQuest.SetCaptainComplete(Alias_Naeva.GetActorRef()) ; #DEBUG_LINE_NO:831
    kmyQuest.SetCaptainAlliesComplete(Alias_Naeva_Allies) ; #DEBUG_LINE_NO:832
    If Self.GetStage() < 600 ; #DEBUG_LINE_NO:833
      CF08_Fleet.SetStage(665) ; #DEBUG_LINE_NO:834
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0590_Item_00()
  CF08_Fleet.SetStage(670) ; #DEBUG_LINE_NO:847
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(16) ; #DEBUG_LINE_NO:858
    Self.SetStage(610) ; #DEBUG_LINE_NO:859
  EndIf ; #DEBUG_LINE_NO:
  If !CF08_Fleet.GetStageDone(670) ; #DEBUG_LINE_NO:863
    CF08_Fleet.SetStage(675) ; #DEBUG_LINE_NO:864
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0610_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:873
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:874
  kmyQuest.EnableCaptain(Alias_Adler, Alias_Adler_StartMarker) ; #DEBUG_LINE_NO:880
  LC088_610_Adler_Start.Start() ; #DEBUG_LINE_NO:881
  CF08_Fleet.SetStage(360) ; #DEBUG_LINE_NO:882
EndFunction

Function Fragment_Stage_0620_Item_00()
  Alias_Adler.TryToEvaluatePackage() ; #DEBUG_LINE_NO:893
EndFunction

Function Fragment_Stage_0630_Item_00()
  Alias_Adler.TryToEvaluatePackage() ; #DEBUG_LINE_NO:904
EndFunction

Function Fragment_Stage_0631_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:912
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:913
  Self.SetStage(640) ; #DEBUG_LINE_NO:919
  Alias_Adler_StealthDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:922
  kmyQuest.Weapons_ConvertRobotsAndTurrets() ; #DEBUG_LINE_NO:925
  CF08_Fleet.SetStage(370) ; #DEBUG_LINE_NO:928
EndFunction

Function Fragment_Stage_0632_Item_00()
  Alias_Adler_StealthDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:939
  CF08_Fleet.SetStage(370) ; #DEBUG_LINE_NO:942
EndFunction

Function Fragment_Stage_0633_Item_00()
  CF08_Fleet.SetStage(370) ; #DEBUG_LINE_NO:953
EndFunction

Function Fragment_Stage_0640_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:961
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:962
  kmyQuest.Weapons_SealWeaponBays() ; #DEBUG_LINE_NO:968
EndFunction

Function Fragment_Stage_0650_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:976
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:977
  Alias_Adler.TryToEvaluatePackage() ; #DEBUG_LINE_NO:984
  CF08_Fleet.SetStage(375) ; #DEBUG_LINE_NO:987
  kmyQuest.Weapons_StartAmbush() ; #DEBUG_LINE_NO:990
  LC088_650_WeaponsAmbushStart.Start() ; #DEBUG_LINE_NO:993
  If Self.GetStageDone(640) ; #DEBUG_LINE_NO:994
    LC088_650_WeaponsAmbushDoorStuck.Start() ; #DEBUG_LINE_NO:995
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0680_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1004
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1005
  If Self.GetStageDone(16) ; #DEBUG_LINE_NO:1011
    kmyQuest.SetCaptainComplete(Alias_Adler.GetActorRef()) ; #DEBUG_LINE_NO:1012
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0690_Item_00()
  CF08_Fleet.SetStage(370) ; #DEBUG_LINE_NO:1027
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1035
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1036
  LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallStartBreadcrumb, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1042
  If Self.GetStageDone(17) ; #DEBUG_LINE_NO:1046
    Self.SetStage(710) ; #DEBUG_LINE_NO:1047
  EndIf ; #DEBUG_LINE_NO:
  If !CF08_Fleet.GetStageDone(370) ; #DEBUG_LINE_NO:1051
    CF08_Fleet.SetStage(375) ; #DEBUG_LINE_NO:1052
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0710_Item_00()
  If Self.GetStageDone(17) ; #DEBUG_LINE_NO:1063
    If Game.GetPlayer().IsInCombat() || Alias_Huan.GetActorRef().IsInCombat() ; #DEBUG_LINE_NO:1064
      LC088_710_Huan_Start_InCombat.Start() ; #DEBUG_LINE_NO:1065
    Else ; #DEBUG_LINE_NO:
      Alias_Huan.TryToEvaluatePackage() ; #DEBUG_LINE_NO:1068
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0720_Item_00()
  Alias_Huan.TryToEvaluatePackage() ; #DEBUG_LINE_NO:1081
EndFunction

Function Fragment_Stage_0730_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1089
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1090
  LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallEndBreadcrumb, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1096
  LC088_Vigilance_MessHallNavcutRef.Disable(False) ; #DEBUG_LINE_NO:1099
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:1100
  If Self.GetStageDone(17) ; #DEBUG_LINE_NO:1104
    Alias_HuanCombat.ForceRefTo(Alias_Huan.GetRef()) ; #DEBUG_LINE_NO:1105
    Alias_Huan.TryToEvaluatePackage() ; #DEBUG_LINE_NO:1106
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0750_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1115
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1116
  kmyQuest.Mess_StartAmbush() ; #DEBUG_LINE_NO:1122
  LC088_750_MessAmbushStart.Start() ; #DEBUG_LINE_NO:1125
EndFunction

Function Fragment_Stage_0780_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1133
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1134
  If Self.GetStageDone(17) ; #DEBUG_LINE_NO:1140
    kmyQuest.SetCaptainComplete(Alias_Huan.GetActorRef()) ; #DEBUG_LINE_NO:1141
    If Self.GetStage() < 800 ; #DEBUG_LINE_NO:1142
      CF08_Fleet.SetStage(635) ; #DEBUG_LINE_NO:1143
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0790_Item_00()
  CF08_Fleet.SetStage(640) ; #DEBUG_LINE_NO:1156
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1164
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1165
  Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1.0) ; #DEBUG_LINE_NO:1171
  kmyQuest.SetupEstelle() ; #DEBUG_LINE_NO:1174
  If !CF08_Fleet.GetStageDone(640) ; #DEBUG_LINE_NO:1177
    CF08_Fleet.SetStage(645) ; #DEBUG_LINE_NO:1178
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0810_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1187
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1188
  kmyQuest.EnableEstelle() ; #DEBUG_LINE_NO:1194
EndFunction

Function Fragment_Stage_0880_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1210
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1211
  Self.SetStage(820) ; #DEBUG_LINE_NO:1217
  If Self.GetStageDone(18) ; #DEBUG_LINE_NO:1220
    kmyQuest.SetCaptainComplete(Alias_Estelle.GetActorRef()) ; #DEBUG_LINE_NO:1221
    kmyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level2_QuartersAllies) ; #DEBUG_LINE_NO:1222
    kmyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level3_QuartersAllies) ; #DEBUG_LINE_NO:1223
    If Self.GetStage() < 900 ; #DEBUG_LINE_NO:1224
      CF08_Fleet.SetStage(650) ; #DEBUG_LINE_NO:1225
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0890_Item_00()
  CF08_Fleet.SetStage(655) ; #DEBUG_LINE_NO:1238
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !CF08_Fleet.GetStageDone(655) ; #DEBUG_LINE_NO:1249
    CF08_Fleet.SetStage(660) ; #DEBUG_LINE_NO:1250
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0901_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1259
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1260
  LC088_000_Announcements.Stop() ; #DEBUG_LINE_NO:1266
  LC088_910_Flee_Start.Start() ; #DEBUG_LINE_NO:1269
  Self.SetStage(902) ; #DEBUG_LINE_NO:1272
EndFunction

Function Fragment_Stage_0902_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1280
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1281
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:1287
  kmyQuest.Flee_StartFleeing() ; #DEBUG_LINE_NO:1288
EndFunction

Function Fragment_Stage_0903_Item_00()
  LC082_AbandonShipAlarmMarkerRef.Enable(False) ; #DEBUG_LINE_NO:1299
EndFunction

Function Fragment_Stage_0921_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort01.GetRef() ; #DEBUG_LINE_NO:1310
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1311
  dockingPortMarker.Disable(False) ; #DEBUG_LINE_NO:1312
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0) ; #DEBUG_LINE_NO:1313
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1314
  LC088_921_Flee_Shuttle01.Start() ; #DEBUG_LINE_NO:1317
EndFunction

Function Fragment_Stage_0922_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort02.GetRef() ; #DEBUG_LINE_NO:1328
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1329
  dockingPortMarker.Disable(False) ; #DEBUG_LINE_NO:1330
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0) ; #DEBUG_LINE_NO:1331
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1332
  LC088_922_Flee_Shuttle02.Start() ; #DEBUG_LINE_NO:1335
EndFunction

Function Fragment_Stage_0923_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort03.GetRef() ; #DEBUG_LINE_NO:1346
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1347
  dockingPortMarker.Disable(False) ; #DEBUG_LINE_NO:1348
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0) ; #DEBUG_LINE_NO:1349
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1350
  LC088_923_Flee_Shuttle03.Start() ; #DEBUG_LINE_NO:1353
EndFunction

Function Fragment_Stage_0924_Item_00()
  ObjectReference dockingPortMarker = Alias_Flee_DockingPort04.GetRef() ; #DEBUG_LINE_NO:1364
  WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1365
  dockingPortMarker.Disable(False) ; #DEBUG_LINE_NO:1366
  Game.ShakeCamera(dockingPortMarker, 0.25, 3.0) ; #DEBUG_LINE_NO:1367
  WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker, None, None) ; #DEBUG_LINE_NO:1368
  LC088_924_Flee_Shuttle04.Start() ; #DEBUG_LINE_NO:1371
EndFunction

Function Fragment_Stage_1000_Item_00()
  LC088_000_Announcements.Stop() ; #DEBUG_LINE_NO:1382
  LC082_AbandonShipAlarmMarkerRef.Disable(False) ; #DEBUG_LINE_NO:1385
  Alias_Ops_Door_EntryDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:1388
  Self.SetStage(1010) ; #DEBUG_LINE_NO:1391
EndFunction

Function Fragment_Stage_1003_Item_00()
  Alias_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1399
EndFunction

Function Fragment_Stage_1005_Item_00()
  LC088_1010_KibweConfrontationIntroCamera.Stop() ; #DEBUG_LINE_NO:1407
  Alias_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1408
EndFunction

Function Fragment_Stage_1010_Item_00()
  If !Self.GetStageDone(1100) ; #DEBUG_LINE_NO:1419
    LC088_1010_KibweConfrontationIntroCamera.Start() ; #DEBUG_LINE_NO:1421
    CF08_SpeechChallenge_Kibwe.Start() ; #DEBUG_LINE_NO:1424
  EndIf ; #DEBUG_LINE_NO:
  CF08_Fleet.SetStage(380) ; #DEBUG_LINE_NO:1428
EndFunction

Function Fragment_Stage_1011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1436
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1437
  kmyQuest.Ops_LockPlayerControls(True) ; #DEBUG_LINE_NO:1443
  kmyQuest.Ops_SetFastTravelEnabled(False) ; #DEBUG_LINE_NO:1446
  Alias_CF08BattleAlarm.TryToEnable() ; #DEBUG_LINE_NO:1449
  Actor KibweRef = Alias_Kibwe.GetActorRef() ; #DEBUG_LINE_NO:1451
  Actor ToftRef = Alias_Toft.GetActorRef() ; #DEBUG_LINE_NO:1452
  KibweRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:1454
  ToftRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:1455
  KibweRef.StopCombat() ; #DEBUG_LINE_NO:1456
  ToftRef.StopCombat() ; #DEBUG_LINE_NO:1457
EndFunction

Function Fragment_Stage_1012_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1465
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1466
  SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef(), None, True, True, False, False, False) ; #DEBUG_LINE_NO:1472
  Alias_Ops_Door_EntryDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:1475
  kmyQuest.Ops_SealSecurityDoors() ; #DEBUG_LINE_NO:1476
EndFunction

Function Fragment_Stage_1019_Item_00()
  Actor KibweRef = Alias_Kibwe.GetActorRef() ; #DEBUG_LINE_NO:1486
  Actor ToftRef = Alias_Toft.GetActorRef() ; #DEBUG_LINE_NO:1487
  KibweRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:1489
  ToftRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:1490
  KibweRef.StopCombat() ; #DEBUG_LINE_NO:1491
  ToftRef.StopCombat() ; #DEBUG_LINE_NO:1492
  Alias_Ops_SurrenderedEnemies.AddRef(KibweRef as ObjectReference) ; #DEBUG_LINE_NO:1495
  Alias_Ops_SurrenderedEnemies.AddRef(ToftRef as ObjectReference) ; #DEBUG_LINE_NO:1496
  Self.SetStage(1100) ; #DEBUG_LINE_NO:1499
  Alias_Ops_CFBodyguard01.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:1501
  Alias_Ops_CFBodyguard02.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:1502
EndFunction

Function Fragment_Stage_1020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1510
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1511
  If !Self.GetStageDone(1100) ; #DEBUG_LINE_NO:1516
    Self.SetStage(1011) ; #DEBUG_LINE_NO:1518
    Self.SetStage(1012) ; #DEBUG_LINE_NO:1519
    kmyQuest.Ops_LockPlayerControls(False) ; #DEBUG_LINE_NO:1522
    kmyQuest.Ops_StartBattleNoWait() ; #DEBUG_LINE_NO:1525
    CF08_Fleet.SetStage(390) ; #DEBUG_LINE_NO:1528
    CF08_Fleet.SetStage(400) ; #DEBUG_LINE_NO:1529
    CF08_Fleet.SetStage(410) ; #DEBUG_LINE_NO:1530
  EndIf ; #DEBUG_LINE_NO:
  Actor KibweRef = Alias_Kibwe.GetActorRef() ; #DEBUG_LINE_NO:1533
  Actor ToftRef = Alias_Toft.GetActorRef() ; #DEBUG_LINE_NO:1534
  KibweRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:1536
  ToftRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:1537
  KibweRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1538
  ToftRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1539
EndFunction

Function Fragment_Stage_1050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1547
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1548
  CF08_Fleet.SetStage(420) ; #DEBUG_LINE_NO:1554
  kmyQuest.Ops_ActivateAllTurrets() ; #DEBUG_LINE_NO:1557
  kmyQuest.Ops_ActivateAllRobots() ; #DEBUG_LINE_NO:1558
EndFunction

Function Fragment_Stage_1051_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1566
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1567
  CF08_Fleet.SetStage(430) ; #DEBUG_LINE_NO:1573
  kmyQuest.Ops_ActivateAllTurrets() ; #DEBUG_LINE_NO:1576
  kmyQuest.Ops_ActivateAllRobots() ; #DEBUG_LINE_NO:1577
EndFunction

Function Fragment_Stage_1094_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1585
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1586
  LC088_581_Naeva_Clear.Stop() ; #DEBUG_LINE_NO:1590
  Alias_Ops_CFBodyguard01.TryToEnableNoWait() ; #DEBUG_LINE_NO:1593
  Alias_Ops_CFBodyguard02.TryToEnableNoWait() ; #DEBUG_LINE_NO:1594
  Alias_Naeva.TryToEnable() ; #DEBUG_LINE_NO:1595
  Alias_Naeva.TryToMoveTo(Alias_Ops_NaevaSurrenderStartMarker.GetRef()) ; #DEBUG_LINE_NO:1596
  Alias_Naeva.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:1597
  If Self.GetStageDone(1019) ; #DEBUG_LINE_NO:1603
    LC088_1019_SurrenderScene.Start() ; #DEBUG_LINE_NO:1604
  Else ; #DEBUG_LINE_NO:
    LC088_1020_ExecutionScene.Start() ; #DEBUG_LINE_NO:1606
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1615
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1616
  kmyQuest.Ops_LockPlayerControls(False) ; #DEBUG_LINE_NO:1622
  kmyQuest.Ops_EndBattleNoWait() ; #DEBUG_LINE_NO:1635
  CF08_Fleet.SetStageNoWait(440) ; #DEBUG_LINE_NO:1638
  CF08_Fleet.SetStageNoWait(510) ; #DEBUG_LINE_NO:1639
EndFunction

Function Fragment_Stage_1101_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1647
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1648
  kmyQuest.Ops_LockPlayerControls(False) ; #DEBUG_LINE_NO:1655
  kmyQuest.Ops_EndBattle() ; #DEBUG_LINE_NO:1656
  CF08_Fleet.SetStage(440) ; #DEBUG_LINE_NO:1657
  CF08_Fleet.SetStage(510) ; #DEBUG_LINE_NO:1658
EndFunction

Function Fragment_Stage_1110_Item_00()
  Alias_Kibwe.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:1669
EndFunction

Function Fragment_Stage_1111_Item_00()
  Alias_Toft.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:1680
EndFunction

Function Fragment_Stage_1112_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1688
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1689
  Actor NaevaRef = Alias_Naeva.GetActorRef() ; #DEBUG_LINE_NO:1695
  NaevaRef.SetGhost(False) ; #DEBUG_LINE_NO:1697
  NaevaRef.Disable(False) ; #DEBUG_LINE_NO:1698
  Alias_Ops_CFBodyguard01.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:1700
  Alias_Ops_CFBodyguard02.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:1701
EndFunction

Function Fragment_Stage_1119_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1709
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1710
  Self.SetStage(1110) ; #DEBUG_LINE_NO:1716
  Self.SetStage(1111) ; #DEBUG_LINE_NO:1717
  Self.SetStage(1112) ; #DEBUG_LINE_NO:1718
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1726
  lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript ; #DEBUG_LINE_NO:1727
  Self.SetStage(1090) ; #DEBUG_LINE_NO:1733
  Alias_Flee_NonBossBattleEnemies.DisableAll(False) ; #DEBUG_LINE_NO:1736
  Alias_Ops_RobotsAndTurrets.DisableAll(False) ; #DEBUG_LINE_NO:1737
  Alias_Kibwe.TryToDisable() ; #DEBUG_LINE_NO:1738
  Alias_Toft.TryToDisable() ; #DEBUG_LINE_NO:1739
  Alias_Mathis_EnableMarker.TryToDisable() ; #DEBUG_LINE_NO:1742
  Alias_Mathis_DisableMarker.TryToDisable() ; #DEBUG_LINE_NO:1743
  kmyQuest.Robotics_UnsealRoboticsBayDoors() ; #DEBUG_LINE_NO:1744
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:1747
  CF08_SpeechChallenge_Kibwe.Stop() ; #DEBUG_LINE_NO:1750
  Self.Stop() ; #DEBUG_LINE_NO:1751
EndFunction
