ScriptName Fragments:Quests:QF_FFParadisoZ03_001C433F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFParadisoZ03Misc Auto Const mandatory
ReferenceAlias Property Alias_Recipe Auto Const mandatory
ReferenceAlias Property Alias_Rowan Auto Const mandatory
ActorValue Property FFParadisoZ03_Foreknowledge_AV Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFParadisoZ03_BribePrice Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFParadisoZ03Misc.SetStage(1000) ; #DEBUG_LINE_NO:7
  If !DialogueParadiso.GetStageDone(1320) ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  Alias_Rowan.GetRef().Enable(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0140_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:19
  Int iBribeAmount = FFParadisoZ03_BribePrice.GetValue() as Int ; #DEBUG_LINE_NO:20
  If myPlayer.GetItemCount(Credits as Form) >= iBribeAmount ; #DEBUG_LINE_NO:21
    myPlayer.RemoveItem(Credits as Form, iBribeAmount, False, None) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:31
  ObjectReference myRecipe = Alias_Recipe.GetRef() ; #DEBUG_LINE_NO:32
  If myPlayer.GetItemCount(myRecipe as Form) < 1 ; #DEBUG_LINE_NO:33
    myPlayer.AddItem(myRecipe as Form, 1, False) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:52
  If myPlayer.GetValue(FFParadisoZ03_Foreknowledge_AV) < 4.0 ; #DEBUG_LINE_NO:56
    myPlayer.ModValue(FFParadisoZ03_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference myRecipe = Alias_Recipe.GetRef() ; #DEBUG_LINE_NO:60
  If myPlayer.GetItemCount(myRecipe as Form) > 0 ; #DEBUG_LINE_NO:61
    myPlayer.RemoveItem(myRecipe as Form, 1, False, None) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  Alias_Rowan.GetRef().Disable(False) ; #DEBUG_LINE_NO:65
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:66
  Self.Stop() ; #DEBUG_LINE_NO:67
EndFunction
