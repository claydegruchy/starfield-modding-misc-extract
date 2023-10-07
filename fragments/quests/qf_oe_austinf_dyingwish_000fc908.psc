ScriptName Fragments:Quests:QF_OE_AustinF_DyingWish_000FC908 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC Auto Const mandatory
Spell Property AbilityDamageHealthSlow Auto Const
LeveledItem Property LL_Food_Homemade Auto Const mandatory
Potion Property FriedPickles Auto Const mandatory
Potion Property Kiffles Auto Const mandatory
Potion Property Pierogis Auto Const mandatory
Potion Property Gazpacho Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int Request = Utility.RandomInt(1, 3) ; #DEBUG_LINE_NO:15
  If Request == 1 ; #DEBUG_LINE_NO:17
    Self.SetStage(110) ; #DEBUG_LINE_NO:18
  ElseIf Request == 2 ; #DEBUG_LINE_NO:19
    Self.SetStage(120) ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(130) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().RemoveItem(FriedPickles as Form, 1, False, None) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(Kiffles as Form, 1, False, None) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0235_Item_00()
  Game.GetPlayer().RemoveItem(Pierogis as Form, 1, False, None) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0245_Item_00()
  Game.GetPlayer().RemoveItem(Gazpacho as Form, 1, False, None) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0400_Item_00()
  Actor NPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:79
  NPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:81
  NPC.SetUnconscious(True) ; #DEBUG_LINE_NO:82
  Alias_NPC.GetActorRef().AddSpell(AbilityDamageHealthSlow, True) ; #DEBUG_LINE_NO:83
  Utility.Wait(2.5) ; #DEBUG_LINE_NO:84
  Self.SetStage(450) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor NPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:93
  NPC.Kill(None) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0800_Item_00()
  Actor NPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:110
  If Self.GetStageDone(225) ; #DEBUG_LINE_NO:112
    NPC.AddItem(FriedPickles as Form, 1, False) ; #DEBUG_LINE_NO:113
  ElseIf Self.GetStageDone(230) ; #DEBUG_LINE_NO:114
    NPC.AddItem(Kiffles as Form, 1, False) ; #DEBUG_LINE_NO:115
  Else ; #DEBUG_LINE_NO:
    NPC.AddItem(Pierogis as Form, 1, False) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:128
  Self.Stop() ; #DEBUG_LINE_NO:129
EndFunction
