ScriptName Fragments:Quests:QF_BQ01_Barrett_Quest Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_companionsscript Property SQ_Companions Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Perk Property StarbornPerk Auto Const mandatory
GlobalVariable Property SmallCredits Auto Const mandatory
GlobalVariable Property MediumCredits Auto Const mandatory
GlobalVariable Property LargeCredits Auto Const mandatory
LocationAlias Property Alias_Location_GagarinSettlement Auto Const mandatory
ReferenceAlias Property Alias_Trigger_Gagarin_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_Exterior_Player Auto Const mandatory
ReferenceAlias Property Alias_Door_ErvinApartment_Exterior Auto Const mandatory
ReferenceAlias Property Alias_Marker_ErvinApartment_Interior Auto Const mandatory
ReferenceAlias Property Alias_Safe_ErvinApartment Auto Const mandatory
Scene Property Scene_GoToErvinApartment Auto Const mandatory
Scene Property Scene_ApartmentExterior Auto Const mandatory
Scene Property Scene_EnteredApartment Auto Const mandatory
Scene Property Scene_NearSafe Auto Const mandatory
Scene Property Scene_NearTerminal Auto Const mandatory
Scene Property Scene_OpenSafe Auto Const mandatory
Scene Property Scene_PlayerFoundContract Auto Const mandatory
Scene Property Scene_FoundLicense Auto Const mandatory
Scene Property Scene_MyKey Auto Const mandatory
Scene Property Scene_BarrettUsesKey Auto Const mandatory
Scene Property Scene_ErvinApartmentEntrance Auto Const mandatory
Key Property Key_ErvinsApartment Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
Scene Property Scene_TownHallArrival Auto Const mandatory
Scene Property Scene_TownHall_FoundLicense Auto Const mandatory
ReferenceAlias Property Alias_Terminal_TownHall Auto Const mandatory
ReferenceAlias Property Alias_Marker_Gagarin_LawOfficeInterior Auto Const mandatory
ReferenceAlias Property Alias_goto_LawOffice_Barrett Auto Const mandatory
ReferenceAlias Property Alias_goto_LawOffice Auto Const mandatory
Scene Property Scene_NearLawOffice Auto Const mandatory
Scene Property Scene_Vignette_HelloEllie Auto Const mandatory
Scene Property Scene_Vignette_ReturnedFromMine Auto Const mandatory
Key Property Key_Employee Auto Const mandatory
Key Property Key_ErvinFoundry Auto Const mandatory
Scene Property Scene_GoToFoundry Auto Const mandatory
Scene Property Scene_TryYourAccount Auto Const mandatory
Scene Property Scene_FoundryCyberRunner Auto Const mandatory
Scene Property Scene_FoundryTheftTrack Auto Const mandatory
Scene Property Scene_FoundryGeologyTrack Auto Const mandatory
Scene Property Scene_AccessedPlayerAccount Auto Const mandatory
Scene Property Scene_AccessedErvinAccount Auto Const mandatory
Scene Property Scene_TheftTrack Auto Const mandatory
Scene Property Scene_AccessPlayerAccount Auto Const mandatory
Scene Property Scene_FoundryErvinTrack Auto Const mandatory
Scene Property Scene_FoundryNormalTrack Auto Const mandatory
Scene Property Scene_FoundryEmployeeTrack Auto Const mandatory
Scene Property Scene_FoundryTrackCyberRunner Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_FoundryKey Auto Const mandatory
ReferenceAlias Property Alias_Marker_GoTo_Foundry Auto Const mandatory
ReferenceAlias Property Alias_Terminal_Mine_Lab_ErvinStation Auto Const mandatory
ReferenceAlias Property Alias_Terminal_Mine_Cave_HelgiStation Auto Const mandatory
Scene Property Scene_Mine_Comment01_LandingPad Auto Const mandatory
Scene Property Scene_Mine_Comment02_Exterior Auto Const mandatory
Scene Property Scene_Mine_Comment03_Interior Auto Const mandatory
Scene Property Scene_Mine_Comment04_Office Auto Const mandatory
Scene Property Scene_Cave_Comment01_NearElevator Auto Const mandatory
Scene Property Scene_Cave_Comment02_Entrance Auto Const mandatory
Scene Property Scene_Cave_Comment03_Eggs Auto Const mandatory
Scene Property Scene_Cave_Comment04_Tunnels Auto Const mandatory
Scene Property Scene_Cave_Comment05_HelgiLab Auto Const mandatory
Scene Property Scene_Cave_Comment06_Nest Auto Const mandatory
Scene Property Scene_FoundEvidence_Helgi Auto Const mandatory
Scene Property Scene_FoundEvidence_Ervin Auto Const mandatory
Scene Property Scene_FoundEvidence_Admin Auto Const mandatory
Scene Property Scene_DalitsoEndConvo Auto Const mandatory
ReferenceAlias Property Alias_Actor_Helgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const mandatory
ReferenceAlias Property Alias_Marker_Spawn_Helgi Auto Const mandatory
Scene Property Scene_ErvinDoorUnlocked Auto Const mandatory
GlobalVariable Property PlayerPaycheck Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Potion Property Addichrone Auto Const mandatory
ReferenceAlias Property Alias_Marker_Clinic Auto Const mandatory
ReferenceAlias Property Alias_Marker_Store_Clint Auto Const mandatory
ReferenceAlias Property Alias_Actor_Security Auto Const mandatory
Scene Property Scene_WentToApartmentFirst Auto Const mandatory
ReferenceAlias Property Alias_Marker_ErvinApartment_Exterior Auto Const mandatory
Scene Property Scene_NearPasscodeCrate Auto Const mandatory
LocationAlias Property Alias_Location_ErvinApartment Auto Const mandatory
ReferenceAlias Property Alias_Marker_TownHall Auto Const mandatory
Key Property BQ01_Key_ErvinsApartment Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_Cactus Auto Const mandatory
Scene Property BQ01_Scene_GREET_1107_ErvinApt_InteriorScene Auto Const mandatory
ReferenceAlias Property Alias_Trigger_ErvinApartment_Exterior Auto Const mandatory
ReferenceAlias Property Alias_Trigger_ErvinApartment_Plant_Exterior Auto Const mandatory
Quest Property SpeechChallengeQuest Auto Const mandatory
Scene Property BQ01_Scene_Vignette_1601_Barrett_Mine_Leave Auto Const mandatory
GlobalVariable Property BQ01_Global_DetectivePoints Auto Const mandatory
Quest Property BarrettQuest Auto Const mandatory
Scene Property BQ01_Scene_BARK_7400_Barrett_BackToShip Auto Const mandatory
Book Property BQ01_ErvinPlant_Slate Auto Const mandatory
Scene Property BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction Auto Const mandatory
ReferenceAlias Property Alias_Door_ErvinApartment_Key Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Chair_Helgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_GagarinLandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Door_Mine_LockEntry Auto Const mandatory
Quest Property DialogueGagarin_UC_GG Auto Const mandatory
ReferenceAlias Property Alias_Door_Mine_LockEntry01 Auto Const mandatory
com_companionquestscript Property Com_Companion_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalErvin Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalHelgi Auto Const mandatory
ReferenceAlias Property Alias_Marker_Mine_TerminalMain Auto Const mandatory
ReferenceAlias Property Alias_Door_EllieApt Auto Const mandatory
ReferenceAlias Property Alias_Container_ErvinApartment_EnableMarker Auto Const mandatory
Scene Property BQ01_Scene_BARK_1107_ErvinApt_InteriorScene Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Barret Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01_SpeechChallenge Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0177_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0002_Item_00()
  Scene_EnteredApartment.Stop() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(11) ; #DEBUG_LINE_NO:15
  Self.SetStage(200) ; #DEBUG_LINE_NO:16
  Alias_Door_EllieApt.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0011_Item_00()
  Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
  Alias_Actor_Helgi.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0021_Item_00()
  If !Self.GetStageDone(1) ; #DEBUG_LINE_NO:36
    Self.SetStage(1) ; #DEBUG_LINE_NO:37
    Alias_Barrett.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0022_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:47
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:48
  ObjectReference Marker = Alias_Trigger_Gagarin_LandingPad.GetRef() ; #DEBUG_LINE_NO:49
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0023_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:60
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:61
  ObjectReference Marker = Alias_Marker_Mine_Exterior_Player.GetRef() ; #DEBUG_LINE_NO:62
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0024_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:73
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:74
  ObjectReference Marker = Alias_Marker_GoTo_Foundry.GetRef() ; #DEBUG_LINE_NO:75
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:86
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:87
  ObjectReference PlayerMarker = Alias_goto_LawOffice.GetRef() ; #DEBUG_LINE_NO:88
  ObjectReference BarrettMarker = Alias_goto_LawOffice_Barrett.GetRef() ; #DEBUG_LINE_NO:89
  player.MoveTo(PlayerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:91
  Barrett.MoveTo(BarrettMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0026_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:100
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:101
  ObjectReference Marker = Alias_Marker_Clinic.GetRef() ; #DEBUG_LINE_NO:102
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:104
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0027_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:113
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:114
  ObjectReference Marker = Alias_Marker_Store_Clint.GetRef() ; #DEBUG_LINE_NO:115
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:117
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0028_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:126
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:127
  ObjectReference Marker = Alias_Actor_Security.GetRef() ; #DEBUG_LINE_NO:128
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:130
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0029_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:139
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:140
  ObjectReference Marker = Alias_Marker_ErvinApartment_Exterior.GetRef() ; #DEBUG_LINE_NO:141
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:143
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:152
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:153
  ObjectReference Marker = Alias_Marker_ErvinApartment_Interior.GetRef() ; #DEBUG_LINE_NO:154
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:156
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0031_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:165
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:166
  ObjectReference Marker = Alias_Marker_TownHall.GetRef() ; #DEBUG_LINE_NO:167
  player.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:169
  Barrett.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:170
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetStage(116) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetStage(160) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetStage(2501) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetObjectiveCompleted(2140, True) ; #DEBUG_LINE_NO:202
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:204
  Location Apartment = Alias_Location_ErvinApartment.GetLocation() ; #DEBUG_LINE_NO:205
  If Game.GetPlayer().GetItemCount(Key_Employee as Form) < 1 ; #DEBUG_LINE_NO:207
    Game.GetPlayer().AddItem(Key_Employee as Form, 1, False) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
  If player.GetCurrentLocation() == Apartment ; #DEBUG_LINE_NO:211
    Self.SetStage(2065) ; #DEBUG_LINE_NO:212
  ElseIf Game.GetPlayer().IsSneaking() ; #DEBUG_LINE_NO:213
    Self.SetStage(2055) ; #DEBUG_LINE_NO:214
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2060) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Game.GetPlayer().GetItemCount(Key_ErvinFoundry as Form) < 1 ; #DEBUG_LINE_NO:225
    Game.GetPlayer().AddItem(Key_ErvinFoundry as Form, 1, False) ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2450) ; #DEBUG_LINE_NO:229
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(401) ; #DEBUG_LINE_NO:237
    Self.SetStage(400) ; #DEBUG_LINE_NO:238
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2000) ; #DEBUG_LINE_NO:240
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetStage(185) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0181_Item_00()
  Self.SetStage(185) ; #DEBUG_LINE_NO:265
