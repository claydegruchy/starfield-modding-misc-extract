ScriptName Fragments:Quests:QF_FFCydoniaZ06_00037E62 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Chris Auto Const mandatory
ReferenceAlias Property Alias_Logan Auto Const mandatory
ReferenceAlias Property Alias_Present Auto Const mandatory
ReferenceAlias Property Alias_Letter Auto Const mandatory
GlobalVariable Property FFCydoniaZ06_TLTimerLogan Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property StoryManager_CydoniaLoad Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  StoryManager_CydoniaLoad.Mod(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(Alias_Letter.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().AddItem(Alias_Present.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Letter.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().RemoveItem(Alias_Present.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:35
  FFCydoniaZ06_TLTimerLogan.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:38
  Self.Stop() ; #DEBUG_LINE_NO:40
EndFunction
