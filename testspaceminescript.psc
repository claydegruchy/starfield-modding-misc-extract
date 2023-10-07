ScriptName TestSpaceMineScript Extends SpaceshipReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property SpaceMineExplosion01 Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForDistanceLessThanEvent(PlayerShip as ScriptObject, Self as ScriptObject, 75.0, 0) ; #DEBUG_LINE_NO:8
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.Kill(None) ; #DEBUG_LINE_NO:13
EndEvent
