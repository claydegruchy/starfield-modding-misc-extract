ScriptName SQ_StationTrafficManagerQuestScript Extends Quest
{ Station Traffic Manager quest script. }

;-- Variables ---------------------------------------
Int CONST_DockingEntryExitDistance = 100 Const
Int CONST_GravJumpExitDistance = 100 Const
Int CONST_InitializationFailsafe = 20 Const
Int CONST_MaxEntryExitZOffset = 1000 Const
Int CONST_MidEntryExitZOffset = 750 Const
Int CONST_MinEntryExitZOffset = 500 Const
Int CONST_NearDistance_Close = 0 Const
Int CONST_NearDistance_Long = 3 Const
Int CONST_NearDistance_Moderate = 2 Const
Int CONST_NearDistance_RandomFar = -3 Const
Int CONST_NearFacing_AwayLarge = 3 Const
Int CONST_NearFacing_AwaySmall = 2 Const
Int CONST_NearFacing_Random = -2 Const
Int CONST_NearFacing_TowardLarge = 1 Const
Int CONST_NearFacing_TowardSmall = 0 Const
Int CONST_NearPosition_Above = 3 Const
Int CONST_NearPosition_Below = 4 Const
Int CONST_NearPosition_DeadAhead = -1 Const
Int CONST_NearPosition_ForwardTight = 0 Const
Int CONST_NearPosition_ForwardWide = 1 Const
Int CONST_NearPosition_Random = -2 Const
Int CONST_PackageValue_Arriving = 4 Const
Int CONST_PackageValue_Departing = 3 Const
Int CONST_PackageValue_Docked = 2 Const
Int CONST_PackageValue_Docking = 1 Const
Int CONST_PackageValue_Patrol = 0 Const
Int CONST_SafeSpawnAttemptsMax = 5 Const
Int CONST_SafeSpawnDistanceFromPlayerShip = 400 Const
Int CONST_SpawningShutdownStage = 20 Const
Float combatTimestampElapsedDelay
GlobalVariable combatTimestampGlobal
Int dockingDelayMax
Int dockingDelayMin
Int initialShips
Int initialShipsMax
Int initialShipsMin
Float lastSpawnTimestamp
Int maxRefreshTime
Int maxShips
Int maxShipsInteractingWithStation
Int minRefreshTime
Int minSpawnDelay
Float percentEasy
Float percentHard
Float percentMedium
Int safeSpawnDistanceFromStation
sq_stationtrafficmanagersettingsscr settingsMarkerRef
spaceshipreference stationRef
Bool trafficManagerActive
Faction[] trafficShipFactions
FormList trafficShipList

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard TrafficManagerGuard

