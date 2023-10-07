ScriptName TestLinkedRefPatrolScript Extends Actor

;-- Variables ---------------------------------------
ObjectReference currentPoint

;-- Properties --------------------------------------
Float Property Speed = 500.0 Auto Const
Float Property SplineMagnitude = 100.0 Auto Const
Float Property TurnSpeed = 10.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.SetMotionType(Self.Motion_Keyframed, True) ; #DEBUG_LINE_NO:10
  currentPoint = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:11
  Self.SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed) ; #DEBUG_LINE_NO:12
EndEvent

Event OnTranslationAlmostComplete()
  currentPoint = currentPoint.GetLinkedRef(None) ; #DEBUG_LINE_NO:16
  Self.SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed) ; #DEBUG_LINE_NO:17
EndEvent
