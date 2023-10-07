ScriptName Fragments:Quests:QF_OE_KT_KeepInMine_00046F6E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_KeepInMine_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Foreperson Auto Const mandatory
FormList Property OE_KT_FoodGiftList Auto Const mandatory
LeveledItem Property LL_Loot_Resource_Both_Common Auto Const mandatory
Scene Property OE_KT_KeepInMine_030_Thanks Auto Const mandatory
Scene Property OE_KT_KeepInMine_020_TL00b Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  OE_KT_KeepInMine_Scene01.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference Miner = Alias_NPC_Foreperson.GetRef() ; #DEBUG_LINE_NO:15
  Int FoodAmount = Miner.GetItemCount(OE_KT_FoodGiftList as Form) ; #DEBUG_LINE_NO:17
  Miner.RemoveItem(OE_KT_FoodGiftList as Form, FoodAmount, False, None) ; #DEBUG_LINE_NO:18
  Alias_NPC_Foreperson.GetRef().OpenOneWayTransferMenu(True, OE_KT_FoodGiftList) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0040_Item_00()
  OE_KT_KeepInMine_020_TL00b.Stop() ; #DEBUG_LINE_NO:28
  OE_KT_KeepInMine_030_Thanks.Start() ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0050_Item_00()
  Int OreAmount = 0 ; #DEBUG_LINE_NO:37
  Int FoodAmount = Alias_NPC_Foreperson.GetRef().GetItemCount(OE_KT_FoodGiftList as Form) ; #DEBUG_LINE_NO:38
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:39
  If FoodAmount >= 20 ; #DEBUG_LINE_NO:41
    OreAmount = FoodAmount / 4 ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  If FoodAmount >= 20 ; #DEBUG_LINE_NO:45
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, OreAmount, False) ; #DEBUG_LINE_NO:46
  ElseIf FoodAmount >= 10 ; #DEBUG_LINE_NO:47
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 3, False) ; #DEBUG_LINE_NO:48
  ElseIf FoodAmount >= 5 ; #DEBUG_LINE_NO:49
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 2, False) ; #DEBUG_LINE_NO:50
  Else ; #DEBUG_LINE_NO:
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common as Form, 1, False) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:61
  Alias_NPC_Group00.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:62
  Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:71
EndFunction
