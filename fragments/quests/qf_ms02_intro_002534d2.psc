ScriptName Fragments:Quests:QF_MS02_Intro_002534D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:15
  MS02.Start() ; #DEBUG_LINE_NO:18
  Self.Stop() ; #DEBUG_LINE_NO:20
EndFunction
