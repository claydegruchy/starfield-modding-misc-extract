ScriptName Fragments:Quests:QF_FFNeonZ06_00082D5A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
GlobalVariable Property FFNeonZ06_TevinPayment Auto Const
ReferenceAlias Property Alias_Rusty Auto Const mandatory
Quest Property DialogueQuest Auto Const
GlobalVariable Property Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property FFNeonGuardPointer_Z06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(0, True, False) ; #DEBUG_LINE_NO:7
  FFNeonGuardPointer_Z06.SetStage(200) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ06_TevinPayment.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetObjectiveDisplayed(13, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(13) ; #DEBUG_LINE_NO:34
    Self.SetObjectiveCompleted(13, True) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(9) ; #DEBUG_LINE_NO:38
    Self.SetObjectiveDisplayed(13, False, False) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(0, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:49
  Alias_Rusty.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_Rusty.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(70) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(70) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 200, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:91
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Rusty.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:100
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:101
  DialogueQuest.SetStage(300) ; #DEBUG_LINE_NO:102
  Timer.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:105
  Self.Stop() ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Rusty.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:115
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:116
  DialogueQuest.SetStage(300) ; #DEBUG_LINE_NO:117
  Timer.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:120
  Self.Stop() ; #DEBUG_LINE_NO:122
EndFunction
