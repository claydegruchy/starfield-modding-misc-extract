ScriptName DialogueShipServicesScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }
GlobalVariable Property ShipServicesFuelCurrent Auto Const mandatory
{ will be current fuel on player's ship }
GlobalVariable Property ShipServicesFuelAmount Auto Const mandatory
{ will be amount of fuel player needs to buy to top up }
GlobalVariable Property ShipServicesFuelCost Auto Const mandatory
{ will be cost of fuel amount needed }
ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
{ AV on ship that tracks fuel amount/capacity }
MiscObject Property InorgCommonHelium3 Auto Const mandatory
{ use to get price }
Float Property FuelCostMult = 1.0 Auto Const
{ multiplier on base value of He3 }
ActorValue Property Health Auto Const mandatory
{ autofill }
GlobalVariable Property ShipServicesRepairCost Auto Const mandatory
{ will be cost to fully repair ship }

;-- Functions ---------------------------------------

Function UpdateFuelGlobals()
  Float fuelCostPerUnit = InorgCommonHelium3.GetGoldValue() as Float ; #DEBUG_LINE_NO:33
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:37
  Float fuelCurrent = 0.0 ; #DEBUG_LINE_NO:38
  Float fuelAmount = 0.0 ; #DEBUG_LINE_NO:39
  Float fuelCost = 0.0 ; #DEBUG_LINE_NO:40
  If playerShipRef ; #DEBUG_LINE_NO:42
    fuelCurrent = playerShipRef.GetValue(SpaceshipGravJumpFuel) ; #DEBUG_LINE_NO:43
    fuelAmount = playerShipRef.GetBaseValue(SpaceshipGravJumpFuel) - fuelCurrent ; #DEBUG_LINE_NO:44
    fuelCost = Math.Round(fuelAmount * fuelCostPerUnit) as Float ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  ShipServicesFuelCurrent.SetValue(fuelCurrent) ; #DEBUG_LINE_NO:48
  ShipServicesFuelAmount.SetValue(fuelAmount) ; #DEBUG_LINE_NO:49
  ShipServicesFuelCost.SetValue(fuelCost) ; #DEBUG_LINE_NO:50
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelCurrent) ; #DEBUG_LINE_NO:51
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelAmount) ; #DEBUG_LINE_NO:52
  Self.UpdateCurrentInstanceGlobal(ShipServicesFuelCost) ; #DEBUG_LINE_NO:53
EndFunction

Function RefuelPlayerShip()
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:57
  If playerShipRef ; #DEBUG_LINE_NO:58
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, ShipServicesFuelCost.GetValueInt(), False, None) ; #DEBUG_LINE_NO:60
    playerShipRef.RestoreValue(SpaceshipGravJumpFuel, ShipServicesFuelAmount.GetValue()) ; #DEBUG_LINE_NO:62
    Self.UpdateFuelGlobals() ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RepairPlayerShip()
  spaceshipreference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:69
  If playerShipRef ; #DEBUG_LINE_NO:70
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, ShipServicesRepairCost.GetValueInt(), False, None) ; #DEBUG_LINE_NO:72
    playerShipRef.RestoreValue(Health, 99999.0) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndFunction
