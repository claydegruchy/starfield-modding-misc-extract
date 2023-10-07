ScriptName MQ_Temple_SubScript Extends Quest

;-- Structs -----------------------------------------
Struct imageSpaceData
  ImageSpaceModifier scanTempleImod
  Int distortionLevel = 1
  wwiseevent soundEvent
  Float requiredAngleExtent
  Float loopTime
EndStruct


;-- Variables ---------------------------------------
Float AngleDiff
Float DistanceDiff
Int currentImodIndex = -1
Float currentImodTime
ObjectReference currentTarget
Int iArtifactNumber
Actor playerRef
Int scanTempleTimerID = 1 Const
Float scanTempleTimerSeconds = 0.5 Const
Bool usingHandscanner = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForTempleScanningGuard
Guard handscannerGuard

;-- Properties --------------------------------------
Group soundData
  String Property ArtifactPuzzle_TempleDistance = "ArtifactPuzzle_TempleDistance" Auto Const
EndGroup

ReferenceAlias Property PlayerShip Auto Const mandatory
LocationAlias Property PlanetWithTrait Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
LocationAlias Property TempleLocation Auto Const mandatory
Int Property QuestInitStage = -1 Auto Const
Int Property LandingSetStage = 30 Auto Const
Int Property PowerReceivedStage = 60 Auto Const
Int Property PowerNumber = -1 Auto Const
ReferenceAlias Property TemplePowerTrigger Auto Const mandatory
ReferenceAlias Property AnomalyMapMarker Auto Const mandatory
ReferenceAlias Property TempleMapMarker Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property OutpostScannerMultiplier Auto Const mandatory
Keyword Property MQTempleQuestActive Auto Const mandatory
Keyword Property PlanetTrait26GravitationalAnomaly Auto Const mandatory
Quest Property MQ_TempleQuest_SpawnTemple Auto Const mandatory
Message Property MQ_TempleTutorial_DistanceMSG Auto Const mandatory
ReferenceAlias Property TempleStarbornMarker Auto Const
ActorBase Property LvlStarborn_Boss_Aggro Auto Const mandatory
ReferenceAlias Property TempleStarborn Auto Const
Quest Property MQ106 Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
mq_temple_subscript:imagespacedata[] Property TempleScanImods Auto Const
{ array of imod data, ordered from highest priority (index 0) to lowest - use first one where currentAnglePercent <= maxPercent }
Float Property MinAngle = 0.0 Auto Const
Float Property MaxAngle = 85.0 Auto Const
Float Property MinDistance = 300.0 Auto Const
Float Property MaxDistance = 1200.0 Auto Const
Float Property MaxScanEffectDistance = 5000.0 Auto Const
{ outside this distance, turn off temple scan effect }

;-- Functions ---------------------------------------

Event OnQuestInit()
  playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:39
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:40
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:41
  Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:42
  If PowerNumber == -1 ; #DEBUG_LINE_NO:45
    iArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower() ; #DEBUG_LINE_NO:47
    If iArtifactNumber == -1 ; #DEBUG_LINE_NO:50
      Self.Stop() ; #DEBUG_LINE_NO:51
      Return  ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    iArtifactNumber = PowerNumber ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  If iArtifactNumber != -1 ; #DEBUG_LINE_NO:58
    Self.SetMapMarkerFlags(AnomalyMapMarker.GetRef()) ; #DEBUG_LINE_NO:60
    PlanetWithTrait.GetLocation().GetCurrentPlanet().GetLocation().AddKeyword(MQTempleQuestActive) ; #DEBUG_LINE_NO:63
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerFoundTemple(iArtifactNumber) ; #DEBUG_LINE_NO:66
    If QuestInitStage > -1 ; #DEBUG_LINE_NO:69
      Self.SetStage(QuestInitStage) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
  akMapMarker.Enable(False) ; #DEBUG_LINE_NO:76
  akMapMarker.AddToMapScanned(True) ; #DEBUG_LINE_NO:77
  akMapMarker.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:78
  akMapMarker.SetRequiresScanning(False) ; #DEBUG_LINE_NO:79
  akMapMarker.EnableFastTravel(True) ; #DEBUG_LINE_NO:80
EndFunction

Function TempleDiscovered()
  Self.SetMapMarkerFlags(TempleMapMarker.GetRef()) ; #DEBUG_LINE_NO:86
  AnomalyMapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:89
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:92
EndFunction