EndFunction

Function Fragment_Stage_0182_Item_00()
  Self.SetStage(185) ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0184_Item_00()
  Self.SetObjectiveDisplayed(7100, True, False) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(7100, True) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0186_Item_00()
  Self.SetStage(185) ; #DEBUG_LINE_NO:297
EndFunction

Function Fragment_Stage_0188_Item_00()
  BQ01_Global_DetectivePoints.Mod(1.0) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:314
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Barret) ; #DEBUG_LINE_NO:315
  COM_BQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:316
  SQ_Followers.CommandFollow(BarrettRef) ; #DEBUG_LINE_NO:317
  If !Self.GetStageDone(201) ; #DEBUG_LINE_NO:320
    If Game.GetPlayer().GetCurrentLocation() == Alias_Location_GagarinSettlement.GetLocation() ; #DEBUG_LINE_NO:321
      Self.SetStage(201) ; #DEBUG_LINE_NO:322
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(210) ; #DEBUG_LINE_NO:324
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  BarrettQuest.SetStage(50) ; #DEBUG_LINE_NO:328
  SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:337
  Alias_Trigger_Gagarin_LandingPad.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:338
  Alias_Marker_GagarinLandingPad.Clear() ; #DEBUG_LINE_NO:339
  Self.SetStage(231) ; #DEBUG_LINE_NO:340
  Self.SetStage(300) ; #DEBUG_LINE_NO:341
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:349
EndFunction

Function Fragment_Stage_0230_Item_00()
  If !Self.GetStageDone(231) ; #DEBUG_LINE_NO:357
    Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:358
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0231_Item_00()
  Self.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:367
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetStage(210) ; #DEBUG_LINE_NO:375
  Self.SetStage(231) ; #DEBUG_LINE_NO:376
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetStage(231) ; #DEBUG_LINE_NO:384
  Self.SetStage(8000) ; #DEBUG_LINE_NO:385
EndFunction

Function Fragment_Stage_0251_Item_00()
  DialogueGagarin_UC_GG.SetStage(200) ; #DEBUG_LINE_NO:393
  Self.SetStage(6502) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(231) ; #DEBUG_LINE_NO:402
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:403
EndFunction

Function Fragment_Stage_0301_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:411
  Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:414
EndFunction

Function Fragment_Stage_0305_Item_00()
  If !Self.GetStageDone(1) ; #DEBUG_LINE_NO:422
    Self.SetStage(1) ; #DEBUG_LINE_NO:423
    Self.SetStage(235) ; #DEBUG_LINE_NO:424
    Self.SetStage(22) ; #DEBUG_LINE_NO:425
  EndIf ; #DEBUG_LINE_NO:
  SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Barret) ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_0315_Item_00()
  Self.SetStage(301) ; #DEBUG_LINE_NO:437
  Self.SetStage(400) ; #DEBUG_LINE_NO:438
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(301) ; #DEBUG_LINE_NO:446
  Self.SetStage(1000) ; #DEBUG_LINE_NO:447
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:455
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:463
  If Self.GetStageDone(436) ; #DEBUG_LINE_NO:465
    Self.SetStage(2701) ; #DEBUG_LINE_NO:466
    Self.SetStage(2801) ; #DEBUG_LINE_NO:467
    Self.SetStage(5000) ; #DEBUG_LINE_NO:468
  ElseIf Self.GetStageDone(434) ; #DEBUG_LINE_NO:469
    Self.SetStage(1000) ; #DEBUG_LINE_NO:470
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2000) ; #DEBUG_LINE_NO:472
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(1107) ; #DEBUG_LINE_NO:475
    Self.SetStage(177) ; #DEBUG_LINE_NO:476
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0404_Item_00()
  If !Self.GetStageDone(409) ; #DEBUG_LINE_NO:485
    Scene_NearLawOffice.Start() ; #DEBUG_LINE_NO:486
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetStage(404) ; #DEBUG_LINE_NO:495
EndFunction

