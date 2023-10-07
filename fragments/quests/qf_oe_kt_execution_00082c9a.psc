ScriptName Fragments:Quests:QF_OE_KT_Execution_00082C9A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC_Attacker01 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker03 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Attacker04 Auto Const mandatory
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
Potion Property DrinkPack_Water_Md Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
FormList Property OnlyWaterList Auto Const mandatory
ReferenceAlias Property Alias_NPC_Captive Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
Potion Property DrinkPouch_CrystalWater_Md Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_Opening Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_BountySplit Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage30_ENDPeaceful Auto Const mandatory
GlobalVariable Property OE_Credit_BribeMedium Auto Const mandatory
GlobalVariable Property OE_Credit_BribeHigh Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
LeveledItem Property LL_Quest_Reward_GrabBag_Small Auto Const mandatory
Scene Property OE_KT_Execution_Scene_Stage25_Opening Auto Const mandatory
ReferenceAlias Property Alias_XMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_Marker_Captive Auto Const mandatory
Scene Property OE_KT_ExecutionSceneMover Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  OE_KT_Execution_Scene_Stage30_Opening.Start() ; #DEBUG_LINE_NO:7
  Actor AttackRef = Alias_NPC_Attacker01.GetActorRef() ; #DEBUG_LINE_NO:9
  Actor ThreatRef = Alias_NPC_Attacker02.GetActorRef() ; #DEBUG_LINE_NO:10
  Alias_NPC_Group01.AddRef(AttackRef as ObjectReference) ; #DEBUG_LINE_NO:12
  Alias_NPC_Group01.AddRef(ThreatRef as ObjectReference) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_01()
  OE_KT_Execution_Scene_Stage25_Opening.Start() ; #DEBUG_LINE_NO:21
  Actor AttackRef = Alias_NPC_Attacker04.GetActorRef() ; #DEBUG_LINE_NO:23
  Actor ThreatRef = Alias_NPC_Attacker03.GetActorRef() ; #DEBUG_LINE_NO:24
  Alias_NPC_Group01.AddRef(AttackRef as ObjectReference) ; #DEBUG_LINE_NO:26
  Alias_NPC_Group01.AddRef(ThreatRef as ObjectReference) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeHigh.GetValueInt(), False, None) ; #DEBUG_LINE_NO:35
  Self.SetStage(200) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:44
  Self.SetStage(200) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0003_Item_01()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:53
  Self.SetStage(200) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor ThreatRef = Alias_NPC_Attacker01.GetActorRef() ; #DEBUG_LINE_NO:62
  Actor AttackerRef = Alias_NPC_Attacker02.GetActorRef() ; #DEBUG_LINE_NO:63
  ThreatRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:65
  ThreatRef.StartCombat(AttackerRef as ObjectReference, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_BribeMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0012_Item_00()
  OE_KT_Execution_Scene_Stage30_Opening.Stop() ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_NPC_Attacker04.GetRef().MoveTo(Alias_XMarkerHeading.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor CaptiveRef = Alias_NPC_Captive.GetActorRef() ; #DEBUG_LINE_NO:114
  CaptiveRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:116
  CaptiveRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:117
  CaptiveRef.SetRestrained(True) ; #DEBUG_LINE_NO:118
  CaptiveRef.SetValue(Health, 1.0) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_NPC_Captive.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0040_Item_01()
  Alias_NPC_Attacker02.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:143
  OE_KT_Execution_Scene_Stage30_BountySplit.Stop() ; #DEBUG_LINE_NO:144
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:145
  OE_KT_Execution_Scene_Stage30_ENDPeaceful.Start() ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0044_Item_00()
  Actor Attacker = Alias_NPC_Attacker04.GetActorRef() ; #DEBUG_LINE_NO:154
  Attacker.EvaluatePackage(False) ; #DEBUG_LINE_NO:155
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:156
  Alias_NPC_Captive.GetActorRef().StartCombat(Attacker as ObjectReference, False) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_NPC_Attacker04.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0046_Item_00()
  Alias_NPC_Captive.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:181
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:182
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int random = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:191
  If random > 70 ; #DEBUG_LINE_NO:193
    Self.SetStage(30) ; #DEBUG_LINE_NO:194
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(25) ; #DEBUG_LINE_NO:196
  EndIf ; #DEBUG_LINE_NO:
  OE_KT_ExecutionSceneMover.Start() ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_NPC_Group01.EvaluateAll() ; #DEBUG_LINE_NO:207
  Actor CaptiveRef = Alias_NPC_Captive.GetActorRef() ; #DEBUG_LINE_NO:209
  CaptiveRef.SetRestrained(False) ; #DEBUG_LINE_NO:210
  CaptiveRef.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_GrabBag_Small as Form, 1, False) ; #DEBUG_LINE_NO:219
  Alias_NPC_Captive.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:228
EndFunction
