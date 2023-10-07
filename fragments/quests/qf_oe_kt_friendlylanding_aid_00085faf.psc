ScriptName Fragments:Quests:QF_OE_KT_FriendlyLanding_Aid_00085FAF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
Potion Property DrinkPack_Water_Md Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property OE_Credit_ExtortionMedium Auto Const mandatory
FormList Property OnlyWaterList Auto Const mandatory
ReferenceAlias Property Alias_NPC_Trader Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
Potion Property DrinkPouch_CrystalWater_Md Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ReferenceAlias Property Alias_NPC_Patrol Auto Const mandatory
ReferenceAlias Property Alias_NPC_Search Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_soundMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().RemoveItem(InorgCommonHelium3 as Form, 1, False, None) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0008_Item_00()
  Game.GetPlayer().RemoveItem(DrinkPouch_CrystalWater_Md as Form, 1, False, None) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0008_Item_01()
  Game.GetPlayer().RemoveItem(DrinkPack_Water_Md as Form, 1, False, None) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, OE_Credit_ExtortionMedium.GetValueInt(), False) ; #DEBUG_LINE_NO:31
  If Self.GetStageDone(1) ; #DEBUG_LINE_NO:32
    Self.SetStage(2) ; #DEBUG_LINE_NO:33
  ElseIf Self.GetStageDone(3) ; #DEBUG_LINE_NO:34
    Self.SetStage(8) ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(12) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0012_Item_00()
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02") ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group01.AddRef(Alias_NPC_Trader.GetRef()) ; #DEBUG_LINE_NO:62
  Alias_NPC_Group01.AddRef(Alias_NPC_Patrol.GetRef()) ; #DEBUG_LINE_NO:63
  Alias_NPC_Group01.AddRef(Alias_NPC_Search.GetRef()) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:72
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:73
  Alias_soundMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:74
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:75
  Self.SetStage(30) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:84
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:85
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:94
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:95
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:106
EndFunction
