ScriptName Fragments:Quests:QF_LC053_01000828 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_PirateWave1 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipA01 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipA02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_FirstShipA01.TryToEnable() ; #DEBUG_LINE_NO:7
  Alias_FirstShipA02.TryToEnable() ; #DEBUG_LINE_NO:8
EndFunction
