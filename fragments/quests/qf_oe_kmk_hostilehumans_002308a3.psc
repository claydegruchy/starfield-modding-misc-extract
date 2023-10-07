ScriptName Fragments:Quests:QF_OE_KMK_HostileHumans_002308A3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
RefCollectionAlias Property Alias_NPCs_Sandboxers Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
RefCollectionAlias Property Alias_NPCs_ShipC Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
GlobalVariable Property OE_HostileShipTakeoffChance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:11
  If Alias_NPCs_Sandboxers.GetCount() == 0 ; #DEBUG_LINE_NO:14
    Self.SetStage(200) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.GetDieRollSuccess(OE_HostileShipTakeoffChance.GetValueInt(), 1, 100, -1, -1) ; #DEBUG_LINE_NO:49
    Self.SetStage(500) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:59
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:60
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:63
  Utility.wait(Utility.RandomFloat(1.0, 3.0)) ; #DEBUG_LINE_NO:64
  kmyQuest.LaunchShip(1, None, False) ; #DEBUG_LINE_NO:65
  Utility.wait(Utility.RandomFloat(1.0, 3.0)) ; #DEBUG_LINE_NO:66
  kmyQuest.LaunchShip(2, None, False) ; #DEBUG_LINE_NO:67
  If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword) ; #DEBUG_LINE_NO:68
    Alias_MapMarker.TryToDisable() ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndFunction
