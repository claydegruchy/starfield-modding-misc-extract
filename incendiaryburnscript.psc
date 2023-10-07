ScriptName IncendiaryBurnSCRIPT Extends ActiveMagicEffect
{ If hit with enough incendiaty ammo over a period of time you will burn }

;-- Variables ---------------------------------------
Int bulletTimer = 10
Actor victim

;-- Properties --------------------------------------
ActorValue Property Incendiary Auto
Keyword Property IncendiaryState01 Auto
Keyword Property IncendiaryState02 Auto
Bool Property RANK2 = False Auto
{ Should we apply the burn effect? }
Spell Property pCryoFreezeSpell Auto
{ The Cryo freeze spell }
Float Property ShaderDuration = 10.0 Auto
{ shatter shader duration }
Keyword Property pOnFireState Auto
{ on fire property }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  victim = akTarget as Actor ; #DEBUG_LINE_NO:32
  If victim ; #DEBUG_LINE_NO:33
    If !RANK2 && victim.getValue(Incendiary) < 5.0 ; #DEBUG_LINE_NO:36
      victim.modValue(Incendiary, 1.0) ; #DEBUG_LINE_NO:39
      Self.startTimer(1.0, bulletTimer) ; #DEBUG_LINE_NO:40
    ElseIf RANK2 && victim.getValue(Incendiary) >= 5.0 ; #DEBUG_LINE_NO:42
      victim.addKeyword(pOnFireState) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == bulletTimer ; #DEBUG_LINE_NO:53
    If !RANK2 && victim.getValue(Incendiary) < 5.0 ; #DEBUG_LINE_NO:56
      victim.damageValue(Incendiary, victim.getValue(Incendiary)) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If victim as Bool && RANK2 ; #DEBUG_LINE_NO:67
    victim.damageValue(Incendiary, victim.getValue(Incendiary) - 3.0) ; #DEBUG_LINE_NO:70
    victim.removeKeyword(pOnFireState) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndEvent
