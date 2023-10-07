ScriptName RL002PheremoneScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionName Auto Const mandatory
Float Property duration Auto Const
ImageSpaceModifier Property ImageSpaceEnd Auto Const
ImageSpaceModifier Property ImageSpaceStart Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.AddToFaction(FactionName) ; #DEBUG_LINE_NO:8
  akCaster.StopCombat() ; #DEBUG_LINE_NO:9
  ImageSpaceStart.Apply(1.0) ; #DEBUG_LINE_NO:12
  Utility.Wait(15.0) ; #DEBUG_LINE_NO:14
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:20
  ImageSpaceStart.Remove() ; #DEBUG_LINE_NO:24
  ImageSpaceEnd.Apply(1.0) ; #DEBUG_LINE_NO:25
  akCaster.RemoveFromFaction(FactionName) ; #DEBUG_LINE_NO:26
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  akCaster.RemoveFromFaction(FactionName) ; #DEBUG_LINE_NO:33
EndEvent
