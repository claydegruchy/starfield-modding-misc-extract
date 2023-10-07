ScriptName MQ205StarbornCaptiveScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Function RegisterForHits()
  Self.RegisterForHitEvent(Self.GetActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:4
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    Quest MQ205Quest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
    If MQ205Quest.GetStageDone(310) && MQ205Quest.GetStageDone(315) == False ; #DEBUG_LINE_NO:10
      MQ205Quest.SetStage(315) ; #DEBUG_LINE_NO:11
    ElseIf MQ205Quest.GetStageDone(320) && MQ205Quest.GetStageDone(325) == False ; #DEBUG_LINE_NO:12
      MQ205Quest.SetStage(325) ; #DEBUG_LINE_NO:13
    ElseIf MQ205Quest.GetStageDone(330) && MQ205Quest.GetStageDone(350) == False ; #DEBUG_LINE_NO:14
      MQ205Quest.SetStage(350) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
