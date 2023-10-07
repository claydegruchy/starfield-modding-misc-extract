ScriptName LC165ResurrectableCorpsesRefColScript Extends RefCollectionAlias
{ Actors in this Ref Collection are killed on first cell load, and set up to be resurrected during one of the LC165 Battles. }

;-- Variables ---------------------------------------
Int CONST_Aggression_VeryAggressive = 2 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_CorpseSettleDelay = 2 Const

;-- Properties --------------------------------------
Bool Property ShouldKillOnLoad = True Auto Const
Bool Property ShouldDisableAfterKill = False Auto Const
Faction Property LC165StarbornEnemyFaction Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property LC165_ResurrectableCorpseKilledOnLoadValue Auto Const mandatory
Keyword Property DMP_Combat_FleeTo Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad(ObjectReference akSenderRef)
  If ShouldKillOnLoad ; #DEBUG_LINE_NO:22
    Actor sourceActor = akSenderRef as Actor ; #DEBUG_LINE_NO:23
    If sourceActor != None ; #DEBUG_LINE_NO:24
      If sourceActor.GetValue(LC165_ResurrectableCorpseKilledOnLoadValue) == 0.0 ; #DEBUG_LINE_NO:25
        sourceActor.Kill(None) ; #DEBUG_LINE_NO:26
        If ShouldDisableAfterKill ; #DEBUG_LINE_NO:27
          sourceActor.DisableNoWait(False) ; #DEBUG_LINE_NO:28
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Actor sourceActor = akSenderRef as Actor ; #DEBUG_LINE_NO:36
  If sourceActor != None ; #DEBUG_LINE_NO:37
    sourceActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:38
    sourceActor.AddToFaction(LC165StarbornEnemyFaction) ; #DEBUG_LINE_NO:39
    sourceActor.SetValue(Confidence, CONST_Confidence_Foolhardy as Float) ; #DEBUG_LINE_NO:40
    sourceActor.SetValue(Aggression, CONST_Aggression_VeryAggressive as Float) ; #DEBUG_LINE_NO:41
    sourceActor.SetValue(LC165_ResurrectableCorpseKilledOnLoadValue, 1.0) ; #DEBUG_LINE_NO:42
    sourceActor.SetLinkedRef(None, DMP_Combat_FleeTo, True) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent
