ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Ex_0001EAA2 Extends Quest Const hidden

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

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:7
  Int x = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:8
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:9
    Self.SetStage(3) ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2) ; #DEBUG_LINE_NO:12
    Self.SetStage(3) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Int I = 3 ; #DEBUG_LINE_NO:16
  While I < myCorpses.Length ; #DEBUG_LINE_NO:17
    myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:18
    I += 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetStage(5) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:30
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:31
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[0]) ; #DEBUG_LINE_NO:32
  ObjectReference myNPC = Alias_CorpseKeyRef.GetRef() ; #DEBUG_LINE_NO:34
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[0], 1, False, False, True) ; #DEBUG_LINE_NO:35
  myContainers[0].Lock(True, False, True) ; #DEBUG_LINE_NO:37
  myNPC.AddItem(lootkey as Form, 1, False) ; #DEBUG_LINE_NO:38
  myNPC.AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:47
  Alias_GenetagRef.ForceRefTo(myCorpses[2]) ; #DEBUG_LINE_NO:48
  Int x = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:50
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:51
     ; #DEBUG_LINE_NO:
  ElseIf x == 1 ; #DEBUG_LINE_NO:52
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01 as Form, Alias_IDCard01 as Alias, 1, True) ; #DEBUG_LINE_NO:53
  ElseIf x == 2 ; #DEBUG_LINE_NO:54
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02 as Form, Alias_IDCard02 as Alias, 1, True) ; #DEBUG_LINE_NO:55
  ElseIf x == 3 ; #DEBUG_LINE_NO:56
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03 as Form, Alias_IDCard03 as Alias, 1, True) ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04 as Form, Alias_IDCard04 as Alias, 1, True) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:76
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:77
  kmyQuest.SetShipHazard(hazardExtremeCold) ; #DEBUG_LINE_NO:80
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:81
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:82
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:91
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:92
  kmyQuest.SetShipHazard(hazardNoOxygen) ; #DEBUG_LINE_NO:95
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:97
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:99
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:100
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:109
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:110
  kmyQuest.SetShipHazard(hazardRadiation) ; #DEBUG_LINE_NO:113
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:114
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:115
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0005_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:124
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:125
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:128
  If biohazard == 1 ; #DEBUG_LINE_NO:129
    kmyQuest.SetShipHazard(hazardExtremeHeat) ; #DEBUG_LINE_NO:130
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSteamHeat) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:134
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:135
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:144
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:145
  kmyQuest.SetShipHazard(hazardCorrosiveGas) ; #DEBUG_LINE_NO:148
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:150
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:151
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0005_Item_05()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:160
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:161
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:164
  If biohazard == 1 ; #DEBUG_LINE_NO:165
    kmyQuest.SetShipHazard(hazardToxicGas) ; #DEBUG_LINE_NO:166
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSpores) ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:171
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:172
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0005_Item_06()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:181
  Int I = 0 ; #DEBUG_LINE_NO:183
  While I < myMarkers.Length ; #DEBUG_LINE_NO:184
    myMarkers[I].PlaceAtMe(creatures as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:185
    I += 1 ; #DEBUG_LINE_NO:186
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:189
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:190
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False) ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_0005_Item_07()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:199
  Int I = 0 ; #DEBUG_LINE_NO:201
  While I < myMarkers.Length ; #DEBUG_LINE_NO:202
    myMarkers[I].PlaceAtMe(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:203
    I += 1 ; #DEBUG_LINE_NO:204
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:207
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:208
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(1) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(2) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0008_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(3) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0009_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(4) ; #DEBUG_LINE_NO:241
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4)) ; #DEBUG_LINE_NO:249
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:250
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 7)) ; #DEBUG_LINE_NO:251
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2)) ; #DEBUG_LINE_NO:252
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1)) ; #DEBUG_LINE_NO:253
  SE_GenericDerelict_Repaired.SetValue(0.0) ; #DEBUG_LINE_NO:254
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0) ; #DEBUG_LINE_NO:255
  Alias_CaptainsLocker.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:264
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:265
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:268
  SE_GenericDerelict_Repaired.SetValue(1.0) ; #DEBUG_LINE_NO:269
  Alias_Terminal.GetRef().SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, True) ; #DEBUG_LINE_NO:270
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:279
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox as Form, Alias_Blackbox as Alias, 1, True) ; #DEBUG_LINE_NO:287
  Self.SetStage(4) ; #DEBUG_LINE_NO:288
EndFunction
