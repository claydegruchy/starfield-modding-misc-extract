ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Ca_0001EAE4 Extends Quest Const hidden

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
MiscObject Property Mfg_Tier02_ControlRod Auto Const mandatory
MiscObject Property Mfg_Tier02_IsotopicCoolant Auto Const mandatory
MiscObject Property Mfg_Tier01_ReactiveGauge Auto Const mandatory
MiscObject Property Mfg_Tier01_StructuralFrame Auto Const mandatory
RefCollectionAlias Property Alias_Robots Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const mandatory
ReferenceAlias Property Alias_RepairItem Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory
ActorValue Property ShieldHealth Auto Const mandatory
wwiseevent Property ShipPowerOn Auto Const mandatory
RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_MySlates Auto Const mandatory
LeveledItem Property LL_Loot_IcyAsteroid Auto Const mandatory
LeveledItem Property LL_Loot_RockyAsteroid Auto Const mandatory
LeveledItem Property LL_Loot_Corpse_Scientist Auto Const mandatory
Outfit Property Outfit_Clothes_Science_Random_NoRyujin Auto Const mandatory
Outfit Property Outfit_Miner_All Auto Const mandatory
LeveledItem Property LL_Weapon_Cutter Auto Const mandatory
LeveledItem Property LL_SE_GenericDerelict_GenericNotes_ChanceNone Auto Const mandatory
RefCollectionAlias Property Alias_MinerCrew Auto Const mandatory
ReferenceAlias Property Alias_MinerCaptainName Auto Const mandatory
RefCollectionAlias Property Alias_ScientistCrew Auto Const mandatory
RefCollectionAlias Property Alias_SurveyorCrew Auto Const mandatory
RefCollectionAlias Property Alias_CargoCrew Auto Const mandatory
ReferenceAlias Property Alias_ScientistCaptainName Auto Const mandatory
ReferenceAlias Property Alias_SurveyorCaptainName Auto Const mandatory
ReferenceAlias Property Alias_CargoCaptainName Auto Const mandatory
GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const mandatory
Keyword Property ObjectTypeDataSlate Auto Const mandatory
RefCollectionAlias Property Alias_GenericTurrets Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const mandatory
MiscObject Property Mfg_Tier02_SemimetalWafer Auto Const mandatory
MiscObject Property Mfg_Tier03_PowerCircuit Auto Const mandatory
MiscObject Property Mfg_Tier03_CommRelay Auto Const mandatory
RefCollectionAlias Property Alias_GenericCreatures Auto Const mandatory
ActorBase Property LvlBECrew Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
RefCollectionAlias Property Alias_TerminalCollection Auto Const mandatory
Outfit Property Outfit_Clothes_Ship_Captain_Hat Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
RefCollectionAlias Property Alias_GenericRobots Auto Const mandatory
RefCollectionAlias Property Alias_ConsoleTerminals Auto Const mandatory
ReferenceAlias Property Alias_DockingTerminal Auto Const mandatory
ReferenceAlias Property Alias_CrewTerminal Auto Const mandatory
RefCollectionAlias Property Alias_ConsoleTerminals_Engineering Auto Const mandatory
ReferenceAlias Property Alias_CargoTerminal Auto Const mandatory
reparentscript Property RE_Parent Auto Const mandatory
ReferenceAlias Property Alias_ScienceTerminal Auto Const mandatory
ActorValue Property BE_SpaceshipTakenOver Auto Const mandatory
MusicType Property MusicOverride Auto Const mandatory
Keyword Property LinkTerminalTurret Auto Const mandatory
Keyword Property LinkTerminalRobot Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_WillbyGlobal Auto Const mandatory
Hazard Property hazardExtremeColdBlast Auto Const mandatory
Hazard Property hazardExtremeColdLeak Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Int Property MaxSpawn Auto Const
Keyword Property LinkShipModule Auto Const mandatory
Keyword Property LocTypeBEDerelict Auto Const mandatory
RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const mandatory
ActorBase Property LvlTurretShort_aggro Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Quest Property SE_Derelict_IDCardQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0000_Item_01()
  Self.SetObjectiveDisplayed(11, True, False) ; #DEBUG_LINE_NO:16
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] Turrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:25
  ObjectReference[] Robots = Alias_GenericRobots.GetArray() ; #DEBUG_LINE_NO:26
  Int x = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:28
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:29
    Self.SetStage(3) ; #DEBUG_LINE_NO:30
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(3) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  Alias_Captain.GetActorRef().SnapIntoInteraction(Alias_CaptainSpawnMarker.GetRef()) ; #DEBUG_LINE_NO:36
  Alias_Terminal.GetRef().SetLinkedRef(Turrets[0], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:37
  Alias_Terminal.GetRef().SetLinkedRef(Robots[0], LinkTerminalRobot, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:46
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:47
  Int y = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:48
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:49
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:50
  ObjectReference myNPC = Alias_CorpseKeyRef.GetRef() ; #DEBUG_LINE_NO:52
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[y], 1, False, False, True) ; #DEBUG_LINE_NO:53
  myContainers[y].Lock(True, False, True) ; #DEBUG_LINE_NO:55
  myCorpses[z].AddItem(lootkey as Form, 1, False) ; #DEBUG_LINE_NO:56
  myCorpses[z].AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False) ; #DEBUG_LINE_NO:57
  Self.SetStage(5) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:68
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:69
  Alias_GenetagRef.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:70
  If !SE_Derelict_IDCardQuest.IsRunning() ; #DEBUG_LINE_NO:72
    Int x = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:73
    If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:74
       ; #DEBUG_LINE_NO:
    ElseIf x == 1 ; #DEBUG_LINE_NO:75
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01 as Form, Alias_IDCard01 as Alias, 1, True) ; #DEBUG_LINE_NO:76
    ElseIf x == 2 ; #DEBUG_LINE_NO:77
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02 as Form, Alias_IDCard02 as Alias, 1, True) ; #DEBUG_LINE_NO:78
    ElseIf x == 3 ; #DEBUG_LINE_NO:79
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03 as Form, Alias_IDCard03 as Alias, 1, True) ; #DEBUG_LINE_NO:80
    Else ; #DEBUG_LINE_NO:
      Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04 as Form, Alias_IDCard04 as Alias, 1, True) ; #DEBUG_LINE_NO:82
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 1 ; #DEBUG_LINE_NO:86
  While I < myCorpses.Length ; #DEBUG_LINE_NO:87
    If myCorpses[I].GetItemCount(ObjectTypeDataSlate as Form) == 0 ; #DEBUG_LINE_NO:88
      myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:89
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:91
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0003_Item_01()
  Self.SetStage(5) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:117
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:118
  Int biohazard = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:121
  If biohazard == 0 ; #DEBUG_LINE_NO:122
    kmyQuest.SetShipHazard(hazardExtremeCold) ; #DEBUG_LINE_NO:123
  ElseIf biohazard == 1 ; #DEBUG_LINE_NO:124
    kmyQuest.SetShipHazard(hazardExtremeColdBlast) ; #DEBUG_LINE_NO:125
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardExtremeColdLeak) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.SetShipHazard(hazardExtremeCold) ; #DEBUG_LINE_NO:129
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:130
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:131
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:132
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False) ; #DEBUG_LINE_NO:133
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:135
  Int I = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:136
  myContainers[I].AddAliasedItem(Mfg_Tier01_ReactiveGauge as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:137
  myContainers[I].Lock(True, False, True) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:146
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:147
  kmyQuest.SetShipHazard(hazardNoOxygen) ; #DEBUG_LINE_NO:150
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:152
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:154
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:155
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:156
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False) ; #DEBUG_LINE_NO:157
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:159
  Int I = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:160
  myContainers[I].AddAliasedItem(Mfg_Tier01_StructuralFrame as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:161
  myContainers[I].Lock(True, False, True) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:170
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:171
  kmyQuest.SetShipHazard(hazardRadiation) ; #DEBUG_LINE_NO:174
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:175
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:176
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:177
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False) ; #DEBUG_LINE_NO:178
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:180
  Int I = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:181
  myContainers[I].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:182
  myContainers[I].Lock(True, False, True) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0005_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:191
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:192
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:195
  If biohazard == 1 ; #DEBUG_LINE_NO:196
    kmyQuest.SetShipHazard(hazardExtremeHeat) ; #DEBUG_LINE_NO:197
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSteamHeat) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:201
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:202
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:203
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False) ; #DEBUG_LINE_NO:204
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:206
  Int k = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:207
  myContainers[k].AddAliasedItem(Mfg_Tier02_ControlRod as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:208
  myContainers[k].Lock(True, False, True) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:217
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:218
  kmyQuest.SetShipHazard(hazardCorrosiveGas) ; #DEBUG_LINE_NO:221
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:223
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:224
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:225
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False) ; #DEBUG_LINE_NO:226
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:228
  Int k = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:229
  myContainers[k].AddAliasedItem(Mfg_Tier02_SemimetalWafer as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:230
  myContainers[k].Lock(True, False, True) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0005_Item_05()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:239
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:240
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:243
  If biohazard == 1 ; #DEBUG_LINE_NO:244
    kmyQuest.SetShipHazard(hazardToxicGas) ; #DEBUG_LINE_NO:245
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSpores) ; #DEBUG_LINE_NO:247
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:250
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:251
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:252
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False) ; #DEBUG_LINE_NO:253
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:255
  Int k = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:256
  myContainers[k].AddAliasedItem(Mfg_Tier03_PowerCircuit as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:257
  myContainers[k].Lock(True, False, True) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0005_Item_06()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:266
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:267
  SE_DerelictGeneric_MissionHazardGlobal.SetValue(6.0) ; #DEBUG_LINE_NO:270
  ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:272
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:273
  Int q = 0 ; #DEBUG_LINE_NO:275
  While q < myTurretMarkers.Length ; #DEBUG_LINE_NO:276
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:277
    Alias_GenericTurrets.AddRef(turretRef) ; #DEBUG_LINE_NO:278
    q += 1 ; #DEBUG_LINE_NO:279
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:282
  ObjectReference TerminalRef = Alias_Terminal.GetRef() ; #DEBUG_LINE_NO:283
  Int r = 0 ; #DEBUG_LINE_NO:285
  Int w = 1 ; #DEBUG_LINE_NO:286
  While r < myTurrets.Length ; #DEBUG_LINE_NO:287
    (myTurrets[r] as Actor).SetUnconscious(True) ; #DEBUG_LINE_NO:288
    If w < myTurrets.Length ; #DEBUG_LINE_NO:289
      myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:290
    EndIf ; #DEBUG_LINE_NO:
    r += 1 ; #DEBUG_LINE_NO:292
    w += 1 ; #DEBUG_LINE_NO:293
  EndWhile ; #DEBUG_LINE_NO:
  Int iMaxSpawn = Utility.RandomInt(4, 8) ; #DEBUG_LINE_NO:297
  Int k = Utility.RandomInt(0, 5) ; #DEBUG_LINE_NO:298
  Int I = 0 ; #DEBUG_LINE_NO:299
  If k == 0 ; #DEBUG_LINE_NO:301
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:302
      ObjectReference CreatureRef = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:303
      Alias_GenericCreatures.AddRef(CreatureRef) ; #DEBUG_LINE_NO:304
      ObjectReference ShipModuleRef = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:305
      CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, False) ; #DEBUG_LINE_NO:306
      I += 1 ; #DEBUG_LINE_NO:307
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 1 ; #DEBUG_LINE_NO:309
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:310
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:311
      Alias_GenericCreatures.AddRef(creatureref) ; #DEBUG_LINE_NO:312
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:313
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False) ; #DEBUG_LINE_NO:314
      I += 1 ; #DEBUG_LINE_NO:315
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 2 ; #DEBUG_LINE_NO:317
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:318
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:319
      Alias_GenericCreatures.AddRef(creatureref) ; #DEBUG_LINE_NO:320
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:321
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False) ; #DEBUG_LINE_NO:322
      I += 1 ; #DEBUG_LINE_NO:323
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 3 ; #DEBUG_LINE_NO:325
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:326
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:327
      Alias_GenericCreatures.AddRef(creatureref) ; #DEBUG_LINE_NO:328
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:329
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False) ; #DEBUG_LINE_NO:330
      I += 1 ; #DEBUG_LINE_NO:331
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 4 ; #DEBUG_LINE_NO:333
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:334
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:335
      Alias_GenericCreatures.AddRef(creatureref) ; #DEBUG_LINE_NO:336
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:337
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False) ; #DEBUG_LINE_NO:338
      I += 1 ; #DEBUG_LINE_NO:339
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 5 ; #DEBUG_LINE_NO:341
    While I < iMaxSpawn && I < MarkersRef.Length ; #DEBUG_LINE_NO:342
      ObjectReference creatureref = MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:343
      Alias_GenericCreatures.AddRef(creatureref) ; #DEBUG_LINE_NO:344
      ObjectReference shipmoduleref = MarkersRef[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:345
      creatureref.SetLinkedRef(shipmoduleref, LinkShipModule, False) ; #DEBUG_LINE_NO:346
      I += 1 ; #DEBUG_LINE_NO:347
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:351
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:352
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:353
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False) ; #DEBUG_LINE_NO:354
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:356
  Int x = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:357
  myContainers[x].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:358
  myContainers[x].Lock(True, False, True) ; #DEBUG_LINE_NO:359
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:361
EndFunction

