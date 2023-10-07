ScriptName DefaultCollectionAliasRespawnScript Extends RefCollectionAlias default
{ Script for respawning this collection alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property RespawningOn = True Auto
  { Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE }
EndGroup


;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If RespawningOn ; #DEBUG_LINE_NO:12
    defaultquestrespawnscript myQuest = Self.GetOwningQuest() as defaultquestrespawnscript ; #DEBUG_LINE_NO:13
    If myQuest ; #DEBUG_LINE_NO:14
      myQuest.TryToRespawnCollection(Self as RefCollectionAlias, akSenderRef as Actor) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
