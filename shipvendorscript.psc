ScriptName ShipVendorScript Extends Actor conditional

;-- Variables ---------------------------------------
shipvendorlistscript:shiptosell[] ShipsToSellAlways
shipvendorlistscript:shiptosell[] ShipsToSellRandom
shipvendorlistscript:shiptosell[] ShipsToSellUnique
Bool initialized = False
Float lastInventoryRefreshTimestamp
spaceshipreference[] shipsForSale

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard shipsForSaleGuard

;-- Properties --------------------------------------
Keyword Property LinkShipLandingMarker01 Auto Const mandatory
{ link vendor to landing marker }
Keyword Property SpaceshipStoredLink Auto Const mandatory
{ link ships to landing marker }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ The main Player Ship system quest }
Location Property ShipVendorLocation Auto Const
{ OPTIONAL - The location used to spawn vendor ships at for leveling purposes.
    If not filled in, script will use vendor's current location }
shipvendorlistscript Property ShipsToSellListRandomDataset Auto Const
{ The data set for random ships to sell. }
shipvendorlistscript Property ShipsToSellListAlwaysDataset Auto Const
{ The data set for ships that should always be available for sale. }
shipvendorlistscript Property ShipsToSellListUniqueDataset Auto Const
{ The data set for unique ships to make available for sale. (Never respawns) }
Int Property ShipsForSaleMin = 4 Auto Const
{ NOTE: if these are 0, the only ships for sale will be from ShipsToSellListAlwaysDataset }
Int Property ShipsForSaleMax = 8 Auto Const
ObjectReference Property myLandingMarker Auto hidden
{ landing marker, set by OnInit }
RefCollectionAlias Property PlayerShips Auto Const mandatory
{ from SQ_Playership - need to know when player sells ships }
Float Property DaysUntilInventoryRefresh = 7.0 Auto Const
{ how many days until next inventory refresh? }
Bool Property BuysShips = True Auto conditional
Bool Property SellsShips = True Auto conditional
Bool Property InitializeOnLoad = True Auto Const
{ if false, Initialize() needs to be called manually (e.g. for outpost ship vendor) }

;-- Functions ---------------------------------------

Function TestLinkedRefChildren(ObjectReference refToCheck, Keyword theKeyword)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  Self.HandleOnLoad() ; #DEBUG_LINE_NO:59
EndEvent

Function Initialize(ObjectReference landingMarkerRef)
  If initialized == False ; #DEBUG_LINE_NO:64
    ShipsToSellRandom = Self.CopyShipToSellArray(ShipsToSellListRandomDataset.ShipList) ; #DEBUG_LINE_NO:66
    ShipsToSellAlways = Self.CopyShipToSellArray(ShipsToSellListAlwaysDataset.ShipList) ; #DEBUG_LINE_NO:67
    ShipsToSellUnique = Self.CopyShipToSellArray(ShipsToSellListUniqueDataset.ShipList) ; #DEBUG_LINE_NO:68
    Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:70
      myLandingMarker = landingMarkerRef ; #DEBUG_LINE_NO:71
      shipsForSale = new spaceshipreference[0] ; #DEBUG_LINE_NO:73
      initialized = True ; #DEBUG_LINE_NO:74
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    Self.CheckForInventoryRefresh(False) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndFunction

shipvendorlistscript:shiptosell[] Function CopyShipToSellArray(shipvendorlistscript:shiptosell[] arrayToCopy)
  shipvendorlistscript:shiptosell[] myShipsToSell = new shipvendorlistscript:shiptosell[arrayToCopy.Length] ; #DEBUG_LINE_NO:81
  Int I = 0 ; #DEBUG_LINE_NO:82
  While I < arrayToCopy.Length ; #DEBUG_LINE_NO:83
    myShipsToSell[I] = arrayToCopy[I] ; #DEBUG_LINE_NO:84
    I += 1 ; #DEBUG_LINE_NO:85
  EndWhile ; #DEBUG_LINE_NO:
  Return myShipsToSell ; #DEBUG_LINE_NO:87
EndFunction

Function HandleOnLoad()
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnShipSold") ; #DEBUG_LINE_NO:92
  If initialized == False && InitializeOnLoad ; #DEBUG_LINE_NO:93
    myLandingMarker = Self.GetLinkedRef(LinkShipLandingMarker01) ; #DEBUG_LINE_NO:94
    Self.Initialize(myLandingMarker) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  If initialized ; #DEBUG_LINE_NO:97
    Self.CheckForInventoryRefresh(False) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event RefCollectionAlias.OnShipSold(RefCollectionAlias akSender, ObjectReference akSenderRef)
  spaceshipreference soldShip = akSenderRef as spaceshipreference ; #DEBUG_LINE_NO:109
  If soldShip as Bool && soldShip.GetLinkedRef(SpaceshipStoredLink) == myLandingMarker ; #DEBUG_LINE_NO:110
    Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:111
      shipsForSale.add(soldShip, 1) ; #DEBUG_LINE_NO:112
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipBought(spaceshipreference akSenderRef)
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:119
    Int shipsForSaleIndex = shipsForSale.find(akSenderRef, 0) ; #DEBUG_LINE_NO:120
    If shipsForSaleIndex > -1 ; #DEBUG_LINE_NO:121
      shipsForSale.remove(shipsForSaleIndex, 1) ; #DEBUG_LINE_NO:122
      If ShipsToSellUnique.Length > 0 ; #DEBUG_LINE_NO:124
        leveledspaceshipbase soldLeveledSpaceshipBase = akSenderRef.GetBaseObject() as leveledspaceshipbase ; #DEBUG_LINE_NO:125
        Int uniqueIndex = ShipsToSellUnique.findstruct("leveledShip", soldLeveledSpaceshipBase, 0) ; #DEBUG_LINE_NO:127
        If uniqueIndex > -1 ; #DEBUG_LINE_NO:128
          ShipsToSellUnique.remove(uniqueIndex, 1) ; #DEBUG_LINE_NO:130
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Function CheckForInventoryRefresh(Bool bForceRefresh)
  If SellsShips ; #DEBUG_LINE_NO:138
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:139
    Float nextRefreshTime = lastInventoryRefreshTimestamp + DaysUntilInventoryRefresh ; #DEBUG_LINE_NO:140
    If bForceRefresh || lastInventoryRefreshTimestamp == 0.0 || currentGameTime >= nextRefreshTime ; #DEBUG_LINE_NO:142
      Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:145
        Self.RefreshInventoryList(myLandingMarker, shipsForSale) ; #DEBUG_LINE_NO:146
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RefreshInventoryList(ObjectReference createMarker, spaceshipreference[] ShipList)
  If createMarker ; #DEBUG_LINE_NO:155
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:156
    Int playerLevel = playerRef.GetLevel() ; #DEBUG_LINE_NO:157
    Int i = ShipList.Length - 1 ; #DEBUG_LINE_NO:160
    While i > -1 ; #DEBUG_LINE_NO:161
      spaceshipreference theShip = ShipList[i] ; #DEBUG_LINE_NO:162
      theShip.Delete() ; #DEBUG_LINE_NO:163
      i += -1 ; #DEBUG_LINE_NO:164
    EndWhile ; #DEBUG_LINE_NO:
    ShipList.clear() ; #DEBUG_LINE_NO:166
    Int totalShipsToCreateCount = Utility.RandomInt(ShipsForSaleMin, ShipsForSaleMax) ; #DEBUG_LINE_NO:169
    Int nonRandomShipsToCreateCount = ShipsToSellAlways.Length + ShipsToSellUnique.Length ; #DEBUG_LINE_NO:170
    If totalShipsToCreateCount < nonRandomShipsToCreateCount ; #DEBUG_LINE_NO:171
      totalShipsToCreateCount = nonRandomShipsToCreateCount ; #DEBUG_LINE_NO:172
    EndIf ; #DEBUG_LINE_NO:
    Int randomShipsToCreateCount = totalShipsToCreateCount - nonRandomShipsToCreateCount ; #DEBUG_LINE_NO:174
    Self.CreateShipsForSale(ShipsToSellAlways, playerLevel, createMarker, ShipList) ; #DEBUG_LINE_NO:179
    If randomShipsToCreateCount > 0 ; #DEBUG_LINE_NO:182
      shipvendorlistscript:shiptosell[] currentShipsRandom = new shipvendorlistscript:shiptosell[0] ; #DEBUG_LINE_NO:184
      Int currentShipsRandomIndex = 0 ; #DEBUG_LINE_NO:185
      While currentShipsRandomIndex < ShipsToSellRandom.Length ; #DEBUG_LINE_NO:186
        shipvendorlistscript:shiptosell theShipToSell = ShipsToSellRandom[currentShipsRandomIndex] ; #DEBUG_LINE_NO:187
        If theShipToSell.minLevel <= playerLevel && ShipsToSellAlways.findstruct("leveledShip", theShipToSell.leveledShip, 0) == -1 && ShipsToSellUnique.findstruct("leveledShip", theShipToSell.leveledShip, 0) == -1 ; #DEBUG_LINE_NO:188
          currentShipsRandom.add(ShipsToSellRandom[currentShipsRandomIndex], 1) ; #DEBUG_LINE_NO:189
        EndIf ; #DEBUG_LINE_NO:
        currentShipsRandomIndex += 1 ; #DEBUG_LINE_NO:191
      EndWhile ; #DEBUG_LINE_NO:
      i = 0 ; #DEBUG_LINE_NO:195
      While i < randomShipsToCreateCount && currentShipsRandom.Length > 0 ; #DEBUG_LINE_NO:196
        Int randomIndex = Utility.RandomInt(0, currentShipsRandom.Length - 1) ; #DEBUG_LINE_NO:197
        Self.CreateShipForSale(currentShipsRandom[randomIndex].leveledShip, createMarker, ShipList) ; #DEBUG_LINE_NO:198
        currentShipsRandom.remove(randomIndex, 1) ; #DEBUG_LINE_NO:201
        i += 1 ; #DEBUG_LINE_NO:202
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.CreateShipsForSale(ShipsToSellUnique, playerLevel, createMarker, ShipList) ; #DEBUG_LINE_NO:208
    lastInventoryRefreshTimestamp = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:215
  While I < ShipList.Length ; #DEBUG_LINE_NO:216
    I += 1 ; #DEBUG_LINE_NO:218
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CreateShipsForSale(shipvendorlistscript:shiptosell[] shipToSellList, Int playerLevel, ObjectReference createMarker, spaceshipreference[] ShipList)
  Int I = 0 ; #DEBUG_LINE_NO:223
  If shipToSellList.Length > 0 ; #DEBUG_LINE_NO:224
    While I < shipToSellList.Length ; #DEBUG_LINE_NO:225
      shipvendorlistscript:shiptosell theShipToSell = shipToSellList[I] ; #DEBUG_LINE_NO:226
      If playerLevel >= theShipToSell.minLevel ; #DEBUG_LINE_NO:227
        Self.CreateShipForSale(theShipToSell.leveledShip, createMarker, ShipList) ; #DEBUG_LINE_NO:228
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:233
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CreateShipForSale(leveledspaceshipbase leveledShipToCreate, ObjectReference landingMarker, spaceshipreference[] ShipList)
  ObjectReference createMarker = landingMarker ; #DEBUG_LINE_NO:240
  spaceshipreference landingMarkerShipRef = landingMarker.GetCurrentShipRef() ; #DEBUG_LINE_NO:242
  If landingMarkerShipRef ; #DEBUG_LINE_NO:243
    createMarker = landingMarkerShipRef as ObjectReference ; #DEBUG_LINE_NO:245
  EndIf ; #DEBUG_LINE_NO:
  Location encounterLocation = ShipVendorLocation ; #DEBUG_LINE_NO:249
  If encounterLocation == None ; #DEBUG_LINE_NO:250
    encounterLocation = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:251
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference newShip = createMarker.PlaceShipAtMe(leveledShipToCreate as Form, 2, True, False, True, True, None, None, encounterLocation, True) ; #DEBUG_LINE_NO:253
  If newShip ; #DEBUG_LINE_NO:254
    ShipList.add(newShip, 1) ; #DEBUG_LINE_NO:255
    newShip.SetLinkedRef(landingMarker, SpaceshipStoredLink, True) ; #DEBUG_LINE_NO:257
    newShip.SetActorRefOwner(Self as Actor, False) ; #DEBUG_LINE_NO:259
    Self.RegisterForRemoteEvent(newShip as ScriptObject, "OnShipBought") ; #DEBUG_LINE_NO:261
    newShip.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
EndFunction

spaceshipreference Function GetShipForSale(Int index)
  spaceshipreference shipforSale = None ; #DEBUG_LINE_NO:272
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:273
    If shipsForSale.Length > 0 ; #DEBUG_LINE_NO:274
      If index > -1 && index < shipsForSale.Length ; #DEBUG_LINE_NO:275
        shipforSale = shipsForSale[index] ; #DEBUG_LINE_NO:276
      ElseIf index >= shipsForSale.Length ; #DEBUG_LINE_NO:277
        shipforSale = shipsForSale[shipsForSale.Length - 1] ; #DEBUG_LINE_NO:278
      Else ; #DEBUG_LINE_NO:
        shipforSale = shipsForSale[0] ; #DEBUG_LINE_NO:280
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Return shipforSale ; #DEBUG_LINE_NO:285
EndFunction

Function TestShowHangarMenu()
  myLandingMarker.ShowHangarMenu(0, Self as Actor, None, False) ; #DEBUG_LINE_NO:289
EndFunction

Function TestOutputShipsForSale()
  Guard shipsForSaleGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:293
    Int I = 0 ; #DEBUG_LINE_NO:295
    While I < shipsForSale.Length ; #DEBUG_LINE_NO:296
      spaceshipreference theShip = shipsForSale[I] ; #DEBUG_LINE_NO:297
      I += 1 ; #DEBUG_LINE_NO:299
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
