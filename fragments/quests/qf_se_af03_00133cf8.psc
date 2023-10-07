ScriptName Fragments:Quests:QF_SE_AF03_00133CF8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property EclipticFaction Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property CitizenShipFactionUC Auto Const mandatory
Faction Property CitizenShipFactionFreestar Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 3.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference currShip = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:24
  currShip.addtofaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:26
  currShip.addtofaction(EclipticFaction) ; #DEBUG_LINE_NO:27
  currShip.SetCrimeFaction(None) ; #DEBUG_LINE_NO:28
  currShip.removefromfaction(CitizenShipFactionUC) ; #DEBUG_LINE_NO:29
  currShip.removefromfaction(CitizenShipFactionFreestar) ; #DEBUG_LINE_NO:30
  currShip.StartCombat(Alias_PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:41
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:42
EndFunction
