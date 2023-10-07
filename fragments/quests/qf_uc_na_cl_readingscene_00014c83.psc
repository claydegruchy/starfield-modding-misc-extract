ScriptName Fragments:Quests:QF_UC_NA_CL_ReadingScene_00014C83 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Functionary02 Auto Const mandatory
ReferenceAlias Property Alias_RecruitM02 Auto Const mandatory
ReferenceAlias Property Alias_AudienceM02Freestar Auto Const mandatory
ReferenceAlias Property Alias_Audience05 Auto Const mandatory
RefCollectionAlias Property Alias_Benches Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Pilot.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Alias_Citizen.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
  Alias_Functionary02.GetRef().Enable(False) ; #DEBUG_LINE_NO:9
  Alias_RecruitM02.GetRef().Enable(False) ; #DEBUG_LINE_NO:10
  Alias_AudienceM02Freestar.GetRef().Enable(False) ; #DEBUG_LINE_NO:11
  Alias_Audience05.GetRef().Enable(False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False) ; #DEBUG_LINE_NO:28
  Alias_Citizen.GetRef().Disable(False) ; #DEBUG_LINE_NO:29
  Alias_Functionary02.GetRef().Disable(False) ; #DEBUG_LINE_NO:30
  Alias_RecruitM02.GetRef().Disable(False) ; #DEBUG_LINE_NO:31
  Alias_AudienceM02Freestar.GetRef().Disable(False) ; #DEBUG_LINE_NO:32
  Alias_Audience05.GetRef().Disable(False) ; #DEBUG_LINE_NO:33
  Alias_Trigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:34
  Self.SetStage(1000) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Benches.EnableAll(False) ; #DEBUG_LINE_NO:44
  Self.Stop() ; #DEBUG_LINE_NO:46
EndFunction
