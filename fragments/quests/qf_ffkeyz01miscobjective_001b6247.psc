ScriptName Fragments:Quests:QF_FFKeyZ01MiscObjective_001B6247 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TheKeyStartMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC082.SetStage(12) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(Alias_TheKeyStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:16
  Self.Stop() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  FFKeyZ01.SetStage(200) ; #DEBUG_LINE_NO:33
  Self.SetStage(10000) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:42
  Self.Stop() ; #DEBUG_LINE_NO:43
EndFunction
