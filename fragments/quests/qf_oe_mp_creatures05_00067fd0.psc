ScriptName Fragments:Quests:QF_OE_MP_Creatures05_00067FD0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AttackerA1 Auto Const mandatory
ReferenceAlias Property Alias_AttackerA3 Auto Const mandatory
ReferenceAlias Property Alias_AttackerB1 Auto Const mandatory
ReferenceAlias Property Alias_AttackerB3 Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
MiscObject Property Creature_Egg Auto Const mandatory
LeveledItem Property BonusLoot Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  defaultgroupspawnquestscript kmyQuest = __temp as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:8
  Int Chance = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:11
  If Chance == 4 ; #DEBUG_LINE_NO:13
    Alias_Corpse.GetRef().AddItem(BonusLoot as Form, 1, False) ; #DEBUG_LINE_NO:14
  ElseIf Chance == 3 ; #DEBUG_LINE_NO:15
    Alias_Corpse.GetRef().AddItem(Creature_Egg as Form, 1, False) ; #DEBUG_LINE_NO:16
  ElseIf Chance == 2 ; #DEBUG_LINE_NO:17
    Alias_Nest.GetRef().AddItem(Creature_Egg as Form, 1, False) ; #DEBUG_LINE_NO:18
  Else ; #DEBUG_LINE_NO:
    Alias_Nest.GetRef().AddItem(BonusLoot as Form, 1, False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor AttackerA1 = Alias_AttackerA1.GetActorRef() ; #DEBUG_LINE_NO:37
  Actor AttackerA3 = Alias_AttackerA3.GetActorRef() ; #DEBUG_LINE_NO:38
  AttackerA1.Enable(False) ; #DEBUG_LINE_NO:40
  AttackerA3.Enable(False) ; #DEBUG_LINE_NO:41
  AttackerA1.EvaluatePackage(False) ; #DEBUG_LINE_NO:42
  AttackerA3.EvaluatePackage(False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor AttackerB1 = Alias_AttackerB1.GetActorRef() ; #DEBUG_LINE_NO:51
  Actor AttackerB3 = Alias_AttackerB3.GetActorRef() ; #DEBUG_LINE_NO:52
  AttackerB1.Enable(False) ; #DEBUG_LINE_NO:54
  AttackerB3.Enable(False) ; #DEBUG_LINE_NO:55
  AttackerB1.EvaluatePackage(False) ; #DEBUG_LINE_NO:56
  AttackerB3.EvaluatePackage(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:65
    Self.SetStage(300) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:75
    Self.SetStage(300) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
EndFunction