;-- Properties --------------------------------------
Group AutofillProperties
  LocationAlias Property PlayerShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property SettingsMarker Auto Const mandatory
  ReferenceAlias Property Starstation Auto Const mandatory
  RefCollectionAlias Property Ships Auto Const mandatory
  RefCollectionAlias Property StationShips Auto Const mandatory
  RefCollectionAlias Property TrafficShips Auto Const mandatory
  ActorValue Property SQ_TrafficManagerSCPackageValue Auto Const mandatory
  ActorValue Property SQ_TrafficManagerSCTimestampValue Auto Const mandatory
  Keyword Property LinkTrafficSystemStarstation Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitOnStartupStage()
  Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:91
    trafficManagerActive = True ; #DEBUG_LINE_NO:92
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:95
  settingsMarkerRef = SettingsMarker.GetRef() as sq_stationtrafficmanagersettingsscr ; #DEBUG_LINE_NO:97
  stationRef = settingsMarkerRef.GetLinkedRef(LinkTrafficSystemStarstation) as spaceshipreference ; #DEBUG_LINE_NO:98
  Starstation.ForceRefTo(stationRef as ObjectReference) ; #DEBUG_LINE_NO:99
  maxRefreshTime = settingsMarkerRef.maxRefreshTime ; #DEBUG_LINE_NO:101
  minRefreshTime = Math.Max(1.0, Math.Min(settingsMarkerRef.minRefreshTime as Float, maxRefreshTime as Float)) as Int ; #DEBUG_LINE_NO:102
  minSpawnDelay = settingsMarkerRef.minSpawnDelay ; #DEBUG_LINE_NO:103
  percentEasy = settingsMarkerRef.percentEasy ; #DEBUG_LINE_NO:105
  percentMedium = settingsMarkerRef.percentMedium ; #DEBUG_LINE_NO:106
  percentHard = settingsMarkerRef.percentHard ; #DEBUG_LINE_NO:107
  trafficShipList = settingsMarkerRef.trafficShipList ; #DEBUG_LINE_NO:109
  trafficShipFactions = settingsMarkerRef.trafficShipFactions ; #DEBUG_LINE_NO:110
  maxShips = settingsMarkerRef.maxShips ; #DEBUG_LINE_NO:111
  initialShipsMax = Math.Min(settingsMarkerRef.initialShipsMax as Float, maxShips as Float) as Int ; #DEBUG_LINE_NO:112
  initialShipsMin = Math.Min(settingsMarkerRef.initialShipsMin as Float, initialShipsMax as Float) as Int ; #DEBUG_LINE_NO:113
  initialShips = Utility.RandomInt(initialShipsMin, initialShipsMax) ; #DEBUG_LINE_NO:114
  If stationRef != None ; #DEBUG_LINE_NO:116
    maxShipsInteractingWithStation = Math.Min(settingsMarkerRef.maxShipsInteractingWithStation as Float, maxShips as Float) as Int ; #DEBUG_LINE_NO:117
    dockingDelayMax = settingsMarkerRef.dockingDelayMax ; #DEBUG_LINE_NO:118
    dockingDelayMin = Math.Min(settingsMarkerRef.dockingDelayMin as Float, dockingDelayMax as Float) as Int ; #DEBUG_LINE_NO:119
    safeSpawnDistanceFromStation = settingsMarkerRef.safeSpawnDistanceFromStation ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
  combatTimestampGlobal = settingsMarkerRef.combatTimestampGlobal ; #DEBUG_LINE_NO:123
  combatTimestampElapsedDelay = settingsMarkerRef.combatTimestampElapsedDelay ; #DEBUG_LINE_NO:124
  If combatTimestampGlobal == None || combatTimestampGlobal.GetValue() <= 0.0 || combatTimestampGlobal.GetValue() + combatTimestampElapsedDelay < Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:126,127
    Int I = 0 ; #DEBUG_LINE_NO:129
    While I < initialShips ; #DEBUG_LINE_NO:130
      Self.SpawnShipTrafficNoWait(True) ; #DEBUG_LINE_NO:131
      I += 1 ; #DEBUG_LINE_NO:132
    EndWhile ; #DEBUG_LINE_NO:
    Self.StartTimer(Utility.RandomFloat(minRefreshTime as Float, maxRefreshTime as Float), 0) ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int timerID)
  Int currentStationShips = StationShips.GetCount() ; #DEBUG_LINE_NO:144
  If currentStationShips > 0 ; #DEBUG_LINE_NO:146
    Bool hasUndockedShip = False ; #DEBUG_LINE_NO:147
    Float currentTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:148
    Int I = 0 ; #DEBUG_LINE_NO:149
    While !hasUndockedShip && I < StationShips.GetCount() ; #DEBUG_LINE_NO:150
      spaceshipreference currentShip = StationShips.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:151
      Int currentShipPackageValue = currentShip.GetValue(SQ_TrafficManagerSCPackageValue) as Int ; #DEBUG_LINE_NO:152
      If currentShipPackageValue != CONST_PackageValue_Docked ; #DEBUG_LINE_NO:153
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Float currentShipDepartureTimeValue = currentShip.GetValue(SQ_TrafficManagerSCTimestampValue) ; #DEBUG_LINE_NO:156
        If currentTime < (currentShipDepartureTimeValue - dockingDelayMax as Float) ; #DEBUG_LINE_NO:157
          currentShip.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime() + dockingDelayMax as Float) ; #DEBUG_LINE_NO:158
        ElseIf currentShipDepartureTimeValue > currentTime ; #DEBUG_LINE_NO:160
           ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          Self.MoveToDockingExitPoint(currentShip) ; #DEBUG_LINE_NO:163
          hasUndockedShip = True ; #DEBUG_LINE_NO:164
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:167
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(CONST_SpawningShutdownStage) ; #DEBUG_LINE_NO:171
    If combatTimestampGlobal != None ; #DEBUG_LINE_NO:173
      combatTimestampGlobal.SetValue(Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:174
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Ships.GetCount() < maxShips ; #DEBUG_LINE_NO:177
    Float currenttime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:178
    If currenttime < lastSpawnTimestamp ; #DEBUG_LINE_NO:179
      lastSpawnTimestamp = 0.0 ; #DEBUG_LINE_NO:181
    ElseIf (lastSpawnTimestamp + minSpawnDelay as Float) > currenttime ; #DEBUG_LINE_NO:182
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      lastSpawnTimestamp = currenttime ; #DEBUG_LINE_NO:185
      If currentStationShips < maxShipsInteractingWithStation ; #DEBUG_LINE_NO:186
        Self.SpawnShipStationNoWait() ; #DEBUG_LINE_NO:187
      Else ; #DEBUG_LINE_NO:
        Self.SpawnShipTrafficNoWait(False) ; #DEBUG_LINE_NO:189
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:196
    If trafficManagerActive ; #DEBUG_LINE_NO:197
      Self.StartTimer(Utility.RandomFloat(minRefreshTime as Float, maxRefreshTime as Float), 0) ; #DEBUG_LINE_NO:198
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  If akNewLoc != PlayerShipLocation.GetLocation() ; #DEBUG_LINE_NO:206
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:208
      ObjectReference[] shipRefs = Ships.GetArray() ; #DEBUG_LINE_NO:209
      Int I = 0 ; #DEBUG_LINE_NO:210
      While I < shipRefs.Length ; #DEBUG_LINE_NO:211
        shipRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:212
        shipRefs[I].Delete() ; #DEBUG_LINE_NO:213
        I += 1 ; #DEBUG_LINE_NO:214
      EndWhile ; #DEBUG_LINE_NO:
      settingsMarkerRef = None ; #DEBUG_LINE_NO:216
      stationRef = None ; #DEBUG_LINE_NO:217
      trafficManagerActive = False ; #DEBUG_LINE_NO:218
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:221
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnShipStationNoWait()
  Self.CallFunctionNoWait("SpawnShipStation", None) ; #DEBUG_LINE_NO:232
EndFunction

Function SpawnShipStation()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:236
  ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:239
  Bool safeSpawnLocationFound = False ; #DEBUG_LINE_NO:240
  Int I = 0 ; #DEBUG_LINE_NO:241
  While !safeSpawnLocationFound && I < CONST_SafeSpawnAttemptsMax ; #DEBUG_LINE_NO:242
    spawnMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Random, CONST_NearDistance_Moderate, CONST_NearFacing_TowardLarge) ; #DEBUG_LINE_NO:243
    safeSpawnLocationFound = spawnMarker.GetDistance(playerShipRef as ObjectReference) > CONST_SafeSpawnDistanceFromPlayerShip as Float ; #DEBUG_LINE_NO:244
    I += 1 ; #DEBUG_LINE_NO:245
  EndWhile ; #DEBUG_LINE_NO:
  spaceshipreference ship = Self.Private_SpawnShip(spawnMarker, True) ; #DEBUG_LINE_NO:249
  If ship != None ; #DEBUG_LINE_NO:251
    ship.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:253
    ship.SetLinkedRef(stationRef as ObjectReference, LinkTrafficSystemStarstation, False) ; #DEBUG_LINE_NO:256
    Self.MoveToDockingEntryPoint(ship) ; #DEBUG_LINE_NO:258
  EndIf ; #DEBUG_LINE_NO:
  spawnMarker.Delete() ; #DEBUG_LINE_NO:265
