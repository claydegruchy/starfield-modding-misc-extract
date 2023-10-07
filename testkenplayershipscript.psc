ScriptName TestKenPlayerShipScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShipAlias Auto
ReferenceAlias Property PirateShipAlias Auto
ReferenceAlias Property LandMarkerAlias Auto
Cell Property cellToSpawn Auto Const mandatory

;-- Functions ---------------------------------------

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSender, Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:6
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:7
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:8
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:9
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
  spaceshipreference newShip = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:15
  PlayerShipAlias.ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:17
  Self.RegisterForRemoteEvent(newShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:18
EndEvent

Event Actor.OnEnterShipInterior(Actor akSender, ObjectReference akShip)
  If akShip == Game.GetPlayerHomeSpaceShip() as ObjectReference ; #DEBUG_LINE_NO:23
    PlayerShipAlias.ForceRefTo(akShip) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnShip()
  spaceshipreference playerShipRef = PlayerShipAlias.GetShipRef() ; #DEBUG_LINE_NO:38
  Float[] placePosition = new Float[3] ; #DEBUG_LINE_NO:39
  placePosition[0] = 0.0 ; #DEBUG_LINE_NO:40
  placePosition[1] = 100.0 ; #DEBUG_LINE_NO:41
  placePosition[2] = 0.0 ; #DEBUG_LINE_NO:42
  Form PirateShipBase = Game.GetForm(3718863) ; #DEBUG_LINE_NO:43
  spaceshipreference myNewShip = playerShipRef.PlaceShipAtMe(PirateShipBase, 4, True, False, False, False, placePosition, PirateShipAlias as Alias, None, True) ; #DEBUG_LINE_NO:44
EndFunction

Function SpawnShipOnLand()
  ObjectReference LandMarkerRef = LandMarkerAlias.GetReference() ; #DEBUG_LINE_NO:51
  Float[] placePosition = new Float[3] ; #DEBUG_LINE_NO:52
  placePosition[0] = 0.0 ; #DEBUG_LINE_NO:53
  placePosition[1] = 0.0 ; #DEBUG_LINE_NO:54
  placePosition[2] = 0.0 ; #DEBUG_LINE_NO:55
  Form PirateShipBase = Game.GetForm(260894) ; #DEBUG_LINE_NO:56
  spaceshipreference myNewShip = LandMarkerRef.PlaceShipAtMe(PirateShipBase, 4, True, False, True, False, placePosition, PirateShipAlias as Alias, None, True) ; #DEBUG_LINE_NO:57
EndFunction

Function SpawnCell()
  spaceshipreference playerShipRef = PlayerShipAlias.GetShipRef() ; #DEBUG_LINE_NO:64
  Cell newCell = playerShipRef.PlaceCellAtMe(cellToSpawn, None, False, True, False, None) ; #DEBUG_LINE_NO:65
EndFunction
