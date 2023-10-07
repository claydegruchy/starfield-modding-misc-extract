ScriptName Fragments:Quests:QF_FFNeonZ05_00089076 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Abbie Auto Const mandatory
ReferenceAlias Property Alias_Supplies Auto Const mandatory
Quest Property FFNeonDialogue Auto Const
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
MiscObject Property Supplies Auto Const
ReferenceAlias Property Alias_Supplies01 Auto Const mandatory
GlobalVariable Property Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property FFNeonGuardPointer_Z05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  FFNeonGuardPointer_Z05.SetStage(200) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:19
  Alias_Supplies.GetRef().Enable(False) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:34
  Alias_Supplies.GetRef().Enable(False) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:49
  Alias_PlayerShip.GetRef().AddItem(Alias_Supplies01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:50
  Alias_Supplies.GetRef().Enable(False) ; #DEBUG_LINE_NO:51
  Alias_Supplies01.GetRef().Enable(False) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:55
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:65
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:66
  FFNeonDialogue.SetStage(280) ; #DEBUG_LINE_NO:69
  Timer.SetValue(DaysPassed.GetValue() + 2.0) ; #DEBUG_LINE_NO:72
  Self.Stop() ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:84
  Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:85
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:86
  FFNeonDialogue.SetStage(280) ; #DEBUG_LINE_NO:89
  Timer.SetValue(DaysPassed.GetValue() + 2.0) ; #DEBUG_LINE_NO:92
  Self.Stop() ; #DEBUG_LINE_NO:95
EndFunction
