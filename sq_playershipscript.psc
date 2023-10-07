ScriptName SQ_PlayerShipScript Extends Quest

;-- Variables ---------------------------------------
Bool bShowNormalTrace = True
Int iDialogueEventTimerID = 1 Const
inputenablelayer myTestLayer

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CrewAssignmentLock
Guard playerShipsChangeLock

;-- Properties --------------------------------------
Group DismissedCrewData
  RefCollectionAlias Property DismissedCrew Auto Const mandatory
  { collection of dismissed crew who are on board - crew is removed from this alias when they manage to leave the ship }
  RefCollectionAlias Property DisembarkingCrew Auto Const mandatory
  { collection of crew trying to disembark - gives a package to a landing exit marker }
  LocationAlias Property LandingLocation Auto Const mandatory
  { filled by script to test for a valid exit marker (for dismissed crew) }
  ReferenceAlias Property LandingLocationExitMarker Auto Const mandatory
  { used for dismissed crew to exit }
  Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Auto Const mandatory
  { used for dismissed elite crew to go home if it's somewhere other than their editor location }
EndGroup

Group PlayerShipAliases
  ReferenceAlias Property PlayerShip Auto mandatory
  { alias holding current player ship - for other quests to access }
  LocationAlias Property playerShipExteriorLocation Auto Const mandatory
  LocationAlias Property playerShipInteriorLocation Auto Const mandatory
  ReferenceAlias Property PlayerShipCockpitModule Auto mandatory
  ReferenceAlias Property InteriorRobotBay Auto Const mandatory
  ReferenceAlias Property LandingDeckNearRampMarker Auto Const mandatory
  ReferenceAlias Property LandingDeckNearRobotBay Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property HomeShipCrewMarker Auto mandatory
  ReferenceAlias Property HomeShipPassengerMarker Auto mandatory
  ReferenceAlias Property PlayerShipSpaceshipInventory Auto Const mandatory
  ReferenceAlias Property PlayerShipWorkshop Auto Const mandatory
  ReferenceAlias Property PlayerShipLandingMarker Auto mandatory
EndGroup

Group keywords
  Keyword Property LandingMarkerKeyword Auto Const mandatory
  { used to find landing marker }
  Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
  { used to find landing zone trigger }
  Keyword Property SQ_LinkPlayerShipGoHome Auto Const mandatory
  { link player ships so they know where to go when sent "home" }
  Keyword Property SpaceshipStoredLink Auto Const mandatory
  { link non-home ships to landing marker }
  Keyword Property BEEncounterTypeDocking Auto Const mandatory
  { Keyword used to start Boarding Encounters when the player's ship docks with any other ship. }
  Keyword Property SQ_PlayerShipDialogueEvent Auto Const mandatory
  { keyword used to start random conversations on the player's ship }
  Keyword Property SQ_PlayerShipTakeoffEvent Auto Const mandatory
  { keyword sent to story manager when player's ship takes off }
  Keyword Property CannotBeHomeShip Auto Const mandatory
  { keyword to check before making home ship }
  Keyword Property LinkShipLandingOverlayMapMarker Auto Const mandatory
  { used to find map marker in ship landing overlay }
  Keyword Property SpaceshipLinkedInterior Auto Const mandatory
  { used to get ship interior cell }
  Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const mandatory
  { keyword that prevents landing ramp from opening on landing - need to remove in case ship was previously tagged with this }
  Keyword Property IsStarstation Auto Const mandatory
  { keyword to check before making home ship }
  Keyword Property SpaceshipImmobile Auto Const mandatory
  { keyword to check before making home ship }
EndGroup

Group DebugUseOnly
  ActorValue Property SpaceshipLandedValue Auto Const mandatory
  { DO NOT SET THIS IN NON DEBUG SITUATIONS...
Used by UI to know that a ship has landed. This needs to be set before you can assign crew to ship. BUt currently the player has to be in the laoded area of the ship to get that set. }
  Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
  { keyword used to move player's ship when debugging a forced move }
  ObjectReference Property Frontier_ModularREF Auto Const mandatory
  { autofill }
  ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
  { autofill }
  ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
  { autofill }
  ActorBase Property MissionBoardPassenger_Type06 Auto Const mandatory
  { autofill }
EndGroup

Group PassengerData
  ActorValue Property SpaceshipPassengerSlots Auto Const mandatory
  { tracks how mamy passengers allowed on player ship }
  RefCollectionAlias Property Passengers Auto Const mandatory
  { collection holding passengers }
EndGroup

Group SerpentsEmbraceProperties
  Perk Property TRAIT_SerpentsEmbrace Auto Const mandatory
  { autofill }
  Spell Property Trait_SerpentsEmbrace_Buff Auto Const mandatory
  { autofill }
EndGroup

Group AchivementsData
  Int Property ModifyShipAchievement = 26 Auto Const
  { achievement for collecting ships }
  Int Property CollectShipsAchievement = 41 Auto Const
  { achievement for collecting ships }
  Int Property CollectShipsAchievementCount = 10 Auto Const
  { number of ships to own to get achievement }
EndGroup

ReferenceAlias Property Vasco Auto Const mandatory
LocationAlias Property VascoWaitLocation Auto Const mandatory
{ autofill; used to get Vasco to wait for player outside hatch at space stations, etc. }
ReferenceAlias Property VascoWaitMarker Auto Const mandatory
{ autofill; used to get Vasco to wait for player outside hatch at space stations, etc. }
LocationRefType Property Crew_VascoWaitRefType Auto Const mandatory
{ autofill; used to get Vasco to wait for player outside hatch at space stations, etc. }
Faction Property CurrentFollowerFaction Auto Const mandatory
{ autofill }
Faction Property CurrentCrewFaction Auto Const mandatory
{ autofill }
Faction Property PlayerFaction Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property HomeShip Auto Const mandatory
{ alias holding player home ship - usually this is the same as PlayerShip but not always }
LocationAlias Property HomeShipExteriorLocation Auto Const mandatory
{ locAlias holding the player home ship exterior }
LocationAlias Property HomeShipInteriorLocation Auto Const mandatory
{ locAlias holding the player home ship interior }
ReferenceAlias Property HomeShipArmillary Auto Const mandatory
{ alias holding potential armillary object on the player's home ship exterior }
ReferenceAlias Property HomeShipArmillaryScreen Auto Const mandatory
{ alias holding armillary screen activator on the player's home ship interior }
ReferenceAlias Property HomeShipArmillaryScreenTrigger Auto Const mandatory
{ alias holding armillary screen activator trigger that the player will actually activate }
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property PreviousHomeShip Auto Const mandatory
{ alias holding previous home ship - used for text replacement in home ship message }
RefCollectionAlias Property PlayerShips Auto Const mandatory
{ collection of all player ships }
ReferenceAlias Property HomeShipMarker Auto Const mandatory
{ TEMP - for now, link all home ships to this marker so they know how to "go home"
  this needs to move into UI at some point and/or we need a way to "stack" ships in a single location
  `TTP-29740: Ships: figure out how multiple player ships can exist at a single location` }
RefCollectionAlias Property BoardingCrew Auto Const mandatory
{ put crew in this collection to pick up "defensive" packages }
RefCollectionAlias Property PlayerShipDockingPortDoors Auto Const mandatory
{ put docking port doors in this collection }
Int Property Tutorial_NewHomeShip_Stage = 10 Auto Const
{ tutorial stage for when you get a new home ship }
Message Property SQ_PlayerShip_NewHomeShipMessage Auto Const mandatory
{ message when player switches home ship }
Message Property SQ_PlayerShip_NewHomeShipMessageNoReturn Auto Const mandatory
{ message when player switches home ship, but previous home ship is still player ship }
LocationRefType Property Ship_PilotSeat_RefType Auto Const mandatory
{ used to check if player sits in a pilot seat }
ActorValue Property SpaceshipDockingPermission Auto Const mandatory
{ used to check the ship docking with me }
sq_crewscript Property SQ_Crew Auto Const mandatory
reparentscript Property RE_Parent Auto Const mandatory
{ send RE cleanup events }
GlobalVariable Property MQ101VascoQuestFollower Auto Const mandatory
{ Special MQ101 handling for Vasco }
ReferenceAlias Property MQ00_Armillary Auto Const mandatory
{ Special MQ Alias to hold the Armillary }
GlobalVariable Property MQArmillaryLocation Auto Const mandatory
{ special Global to check where the Armillary is. 1 = on HomeShip, 0 = on player, 2 = at Outpost }
ActorValue Property FOL_ActiveFollower Auto Const mandatory
{ track if crew member has been dismissed }
ActorValue Property COM_PQ_LockedIn Auto Const mandatory
{ track if crew member is Locked In }
Float Property fDialogueEventTimeSecondsMin = 120.0 Auto Const
{ how often is the scripted "dialogue event" sent while the player is on the ship }
Float Property fDialogueEventTimeSecondsMax = 240.0 Auto Const
{ how often is the scripted "dialogue event" sent while the player is on the ship }

;-- Functions ---------------------------------------

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function TestGetCurrentPlanet(ObjectReference testRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function SendPlayerShipChangedEvent(spaceshipreference newPlayerShip)
  Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:237
  kargs[0] = newPlayerShip as Var ; #DEBUG_LINE_NO:238
  Self.SendCustomEvent("sq_playershipscript_SQ_PlayerShipChanged", kargs) ; #DEBUG_LINE_NO:239
EndFunction

Function SendPlayerSellShipEvent(spaceshipreference akShip)
  Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:245
  kargs[0] = akShip as Var ; #DEBUG_LINE_NO:246
  Self.SendCustomEvent("sq_playershipscript_SQ_PlayerSellShip", kargs) ; #DEBUG_LINE_NO:247
EndFunction

Function LoadCrewInterior()
  spaceshipreference homeShipRef = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:256
  ObjectReference crewMarker = HomeShipCrewMarker.GetRef() ; #DEBUG_LINE_NO:257
  ObjectReference passengerMarker = HomeShipPassengerMarker.GetRef() ; #DEBUG_LINE_NO:258
  Actor VascoREF = Vasco.GetActorRef() ; #DEBUG_LINE_NO:259
  Self.LoadVascoInterior() ; #DEBUG_LINE_NO:263
  If homeShipRef ; #DEBUG_LINE_NO:265
    If crewMarker ; #DEBUG_LINE_NO:266
      Actor[] crewList = homeShipRef.GetAllCrewMembers() ; #DEBUG_LINE_NO:268
      If crewList == None ; #DEBUG_LINE_NO:271
        crewList = new Actor[0] ; #DEBUG_LINE_NO:272
      EndIf ; #DEBUG_LINE_NO:
      Actor[] dismissedCrewList = DismissedCrew.GetActorArray() ; #DEBUG_LINE_NO:276
      Int I = 0 ; #DEBUG_LINE_NO:278
      While I < dismissedCrewList.Length ; #DEBUG_LINE_NO:279
        Actor currentDismissedActor = dismissedCrewList[I] ; #DEBUG_LINE_NO:280
        Bool notDisembarking = DisembarkingCrew.Find(currentDismissedActor as ObjectReference) < 0 ; #DEBUG_LINE_NO:282
        If notDisembarking ; #DEBUG_LINE_NO:284
          crewList.add(currentDismissedActor, 1) ; #DEBUG_LINE_NO:286
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:288
      EndWhile ; #DEBUG_LINE_NO:
      I = 0 ; #DEBUG_LINE_NO:293
      While I < crewList.Length ; #DEBUG_LINE_NO:294
        Actor crew = crewList[I] ; #DEBUG_LINE_NO:295
        If crew != VascoREF ; #DEBUG_LINE_NO:296
          If crew.GetValue(COM_PQ_LockedIn) == 1.0 && crew.GetValue(FOL_ActiveFollower) == 0.0 ; #DEBUG_LINE_NO:300
             ; #DEBUG_LINE_NO:
          ElseIf crew.IsInLocation(playerShipInteriorLocation.GetLocation()) == False ; #DEBUG_LINE_NO:303
            If crew.GetValue(FOL_ActiveFollower) ; #DEBUG_LINE_NO:306
               ; #DEBUG_LINE_NO:
            Else ; #DEBUG_LINE_NO:
              crew.MoveTo(crewMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:311
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:315
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If passengerMarker ; #DEBUG_LINE_NO:319
      Int i = 0 ; #DEBUG_LINE_NO:321
      While i < Passengers.GetCount() ; #DEBUG_LINE_NO:322
        ObjectReference theRef = Passengers.GetAt(i) ; #DEBUG_LINE_NO:323
        If theRef.GetValue(FOL_ActiveFollower) ; #DEBUG_LINE_NO:327
           ; #DEBUG_LINE_NO:
        ElseIf theRef.IsDisabled() || theRef.IsInLocation(playerShipInteriorLocation.GetLocation()) ; #DEBUG_LINE_NO:332
           ; #DEBUG_LINE_NO:
        Else ; #DEBUG_LINE_NO:
          theRef.MoveTo(passengerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:336
        EndIf ; #DEBUG_LINE_NO:
        i += 1 ; #DEBUG_LINE_NO:338
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LoadVascoExterior()
  Actor VascoREF = Vasco.GetActorRef() ; #DEBUG_LINE_NO:347
  If VascoREF.IsInFaction(CurrentFollowerFaction) || VascoREF.IsInFaction(CurrentCrewFaction) || MQ101VascoQuestFollower.GetValueInt() == 1 ; #DEBUG_LINE_NO:348
    ObjectReference movetoRef = None ; #DEBUG_LINE_NO:350
    Location currentLoc = Game.GetPlayer().GetCurrentLocation() ; #DEBUG_LINE_NO:351
    If currentLoc.HasRefType(Crew_VascoWaitRefType) ; #DEBUG_LINE_NO:352
      VascoWaitLocation.ForceLocationTo(currentLoc) ; #DEBUG_LINE_NO:353
      VascoWaitMarker.RefillAlias() ; #DEBUG_LINE_NO:354
      movetoRef = VascoWaitMarker.GetReference() ; #DEBUG_LINE_NO:355
    Else ; #DEBUG_LINE_NO:
      movetoRef = LandingDeckNearRobotBay.GetRef() ; #DEBUG_LINE_NO:358
      If movetoRef.IsInSpace() ; #DEBUG_LINE_NO:359
        movetoRef = None ; #DEBUG_LINE_NO:360
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If movetoRef ; #DEBUG_LINE_NO:364
      VascoREF.MoveTo(movetoRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:366
      VascoREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:368
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LoadVascoInterior()
  Actor VascoREF = Vasco.GetActorRef() ; #DEBUG_LINE_NO:380
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:381
  If playerShipRef.IsCrew(VascoREF) || SQ_Crew.IsActiveEliteCrew(VascoREF) || MQ101VascoQuestFollower.GetValueInt() == 1 ; #DEBUG_LINE_NO:383
    ObjectReference RobotBayREF = InteriorRobotBay.GetRef() ; #DEBUG_LINE_NO:384
    If RobotBayREF as Bool && playerShipInteriorLocation != None ; #DEBUG_LINE_NO:386
      If VascoREF.IsInLocation(playerShipInteriorLocation.GetLocation()) == False ; #DEBUG_LINE_NO:389
        VascoREF.MoveToFurniture(RobotBayREF) ; #DEBUG_LINE_NO:392
        VascoREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:394
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetPlayerShip(spaceshipreference newPlayerShip)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:403
    PlayerShip.ForceRefTo(newPlayerShip as ObjectReference) ; #DEBUG_LINE_NO:406
    newPlayerShip.SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:408
    playerShipExteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:410
    playerShipInteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:411
    playerShipExteriorLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:412
    playerShipInteriorLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:413
    PlayerShipSpaceshipInventory.GetRef().Unlock(False) ; #DEBUG_LINE_NO:414
    If newPlayerShip == HomeShip.GetShipRef() ; #DEBUG_LINE_NO:417
      Self.RefillHomeShipAliases() ; #DEBUG_LINE_NO:419
    EndIf ; #DEBUG_LINE_NO:
    Self.SendPlayerShipChangedEvent(newPlayerShip) ; #DEBUG_LINE_NO:423
    If PlayerShipLandingMarker.GetRef() as Bool && newPlayerShip.IsInSpace() ; #DEBUG_LINE_NO:426
      Self.HandleShipTakeOff(False, False) ; #DEBUG_LINE_NO:427
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RefillHomeShipAliases()
  HomeShipPassengerMarker.Clear() ; #DEBUG_LINE_NO:434
  HomeShipExteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:437
  HomeShipInteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:438
  HomeShipExteriorLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:439
  HomeShipInteriorLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:440
  Self.ResetHomeShipArmillary() ; #DEBUG_LINE_NO:441
EndFunction

Function ResetHomeShip(spaceshipreference newHomeShip)
  If PlayerShip.GetRef() == None ; #DEBUG_LINE_NO:447
    Self.ResetPlayerShip(newHomeShip) ; #DEBUG_LINE_NO:448
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference oldHomeShip = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:450
  If newHomeShip != oldHomeShip && newHomeShip.HasKeyword(CannotBeHomeShip) == False && newHomeShip.HasKeyword(IsStarstation) == False && newHomeShip.HasKeyword(SpaceshipImmobile) == False ; #DEBUG_LINE_NO:451
    Game.TrySetPlayerHomeSpaceShip(newHomeShip as ObjectReference) ; #DEBUG_LINE_NO:452
  EndIf ; #DEBUG_LINE_NO:
  Self.EnableHomeShipArmillaryScreen() ; #DEBUG_LINE_NO:457
EndFunction

Function EnableHomeShipArmillaryScreen()
  ObjectReference ArmillaryScreenTriggerREF = HomeShipArmillaryScreenTrigger.GetRef() ; #DEBUG_LINE_NO:462
  If MQAlllowArmillaryGravDrive.GetValueInt() >= 1 && ArmillaryScreenTriggerREF.IsDisabled() ; #DEBUG_LINE_NO:463
    ArmillaryScreenTriggerREF.Enable(False) ; #DEBUG_LINE_NO:464
  EndIf ; #DEBUG_LINE_NO:
  If MQArmillaryLocation.GetValueInt() == 1 ; #DEBUG_LINE_NO:468
    HomeShipArmillaryScreen.GetRef().PlayAnimation("Play01") ; #DEBUG_LINE_NO:469
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetHomeShipArmillary()
  ObjectReference ArmillaryREF = MQ00_Armillary.GetRef() ; #DEBUG_LINE_NO:476
  ObjectReference HomeShipArmillaryREF = HomeShipArmillary.GetRef() ; #DEBUG_LINE_NO:477
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:478
  Bool bArmillaryOnHomeShip = False ; #DEBUG_LINE_NO:479
  If MQArmillaryLocation.GetValueInt() == 1 && HomeShipArmillaryREF != ArmillaryREF ; #DEBUG_LINE_NO:481
    (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:482
    (HomeShipArmillaryREF as armillaryscript).BuildArmillary(PlayerREF, HomeShipArmillaryScreenTrigger.GetRef()) ; #DEBUG_LINE_NO:483
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:489
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnHomeShipSet") ; #DEBUG_LINE_NO:490
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerModifiedShip") ; #DEBUG_LINE_NO:491
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:492
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:493
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:494
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerBuyShip") ; #DEBUG_LINE_NO:495
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerSellShip") ; #DEBUG_LINE_NO:496
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:498
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipTakeOff") ; #DEBUG_LINE_NO:499
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:500
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:501
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:502
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel") ; #DEBUG_LINE_NO:503
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan") ; #DEBUG_LINE_NO:504
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:505
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnCrewDismissed") ; #DEBUG_LINE_NO:506
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnCrewAssigned") ; #DEBUG_LINE_NO:507
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:508
  Self.RegisterForRemoteEvent(PlayerShips as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:511
  ObjectReference playerShipInventoryRef = PlayerShipSpaceshipInventory.GetRef() ; #DEBUG_LINE_NO:514
  If playerShipInventoryRef != None ; #DEBUG_LINE_NO:515
    playerShipInventoryRef.Unlock(False) ; #DEBUG_LINE_NO:516
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerBuyShip(Actor akSender, spaceshipreference akShip)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:523
    PlayerShips.AddRef(akShip as ObjectReference) ; #DEBUG_LINE_NO:524
    Self.CheckForShipAchievements() ; #DEBUG_LINE_NO:525
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerSellShip(Actor akSenderRef, spaceshipreference akShip)
  Self.RemovePlayerShip(akShip) ; #DEBUG_LINE_NO:532
  Self.SendPlayerSellShipEvent(akShip) ; #DEBUG_LINE_NO:533
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  spaceshipreference akShip = akSenderRef as spaceshipreference ; #DEBUG_LINE_NO:537
  If akShip ; #DEBUG_LINE_NO:538
    Self.RemovePlayerShip(akShip) ; #DEBUG_LINE_NO:541
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RemovePlayerShip(spaceshipreference akShip)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:547
    If PlayerShips.Find(akShip as ObjectReference) > -1 ; #DEBUG_LINE_NO:548
      If HomeShip.GetRef() != akShip as ObjectReference ; #DEBUG_LINE_NO:550
        PlayerShips.RemoveRef(akShip as ObjectReference) ; #DEBUG_LINE_NO:551
        Game.RemovePlayerOwnedShip(akShip) ; #DEBUG_LINE_NO:552
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function AddPlayerOwnedShip(spaceshipreference akShip)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:562
    Game.AddPlayerOwnedShip(akShip) ; #DEBUG_LINE_NO:563
    PlayerShips.AddRef(akShip as ObjectReference) ; #DEBUG_LINE_NO:564
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
  If akFurniture.HasRefType(Ship_PilotSeat_RefType) ; #DEBUG_LINE_NO:571
    spaceshipreference newShip = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:572
    If HomeShip.GetRef() == None ; #DEBUG_LINE_NO:573
      Self.ResetHomeShip(newShip) ; #DEBUG_LINE_NO:575
    Else ; #DEBUG_LINE_NO:
      Self.ResetPlayerShip(newShip) ; #DEBUG_LINE_NO:577
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnEnterShipInterior(Actor akSender, ObjectReference akShip)
  If akShip == Game.GetPlayerHomeSpaceShip() as ObjectReference ; #DEBUG_LINE_NO:585
    Self.ResetPlayerShip(Game.GetPlayer().GetCurrentShipRef()) ; #DEBUG_LINE_NO:587
    Self.LoadCrewInterior() ; #DEBUG_LINE_NO:589
    Self.StartDialogueTimer() ; #DEBUG_LINE_NO:591
    Self.EnableHomeShipArmillaryScreen() ; #DEBUG_LINE_NO:593
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnExitShipInterior(Actor akSender, ObjectReference akShip)
  Self.LoadVascoExterior() ; #DEBUG_LINE_NO:599
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, Bool abComplete)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:603
  If !abComplete ; #DEBUG_LINE_NO:606
    If playerShipRef != None ; #DEBUG_LINE_NO:608
      Self.ClearLandingZone(playerShipRef) ; #DEBUG_LINE_NO:610
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    ObjectReference landingMarker = playerShipRef.GetLinkedRef(LandingMarkerKeyword) ; #DEBUG_LINE_NO:614
    ObjectReference oldLandingMarker = PlayerShipLandingMarker.GetRef() ; #DEBUG_LINE_NO:616
    If oldLandingMarker as Bool && oldLandingMarker != landingMarker ; #DEBUG_LINE_NO:617
      SQ_Followers.TeleportWaitingFollowersToShip(None) ; #DEBUG_LINE_NO:620
      Self.HandleShipTakeOff(True, True) ; #DEBUG_LINE_NO:621
    EndIf ; #DEBUG_LINE_NO:
    PlayerShipLandingMarker.ForceRefTo(landingMarker) ; #DEBUG_LINE_NO:624
    Self.ResetHomeShip(playerShipRef) ; #DEBUG_LINE_NO:627
    Self.CheckForDismissedCrew() ; #DEBUG_LINE_NO:630
    SQ_Parent.CheckCompletePlanetSurvey(playerShipRef.GetCurrentPlanet(), False) ; #DEBUG_LINE_NO:633
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipTakeoff(ReferenceAlias akSender, Bool abComplete)
  If !abComplete ; #DEBUG_LINE_NO:640
    Self.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:641
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If abComplete == False ; #DEBUG_LINE_NO:653
    spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:655
    spaceshipreference otherShipRef = None ; #DEBUG_LINE_NO:656
    If playerShipRef == akDocking ; #DEBUG_LINE_NO:657
      otherShipRef = akParent ; #DEBUG_LINE_NO:659
    Else ; #DEBUG_LINE_NO:
      otherShipRef = akDocking ; #DEBUG_LINE_NO:662
    EndIf ; #DEBUG_LINE_NO:
    BEEncounterTypeDocking.SendStoryEvent(None, akSource.GetRef(), otherShipRef as ObjectReference, 100, 0) ; #DEBUG_LINE_NO:666
    Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:667
    If otherShipRef as Bool && otherShipRef.GetActorFactionReaction(player) == 1 ; #DEBUG_LINE_NO:670
      Actor[] myCrew = playerShipRef.GetAllCrewMembers() ; #DEBUG_LINE_NO:672
      BoardingCrew.AddArray(myCrew as ObjectReference[]) ; #DEBUG_LINE_NO:673
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If abComplete ; #DEBUG_LINE_NO:680
    BoardingCrew.RemoveAll() ; #DEBUG_LINE_NO:682
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, Int aState)
  If aState == 1 ; #DEBUG_LINE_NO:689
    spaceshipreference currentPlayerShip = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:691
    If currentPlayerShip == akSender.GetShipRef() ; #DEBUG_LINE_NO:692
      Self.ResetHomeShip(currentPlayerShip) ; #DEBUG_LINE_NO:693
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:700
  If aState == 2 && PlayerREF.HasPerk(TRAIT_SerpentsEmbrace) ; #DEBUG_LINE_NO:701
    PlayerREF.DispelSpell(Trait_SerpentsEmbrace_Buff) ; #DEBUG_LINE_NO:702
    Trait_SerpentsEmbrace_Buff.Cast(PlayerREF as ObjectReference, PlayerREF as ObjectReference) ; #DEBUG_LINE_NO:703
  EndIf ; #DEBUG_LINE_NO:
  RE_Parent.SendCleanupEvent() ; #DEBUG_LINE_NO:707
EndEvent

Event ReferenceAlias.OnShipScan(ReferenceAlias akSender, Location aPlanet, ObjectReference[] aMarkersArray)
  planet planetToCheck = aPlanet.GetCurrentPlanet() ; #DEBUG_LINE_NO:716
  SQ_Parent.OnPlayerScanPlanet(planetToCheck) ; #DEBUG_LINE_NO:718
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Self.UpdateDismissedCrew() ; #DEBUG_LINE_NO:724
  Self.LoadCrewInterior() ; #DEBUG_LINE_NO:727
  RE_Parent.SendCleanupEvent() ; #DEBUG_LINE_NO:729
EndEvent

Event RefCollectionAlias.OnLocationChange(RefCollectionAlias akSource, ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  If akSource == PlayerShips && akSenderRef != HomeShip.GetRef() ; #DEBUG_LINE_NO:735
    ObjectReference homeMarkerRef = akSenderRef.GetLinkedRef(SpaceshipStoredLink) ; #DEBUG_LINE_NO:737
    If homeMarkerRef as Bool && homeMarkerRef.GetCurrentLocation() == akNewLoc ; #DEBUG_LINE_NO:738
      akSenderRef.DisableNoWait(False) ; #DEBUG_LINE_NO:740
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnCrewDismissed(RefCollectionAlias akSource, ObjectReference akSenderRef, Actor akCrew, ObjectReference akPreviousAssignmentRef)
  Guard CrewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:747
    If SQ_Crew.HandleOnCrewDismissed(akCrew, akPreviousAssignmentRef) ; #DEBUG_LINE_NO:748
      DismissedCrew.AddRef(akCrew as ObjectReference) ; #DEBUG_LINE_NO:749
      Self.CheckForDismissedCrew() ; #DEBUG_LINE_NO:750
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnCrewAssigned(RefCollectionAlias akSource, ObjectReference akSenderRef, Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  Guard CrewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:757
    SQ_Crew.HandleOnCrewAssigned(akCrew, akSenderRef) ; #DEBUG_LINE_NO:758
    DismissedCrew.RemoveRef(akCrew as ObjectReference) ; #DEBUG_LINE_NO:759
    DisembarkingCrew.RemoveRef(akCrew as ObjectReference) ; #DEBUG_LINE_NO:760
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, spaceshipreference akShip, spaceshipreference akPrevious)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:766
    If akShip != akPrevious ; #DEBUG_LINE_NO:769
      HomeShip.ForceRefTo(akShip as ObjectReference) ; #DEBUG_LINE_NO:770
      Self.RefillHomeShipAliases() ; #DEBUG_LINE_NO:772
      akShip.SetLinkedRef(None, SpaceshipStoredLink, True) ; #DEBUG_LINE_NO:775
      PlayerShips.AddRef(akShip as ObjectReference) ; #DEBUG_LINE_NO:778
      Self.CheckForShipAchievements() ; #DEBUG_LINE_NO:779
      Self.LoadCrewInterior() ; #DEBUG_LINE_NO:780
      akShip.RemoveKeyword(SpaceshipPreventRampOpenOnLanding) ; #DEBUG_LINE_NO:783
      If akPrevious ; #DEBUG_LINE_NO:786
        Cell shipInterior = akShip.GetLinkedCell(SpaceshipLinkedInterior) ; #DEBUG_LINE_NO:788
        shipInterior.SetFactionOwner(PlayerFaction) ; #DEBUG_LINE_NO:789
        shipInterior.SetPublic(True) ; #DEBUG_LINE_NO:790
        ObjectReference homeShipMarkerRef = HomeShipMarker.GetRef() ; #DEBUG_LINE_NO:792
        akPrevious.SetLinkedRef(homeShipMarkerRef, SQ_LinkPlayerShipGoHome, True) ; #DEBUG_LINE_NO:794
        ObjectReference previousStoredLinkedRef = akPrevious.GetLinkedRef(SpaceshipStoredLink) ; #DEBUG_LINE_NO:796
        If previousStoredLinkedRef == None ; #DEBUG_LINE_NO:798
          akPrevious.SetLinkedRef(homeShipMarkerRef, SpaceshipStoredLink, True) ; #DEBUG_LINE_NO:800
        EndIf ; #DEBUG_LINE_NO:
        PreviousHomeShip.ForceRefTo(akPrevious as ObjectReference) ; #DEBUG_LINE_NO:803
        If (akPrevious as ObjectReference == PlayerShip.GetRef()) && Game.GetPlayer().GetCurrentShipRef() != akPrevious ; #DEBUG_LINE_NO:805
          Self.ResetPlayerShip(akShip) ; #DEBUG_LINE_NO:807
        EndIf ; #DEBUG_LINE_NO:
        If akPrevious.IsDisabled() == False ; #DEBUG_LINE_NO:811
          If akPrevious as ObjectReference == PlayerShip.GetRef() ; #DEBUG_LINE_NO:813
            SQ_PlayerShip_NewHomeShipMessageNoReturn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:816
          ElseIf akPrevious.IsInSpace() == False ; #DEBUG_LINE_NO:817
            SQ_PlayerShip_NewHomeShipMessageNoReturn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:820
          Else ; #DEBUG_LINE_NO:
            SQ_PlayerShip_NewHomeShipMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:823
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Int i = 0 ; #DEBUG_LINE_NO:828
        While i < Passengers.GetCount() ; #DEBUG_LINE_NO:829
          ObjectReference theRef = Passengers.GetAt(i) ; #DEBUG_LINE_NO:830
          If theRef.IsDisabled() == False ; #DEBUG_LINE_NO:832
            theRef.MoveTo(akShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:833
            akShip.DamageValue(SpaceshipPassengerSlots, 1.0) ; #DEBUG_LINE_NO:834
            akPrevious.RestoreValue(SpaceshipPassengerSlots, 1.0) ; #DEBUG_LINE_NO:835
          EndIf ; #DEBUG_LINE_NO:
          i += 1 ; #DEBUG_LINE_NO:837
        EndWhile ; #DEBUG_LINE_NO:
        If Self.GetStageDone(Tutorial_NewHomeShip_Stage) == False ; #DEBUG_LINE_NO:841
          Self.SetStage(Tutorial_NewHomeShip_Stage) ; #DEBUG_LINE_NO:842
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      spaceshipreference[] playerOwnedShips = Game.GetPlayerOwnedShips() ; #DEBUG_LINE_NO:846
      Int I = 0 ; #DEBUG_LINE_NO:848
      While I < playerOwnedShips.Length ; #DEBUG_LINE_NO:849
        PlayerShips.AddRef(playerOwnedShips[I] as ObjectReference) ; #DEBUG_LINE_NO:851
        I += 1 ; #DEBUG_LINE_NO:852
      EndWhile ; #DEBUG_LINE_NO:
      Self.CheckForShipAchievements() ; #DEBUG_LINE_NO:854
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerModifiedShip(Actor akSource, spaceshipreference akShip)
  Game.AddAchievement(ModifyShipAchievement) ; #DEBUG_LINE_NO:863
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:865
  If akShip == playerShipRef ; #DEBUG_LINE_NO:866
    Self.ResetPlayerShip(akShip) ; #DEBUG_LINE_NO:867
  Else ; #DEBUG_LINE_NO:
    akShip.SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:870
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iDialogueEventTimerID ; #DEBUG_LINE_NO:875
    If Game.GetPlayer().GetCurrentShipRef() as ObjectReference == HomeShip.GetRef() ; #DEBUG_LINE_NO:877
      SQ_PlayerShipDialogueEvent.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:879
      Self.StartDialogueTimer() ; #DEBUG_LINE_NO:881
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartDialogueTimer()
  Float fTimerSeconds = Utility.RandomFloat(fDialogueEventTimeSecondsMin, fDialogueEventTimeSecondsMax) ; #DEBUG_LINE_NO:888
  Self.StartTimer(fTimerSeconds, iDialogueEventTimerID) ; #DEBUG_LINE_NO:890
EndFunction

Function ClearLandingZone(spaceshipreference landingShip)
  If landingShip ; #DEBUG_LINE_NO:894
    ObjectReference landingMarker = landingShip.GetLinkedRef(LandingMarkerKeyword) ; #DEBUG_LINE_NO:895
    If landingMarker ; #DEBUG_LINE_NO:898
      landingzonetriggerscript landingZoneTrigger = landingMarker.GetLinkedRef(LandingZoneTriggerKeyword) as landingzonetriggerscript ; #DEBUG_LINE_NO:900
      If landingZoneTrigger ; #DEBUG_LINE_NO:902
        landingZoneTrigger.BeginLanding(landingShip, landingMarker) ; #DEBUG_LINE_NO:903
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleShipTakeOff(Bool bResetHomeShip, Bool bFastTraveledToSurface)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:911
  ObjectReference landingMarker = PlayerShipLandingMarker.GetRef() ; #DEBUG_LINE_NO:912
  spaceshipreference currentPlayerShipRef = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:913
  spaceshipreference playerHomeShip = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:914
  If currentPlayerShipRef == playerShipRef ; #DEBUG_LINE_NO:918
    SQ_PlayerShipTakeoffEvent.SendStoryEvent(None, playerShipRef as ObjectReference, landingMarker, 0, 0) ; #DEBUG_LINE_NO:920
    If bResetHomeShip ; #DEBUG_LINE_NO:921
      Self.ResetHomeShip(playerShipRef) ; #DEBUG_LINE_NO:923
    EndIf ; #DEBUG_LINE_NO:
    Self.EnableLandingMapMarker(landingMarker, True) ; #DEBUG_LINE_NO:926
    PlayerShipLandingMarker.Clear() ; #DEBUG_LINE_NO:928
  ElseIf playerHomeShip != playerShipRef ; #DEBUG_LINE_NO:929
    Self.ResetPlayerShip(None) ; #DEBUG_LINE_NO:931
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableLandingMapMarker(ObjectReference landingMarkerRef, Bool bEnable)
  If landingMarkerRef ; #DEBUG_LINE_NO:936
    ObjectReference landingMapMarkerRef = landingMarkerRef.GetLinkedRef(LinkShipLandingOverlayMapMarker) ; #DEBUG_LINE_NO:937
    If landingMapMarkerRef ; #DEBUG_LINE_NO:939
      If bEnable ; #DEBUG_LINE_NO:940
        landingMapMarkerRef.Enable(False) ; #DEBUG_LINE_NO:942
      Else ; #DEBUG_LINE_NO:
        landingMapMarkerRef.Disable(False) ; #DEBUG_LINE_NO:945
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AddPassenger(Actor newPassenger)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:953
    Int found = Passengers.Find(newPassenger as ObjectReference) ; #DEBUG_LINE_NO:955
    If found < 0 && newPassenger.IsDead() == False ; #DEBUG_LINE_NO:956
      Passengers.AddRef(newPassenger as ObjectReference) ; #DEBUG_LINE_NO:957
      ObjectReference homeShipRef = HomeShip.GetRef() ; #DEBUG_LINE_NO:958
      homeShipRef.DamageValue(SpaceshipPassengerSlots, 1.0) ; #DEBUG_LINE_NO:959
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function AddPassengers(RefCollectionAlias newPassengers)
  Int I = 0 ; #DEBUG_LINE_NO:966
  While I < newPassengers.GetCount() ; #DEBUG_LINE_NO:967
    Self.AddPassenger(newPassengers.GetActorAt(I)) ; #DEBUG_LINE_NO:968
    I += 1 ; #DEBUG_LINE_NO:969
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemovePassenger(Actor removedPassenger)
  Guard playerShipsChangeLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:974
    Int found = Passengers.Find(removedPassenger as ObjectReference) ; #DEBUG_LINE_NO:976
    If found > -1 ; #DEBUG_LINE_NO:977
      ObjectReference homeShipRef = HomeShip.GetRef() ; #DEBUG_LINE_NO:978
      homeShipRef.RestoreValue(SpaceshipPassengerSlots, 1.0) ; #DEBUG_LINE_NO:979
      Passengers.RemoveRef(removedPassenger as ObjectReference) ; #DEBUG_LINE_NO:980
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RemovePassengers(RefCollectionAlias removedPassengers)
  Int I = 0 ; #DEBUG_LINE_NO:987
  While I < removedPassengers.GetCount() ; #DEBUG_LINE_NO:988
    Self.RemovePassenger(removedPassengers.GetActorAt(I)) ; #DEBUG_LINE_NO:989
    I += 1 ; #DEBUG_LINE_NO:990
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Int Function GetPassengerSlots(Bool returnBaseValue)
  Int slots = 0 ; #DEBUG_LINE_NO:995
  ObjectReference homeShipRef = HomeShip.GetRef() ; #DEBUG_LINE_NO:996
  If homeShipRef ; #DEBUG_LINE_NO:997
    If returnBaseValue ; #DEBUG_LINE_NO:998
      slots = homeShipRef.GetBaseValue(SpaceshipPassengerSlots) as Int ; #DEBUG_LINE_NO:999
    Else ; #DEBUG_LINE_NO:
      slots = homeShipRef.GetValue(SpaceshipPassengerSlots) as Int ; #DEBUG_LINE_NO:1001
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return slots ; #DEBUG_LINE_NO:1004
EndFunction

Function CheckForDismissedCrew()
  Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation() ; #DEBUG_LINE_NO:1010
  If DismissedCrew.GetCount() > 0 ; #DEBUG_LINE_NO:1013
    LandingLocation.ForceLocationTo(currentShipLocation) ; #DEBUG_LINE_NO:1017
    LandingLocationExitMarker.RefillAlias() ; #DEBUG_LINE_NO:1018
    If LandingLocationExitMarker.GetRef() ; #DEBUG_LINE_NO:1020
      DisembarkingCrew.AddRefCollection(DismissedCrew) ; #DEBUG_LINE_NO:1021
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateDismissedCrew()
  Int I = DismissedCrew.GetCount() - 1 ; #DEBUG_LINE_NO:1029
  While I > -1 ; #DEBUG_LINE_NO:1030
    Actor currentCrewMember = DismissedCrew.GetAt(I) as Actor ; #DEBUG_LINE_NO:1031
    If currentCrewMember ; #DEBUG_LINE_NO:1032
      If currentCrewMember.IsInLocation(playerShipInteriorLocation.GetLocation()) == False ; #DEBUG_LINE_NO:1034
        DismissedCrew.RemoveRef(currentCrewMember as ObjectReference) ; #DEBUG_LINE_NO:1035
        If currentCrewMember.HasKeyword(SQ_Crew.Crew_CrewTypeGeneric) ; #DEBUG_LINE_NO:1038
          SQ_Crew.SetRoleUnavailable(currentCrewMember, True) ; #DEBUG_LINE_NO:1040
        EndIf ; #DEBUG_LINE_NO:
        Self.MoveCrewToHome(currentCrewMember) ; #DEBUG_LINE_NO:1043
        SQ_Crew.TestAndHandleUnloadedUnassignedGenericCrew(currentCrewMember) ; #DEBUG_LINE_NO:1046
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:1049
  EndWhile ; #DEBUG_LINE_NO:
  DisembarkingCrew.RemoveAll() ; #DEBUG_LINE_NO:1052
  LandingLocationExitMarker.Clear() ; #DEBUG_LINE_NO:1055
EndFunction

Function MoveCrewToHome(Actor CrewActor)
  If CrewActor.IsInFaction(CurrentFollowerFaction) ; #DEBUG_LINE_NO:1061
    Return  ; #DEBUG_LINE_NO:1063
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference homeMarkerRef = CrewActor.GetLinkedRef(SQ_LinkCompanionEliteCrewHomeMarker) ; #DEBUG_LINE_NO:1067
  If homeMarkerRef ; #DEBUG_LINE_NO:1069
    CrewActor.MoveTo(homeMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1071
  Else ; #DEBUG_LINE_NO:
    CrewActor.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:1074
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckForShipAchievements()
  Int playerShipCount = PlayerShips.GetCount() ; #DEBUG_LINE_NO:1080
  If playerShipCount >= CollectShipsAchievementCount ; #DEBUG_LINE_NO:1081
    Game.AddAchievement(CollectShipsAchievement) ; #DEBUG_LINE_NO:1082
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsPlayerShip(spaceshipreference shipToCheck)
  Bool returnVal = False ; #DEBUG_LINE_NO:1088
  If shipToCheck ; #DEBUG_LINE_NO:1089
    spaceshipreference currentPlayerShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:1090
    If shipToCheck == currentPlayerShip ; #DEBUG_LINE_NO:1091
      returnVal = True ; #DEBUG_LINE_NO:1092
    Else ; #DEBUG_LINE_NO:
      Int findShip = PlayerShips.Find(shipToCheck as ObjectReference) ; #DEBUG_LINE_NO:1094
      returnVal = findShip > -1 ; #DEBUG_LINE_NO:1095
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:1100
EndFunction

Function TestDismissedCrew(Actor crew)
  DismissedCrew.AddRef(crew as ObjectReference) ; #DEBUG_LINE_NO:1108
EndFunction

Function TestDisableTakeoff(Bool bEnable)
  If myTestLayer == None ; #DEBUG_LINE_NO:1113
    myTestLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:1114
  EndIf ; #DEBUG_LINE_NO:
  myTestLayer.EnableTakeoff(bEnable) ; #DEBUG_LINE_NO:1116
EndFunction

Function debugMoveToPlayerShip()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:1120
  If playerShipRef ; #DEBUG_LINE_NO:1121
    Game.GetPlayer().MoveTo(playerShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1122
  EndIf ; #DEBUG_LINE_NO:
EndFunction

spaceshipreference Function DebugGetHomeShip()
  spaceshipreference homeShipRef = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:1128
  Int waitingFor = 0 ; #DEBUG_LINE_NO:1132
  Int maxWait = 10 ; #DEBUG_LINE_NO:1133
  While homeShipRef == None && waitingFor <= maxWait ; #DEBUG_LINE_NO:1134
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:1135
    homeShipRef = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:1136
    waitingFor += 1 ; #DEBUG_LINE_NO:1137
  EndWhile ; #DEBUG_LINE_NO:
  If homeShipRef == None ; #DEBUG_LINE_NO:1140
    String warnstring = "HomeShip alias not filled. Make sure player home ship exists before calling this function. (try calling: BAT \"Crew\\Homeship\" first." ; #DEBUG_LINE_NO:1141
    Return None ; #DEBUG_LINE_NO:1145
  EndIf ; #DEBUG_LINE_NO:
  Return homeShipRef ; #DEBUG_LINE_NO:1148
EndFunction

Function debugMoveToPlayerShipPilotSeat(Bool CallHandleTakeOff)
  spaceshipreference ShipRef = Self.DebugGetHomeShip() ; #DEBUG_LINE_NO:1153
  If ShipRef == None ; #DEBUG_LINE_NO:1154
    Return  ; #DEBUG_LINE_NO:1155
  EndIf ; #DEBUG_LINE_NO:
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:1160
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:1162
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:1163
  player.MoveTo(ShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1164
  If CallHandleTakeOff ; #DEBUG_LINE_NO:1165
    Self.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:1166
  EndIf ; #DEBUG_LINE_NO:
  PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False) ; #DEBUG_LINE_NO:1168
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:1169
EndFunction

spaceshipreference Function DebugCreateHomeShipInSpace(ObjectReference ReferenceToPutShipAt)
  Self.ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:1173
  If ReferenceToPutShipAt == None ; #DEBUG_LINE_NO:1175
    ReferenceToPutShipAt = NewGameShipMarkerREF ; #DEBUG_LINE_NO:1176
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference homeShipRef = Self.DebugGetHomeShip() ; #DEBUG_LINE_NO:1179
  homeShipRef.MoveTo(ReferenceToPutShipAt, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1181
  Return homeShipRef ; #DEBUG_LINE_NO:1183
EndFunction

spaceshipreference Function DebugCreateHomeShipLanded(ObjectReference ReferenceToPutShipAt)
  Self.ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:1187
  If ReferenceToPutShipAt == None ; #DEBUG_LINE_NO:1189
    ReferenceToPutShipAt = NewAtlantisShipLandingMarker ; #DEBUG_LINE_NO:1190
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference homeShipRef = Self.DebugGetHomeShip() ; #DEBUG_LINE_NO:1193
  Self.debugMovePlayerShip(homeShipRef, ReferenceToPutShipAt) ; #DEBUG_LINE_NO:1197
  Return homeShipRef ; #DEBUG_LINE_NO:1199
EndFunction

Function debugInitializeHomeShip(spaceshipreference frontierRef)
  spaceshipreference homeShipRef = HomeShip.GetShipRef() ; #DEBUG_LINE_NO:1205
  If homeShipRef == None ; #DEBUG_LINE_NO:1206
    Self.ResetHomeShip(frontierRef) ; #DEBUG_LINE_NO:1207
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function debugUpdatePlayerShips()
  spaceshipreference[] ownedShips = Game.GetPlayerOwnedShips() ; #DEBUG_LINE_NO:1212
  Int I = 0 ; #DEBUG_LINE_NO:1213
  While I < ownedShips.Length ; #DEBUG_LINE_NO:1214
    PlayerShips.AddRef(ownedShips[I] as ObjectReference) ; #DEBUG_LINE_NO:1215
    I += 1 ; #DEBUG_LINE_NO:1216
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function debugMovePlayerShip(spaceshipreference frontierRef, ObjectReference ShipLandingMarker)
  spaceshipreference ShipRef = frontierRef ; #DEBUG_LINE_NO:1222
  ShipRef.MoveTo(ShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1223
  ShipRef.SetLinkedRef(ShipLandingMarker, CurrentInteractionLinkedRefKeyword, True) ; #DEBUG_LINE_NO:1224
  ShipRef.Enable(False) ; #DEBUG_LINE_NO:1225
EndFunction

Function DebugAddPassengers(Int count)
  ObjectReference passengerMarker = HomeShipPassengerMarker.GetRef() ; #DEBUG_LINE_NO:1230
  Int I = 0 ; #DEBUG_LINE_NO:1231
  While I < count ; #DEBUG_LINE_NO:1232
    Actor passengerRef = passengerMarker.PlaceActorAtMe(MissionBoardPassenger_Type06, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:1233
    Self.AddPassenger(passengerRef) ; #DEBUG_LINE_NO:1234
    I += 1 ; #DEBUG_LINE_NO:1235
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:1244
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:1248
EndFunction