Function Fragment_Stage_0005_Item_07()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:369
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:370
  SE_DerelictGeneric_MissionHazardGlobal.SetValue(7.0) ; #DEBUG_LINE_NO:373
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:375
  ObjectReference[] myRobots = Alias_GenericRobots.GetArray() ; #DEBUG_LINE_NO:376
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:377
  Int q = 0 ; #DEBUG_LINE_NO:379
  While q < myTurretMarkers.Length ; #DEBUG_LINE_NO:380
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:381
    Alias_GenericTurrets.AddRef(turretRef) ; #DEBUG_LINE_NO:382
    q += 1 ; #DEBUG_LINE_NO:383
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:386
  ObjectReference TerminalRef = Alias_Terminal.GetRef() ; #DEBUG_LINE_NO:387
  Int r = 0 ; #DEBUG_LINE_NO:389
  Int w = 1 ; #DEBUG_LINE_NO:390
  While r < myTurrets.Length ; #DEBUG_LINE_NO:391
    (myTurrets[r] as Actor).SetUnconscious(True) ; #DEBUG_LINE_NO:392
    If w < myTurrets.Length ; #DEBUG_LINE_NO:393
      myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:394
    EndIf ; #DEBUG_LINE_NO:
    r += 1 ; #DEBUG_LINE_NO:396
    w += 1 ; #DEBUG_LINE_NO:397
  EndWhile ; #DEBUG_LINE_NO:
  Int iMaxSpawn = Utility.RandomInt(4, 8) ; #DEBUG_LINE_NO:400
  Int I = 0 ; #DEBUG_LINE_NO:401
  While I < myMarkers.Length && myRobots.Length < iMaxSpawn ; #DEBUG_LINE_NO:402
    ObjectReference Robot = myMarkers[I].PlaceAtMe(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:403
    ObjectReference ShipModuleRef = myMarkers[I].GetLinkedRef(LinkShipModule) ; #DEBUG_LINE_NO:404
    Robot.SetLinkedRef(ShipModuleRef, LinkShipModule, False) ; #DEBUG_LINE_NO:405
    Alias_Robots.AddRef(Robot) ; #DEBUG_LINE_NO:406
    I += 4 ; #DEBUG_LINE_NO:407
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:410
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:411
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:412
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False) ; #DEBUG_LINE_NO:413
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:415
  Int k = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:416
  myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:417
  myContainers[k].Lock(True, False, True) ; #DEBUG_LINE_NO:418
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:420
EndFunction

