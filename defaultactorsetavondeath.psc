ScriptName DefaultActorSetAVOnDeath Extends Actor Const default
{ Default script used to set an actor value when the actor is killed. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property AVToSet Auto Const mandatory
  { Actor value to set when this actor is killed. }
EndGroup

Group Optional_Properties
  Bool Property SetAVOnKiller = True Auto Const
  { If TRUE, AVToSet will be set on the killer of the actor. If False, it will be set on the dead actor. }
  Bool Property UseOnDying = False Auto Const
  { If TRUE, use the "OnDying" event instead of "OnDeath". }
  Float Property AVNewValue = 1.0 Auto Const
  { Value to set AVToSet to when this actor is killed. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  If !UseOnDying ; #DEBUG_LINE_NO:27
    Self.ProcessDeathEvent(akKiller) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  If UseOnDying ; #DEBUG_LINE_NO:33
    Self.ProcessDeathEvent(akKiller) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProcessDeathEvent(ObjectReference akKiller)
  Actor AVTarget = None ; #DEBUG_LINE_NO:39
  If SetAVOnKiller ; #DEBUG_LINE_NO:40
    AVTarget = akKiller as Actor ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    AVTarget = Self as Actor ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  If AVTarget != None ; #DEBUG_LINE_NO:45
    AVTarget.SetValue(AVToSet, AVNewValue) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndFunction
