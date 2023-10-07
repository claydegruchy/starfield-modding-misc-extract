ScriptName GuardShipQuestScript Extends Quest conditional
{ script for quests that handle guard ships in settled systems }

;-- Structs -----------------------------------------
Struct GuardshipType
  Faction crimeFaction
  spaceshipbase GuardShipBase
EndStruct

Struct PlanetData
  Location PlanetOrbitLocation
  ObjectReference MapMarker01
  ObjectReference MapMarker02
  ObjectReference MapMarker03
  ObjectReference MapMarker04
  ObjectReference MapMarker05
EndStruct


;-- Variables ---------------------------------------
Bool droppedContraband = False
Bool leftOrbit = False
Int reinforcementCurrent = 0
Int reinforcementTimerID = 1
Int reinforcementTotal = 0
Bool showingContrabandWarning = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard scanWarningGuard

;-- Properties --------------------------------------
Group ReinforcementGroup
  guardshipquestscript:guardshiptype[] Property GuardShipReinforcements Auto Const mandatory
  { used to create guard ship reinforcements during combat }
  ReferenceAlias[] Property ReinforcementSpawnPoints Auto Const mandatory
  { spawn points for reinforcements }
  RefCollectionAlias Property Reinforcements Auto Const mandatory
  { collection to put reinforcement ships into }
  Int Property minReinforcements = 1 Auto Const
  Int Property maxReinforcements = 3 Auto Const
  Float Property reinforcementDelayMin = 3.0 Auto Const
  Float Property reinforcementDelayMax = 15.0 Auto Const
EndGroup

Group VSTemp
  Quest Property MQ101 Auto Const
  Int Property MQ101AllowLandingStage = 1310 Auto Const
EndGroup

guardshipquestscript:planetdata[] Property SettledPlanets Auto Const
{ array of planets that have map markers that need to be managed by guard quests }
LocationAlias Property PlanetOrbitLocation Auto Const mandatory
{ location alias of this planet's orbit location }
LocationAlias Property PlanetLocation Auto Const mandatory
{ location alias of where the planet }
LocationAlias Property OldLocation Auto Const mandatory
{ location alias of where the ship is changing location from }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
Keyword Property LocTypeSettlement Auto Const mandatory
Keyword Property LocTypeOrbit Auto Const mandatory
Keyword Property LocTypeStarSystem Auto Const mandatory
LocationRefType Property GuardShipRefType Auto Const mandatory
ReferenceAlias Property Playership Auto Const mandatory
{ player ship alias }
ReferenceAlias Property Ship01 Auto Const mandatory
{ guard ship alias }
ReferenceAlias Property Ship02 Auto Const mandatory
{ guard ship 2 alias }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ holds smuggling minigame }
GlobalVariable Property SQ_GuardShipsScanStatus Auto Const mandatory
Scene Property SQ_GuardShipsScene Auto Const mandatory
{ contraband scanning scene - need to stop it if contraband alarm is sent }
Int Property ContrabandDetectedStage = 25 Auto Const
{ stage to set if contraband is found }
Keyword Property Contraband Auto Const mandatory
{ keyword to watch for dropped contraband }
Keyword Property SpaceJettisonContainer Auto Const mandatory
{ keyword to check for space jettison container }

;-- Functions ---------------------------------------

