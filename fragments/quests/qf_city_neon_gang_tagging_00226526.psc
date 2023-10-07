ScriptName Fragments:Quests:QF_City_Neon_Gang_Tagging_00226526 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_GangSign01 Auto Const mandatory
ReferenceAlias Property Alias_GangSign02 Auto Const mandatory
ReferenceAlias Property Alias_GangSign03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_GangSign01.GetRef().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_GangSign02.GetRef().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_GangSign03.GetRef().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_8900_Item_00()
  Alias_GangSign01.GetRef().GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:31
  Alias_GangSign02.GetRef().GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:32
  Alias_GangSign03.GetRef().GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:33
EndFunction
