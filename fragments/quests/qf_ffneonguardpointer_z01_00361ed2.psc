ScriptName Fragments:Quests:QF_FFNeonGuardPointer_Z01_00361ED2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property StoryManager_NeonLoad Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_NeonLoad.Mod(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:23
EndFunction
