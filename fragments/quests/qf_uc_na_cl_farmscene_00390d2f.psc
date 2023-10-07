ScriptName Fragments:Quests:QF_UC_NA_CL_FarmScene_00390D2F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC_NA_CL_TolimanScene_Scene Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_Citizen Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Functionary02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Actor RobotREF = Alias_Functionary02.GetActorRef() ; #DEBUG_LINE_NO:7
  RobotREF.SetUnconscious(True) ; #DEBUG_LINE_NO:8
  RobotREF.SetRestrained(True) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC_NA_CL_TolimanScene_Scene.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_Pilot.GetRef().Disable(False) ; #DEBUG_LINE_NO:25
  Alias_Citizen.GetRef().Disable(False) ; #DEBUG_LINE_NO:26
  Alias_Functionary02.GetRef().Disable(False) ; #DEBUG_LINE_NO:27
  Alias_Trigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:28
  Self.SetStage(1000) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:37
EndFunction
