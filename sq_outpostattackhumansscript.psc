ScriptName SQ_OutpostAttackHumansScript Extends SQ_OutpostAttackScript

;-- Variables ---------------------------------------
Float fObjectAttackTimerSeconds = 3.0 Const
Int iObjectAttackTimerID = 1 Const

;-- Properties --------------------------------------
Group AttackHumansData
  ReferenceAlias[] Property Ships Auto Const mandatory
  { array of ship aliases }
  ActorValue Property OutpostBuildAreaRadius Auto Const mandatory
  { build radius AV - used to check for replacement outpost beacon during attack }
EndGroup


;-- Functions ---------------------------------------

Function HandleQuestStarted()
  oe_shipsaddonscript myShipScript = (Self as Quest) as oe_shipsaddonscript ; #DEBUG_LINE_NO:17
  If myShipScript ; #DEBUG_LINE_NO:18
    myShipScript.LandShip(-1) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(OutpostBeacon as ScriptObject, "OnWorkshopObjectPlaced") ; #DEBUG_LINE_NO:23
  Self.RegisterForRemoteEvent(AttackTarget as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:26
  Self.RegisterForRemoteEvent(AttackTarget as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:27
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnOutpostPlaced") ; #DEBUG_LINE_NO:30
EndFunction

Event ReferenceAlias.OnLoad(ReferenceAlias akSource)
  If IsAttackStarted as Bool && Attackers.GetCountDead() < Attackers.GetCount() ; #DEBUG_LINE_NO:35
    Self.AttackOutpostObjects() ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSource)
  If IsAttackStarted as Bool && Attackers.GetCountDead() < Attackers.GetCount() ; #DEBUG_LINE_NO:42
    ObjectReference outpostBeaconRef = OutpostBeacon.GetRef() ; #DEBUG_LINE_NO:44
    If outpostBeaconRef ; #DEBUG_LINE_NO:45
      ObjectReference[] destructibleObjects = outpostBeaconRef.GetDestructibleOutpostObjects() ; #DEBUG_LINE_NO:46
      Int I = 0 ; #DEBUG_LINE_NO:48
      While I < destructibleObjects.Length ; #DEBUG_LINE_NO:49
        ObjectReference theRef = destructibleObjects[I] ; #DEBUG_LINE_NO:50
        If theRef.Is3DLoaded() == False ; #DEBUG_LINE_NO:51
          theRef.SetDestroyed(True) ; #DEBUG_LINE_NO:54
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:57
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Float buildRadius = akOutpostBeacon.GetValue(OutpostBuildAreaRadius) ; #DEBUG_LINE_NO:65
  ObjectReference attackTargetRef = AttackTarget.GetRef() ; #DEBUG_LINE_NO:66
  If attackTargetRef.GetDistance(akOutpostBeacon) < buildRadius ; #DEBUG_LINE_NO:67
    OutpostBeacon.ForceRefTo(akOutpostBeacon) ; #DEBUG_LINE_NO:70
    attackTargetRef.MoveTo(akOutpostBeacon, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleQuestShutdown()
  Int I = 0 ; #DEBUG_LINE_NO:79
  While I < Ships.Length ; #DEBUG_LINE_NO:80
    Ships[I].TryToDisable() ; #DEBUG_LINE_NO:81
    I += 1 ; #DEBUG_LINE_NO:82
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandleAttackersSpawning()
  Attackers.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:89
EndFunction

Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ObjectReference outpostRef = OutpostBeacon.GetRef() ; #DEBUG_LINE_NO:95
  Actor attackerRef = akSenderRef as Actor ; #DEBUG_LINE_NO:96
  If (outpostRef as Bool && attackerRef as Bool) && akNewLoc == outpostRef.GetCurrentLocation() ; #DEBUG_LINE_NO:97
    Int I = attackerRef.AttackOutpostObjects(outpostRef) ; #DEBUG_LINE_NO:98
    Self.StartAttack(True) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If IsAttackStarted ; #DEBUG_LINE_NO:106
    Self.StartTimer(fObjectAttackTimerSeconds, iObjectAttackTimerID) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iObjectAttackTimerID ; #DEBUG_LINE_NO:113
    Self.AttackOutpostObjects() ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AttackOutpostObjects()
  ObjectReference outpostRef = OutpostBeacon.GetRef() ; #DEBUG_LINE_NO:121
  If outpostRef ; #DEBUG_LINE_NO:122
    Int a = 0 ; #DEBUG_LINE_NO:123
    While a < Attackers.GetCount() ; #DEBUG_LINE_NO:124
      Actor theAttacker = Attackers.GetActorAt(a) ; #DEBUG_LINE_NO:125
      If theAttacker as Bool && theAttacker.IsDead() == False ; #DEBUG_LINE_NO:126
        Int I = theAttacker.AttackOutpostObjects(outpostRef) ; #DEBUG_LINE_NO:127
      EndIf ; #DEBUG_LINE_NO:
      a += 1 ; #DEBUG_LINE_NO:130
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
