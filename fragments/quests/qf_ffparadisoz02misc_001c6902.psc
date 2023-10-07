ScriptName Fragments:Quests:QF_FFParadisoZ02Misc_001C6902 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFparadisoZ02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
  FFparadisoZ02.Start() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:33
  Self.Stop() ; #DEBUG_LINE_NO:34
EndFunction
