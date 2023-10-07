ScriptName Fragments:Quests:QF_LC054_00263008 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NorthWaveEM Auto Const mandatory
ReferenceAlias Property Alias_SouthWaveEM Auto Const mandatory
ReferenceAlias Property Alias_WestWaveEM Auto Const mandatory
ReferenceAlias Property Alias_EastWaveEM Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_NorthWaveEM.TryToEnable() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_SouthWaveEM.TryToEnable() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_WestWaveEM.TryToEnable() ; #DEBUG_LINE_NO:23
  Alias_EastWaveEM.TryToEnable() ; #DEBUG_LINE_NO:24
EndFunction
