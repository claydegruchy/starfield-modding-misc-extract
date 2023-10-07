ScriptName CityCYRedTape02ShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  spaceshipreference myHurstShip = Self.GetShipReference() ; #DEBUG_LINE_NO:7
  myHurstShip.EnablePartRepair(ShipSystemEngineHealth, False) ; #DEBUG_LINE_NO:8
  myHurstShip.DamageValue(ShipSystemEngineHealth, 100000.0) ; #DEBUG_LINE_NO:9
  myHurstShip.DamageValue(ShipSystemGravDriveHealth, 100000.0) ; #DEBUG_LINE_NO:10
EndEvent
