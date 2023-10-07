ScriptName Fragments:Quests:QF_TestLC051GuardSpeechChall_0027B16C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC Auto Const mandatory
ActorValue Property Aggression Auto Const
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  Alias_NPC.GetActorRef().SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:7
  Alias_NPC.GetActorRef().AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:8
  Alias_NPC.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:9
EndFunction
