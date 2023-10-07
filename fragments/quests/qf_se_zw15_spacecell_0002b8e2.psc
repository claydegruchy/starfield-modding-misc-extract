ScriptName Fragments:Quests:QF_SE_ZW15_SpaceCell_0002B8E2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_LegendaryShip Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_GuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_GuardShip03 Auto Const mandatory
Scene Property SE_ZW15_01_HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  SE_ZW15_01_HailingScene.Start() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_LegendaryShip.GetShipRef().RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:23
  Alias_GuardShip01.GetShipRef().RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:24
  Alias_GuardShip02.GetShipRef().RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:25
  Alias_GuardShip03.GetShipRef().RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:26
EndFunction