Function debugAlarmStatus()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestStarted()
  Self.ClearScanStatus() ; #DEBUG_LINE_NO:104
  Self.StartContrabandDropCheck(True) ; #DEBUG_LINE_NO:105
  spaceshipreference ship01Ref = Ship01.GetShipRef() ; #DEBUG_LINE_NO:110
  If ship01Ref ; #DEBUG_LINE_NO:111
    If ship01Ref.IsDead() ; #DEBUG_LINE_NO:113
      ship01Ref.Reset(None) ; #DEBUG_LINE_NO:115
    EndIf ; #DEBUG_LINE_NO:
    Cell spaceCell = Ship01.GetRef().GetParentCell() ; #DEBUG_LINE_NO:117
    If spaceCell ; #DEBUG_LINE_NO:120
      spaceCell.Reset() ; #DEBUG_LINE_NO:121
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference ship02Ref = Ship02.GetShipRef() ; #DEBUG_LINE_NO:125
  If ship02Ref as Bool && ship02Ref.IsDead() ; #DEBUG_LINE_NO:127
    ship02Ref.Reset(None) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  Location thePlanetLocation = PlanetLocation.GetLocation() ; #DEBUG_LINE_NO:133
  planet thePlanet = thePlanetLocation.GetCurrentPlanet() ; #DEBUG_LINE_NO:134
  Location theOldLocation = OldLocation.GetLocation() ; #DEBUG_LINE_NO:135
  Location thePlanetOrbitLocation = PlanetOrbitLocation.GetLocation() ; #DEBUG_LINE_NO:136
  planet theOldLocationPlanet = None ; #DEBUG_LINE_NO:137
  If theOldLocation ; #DEBUG_LINE_NO:138
    theOldLocationPlanet = theOldLocation.GetCurrentPlanet() ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
  Bool stopQuest = False ; #DEBUG_LINE_NO:147
  If (theOldLocation as Bool && thePlanetOrbitLocation.IsSameLocation(theOldLocation, LocTypeOrbit)) && theOldLocation.HasRefType(GuardShipRefType) ; #DEBUG_LINE_NO:148
    stopQuest = True ; #DEBUG_LINE_NO:151
  ElseIf (theOldLocation as Bool && thePlanetLocation as Bool) && thePlanet == theOldLocationPlanet ; #DEBUG_LINE_NO:152
    stopQuest = True ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  If ship01Ref.IsDisabled() ; #DEBUG_LINE_NO:158
    stopQuest = True ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
  If stopQuest ; #DEBUG_LINE_NO:163
    Self.Stop() ; #DEBUG_LINE_NO:164
  Else ; #DEBUG_LINE_NO:
    Self.CheckForShutdown(False) ; #DEBUG_LINE_NO:167
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:169
    Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:171
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:172
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnShipFarTravel") ; #DEBUG_LINE_NO:173
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:174
    Self.AllowLanding(False) ; #DEBUG_LINE_NO:176
    Self.ShowContrabandScanWarning(False) ; #DEBUG_LINE_NO:177
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(Ship01 as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:180
EndEvent

Event OnQuestShutdown()
  Self.ClearScanStatus() ; #DEBUG_LINE_NO:185
  Self.HideContrabandScanWarning(True, False) ; #DEBUG_LINE_NO:187
EndEvent

Bool Function IsInAnySettlement(Location locationToCheck, guardshipquestscript:planetdata thePlanetData)
  Bool bInAnySettlement = False ; #DEBUG_LINE_NO:191
  If thePlanetData ; #DEBUG_LINE_NO:192
    bInAnySettlement = Self.IsInSettlement(thePlanetData.MapMarker01, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker02, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker03, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker04, locationToCheck) || Self.IsInSettlement(thePlanetData.MapMarker05, locationToCheck) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Return bInAnySettlement ; #DEBUG_LINE_NO:195
EndFunction

Bool Function IsInSettlement(ObjectReference settlementRef, Location locationToCheck)
  Bool returnVal = False ; #DEBUG_LINE_NO:199
  If settlementRef as Bool && locationToCheck as Bool ; #DEBUG_LINE_NO:200
    Location settlementLocation = settlementRef.GetCurrentLocation() ; #DEBUG_LINE_NO:201
    returnVal = locationToCheck.IsSameLocation(settlementLocation, LocTypeSettlement) ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:205
EndFunction

guardshipquestscript:planetdata Function GetPlanetData()
  guardshipquestscript:planetdata thePlanetData = None ; #DEBUG_LINE_NO:210
  Location myPlanetOrbitLocation = PlanetOrbitLocation.GetLocation() ; #DEBUG_LINE_NO:211
  If myPlanetOrbitLocation ; #DEBUG_LINE_NO:213
    Int myPlanetIndex = SettledPlanets.findstruct("PlanetOrbitLocation", myPlanetOrbitLocation, 0) ; #DEBUG_LINE_NO:214
    If myPlanetIndex > -1 ; #DEBUG_LINE_NO:216
      thePlanetData = SettledPlanets[myPlanetIndex] ; #DEBUG_LINE_NO:217
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return thePlanetData ; #DEBUG_LINE_NO:220
EndFunction

Function AllowLanding(Bool bAllowLanding)
  guardshipquestscript:planetdata thePlanetData = Self.GetPlanetData() ; #DEBUG_LINE_NO:225
  If thePlanetData ; #DEBUG_LINE_NO:226
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker01) ; #DEBUG_LINE_NO:229
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker02) ; #DEBUG_LINE_NO:230
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker03) ; #DEBUG_LINE_NO:231
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker04) ; #DEBUG_LINE_NO:232
    Self.AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker05) ; #DEBUG_LINE_NO:233
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AllowLandingAtMarker(Bool bAllowLanding, ObjectReference markerRef)
  If markerRef ; #DEBUG_LINE_NO:238
    markerRef.EnableFastTravel(bAllowLanding) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ScanForContraband()
  spaceshipreference guardShipRef = Ship01.GetShipRef() ; #DEBUG_LINE_NO:245
  spaceshipreference playerShipRef = Playership.GetShipRef() ; #DEBUG_LINE_NO:253
  If playerShipRef ; #DEBUG_LINE_NO:254
    If guardShipRef == None || leftOrbit || guardShipRef.Is3DLoaded() == False && playerShipRef.IsInSpace() == False ; #DEBUG_LINE_NO:255
      SQ_GuardShipsScene.Stop() ; #DEBUG_LINE_NO:257
      Self.HideContrabandScanWarning(True, False) ; #DEBUG_LINE_NO:259
    Else ; #DEBUG_LINE_NO:
      Int contrabandStatus = playerShipRef.CheckContrabandStatus(True) ; #DEBUG_LINE_NO:261
      If contrabandStatus < 0 && droppedContraband == False ; #DEBUG_LINE_NO:263
        Self.HideContrabandScanWarning(False, True) ; #DEBUG_LINE_NO:267
        SQ_GuardShipsScanStatus.SetValueInt(1) ; #DEBUG_LINE_NO:268
      ElseIf contrabandStatus > 0 || droppedContraband ; #DEBUG_LINE_NO:269
        SQ_GuardShipsScanStatus.SetValueInt(0) ; #DEBUG_LINE_NO:271
        Self.HideContrabandScanWarning(False, False) ; #DEBUG_LINE_NO:273
        Self.SendSmugglingAlarm() ; #DEBUG_LINE_NO:274
      Else ; #DEBUG_LINE_NO:
        Bool scanStatus = SQ_Parent.SmugglingMinigame(playerShipRef, Ship01.GetShipRef()) ; #DEBUG_LINE_NO:277
        SQ_GuardShipsScanStatus.SetValueInt(scanStatus as Int) ; #DEBUG_LINE_NO:278
        Self.HideContrabandScanWarning(False, scanStatus) ; #DEBUG_LINE_NO:281
        If scanStatus ; #DEBUG_LINE_NO:
           ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          Self.SendSmugglingAlarm() ; #DEBUG_LINE_NO:286
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.StartContrabandDropCheck(False) ; #DEBUG_LINE_NO:294
EndFunction

