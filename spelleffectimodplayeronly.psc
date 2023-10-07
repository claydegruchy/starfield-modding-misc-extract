ScriptName SpellEffectImodPlayerOnly Extends ActiveMagicEffect
{ Plays the selected Imod on begin effect }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ImageSpaceModifier Property myImod Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:7
    myImod.Apply(1.0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
