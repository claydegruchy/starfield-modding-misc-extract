ScriptName Fragments:Quests:QF_OE_AustinF_EggThief_00006E52_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PredatorA Auto Const mandatory
ReferenceAlias Property Alias_PredatorB Auto Const mandatory
ReferenceAlias Property Alias_PredatorC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_PredatorA.GetRef().Enable(False) ; #DEBUG_LINE_NO:15
  Alias_PredatorB.GetRef().Enable(False) ; #DEBUG_LINE_NO:16
  Alias_PredatorC.GetRef().Enable(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:25
EndFunction
