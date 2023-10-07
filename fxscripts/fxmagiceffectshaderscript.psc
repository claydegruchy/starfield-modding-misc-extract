ScriptName FXScripts:FXMagicEffectShaderScript Extends ActiveMagicEffect
{ This Script applies a Visual Effect. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
EffectShader Property EffectShaderToApply Auto Const mandatory
{ This is the visue effect that will be used. }
Float Property ShaderDuration = -1.0 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  EffectShaderToApply.play(akTarget, ShaderDuration) ; #DEBUG_LINE_NO:9
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  EffectShaderToApply.Stop(akTarget) ; #DEBUG_LINE_NO:13
EndEvent
