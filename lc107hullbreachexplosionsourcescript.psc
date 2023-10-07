ScriptName LC107HullBreachExplosionSourceScript Extends ObjectReference
{ Script for the Hull Breach Explosion Source Markers in LC107. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RefProperties
  Int Property ExplosionSize = 5 Auto Const
  { Index into LC107's HullBreachExplosions array. }
EndGroup

Group AutofillProperties collapsedonref
  lc107questscript Property LC107 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TriggerBreach()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Function TriggerBreach()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:15
    LC107.TriggerExplosion(ExplosionSize, ExplosionSize, Self as ObjectReference) ; #DEBUG_LINE_NO:16
  EndFunction
EndState
