ScriptName SG01MatchShipScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
ActorValue Property ShipSystem Auto Const
ActorValue Property EngineSystemHealth Auto Const mandatory
ActorValue Property WeaponGroup1SystemHealth Auto Const mandatory
ActorValue Property WeaponGroup2SystemHealth Auto Const mandatory
ActorValue Property WeaponGroup3SystemHealth Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property Invulnerable Auto Const mandatory
Quest Property SG01 Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property SG01_CompetitorsRemaining Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False ; #DEBUG_LINE_NO:4
    (akObject as spaceshipreference).EnablePartRepair(EngineSystemHealth, False) ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForHitEvent(akSenderRef as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:11
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < Self.GetCount() ; #DEBUG_LINE_NO:16
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:17
    theRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:18
    I += 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If !SG01.GetStageDone(700) ; #DEBUG_LINE_NO:27
    If akAggressor == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:28
      SG01.SetStage(525) ; #DEBUG_LINE_NO:29
      If SG01.GetStageDone(530) ; #DEBUG_LINE_NO:30
        SG01.SetStage(550) ; #DEBUG_LINE_NO:31
      Else ; #DEBUG_LINE_NO:
        Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:33
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If akSystem == ShipSystem && aFullyDamaged ; #DEBUG_LINE_NO:42
    akSenderRef.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:46
    Int nCompetitorsLeft = 0 ; #DEBUG_LINE_NO:49
    Int I = 0 ; #DEBUG_LINE_NO:50
    While I < Self.GetCount() ; #DEBUG_LINE_NO:51
      ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:52
      If theRef.GetValue(Aggression) == 2.0 ; #DEBUG_LINE_NO:53
        nCompetitorsLeft += 1 ; #DEBUG_LINE_NO:54
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:56
    EndWhile ; #DEBUG_LINE_NO:
    If !SG01.GetStageDone(600) ; #DEBUG_LINE_NO:59
      nCompetitorsLeft = Self.GetCount() ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    If nCompetitorsLeft == 0 ; #DEBUG_LINE_NO:63
      SG01.SetStage(800) ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
    If nCompetitorsLeft <= 2 ; #DEBUG_LINE_NO:67
      SG01.SetStage(720) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
    spaceshipreference spaceshipRef = akSenderRef as spaceshipreference ; #DEBUG_LINE_NO:72
    spaceshipRef.EnablePartRepair(None, False) ; #DEBUG_LINE_NO:73
    spaceshipRef.DamageValue(WeaponGroup1SystemHealth, 10000.0) ; #DEBUG_LINE_NO:74
    spaceshipRef.DamageValue(WeaponGroup2SystemHealth, 10000.0) ; #DEBUG_LINE_NO:75
    spaceshipRef.DamageValue(WeaponGroup3SystemHealth, 10000.0) ; #DEBUG_LINE_NO:76
    spaceshipRef.StopCombat() ; #DEBUG_LINE_NO:78
    spaceshipRef.SetUnconscious(True) ; #DEBUG_LINE_NO:79
    spaceshipRef.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:80
    spaceshipRef.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:81
    spaceshipRef.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:82
    spaceshipRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:83
    spaceshipRef.SetValue(Invulnerable, 1.0) ; #DEBUG_LINE_NO:84
    spaceshipRef.EvaluatePackage(True) ; #DEBUG_LINE_NO:85
    spaceshipRef.StopCombat() ; #DEBUG_LINE_NO:86
    SG01_CompetitorsRemaining.SetValue(nCompetitorsLeft as Float) ; #DEBUG_LINE_NO:89
    SG01.UpdateCurrentInstanceGlobal(SG01_CompetitorsRemaining) ; #DEBUG_LINE_NO:92
    SG01.SetObjectiveDisplayed(700, True, True) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndEvent
