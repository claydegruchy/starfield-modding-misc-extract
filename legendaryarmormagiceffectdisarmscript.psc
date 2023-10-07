ScriptName LegendaryArmorMagicEffectDisarmScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ModLegendaryArmorDisarm Auto Const
{ AUTOFILL }
Spell Property DisarmSpell Auto Const
{ AUTOFILL }
Keyword Property NoDisarm Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget is Actor ; #DEBUG_LINE_NO:12
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget is Actor ; #DEBUG_LINE_NO:19
    Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor.HasKeyword(NoDisarm) ; #DEBUG_LINE_NO:28
    Return  ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  Int dieRoll = Utility.RandomInt(1, 100) ; #DEBUG_LINE_NO:34
  If dieRoll as Float <= akTarget.GetValue(ModLegendaryArmorDisarm) ; #DEBUG_LINE_NO:38
    DisarmSpell.Cast(akTarget, akAggressor) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:44
EndEvent
