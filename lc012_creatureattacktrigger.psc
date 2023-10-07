ScriptName LC012_CreatureAttackTrigger Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property MQ202PetrovEnemyFaction Auto Const
{ Faction to add to the creature }
Faction Property MQ202PetrovFaction Auto Const
{ Faction to remove from the creature }
Keyword Property LinkCustom01 Auto Const
{ Link to the chain of creatures from the door }
ActorValue Property LC012_CreatureAttack Auto Const
{ The Actor value to set, used by the LC012_CreatureAttackPackage }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:14
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < LinkedRefs.Length ; #DEBUG_LINE_NO:16
    LinkedRefs[I].SetValue(LC012_CreatureAttack, 1.0) ; #DEBUG_LINE_NO:17
    (LinkedRefs[I] as Actor).RemoveFromFaction(MQ202PetrovFaction) ; #DEBUG_LINE_NO:18
    (LinkedRefs[I] as Actor).AddToFaction(MQ202PetrovEnemyFaction) ; #DEBUG_LINE_NO:19
    (LinkedRefs[I] as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:20
    I += 1 ; #DEBUG_LINE_NO:21
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
