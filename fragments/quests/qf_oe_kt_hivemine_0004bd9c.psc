ScriptName Fragments:Quests:QF_OE_KT_HiveMine_0004BD9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Predators_Group Auto Const mandatory
Scene Property OE_KT_HiveMine_Scene01 Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
Scene Property OE_KT_HiveMine_Scene02 Auto Const mandatory
MiscObject Property OE_KT_HiveMine_Canister_Poison Auto Const mandatory
ReferenceAlias Property Alias_Poison_Canister Auto Const mandatory
wwiseevent Property WwiseEvent_NestDamage Auto Const mandatory
ReferenceAlias Property Alias_Activator Auto Const mandatory
ReferenceAlias Property Alias_HiveNest Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Float Property shakeFloat Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
ReferenceAlias Property Alias_Marker_SceneA01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_LargeGroundObject00 Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_NPC_Trader Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference Nest = Alias_Activator.GetRef() ; #DEBUG_LINE_NO:7
  If Nest.GetDistance(Alias_Marker_SceneA01.GetRef()) < 15.0 ; #DEBUG_LINE_NO:9
    Nest.MoveTo(Alias_Marker_LargeGroundObject00.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Alias_Container_Reward.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_HiveMine_Scene01.Start() ; #DEBUG_LINE_NO:21
  Alias_NPC02.GetActorRef().SetRestrained(True) ; #DEBUG_LINE_NO:23
  Alias_NPC03.GetActorRef().SetRestrained(True) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().AddAliasedItem(OE_KT_HiveMine_Canister_Poison as Form, Alias_Poison_Canister as Alias, 1, True) ; #DEBUG_LINE_NO:32
  Self.SetStage(30) ; #DEBUG_LINE_NO:33
  ObjectReference MarkerRef = Alias_Activator.GetRef() ; #DEBUG_LINE_NO:35
  Int k = Utility.RandomInt(0, 5) ; #DEBUG_LINE_NO:36
  Int I = 0 ; #DEBUG_LINE_NO:37
  If k == 0 ; #DEBUG_LINE_NO:39
    While I < 4 ; #DEBUG_LINE_NO:40
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:41
      I += 1 ; #DEBUG_LINE_NO:42
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 1 ; #DEBUG_LINE_NO:44
    While I < 4 ; #DEBUG_LINE_NO:45
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:46
      I += 1 ; #DEBUG_LINE_NO:47
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 2 ; #DEBUG_LINE_NO:49
    While I < 4 ; #DEBUG_LINE_NO:50
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:51
      I += 1 ; #DEBUG_LINE_NO:52
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 3 ; #DEBUG_LINE_NO:54
    While I < 4 ; #DEBUG_LINE_NO:55
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:56
      I += 1 ; #DEBUG_LINE_NO:57
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 4 ; #DEBUG_LINE_NO:59
    While I < 4 ; #DEBUG_LINE_NO:60
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:61
      I += 1 ; #DEBUG_LINE_NO:62
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 5 ; #DEBUG_LINE_NO:64
    While I < 4 ; #DEBUG_LINE_NO:65
      Alias_Predators_Group.AddRef(MarkerRef.PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:66
      I += 1 ; #DEBUG_LINE_NO:67
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0026_Item_00()
  Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef()) ; #DEBUG_LINE_NO:77
  Self.SetStage(30) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:86
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HiveNest.ForceRefTo(Alias_Activator.GetRef()) ; #DEBUG_LINE_NO:95
  Game.GetPlayer().RemoveItem(OE_KT_HiveMine_Canister_Poison as Form, 1, False, None) ; #DEBUG_LINE_NO:96
  WwiseEvent_NestDamage.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:97
  Game.ShakeCamera(None, shakeFloat, 0.0) ; #DEBUG_LINE_NO:98
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0050_Item_01()
  Self.SetStage(200) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:115
  If Self.GetStageDone(70) ; #DEBUG_LINE_NO:116
    Self.SetStage(80) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  Alias_NPC02.GetActorRef().SetRestrained(False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0070_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:135
  If Self.GetStageDone(60) ; #DEBUG_LINE_NO:136
    Self.SetStage(80) ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
  Alias_NPC02.GetActorRef().SetRestrained(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0075_Item_00()
  Alias_NPC_Trader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:147
  Alias_NPC00.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:148
  Alias_NPC01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:149
  Alias_NPC02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:150
  Alias_NPC03.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:151
  Alias_NPC04.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0080_Item_00()
  OE_KT_HiveMine_Scene02.Start() ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0175_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0175_Item_01()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:192
  OE_KT_HiveMine_Scene02.Start() ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:202
  Self.Stop() ; #DEBUG_LINE_NO:203
EndFunction