Function Fragment_Stage_0407_Item_00()
  If Alias_Barrett.GetRef().GetCurrentLocation() != Alias_Marker_Gagarin_LawOfficeInterior.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:504
    Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:505
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0409_Item_00()
  Alias_Barrett.GetRef().MoveTo(Alias_Marker_Gagarin_LawOfficeInterior.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:515
  Self.SetStage(301) ; #DEBUG_LINE_NO:518
  Self.SetStage(215) ; #DEBUG_LINE_NO:519
  Self.SetStage(407) ; #DEBUG_LINE_NO:521
  Self.SetStage(400) ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_0434_Item_00()
  Self.SetStage(455) ; #DEBUG_LINE_NO:530
EndFunction

Function Fragment_Stage_0436_Item_00()
  Self.SetObjectiveSkipped(2000) ; #DEBUG_LINE_NO:538
  Self.SetObjectiveSkipped(2100) ; #DEBUG_LINE_NO:539
  Self.SetObjectiveSkipped(2120) ; #DEBUG_LINE_NO:540
  Self.SetObjectiveSkipped(2130) ; #DEBUG_LINE_NO:541
  Self.SetObjectiveSkipped(2140) ; #DEBUG_LINE_NO:542
  Self.SetObjectiveSkipped(2155) ; #DEBUG_LINE_NO:543
  Self.SetObjectiveSkipped(2160) ; #DEBUG_LINE_NO:544
  Self.SetObjectiveSkipped(2300) ; #DEBUG_LINE_NO:545
  Self.SetObjectiveSkipped(2400) ; #DEBUG_LINE_NO:546
  Self.SetObjectiveSkipped(2500) ; #DEBUG_LINE_NO:547
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(401) ; #DEBUG_LINE_NO:555
EndFunction

Function Fragment_Stage_0455_Item_00()
  Scene_GoToErvinApartment.Start() ; #DEBUG_LINE_NO:563
EndFunction

Function Fragment_Stage_10001_Item_00()
  If !Self.GetStageDone(1116) ; #DEBUG_LINE_NO:572
    (Alias_Barrett.GetRef() as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:573
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(1025) && !Self.GetStageDone(1001) ; #DEBUG_LINE_NO:583
    Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:584
  EndIf ; #DEBUG_LINE_NO:
  Alias_Trigger_ErvinApartment_Exterior.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:587
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:588
EndFunction

Function Fragment_Stage_1001_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:596
  Self.SetStage(1000) ; #DEBUG_LINE_NO:597
  Self.SetStage(1015) ; #DEBUG_LINE_NO:598
EndFunction

Function Fragment_Stage_1005_Item_00()
  If !Self.GetStageDone(1) ; #DEBUG_LINE_NO:606
    Self.SetStage(1) ; #DEBUG_LINE_NO:607
    Self.SetStage(305) ; #DEBUG_LINE_NO:608
    Self.SetStage(405) ; #DEBUG_LINE_NO:609
    Self.SetStage(1000) ; #DEBUG_LINE_NO:610
    Self.SetStage(29) ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1010_Item_00()
  Game.GetPlayer().AddAliasedItem(BQ01_Key_ErvinsApartment as Form, Alias_Door_ErvinApartment_Key as Alias, 1, True) ; #DEBUG_LINE_NO:620
EndFunction

Function Fragment_Stage_1015_Item_00()
  If Self.GetStageDone(1000) ; #DEBUG_LINE_NO:628
    Self.SetStage(1020) ; #DEBUG_LINE_NO:629
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1025) ; #DEBUG_LINE_NO:631
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1016_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:648
EndFunction

Function Fragment_Stage_1020_Item_00()
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:656
  Scene_BarrettUsesKey.Start() ; #DEBUG_LINE_NO:658
  Barrett.EvaluatePackage(False) ; #DEBUG_LINE_NO:659
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:661
  Self.SetStage(1016) ; #DEBUG_LINE_NO:662
EndFunction

Function Fragment_Stage_1025_Item_00()
  Actor Barrett = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:670
  Scene_BarrettUsesKey.Start() ; #DEBUG_LINE_NO:672
  Barrett.EvaluatePackage(False) ; #DEBUG_LINE_NO:673
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:675
  Self.SetStage(1016) ; #DEBUG_LINE_NO:676
EndFunction

Function Fragment_Stage_1030_Item_00()
  If !Self.GetStageDone(401) ; #DEBUG_LINE_NO:684
    Self.SetStage(400) ; #DEBUG_LINE_NO:685
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2000) ; #DEBUG_LINE_NO:687
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveSkipped(1000) ; #DEBUG_LINE_NO:696
  Self.SetObjectiveSkipped(1100) ; #DEBUG_LINE_NO:697
  If Game.GetPlayer().GetItemCount(Key_ErvinsApartment as Form) > 0 ; #DEBUG_LINE_NO:700
    Game.GetPlayer().RemoveItem(Key_ErvinsApartment as Form, 1, False, None) ; #DEBUG_LINE_NO:701
  EndIf ; #DEBUG_LINE_NO:
  If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment as Form) > 0 ; #DEBUG_LINE_NO:705
    Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment as Form, 1, False, None) ; #DEBUG_LINE_NO:706
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(400) ; #DEBUG_LINE_NO:709
EndFunction

Function Fragment_Stage_1055_Item_00()
  Self.SetObjectiveSkipped(1000) ; #DEBUG_LINE_NO:717
  Self.SetObjectiveSkipped(1100) ; #DEBUG_LINE_NO:718
  If Game.GetPlayer().GetItemCount(Key_ErvinsApartment as Form) > 0 ; #DEBUG_LINE_NO:721
    Game.GetPlayer().RemoveItem(Key_ErvinsApartment as Form, 1, False, None) ; #DEBUG_LINE_NO:722
  EndIf ; #DEBUG_LINE_NO:
  If Alias_Barrett.GetRef().GetItemCount(Key_ErvinsApartment as Form) > 0 ; #DEBUG_LINE_NO:726
    Alias_Barrett.GetRef().RemoveItem(Key_ErvinsApartment as Form, 1, False, None) ; #DEBUG_LINE_NO:727
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2000) ; #DEBUG_LINE_NO:730
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:738
  Self.SetStage(1016) ; #DEBUG_LINE_NO:739
EndFunction

Function Fragment_Stage_1101_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:747
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:748
  Self.SetStage(1200) ; #DEBUG_LINE_NO:749
  If Self.GetStageDone(136) && !Self.GetStageDone(1060) ; #DEBUG_LINE_NO:752
    Self.SetStage(1106) ; #DEBUG_LINE_NO:753
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1105) ; #DEBUG_LINE_NO:755
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(115) ; #DEBUG_LINE_NO:759
    Self.SetStage(1102) ; #DEBUG_LINE_NO:760
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1101_Item_01()
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:769
  BarrettRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:771
  BarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:772
EndFunction

Function Fragment_Stage_1102_Item_00()
  ObjectReference PasscodeCrate = Alias_Container_ErvinApartment_FoundryKey.GetRef() ; #DEBUG_LINE_NO:780
  PasscodeCrate.Enable(False) ; #DEBUG_LINE_NO:782
  PasscodeCrate.Unlock(False) ; #DEBUG_LINE_NO:783
EndFunction

Function Fragment_Stage_1105_Item_00()
  Scene_EnteredApartment.Start() ; #DEBUG_LINE_NO:791
EndFunction

Function Fragment_Stage_1107_Item_00()
  BQ01_Scene_BARK_1107_ErvinApt_InteriorScene.Start() ; #DEBUG_LINE_NO:799
EndFunction

Function Fragment_Stage_1108_Item_00()
  ObjectReference CactusRef = Alias_Container_ErvinApartment_Cactus.GetRef() ; #DEBUG_LINE_NO:807
  Game.GetPlayer().RemoveItem(CactusRef as Form, 1, True, None) ; #DEBUG_LINE_NO:809
  CactusRef.DisableNoWait(False) ; #DEBUG_LINE_NO:810
  Self.SetStage(125) ; #DEBUG_LINE_NO:811
EndFunction

Function Fragment_Stage_1109_Item_00()
  BQ01_Scene_GREET_1107_ErvinApt_InteriorScene.Start() ; #DEBUG_LINE_NO:819
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:827
EndFunction

Function Fragment_Stage_1201_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:838
  Self.SetStage(1300) ; #DEBUG_LINE_NO:840
EndFunction

Function Fragment_Stage_1205_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:848
  Self.SetStage(1005) ; #DEBUG_LINE_NO:849
  Self.SetStage(1200) ; #DEBUG_LINE_NO:850
  Self.SetStage(30) ; #DEBUG_LINE_NO:851
EndFunction

Function Fragment_Stage_1220_Item_00()
  Self.SetStage(1221) ; #DEBUG_LINE_NO:859
EndFunction

Function Fragment_Stage_1221_Item_00()
  Scene_NearSafe.Start() ; #DEBUG_LINE_NO:867
EndFunction

Function Fragment_Stage_1225_Item_00()
  ObjectReference Safe = Alias_Safe_ErvinApartment.GetRef() ; #DEBUG_LINE_NO:875
  Safe.Unlock(False) ; #DEBUG_LINE_NO:877
  Safe.SetOpen(True) ; #DEBUG_LINE_NO:878
  Self.SetStage(1226) ; #DEBUG_LINE_NO:880
EndFunction

Function Fragment_Stage_1226_Item_00()
  Scene_OpenSafe.Start() ; #DEBUG_LINE_NO:888
EndFunction

