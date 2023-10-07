ScriptName Fragments:Quests:QF_OE_ShaunD_LootedCorpses_0_0063A278 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
ActorValue Property Aggression Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_NPC01.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_NPC01.GetActorReference().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:23
  Alias_NPC01.GetActorReference().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:24
  Alias_NPC01.GetActorReference().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:34
EndFunction
