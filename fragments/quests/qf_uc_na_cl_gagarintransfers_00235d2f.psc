ScriptName Fragments:Quests:QF_UC_NA_CL_GagarinTransferS_00235D2F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Pilot.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Alias_Citizen.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False) ; #DEBUG_LINE_NO:24
  Alias_Citizen.GetRef().Disable(False) ; #DEBUG_LINE_NO:25
  Alias_Trigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:26
  Self.SetStage(1000) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:35
EndFunction