Function Fragment_Stage_1228_Item_00()
  Self.SetStage(130) ; #DEBUG_LINE_NO:896
  Self.SetStage(1229) ; #DEBUG_LINE_NO:897
  If Self.GetStageDone(131) ; #DEBUG_LINE_NO:899
    Self.SetStage(1201) ; #DEBUG_LINE_NO:900
  EndIf ; #DEBUG_LINE_NO:
  BQ01_Global_DetectivePoints.Mod(1.0) ; #DEBUG_LINE_NO:903
EndFunction

Function Fragment_Stage_1229_Item_00()
  Scene_PlayerFoundContract.Start() ; #DEBUG_LINE_NO:911
EndFunction

Function Fragment_Stage_1230_Item_00()
  Self.SetStage(1231) ; #DEBUG_LINE_NO:919
EndFunction

Function Fragment_Stage_1231_Item_00()
  Scene_NearTerminal.Start() ; #DEBUG_LINE_NO:927
EndFunction

Function Fragment_Stage_1235_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 3, False) ; #DEBUG_LINE_NO:935
EndFunction

Function Fragment_Stage_1238_Item_00()
  Self.SetStage(131) ; #DEBUG_LINE_NO:943
  Self.SetStage(159) ; #DEBUG_LINE_NO:944
  Self.SetStage(1239) ; #DEBUG_LINE_NO:945
  Self.SetStage(1500) ; #DEBUG_LINE_NO:946
  If Self.GetStageDone(130) ; #DEBUG_LINE_NO:948
    Self.SetStage(1201) ; #DEBUG_LINE_NO:949
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1239_Item_00()
  Scene_FoundLicense.Start() ; #DEBUG_LINE_NO:958
EndFunction

Function Fragment_Stage_1240_Item_00()
  Scene_NearPasscodeCrate.Start() ; #DEBUG_LINE_NO:966
EndFunction

Function Fragment_Stage_1241_Item_00()
  Self.SetStage(1241) ; #DEBUG_LINE_NO:974
  Self.SetStage(1300) ; #DEBUG_LINE_NO:975
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetStage(1300) ; #DEBUG_LINE_NO:983
  If Self.GetStageDone(1107) ; #DEBUG_LINE_NO:985
    Self.SetStage(1108) ; #DEBUG_LINE_NO:986
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:995
  Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:996
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:997
  Alias_Container_ErvinApartment_EnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:998
EndFunction

Function Fragment_Stage_1301_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1006
  Alias_Trigger_ErvinApartment_Plant_Exterior.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:1007
EndFunction

Function Fragment_Stage_1305_Item_00()
  Self.SetStage(1228) ; #DEBUG_LINE_NO:1015
  Self.SetStage(1238) ; #DEBUG_LINE_NO:1016
  Self.SetStage(1205) ; #DEBUG_LINE_NO:1017
  Self.SetStage(31) ; #DEBUG_LINE_NO:1018
  Self.SetStage(1300) ; #DEBUG_LINE_NO:1019
  Self.SetStage(1600) ; #DEBUG_LINE_NO:1020
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:1028
EndFunction

Function Fragment_Stage_1501_Item_00()
  Self.SetObjectiveCompleted(1500, True) ; #DEBUG_LINE_NO:1036
  Self.SetStage(1301) ; #DEBUG_LINE_NO:1038
  Self.SetStage(1502) ; #DEBUG_LINE_NO:1039
  Self.SetStage(1510) ; #DEBUG_LINE_NO:1040
EndFunction

Function Fragment_Stage_1502_Item_00()
  Scene_TownHallArrival.Start() ; #DEBUG_LINE_NO:1048
EndFunction

Function Fragment_Stage_1505_Item_00()
  Self.SetStage(1305) ; #DEBUG_LINE_NO:1056
  Self.SetStage(1301) ; #DEBUG_LINE_NO:1057
  Self.SetStage(1500) ; #DEBUG_LINE_NO:1058
  Self.SetStage(31) ; #DEBUG_LINE_NO:1059
EndFunction

Function Fragment_Stage_1510_Item_00()
  Self.SetStage(150) ; #DEBUG_LINE_NO:1067
  Self.SetStage(1501) ; #DEBUG_LINE_NO:1068
  Self.SetObjectiveDisplayed(1510, True, False) ; #DEBUG_LINE_NO:1069
EndFunction

Function Fragment_Stage_1515_Item_00()
  Self.SetObjectiveCompleted(1510, True) ; #DEBUG_LINE_NO:1077
  Self.SetStage(159) ; #DEBUG_LINE_NO:1078
  Self.SetStage(1520) ; #DEBUG_LINE_NO:1079
  Self.SetStage(1600) ; #DEBUG_LINE_NO:1080
  BQ01_Global_DetectivePoints.Mod(1.0) ; #DEBUG_LINE_NO:1082
EndFunction

Function Fragment_Stage_1520_Item_00()
  Scene_TownHall_FoundLicense.Start() ; #DEBUG_LINE_NO:1090
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveDisplayed(1600, True, False) ; #DEBUG_LINE_NO:1098
EndFunction

Function Fragment_Stage_1601_Item_00()
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:1106
  Self.SetStage(2000) ; #DEBUG_LINE_NO:1107
  If Self.GetStageDone(1107) ; #DEBUG_LINE_NO:1109
    Self.SetStage(177) ; #DEBUG_LINE_NO:1110
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetStage(1505) ; #DEBUG_LINE_NO:1119
  Self.SetStage(1515) ; #DEBUG_LINE_NO:1120
  Self.SetStage(1600) ; #DEBUG_LINE_NO:1121
  Self.SetStage(25) ; #DEBUG_LINE_NO:1122
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:1130
  Self.Stop() ; #DEBUG_LINE_NO:1131
EndFunction

Function Fragment_Stage_2000_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1139
    Self.SetObjectiveDisplayed(2000, True, False) ; #DEBUG_LINE_NO:1140
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2002) ; #DEBUG_LINE_NO:1143
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1145
EndFunction

Function Fragment_Stage_2001_Item_00()
  Self.SetObjectiveCompleted(2000, True) ; #DEBUG_LINE_NO:1153
  Self.SetStage(401) ; #DEBUG_LINE_NO:1154
  Self.SetStage(2100) ; #DEBUG_LINE_NO:1155
EndFunction

Function Fragment_Stage_2002_Item_00()
  Scene_GoToFoundry.Start() ; #DEBUG_LINE_NO:1163
EndFunction

Function Fragment_Stage_2005_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:1171
  Self.SetStage(182) ; #DEBUG_LINE_NO:1172
  Self.SetStage(351) ; #DEBUG_LINE_NO:1173
  Self.SetStage(301) ; #DEBUG_LINE_NO:1174
  Self.SetStage(401) ; #DEBUG_LINE_NO:1175
  If !Self.GetStageDone(2805) ; #DEBUG_LINE_NO:1177
    Self.SetStage(2000) ; #DEBUG_LINE_NO:1178
    Self.SetStage(24) ; #DEBUG_LINE_NO:1179
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2055_Item_00()
  Self.SetObjectiveCompleted(2140, True) ; #DEBUG_LINE_NO:1188
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1189
EndFunction

Function Fragment_Stage_2060_Item_00()
  Self.SetObjectiveCompleted(2140, True) ; #DEBUG_LINE_NO:1197
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1198
EndFunction

Function Fragment_Stage_2065_Item_00()
  Self.SetObjectiveCompleted(2140, True) ; #DEBUG_LINE_NO:1206
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1207
EndFunction

