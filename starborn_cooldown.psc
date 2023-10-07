ScriptName Starborn_Cooldown Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property CooldownGroup Auto Const mandatory
Int Property CooldownValue Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.SetValue(CooldownGroup, CooldownValue as Float) ; #DEBUG_LINE_NO:9
EndEvent
