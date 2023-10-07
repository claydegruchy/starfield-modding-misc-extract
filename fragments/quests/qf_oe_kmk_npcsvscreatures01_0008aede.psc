ScriptName Fragments:Quests:QF_OE_KMK_NPCsVsCreatures01_0008AEDE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:11
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:12
EndFunction
