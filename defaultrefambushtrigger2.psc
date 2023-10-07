ScriptName DefaultRefAmbushTrigger2 Extends ObjectReference
{ Alternate ambush trigger system for locations with complex ambush needs. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OptionalProperties
  Bool Property TriggerIfAnyLinkedActorEntersCombat = True Auto Const
  { Default=True. If True, trigger the ambush when any actor managed by this trigger enters combat. }
  Bool Property TriggerIfAnyLinkedActorIsHit = False Auto Const
  { Default=False. If True, trigger the ambush when any actor managed by this trigger is hit. }
  Faction Property FactionToApplyInAmbush Auto Const
  { Default=None. If set, this faction will be added to the actors controlled by this trigger while they are in ambush, and removed when they emerge. }
  Float Property InitialAmbushDelay = 0.0 Auto Const
  { Default=0. If set, the delay between the event that triggers the ambush and the first creature released from it. }
  Float Property MinAmbushDelay = 0.0 Auto Const
  { Default=0. If set, the minimum delay between releasing actors controlled by this trigger. }
  Float Property MaxAmbushDelay = 0.25 Auto Const
  { Default=0.25. If set, the maximum delay between releasing actors controlled by this trigger. }
EndGroup

Group AutofillProperties
  ActorValue Property AmbushTriggered Auto Const mandatory
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  Keyword Property LinkAmbushSequence Auto Const mandatory
  Keyword Property DMP_AmbushMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  Self.TriggerAmbushForActor(akSource) ; #DEBUG_LINE_NO:59
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.TriggerAmbushForActor(akSource as Actor) ; #DEBUG_LINE_NO:65
EndEvent

Function TriggerAmbush()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Actor[] Function GetAmbushTriggerActors()
  Actor[] mySequence = Self.GetLinkedRefChain(LinkAmbushSequence, 100) as Actor[] ; #DEBUG_LINE_NO:96
  If mySequence == None || mySequence.Length == 0 ; #DEBUG_LINE_NO:97
    Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[] ; #DEBUG_LINE_NO:98
    If myChildren == None || myChildren.Length == 0 ; #DEBUG_LINE_NO:99
      Return new Actor[0] ; #DEBUG_LINE_NO:101
    Else ; #DEBUG_LINE_NO:
      Return myChildren ; #DEBUG_LINE_NO:103
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Actor[] mychildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[] ; #DEBUG_LINE_NO:106
    Int I = 0 ; #DEBUG_LINE_NO:107
    While I < mychildren.Length ; #DEBUG_LINE_NO:108
      If mySequence.find(mychildren[I], 0) < 0 ; #DEBUG_LINE_NO:109
        mySequence.add(mychildren[I], 1) ; #DEBUG_LINE_NO:110
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:112
    EndWhile ; #DEBUG_LINE_NO:
    Return mySequence ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TriggerAmbushForActor(Actor actorToTrigger)
  If FactionToApplyInAmbush != None ; #DEBUG_LINE_NO:134
    actorToTrigger.RemoveFromFaction(FactionToApplyInAmbush) ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
  actorToTrigger.SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:137
  actorToTrigger.EvaluatePackage(False) ; #DEBUG_LINE_NO:138
EndFunction

;-- State -------------------------------------------
State Triggered

  Event OnBeginState(String asOldState)
    Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:77
    Actor[] myActors = Self.GetAmbushTriggerActors() ; #DEBUG_LINE_NO:78
    Int I = 0 ; #DEBUG_LINE_NO:79
    While I < myActors.Length ; #DEBUG_LINE_NO:80
      If I == 0 ; #DEBUG_LINE_NO:81
        If InitialAmbushDelay > 0.0 ; #DEBUG_LINE_NO:82
          Utility.Wait(InitialAmbushDelay) ; #DEBUG_LINE_NO:83
        EndIf ; #DEBUG_LINE_NO:
      ElseIf MaxAmbushDelay > 0.0 ; #DEBUG_LINE_NO:85
        Utility.Wait(Utility.RandomFloat(MinAmbushDelay, MaxAmbushDelay)) ; #DEBUG_LINE_NO:86
      EndIf ; #DEBUG_LINE_NO:
      Self.TriggerAmbushForActor(myActors[I]) ; #DEBUG_LINE_NO:88
      I += 1 ; #DEBUG_LINE_NO:89
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
    Self.TriggerAmbushForActor(akSource) ; #DEBUG_LINE_NO:
    Self.GoToState("Triggered") ; #DEBUG_LINE_NO:
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.TriggerAmbushForActor(akSource as Actor) ; #DEBUG_LINE_NO:
    Self.GoToState("Triggered") ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Triggered") ; #DEBUG_LINE_NO:
  EndEvent

  Function TriggerAmbush()
    Self.GoToState("Triggered") ; #DEBUG_LINE_NO:
  EndFunction

  Event OnCellLoad()
    Actor[] myActors = Self.GetAmbushTriggerActors() ; #DEBUG_LINE_NO:34
    If myActors.Length > 0 ; #DEBUG_LINE_NO:35
      Int I = 0 ; #DEBUG_LINE_NO:36
      While I < myActors.Length ; #DEBUG_LINE_NO:37
        If TriggerIfAnyLinkedActorEntersCombat ; #DEBUG_LINE_NO:38
          Self.RegisterForRemoteEvent(myActors[I] as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:39
        EndIf ; #DEBUG_LINE_NO:
        If TriggerIfAnyLinkedActorIsHit ; #DEBUG_LINE_NO:41
          Self.RegisterForHitEvent(myActors[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:42
        EndIf ; #DEBUG_LINE_NO:
        If FactionToApplyInAmbush != None ; #DEBUG_LINE_NO:44
          If myActors[I].GetLinkedRef(DMP_AmbushMarker) != None ; #DEBUG_LINE_NO:45
            myActors[I].AddToFaction(FactionToApplyInAmbush) ; #DEBUG_LINE_NO:46
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:49
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