Function Fragment_Stage_2100_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1215
    Self.SetObjectiveDisplayed(2155, True, False) ; #DEBUG_LINE_NO:1216
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetItemCount(Key_ErvinFoundry as Form) > 0 ; #DEBUG_LINE_NO:1220
    Self.SetStage(2120) ; #DEBUG_LINE_NO:1221
  ElseIf Game.GetPlayer().GetItemCount(Key_Employee as Form) > 0 ; #DEBUG_LINE_NO:1222
    Self.SetStage(2130) ; #DEBUG_LINE_NO:1223
  ElseIf Self.GetStageDone(433) ; #DEBUG_LINE_NO:1225
    Self.SetStage(2160) ; #DEBUG_LINE_NO:1226
  ElseIf Self.GetStageDone(431) ; #DEBUG_LINE_NO:1227
    Self.SetStage(2140) ; #DEBUG_LINE_NO:1228
  ElseIf Self.GetStageDone(432) ; #DEBUG_LINE_NO:1229
    Self.SetStage(2150) ; #DEBUG_LINE_NO:1230
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2110) ; #DEBUG_LINE_NO:1232
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2101_Item_00()
  Self.SetObjectiveCompleted(2155, True) ; #DEBUG_LINE_NO:1242
  Self.SetObjectiveSkipped(2110) ; #DEBUG_LINE_NO:1243
  Self.SetObjectiveSkipped(2120) ; #DEBUG_LINE_NO:1244
  Self.SetObjectiveSkipped(2130) ; #DEBUG_LINE_NO:1245
  Self.SetObjectiveSkipped(2140) ; #DEBUG_LINE_NO:1246
  Self.SetObjectiveSkipped(2160) ; #DEBUG_LINE_NO:1247
  Self.SetStage(2302) ; #DEBUG_LINE_NO:1249
  Self.SetObjectiveSkipped(2400) ; #DEBUG_LINE_NO:1250
  Self.SetStage(2501) ; #DEBUG_LINE_NO:1251
  Self.SetStage(2800) ; #DEBUG_LINE_NO:1253
EndFunction

Function Fragment_Stage_2110_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1261
    Self.SetObjectiveDisplayed(2100, True, False) ; #DEBUG_LINE_NO:1262
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2115) ; #DEBUG_LINE_NO:1264
EndFunction

Function Fragment_Stage_2111_Item_00()
  Self.SetObjectiveCompleted(2100, True) ; #DEBUG_LINE_NO:1272
  Self.SetStage(2300) ; #DEBUG_LINE_NO:1273
EndFunction

Function Fragment_Stage_2112_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, PlayerPaycheck.GetValue() as Int, False) ; #DEBUG_LINE_NO:1281
EndFunction

Function Fragment_Stage_2115_Item_00()
  Scene_FoundryNormalTrack.Start() ; #DEBUG_LINE_NO:1289
EndFunction

Function Fragment_Stage_2120_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1297
    Self.SetObjectiveDisplayed(2120, True, False) ; #DEBUG_LINE_NO:1298
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2125) ; #DEBUG_LINE_NO:1301
EndFunction

Function Fragment_Stage_2121_Item_00()
  Self.SetObjectiveCompleted(2120, True) ; #DEBUG_LINE_NO:1309
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1310
EndFunction

Function Fragment_Stage_2125_Item_00()
  Scene_FoundryErvinTrack.Start() ; #DEBUG_LINE_NO:1318
EndFunction

Function Fragment_Stage_2130_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1326
    Self.SetObjectiveDisplayed(2130, True, False) ; #DEBUG_LINE_NO:1327
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2135) ; #DEBUG_LINE_NO:1329
EndFunction

Function Fragment_Stage_2131_Item_00()
  Self.SetObjectiveCompleted(2130, True) ; #DEBUG_LINE_NO:1337
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1338
EndFunction

Function Fragment_Stage_2132_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, PlayerPaycheck.GetValue() as Int, False) ; #DEBUG_LINE_NO:1346
EndFunction

Function Fragment_Stage_2135_Item_00()
  Scene_FoundryEmployeeTrack.Start() ; #DEBUG_LINE_NO:1354
EndFunction

Function Fragment_Stage_2140_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1362
    Self.SetObjectiveDisplayed(2140, True, False) ; #DEBUG_LINE_NO:1363
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2145) ; #DEBUG_LINE_NO:1365
EndFunction

Function Fragment_Stage_2141_Item_00()
  Self.SetObjectiveCompleted(2140, True) ; #DEBUG_LINE_NO:1373
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1374
EndFunction

Function Fragment_Stage_2145_Item_00()
  Scene_FoundryTheftTrack.Start() ; #DEBUG_LINE_NO:1382
EndFunction

Function Fragment_Stage_2150_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1390
    Self.SetObjectiveDisplayed(2110, True, False) ; #DEBUG_LINE_NO:1391
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2155) ; #DEBUG_LINE_NO:1393
EndFunction

Function Fragment_Stage_2155_Item_00()
  Scene_FoundryGeologyTrack.Start() ; #DEBUG_LINE_NO:1401
EndFunction

Function Fragment_Stage_2160_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1409
    Self.SetObjectiveDisplayed(2160, True, False) ; #DEBUG_LINE_NO:1410
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(2165) ; #DEBUG_LINE_NO:1412
EndFunction

Function Fragment_Stage_2161_Item_00()
  Self.SetObjectiveCompleted(2160, True) ; #DEBUG_LINE_NO:1420
  Self.SetStage(2500) ; #DEBUG_LINE_NO:1421
EndFunction

Function Fragment_Stage_2165_Item_00()
  Scene_FoundryTrackCyberRunner.Start() ; #DEBUG_LINE_NO:1429
EndFunction

Function Fragment_Stage_2300_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1437
    Self.SetObjectiveDisplayed(2300, True, False) ; #DEBUG_LINE_NO:1438
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2301_Item_00()
  If !Self.GetStageDone(2302) ; #DEBUG_LINE_NO:1447
    Self.SetObjectiveCompleted(2300, True) ; #DEBUG_LINE_NO:1448
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2302_Item_00()
  If !Self.GetStageDone(2301) ; #DEBUG_LINE_NO:1457
    Self.SetObjectiveSkipped(2300) ; #DEBUG_LINE_NO:1458
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2310_Item_00()
  Self.SetStage(2301) ; #DEBUG_LINE_NO:1467
  Self.SetStage(2350) ; #DEBUG_LINE_NO:1468
EndFunction

Function Fragment_Stage_2330_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MediumCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:1476
  Self.SetStage(2301) ; #DEBUG_LINE_NO:1478
  Self.SetStage(2350) ; #DEBUG_LINE_NO:1479
EndFunction

Function Fragment_Stage_2340_Item_00()
  Self.SetStage(2301) ; #DEBUG_LINE_NO:1487
  Self.SetStage(2350) ; #DEBUG_LINE_NO:1488
EndFunction

Function Fragment_Stage_2350_Item_00()
  Self.SetStage(2600) ; #DEBUG_LINE_NO:1496
  Self.SetStage(133) ; #DEBUG_LINE_NO:1498
EndFunction

Function Fragment_Stage_2400_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1506
    Self.SetObjectiveDisplayed(2400, True, False) ; #DEBUG_LINE_NO:1507
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2401_Item_00()
  Self.SetObjectiveCompleted(2400, True) ; #DEBUG_LINE_NO:1516
EndFunction

Function Fragment_Stage_2420_Item_00()
  Int BribeAmount = MediumCredits.GetValue() as Int ; #DEBUG_LINE_NO:1524
  Int MinimumAmount = SmallCredits.GetValue() as Int ; #DEBUG_LINE_NO:1525
  Int PlayerHas = Game.GetPlayer().GetItemCount(Credits as Form) ; #DEBUG_LINE_NO:1526
  Int DonationAmount = BribeAmount - PlayerHas ; #DEBUG_LINE_NO:1527
  If DonationAmount > BribeAmount ; #DEBUG_LINE_NO:1529
    DonationAmount = BribeAmount ; #DEBUG_LINE_NO:1530
  ElseIf DonationAmount > 0 ; #DEBUG_LINE_NO:1531
    Game.GetPlayer().AddItem(Credits as Form, DonationAmount, False) ; #DEBUG_LINE_NO:1532
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(Credits as Form, MinimumAmount, False) ; #DEBUG_LINE_NO:1534
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2500_Item_00()
  If !Self.GetStageDone(436) ; #DEBUG_LINE_NO:1543
    Self.SetObjectiveDisplayed(2500, True, False) ; #DEBUG_LINE_NO:1544
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2501_Item_00()
  Self.SetObjectiveCompleted(2500, True) ; #DEBUG_LINE_NO:1553
  Self.SetStage(160) ; #DEBUG_LINE_NO:1554
  Self.SetStage(2101) ; #DEBUG_LINE_NO:1555
  Self.SetStage(2800) ; #DEBUG_LINE_NO:1557
EndFunction

