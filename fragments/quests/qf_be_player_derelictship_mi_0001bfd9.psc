ScriptName Fragments:Quests:QF_BE_Player_DerelictShip_Mi_0001BFD9 Extends Quest Const hidden

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
ReferenceAlias Property Alias_InstancedKey Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:7
  Int x = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:8
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:9
    Self.SetStage(3) ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(3) ; #DEBUG_LINE_NO:16
  Self.SetStage(2) ; #DEBUG_LINE_NO:17
  Int I = 3 ; #DEBUG_LINE_NO:19
  While I < myCorpses.Length ; #DEBUG_LINE_NO:20
    myCorpses[I].AddItem(LL_SE_GenericDerelict_GenericNotes as Form, 1, False) ; #DEBUG_LINE_NO:21
    I += 1 ; #DEBUG_LINE_NO:22
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetStage(5) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:33
  ObjectReference[] myContainers = Alias_Containers.GetArray() ; #DEBUG_LINE_NO:34
  Alias_CorpseKeyRef.ForceRefTo(myCorpses[2]) ; #DEBUG_LINE_NO:35
  ObjectReference myNPC = myCorpses[2] ; #DEBUG_LINE_NO:37
  ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[0], 1, False, False, True) ; #DEBUG_LINE_NO:38
  myContainers[0].Lock(True, False, True) ; #DEBUG_LINE_NO:40
  myNPC.AddAliasedItem(lootkey as Form, Alias_InstancedKey as Alias, 1, True) ; #DEBUG_LINE_NO:41
  myNPC.AddItem(LL_SE_GenericDerelict_LockedLootNote as Form, 1, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:50
  Alias_GenetagRef.ForceRefTo(myCorpses[0]) ; #DEBUG_LINE_NO:51
  Int x = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:53
  If x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:54
     ; #DEBUG_LINE_NO:
  ElseIf x == 1 ; #DEBUG_LINE_NO:55
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01 as Form, Alias_IDCard01 as Alias, 1, True) ; #DEBUG_LINE_NO:56
  ElseIf x == 2 ; #DEBUG_LINE_NO:57
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02 as Form, Alias_IDCard02 as Alias, 1, True) ; #DEBUG_LINE_NO:58
  ElseIf x == 3 ; #DEBUG_LINE_NO:59
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03 as Form, Alias_IDCard03 as Alias, 1, True) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    Alias_GenetagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04 as Form, Alias_IDCard04 as Alias, 1, True) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  SE_GenericDerelict_BlackBoxQuest.SetStage(10) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:79
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:80
  kmyQuest.SetShipHazard(hazardExtremeCold) ; #DEBUG_LINE_NO:83
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:84
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:85
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes as Form, 1, False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0005_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:94
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:95
  kmyQuest.SetShipHazard(hazardNoOxygen) ; #DEBUG_LINE_NO:98
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:100
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:102
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:103
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes as Form, 1, False) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0005_Item_02()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:112
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:113
  kmyQuest.SetShipHazard(hazardRadiation) ; #DEBUG_LINE_NO:116
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:117
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:118
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes as Form, 1, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0005_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:127
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:128
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:131
  If biohazard == 1 ; #DEBUG_LINE_NO:132
    kmyQuest.SetShipHazard(hazardExtremeHeat) ; #DEBUG_LINE_NO:133
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSteamHeat) ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:137
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:138
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes as Form, 1, False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0005_Item_04()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:147
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:148
  kmyQuest.SetShipHazard(hazardCorrosiveGas) ; #DEBUG_LINE_NO:151
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:153
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:154
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes as Form, 1, False) ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0005_Item_05()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:163
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:164
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:167
  If biohazard == 1 ; #DEBUG_LINE_NO:168
    kmyQuest.SetShipHazard(hazardToxicGas) ; #DEBUG_LINE_NO:169
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetShipHazard(hazardSpores) ; #DEBUG_LINE_NO:171
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:174
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:175
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes as Form, 1, False) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0005_Item_06()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:184
  Int I = 0 ; #DEBUG_LINE_NO:186
  While I < myMarkers.Length ; #DEBUG_LINE_NO:187
    myMarkers[I].PlaceAtMe(creatures as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:188
    I += 1 ; #DEBUG_LINE_NO:189
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:192
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:193
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes as Form, 1, False) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0005_Item_07()
  ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:202
  Int I = 0 ; #DEBUG_LINE_NO:204
  While I < myMarkers.Length ; #DEBUG_LINE_NO:205
    myMarkers[I].PlaceAtMe(LvlRobotModelA_Combat as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:206
    I += 1 ; #DEBUG_LINE_NO:207
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:210
  Alias_ExtraNote.ForceRefTo(myCorpses[1]) ; #DEBUG_LINE_NO:211
  Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes as Form, 1, False) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0006_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(1) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(2) ; #DEBUG_LINE_NO:228
EndFunction

Function Fragment_Stage_0008_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(3) ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0009_Item_00()
  SE_GenericDerelict_IDCardQuest.SetStage(4) ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4)) ; #DEBUG_LINE_NO:252
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:253
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 7)) ; #DEBUG_LINE_NO:254
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2)) ; #DEBUG_LINE_NO:255
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1)) ; #DEBUG_LINE_NO:256
  SE_GenericDerelict_Repaired.SetValue(0.0) ; #DEBUG_LINE_NO:257
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0) ; #DEBUG_LINE_NO:258
  Alias_CaptainsLocker.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:267
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:268
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:271
  SE_GenericDerelict_Repaired.SetValue(1.0) ; #DEBUG_LINE_NO:272
  Alias_Terminal.GetRef().SetLinkedRef(Alias_CaptainsLocker.GetRef(), None, True) ; #DEBUG_LINE_NO:273
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:274
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_CaptainsLocker.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox as Form, Alias_Blackbox as Alias, 1, True) ; #DEBUG_LINE_NO:290
  Self.SetStage(4) ; #DEBUG_LINE_NO:291
EndFunction
