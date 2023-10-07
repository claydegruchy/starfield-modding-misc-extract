ScriptName LegendaryAutoHealScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int HealDelayID = 58618
Actor myActor
Float myHealth

;-- Properties --------------------------------------
GlobalVariable Property LegendaryAutoHealMinPercent Auto Const
GlobalVariable Property LegendaryAutoHealDelay Auto Const
ActorValue Property Health Auto
Potion Property Aid_MedPack Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  myActor = akTarget as Actor ; #DEBUG_LINE_NO:13
  Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:14
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:18
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  myHealth = myActor.GetValuePercentage(Health) ; #DEBUG_LINE_NO:22
  If myHealth < LegendaryAutoHealMinPercent.GetValue() && myActor.GetItemCount(Aid_MedPack as Form) > 0 ; #DEBUG_LINE_NO:26
    myActor.EquipItem(Aid_MedPack as Form, False, False) ; #DEBUG_LINE_NO:27
    Self.StartTimer(LegendaryAutoHealDelay.GetValue(), HealDelayID) ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == HealDelayID ; #DEBUG_LINE_NO:36
    Self.RegisterForHitEvent(myActor as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
