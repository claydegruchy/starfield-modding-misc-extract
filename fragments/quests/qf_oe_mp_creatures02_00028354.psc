ScriptName Fragments:Quests:QF_OE_MP_Creatures02_00028354 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Attacker Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef() ; #DEBUG_LINE_NO:31
  Attacker.Enable(False) ; #DEBUG_LINE_NO:33
  Attacker.EvaluatePackage(False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:50
EndFunction
