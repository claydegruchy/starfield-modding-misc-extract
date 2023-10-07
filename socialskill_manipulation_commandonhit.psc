ScriptName SocialSkill_Manipulation_CommandOnHit Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CharmFaction Auto
Bool Property bMakePlayerTeammate = False Auto
Int Property AllowForTeammate = 0 Auto
Topic Property CombatTopicToSay Auto
GlobalVariable Property WICastNonHostileTimer Auto
GlobalVariable Property GameDaysPassed Auto
Topic Property TopicToSay Auto

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:14
  myTarget.AddToFaction(CharmFaction) ; #DEBUG_LINE_NO:15
  If bMakePlayerTeammate ; #DEBUG_LINE_NO:16
    myTarget.SetPlayerTeammate(True, True, False) ; #DEBUG_LINE_NO:17
    myTarget.SetCanDoCommand(True) ; #DEBUG_LINE_NO:18
    myTarget.SetCommandState(True) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor myTarget = akTarget as Actor ; #DEBUG_LINE_NO:50
  myTarget.RemoveFromFaction(CharmFaction) ; #DEBUG_LINE_NO:51
  If bMakePlayerTeammate ; #DEBUG_LINE_NO:52
    myTarget.SetPlayerTeammate(False, False, False) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent
