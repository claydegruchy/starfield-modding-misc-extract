ScriptName ENV_DisableSprintEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
inputenablelayer InputLayer

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  InputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:6
  InputLayer.EnableSprinting(False) ; #DEBUG_LINE_NO:8
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  InputLayer.Delete() ; #DEBUG_LINE_NO:12
EndEvent
