ScriptName Fragments:Quests:QF_FFConstantR02_00211125 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Slate Auto Const mandatory
GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Alias_Slate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0110_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0998_Item_00()
  FFConstantR02_NumTimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:40
  Self.SetStage(999) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:49
  Self.Stop() ; #DEBUG_LINE_NO:50
EndFunction
