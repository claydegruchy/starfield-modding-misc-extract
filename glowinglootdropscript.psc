ScriptName glowingLootDropSCRIPT Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor caster

;-- Properties --------------------------------------
LeveledItem Property list Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  caster = akCaster ; #DEBUG_LINE_NO:9
EndEvent

Event onDying(ObjectReference akKiller)
  caster.additem(list as Form, 1, False) ; #DEBUG_LINE_NO:15
EndEvent
