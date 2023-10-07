ScriptName TestSteveCPerkEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TestSteveCDamagePerk_Immune Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  (akTarget as spaceshipreference).AddPerk(TestSteveCDamagePerk_Immune, False) ; #DEBUG_LINE_NO:7
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  (akTarget as spaceshipreference).RemovePerk(TestSteveCDamagePerk_Immune) ; #DEBUG_LINE_NO:12
EndEvent
