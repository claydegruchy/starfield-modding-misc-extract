ScriptName SocialSkill_Diplomacy_PacifyOnHit Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto
Int Property AllowForTeammate = 0 Auto
Topic Property CombatTopicToSay Auto
GlobalVariable Property WICastNonHostileTimer Auto
GlobalVariable Property GameDaysPassed Auto
Topic Property TopicToSay Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:13
  myTarget.AddToFaction(CharmFaction) ; #DEBUG_LINE_NO:14
  akCaster.StopCombat() ; #DEBUG_LINE_NO:15
  myTarget.StopCombat() ; #DEBUG_LINE_NO:16
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:45
  myTarget.RemoveFromFaction(CharmFaction) ; #DEBUG_LINE_NO:46
EndEvent
