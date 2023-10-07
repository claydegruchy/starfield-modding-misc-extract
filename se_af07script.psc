ScriptName SE_AF07Script Extends Quest

;-- Variables ---------------------------------------
Int currSpawned

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property EnemyShip Auto Const mandatory
spaceshipbase Property LvlShip_Ecliptic_A_Fighter Auto Const mandatory
Scene Property SE_AF07_001_SpawnScene Auto Const mandatory

;-- Functions ---------------------------------------

Function StartWaves()
  spaceshipreference currShip = EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:11
  currShip.EnableWithGravJump() ; #DEBUG_LINE_NO:12
  SE_AF07_001_SpawnScene.start() ; #DEBUG_LINE_NO:13
  Self.StartTimer(Utility.RandomInt(15, 20) as Float, 0) ; #DEBUG_LINE_NO:14
EndFunction

Event OnTimer(Int aiTimerID)
  spaceshipreference ship = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:22
  spaceshipreference enemyShipRef = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter as Form, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, 4, True, False, False, True, None) ; #DEBUG_LINE_NO:23
  currSpawned += 1 ; #DEBUG_LINE_NO:24
  spaceshipreference enemyShipRef02 = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter as Form, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, 4, True, False, False, True, None) ; #DEBUG_LINE_NO:25
EndEvent
