ScriptName Fragments:Quests:QF_FFRedMileR01Misc_002DFEDC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !FC05.IsRunning() ; #DEBUG_LINE_NO:7
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:26
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:35
  Self.Stop() ; #DEBUG_LINE_NO:36
EndFunction