Function SendSmugglingAlarm()
  Ship01.TryToSendSmugglingAlarm() ; #DEBUG_LINE_NO:299
  SQ_GuardShipsScene.Stop() ; #DEBUG_LINE_NO:300
  Self.SetStage(ContrabandDetectedStage) ; #DEBUG_LINE_NO:301
EndFunction

Function ClearScanStatus()
  SQ_GuardShipsScanStatus.SetValue(-1.0) ; #DEBUG_LINE_NO:306
EndFunction

Function ShowContrabandScanWarning(Bool abScanInProgress)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:313
    showingContrabandWarning = True ; #DEBUG_LINE_NO:314
    spaceshipreference playerShipRef = Playership.GetShipRef() ; #DEBUG_LINE_NO:315
    spaceshipreference guardShipRef = Ship01.GetShipRef() ; #DEBUG_LINE_NO:316
    If playerShipRef as Bool && guardShipRef as Bool ; #DEBUG_LINE_NO:317
      Float evasionChance = SQ_Parent.GetSmugglingChance(playerShipRef, guardShipRef) ; #DEBUG_LINE_NO:318
      If droppedContraband ; #DEBUG_LINE_NO:319
        evasionChance = 0.0 ; #DEBUG_LINE_NO:320
      EndIf ; #DEBUG_LINE_NO:
      Game.ShowContrabandScanWarning(evasionChance as Int, abScanInProgress) ; #DEBUG_LINE_NO:323
    EndIf ; #DEBUG_LINE_NO:
    If abScanInProgress == False ; #DEBUG_LINE_NO:325
      leftOrbit = False ; #DEBUG_LINE_NO:326
      SQ_GuardShipsScene.Start() ; #DEBUG_LINE_NO:328
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function HideContrabandScanWarning(Bool abSkipCompletionAnim, Bool abWasDetectionEvaded)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:334
    If showingContrabandWarning ; #DEBUG_LINE_NO:336
      showingContrabandWarning = False ; #DEBUG_LINE_NO:337
      Game.HideContrabandScanWarning(abSkipCompletionAnim, abWasDetectionEvaded) ; #DEBUG_LINE_NO:338
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnDeath(ReferenceAlias akSource, ObjectReference akKiller)
  Self.StartReinforcementTimer() ; #DEBUG_LINE_NO:345
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == reinforcementTimerID ; #DEBUG_LINE_NO:349
    Self.SpawnReinforcements() ; #DEBUG_LINE_NO:350
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartReinforcementTimer()
  Self.StartTimer(Utility.RandomFloat(reinforcementDelayMin, reinforcementDelayMax), reinforcementTimerID) ; #DEBUG_LINE_NO:355
