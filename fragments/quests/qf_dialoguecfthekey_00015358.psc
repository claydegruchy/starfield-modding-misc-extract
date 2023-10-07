ScriptName Fragments:Quests:QF_DialogueCFTheKey_00015358 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC082 Auto Const mandatory
ReferenceAlias Property Alias_TheKeyStartMarker Auto Const mandatory
Scene Property DialogueCFTheKey_EstablishingScene Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Marauder Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Reaver Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory
Quest Property FFKeyZ01MiscObjective Auto Const mandatory
Quest Property FFKeyZ02 Auto Const mandatory
ReferenceAlias Property Alias_CFMissionBoards_Shinya_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_FFKeyZ02_Samina_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_DisableGenerics Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Scene Property DialogueCFTheKey_LastNova_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron01 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_CFNovaMarker02 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron02 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_NovaPatron04 Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_CFNovaMarker03 Auto Const mandatory
ReferenceAlias[] Property FinishedAliases Auto Const mandatory
ReferenceAlias Property Alias_Intro_BogSceneChair01 Auto Const mandatory
Key Property LC088_PlayerHomeKey Auto Const mandatory
ObjectReference Property workshopRef Auto Const mandatory
ReferenceAlias Property Alias_CF_Naeva Auto Const mandatory
Scene Property CF02_1700_Naeva_KeyIntroScene Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_Marker Auto Const mandatory
ReferenceAlias Property Alias_IntroScene_ReaverMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Huan Auto Const mandatory
RefCollectionAlias Property Alias_CommentTriggers Auto Const mandatory
Armor Property Clothes_CrimsonFleet_Captain_01_C_RedCoat Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory
Potion Property NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
  CF03.CompleteQuest() ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0002_Item_00()
  CF_Main.SetStage(0) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().MoveTo(Alias_FFKeyZ02_Samina_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0003_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:36
  Alias_DisableGenerics.GetRef().Disable(False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(103) ; #DEBUG_LINE_NO:45
  Self.SetStage(200) ; #DEBUG_LINE_NO:46
  Self.SetStage(300) ; #DEBUG_LINE_NO:47
  Self.SetStage(400) ; #DEBUG_LINE_NO:48
  Self.SetStage(500) ; #DEBUG_LINE_NO:49
  Self.SetStage(600) ; #DEBUG_LINE_NO:50
  Self.SetStage(700) ; #DEBUG_LINE_NO:51
  Self.SetStage(800) ; #DEBUG_LINE_NO:52
  Self.SetStage(900) ; #DEBUG_LINE_NO:53
  Alias_IntroScene_Reaver.GetRef().Disable(False) ; #DEBUG_LINE_NO:54
  Alias_CommentTriggers.EnableAll(False) ; #DEBUG_LINE_NO:55
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef() ; #DEBUG_LINE_NO:57
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef() ; #DEBUG_LINE_NO:58
  MainMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:60
  ReaverMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:61
  Alias_IntroScene_Marker.Clear() ; #DEBUG_LINE_NO:62
  Alias_IntroScene_ReaverMarker.Clear() ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:71
  Self.SetStage(4) ; #DEBUG_LINE_NO:72
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0006_Item_00()
  CF_Main.SetStage(0) ; #DEBUG_LINE_NO:81
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0007_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:90
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:91
  CF02.CompleteQuest() ; #DEBUG_LINE_NO:92
  Self.SetStage(103) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0008_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:101
  Game.GetPlayer().MoveTo(workshopRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  Game.GetPlayer().AddItem(LC088_PlayerHomeKey as Form, 1, False) ; #DEBUG_LINE_NO:103
  CF02.CompleteQuest() ; #DEBUG_LINE_NO:104
  Self.SetStage(103) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:113
  Game.GetPlayer().MoveTo(Alias_CFMissionBoards_Shinya_StartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:114
  Game.GetPlayer().AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:115
  CrimsonFleetFaction.SetCrimeGold(9999) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CommentTriggers.EnableAll(False) ; #DEBUG_LINE_NO:124
  Alias_IntroScene_Reaver.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:125
  Alias_IntroScene_Reaver.Clear() ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0013_Item_00()
  Game.GetPlayer().AddItem(NOCLUTTER_CF_Drink_Alc_ExclMenuItem_Grog as Form, 1, False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_IntroScene_Reaver.GetRef().Disable(False) ; #DEBUG_LINE_NO:142
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef() ; #DEBUG_LINE_NO:144
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef() ; #DEBUG_LINE_NO:145
  MainMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:147
  ReaverMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:148
  Alias_IntroScene_Marker.Clear() ; #DEBUG_LINE_NO:149
  Alias_IntroScene_ReaverMarker.Clear() ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0097_Item_00()
  Alias_IntroScene_NovaPatron01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:159
  Alias_IntroScene_NovaPatron02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:160
  Self.SetStage(98) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0098_Item_00()
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:171
  DialogueCFTheKey_LastNova_IntroScene.Stop() ; #DEBUG_LINE_NO:172
  Alias_IntroScene_CFNovaMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:173
  Int I = 0 ; #DEBUG_LINE_NO:176
  While I < FinishedAliases.Length ; #DEBUG_LINE_NO:177
    FinishedAliases[I].Clear() ; #DEBUG_LINE_NO:178
    I += 1 ; #DEBUG_LINE_NO:179
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Intro_BogSceneChair01.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0099_Item_00()
  DialogueCFTheKey_LastNova_IntroScene.Start() ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference ReaverRef = Alias_IntroScene_Reaver.GetRef() ; #DEBUG_LINE_NO:199
  ReaverRef.EnableNoWait(False) ; #DEBUG_LINE_NO:201
  ReaverRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0100_Item_01()
  DialogueCFTheKey_EstablishingScene.Start() ; #DEBUG_LINE_NO:210
  Alias_CF_Naeva.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:212
  Alias_IntroScene_Reaver.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:213
  Alias_IntroScene_Marauder.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:214
  CF02.SetStage(900) ; #DEBUG_LINE_NO:215
EndFunction

Function Fragment_Stage_0101_Item_00()
  Alias_IntroScene_Reaver.GetRef().RemoveKeyword(BlockPlayerActivation) ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0102_Item_00()
  Alias_IntroScene_Marauder.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:231
  Alias_IntroScene_Reaver.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:232
EndFunction

Function Fragment_Stage_0103_Item_00()
  DialogueCFTheKey_EstablishingScene.Stop() ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0104_Item_00()
  Actor FleetMarauder = Alias_IntroScene_Marauder.GetActorRef() ; #DEBUG_LINE_NO:248
  FleetMarauder.AddToFaction(CrimsonFleetFaction) ; #DEBUG_LINE_NO:250
  FleetMarauder.SetEssential(False) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0105_Item_00()
  DialogueCFTheKey_EstablishingScene.Stop() ; #DEBUG_LINE_NO:259
  If Game.GetPlayer().GetDistance(Alias_CF_Naeva.GetRef()) < 3.0 ; #DEBUG_LINE_NO:260
    CF02_1700_Naeva_KeyIntroScene.Start() ; #DEBUG_LINE_NO:261
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:264
  ObjectReference MainMarkerRef = Alias_IntroScene_Marker.GetRef() ; #DEBUG_LINE_NO:266
  ObjectReference ReaverMarkerRef = Alias_IntroScene_ReaverMarker.GetRef() ; #DEBUG_LINE_NO:267
  MainMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:269
  ReaverMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:270
  Alias_IntroScene_Marker.Clear() ; #DEBUG_LINE_NO:271
  Alias_IntroScene_ReaverMarker.Clear() ; #DEBUG_LINE_NO:272
  Self.SetStage(106) ; #DEBUG_LINE_NO:274
EndFunction

Function Fragment_Stage_0106_Item_00()
  Alias_CF_Naeva.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:282
  Alias_IntroScene_Reaver.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:283
  Alias_IntroScene_Marauder.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:284
EndFunction

Function Fragment_Stage_0250_Item_00()
  FFKeyZ01MiscObjective.SetStage(100) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0850_Item_00()
  FFKeyZ02.SetStage(100) ; #DEBUG_LINE_NO:300
EndFunction

Function Fragment_Stage_0950_Item_00()
  PlayerHouseSystem.PurchaseHouse(None, LC088_PlayerHomeKey) ; #DEBUG_LINE_NO:309
  CF_Key_Home_CaptainsQuarters_Misc.Start() ; #DEBUG_LINE_NO:312
  Game.GetPlayer().AddItem(Clothes_CrimsonFleet_Captain_01_C_RedCoat as Form, 1, False) ; #DEBUG_LINE_NO:313
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_IntroScene_Reaver.GetRef().Disable(False) ; #DEBUG_LINE_NO:321
  Self.Stop() ; #DEBUG_LINE_NO:322
EndFunction
