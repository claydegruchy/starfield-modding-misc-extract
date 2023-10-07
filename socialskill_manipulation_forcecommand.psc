ScriptName SocialSkill_Manipulation_ForceCommand Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:6
  myTarget.AddToFaction(CharmFaction) ; #DEBUG_LINE_NO:7
  myTarget.SetCanDoCommand(True) ; #DEBUG_LINE_NO:8
  myTarget.SetCommandState(True) ; #DEBUG_LINE_NO:9
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:13
  myTarget.RemoveFromFaction(CharmFaction) ; #DEBUG_LINE_NO:14
  myTarget.SetCanDoCommand(False) ; #DEBUG_LINE_NO:15
  myTarget.SetCommandState(False) ; #DEBUG_LINE_NO:16
EndEvent
