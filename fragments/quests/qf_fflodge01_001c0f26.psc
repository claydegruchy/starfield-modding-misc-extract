ScriptName Fragments:Quests:QF_FFLodge01_001C0F26 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerDoorRef Auto Const mandatory
Scene Property FFLodge01_Stage20_Noel_TourScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:16
  FFLodge01_Stage20_Noel_TourScene.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_PlayerDoorRef.GetReference().Unlock(False) ; #DEBUG_LINE_NO:33
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:35
  Self.Stop() ; #DEBUG_LINE_NO:36
EndFunction