Function Fragment_Stage_2800_Item_00()
  Self.SetObjectiveCompleted(2500, True) ; #DEBUG_LINE_NO:1565
  Self.SetObjectiveDisplayed(2800, True, False) ; #DEBUG_LINE_NO:1566
  Self.SetStage(2101) ; #DEBUG_LINE_NO:1568
  Self.SetStage(2401) ; #DEBUG_LINE_NO:1569
  Self.SetStage(2501) ; #DEBUG_LINE_NO:1570
EndFunction

Function Fragment_Stage_2801_Item_00()
  Self.SetObjectiveCompleted(2800, True) ; #DEBUG_LINE_NO:1578
  Self.SetStage(5000) ; #DEBUG_LINE_NO:1580
EndFunction

Function Fragment_Stage_2805_Item_00()
  Self.SetStage(2005) ; #DEBUG_LINE_NO:1588
  Self.SetStage(2101) ; #DEBUG_LINE_NO:1589
  Self.SetStage(2801) ; #DEBUG_LINE_NO:1590
  If !Self.GetStageDone(5005) && !Self.GetStageDone(6005) ; #DEBUG_LINE_NO:1592
    Self.SetStage(5000) ; #DEBUG_LINE_NO:1593
    Self.SetStage(23) ; #DEBUG_LINE_NO:1594
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.SetObjectiveDisplayed(5000, True, False) ; #DEBUG_LINE_NO:1603
  Alias_Door_Mine_LockEntry.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:1605
  Alias_Door_Mine_LockEntry01.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:1606
  ObjectReference MapRef = Alias_Marker_Mine_MapMarker.GetRef() ; #DEBUG_LINE_NO:1607
  MapRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1609
  MapRef.AddToMapScanned(False) ; #DEBUG_LINE_NO:1610
  Self.SetStage(2801) ; #DEBUG_LINE_NO:1611
EndFunction

Function Fragment_Stage_5001_Item_00()
  Self.SetObjectiveCompleted(5000, True) ; #DEBUG_LINE_NO:1619
  Self.SetObjectiveDisplayed(5100, True, False) ; #DEBUG_LINE_NO:1620
  Self.SetStage(2101) ; #DEBUG_LINE_NO:1621
  Self.SetStage(2801) ; #DEBUG_LINE_NO:1622
  Self.SetStage(5011) ; #DEBUG_LINE_NO:1623
EndFunction

Function Fragment_Stage_5005_Item_00()
  Self.SetStage(2805) ; #DEBUG_LINE_NO:1631
  If !Self.GetStageDone(6005) ; #DEBUG_LINE_NO:1633
    Self.SetStage(5000) ; #DEBUG_LINE_NO:1634
    Self.SetStage(23) ; #DEBUG_LINE_NO:1635
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_5011_Item_00()
  Scene_Mine_Comment01_LandingPad.Start() ; #DEBUG_LINE_NO:1644
  Self.SetStage(5010) ; #DEBUG_LINE_NO:1645
EndFunction

Function Fragment_Stage_5012_Item_00()
  Scene_Mine_Comment02_Exterior.Start() ; #DEBUG_LINE_NO:1653
EndFunction

Function Fragment_Stage_5013_Item_00()
  Scene_Mine_Comment03_Interior.Start() ; #DEBUG_LINE_NO:1661
  Self.SetStage(5200) ; #DEBUG_LINE_NO:1663
EndFunction

Function Fragment_Stage_5014_Item_00()
  Scene_Mine_Comment04_Office.Start() ; #DEBUG_LINE_NO:1671
  Self.SetStage(5200) ; #DEBUG_LINE_NO:1672
EndFunction

Function Fragment_Stage_5031_Item_00()
  Scene_Cave_Comment01_NearElevator.Start() ; #DEBUG_LINE_NO:1680
  Self.SetStage(530) ; #DEBUG_LINE_NO:1681
EndFunction

Function Fragment_Stage_5032_Item_00()
  Scene_Cave_Comment02_Entrance.Start() ; #DEBUG_LINE_NO:1689
EndFunction

Function Fragment_Stage_5033_Item_00()
  Scene_Cave_Comment03_Eggs.Start() ; #DEBUG_LINE_NO:1697
EndFunction

Function Fragment_Stage_5034_Item_00()
  Scene_Cave_Comment04_Tunnels.Start() ; #DEBUG_LINE_NO:1705
EndFunction

Function Fragment_Stage_5035_Item_00()
  Scene_Cave_Comment05_HelgiLab.Start() ; #DEBUG_LINE_NO:1713
EndFunction

Function Fragment_Stage_5036_Item_00()
  Scene_Cave_Comment06_Nest.Start() ; #DEBUG_LINE_NO:1721
EndFunction

Function Fragment_Stage_5200_Item_00()
  Self.SetObjectiveCompleted(5000, True) ; #DEBUG_LINE_NO:1729
  Self.SetObjectiveDisplayed(5100, True, False) ; #DEBUG_LINE_NO:1730
  Self.SetStage(5010) ; #DEBUG_LINE_NO:1731
EndFunction

Function Fragment_Stage_5201_Item_00()
  Self.SetObjectiveCompleted(5100, True) ; #DEBUG_LINE_NO:1739
  Self.SetStage(6000) ; #DEBUG_LINE_NO:1740
EndFunction

Function Fragment_Stage_5210_Item_00()
  Scene_FoundEvidence_Admin.Start() ; #DEBUG_LINE_NO:1748
  If Self.GetStageDone(5220) && Self.GetStageDone(5230) ; #DEBUG_LINE_NO:1750
    Self.SetStage(5201) ; #DEBUG_LINE_NO:1751
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:1754
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalMain.GetRef() ; #DEBUG_LINE_NO:1755
  If BarrettRef.GetDistance(MarkerRef) > 6.0 ; #DEBUG_LINE_NO:1757
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1758
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_5220_Item_00()
  Scene_FoundEvidence_Helgi.Start() ; #DEBUG_LINE_NO:1767
  Self.SetStage(121) ; #DEBUG_LINE_NO:1768
  If Self.GetStageDone(5210) && Self.GetStageDone(5230) ; #DEBUG_LINE_NO:1770
    Self.SetStage(5201) ; #DEBUG_LINE_NO:1771
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:1774
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalHelgi.GetRef() ; #DEBUG_LINE_NO:1775
  If BarrettRef.GetDistance(MarkerRef) > 6.0 ; #DEBUG_LINE_NO:1777
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1778
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_5225_Item_00()
  ObjectReference Computer = Alias_Terminal_Mine_Cave_HelgiStation.GetRef() ; #DEBUG_LINE_NO:1787
  Computer.Unlock(False) ; #DEBUG_LINE_NO:1789
  Computer.SetOpen(True) ; #DEBUG_LINE_NO:1790
  Self.SetStage(5211) ; #DEBUG_LINE_NO:1791
EndFunction

Function Fragment_Stage_5230_Item_00()
  Scene_FoundEvidence_Ervin.Start() ; #DEBUG_LINE_NO:1799
  If Self.GetStageDone(5220) && Self.GetStageDone(5210) ; #DEBUG_LINE_NO:1801
    Self.SetStage(5201) ; #DEBUG_LINE_NO:1802
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:1805
  ObjectReference MarkerRef = Alias_Marker_Mine_TerminalErvin.GetRef() ; #DEBUG_LINE_NO:1806
  If BarrettRef.GetDistance(MarkerRef) > 6.0 ; #DEBUG_LINE_NO:1808
    BarrettRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1809
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_5235_Item_00()
  ObjectReference Computer = Alias_Terminal_Mine_Lab_ErvinStation.GetRef() ; #DEBUG_LINE_NO:1818
  Computer.Unlock(False) ; #DEBUG_LINE_NO:1820
  Computer.SetOpen(True) ; #DEBUG_LINE_NO:1821
  Self.SetStage(5212) ; #DEBUG_LINE_NO:1822
EndFunction

Function Fragment_Stage_6000_Item_00()
  Self.SetObjectiveSkipped(1600) ; #DEBUG_LINE_NO:1830
  Self.SetObjectiveDisplayed(6000, True, False) ; #DEBUG_LINE_NO:1831
EndFunction

