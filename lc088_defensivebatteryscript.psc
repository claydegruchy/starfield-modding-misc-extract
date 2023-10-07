ScriptName LC088_DefensiveBatteryScript Extends SpaceshipReference
{ Script to toggle the Defensive Batteries' Laser Fire. }

;-- Variables ---------------------------------------
Int CONST_AimingTimerDelay = 5 Const
Int CONST_AimingTimerID = 1 Const
Int CONST_BatteryState_Aiming = 0 Const
Int CONST_BatteryState_AimingToFire = 1 Const
Int CONST_BatteryState_Firing = 2 Const
Int CONST_BatteryState_Recharging = 3 Const
Int CONST_FiringTimerExpireDelay = 15 Const
Int CONST_FiringTimerExpireID = 2 Const
Int CONST_FiringTimerLapseHitRecheckTime = 1 Const
Int CONST_FiringTimerLapsedTime = 5 Const
Int CONST_HitCheckTimerDelay = 1 Const
Int CONST_HitCheckTimerID = 4 Const
Int CONST_RechargingTimerDelay = 5 Const
Int CONST_RechargingTimerID = 3 Const
Float CONST_RegenHealthTimerDelay = 0.300000012 Const
Int CONST_RegenHealthTimerID = 5 Const
SpaceshipReference activeCombatTarget
Float baseHealth
Int batteryState
Float firingTimeLastHitTimestamp

;-- Properties --------------------------------------
Group AutofillProperties
  ActorValue Property Health Auto Const mandatory
  ActorValue Property SpaceshipWeaponGroup1SystemHealth Auto Const mandatory
  ActorValue Property SpaceshipWeaponGroup2SystemHealth Auto Const mandatory
  Projectile Property DefensiveBatteryLaserProjectile Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If batteryState != CONST_BatteryState_Recharging ; #DEBUG_LINE_NO:65
    Self.SetBatteryState(CONST_BatteryState_Aiming) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetBatteryState(Int newState)
  batteryState = newState ; #DEBUG_LINE_NO:71
  If batteryState == CONST_BatteryState_Aiming ; #DEBUG_LINE_NO:72
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth)) ; #DEBUG_LINE_NO:74
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth)) ; #DEBUG_LINE_NO:75
    Self.StartTimer(CONST_AimingTimerDelay as Float, CONST_AimingTimerID) ; #DEBUG_LINE_NO:76
  ElseIf batteryState == CONST_BatteryState_AimingToFire ; #DEBUG_LINE_NO:77
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth)) ; #DEBUG_LINE_NO:79
    Self.RestoreValue(SpaceshipWeaponGroup2SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup2SystemHealth)) ; #DEBUG_LINE_NO:80
    Self.UpdateActiveCombatTarget(None) ; #DEBUG_LINE_NO:81
    Self.StartTimer(CONST_HitCheckTimerDelay as Float, CONST_HitCheckTimerID) ; #DEBUG_LINE_NO:82
  ElseIf batteryState == CONST_BatteryState_Firing ; #DEBUG_LINE_NO:83
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth)) ; #DEBUG_LINE_NO:85
    Self.RestoreValue(SpaceshipWeaponGroup1SystemHealth, Self.GetBaseValue(SpaceshipWeaponGroup1SystemHealth)) ; #DEBUG_LINE_NO:86
    Self.UpdateActiveCombatTarget(None) ; #DEBUG_LINE_NO:87
    Self.StartTimer(CONST_FiringTimerExpireDelay as Float, CONST_FiringTimerExpireID) ; #DEBUG_LINE_NO:88
  Else ; #DEBUG_LINE_NO:
    Self.DamageValue(SpaceshipWeaponGroup1SystemHealth, Self.GetValue(SpaceshipWeaponGroup1SystemHealth)) ; #DEBUG_LINE_NO:91
    Self.DamageValue(SpaceshipWeaponGroup2SystemHealth, Self.GetValue(SpaceshipWeaponGroup2SystemHealth)) ; #DEBUG_LINE_NO:92
    Self.StartTimer(CONST_RechargingTimerDelay as Float, CONST_RechargingTimerID) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_AimingTimerID ; #DEBUG_LINE_NO:98
    Self.SetBatteryState(CONST_BatteryState_AimingToFire) ; #DEBUG_LINE_NO:99
  ElseIf timerID == CONST_FiringTimerExpireID ; #DEBUG_LINE_NO:100
    Self.SetBatteryState(CONST_BatteryState_Recharging) ; #DEBUG_LINE_NO:101
  ElseIf timerID == CONST_RechargingTimerID ; #DEBUG_LINE_NO:102
    Self.SetBatteryState(CONST_BatteryState_Aiming) ; #DEBUG_LINE_NO:103
  ElseIf timerID == CONST_HitCheckTimerID ; #DEBUG_LINE_NO:104
    SpaceshipReference currentCombatTarget = Self.GetCombatTarget() ; #DEBUG_LINE_NO:105
    If activeCombatTarget != currentCombatTarget ; #DEBUG_LINE_NO:106
      Self.UpdateActiveCombatTarget(currentCombatTarget) ; #DEBUG_LINE_NO:107
    EndIf ; #DEBUG_LINE_NO:
    Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:109
    If firingTimeLastHitTimestamp < currentTime ; #DEBUG_LINE_NO:110
      firingTimeLastHitTimestamp = currentTime ; #DEBUG_LINE_NO:112
    EndIf ; #DEBUG_LINE_NO:
    If batteryState == CONST_BatteryState_Firing && (firingTimeLastHitTimestamp + CONST_FiringTimerLapsedTime as Float) < currentTime ; #DEBUG_LINE_NO:114
      Self.SetBatteryState(CONST_BatteryState_Aiming) ; #DEBUG_LINE_NO:116
    ElseIf batteryState == CONST_BatteryState_AimingToFire || batteryState == CONST_BatteryState_Firing ; #DEBUG_LINE_NO:117
      Self.StartTimer(CONST_HitCheckTimerDelay as Float, CONST_HitCheckTimerID) ; #DEBUG_LINE_NO:118
    EndIf ; #DEBUG_LINE_NO:
  ElseIf timerID == CONST_RegenHealthTimerID ; #DEBUG_LINE_NO:120
    Self.RestoreValue(Health, baseHealth / 25.0) ; #DEBUG_LINE_NO:121
    If Self.GetValue(Health) < baseHealth ; #DEBUG_LINE_NO:122
      Self.StartTimer(CONST_RegenHealthTimerDelay, CONST_RegenHealthTimerID) ; #DEBUG_LINE_NO:123
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateActiveCombatTarget(SpaceshipReference currentCombatTarget)
  If currentCombatTarget == None ; #DEBUG_LINE_NO:129
    currentCombatTarget = Self.GetCombatTarget() ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  If activeCombatTarget != None ; #DEBUG_LINE_NO:132
    Self.UnregisterForHitEvent(activeCombatTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  activeCombatTarget = currentCombatTarget ; #DEBUG_LINE_NO:135
  If batteryState == CONST_BatteryState_Firing ; #DEBUG_LINE_NO:137
    Self.SetBatteryState(CONST_BatteryState_Aiming) ; #DEBUG_LINE_NO:139
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(activeCombatTarget as ScriptObject, None, None, DefensiveBatteryLaserProjectile as Form, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akTarget == activeCombatTarget as ObjectReference ; #DEBUG_LINE_NO:147
    If batteryState == CONST_BatteryState_AimingToFire ; #DEBUG_LINE_NO:148
      Self.SetBatteryState(CONST_BatteryState_Firing) ; #DEBUG_LINE_NO:149
    EndIf ; #DEBUG_LINE_NO:
    If batteryState == CONST_BatteryState_Firing ; #DEBUG_LINE_NO:151
      Utility.Wait(CONST_FiringTimerLapseHitRecheckTime as Float) ; #DEBUG_LINE_NO:152
      firingTimeLastHitTimestamp = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:153
      Self.RegisterForHitEvent(activeCombatTarget as ScriptObject, None, None, DefensiveBatteryLaserProjectile as Form, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:154
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RegenBattery()
  Self.StartTimer(0.0, CONST_RegenHealthTimerID) ; #DEBUG_LINE_NO:160
EndFunction

;-- State -------------------------------------------
State Active
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellLoad()
    baseHealth = Self.GetBaseValue(Health) ; #DEBUG_LINE_NO:52
    Self.EnablePartRepair(SpaceshipWeaponGroup1SystemHealth, False) ; #DEBUG_LINE_NO:53
    Self.EnablePartRepair(SpaceshipWeaponGroup2SystemHealth, False) ; #DEBUG_LINE_NO:54
    Self.GoToState("Active") ; #DEBUG_LINE_NO:55
  EndEvent
EndState
