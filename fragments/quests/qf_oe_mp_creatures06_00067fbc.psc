ScriptName Fragments:Quests:QF_OE_MP_Creatures06_00067FBC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nest Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
LeveledItem Property StandardLoot Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0500_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef() ; #DEBUG_LINE_NO:15
  Attacker.Enable(False) ; #DEBUG_LINE_NO:17
  Attacker.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:26
    Alias_Nest.GetRef().AddItem(StandardLoot as Form, 1, False) ; #DEBUG_LINE_NO:27
  ElseIf Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:29
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False) ; #DEBUG_LINE_NO:30
  Else ; #DEBUG_LINE_NO:
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:50
EndFunction
