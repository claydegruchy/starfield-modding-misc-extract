ScriptName Fragments:Quests:QF_SE_FAB11_00062B48 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_SecurityShip Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_HailingShip.GetShipRef().AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:27
  Alias_SecurityShip.GetShipRef().AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:28
  Alias_SecurityShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:30
  Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:31
EndFunction
