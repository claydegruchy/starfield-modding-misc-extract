ScriptName Fragments:Quests:QF_UCR05_001E7A09 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueUCFaction Auto Const mandatory
GlobalVariable Property UCR05_TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_EdgeMarker Auto Const mandatory
Scene Property UCR05_100_VV_StartUp Auto Const mandatory
ReferenceAlias Property Alias_TransferSystemTrigger Auto Const mandatory
Book Property UCR05_TargetSlate Auto Const mandatory
Cell Property CityNewAtlantisMASTB3SubsectionSeven Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(75) && Game.GetPlayer().GetParentCell() != CityNewAtlantisMASTB3SubsectionSeven ; #DEBUG_LINE_NO:15
    Self.SetStage(9000) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0075_Item_00()
  If !DialogueUCFaction.GetStageDone(1020) ; #DEBUG_LINE_NO:25
    DialogueUCFaction.SetStage(1020) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  Alias_TransferSystemTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:40
  If DialogueUCFaction.GetStageDone(4) ; #DEBUG_LINE_NO:42
    Self.SetActive(True) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(UCR05_TargetSlate as Form, 1, False) ; #DEBUG_LINE_NO:46
  UCR05_100_VV_StartUp.Start() ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR05_TimesCompleted.SetValue(UCR05_TimesCompleted.GetValue() + 1.0) ; #DEBUG_LINE_NO:56
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:57
  Self.Stop() ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:67
  If Self.GetStageDone(75) ; #DEBUG_LINE_NO:69
    Self.SetObjectiveSkipped(75) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:73
EndFunction