EndFunction

Function SpawnReinforcements()
  If reinforcementTotal == 0 ; #DEBUG_LINE_NO:359
    reinforcementTotal = Utility.RandomInt(minReinforcements, maxReinforcements) ; #DEBUG_LINE_NO:361
  EndIf ; #DEBUG_LINE_NO:
  If reinforcementCurrent < reinforcementTotal ; #DEBUG_LINE_NO:365
    reinforcementCurrent += 1 ; #DEBUG_LINE_NO:366
    spaceshipreference guardShipRef = Ship01.GetShipRef() ; #DEBUG_LINE_NO:368
    If guardShipRef ; #DEBUG_LINE_NO:369
      Faction crimeFaction = guardShipRef.GetCrimeFaction() ; #DEBUG_LINE_NO:370
      If crimeFaction ; #DEBUG_LINE_NO:371
        Int I = 0 ; #DEBUG_LINE_NO:372
        spaceshipbase reinforcementToSpawn = None ; #DEBUG_LINE_NO:373
        While I < GuardShipReinforcements.Length && reinforcementToSpawn == None ; #DEBUG_LINE_NO:374
          guardshipquestscript:guardshiptype theType = GuardShipReinforcements[I] ; #DEBUG_LINE_NO:375
          If theType.crimeFaction == crimeFaction ; #DEBUG_LINE_NO:376
            reinforcementToSpawn = theType.GuardShipBase ; #DEBUG_LINE_NO:377
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:379
        EndWhile ; #DEBUG_LINE_NO:
        If reinforcementToSpawn ; #DEBUG_LINE_NO:381
          I = Utility.RandomInt(0, ReinforcementSpawnPoints.Length - 1) ; #DEBUG_LINE_NO:384
          ObjectReference spawnPoint = ReinforcementSpawnPoints[I].GetRef() ; #DEBUG_LINE_NO:386
          If spawnPoint ; #DEBUG_LINE_NO:388
            spaceshipreference newShipRef = spawnPoint.PlaceShipAtMe(reinforcementToSpawn as Form, 4, True, False, False, True, None, Reinforcements as Alias, None, True) ; #DEBUG_LINE_NO:389
          EndIf ; #DEBUG_LINE_NO:
          If reinforcementCurrent < reinforcementTotal ; #DEBUG_LINE_NO:392
            Self.StartReinforcementTimer() ; #DEBUG_LINE_NO:393
          Else ; #DEBUG_LINE_NO:
            Self.AllowLanding(True) ; #DEBUG_LINE_NO:396
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:406
    Self.CheckForShutdown(True) ; #DEBUG_LINE_NO:408
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Playership && akOldLoc != akNewLoc ; #DEBUG_LINE_NO:415
    Self.CheckForShutdown(True) ; #DEBUG_LINE_NO:417
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If akSender == Playership && aState == 0 && aArrivalLocation != aDepartureLocation ; #DEBUG_LINE_NO:426
    leftOrbit = True ; #DEBUG_LINE_NO:428
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, Int aState)
  If akSender == Playership && aState == 1 ; #DEBUG_LINE_NO:435
    leftOrbit = True ; #DEBUG_LINE_NO:437
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForShutdown(Bool allowRestartContrabandScene)
  Guard scanWarningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:443
    Location guardShipLocation = PlanetLocation.GetLocation() ; #DEBUG_LINE_NO:445
    ObjectReference playerShipRef = Playership.GetRef() ; #DEBUG_LINE_NO:447
    Location currentLocation = playerShipRef.GetCurrentLocation() ; #DEBUG_LINE_NO:448
    Location guardShipCurrentLocation = Ship01.GetShipRef().GetCurrentLocation() ; #DEBUG_LINE_NO:449
    If currentLocation == None ; #DEBUG_LINE_NO:451
      currentLocation = Game.GetPlayer().GetCurrentLocation() ; #DEBUG_LINE_NO:453
    EndIf ; #DEBUG_LINE_NO:
    If currentLocation ; #DEBUG_LINE_NO:458
      Bool moonCheck = False ; #DEBUG_LINE_NO:459
      If currentLocation != guardShipCurrentLocation && currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:460
        Location[] currentLocationParentPlanets = currentLocation.GetParentLocations(LocTypeMajorOrbital) ; #DEBUG_LINE_NO:463
        Location[] guardShipLocationParentPlanets = guardShipLocation.GetParentLocations(LocTypeMajorOrbital) ; #DEBUG_LINE_NO:464
        If currentLocationParentPlanets.Length > 1 ; #DEBUG_LINE_NO:467
          If currentLocationParentPlanets.find(guardShipLocation, 0) > -1 || guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.find(guardShipLocationParentPlanets[0], 0) > -1 ; #DEBUG_LINE_NO:470
            moonCheck = True ; #DEBUG_LINE_NO:473
          EndIf ; #DEBUG_LINE_NO:
        ElseIf guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.Length > 0 ; #DEBUG_LINE_NO:475
          If guardShipLocationParentPlanets.find(currentLocationParentPlanets[0], 0) ; #DEBUG_LINE_NO:478
            moonCheck = True ; #DEBUG_LINE_NO:480
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If moonCheck || currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital) == False ; #DEBUG_LINE_NO:485
        Self.AllowLanding(True) ; #DEBUG_LINE_NO:487
        Self.Stop() ; #DEBUG_LINE_NO:488
      ElseIf playerShipRef.IsInSpace() && SQ_GuardShipsScanStatus.GetValueInt() < 1 && SQ_GuardShipsScene.IsPlaying() == False ; #DEBUG_LINE_NO:489
        If allowRestartContrabandScene ; #DEBUG_LINE_NO:490
          Self.ShowContrabandScanWarning(False) ; #DEBUG_LINE_NO:493
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StartContrabandDropCheck(Bool bStart)
  If bStart ; #DEBUG_LINE_NO:503
    Self.AddInventoryEventFilter(Contraband as Form) ; #DEBUG_LINE_NO:504
    Self.RegisterForRemoteEvent(Playership as ScriptObject, "OnItemRemoved") ; #DEBUG_LINE_NO:505
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(Playership as ScriptObject, "OnItemRemoved") ; #DEBUG_LINE_NO:507
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  If aiTransferReason == 3 || (akDestContainer as Bool && akDestContainer.HasKeyword(SpaceJettisonContainer)) ; #DEBUG_LINE_NO:513
    droppedContraband = True ; #DEBUG_LINE_NO:516
  EndIf ; #DEBUG_LINE_NO:
EndEvent
