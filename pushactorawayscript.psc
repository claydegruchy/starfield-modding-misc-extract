ScriptName PushActorAwayScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property Magnitude Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetActor = akTarget as Actor ; #DEBUG_LINE_NO:4
  If targetActor ; #DEBUG_LINE_NO:5
    akCaster.PushActorAway(targetActor, Magnitude) ; #DEBUG_LINE_NO:6
  EndIf ; #DEBUG_LINE_NO:
EndEvent
