ScriptName Fragments:Quests:QF_FFNeonZ05_010036C5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Abbie Auto Const mandatory
ReferenceAlias Property Alias_Supplies Auto Const mandatory
Quest Property FFNeonDialogue Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:30
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:44
  Game.GetPlayer().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:58
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:59
  FFNeonDialogue.SetStage(280) ; #DEBUG_LINE_NO:62
  Self.Stop() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_2000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:74
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:75
  FFNeonDialogue.SetStage(280) ; #DEBUG_LINE_NO:78
  Self.Stop() ; #DEBUG_LINE_NO:81
EndFunction
