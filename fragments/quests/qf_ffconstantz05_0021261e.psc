ScriptName Fragments:Quests:QF_FFConstantZ05_0021261E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFConstantZ05_Food Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_Janet Auto Const mandatory
ReferenceAlias Property Alias_Diana Auto Const mandatory
Quest Property FFConstantZ05Misc Auto Const mandatory
ActorValue Property FFConstantZ05_ForeknowledgeAV Auto Const mandatory
Potion Property Food_Produce_Potato Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Diana.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().AddItem(Food_Produce_Potato as Form, FFConstantZ05_Food.GetValue() as Int, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Janet.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0200_Item_00()
  If FFConstantZ05Misc.IsRunning() ; #DEBUG_LINE_NO:40
    FFConstantZ05Misc.SetStage(1000) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().RemoveItem(Food_Produce_Potato as Form, FFConstantZ05_Food.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:63
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
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:90
  Game.GetPlayer().SetValue(FFConstantZ05_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:92
  Self.Stop() ; #DEBUG_LINE_NO:94
EndFunction
