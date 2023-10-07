ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Sc_0002BF40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const mandatory
ReferenceAlias Property Alias_GenetagRef Auto Const mandatory
ReferenceAlias Property Alias_CorpseKeyRef Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_LockedLootNote Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_Genetag Auto Const mandatory
RefCollectionAlias Property Alias_GenericCorpses Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_Repaired Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const mandatory
Hazard Property hazardToxicGas Auto Const mandatory
Hazard Property hazardExtremeCold Auto Const mandatory
Hazard Property hazardSpores Auto Const mandatory
Hazard Property hazardNoOxygen Auto Const mandatory
Hazard Property hazardRadiation Auto Const mandatory
Hazard Property hazardExtremeHeat Auto Const mandatory
Hazard Property hazardCorrosiveGas Auto Const mandatory
ActorBase Property LvlRobotModelA_Combat Auto Const mandatory
ActorBase Property creatures Auto Const mandatory
Hazard Property hazardSteamHeat Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_RadiationNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_NoOxygenNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ToxicGasNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_BiohazardNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_AIMalfunctionNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_CorrosiveNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_CreaturesNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ExtremeColdNotes Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_ExtremeHeatNotes Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property ENV_Loc_NotSealedEnvironment Auto Const mandatory
RefCollectionAlias Property Alias_Containers Auto Const mandatory
ReferenceAlias Property Alias_CaptainsLocker Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_GenericNotes Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_BlackboxData Auto Const mandatory
Quest Property SE_GenericDerelict_IDCardQuest Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote01 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote02 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote03 Auto Const mandatory
Book Property SE_GenericDerelict_IDCardNote04 Auto Const mandatory
ReferenceAlias Property Alias_IDCard02 Auto Const mandatory
ReferenceAlias Property Alias_IDCard01 Auto Const mandatory
ReferenceAlias Property Alias_IDCard03 Auto Const mandatory
ReferenceAlias Property Alias_IDCard04 Auto Const mandatory
ReferenceAlias Property Alias_Blackbox Auto Const mandatory
MiscObject Property SE_GenericDerelict_BlackBox Auto Const mandatory
Quest Property SE_GenericDerelict_BlackBoxQuest Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const mandatory
ReferenceAlias Property Alias_ExtraNote Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
wwiseevent Property pAlarm Auto Const mandatory
ReferenceAlias Property Alias_ModuleCockpit Auto Const mandatory
MiscObject Property Mfg_Tier01_AusteniticManifold Auto Const mandatory
MiscObject Property Mfg_Tier02_ControlRod Auto Const mandatory
MiscObject Property Mfg_Tier02_IsotopicCoolant Auto Const mandatory
MiscObject Property Mfg_Tier01_ReactiveGauge Auto Const mandatory
MiscObject Property Mfg_Tier01_StructuralFrame Auto Const mandatory
MiscObject Property Mfg_Tier03_Quasineutralizer Auto Const mandatory
RefCollectionAlias Property Alias_Robots Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const mandatory
ReferenceAlias Property Alias_RepairItem Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory
ActorValue Property ShieldHealth Auto Const mandatory
wwiseevent Property ShipPowerOn Auto Const mandatory
RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:7
  ObjectReference[] myMarkers = Alias_ItemSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:8
  Int x = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:9
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:10
    Self.SetStage(3) ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(3) ; #DEBUG_LINE_NO:17
  Self.SetStage(2) ; #DEBUG_LINE_NO:18
  pAlarm.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:20
  Int I = 3 ; #DEBUG_LINE_NO:22
  While I < myCorpses.Length ; #DEBUG_LINE_NO:23
    myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:24
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  Int d = 0 ; #DEBUG_LINE_NO:28
  While d < myMarkers.Length ; #DEBUG_LINE_NO:29
    myMarkers[I].PlaceAtme(LL_SE_GenericDerelict_GenericNotes as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:30
    d += 1 ; #DEBUG_LINE_NO:31
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetStage(5) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:42
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:43
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[2]) ; #DEBUG_LINE_NO:44
  ObjectReference myNPC = Alias_CorpseKeyRef.GetRef() ; #DEBUG_LINE_NO:46
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[0], 1, False, False, True) ; #DEBUG_LINE_NO:47
  myContainers[0].Lock(True, False, True) ; #DEBUG_LINE_NO:49
  myCorpses[2].AddItem(lootkey as Form, 1, False) ; #DEBUG_LINE_NO:50
  myCorpses[2].AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:59
  Alias_GenetagRef.ForceRefTo(myCorpses[0]) ; #DEBUG_LINE_NO:60
  Int x = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:62
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:63
     ; #DEBUG_LINE_NO:
  ElseIf x == 1 ; #DEBUG_LINE_NO:64
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01 as Form, Alias_IDCard01 as Alias, 1, True) ; #DEBUG_LINE_NO:65
  ElseIf x == 2 ; #DEBUG_LINE_NO:66
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02 as Form, Alias_IDCard02 as Alias, 1, True) ; #DEBUG_LINE_NO:67
  ElseIf x == 3 ; #DEBUG_LINE_NO:68
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03 as Form, Alias_IDCard03 as Alias, 1, True) ; #DEBUG_LINE_NO:69
  Else ; #DEBUG_LINE_NO:
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04 as Form, Alias_IDCard04 as Alias, 1, True) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:88
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:89
  kmyQuest.SetShipHazard(hazardExtremeCold) ; #DEBUG_LINE_NO:92
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:93
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:94
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False) ; #DEBUG_LINE_NO:95
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:97
  myContainers[1].AddAliasedItem(Mfg_Tier01_ReactiveGauge as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:98
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:107
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:108
  kmyQuest.SetShipHazard(hazardNoOxygen) ; #DEBUG_LINE_NO:111
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:113
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:115
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:116
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False) ; #DEBUG_LINE_NO:117
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:119
  myContainers[1].AddAliasedItem(Mfg_Tier01_StructuralFrame as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:120
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:129
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:130
  kmyQuest.SetShipHazard(hazardRadiation) ; #DEBUG_LINE_NO:133
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:134
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:135
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False) ; #DEBUG_LINE_NO:136
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:138
  myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:139
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0005_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:148
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:149
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:152
  If biohazard == 1 ; #DEBUG_LINE_NO:153
    kmyQuest.SetShipHazard(hazardExtremeHeat) ; #DEBUG_LINE_NO:154
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSteamHeat) ; #DEBUG_LINE_NO:156
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:158
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:159
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False) ; #DEBUG_LINE_NO:160
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:162
  myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:163
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:172
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:173
  kmyQuest.SetShipHazard(hazardCorrosiveGas) ; #DEBUG_LINE_NO:176
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:178
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:179
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False) ; #DEBUG_LINE_NO:180
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:182
  myContainers[1].AddAliasedItem(Mfg_Tier01_AusteniticManifold as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:183
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0005_Item_05()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:192
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:193
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:196
  If biohazard == 1 ; #DEBUG_LINE_NO:197
    kmyQuest.SetShipHazard(hazardToxicGas) ; #DEBUG_LINE_NO:198
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSpores) ; #DEBUG_LINE_NO:200
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:203
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:204
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False) ; #DEBUG_LINE_NO:205
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:207
  myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:208
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0005_Item_06()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:217
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:218
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:221
  Int I = 0 ; #DEBUG_LINE_NO:223
  While I < myMarkers.Length ; #DEBUG_LINE_NO:224
    myMarkers[I].PlaceAtme(creatures as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:225
    I += 1 ; #DEBUG_LINE_NO:226
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:229
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:230
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False) ; #DEBUG_LINE_NO:231
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:233
  myContainers[1].AddAliasedItem(Mfg_Tier03_Quasineutralizer as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:234
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_0005_Item_07()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:243
  Int I = 0 ; #DEBUG_LINE_NO:245
  While I < myMarkers.Length ; #DEBUG_LINE_NO:246
    ObjectReference Robot = myMarkers[I].PlaceAtme(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:247
    Alias_Robots.AddRef(Robot) ; #DEBUG_LINE_NO:248
    I += 2 ; #DEBUG_LINE_NO:249
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:252
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:253
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False) ; #DEBUG_LINE_NO:254
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:256
  myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:257
  myContainers[1].Lock(True, False, True) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(1) ; #DEBUG_LINE_NO:266
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(2) ; #DEBUG_LINE_NO:274
EndFunction

Function Fragment_Stage_0008_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(3) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_0009_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(4) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4)) ; #DEBUG_LINE_NO:298
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:299
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 7)) ; #DEBUG_LINE_NO:300
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2)) ; #DEBUG_LINE_NO:301
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1)) ; #DEBUG_LINE_NO:302
  SE_GenericDerelict_Repaired.SetValue(0.0) ; #DEBUG_LINE_NO:303
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0) ; #DEBUG_LINE_NO:304
  SE_GenericDerelict_HazardFixed.SetValue(0.0) ; #DEBUG_LINE_NO:305
  Alias_CaptainsLocker.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0014_Item_00()
  SE_GenericDerelict_HazardFixed.SetValue(1.0) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:322
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:323
  ShipPowerOn.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:326
  kmyQuest.SetShipHazard(None) ; #DEBUG_LINE_NO:327
  Alias_Robots.KillAll(None) ; #DEBUG_LINE_NO:328
  SE_GenericDerelict_HazardFixed.SetValue(1.0) ; #DEBUG_LINE_NO:329
  Game.GetPlayer().RemoveItem(Alias_RepairItem.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:330
  spaceshipreference myShip = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:331
  Alias_PilotSeat.GetRef().RemoveKeyword(BlockPlayerActivation) ; #DEBUG_LINE_NO:332
  myShip.SetValue(Health, 50000.0) ; #DEBUG_LINE_NO:333
  myShip.SetValue(ShipSystemGravDriveHealth, 50000.0) ; #DEBUG_LINE_NO:334
  myShip.SetValue(ShieldHealth, 50000.0) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:343
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:344
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:347
  SE_GenericDerelict_Repaired.SetValue(1.0) ; #DEBUG_LINE_NO:348
  ObjectReference TerminalRef = Alias_Terminal.GetRef() ; #DEBUG_LINE_NO:349
  TerminalRef.SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, True) ; #DEBUG_LINE_NO:350
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_0020_Item_01()
  spaceshipreference myShip = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:359
  Alias_PilotSeat.GetRef().RemoveKeyword(BlockPlayerActivation) ; #DEBUG_LINE_NO:360
  myShip.SetValue(Health, 50000.0) ; #DEBUG_LINE_NO:361
  myShip.SetValue(ShipSystemGravDriveHealth, 50000.0) ; #DEBUG_LINE_NO:362
  myShip.SetValue(ShieldHealth, 50000.0) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:371
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(4) ; #DEBUG_LINE_NO:379
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Terminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:387
EndFunction
