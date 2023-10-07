ScriptName SY_TestPilot01_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PrototypeShip Auto Const
ActorValue Property SpaceshipEnginePartMaxForwardSpeed Auto Const mandatory
ActorValue Property SpaceshipEngineHealth Auto Const mandatory

;-- Functions ---------------------------------------

Function ChangeShipSpeed(Float fNewSpeed)
  spaceshipreference sPrototypeShip = PrototypeShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:9
  sPrototypeShip.SetValue(SpaceshipEnginePartMaxForwardSpeed, fNewSpeed) ; #DEBUG_LINE_NO:10
EndFunction
