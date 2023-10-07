ScriptName EH_CreateFruit Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor caster

;-- Properties --------------------------------------
Potion Property AddFruit Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  caster = akCaster ; #DEBUG_LINE_NO:9
  caster.additem(AddFruit as Form, 1, False) ; #DEBUG_LINE_NO:10
EndEvent
