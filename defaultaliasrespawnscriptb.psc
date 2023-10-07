ScriptName defaultAliasRespawnScriptB Extends ReferenceAlias default
{ Script for respawning this alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property RespawningOn = True Auto
  { Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE }
EndGroup


;-- Functions ---------------------------------------

Function RespawnIfDead()
  If Self.GetActorRef().IsDead() ; #DEBUG_LINE_NO:12
    defaultquestrespawnscript myQuest = (Self.GetOwningQuest() as defaultquestrespawnscriptb) as defaultquestrespawnscript ; #DEBUG_LINE_NO:13
    Self.gotoState("respawning") ; #DEBUG_LINE_NO:14
    myQuest.Respawn(Self as ReferenceAlias) ; #DEBUG_LINE_NO:15
    Self.gotoState("normal") ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State normal

  Event OnDeath(ObjectReference akKiller)
    If RespawningOn ; #DEBUG_LINE_NO:27
      defaultquestrespawnscript myQuest = (Self.GetOwningQuest() as defaultquestrespawnscriptb) as defaultquestrespawnscript ; #DEBUG_LINE_NO:28
      Self.gotoState("respawning") ; #DEBUG_LINE_NO:30
      myQuest.TryToRespawn(Self as ReferenceAlias) ; #DEBUG_LINE_NO:32
      Self.gotoState("normal") ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State respawning

  Event OnDeath(ObjectReference akKiller)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