Function PowerReceived()
  Guard CheckForTempleScanningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:97
    Self.StopTempleScanning() ; #DEBUG_LINE_NO:98
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:105
    If TempleLocation.GetLocation() == None ; #DEBUG_LINE_NO:106
      Self.RefillTemple() ; #DEBUG_LINE_NO:107
    EndIf ; #DEBUG_LINE_NO:
    Self.CheckForTempleScanning() ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RefillTemple()
  Location landingLocation = PlayerShip.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:114
  Location planetLocation = PlanetWithTrait.GetLocation() ; #DEBUG_LINE_NO:115
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:117
    TempleLocation.RefillAlias() ; #DEBUG_LINE_NO:119
    TempleLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:120
    Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:121
    (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation()) ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  ObjectReference ScanTarget = TempleMapMarker.GetRef() ; #DEBUG_LINE_NO:128
  If akSender == Game.GetPlayer() && ScanTarget != None && Self.GetStageDone(PowerReceivedStage) == False ; #DEBUG_LINE_NO:132
    Self.CheckForTempleScanning() ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
  If Self.GetStageDone(LandingSetStage) == False ; #DEBUG_LINE_NO:139
    Location landingLocation = akShip.GetCurrentLocation() ; #DEBUG_LINE_NO:141
    Location planetLocation = PlanetWithTrait.GetLocation() ; #DEBUG_LINE_NO:142
    If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:144
      Self.SetStage(LandingSetStage) ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForTempleScanning()
  Guard CheckForTempleScanningGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:154
    ObjectReference ScanTarget = TempleMapMarker.GetRef() ; #DEBUG_LINE_NO:159
    If ScanTarget != None && Self.GetStageDone(PowerReceivedStage) == False ; #DEBUG_LINE_NO:160
      Location TemplePlanetLocation = PlanetWithTrait.GetLocation() ; #DEBUG_LINE_NO:161
      spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:162
      Location playerCurrentLocation = playerRef.GetCurrentLocation() ; #DEBUG_LINE_NO:164
      Location landingLocation = playerShipRef.GetCurrentLocation() ; #DEBUG_LINE_NO:165
      Bool onTargetPlanet = playerCurrentLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital) || landingLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:169
      Bool nearTemple = playerRef.GetDistance(ScanTarget) < MaxScanEffectDistance || playerShipRef.GetDistance(ScanTarget) < MaxScanEffectDistance ; #DEBUG_LINE_NO:170
      If onTargetPlanet && nearTemple ; #DEBUG_LINE_NO:172
        Self.StartTempleScanning(ScanTarget) ; #DEBUG_LINE_NO:173
      Else ; #DEBUG_LINE_NO:
        Self.StopTempleScanning() ; #DEBUG_LINE_NO:175
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger.GetRef()) && Self.GetStageDone(PowerReceivedStage) == False ; #DEBUG_LINE_NO:182
    Self.SetStage(PowerReceivedStage) ; #DEBUG_LINE_NO:183
    (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredPower(iArtifactNumber) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event MQSpawnTempleScript.TempleSpawnedEvent(mqspawntemplescript akSender, Var[] akArgs)
  Location myLocation = akArgs[0] as Location ; #DEBUG_LINE_NO:190
  ObjectReference myMapMarker = akArgs[1] as ObjectReference ; #DEBUG_LINE_NO:191
  Self.UnRegisterForCustomEvent(akSender as ScriptObject, "mqspawntemplescript_TempleSpawnedEvent") ; #DEBUG_LINE_NO:192
  TempleLocation.ForceLocationTo(myLocation) ; #DEBUG_LINE_NO:193
  TempleLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:194
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:195
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation()) ; #DEBUG_LINE_NO:196
EndEvent

Function SpawnStarborn()
  If MQ106.IsCompleted() || MQ401_SkipMQ.GetValueInt() >= 1 ; #DEBUG_LINE_NO:203
    Actor StarbornREF = TempleStarbornMarker.GetRef().PlaceActorAtMe(LvlStarborn_Boss_Aggro, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:204
    MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:206
    TempleStarborn.ForceRefTo(StarbornREF as ObjectReference) ; #DEBUG_LINE_NO:207
    (StarbornTempleQuest as starborntemplequestscript).RenameTempleStarborn(iArtifactNumber, StarbornREF) ; #DEBUG_LINE_NO:209
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartTempleScanning(ObjectReference targetRef)
  DistanceDiff = MaxDistance - MinDistance ; #DEBUG_LINE_NO:257
  AngleDiff = MaxAngle - MinAngle ; #DEBUG_LINE_NO:258
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:260
  currentTarget = targetRef ; #DEBUG_LINE_NO:261
EndFunction

Function StopTempleScanning()
  Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:266
  currentTarget = None ; #DEBUG_LINE_NO:267
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == scanTempleTimerID ; #DEBUG_LINE_NO:271
    Self.UpdateTempleScan() ; #DEBUG_LINE_NO:272
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "MonocleMenu" ; #DEBUG_LINE_NO:279
    Guard handscannerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:280
      usingHandscanner = abOpening ; #DEBUG_LINE_NO:281
      If abOpening ; #DEBUG_LINE_NO:282
        Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID) ; #DEBUG_LINE_NO:283
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateTempleScan()
  If usingHandscanner && currentTarget as Bool ; #DEBUG_LINE_NO:291
    Float zAngle = playerRef.GetHeadingAngle(currentTarget) ; #DEBUG_LINE_NO:293
    Float currentMaxImodAngle = Self.GetAngleExtent() ; #DEBUG_LINE_NO:296
    If Math.abs(zAngle) <= MaxAngle ; #DEBUG_LINE_NO:301
      Self.UpdateImod(zAngle, currentMaxImodAngle) ; #DEBUG_LINE_NO:302
    Else ; #DEBUG_LINE_NO:
      Self.RemoveAllImods() ; #DEBUG_LINE_NO:304
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID) ; #DEBUG_LINE_NO:308
  Else ; #DEBUG_LINE_NO:
    Self.RemoveAllImods() ; #DEBUG_LINE_NO:311
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float Function GetAngleExtent()
  Float distance = Self.GetClampedDistance() ; #DEBUG_LINE_NO:318
  Float distanceMult = (distance - MinDistance) / DistanceDiff ; #DEBUG_LINE_NO:321
  Float angleExtent = MinAngle + distanceMult * AngleDiff ; #DEBUG_LINE_NO:324
  Return angleExtent ; #DEBUG_LINE_NO:326
