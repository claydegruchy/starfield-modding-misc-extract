ScriptName DefaultSetActorValueEffectScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Data
  ActorValue Property ActorValueToSet Auto Const
  { AUTOFILL }
  Float Property ValueToSetOnStart = 1.0 Auto Const
  Float Property ValueToSetOnFinish = 0.0 Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akTarget.SetValue(ActorValueToSet, ValueToSetOnStart) ; #DEBUG_LINE_NO:15
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akTarget.SetValue(ActorValueToSet, ValueToSetOnFinish) ; #DEBUG_LINE_NO:21
EndEvent
