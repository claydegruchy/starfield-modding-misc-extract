ScriptName Fragments:Quests:QF_CF08_Fleet_Misc_000E758F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CF08_010_KeyScenes_Pre01 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_D Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_C Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre02 Auto Const mandatory
Scene Property CF08_000_KeyScenes_Start Auto Const mandatory
ReferenceAlias Property Alias_Reaver Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre03 Auto Const mandatory
Scene Property CF08_010_KeyScenes_Pre04 Auto Const mandatory
ReferenceAlias Property Alias_OperationsMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_MarkerA Auto Const mandatory
ReferenceAlias Property Alias_OperationsMarker03 Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post01 Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Estelle Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Mathis Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Huan Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Adler Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_E Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01NPC_F Auto Const mandatory
ReferenceAlias[] Property CF08_Misc Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post04 Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post05 Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_DockingNPC02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene01_DockingNPC01 Auto Const mandatory
ReferenceAlias[] Property CF08_Captains Auto Const mandatory
Scene Property CF08_110_KeyScenes_Post06 Auto Const mandatory
ReferenceAlias Property Alias_CaptainSit_Naeva Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
ReferenceAlias Property Alias_Key_MiscEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_MathisReplacement Auto Const mandatory
Scene Property CREW_EliteCrew_MathisCastillo_RecruitScene Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCA Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_SpacePirate_02 Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCC Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCD Auto Const mandatory
ActorBase Property LvlCrimsonFleet_Male Auto Const mandatory
ActorBase Property LvlCrimsonFleet_Female Auto Const mandatory
ActorBase Property CF_TheKey_Fleet_NoSpacesuit Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerD Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerC Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPC_MarkerA Auto Const mandatory
ActorBase Property CF_TheKey_GenericFleet_CaptainPatrol_Operations04 Auto Const mandatory
ReferenceAlias Property Alias_Operations_Actor05 Auto Const mandatory
ReferenceAlias Property Alias_Operations_Actor06 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
ReferenceAlias Property Alias_Key_Scene02_NPCB Auto Const mandatory
ReferenceAlias Property Alias_MathisSitMarker Auto Const mandatory
ReferenceAlias Property Alias_NaevaSitMarker Auto Const mandatory
Weapon Property Tombstone Auto Const mandatory
ObjectReference Property CFPost_Fleet_Mathis_Forcegreet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:8
  DialogueCFTheKey.SetStage(300) ; #DEBUG_LINE_NO:9
  LC088_Vigilance.SetStage(1100) ; #DEBUG_LINE_NO:10
  Self.SetStage(100) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().MoveTo(Alias_Key_Scene01_DockingNPC02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Self.SetStage(2) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor FleetRef = Alias_Key_Scene01NPC_C.GetActorRef() ; #DEBUG_LINE_NO:21
  If FleetRef.IsDead() ; #DEBUG_LINE_NO:23
    Alias_Key_Scene01NPC_C.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_Fleet_NoSpacesuit as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_01()
  Actor FleetRef = Alias_Key_Scene02_NPCC.GetActorRef() ; #DEBUG_LINE_NO:33
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerC.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
  If FleetRef.IsDead() ; #DEBUG_LINE_NO:37
    Alias_Key_Scene02_NPCC.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Female as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_02()
  Actor FleetRef = Alias_Key_Scene02_NPCD.GetActorRef() ; #DEBUG_LINE_NO:47
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerD.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  If FleetRef.IsDead() ; #DEBUG_LINE_NO:51
    Alias_Key_Scene02_NPCD.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_03()
  Actor FleetRef = Alias_Key_Scene01NPC_D.GetActorRef() ; #DEBUG_LINE_NO:61
  If FleetRef.IsDead() ; #DEBUG_LINE_NO:63
    Alias_Key_Scene01NPC_D.ForceRefTo(FleetRef.PlaceAtMe(LvlCrimsonFleet_Male as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_04()
  Actor FleetRef = Alias_Key_Scene02_NPCA.GetActorRef() ; #DEBUG_LINE_NO:73
  FleetRef.MoveTo(Alias_Key_Scene02_NPC_MarkerA.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:75
  If FleetRef.IsDead() ; #DEBUG_LINE_NO:77
    Alias_Key_Scene02_NPCA.ForceRefTo(FleetRef.PlaceAtMe(CF_TheKey_GenericFleet_CaptainPatrol_Operations04 as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF08_000_KeyScenes_Start.Start() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0010_Item_00()
  CF08_000_KeyScenes_Start.Stop() ; #DEBUG_LINE_NO:97
  CF08_010_KeyScenes_Pre01.Start() ; #DEBUG_LINE_NO:98
  DialogueUCVigilance.SetStage(4) ; #DEBUG_LINE_NO:100
  Alias_CaptainSit_Mathis.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_Mathis.GetRef().MoveTo(Alias_CaptainSit_Mathis.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_Mathis.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF08_010_KeyScenes_Pre01.Stop() ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Key_Scene02_NPCC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:133
  Alias_Key_Scene02_NPCB.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:134
  Alias_Key_Scene02_NPCD.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF08_010_KeyScenes_Pre02.Start() ; #DEBUG_LINE_NO:145
  Alias_OperationsMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:149
  Alias_OperationsMarker03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0040_Item_00()
  CF08_010_KeyScenes_Pre03.Start() ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF08_010_KeyScenes_Pre04.Start() ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Key_MiscEnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:175
  Alias_Key_Scene01_MarkerA.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:176
  Alias_Key_Scene01NPC_E.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:177
  Alias_Key_Scene01NPC_F.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0110_Item_00()
  CF08_010_KeyScenes_Pre01.Stop() ; #DEBUG_LINE_NO:186
  CF08_010_KeyScenes_Pre02.Stop() ; #DEBUG_LINE_NO:187
  CF08_010_KeyScenes_Pre03.Stop() ; #DEBUG_LINE_NO:188
  CF08_010_KeyScenes_Pre04.Stop() ; #DEBUG_LINE_NO:189
  CF08_110_KeyScenes_Post01.Start() ; #DEBUG_LINE_NO:190
  Alias_Operations_Actor05.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:192
  Alias_Operations_Actor06.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0115_Item_00()
  CF08_110_KeyScenes_Post01.Stop() ; #DEBUG_LINE_NO:201
  CF08_110_KeyScenes_Post02.Start() ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0120_Item_00()
  Actor AdlerRef = Alias_Adler.GetActorRef() ; #DEBUG_LINE_NO:212
  AdlerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:214
  AdlerRef.MoveTo(Alias_CaptainSit_Adler.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:215
  AdlerRef.SetCrimeFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0120_Item_01()
  Actor EstelleRef = Alias_Estelle.GetActorRef() ; #DEBUG_LINE_NO:226
  EstelleRef.EnableNoWait(False) ; #DEBUG_LINE_NO:228
  EstelleRef.MoveTo(Alias_CaptainSit_Estelle.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:229
  EstelleRef.SetCrimeFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:230
EndFunction

Function Fragment_Stage_0120_Item_02()
  Actor HuanRef = Alias_Huan.GetActorRef() ; #DEBUG_LINE_NO:240
  HuanRef.EnableNoWait(False) ; #DEBUG_LINE_NO:242
  HuanRef.MoveTo(Alias_CaptainSit_Huan.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:243
  HuanRef.SetCrimeFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0120_Item_03()
  Actor MathisRef = Alias_Mathis.GetActorRef() ; #DEBUG_LINE_NO:254
  MathisRef.EnableNoWait(False) ; #DEBUG_LINE_NO:256
  MathisRef.MoveTo(Alias_CaptainSit_Mathis.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:257
  MathisRef.SetCrimeFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0120_Item_04()
  Actor RokovRef = Alias_Rokov.GetActorRef() ; #DEBUG_LINE_NO:268
  RokovRef.EnableNoWait(False) ; #DEBUG_LINE_NO:270
  RokovRef.MoveTo(Alias_CaptainSit_Rokov.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:271
  RokovRef.SetCrimeFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_0120_Item_05()
  Alias_MathisReplacement.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:280
  Self.SetStage(125) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0120_Item_06()
  Alias_Mathis.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_Key_Scene02_NPCC.GetActorRef().EquipItem(Tombstone as Form, True, False) ; #DEBUG_LINE_NO:299
  CF08_110_KeyScenes_Post01.Stop() ; #DEBUG_LINE_NO:301
  CF08_110_KeyScenes_Post02.Stop() ; #DEBUG_LINE_NO:302
  CF08_110_KeyScenes_Post04.Start() ; #DEBUG_LINE_NO:303
  Alias_Key_Scene01_DockingNPC01.Clear() ; #DEBUG_LINE_NO:305
  Alias_Key_Scene01_DockingNPC02.Clear() ; #DEBUG_LINE_NO:306
  Alias_Key_Scene01NPC_C.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:307
  Alias_Key_Scene01NPC_E.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:308
  Alias_Key_Scene01NPC_F.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:309
  ObjectReference MathisMarker = Alias_MathisSitMarker.GetRef() ; #DEBUG_LINE_NO:311
  ObjectReference NaevaMarker = Alias_NaevaSitMarker.GetRef() ; #DEBUG_LINE_NO:312
  ObjectReference Mathis = Alias_Mathis.GetRef() ; #DEBUG_LINE_NO:314
  Actor Naeva = Alias_Naeva.GetActorRef() ; #DEBUG_LINE_NO:315
  If !Mathis.IsDisabled() ; #DEBUG_LINE_NO:317
    MathisMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:318
    Mathis.MoveTo(MathisMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:319
  EndIf ; #DEBUG_LINE_NO:
  If Naeva.IsDisabled() ; #DEBUG_LINE_NO:322
    Naeva.EnableNoWait(False) ; #DEBUG_LINE_NO:323
  EndIf ; #DEBUG_LINE_NO:
  Naeva.SnapIntoInteraction(NaevaMarker) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0140_Item_00()
  CF08_110_KeyScenes_Post05.Start() ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_0150_Item_00()
  CF08_110_KeyScenes_Post06.Start() ; #DEBUG_LINE_NO:342
EndFunction

Function Fragment_Stage_0450_Item_00()
  CFPost_Fleet_Mathis_Forcegreet.DisableNoWait(False) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Huan.Clear() ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_OperationsMarker02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:367
  Alias_Operations_Actor05.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:368
  Alias_Operations_Actor06.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:369
  Int I = 0 ; #DEBUG_LINE_NO:372
  While I < CF08_Misc.Length ; #DEBUG_LINE_NO:373
    CF08_Misc[I].GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:374
    I += 1 ; #DEBUG_LINE_NO:375
  EndWhile ; #DEBUG_LINE_NO:
  Alias_CaptainSit_Mathis.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:377
  Self.Stop() ; #DEBUG_LINE_NO:379
EndFunction
