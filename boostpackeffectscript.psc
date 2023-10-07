ScriptName BoostpackEffectScript Extends ActiveMagicEffect
{ script lives on the boostpack enchantment and sets an actor variable for when the boostpack is active or not }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property BoostpackActive Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:13
  Self.RegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:14
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:20
  Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:21
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If akSource ; #DEBUG_LINE_NO:27
    If asEventName == "StartImpactFX" ; #DEBUG_LINE_NO:28
      akSource.setValue(BoostpackActive, 1.0) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
    If asEventName == "StopImpactFX" ; #DEBUG_LINE_NO:32
      akSource.setValue(BoostpackActive, 0.0) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
