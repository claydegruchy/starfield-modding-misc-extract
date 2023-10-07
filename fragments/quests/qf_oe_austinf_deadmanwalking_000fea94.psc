ScriptName Fragments:Quests:QF_OE_AustinF_DeadManWalking_000FEA94 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Colonist Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory
Scene Property Scene_Healed Auto Const mandatory
Potion Property MedPack Auto Const mandatory
RefCollectionAlias Property Alias_predators Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
env_afflictionscript Property ENV_AFFL_Infection_LungInfection Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference predator = None ; #DEBUG_LINE_NO:15
  ObjectReference marker = Alias_CenterMarker.GetRef() ; #DEBUG_LINE_NO:16
  Int count = Alias_predators.GetCount() ; #DEBUG_LINE_NO:17
  Int index = 0 ; #DEBUG_LINE_NO:18
  While index < count ; #DEBUG_LINE_NO:20
    predator = Alias_predators.GetAt(index) ; #DEBUG_LINE_NO:21
    predator.Disable(False) ; #DEBUG_LINE_NO:22
    predator.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
    index += 1 ; #DEBUG_LINE_NO:24
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Game.GetPlayer().GetItemCount(MedPack as Form) >= 1 ; #DEBUG_LINE_NO:49
    Game.GetPlayer().RemoveItem(MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:50
    Self.SetStage(275) ; #DEBUG_LINE_NO:51
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(300) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  ENV_AFFL_Infection_LungInfection.Gain(False, False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0275_Item_00()
  Scene_Healed.Start() ; #DEBUG_LINE_NO:65
  ENV_AFFL_Infection_LungInfection.Cure() ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0300_Item_00()
  ENV_AFFL_Infection_LungInfection.Gain(False, False) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !Self.GetStageDone(275) ; #DEBUG_LINE_NO:82
    Self.SetStage(300) ; #DEBUG_LINE_NO:83
    Self.SetStage(700) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  ObjectReference predator = None ; #DEBUG_LINE_NO:93
  ObjectReference marker = Alias_CenterMarker.GetRef() ; #DEBUG_LINE_NO:94
  Int count = Alias_predators.GetCount() ; #DEBUG_LINE_NO:95
  Int index = 0 ; #DEBUG_LINE_NO:96
  While index < count ; #DEBUG_LINE_NO:98
    predator = Alias_predators.GetAt(index) ; #DEBUG_LINE_NO:99
    predator.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:100
    predator.Enable(False) ; #DEBUG_LINE_NO:101
    index += 1 ; #DEBUG_LINE_NO:102
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:119
EndFunction
