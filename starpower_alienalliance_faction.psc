ScriptName StarPower_AlienAlliance_Faction Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor target

;-- Properties --------------------------------------
Faction Property PlayerAllyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  target = akTarget as Actor ; #DEBUG_LINE_NO:9
  target.stopcombat() ; #DEBUG_LINE_NO:10
  target.makeplayerfriend() ; #DEBUG_LINE_NO:11
  target.addtofaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:12
EndEvent
