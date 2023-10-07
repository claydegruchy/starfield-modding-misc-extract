ScriptName Fragments:Quests:QF_OE_MP_AcelesPatrol_00118925 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_BiomePredators Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:23
EndFunction
