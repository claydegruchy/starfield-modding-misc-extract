ScriptName Fragments:Quests:QF_LC053_0026BA5A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_FirstShipA01 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipA02 Auto Const mandatory
ReferenceAlias Property Alias_ShipSpawnMarker03 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipA03 Auto Const mandatory
ReferenceAlias Property Alias_RangerWingman01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference WingmanRef = Alias_RangerWingman01.GetShipReference() ; #DEBUG_LINE_NO:7
  WingmanRef.EnableWithGravJump() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_FirstShipA01.TryToEnable() ; #DEBUG_LINE_NO:16
  Alias_FirstShipA02.TryToEnable() ; #DEBUG_LINE_NO:17
  Alias_FirstShipA03.TryToEnable() ; #DEBUG_LINE_NO:18
EndFunction