EndFunction

Function SpawnShipTrafficNoWait(Bool isInitialShip)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:270
  akArgs[0] = isInitialShip as Var ; #DEBUG_LINE_NO:271
  Self.CallFunctionNoWait("SpawnShipTraffic", akArgs) ; #DEBUG_LINE_NO:272
EndFunction

Function SpawnShipTraffic(Bool isInitialShip)
  ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:277
  spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random) ; #DEBUG_LINE_NO:278
  If stationRef != None ; #DEBUG_LINE_NO:279
    Bool safeSpawnLocationFound = spawnMarker.GetDistance(stationRef as ObjectReference) > safeSpawnDistanceFromStation as Float ; #DEBUG_LINE_NO:280
    Int I = 0 ; #DEBUG_LINE_NO:281
    While !safeSpawnLocationFound && I < CONST_SafeSpawnAttemptsMax ; #DEBUG_LINE_NO:282
      spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random) ; #DEBUG_LINE_NO:283
      safeSpawnLocationFound = spawnMarker.GetDistance(stationRef as ObjectReference) > safeSpawnDistanceFromStation as Float ; #DEBUG_LINE_NO:284
      If isInitialShip && safeSpawnLocationFound ; #DEBUG_LINE_NO:285
        safeSpawnLocationFound = !Game.GetPlayer().HasDetectionLOS(spawnMarker) ; #DEBUG_LINE_NO:286
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:288
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference ship = Self.Private_SpawnShip(spawnMarker, False) ; #DEBUG_LINE_NO:293
  If ship != None ; #DEBUG_LINE_NO:295
    ObjectReference patrolStartMarker = spawnMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:297
    ship.SetLinkedRef(patrolStartMarker, None, False) ; #DEBUG_LINE_NO:298
    ObjectReference patrolTargetMarker = patrolStartMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:299
    patrolTargetMarker.MoveNear(patrolStartMarker, CONST_NearPosition_ForwardWide, CONST_NearDistance_Long, CONST_NearFacing_AwaySmall) ; #DEBUG_LINE_NO:300
    patrolStartMarker.SetLinkedRef(patrolTargetMarker, None, False) ; #DEBUG_LINE_NO:301
    Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, patrolTargetMarker as ScriptObject, CONST_GravJumpExitDistance as Float, 0) ; #DEBUG_LINE_NO:304
    ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:307
    If isInitialShip ; #DEBUG_LINE_NO:310
      ship.EnableNoWait(False) ; #DEBUG_LINE_NO:311
    Else ; #DEBUG_LINE_NO:
      ship.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:313
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  spawnMarker.Delete() ; #DEBUG_LINE_NO:321
EndFunction

