ScriptName LegendaryMagicEffectSlowTimeScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property SlowTime Auto Const
Message Property modLegendarySlowTimeMsg Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  modLegendarySlowTimeMsg.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:8
  SlowTime.Cast(akTarget, None) ; #DEBUG_LINE_NO:9
EndEvent
