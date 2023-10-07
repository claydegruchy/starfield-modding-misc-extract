ScriptName Fragments:Quests:QF_OE_MP_Creatures07_00067FAB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property StandardLoot Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
Keyword Property FleePackageActivated Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
RefCollectionAlias Property Alias_Defenders Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_Defenders.EvaluateAll() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Attacker.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:15
  Alias_Attacker.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Alias_Defenders.EvaluateAll() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Defenders.EvaluateAll() ; #DEBUG_LINE_NO:25
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:27
    Self.SetStage(400) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:37
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False) ; #DEBUG_LINE_NO:38
  Else ; #DEBUG_LINE_NO:
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:49
    Self.SetStage(200) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Alias_Attacker.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:67
EndFunction
