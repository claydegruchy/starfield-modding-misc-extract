ScriptName Fragments:Quests:QF_UC_NA_CL_AEGISScene_001D0F0D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
Scene Property UC_NA_CL_AEGISScene_PlayerDetected Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Pilot.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Alias_Citizen.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:24
    UC_NA_CL_TolimanScene_Scene.Stop() ; #DEBUG_LINE_NO:25
    UC_NA_CL_AEGISScene_PlayerDetected.Start() ; #DEBUG_LINE_NO:26
    Self.SetStage(160) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False) ; #DEBUG_LINE_NO:36
  Alias_Citizen.GetRef().Disable(False) ; #DEBUG_LINE_NO:37
  Alias_Trigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:38
  Self.SetStage(1000) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:47
EndFunction
