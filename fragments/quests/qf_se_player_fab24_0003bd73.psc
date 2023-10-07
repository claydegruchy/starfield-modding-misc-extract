ScriptName Fragments:Quests:QF_SE_Player_FAB24_0003BD73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_EscortShip Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property EncShip_Hopetech_A_Watchdog01_Template Auto Const
LeveledItem Property LL_Food_Unpackaged Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(LL_Food_Unpackaged as Form, 1, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:26
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:27
  oTarg = Alias_EscortShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:29
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_HailingShip.GetShipRef().AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:38
  Alias_EscortShip.GetShipRef().AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:39
  Alias_EscortShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:41
  Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:42
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:44
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:45
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:46
EndFunction
