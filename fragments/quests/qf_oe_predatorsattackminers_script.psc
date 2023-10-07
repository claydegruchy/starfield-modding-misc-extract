ScriptName Fragments:Quests:QF_OE_PredatorsAttackMiners_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_PredatorGroup Auto Const mandatory
ReferenceAlias Property Alias_Miner Auto Const mandatory
ReferenceAlias Property Alias_WoundedMiner Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Miner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:7
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Miner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:25
  Alias_Miner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:26
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_PredatorGroup.EnableAll(False) ; #DEBUG_LINE_NO:43
  Alias_PredatorGroup.EvaluateAll() ; #DEBUG_LINE_NO:44
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:46
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:56
  Alias_Miner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:58
  Alias_WoundedMiner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:59
  If !Self.GetStageDone(800) ; #DEBUG_LINE_NO:61
    Self.SetStage(900) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(600) ; #DEBUG_LINE_NO:71
    Self.SetStage(600) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:75
    Self.SetStage(980) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(600) ; #DEBUG_LINE_NO:85
    Self.SetStage(600) ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:95
    Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:96
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(990) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:131
  Self.Stop() ; #DEBUG_LINE_NO:132
EndFunction