spaceshipreference Function Private_SpawnShip(ObjectReference spawnMarker, Bool isStationShip)
  Int aiMod = 0 ; #DEBUG_LINE_NO:327
  Float aiModRoll = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:328
  If aiModRoll < percentEasy ; #DEBUG_LINE_NO:329
    aiMod = 0 ; #DEBUG_LINE_NO:330
  ElseIf aiModRoll < percentEasy + percentMedium ; #DEBUG_LINE_NO:331
    aiMod = 1 ; #DEBUG_LINE_NO:332
  Else ; #DEBUG_LINE_NO:
    aiMod = 2 ; #DEBUG_LINE_NO:334
  EndIf ; #DEBUG_LINE_NO:
  spaceshipbase shipBase = trafficShipList.GetAt(Utility.RandomInt(0, trafficShipList.GetSize() - 1)) as spaceshipbase ; #DEBUG_LINE_NO:338
  If shipBase == None ; #DEBUG_LINE_NO:340
    Return None ; #DEBUG_LINE_NO:342
  Else ; #DEBUG_LINE_NO:
    spaceshipreference spawnedShip = None ; #DEBUG_LINE_NO:344
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:345
      If trafficManagerActive ; #DEBUG_LINE_NO:346
        spawnedShip = spawnMarker.PlaceShipAtMe(shipBase as Form, aiMod, False, False, True, True, None, None, None, True) ; #DEBUG_LINE_NO:348
        Ships.AddRef(spawnedShip as ObjectReference) ; #DEBUG_LINE_NO:350
        If isStationShip ; #DEBUG_LINE_NO:351
          StationShips.AddRef(spawnedShip as ObjectReference) ; #DEBUG_LINE_NO:352
        Else ; #DEBUG_LINE_NO:
          TrafficShips.AddRef(spawnedShip as ObjectReference) ; #DEBUG_LINE_NO:354
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    If spawnedShip != None ; #DEBUG_LINE_NO:358
      If trafficShipFactions != None ; #DEBUG_LINE_NO:360
        Int I = 0 ; #DEBUG_LINE_NO:361
        While I < trafficShipFactions.Length ; #DEBUG_LINE_NO:362
          spawnedShip.AddToFaction(trafficShipFactions[I]) ; #DEBUG_LINE_NO:363
          I += 1 ; #DEBUG_LINE_NO:364
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Return spawnedShip ; #DEBUG_LINE_NO:368
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float[] Function GetLocalPositionOfObjectToTarget(ObjectReference aObject, ObjectReference aTarget)
  Float[] objectPos = aObject.GetSpacePosition() ; #DEBUG_LINE_NO:375
  Float[] targetXF_CS = aTarget.GetSpaceTransform() ; #DEBUG_LINE_NO:376
  Float deltaX_CS = objectPos[0] - targetXF_CS[0] ; #DEBUG_LINE_NO:377
  Float deltaY_CS = objectPos[1] - targetXF_CS[1] ; #DEBUG_LINE_NO:378
  Float deltaZ_CS = objectPos[2] - targetXF_CS[2] ; #DEBUG_LINE_NO:379
  objectPos[0] = deltaX_CS * targetXF_CS[3] + deltaY_CS * targetXF_CS[4] + deltaZ_CS * targetXF_CS[5] ; #DEBUG_LINE_NO:380
  objectPos[1] = deltaX_CS * targetXF_CS[6] + deltaY_CS * targetXF_CS[7] + deltaZ_CS * targetXF_CS[8] ; #DEBUG_LINE_NO:381
  objectPos[2] = deltaX_CS * targetXF_CS[9] + deltaY_CS * targetXF_CS[10] + deltaZ_CS * targetXF_CS[11] ; #DEBUG_LINE_NO:382
  Return objectPos ; #DEBUG_LINE_NO:383
