ScriptName Fragments:Quests:QF_RL007_MiscQuest_0037586B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property OE_RL007_DeadMerc Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  OE_RL007_DeadMerc.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_01()
  Self.SetStage(20) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_02()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:23
  Alias_MapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:32
  Self.Stop() ; #DEBUG_LINE_NO:33
EndFunction
