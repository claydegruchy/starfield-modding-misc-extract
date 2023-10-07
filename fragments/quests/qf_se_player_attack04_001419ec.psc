ScriptName Fragments:Quests:QF_SE_Player_Attack04_001419EC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property Attack01_100a_DefenderHailStart Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
RefCollectionAlias Property Alias_DefendersRC Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
LeveledItem Property LL_Loot_ShipRepairKit Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_AttackersRC.RefillAlias() ; #DEBUG_LINE_NO:7
  Alias_DefendersRC.RefillAlias() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.RefillAlias() ; #DEBUG_LINE_NO:16
  Attack01_100a_DefenderHailStart.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_DefendersRC.RemoveFromAllFactions() ; #DEBUG_LINE_NO:25
  Alias_DefendersRC.AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_PlayerShip.GetShipRef().AddItem(LL_Loot_ShipRepairKit as Form, 1, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0180_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:50
EndFunction
