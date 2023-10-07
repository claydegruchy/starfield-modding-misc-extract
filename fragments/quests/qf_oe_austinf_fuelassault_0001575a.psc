ScriptName Fragments:Quests:QF_OE_AustinF_FuelAssault_0001575A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Attackers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
RefCollectionAlias Property Alias_Defenders Auto Const mandatory
ReferenceAlias Property Alias_DefenderLeader Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_Attackers.EnableAll(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(250) ; #DEBUG_LINE_NO:15
    Self.SetStage(999) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:25
    Self.SetStage(999) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(200) && Self.GetStageDone(250) ; #DEBUG_LINE_NO:35
    Self.SetStage(999) ; #DEBUG_LINE_NO:36
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(900) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(360) || Self.GetStageDone(370) || Self.GetStageDone(380) ; #DEBUG_LINE_NO:47
    Self.SetStage(390) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0360_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(370) || Self.GetStageDone(380) ; #DEBUG_LINE_NO:57
    Self.SetStage(390) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(360) || Self.GetStageDone(380) ; #DEBUG_LINE_NO:67
    Self.SetStage(390) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0380_Item_00()
  If Self.GetStageDone(350) || Self.GetStageDone(360) || Self.GetStageDone(370) ; #DEBUG_LINE_NO:77
    Self.SetStage(390) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0390_Item_00()
  Alias_Defenders.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0900_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0910_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:103
  Alias_Defenders.EvaluateAll() ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_DefenderLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:112
  Alias_Defenders.EvaluateAll() ; #DEBUG_LINE_NO:113
  Self.SetStage(999) ; #DEBUG_LINE_NO:114
EndFunction
