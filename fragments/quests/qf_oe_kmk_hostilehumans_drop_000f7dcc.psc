ScriptName Fragments:Quests:QF_OE_KMK_HostileHumans_Drop_000F7DCC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.setstage(500) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.setstage(500) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:43
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:44
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:47
  Utility.wait(Utility.RandomFloat(1.0, 3.0)) ; #DEBUG_LINE_NO:48
  kmyQuest.LaunchShip(1, None, False) ; #DEBUG_LINE_NO:49
  Utility.wait(Utility.RandomFloat(1.0, 3.0)) ; #DEBUG_LINE_NO:50
  kmyQuest.LaunchShip(2, None, False) ; #DEBUG_LINE_NO:51
  If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword) ; #DEBUG_LINE_NO:52
    Alias_MapMarker.TryToDisable() ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndFunction
