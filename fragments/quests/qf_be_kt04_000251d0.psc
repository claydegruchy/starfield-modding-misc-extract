ScriptName Fragments:Quests:QF_BE_KT04_000251D0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property SE_KT03 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate01 Auto Const mandatory
GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const mandatory
RefCollectionAlias Property Alias_GenericCorpses Auto Const mandatory
Book Property BE_KT04_AudioLogSlate02 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate03 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate04 Auto Const mandatory
Book Property BE_KT04_DataSlate01 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate04B Auto Const mandatory
Book Property BE_KT04_DataSlate02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant01 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant03 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant04 Auto Const
Book Property BE_KT04_AudioLogSlate08 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate07 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate06 Auto Const mandatory
Book Property BE_KT04_DataSlate03 Auto Const mandatory
Book Property BE_KT04_DataSlate04 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate09 Auto Const mandatory
ActorBase Property LvlSpacer Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
Book Property BE_KT04_DataSlate00 Auto Const mandatory
ReferenceAlias Property Alias_SpacerCaptain Auto Const mandatory
Book Property BE_KT04_DataSlate03b Auto Const mandatory
ReferenceAlias Property Alias_AudioLog01 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog02 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog03 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog04 Auto Const mandatory
RefCollectionAlias Property Alias_SlateCollection Auto Const mandatory
Quest Property SE_KT04 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate08b Auto Const mandatory
RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const mandatory
RefCollectionAlias Property Alias_Spacers Auto Const mandatory
VoiceType Property _NPC_NoLines Auto Const mandatory
RefCollectionAlias Property Alias_SmallItemSpawnMarkers Auto Const mandatory
Keyword Property LocTypeBEDerelict Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Container.GetRef().AddAliasedItem(BE_KT04_DataSlate00 as Form, Alias_AudioLog04 as Alias, 1, True) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict) ; #DEBUG_LINE_NO:15
  SE_KT04.SetStage(30) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Captain.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0015_Item_01()
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:32
  ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:33
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate02 as Form, Alias_AudioLog01 as Alias, 1, True) ; #DEBUG_LINE_NO:35
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef()) ; #DEBUG_LINE_NO:36
  pCorpses[1].AddAliasedItem(BE_KT04_DataSlate01 as Form, Alias_AudioLog02 as Alias, 1, True) ; #DEBUG_LINE_NO:38
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef()) ; #DEBUG_LINE_NO:39
  ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate01 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:41
  Alias_AudioLog03.ForceRefTo(SlateRef) ; #DEBUG_LINE_NO:42
  Alias_SlateCollection.AddRef(SlateRef) ; #DEBUG_LINE_NO:43
  BE_KT04_Variant01.SetValue(1.0) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0015_Item_02()
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:55
  pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate03 as Form, Alias_AudioLog01 as Alias, 1, True) ; #DEBUG_LINE_NO:57
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef()) ; #DEBUG_LINE_NO:58
  pCorpses[2].AddAliasedItem(BE_KT04_DataSlate02 as Form, Alias_AudioLog02 as Alias, 1, True) ; #DEBUG_LINE_NO:60
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef()) ; #DEBUG_LINE_NO:61
  ObjectReference CaptainRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:63
  CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04 as Form, Alias_AudioLog03 as Alias, 1, True) ; #DEBUG_LINE_NO:64
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef()) ; #DEBUG_LINE_NO:65
  CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04B as Form, Alias_AudioLog04 as Alias, 1, True) ; #DEBUG_LINE_NO:67
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef()) ; #DEBUG_LINE_NO:68
  BE_KT04_Variant02.SetValue(1.0) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0015_Item_03()
  Alias_SpacerCaptain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate07 as Form, Alias_AudioLog01 as Alias, 1, True) ; #DEBUG_LINE_NO:79
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef()) ; #DEBUG_LINE_NO:80
  Int I = 0 ; #DEBUG_LINE_NO:82
  ObjectReference[] SpawnMarkers = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:83
  While I < SpawnMarkers.Length && I < 7 ; #DEBUG_LINE_NO:85
    ObjectReference Spacer = SpawnMarkers[I].PlaceAtMe(LvlSpacer as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:86
    Alias_Spacers.AddRef(Spacer) ; #DEBUG_LINE_NO:87
    I += 1 ; #DEBUG_LINE_NO:88
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] SpacerRefs = Alias_Spacers.GetArray() ; #DEBUG_LINE_NO:91
  ObjectReference[] GenericCorpsesRefs = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:92
  SpacerRefs[0].AddAliasedItem(BE_KT04_AudioLogSlate06 as Form, Alias_AudioLog02 as Alias, 1, True) ; #DEBUG_LINE_NO:93
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef()) ; #DEBUG_LINE_NO:94
  SpacerRefs[1].AddAliasedItem(BE_KT04_DataSlate03 as Form, Alias_AudioLog03 as Alias, 1, True) ; #DEBUG_LINE_NO:96
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef()) ; #DEBUG_LINE_NO:97
  Alias_Spacers.KillAll(None) ; #DEBUG_LINE_NO:99
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:101
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate03b as Form, Alias_AudioLog04 as Alias, 1, True) ; #DEBUG_LINE_NO:103
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef()) ; #DEBUG_LINE_NO:104
  BE_KT04_Variant03.SetValue(1.0) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0015_Item_04()
  ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:115
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray() ; #DEBUG_LINE_NO:116
  pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate08 as Form, Alias_AudioLog01 as Alias, 1, True) ; #DEBUG_LINE_NO:118
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef()) ; #DEBUG_LINE_NO:119
  ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate08b as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:121
  Alias_AudioLog02.ForceRefTo(SlateRef) ; #DEBUG_LINE_NO:122
  Alias_SlateCollection.AddRef(SlateRef) ; #DEBUG_LINE_NO:123
  ObjectReference Slate2Ref = pSpawnMarkers[1].PlaceAtMe(BE_KT04_AudioLogSlate09 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:125
  Alias_AudioLog03.ForceRefTo(Slate2Ref) ; #DEBUG_LINE_NO:126
  Alias_SlateCollection.AddRef(Slate2Ref) ; #DEBUG_LINE_NO:127
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate04 as Form, Alias_AudioLog04 as Alias, 1, True) ; #DEBUG_LINE_NO:129
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef()) ; #DEBUG_LINE_NO:130
  BE_KT04_Variant04.SetValue(1.0) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0015_Item_05()
  Alias_SpacerCaptain.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0015_Item_06()
  SE_KT04.SetStage(30) ; #DEBUG_LINE_NO:149
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:150
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef()) ; #DEBUG_LINE_NO:151
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef()) ; #DEBUG_LINE_NO:152
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef()) ; #DEBUG_LINE_NO:153
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef()) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_Captain.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_1000_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(9.0) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_1000_Item_01()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:187
  Self.Stop() ; #DEBUG_LINE_NO:188
EndFunction
