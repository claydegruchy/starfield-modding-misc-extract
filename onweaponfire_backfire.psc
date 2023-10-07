ScriptName OnWeaponFire_Backfire Extends ActiveMagicEffect hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ChanceBackfire = 10 Auto Const
Spell Property myWeaponFireSpell Auto Const
String Property myAnimEvent Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.registerForAnimationEvent(akTarget, myAnimEvent) ; #DEBUG_LINE_NO:10
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == myAnimEvent ; #DEBUG_LINE_NO:16
    If Game.GetDieRollSuccess(ChanceBackfire, 1, 100, -1, -1) ; #DEBUG_LINE_NO:17
      myWeaponFireSpell.Cast(akSource, None) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.registerForAnimationEvent(akSource, myAnimEvent) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnregisterForAnimationEvent(akCaster as ObjectReference, myAnimEvent) ; #DEBUG_LINE_NO:26
EndEvent