Function Fragment_Stage_6001_Item_00()
  Self.SetObjectiveCompleted(6000, True) ; #DEBUG_LINE_NO:1839
  Self.SetStage(6300) ; #DEBUG_LINE_NO:1840
EndFunction

Function Fragment_Stage_6005_Item_00()
  Self.SetStage(5005) ; #DEBUG_LINE_NO:1848
  Self.SetStage(5201) ; #DEBUG_LINE_NO:1849
  Self.SetStage(5210) ; #DEBUG_LINE_NO:1850
  Self.SetStage(5220) ; #DEBUG_LINE_NO:1851
  Self.SetStage(5230) ; #DEBUG_LINE_NO:1852
  If !Self.GetStageDone(6305) ; #DEBUG_LINE_NO:1854
    Self.SetStage(25) ; #DEBUG_LINE_NO:1855
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6010_Item_00()
  Self.SetStage(6015) ; #DEBUG_LINE_NO:1864
EndFunction

Function Fragment_Stage_6015_Item_00()
  Scene_Vignette_ReturnedFromMine.Start() ; #DEBUG_LINE_NO:1872
EndFunction

Function Fragment_Stage_6112_Item_00()
  Self.SetStage(6001) ; #DEBUG_LINE_NO:1880
EndFunction

Function Fragment_Stage_6300_Item_00()
  Self.SetStage(121) ; #DEBUG_LINE_NO:1888
  Self.SetStage(6315) ; #DEBUG_LINE_NO:1889
  If Self.GetStageDone(6110) ; #DEBUG_LINE_NO:1891
    Self.SetStage(6500) ; #DEBUG_LINE_NO:1892
  ElseIf Self.GetStageDone(6111) ; #DEBUG_LINE_NO:1893
    Self.SetStage(6400) ; #DEBUG_LINE_NO:1894
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6301_Item_00()
  Self.SetObjectiveCompleted(6300, True) ; #DEBUG_LINE_NO:1903
  Self.SetObjectiveCompleted(6500, True) ; #DEBUG_LINE_NO:1904
  Self.SetStage(7000) ; #DEBUG_LINE_NO:1906
EndFunction

