ScriptName Fragments:Quests:QF_OE_KT_LandedShip_0005AC1F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
Scene Property OE_KT_LandedShip_SceneFlavor Auto Const mandatory
ReferenceAlias Property Alias_ShipLandingMarker Auto Const mandatory
ReferenceAlias Property Alias_ShipCockpit Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
ReferenceAlias Property Alias_Container01 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Container.RefillAlias() ; #DEBUG_LINE_NO:7
  Alias_Container01.RefillAlias() ; #DEBUG_LINE_NO:8
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef() ; #DEBUG_LINE_NO:10
  mySeat.BlockActivation(True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group00.EvaluateAll() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0025_Item_00()
  OE_KT_LandedShip_SceneFlavor.Start() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef() ; #DEBUG_LINE_NO:35
  mySeat.BlockActivation(False, False) ; #DEBUG_LINE_NO:37
  Alias_ShipA_PilotSeat.Clear() ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ShipCockpit.Clear() ; #DEBUG_LINE_NO:46
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:47
  Alias_NPC_Group00.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:56
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:66
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:78
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:79
EndFunction
