ScriptName Fragments:Quests:QF_OE_KT_FriendlyLanding_Ven_00083246 Extends Quest Const hidden

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
ReferenceAlias Property Alias_NPC_Merc Auto Const mandatory
ReferenceAlias Property Alias_NPC_Robot Auto Const mandatory
ReferenceAlias Property Alias_NPC_Pet Auto Const mandatory
ReferenceAlias Property Alias_NPC_PetOwner Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Marker_TravelB03 Auto Const mandatory
GlobalVariable Property OE_KT_FriendlyVendorsGlobal Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property OE_KT_ParkerGrumbleDeathStatus Auto Const mandatory
GlobalVariable Property OE_KT_ParkerMetOnceGlobal Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Faction Property OE_KT_FriendlyVendorsFaction Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  ObjectReference RobotRef = Alias_NPC_Robot.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference TraderRef = Alias_NPC_Trader.GetRef() ; #DEBUG_LINE_NO:8
  RobotRef.EnableNoWait(False) ; #DEBUG_LINE_NO:10
  Alias_NPC_Group01.AddRef(TraderRef) ; #DEBUG_LINE_NO:11
  Alias_NPC_Group01.AddRef(RobotRef) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor MercRef = Alias_NPC_Merc.GetActorRef() ; #DEBUG_LINE_NO:20
  ObjectReference TraderRef = Alias_NPC_Trader.GetRef() ; #DEBUG_LINE_NO:21
  MercRef.EquipItem(LL_Weapon_Ranged_Any as Form, False, False) ; #DEBUG_LINE_NO:23
  Alias_NPC_Group01.AddRef(MercRef as ObjectReference) ; #DEBUG_LINE_NO:24
  Alias_NPC_Group01.AddRef(TraderRef) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0034_Item_00()
  OE_KT_FriendlyVendorsGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0035_Item_00()
  ObjectReference OwnerRef = Alias_NPC_PetOwner.GetRef() ; #DEBUG_LINE_NO:41
  ObjectReference PetRef = Alias_NPC_Pet.GetRef() ; #DEBUG_LINE_NO:42
  PetRef.EnableNoWait(False) ; #DEBUG_LINE_NO:44
  OwnerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:45
  Alias_NPC_Group01.AddRef(PetRef) ; #DEBUG_LINE_NO:46
  Alias_NPC_Group01.AddRef(OwnerRef) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0040_Item_00()
  OE_KT_ParkerMetOnceGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:63
  Alias_NPC_Group01.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:64
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:65
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0066_Item_00()
  OE_KT_ParkerGrumbleDeathStatus.SetValue(1.0) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0090_Item_00()
  Int random = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:82
  If random > 50 ; #DEBUG_LINE_NO:84
    Self.SetStage(25) ; #DEBUG_LINE_NO:85
  ElseIf random > 0 ; #DEBUG_LINE_NO:86
    Self.SetStage(30) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0090_Item_01()
  Self.SetStage(35) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0090_Item_02()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:104
  Alias_ShipA.GetShipRef().SetFactionOwner(OE_KT_FriendlyVendorsFaction, False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:114
EndFunction
