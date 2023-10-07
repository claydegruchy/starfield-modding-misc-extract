ScriptName SQ_ShipRespawnScript Extends Quest

;-- Variables ---------------------------------------
Int respawnAliasTimerID = 1 Const
ReferenceAlias[] respawnAliases
Int respawnShipTimerID = 2 Const
spaceshipreference[] respawnShips

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard respawnArrayGuard

;-- Properties --------------------------------------
ReferenceAlias Property ShipRespawnPoint Auto Const mandatory
{ where to respawn ships }
RefCollectionAlias Property ShipRespawnCollection Auto Const
{ OPTIONAL - if respawning ships in a ref collection }
Float Property respawnTimeSeconds = 120.0 Auto Const
{ how long between respawn tries }
ActorValue Property SpaceshipCrew Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:24
    respawnAliases = new ReferenceAlias[0] ; #DEBUG_LINE_NO:25
    respawnShips = new spaceshipreference[0] ; #DEBUG_LINE_NO:26
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function HandleShipDeath(ReferenceAlias shipAlias)
  If Self.AllowRespawn() ; #DEBUG_LINE_NO:32
    Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:34
      Self.RespawnShip(shipAlias.GetShipRef(), shipAlias) ; #DEBUG_LINE_NO:35
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.AddToRespawnArray(shipAlias) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleShipDeathCollection(spaceshipreference shipRef)
  If Self.AllowRespawn() ; #DEBUG_LINE_NO:45
    Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:47
      Self.RespawnShip(shipRef, None) ; #DEBUG_LINE_NO:48
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.AddToRespawnShipArray(shipRef) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function AllowRespawn()
  Bool bAllowRespawn = False ; #DEBUG_LINE_NO:57
  ObjectReference respawnMarker = ShipRespawnPoint.GetRef() ; #DEBUG_LINE_NO:58
  If respawnMarker ; #DEBUG_LINE_NO:59
    planet respawnPlanet = respawnMarker.GetCurrentPlanet() ; #DEBUG_LINE_NO:61
    spaceshipreference playerShipRef = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:63
    If playerShipRef == None || playerShipRef.IsInSpace() == False || playerShipRef.GetCurrentPlanet() != respawnPlanet ; #DEBUG_LINE_NO:64
      bAllowRespawn = True ; #DEBUG_LINE_NO:65
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bAllowRespawn ; #DEBUG_LINE_NO:71
EndFunction

Function RespawnShip(spaceshipreference shipRef, ReferenceAlias shipAlias)
  ObjectReference respawnMarker = ShipRespawnPoint.GetRef() ; #DEBUG_LINE_NO:76
  If respawnMarker as Bool && shipRef as Bool ; #DEBUG_LINE_NO:78
    spaceshipbase baseShip = shipRef.GetBaseObject() as spaceshipbase ; #DEBUG_LINE_NO:80
    If baseShip ; #DEBUG_LINE_NO:82
      spaceshipreference newShipRef = respawnMarker.PlaceShipAtMe(baseShip as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:83
      If shipAlias ; #DEBUG_LINE_NO:84
        shipAlias.ForceRefTo(newShipRef as ObjectReference) ; #DEBUG_LINE_NO:85
      Else ; #DEBUG_LINE_NO:
        ShipRespawnCollection.RemoveRef(shipRef as ObjectReference) ; #DEBUG_LINE_NO:87
        ShipRespawnCollection.AddRef(newShipRef as ObjectReference) ; #DEBUG_LINE_NO:88
      EndIf ; #DEBUG_LINE_NO:
      Int index = respawnAliases.find(shipAlias, 0) ; #DEBUG_LINE_NO:91
      If index > -1 ; #DEBUG_LINE_NO:92
        respawnAliases.remove(index, 1) ; #DEBUG_LINE_NO:93
      EndIf ; #DEBUG_LINE_NO:
      index = respawnShips.find(shipRef, 0) ; #DEBUG_LINE_NO:96
      If index > -1 ; #DEBUG_LINE_NO:97
        respawnShips.remove(index, 1) ; #DEBUG_LINE_NO:98
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AddToRespawnArray(ReferenceAlias shipAlias)
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:110
    If respawnAliases.find(shipAlias, 0) < 0 ; #DEBUG_LINE_NO:112
      respawnAliases.add(shipAlias, 1) ; #DEBUG_LINE_NO:113
      Self.StartTimer(respawnTimeSeconds, respawnAliasTimerID) ; #DEBUG_LINE_NO:114
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function AddToRespawnShipArray(spaceshipreference shipRef)
  Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:121
    If respawnShips.find(shipRef, 0) < 0 ; #DEBUG_LINE_NO:123
      respawnShips.add(shipRef, 1) ; #DEBUG_LINE_NO:124
      Self.StartTimer(respawnTimeSeconds, respawnShipTimerID) ; #DEBUG_LINE_NO:125
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == respawnAliasTimerID || aiTimerID == respawnShipTimerID ; #DEBUG_LINE_NO:132
    If Self.AllowRespawn() ; #DEBUG_LINE_NO:133
      Guard respawnArrayGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:134
        If aiTimerID == respawnAliasTimerID ; #DEBUG_LINE_NO:135
          Int I = respawnAliases.Length - 1 ; #DEBUG_LINE_NO:137
          While I > -1 ; #DEBUG_LINE_NO:138
            Self.RespawnShip(respawnAliases[I].GetShipRef(), respawnAliases[I]) ; #DEBUG_LINE_NO:139
            I -= 1 ; #DEBUG_LINE_NO:140
          EndWhile ; #DEBUG_LINE_NO:
        ElseIf aiTimerID == respawnShipTimerID ; #DEBUG_LINE_NO:142
          Int i = respawnShips.Length - 1 ; #DEBUG_LINE_NO:144
          While i > -1 ; #DEBUG_LINE_NO:145
            Self.RespawnShip(respawnShips[i], None) ; #DEBUG_LINE_NO:146
            i -= 1 ; #DEBUG_LINE_NO:147
          EndWhile ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(respawnTimeSeconds, aiTimerID) ; #DEBUG_LINE_NO:154
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
