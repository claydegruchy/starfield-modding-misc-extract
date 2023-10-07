ScriptName CCT_StayInBleedoutEffectScript Extends ActiveMagicEffect
{ sets NoBleedoutRecovery when bleedout starts; clear it when hit while in bleedout. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property IgnoreHitsTimeSeconds = 2.0 Auto Const
{ how long after entering bleedout to ignore hits? }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnEnterBleedout") ; #DEBUG_LINE_NO:8
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:9
EndEvent

Event Actor.OnEnterBleedout(Actor akSource)
  akSource.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:14
  Self.StartTimer(IgnoreHitsTimeSeconds, 0) ; #DEBUG_LINE_NO:15
  akSource.EvaluatePackage(False) ; #DEBUG_LINE_NO:16
EndEvent

Event OnTimer(Int aiTimerID)
  Self.RegisterForHitEvent(Self.GetCasterActor() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:21
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor myActor = Self.GetCasterActor() ; #DEBUG_LINE_NO:25
  If myActor as Bool && myActor.IsBleedingOut() > 0 ; #DEBUG_LINE_NO:27
    myActor.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSource)
  (akSource as Actor).SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:34
EndEvent
