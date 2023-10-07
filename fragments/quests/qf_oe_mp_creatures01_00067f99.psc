ScriptName Fragments:Quests:QF_OE_MP_Creatures01_00067F99 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Attacker Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
LeveledItem Property StandardLoot Auto Const mandatory
ReferenceAlias Property Alias_Defender Auto Const mandatory
ReferenceAlias Property Alias_Backup Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Nest.GetRef().AddItem(StandardLoot as Form, 1, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Backup = Alias_Backup.GetActorRef() ; #DEBUG_LINE_NO:15
  Actor Attacker = Alias_Attacker.GetActorRef() ; #DEBUG_LINE_NO:16
  Actor Defender = Alias_Defender.GetActorRef() ; #DEBUG_LINE_NO:17
  Attacker.StartCombat(Defender as ObjectReference, False) ; #DEBUG_LINE_NO:19
  Defender.StartCombat(Attacker as ObjectReference, False) ; #DEBUG_LINE_NO:20
  Attacker.EvaluatePackage(False) ; #DEBUG_LINE_NO:21
  Defender.EvaluatePackage(False) ; #DEBUG_LINE_NO:22
  Backup.Enable(False) ; #DEBUG_LINE_NO:24
  Backup.EvaluatePackage(False) ; #DEBUG_LINE_NO:25
  Backup.StartCombat(Attacker as ObjectReference, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0350_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:34
    Alias_Attacker.GetRef().AddItem(StandardLoot as Form, 1, False) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:38
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction
