ScriptName Fragments:Quests:QF_Staryard_Deimos_Z_TasteOf_0010E782 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property StoryManager_DeimosLoad Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_DeimosLoad.Mod(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:23
  Self.Stop() ; #DEBUG_LINE_NO:24
EndFunction
