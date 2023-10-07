ScriptName AddictolScrip Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property Addiction Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor targetAsActor = akTarget as Actor ; #DEBUG_LINE_NO:6
  If targetAsActor ; #DEBUG_LINE_NO:7
    targetAsActor.RemoveSpell(Addiction) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