EndFunction

Float Function GetClampedDistance()
  Float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance) ; #DEBUG_LINE_NO:331
  Return distance ; #DEBUG_LINE_NO:332
EndFunction

Function UpdateImod(Float currentAngle, Float currentMaxImodAngle)
  Bool foundValidImod = False ; #DEBUG_LINE_NO:336
  Int I = 0 ; #DEBUG_LINE_NO:341
  While I < TempleScanImods.Length ; #DEBUG_LINE_NO:342
    mq_temple_subscript:imagespacedata theData = TempleScanImods[I] ; #DEBUG_LINE_NO:343
    If foundValidImod ; #DEBUG_LINE_NO:344
      If theData.scanTempleImod ; #DEBUG_LINE_NO:346
        theData.scanTempleImod.Remove() ; #DEBUG_LINE_NO:347
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currentMaxImodAngle <= theData.requiredAngleExtent && Math.abs(currentAngle) <= theData.requiredAngleExtent ; #DEBUG_LINE_NO:353
      foundValidImod = True ; #DEBUG_LINE_NO:355
      Float distance = Self.GetClampedDistance() ; #DEBUG_LINE_NO:357
      If currentImodIndex != I ; #DEBUG_LINE_NO:359
        currentImodIndex = I ; #DEBUG_LINE_NO:360
        Game.SetHandscannerDistortionLevel(theData.distortionLevel) ; #DEBUG_LINE_NO:362
        If theData.scanTempleImod ; #DEBUG_LINE_NO:363
          theData.scanTempleImod.Apply(1.0) ; #DEBUG_LINE_NO:364
        EndIf ; #DEBUG_LINE_NO:
        If theData.soundEvent ; #DEBUG_LINE_NO:367
          theData.soundEvent.PlayWithRTPC(playerRef as ObjectReference, ArtifactPuzzle_TempleDistance, distance) ; #DEBUG_LINE_NO:368
        EndIf ; #DEBUG_LINE_NO:
        currentImodTime = 0.0 ; #DEBUG_LINE_NO:371
      ElseIf currentImodTime >= theData.loopTime ; #DEBUG_LINE_NO:375
        If theData.scanTempleImod ; #DEBUG_LINE_NO:377
          theData.scanTempleImod.Apply(1.0) ; #DEBUG_LINE_NO:378
        EndIf ; #DEBUG_LINE_NO:
        If theData.soundEvent ; #DEBUG_LINE_NO:381
          theData.soundEvent.PlayWithRTPC(playerRef as ObjectReference, ArtifactPuzzle_TempleDistance, distance) ; #DEBUG_LINE_NO:382
        EndIf ; #DEBUG_LINE_NO:
        currentImodTime = 0.0 ; #DEBUG_LINE_NO:385
      Else ; #DEBUG_LINE_NO:
        currentImodTime += scanTempleTimerSeconds ; #DEBUG_LINE_NO:388
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:393
  EndWhile ; #DEBUG_LINE_NO:
  If foundValidImod == False ; #DEBUG_LINE_NO:395
    currentImodIndex = 0 ; #DEBUG_LINE_NO:396
    Game.SetHandscannerDistortionLevel(0) ; #DEBUG_LINE_NO:397
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveAllImods()
  Game.SetHandscannerDistortionLevel(0) ; #DEBUG_LINE_NO:402
  currentImodIndex = -1 ; #DEBUG_LINE_NO:403
  currentImodTime = 0.0 ; #DEBUG_LINE_NO:404
  Int I = 0 ; #DEBUG_LINE_NO:406
  While I < TempleScanImods.Length ; #DEBUG_LINE_NO:407
    If TempleScanImods[I].scanTempleImod ; #DEBUG_LINE_NO:408
      TempleScanImods[I].scanTempleImod.Remove() ; #DEBUG_LINE_NO:409
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:411
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