Function Fragment_Stage_0005_Item_08()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:428
  be_derelictscript kmyQuest = __temp as be_derelictscript ; #DEBUG_LINE_NO:429
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:432
  ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:433
  Int q = 0 ; #DEBUG_LINE_NO:435
  While q < myTurretMarkers.Length && q < MaxSpawn ; #DEBUG_LINE_NO:436
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:437
    Alias_GenericTurrets.AddRef(turretRef) ; #DEBUG_LINE_NO:438
    q += 1 ; #DEBUG_LINE_NO:439
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:442
  ObjectReference TerminalRef = Alias_Terminal.GetRef() ; #DEBUG_LINE_NO:443
  Int I = 0 ; #DEBUG_LINE_NO:445
  Int w = 1 ; #DEBUG_LINE_NO:446
  While I < myTurrets.Length ; #DEBUG_LINE_NO:447
    (myTurrets[I] as Actor).SetUnconscious(False) ; #DEBUG_LINE_NO:448
    If w < myTurrets.Length ; #DEBUG_LINE_NO:449
      myTurrets[I].SetLinkedRef(myTurrets[w], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:450
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:452
    w += 1 ; #DEBUG_LINE_NO:453
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:456
  Int z = Utility.RandomInt(0, myCorpses.Length - 1) ; #DEBUG_LINE_NO:457
  Alias_ExtraNote.ForceRefTo(myCorpses[z]) ; #DEBUG_LINE_NO:458
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False) ; #DEBUG_LINE_NO:459
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:461
  Int k = Utility.RandomInt(0, myContainers.Length - 1) ; #DEBUG_LINE_NO:462
  myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay as Form, Alias_RepairItem as Alias, 1, True) ; #DEBUG_LINE_NO:463
  myContainers[k].Lock(True, False, True) ; #DEBUG_LINE_NO:464
  TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:466
