ScriptName Fragments:Quests:QF_UC_CY_HeatleechScene_00158F2C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_CY_HeatleechScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Tech01 Auto Const mandatory
ReferenceAlias Property Alias_Tech02 Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  UC_CY_HeatleechScene_Scene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Pilot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Tech01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC_CY_HeatleechScene_Scene.Stop() ; #DEBUG_LINE_NO:31
  Alias_Pilot.GetRef().Disable(False) ; #DEBUG_LINE_NO:33
  Alias_Tech01.GetRef().Disable(False) ; #DEBUG_LINE_NO:34
  Alias_Tech02.GetRef().Disable(False) ; #DEBUG_LINE_NO:35
  Alias_EnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:36
  Self.Stop() ; #DEBUG_LINE_NO:38
EndFunction
