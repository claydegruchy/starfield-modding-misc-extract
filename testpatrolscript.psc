ScriptName TestPatrolScript Extends ObjectReference

;-- Variables ---------------------------------------
Int currentPatrolPoint

;-- Properties --------------------------------------
Float Property Speed Auto Const
ObjectReference[] Property PatrolMarkers Auto Const mandatory
Float Property SplineMagnitude Auto Const
Float Property TurnSpeed = 10.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  currentPatrolPoint = 0 ; #DEBUG_LINE_NO:6
  Self.SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], 200.0, Speed, 10.0) ; #DEBUG_LINE_NO:7
EndEvent

Event OnTranslationAlmostComplete()
  currentPatrolPoint += 1 ; #DEBUG_LINE_NO:11
  If currentPatrolPoint >= PatrolMarkers.Length ; #DEBUG_LINE_NO:12
    currentPatrolPoint = 0 ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Self.SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], SplineMagnitude, Speed, TurnSpeed) ; #DEBUG_LINE_NO:15
EndEvent
