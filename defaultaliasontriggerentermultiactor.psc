ScriptName DefaultAliasOnTriggerEnterMultiActor Extends DefaultAlias conditional default
{ Default script that sets a stage once all of the specified actors are in a trigger.

NOT YET FULLY REIMPLEMENTED.
It will test for stages but not other criteria.
Sorry for the inconvenience.
`Jira 301895: Default Script: fully implement DefaultAliasOnTriggerEnterMultiActor `
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :) }

;-- Variables ---------------------------------------
Bool lock_CheckTargets

;-- Properties --------------------------------------
Group Required_Properties
  ReferenceAlias[] Property TriggerAliases Auto Const mandatory
  { Ref Aliases the trigger is looking for. All of these actors must be in the trigger in order to set the stage. }
EndGroup

Group Optional_Properties
  Bool Property DisableWhenTriggered = True Auto Const
  { Delete this trigger once triggered. }
EndGroup

Bool Property AllTargetsInTrigger = False Auto conditional hidden

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference triggerRef)
  If commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0 ; #DEBUG_LINE_NO:33
    Self.CheckForTargetsInTrigger() ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference triggerRef)
  If commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0 ; #DEBUG_LINE_NO:39
    Self.CheckForTargetsInTrigger() ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForTargetsInTrigger()
  While lock_CheckTargets ; #DEBUG_LINE_NO:
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:48
  EndWhile ; #DEBUG_LINE_NO:
  lock_CheckTargets = True ; #DEBUG_LINE_NO:50
  Bool oldAllTargetsInTrigger = AllTargetsInTrigger ; #DEBUG_LINE_NO:53
  AllTargetsInTrigger = Self.AreAllTargetsInTrigger() ; #DEBUG_LINE_NO:54
  If AllTargetsInTrigger ; #DEBUG_LINE_NO:57
    defaultscriptfunctions.TryToSetStage(Self as ScriptObject, ShowTraces, Self.GetOwningQuest(), StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None) ; #DEBUG_LINE_NO:59,62
    If DisableWhenTriggered ; #DEBUG_LINE_NO:85
      Self.TryToDisable() ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If oldAllTargetsInTrigger != AllTargetsInTrigger ; #DEBUG_LINE_NO:91
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:92
    akArgs[0] = AllTargetsInTrigger as Var ; #DEBUG_LINE_NO:93
    Self.SendCustomEvent("defaultaliasontriggerentermultiactor_MultiActorTriggerReady", akArgs) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
  lock_CheckTargets = False ; #DEBUG_LINE_NO:97
EndFunction

Bool Function AreAllTargetsInTrigger()
  ObjectReference[] triggerRefs = new ObjectReference[TriggerAliases.Length] ; #DEBUG_LINE_NO:101
  Int I = 0 ; #DEBUG_LINE_NO:102
  While I < TriggerAliases.Length ; #DEBUG_LINE_NO:103
    triggerRefs[I] = TriggerAliases[I].GetRef() ; #DEBUG_LINE_NO:104
    I += 1 ; #DEBUG_LINE_NO:105
  EndWhile ; #DEBUG_LINE_NO:
  Return Self.GetRef().AreAllInTrigger(triggerRefs) ; #DEBUG_LINE_NO:108
EndFunction