EndFunction

ObjectReference Function CreateMarkerAtNearestEnterExitPoint(spaceshipreference aShip, spaceshipreference aStation)
  Float[] ship_LS = Self.GetLocalPositionOfObjectToTarget(aShip as ObjectReference, aStation as ObjectReference) ; #DEBUG_LINE_NO:388
  Float distanceXY = Math.Sqrt(ship_LS[0] * ship_LS[0] + ship_LS[1] * ship_LS[1]) ; #DEBUG_LINE_NO:389
  Float halfStationWidth = 0.5 * aStation.GetWidth() ; #DEBUG_LINE_NO:390
  Float halfStationLength = 0.5 * aStation.GetLength() ; #DEBUG_LINE_NO:391
  Float halfStationHeight = 0.5 * aStation.GetHeight() ; #DEBUG_LINE_NO:392
  Float stationCircleRadius = Math.Sqrt(halfStationLength * halfStationLength + halfStationWidth * halfStationWidth) ; #DEBUG_LINE_NO:393
  Float clampedDistanceXY = Math.Min(distanceXY, stationCircleRadius) ; #DEBUG_LINE_NO:394
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:395
  offsets[0] = clampedDistanceXY * ship_LS[0] / distanceXY ; #DEBUG_LINE_NO:396
  offsets[1] = clampedDistanceXY * ship_LS[1] / distanceXY ; #DEBUG_LINE_NO:397
  Float minApproachZOffset = halfStationHeight + Utility.RandomFloat(CONST_MinEntryExitZOffset as Float, CONST_MidEntryExitZOffset as Float) ; #DEBUG_LINE_NO:398
  Float maxApproachZOffset = halfStationHeight + Utility.RandomFloat(CONST_MidEntryExitZOffset as Float, CONST_MaxEntryExitZOffset as Float) ; #DEBUG_LINE_NO:399
  If ship_LS[2] >= 0.0 ; #DEBUG_LINE_NO:400
    offsets[2] = Math.Clamp(ship_LS[2], minApproachZOffset, maxApproachZOffset) ; #DEBUG_LINE_NO:401
  Else ; #DEBUG_LINE_NO:
    offsets[2] = Math.Clamp(ship_LS[2], -maxApproachZOffset, -minApproachZOffset) ; #DEBUG_LINE_NO:403
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference newMarker = stationRef.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:405
  Float[] newMarker_LS = Self.GetLocalPositionOfObjectToTarget(newMarker, aStation as ObjectReference) ; #DEBUG_LINE_NO:406
  Return newMarker ; #DEBUG_LINE_NO:407
EndFunction

Event SpaceshipReference.OnShipDock(spaceshipreference ship, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If abComplete && akParent == stationRef ; #DEBUG_LINE_NO:416
    Float dockingTime = Utility.RandomFloat(dockingDelayMin as Float, dockingDelayMax as Float) ; #DEBUG_LINE_NO:417
    ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentGameTime() + dockingTime) ; #DEBUG_LINE_NO:418
    ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docked as Float) ; #DEBUG_LINE_NO:419
    ship.EvaluatePackage(False) ; #DEBUG_LINE_NO:420
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function MoveToDockingEntryPoint(spaceshipreference ship)
  ObjectReference enterMarker = Self.CreateMarkerAtNearestEnterExitPoint(ship, stationRef) ; #DEBUG_LINE_NO:426
  ship.SetLinkedRef(enterMarker, None, False) ; #DEBUG_LINE_NO:427
  ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:428
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Arriving as Float) ; #DEBUG_LINE_NO:429
  ship.EvaluatePackage(False) ; #DEBUG_LINE_NO:430
  Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, ship.GetLinkedRef(None) as ScriptObject, CONST_DockingEntryExitDistance as Float, 0) ; #DEBUG_LINE_NO:431
EndFunction

