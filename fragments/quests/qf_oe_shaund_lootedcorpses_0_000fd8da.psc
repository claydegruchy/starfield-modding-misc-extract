ScriptName Fragments:Quests:QF_OE_ShaunD_LootedCorpses_0_000FD8DA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ActorValue Property Aggression Auto Const
Faction Property PlayerEnemyFaction Auto Const
ReferenceAlias Property Alias_Marker_Corpse00 Auto Const mandatory
Furniture Property NPCSearchingFloor Auto Const
Keyword Property LinkCustom01 Auto Const
RefCollectionAlias Property Alias_Corpses Auto Const mandatory
ReferenceAlias Property Alias_LootingFurn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Float offset = 1.0 ; #DEBUG_LINE_NO:7
  ObjectReference lootingFurn = Alias_LootingFurn.GetRef() ; #DEBUG_LINE_NO:9
  lootingFurn.SetAngle(0.0, 0.0, 180.0) ; #DEBUG_LINE_NO:10
  lootingFurn.MoveTo(Alias_Marker_Corpse00.getReference(), 0.0, offset, 0.0, False, False) ; #DEBUG_LINE_NO:11
  lootingFurn.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:12
  Int I = 1 ; #DEBUG_LINE_NO:15
  While I < Alias_Corpses.GetCount() ; #DEBUG_LINE_NO:16
    Alias_Corpses.GetAt(I - 1).SetLinkedRef(Alias_Corpses.GetAt(I), None, True) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_NPC01.GetActorReference().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:27
  Alias_NPC01.GetActorReference().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:28
  Alias_NPC01.GetActorReference().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:37
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:38
EndFunction
