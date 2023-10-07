ScriptName ArtifactPower_Advancement Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PowerPerk Auto Const mandatory
Spell Property PowerSpell Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:12
  PlayerREF.RemoveSpell(PowerSpell) ; #DEBUG_LINE_NO:14
  PlayerREF.AddPerk(PowerPerk, False) ; #DEBUG_LINE_NO:15
  PlayerREF.AddSpell(PowerSpell, False) ; #DEBUG_LINE_NO:16
EndEvent
