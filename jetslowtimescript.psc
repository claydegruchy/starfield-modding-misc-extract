ScriptName JetSlowTimeScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property UIJet Auto Const mandatory
Keyword Property PlayerConsumeJet Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:4
  UIJet.play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:5
  PlayerREF.SayCustom(PlayerConsumeJet, None, False, None) ; #DEBUG_LINE_NO:6
EndEvent