EndFunction

Function Fragment_Stage_0005_Item_09()
  Self.SetStage(13) ; #DEBUG_LINE_NO:474
  Self.SetStage(1) ; #DEBUG_LINE_NO:475
EndFunction

Function Fragment_Stage_0005_Item_10()
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:483
  Int I = 0 ; #DEBUG_LINE_NO:485
  While I < myTurrets.Length ; #DEBUG_LINE_NO:486
    myTurrets[I].DisableNoWait(False) ; #DEBUG_LINE_NO:487
    I += 1 ; #DEBUG_LINE_NO:488
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(1) ; #DEBUG_LINE_NO:497
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(2) ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_0008_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(3) ; #DEBUG_LINE_NO:513
EndFunction

Function Fragment_Stage_0009_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(4) ; #DEBUG_LINE_NO:521
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:529
  ObjectReference[] myMarkers = Alias_ItemSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:531
  Int d = 0 ; #DEBUG_LINE_NO:533
  While d < myMarkers.Length ; #DEBUG_LINE_NO:534
    Alias_MySlates.AddRef(myMarkers[d].PlaceAtMe(LL_SE_GenericDerelict_GenericNotes_ChanceNone as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:535
    d += 1 ; #DEBUG_LINE_NO:536
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0011_Item_00()
  SE_GenericDerelict_UniqueEntry01Global.SetValue(1.0) ; #DEBUG_LINE_NO:545
EndFunction

Function Fragment_Stage_0012_Item_00()
  SE_GenericDerelict_WillbyGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:553
EndFunction

Function Fragment_Stage_0013_Item_00()
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:561
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:562
  Int d = 0 ; #DEBUG_LINE_NO:564
  While d < myCorpses.Length ; #DEBUG_LINE_NO:565
    Alias_MinerCrew.AddRef(myCorpses[d]) ; #DEBUG_LINE_NO:566
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0 ; #DEBUG_LINE_NO:568
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:569
    EndIf ; #DEBUG_LINE_NO:
    d += 1 ; #DEBUG_LINE_NO:571
  EndWhile ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:574
  While I < myContainers.Length ; #DEBUG_LINE_NO:575
    myContainers[I].AddItem(LL_Loot_IcyAsteroid as Form, 1, False) ; #DEBUG_LINE_NO:576
    myContainers[I].AddItem(LL_Loot_RockyAsteroid as Form, 1, False) ; #DEBUG_LINE_NO:577
    I += 1 ; #DEBUG_LINE_NO:578
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference MinerRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:581
  Alias_MinerCrew.RemoveRef(MinerRef) ; #DEBUG_LINE_NO:582
  Alias_MinerCaptainName.ForceRefTo(MinerRef) ; #DEBUG_LINE_NO:583
EndFunction

Function Fragment_Stage_0013_Item_01()
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:591
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:592
  Int d = 0 ; #DEBUG_LINE_NO:594
  While d < myCorpses.Length ; #DEBUG_LINE_NO:595
    Alias_ScientistCrew.AddRef(myCorpses[d]) ; #DEBUG_LINE_NO:596
    (myCorpses[d] as Actor).SetOutfit(Outfit_Clothes_Science_Random_NoRyujin, False) ; #DEBUG_LINE_NO:598
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0 ; #DEBUG_LINE_NO:599
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:600
    EndIf ; #DEBUG_LINE_NO:
    d += 1 ; #DEBUG_LINE_NO:602
  EndWhile ; #DEBUG_LINE_NO:
  BE_GenericDerelicCrewGlobal.SetValue(d as Float) ; #DEBUG_LINE_NO:605
  ObjectReference ScientistRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:607
  Alias_ScientistCrew.RemoveRef(ScientistRef) ; #DEBUG_LINE_NO:608
  Alias_ScientistCaptainName.ForceRefTo(ScientistRef) ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0013_Item_02()
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:617
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:618
  Int d = 0 ; #DEBUG_LINE_NO:620
  While d < myCorpses.Length ; #DEBUG_LINE_NO:621
    Alias_SurveyorCrew.AddRef(myCorpses[d]) ; #DEBUG_LINE_NO:622
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0 ; #DEBUG_LINE_NO:623
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:624
    EndIf ; #DEBUG_LINE_NO:
    d += 1 ; #DEBUG_LINE_NO:627
  EndWhile ; #DEBUG_LINE_NO:
  BE_GenericDerelicCrewGlobal.SetValue(d as Float) ; #DEBUG_LINE_NO:630
  ObjectReference SurveyorRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:632
  Alias_SurveyorCrew.RemoveRef(SurveyorRef) ; #DEBUG_LINE_NO:633
  Alias_SurveyorCaptainName.ForceRefTo(SurveyorRef) ; #DEBUG_LINE_NO:634
EndFunction

Function Fragment_Stage_0013_Item_03()
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:642
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:643
  Int d = 0 ; #DEBUG_LINE_NO:645
  While d < myCorpses.Length ; #DEBUG_LINE_NO:646
    Alias_CargoCrew.AddRef(myCorpses[d]) ; #DEBUG_LINE_NO:647
    If myCorpses[d].GetItemCount(ObjectTypeDataSlate as Form) == 0 ; #DEBUG_LINE_NO:648
      myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:649
    EndIf ; #DEBUG_LINE_NO:
    d += 1 ; #DEBUG_LINE_NO:652
  EndWhile ; #DEBUG_LINE_NO:
  BE_GenericDerelicCrewGlobal.SetValue(d as Float) ; #DEBUG_LINE_NO:655
  ObjectReference CargoRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:657
  Alias_CargoCrew.RemoveRef(CargoRef) ; #DEBUG_LINE_NO:658
  Alias_CargoCaptainName.ForceRefTo(CargoRef) ; #DEBUG_LINE_NO:659
EndFunction

Function Fragment_Stage_0013_Item_04()
  Actor CaptainRef = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:667
  RE_Parent.KillWithForceNoWait(CaptainRef, None, True) ; #DEBUG_LINE_NO:668
  CaptainRef.SetOutfit(Outfit_Clothes_Ship_Captain_Hat, False) ; #DEBUG_LINE_NO:669
  BE_GenericDerelicCrewGlobal.SetValue((Alias_GenericCorpses.GetCount() + 1) as Float) ; #DEBUG_LINE_NO:671
  Self.UpdateCurrentInstanceGlobal(BE_GenericDerelicCrewGlobal) ; #DEBUG_LINE_NO:672
  Alias_Terminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:674
  Alias_ConsoleTerminals.EnableAll(False) ; #DEBUG_LINE_NO:675
  Alias_ConsoleTerminals_Engineering.EnableAll(False) ; #DEBUG_LINE_NO:676
  Alias_DockingTerminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:677
  Alias_CargoTerminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:678
  Alias_CrewTerminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:679
  Alias_ScienceTerminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:680
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_Robots.KillAll(None) ; #DEBUG_LINE_NO:688
  SE_GenericDerelict_HazardFixed.SetValue(1.0) ; #DEBUG_LINE_NO:689
  Self.SetObjectiveCompleted(11, True) ; #DEBUG_LINE_NO:690
  If !Self.GetStageDone(15) ; #DEBUG_LINE_NO:691
    Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:692
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(20) ; #DEBUG_LINE_NO:694
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:695
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:704
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:705
  ShipPowerOn.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:708
  kmyQuest.SetShipHazard(None) ; #DEBUG_LINE_NO:709
  Alias_Robots.KillAll(None) ; #DEBUG_LINE_NO:710
  SE_GenericDerelict_HazardFixed.SetValue(1.0) ; #DEBUG_LINE_NO:711
  spaceshipreference myShip = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:712
  Alias_PilotSeat.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:713
  Alias_PilotSeat.Clear() ; #DEBUG_LINE_NO:714
  myShip.RestoreValue(Health, 50000.0) ; #DEBUG_LINE_NO:715
  myShip.RestoreValue(ShipSystemGravDriveHealth, 50000.0) ; #DEBUG_LINE_NO:716
  myShip.RestoreValue(ShieldHealth, 50000.0) ; #DEBUG_LINE_NO:717
  myShip.RestoreValue(ShipSystemShieldsHealth, 50000.0) ; #DEBUG_LINE_NO:718
  myShip.RestoreValue(ShipSystemEngineHealth, 50000.0) ; #DEBUG_LINE_NO:719
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:720
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:721
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:722
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:723
EndFunction

Function Fragment_Stage_0015_Item_01()
  Game.GetPlayer().RemoveItem(Mfg_Tier01_ReactiveGauge as Form, 1, False, None) ; #DEBUG_LINE_NO:731
EndFunction

Function Fragment_Stage_0015_Item_02()
  Game.GetPlayer().RemoveItem(Mfg_Tier01_StructuralFrame as Form, 1, False, None) ; #DEBUG_LINE_NO:739
EndFunction

Function Fragment_Stage_0015_Item_03()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_ControlRod as Form, 1, False, None) ; #DEBUG_LINE_NO:747
EndFunction

Function Fragment_Stage_0015_Item_04()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_IsotopicCoolant as Form, 1, False, None) ; #DEBUG_LINE_NO:755
EndFunction