Function Fragment_Stage_6305_Item_00()
  Self.SetStage(6005) ; #DEBUG_LINE_NO:1914
  Self.SetStage(6001) ; #DEBUG_LINE_NO:1915
  Self.SetStage(6111) ; #DEBUG_LINE_NO:1916
  Self.SetStage(6300) ; #DEBUG_LINE_NO:1917
  If Self.GetStageDone(6405) ; #DEBUG_LINE_NO:1919
    Self.SetStage(27) ; #DEBUG_LINE_NO:1920
  ElseIf Self.GetStageDone(6705) ; #DEBUG_LINE_NO:1921
    Self.SetStage(28) ; #DEBUG_LINE_NO:1922
  ElseIf Self.GetStageDone(6605) ; #DEBUG_LINE_NO:1923
    Self.SetStage(29) ; #DEBUG_LINE_NO:1924
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6315_Item_00()
  Alias_Actor_Helgi.GetRef().MoveTo(Alias_Marker_Spawn_Helgi.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1933
EndFunction

Function Fragment_Stage_6400_Item_00()
  Self.SetObjectiveDisplayed(6400, True, False) ; #DEBUG_LINE_NO:1941
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1943
EndFunction

Function Fragment_Stage_6401_Item_00()
  Self.SetObjectiveCompleted(6400, True) ; #DEBUG_LINE_NO:1951
  If Self.GetStageDone(6425) ; #DEBUG_LINE_NO:1953
    Self.SetStage(6500) ; #DEBUG_LINE_NO:1954
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(6700) ; #DEBUG_LINE_NO:1956
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6405_Item_00()
  Self.SetStage(6305) ; #DEBUG_LINE_NO:1965
  Self.SetStage(6400) ; #DEBUG_LINE_NO:1966
EndFunction

Function Fragment_Stage_6415_Item_00()
  Self.SetStage(6430) ; #DEBUG_LINE_NO:1974
EndFunction

Function Fragment_Stage_6422_Item_00()
  Int PlayerAmount = Game.GetPlayer().GetItemCount(Addichrone as Form) ; #DEBUG_LINE_NO:1982
  If PlayerAmount >= 3 ; #DEBUG_LINE_NO:1984
    Game.GetPlayer().RemoveItem(Addichrone as Form, 3, False, None) ; #DEBUG_LINE_NO:1985
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().RemoveItem(Addichrone as Form, PlayerAmount, False, None) ; #DEBUG_LINE_NO:1987
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6425_Item_00()
  Self.SetStage(6430) ; #DEBUG_LINE_NO:1996
EndFunction

Function Fragment_Stage_6430_Item_00()
  Self.SetStage(6401) ; #DEBUG_LINE_NO:2004
EndFunction

Function Fragment_Stage_6500_Item_00()
  Self.SetObjectiveDisplayed(6500, True, False) ; #DEBUG_LINE_NO:2012
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:2014
EndFunction

Function Fragment_Stage_6501_Item_00()
  If !Self.GetStageDone(6520) && !Self.GetStageDone(6521) ; #DEBUG_LINE_NO:2022
    Self.SetObjectiveCompleted(6500, True) ; #DEBUG_LINE_NO:2023
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveSkipped(6500) ; #DEBUG_LINE_NO:2025
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6522_Item_00()
  Self.SetStage(6301) ; #DEBUG_LINE_NO:2034
  Self.SetStage(6501) ; #DEBUG_LINE_NO:2035
EndFunction

Function Fragment_Stage_6601_Item_00()
  Self.SetObjectiveCompleted(6720, True) ; #DEBUG_LINE_NO:2043
  Scene_DalitsoEndConvo.Start() ; #DEBUG_LINE_NO:2046
  Self.SetStage(6650) ; #DEBUG_LINE_NO:2047
EndFunction

Function Fragment_Stage_6605_Item_00()
  Self.SetStage(6305) ; #DEBUG_LINE_NO:2055
  Self.SetStage(6600) ; #DEBUG_LINE_NO:2056
EndFunction

Function Fragment_Stage_6650_Item_00()
  Self.SetObjectiveDisplayed(6650, True, False) ; #DEBUG_LINE_NO:2064
EndFunction

Function Fragment_Stage_6651_Item_00()
  If Self.GetStageDone(6650) ; #DEBUG_LINE_NO:2072
    Self.SetObjectiveCompleted(6650, True) ; #DEBUG_LINE_NO:2073
    Self.SetStage(6670) ; #DEBUG_LINE_NO:2074
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6652_Item_00()
  Self.SetObjectiveCompleted(6650, True) ; #DEBUG_LINE_NO:2083
  Self.SetObjectiveDisplayed(6652, True, False) ; #DEBUG_LINE_NO:2084
EndFunction

Function Fragment_Stage_6653_Item_00()
  Self.SetObjectiveCompleted(6650, True) ; #DEBUG_LINE_NO:2092
  If Self.GetStageDone(6652) ; #DEBUG_LINE_NO:2093
    Self.SetObjectiveFailed(6652, True) ; #DEBUG_LINE_NO:2094
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(6656) && !Self.GetStageDone(7000) ; #DEBUG_LINE_NO:2097
    Self.SetObjectiveDisplayed(6653, True, False) ; #DEBUG_LINE_NO:2098
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6656_Item_00()
  Self.SetObjectiveCompleted(6652, True) ; #DEBUG_LINE_NO:2107
  Self.SetObjectiveCompleted(6656, True) ; #DEBUG_LINE_NO:2108
  Self.SetStage(6657) ; #DEBUG_LINE_NO:2109
EndFunction

Function Fragment_Stage_6657_Item_00()
  Self.SetObjectiveDisplayed(6657, True, False) ; #DEBUG_LINE_NO:2117
EndFunction

Function Fragment_Stage_6658_Item_00()
  Self.SetObjectiveCompleted(6657, True) ; #DEBUG_LINE_NO:2125
  Self.SetStage(7000) ; #DEBUG_LINE_NO:2126
EndFunction

Function Fragment_Stage_6659_Item_00()
  Self.SetObjectiveSkipped(6400) ; #DEBUG_LINE_NO:2134
  Self.SetObjectiveSkipped(6500) ; #DEBUG_LINE_NO:2135
  Self.SetObjectiveSkipped(6700) ; #DEBUG_LINE_NO:2136
  Self.SetObjectiveCompleted(6653, True) ; #DEBUG_LINE_NO:2137
  Self.SetStage(6657) ; #DEBUG_LINE_NO:2138
  If Self.GetStageDone(6653) ; #DEBUG_LINE_NO:2140
    BQ01_Scene_Vignette_6659_Barrett_Dalitso_Distraction.Start() ; #DEBUG_LINE_NO:2141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6670_Item_00()
  If !Self.GetStageDone(6656) && !Self.GetStageDone(7000) ; #DEBUG_LINE_NO:2150
    Self.SetObjectiveDisplayed(6653, True, False) ; #DEBUG_LINE_NO:2151
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6671_Item_00()
  If Self.GetStageDone(6670) ; #DEBUG_LINE_NO:2160
    Self.SetObjectiveCompleted(6653, True) ; #DEBUG_LINE_NO:2161
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(165) ; #DEBUG_LINE_NO:2164
EndFunction

Function Fragment_Stage_6700_Item_00()
  Self.SetObjectiveDisplayed(6700, True, False) ; #DEBUG_LINE_NO:2172
EndFunction

Function Fragment_Stage_6701_Item_00()
  Self.SetObjectiveCompleted(6700, True) ; #DEBUG_LINE_NO:2180
  If Self.GetStageDone(6715) ; #DEBUG_LINE_NO:2182
    Self.SetStage(6500) ; #DEBUG_LINE_NO:2183
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(6600) ; #DEBUG_LINE_NO:2185
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_6705_Item_00()
  Self.SetStage(6305) ; #DEBUG_LINE_NO:2194
  Self.SetStage(6700) ; #DEBUG_LINE_NO:2195
EndFunction

Function Fragment_Stage_6715_Item_00()
  Self.SetStage(6500) ; #DEBUG_LINE_NO:2203
  Self.SetStage(6750) ; #DEBUG_LINE_NO:2204
EndFunction

Function Fragment_Stage_6720_Item_00()
  Self.SetStage(6750) ; #DEBUG_LINE_NO:2212
  Self.SetStage(6600) ; #DEBUG_LINE_NO:2213
  Self.SetObjectiveDisplayed(6720, True, False) ; #DEBUG_LINE_NO:2214
EndFunction

Function Fragment_Stage_6725_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:2222
EndFunction

Function Fragment_Stage_6726_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, LargeCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:2230
EndFunction

Function Fragment_Stage_6750_Item_00()
  Self.SetStage(6701) ; #DEBUG_LINE_NO:2238
EndFunction

Function Fragment_Stage_7000_Item_00()
  Self.SetObjectiveSkipped(6400) ; #DEBUG_LINE_NO:2246
  Self.SetObjectiveSkipped(6500) ; #DEBUG_LINE_NO:2247
  Self.SetObjectiveSkipped(6700) ; #DEBUG_LINE_NO:2248
  Self.SetObjectiveSkipped(6652) ; #DEBUG_LINE_NO:2249
  Self.SetObjectiveSkipped(6653) ; #DEBUG_LINE_NO:2250
  Self.SetObjectiveSkipped(6657) ; #DEBUG_LINE_NO:2251
  Self.SetObjectiveDisplayed(7000, True, False) ; #DEBUG_LINE_NO:2253
  ObjectReference HelgiRef = Alias_Actor_Helgi.GetRef() ; #DEBUG_LINE_NO:2254
  ObjectReference BeanBagRef = Alias_Furniture_Chair_Helgi.GetRef() ; #DEBUG_LINE_NO:2255
  HelgiRef.EnableNoWait(False) ; #DEBUG_LINE_NO:2257
  If HelgiRef.GetDistance(BeanBagRef) > 10.0 ; #DEBUG_LINE_NO:2259
    HelgiRef.MoveTo(BeanBagRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:2260
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(165) ; #DEBUG_LINE_NO:2263
EndFunction

Function Fragment_Stage_7005_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:2271
EndFunction

Function Fragment_Stage_7009_Item_00()
  BQ01_Global_DetectivePoints.Mod(1.0) ; #DEBUG_LINE_NO:2279
EndFunction

Function Fragment_Stage_7010_Item_00()
  Self.SetObjectiveFailed(7000, True) ; #DEBUG_LINE_NO:2287
  Self.SetObjectiveFailed(7100, True) ; #DEBUG_LINE_NO:2288
EndFunction

Function Fragment_Stage_7101_Item_00()
  If Self.GetStageDone(7009) ; #DEBUG_LINE_NO:2296
    Self.SetObjectiveCompleted(7000, True) ; #DEBUG_LINE_NO:2297
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveFailed(7000, True) ; #DEBUG_LINE_NO:2299
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(7300) ; #DEBUG_LINE_NO:2302
EndFunction

Function Fragment_Stage_7300_Item_00()
  Self.SetObjectiveDisplayed(7300, True, False) ; #DEBUG_LINE_NO:2310
EndFunction

Function Fragment_Stage_7301_Item_00()
  Self.SetObjectiveSkipped(7100) ; #DEBUG_LINE_NO:2318
  Self.SetObjectiveCompleted(7300, True) ; #DEBUG_LINE_NO:2319
  Self.SetStage(7400) ; #DEBUG_LINE_NO:2320
  Int DetectivePoints = BQ01_Global_DetectivePoints.GetValueInt() ; #DEBUG_LINE_NO:2322
  If DetectivePoints >= 4 ; #DEBUG_LINE_NO:2323
    BarrettQuest.SetStage(8) ; #DEBUG_LINE_NO:2324
  EndIf ; #DEBUG_LINE_NO:
  If DetectivePoints >= 2 ; #DEBUG_LINE_NO:2327
    BarrettQuest.SetStage(7) ; #DEBUG_LINE_NO:2328
  EndIf ; #DEBUG_LINE_NO:
  BarrettQuest.SetStage(6) ; #DEBUG_LINE_NO:2331
EndFunction

Function Fragment_Stage_7400_Item_00()
  Self.SetObjectiveDisplayed(7400, True, False) ; #DEBUG_LINE_NO:2339
  BQ01_Scene_BARK_7400_Barrett_BackToShip.Start() ; #DEBUG_LINE_NO:2341
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:2343
EndFunction

Function Fragment_Stage_7401_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:2351
  If !COM_Quest_Barrett_Q02.IsRunning() ; #DEBUG_LINE_NO:2354
    SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:2355
    COM_BQ01_WaitToggle.SetValue(0.0) ; #DEBUG_LINE_NO:2356
  EndIf ; #DEBUG_LINE_NO:
  Com_Companion_Barrett.FinishedPersonalQuest() ; #DEBUG_LINE_NO:2360
  Game.GetPlayer().SetValue(COM_Quest_Barrett_Q01_Complete_AV, 1.0) ; #DEBUG_LINE_NO:2362
  Game.GetPlayer().RemoveItem(BQ01_Key_ErvinsApartment as Form, 1, True, None) ; #DEBUG_LINE_NO:2363
  Alias_Door_ErvinApartment_Exterior.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:2364
  COM_Quest_Barrett_Q01_SpeechChallenge.Stop() ; #DEBUG_LINE_NO:2366
  Self.Stop() ; #DEBUG_LINE_NO:2368
EndFunction

Function Fragment_Stage_7402_Item_00()
  Game.GetPlayer().AddItem(BQ01_ErvinPlant_Slate as Form, 1, False) ; #DEBUG_LINE_NO:2376
EndFunction

Function Fragment_Stage_8200_Item_00()
  Self.SetStage(8300) ; #DEBUG_LINE_NO:2384
EndFunction

Function Fragment_Stage_8930_Item_00()
  If Self.GetStageDone(275) && !Self.GetStageDone(280) ; #DEBUG_LINE_NO:2392
    Self.SetStage(280) ; #DEBUG_LINE_NO:2393
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9000_Item_00()
  If Self.GetStageDone(275) ; #DEBUG_LINE_NO:2402
    Self.SetStage(9100) ; #DEBUG_LINE_NO:2403
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(9200) ; #DEBUG_LINE_NO:2405
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:2414
EndFunction

Function Fragment_Stage_9200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:2422
EndFunction
