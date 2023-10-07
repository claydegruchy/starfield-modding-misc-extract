ScriptName TestPredatorFeedPackageScript Extends Package
{ testing resetting package when entering combat }

;-- Variables ---------------------------------------
Actor combatTarget

;-- Functions ---------------------------------------

Event OnStart(Actor akActor)
  Self.RegisterForRemoteEvent(akActor as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:7
EndEvent

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1 && (akTarget != combatTarget as ObjectReference) ; #DEBUG_LINE_NO:12
    combatTarget = akTarget as Actor ; #DEBUG_LINE_NO:14
    akSource.EvaluatePackage(True) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