Function MoveToDockingExitPoint(spaceshipreference ship)
  ObjectReference exitMarker = Self.CreateMarkerAtNearestEnterExitPoint(ship, stationRef) ; #DEBUG_LINE_NO:437
  Float[] shipToExitMarker_LS = Self.GetLocalPositionOfObjectToTarget(ship as ObjectReference, exitMarker) ; #DEBUG_LINE_NO:439
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:440
  offsets[0] = shipToExitMarker_LS[0] ; #DEBUG_LINE_NO:441
  offsets[1] = shipToExitMarker_LS[1] ; #DEBUG_LINE_NO:442
  offsets[2] = shipToExitMarker_LS[2] ; #DEBUG_LINE_NO:443
  ObjectReference turnMarker = exitMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:444
  ObjectReference gravJumpMarker = exitMarker.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:445
  Float[] exitMarkerToStation_LS = Self.GetLocalPositionOfObjectToTarget(exitMarker, stationRef as ObjectReference) ; #DEBUG_LINE_NO:446
  If exitMarkerToStation_LS[2] < 0.0 ; #DEBUG_LINE_NO:447
    gravJumpMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Below, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge) ; #DEBUG_LINE_NO:448
  Else ; #DEBUG_LINE_NO:
    gravJumpMarker.MoveNear(stationRef as ObjectReference, CONST_NearPosition_Above, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge) ; #DEBUG_LINE_NO:450
  EndIf ; #DEBUG_LINE_NO:
  exitMarker.SetLinkedRef(gravJumpMarker, None, False) ; #DEBUG_LINE_NO:452
  turnMarker.SetLinkedRef(exitMarker, None, False) ; #DEBUG_LINE_NO:453
  ship.SetLinkedRef(turnMarker, None, False) ; #DEBUG_LINE_NO:454
  ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime()) ; #DEBUG_LINE_NO:455
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Departing as Float) ; #DEBUG_LINE_NO:456
  ship.EvaluatePackage(False) ; #DEBUG_LINE_NO:457
  Self.RegisterForDistanceLessThanEvent(ship as ScriptObject, gravJumpMarker as ScriptObject, CONST_GravJumpExitDistance as Float, 0) ; #DEBUG_LINE_NO:458
EndFunction

Function DockShipStation(spaceshipreference ship)
  Self.RegisterForRemoteEvent(ship as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:463
  ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docking as Float) ; #DEBUG_LINE_NO:464
  ship.EvaluatePackage(False) ; #DEBUG_LINE_NO:465
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  spaceshipreference ship = None ; #DEBUG_LINE_NO:470
  If akObj1 is spaceshipreference ; #DEBUG_LINE_NO:471
    ship = akObj1 as spaceshipreference ; #DEBUG_LINE_NO:472
  Else ; #DEBUG_LINE_NO:
    ship = akObj2 as spaceshipreference ; #DEBUG_LINE_NO:474
  EndIf ; #DEBUG_LINE_NO:
  Float transitTime = Utility.GetCurrentRealTime() - ship.GetValue(SQ_TrafficManagerSCTimestampValue) ; #DEBUG_LINE_NO:478
  If ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Arriving as Float ; #DEBUG_LINE_NO:480
    Self.DockShipStation(ship) ; #DEBUG_LINE_NO:483
  Else ; #DEBUG_LINE_NO:
    If ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Patrol as Float ; #DEBUG_LINE_NO:486
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    ship.DisableWithGravJump() ; #DEBUG_LINE_NO:492
    Guard TrafficManagerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:494
      If trafficManagerActive ; #DEBUG_LINE_NO:495
        Ships.RemoveRef(ship as ObjectReference) ; #DEBUG_LINE_NO:496
        StationShips.RemoveRef(ship as ObjectReference) ; #DEBUG_LINE_NO:497
        TrafficShips.RemoveRef(ship as ObjectReference) ; #DEBUG_LINE_NO:498
        ObjectReference[] shipLinkedRefs = ship.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:501
        Int I = 0 ; #DEBUG_LINE_NO:502
        While I < shipLinkedRefs.Length ; #DEBUG_LINE_NO:503
          If shipLinkedRefs[I] != None ; #DEBUG_LINE_NO:504
            shipLinkedRefs[I].Delete() ; #DEBUG_LINE_NO:505
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:507
        EndWhile ; #DEBUG_LINE_NO:
        ship.Delete() ; #DEBUG_LINE_NO:511
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DEBUG_MoveNearPlayer(spaceshipreference ship)
  ship.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_DeadAhead, CONST_NearDistance_Close, CONST_NearFacing_AwayLarge) ; #DEBUG_LINE_NO:524
EndFunction