Function Fragment_Stage_0015_Item_05()
  Game.GetPlayer().RemoveItem(Mfg_Tier02_SemimetalWafer as Form, 1, False, None) ; #DEBUG_LINE_NO:763
EndFunction

Function Fragment_Stage_0015_Item_06()
  Game.GetPlayer().RemoveItem(Mfg_Tier03_PowerCircuit as Form, 1, False, None) ; #DEBUG_LINE_NO:771
EndFunction

Function Fragment_Stage_0015_Item_07()
  Game.GetPlayer().RemoveItem(Mfg_Tier03_CommRelay as Form, 1, False, None) ; #DEBUG_LINE_NO:779
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:787
EndFunction

Function Fragment_Stage_0017_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:795
  If !Self.GetStageDone(15) ; #DEBUG_LINE_NO:796
    Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:797
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(20) ; #DEBUG_LINE_NO:799
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:800
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0018_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:809
  MusicOverride.Remove() ; #DEBUG_LINE_NO:810
EndFunction

Function Fragment_Stage_0019_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:818
  Self.SetStage(20) ; #DEBUG_LINE_NO:819
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:827
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:828
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:831
  SE_GenericDerelict_Repaired.SetValue(1.0) ; #DEBUG_LINE_NO:832
  ObjectReference TerminalRef = Alias_Terminal.GetRef() ; #DEBUG_LINE_NO:833
  TerminalRef.SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, False) ; #DEBUG_LINE_NO:834
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:835
EndFunction

