ScriptName TestAvoidanceChangeAVTimer Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property TestAvoidance_Start Auto Const
ObjectReference Property Pirate Auto Const
ObjectReference Property PatrolMarker Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PatrolMarker.SetPosition(Utility.RandomFloat(1.0, 20.0), Utility.RandomFloat(-34.0, -50.0), -32.0) ; #DEBUG_LINE_NO:8
  Self.StartTimer(Utility.RandomFloat(0.0, 3.0), 0) ; #DEBUG_LINE_NO:9
EndEvent

Event OnTimer(Int aiTimerID)
  (Pirate as Actor).SetValue(TestAvoidance_Start, 1.0) ; #DEBUG_LINE_NO:13
  (Pirate as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:14
EndEvent
