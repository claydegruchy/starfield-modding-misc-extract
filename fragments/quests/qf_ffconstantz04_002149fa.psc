ScriptName Fragments:Quests:QF_FFConstantZ04_002149FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFConstantZ04_Debt Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_Oliver Auto Const mandatory
Quest Property FFConstantZ04Misc Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
ActorValue Property FFConstantZ04_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Oliver.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().Additem(Credits as Form, FFConstantZ04_Debt.GetValue() as Int, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFConstantZ04Misc.IsRunning() ; #DEBUG_LINE_NO:40
    FFConstantZ04Misc.SetStage(1000) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFConstantZ04_Debt.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:63
  Self.SetStage(300) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:73
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(250) ; #DEBUG_LINE_NO:76
    Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_1000_Item_00()
  DialogueECSConstant.SetStage(1450) ; #DEBUG_LINE_NO:88
  Game.GetPlayer().SetValue(FFConstantZ04_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:90
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:92
  Self.Stop() ; #DEBUG_LINE_NO:94
EndFunction