Function Fragment_Stage_0020_Item_01()
  spaceshipreference myShip = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:843
  ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef() ; #DEBUG_LINE_NO:844
  PilotSeatRef.RemoveKeyword(BlockPlayerActivation) ; #DEBUG_LINE_NO:846
  PilotSeatRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:847
  Alias_PilotSeat.Clear() ; #DEBUG_LINE_NO:848
  myShip.RestoreValue(Health, 50000.0) ; #DEBUG_LINE_NO:849
  myShip.RestoreValue(ShipSystemGravDriveHealth, 50000.0) ; #DEBUG_LINE_NO:850
  myShip.RestoreValue(ShieldHealth, 50000.0) ; #DEBUG_LINE_NO:851
EndFunction

Function Fragment_Stage_0021_Item_00()
  Alias_GenericTurrets.KillAll(None) ; #DEBUG_LINE_NO:859
  Self.SetStage(14) ; #DEBUG_LINE_NO:860
EndFunction

Function Fragment_Stage_0022_Item_00()
  ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray() ; #DEBUG_LINE_NO:868
  ObjectReference[] myRobots = Alias_Robots.GetArray() ; #DEBUG_LINE_NO:869
  Alias_Terminal.GetRef().SetLinkedRef(myTurrets[0], LinkTerminalTurret, False) ; #DEBUG_LINE_NO:870
  Alias_Terminal.GetRef().SetLinkedRef(myRobots[0], LinkTerminalRobot, False) ; #DEBUG_LINE_NO:871
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:879
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(4) ; #DEBUG_LINE_NO:887
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:895
EndFunction

Function Fragment_Stage_1000_Item_00()
  SE_GenericDerelict_TerminalGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:903
  SE_GenericDerelict_TerminalCrewGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:904
  SE_GenericDerelict_TerminalDockingGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:905
  Alias_Terminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:907
  Alias_ConsoleTerminals.DisableAll(False) ; #DEBUG_LINE_NO:908
  Alias_ConsoleTerminals_Engineering.DisableAll(False) ; #DEBUG_LINE_NO:909
  Alias_DockingTerminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:910
  Alias_CargoTerminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:911
  Alias_CrewTerminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:912
  Alias_ScienceTerminal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:913
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:914
  MusicOverride.Remove() ; #DEBUG_LINE_NO:915
  Self.Stop() ; #DEBUG_LINE_NO:916
EndFunction
