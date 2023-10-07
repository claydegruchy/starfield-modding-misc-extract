ScriptName ArtifactPower_ReflectShield Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property ReflectPerk Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.addPerk(ReflectPerk, False) ; #DEBUG_LINE_NO:7
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.removePerk(ReflectPerk) ; #DEBUG_LINE_NO:13
EndEvent
