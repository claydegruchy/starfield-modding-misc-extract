ScriptName LegendaryOnHitCrippleScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CrippleChance = 20 Auto Const
{ % Chance to cripple a leg on hit }
ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int roll = Utility.RandomInt(1, 100) ; #DEBUG_LINE_NO:12
  Int coinFlip = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:13
  If roll <= CrippleChance ; #DEBUG_LINE_NO:17
    If coinFlip == 1 ; #DEBUG_LINE_NO:18
      akTarget.DamageValue(LeftMobilityCondition, 99999.0) ; #DEBUG_LINE_NO:19
    Else ; #DEBUG_LINE_NO:
      akTarget.DamageValue(RightMobilityCondition, 99999.0) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
