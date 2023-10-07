ScriptName PsychoMagicEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PlayerConsumePsycho Auto mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:6
  If akTarget == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:7
    PlayerREF.SayCustom(PlayerConsumePsycho, None, False, None) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
