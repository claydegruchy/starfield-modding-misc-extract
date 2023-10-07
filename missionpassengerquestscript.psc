ScriptName MissionPassengerQuestScript Extends MissionQuestScript conditional
{ passenger delivery quest script }

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard passengerChangeGuard

;-- Properties --------------------------------------
Group MissionTypeData
  RefCollectionAlias Property SourceCollection Auto Const mandatory
  { collection holding all valid source refs }
  RefCollectionAlias Property Passengers Auto Const mandatory
  { collection holding passengers }
  ReferenceAlias Property PassengerMarker Auto Const mandatory
  { alias holding marker in player's ship where passengers will be created }
  ReferenceAlias Property DestinationMarker Auto Const mandatory
  { alias holding marker where passengers will path to when disembarking }
  ReferenceAlias Property DisembarkMarker Auto Const mandatory
  { alias for finding nearby disembark marker when player lands (for failed missions) }
  LocationAlias Property SourceLocation Auto Const mandatory
  { alias with source location }
  ActorValue Property MissionBoardDisembark Auto Const mandatory
  { flags passengers to run disembark package }
  Message Property MissionBoardPassengerNoSpaceMessage Auto Const mandatory
  { if you don't have space on your ship for these passengers }
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { holds player home ship }
  Keyword Property MissionStoryKeywordPassengerDestination Auto Const mandatory
  { keyword to use to start this quest's passenger destination finder quest }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
  Float Property DestinationCheckDistance = 50000.0 Auto Const
  { if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }
  GlobalVariable Property PlayerPassengerSpaceCurrent Auto Const mandatory
  { used for text replacement - needs to be updated when player ship passengers changes }
  GlobalVariable Property PlayerPassengerSpaceTotal Auto Const mandatory
  { used for text replacement }
  Bool Property hasPassengerSpace = False Auto hidden
  { updated by UpdatePlayerPassengerSpace }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestTimerStart(Int aiReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function debugQuestTimeRemaining()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID) ; #DEBUG_LINE_NO:58
EndEvent

Function InitializePassengers()
  Bool foundValidDestination = False ; #DEBUG_LINE_NO:65
  If DestinationMarker.GetRef() ; #DEBUG_LINE_NO:67
    foundValidDestination = True ; #DEBUG_LINE_NO:68
  Else ; #DEBUG_LINE_NO:
    missionparentscript:missionlocreftype[] passengerTypes = new missionparentscript:missionlocreftype[MissionParent.passengerTypes.Length] ; #DEBUG_LINE_NO:70
    Int I = 0 ; #DEBUG_LINE_NO:72
    While I < MissionParent.passengerTypes.Length ; #DEBUG_LINE_NO:73
      passengerTypes[I] = MissionParent.passengerTypes[I] ; #DEBUG_LINE_NO:74
      I += 1 ; #DEBUG_LINE_NO:75
    EndWhile ; #DEBUG_LINE_NO:
    missiondestinationfinderscript finderQuest = None ; #DEBUG_LINE_NO:78
    missiondestinationfinderscript[] startedQuests = MissionStoryKeywordPassengerDestination.SendStoryEventAndWait(SourceLocation.GetLocation(), SourceCollection.GetAt(0), None, 0, 0) as missiondestinationfinderscript[] ; #DEBUG_LINE_NO:80
    If startedQuests.Length > 0 ; #DEBUG_LINE_NO:82
      finderQuest = startedQuests[0] ; #DEBUG_LINE_NO:84
      While finderQuest.IsStarting() ; #DEBUG_LINE_NO:85
         ; #DEBUG_LINE_NO:
      EndWhile ; #DEBUG_LINE_NO:
      foundValidDestination = finderQuest.FindMatchingDestination(passengerTypes, SourceCollection, PrimaryRef, DestinationMarker, TargetLocation) ; #DEBUG_LINE_NO:88
      TargetSystemLocation.RefillAlias() ; #DEBUG_LINE_NO:90
      TargetPlanetLocation.RefillAlias() ; #DEBUG_LINE_NO:91
      DisembarkMarker.ClearAndRefillAlias() ; #DEBUG_LINE_NO:92
      finderQuest.Stop() ; #DEBUG_LINE_NO:93
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If foundValidDestination ; #DEBUG_LINE_NO:97
    missionboardpassengersourcescript passengerTypeRef = PrimaryRef.GetRef() as missionboardpassengersourcescript ; #DEBUG_LINE_NO:99
    Int passengerCountMax = passengerTypeRef.passengerCountMax ; #DEBUG_LINE_NO:101
    ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef() ; #DEBUG_LINE_NO:102
    If PlayerShipRef ; #DEBUG_LINE_NO:103
      Int currentPassengerSlots = SQ_PlayerShip.GetPassengerSlots(False) ; #DEBUG_LINE_NO:104
      If currentPassengerSlots < passengerCountMax && currentPassengerSlots >= passengerTypeRef.PassengerCountMin ; #DEBUG_LINE_NO:107
        passengerCountMax = currentPassengerSlots ; #DEBUG_LINE_NO:108
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Int passengerCount = Utility.RandomInt(passengerTypeRef.PassengerCountMin, passengerCountMax) ; #DEBUG_LINE_NO:112
    MissionIntValue01.SetValue(passengerCount as Float) ; #DEBUG_LINE_NO:113
    Self.UpdateCurrentInstanceGlobal(MissionIntValue01) ; #DEBUG_LINE_NO:114
    Parent.OnQuestStarted() ; #DEBUG_LINE_NO:118
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForPassengerUnloading() ; #DEBUG_LINE_NO:128
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForPassengerUnloading() ; #DEBUG_LINE_NO:133
EndFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
  If Self.IsInTargetLocation(akNewLoc) ; #DEBUG_LINE_NO:139
    Self.CheckForPassengerUnloading() ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckForPassengerUnloading()
  Guard passengerChangeGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:147
    If PlayerCompletedQuest == False ; #DEBUG_LINE_NO:148
      spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:150
      Location currentShipLocation = PlayerShipRef.GetCurrentLocation() ; #DEBUG_LINE_NO:151
      If PlayerFailedQuest ; #DEBUG_LINE_NO:154
        TargetLocation.ForceLocationTo(currentShipLocation) ; #DEBUG_LINE_NO:158
        DisembarkMarker.ClearAndRefillAlias() ; #DEBUG_LINE_NO:159
        ObjectReference disembarkRef = DisembarkMarker.GetRef() ; #DEBUG_LINE_NO:160
        If disembarkRef ; #DEBUG_LINE_NO:163
          DestinationMarker.ForceRefTo(disembarkRef) ; #DEBUG_LINE_NO:164
          Self.HandlePassengersDisembark() ; #DEBUG_LINE_NO:165
        EndIf ; #DEBUG_LINE_NO:
      ElseIf PlayerAcceptedQuest ; #DEBUG_LINE_NO:
        If Self.IsInTargetLocation(currentShipLocation) ; #DEBUG_LINE_NO:169
          Self.HandlePassengersDisembark() ; #DEBUG_LINE_NO:172
        Else ; #DEBUG_LINE_NO:
          ObjectReference destinationMarkerRef = DestinationMarker.GetRef() ; #DEBUG_LINE_NO:176
          If PlayerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance ; #DEBUG_LINE_NO:177
            Self.HandlePassengersDisembark() ; #DEBUG_LINE_NO:180
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsInTargetLocation(Location locationToCheck)
  Location theTargetLocation = TargetLocation.GetLocation() ; #DEBUG_LINE_NO:191
  Bool returnVal = locationToCheck.IsSameLocation(theTargetLocation, None) || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarStation) || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarstationExterior) ; #DEBUG_LINE_NO:192
  Return returnVal ; #DEBUG_LINE_NO:194
EndFunction

Function HandlePlayerShipTakeOff()
  Passengers.SetValue(MissionBoardDisembark, 0.0) ; #DEBUG_LINE_NO:200
  Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:202
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:204
EndFunction

Function HandleOnQuestRejected()
  Self.CheckForPassengerUnloading() ; #DEBUG_LINE_NO:210
  Parent.HandleOnQuestRejected() ; #DEBUG_LINE_NO:212
EndFunction

Function UpdatePlayerPassengerSpace()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:216
  If PlayerShipRef ; #DEBUG_LINE_NO:217
    Int totalPassengerSlots = SQ_PlayerShip.GetPassengerSlots(True) ; #DEBUG_LINE_NO:219
    Int availablePassengerSlots = SQ_PlayerShip.GetPassengerSlots(False) ; #DEBUG_LINE_NO:220
    Int usedPassengerSlots = totalPassengerSlots - availablePassengerSlots ; #DEBUG_LINE_NO:221
    Int newPassengers = MissionIntValue01.GetValueInt() ; #DEBUG_LINE_NO:222
    hasPassengerSpace = newPassengers <= availablePassengerSlots ; #DEBUG_LINE_NO:223
    PlayerPassengerSpaceCurrent.SetValue(usedPassengerSlots as Float) ; #DEBUG_LINE_NO:227
    PlayerPassengerSpaceTotal.SetValue(totalPassengerSlots as Float) ; #DEBUG_LINE_NO:228
    Self.UpdateCurrentInstanceGlobal(PlayerPassengerSpaceCurrent) ; #DEBUG_LINE_NO:229
    Self.UpdateCurrentInstanceGlobal(PlayerPassengerSpaceTotal) ; #DEBUG_LINE_NO:230
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleOnMissionAccepted()
  ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef() ; #DEBUG_LINE_NO:237
  If PlayerShipRef ; #DEBUG_LINE_NO:240
    Self.UpdatePlayerPassengerSpace() ; #DEBUG_LINE_NO:242
    If hasPassengerSpace ; #DEBUG_LINE_NO:243
      Parent.HandleOnMissionAccepted() ; #DEBUG_LINE_NO:244
    Else ; #DEBUG_LINE_NO:
      MissionBoardPassengerNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:247
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    MissionBoardPassengerNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:251
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:257
    missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript ; #DEBUG_LINE_NO:259
    If passengerSourceRef ; #DEBUG_LINE_NO:261
      Int newPassengers = MissionIntValue01.GetValueInt() ; #DEBUG_LINE_NO:262
      passengerSourceRef.CreatePassengers(Passengers, PassengerMarker.GetRef(), newPassengers) ; #DEBUG_LINE_NO:263
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:264
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:265
      Self.RegisterForRemoteEvent(Passengers as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:266
      If MissionTimeHoursActual as Bool && MissionTimeHoursActual.GetValue() > 0.0 ; #DEBUG_LINE_NO:267
        Self.StartQuestTimer(MissionTimeHoursActual.GetValue()) ; #DEBUG_LINE_NO:268
      EndIf ; #DEBUG_LINE_NO:
      SQ_PlayerShip.AddPassengers(Passengers) ; #DEBUG_LINE_NO:271
      Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:273
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:279
EndFunction

Function MissionShutdown()
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:285
EndFunction

Int Function GetActualReward()
  missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript ; #DEBUG_LINE_NO:291
  ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier ; #DEBUG_LINE_NO:293
  Float reward = (RewardAmountGlobal.GetValue() + (MissionIntValue01.GetValue() * passengerSourceRef.ExtraRewardPerPassenger as Float)) * (1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV)) ; #DEBUG_LINE_NO:294
  Return reward as Int ; #DEBUG_LINE_NO:296
EndFunction

Function SetActualMissionTime()
  missionboardpassengersourcescript passengerSourceRef = PrimaryRef.GetRef() as missionboardpassengersourcescript ; #DEBUG_LINE_NO:301
  If passengerSourceRef ; #DEBUG_LINE_NO:302
    If (MissionTimeHours as Bool && MissionTimeHoursActual as Bool) && MissionTimeHours.GetValue() > 0.0 ; #DEBUG_LINE_NO:303
      MissionTimeHoursActual.SetValue(MissionTimeHours.GetValue() * passengerSourceRef.MissionTimeMult) ; #DEBUG_LINE_NO:304
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID ; #DEBUG_LINE_NO:311
    Self.InitializePassengers() ; #DEBUG_LINE_NO:312
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestTimerEnd(Int aiReason)
  If aiReason == 0 ; #DEBUG_LINE_NO:319
    Self.MissionFailed() ; #DEBUG_LINE_NO:320
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function debugStartQuestTimer(Float questtime)
  If questtime <= 0.0 ; #DEBUG_LINE_NO:333
    Self.StartQuestTimer(-1.0) ; #DEBUG_LINE_NO:334
  Else ; #DEBUG_LINE_NO:
    Self.StartQuestTimer(questtime) ; #DEBUG_LINE_NO:336
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePassengersDisembark()
  Passengers.SetValue(MissionBoardDisembark, 1.0) ; #DEBUG_LINE_NO:343
  Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_DepartingShipValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:344
  Passengers.EvaluateAll() ; #DEBUG_LINE_NO:346
  Self.CheckForCompletion() ; #DEBUG_LINE_NO:349
EndFunction

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
  If Self.CheckForPassengerDisembark(akSenderRef as Actor) ; #DEBUG_LINE_NO:355
    akSenderRef.Disable(False) ; #DEBUG_LINE_NO:356
    Self.CheckForCompletion() ; #DEBUG_LINE_NO:358
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Self.MissionFailed() ; #DEBUG_LINE_NO:364
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:365
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  If Self.CheckForPassengerDisembark(akSenderRef as Actor) ; #DEBUG_LINE_NO:371
    Self.CheckForCompletion() ; #DEBUG_LINE_NO:373
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function CheckForPassengerDisembark(Actor passengerRef)
  Bool disembark = False ; #DEBUG_LINE_NO:379
  spaceshipreference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:380
  spaceshipreference passengerShipRef = passengerRef.GetCurrentShipRef() ; #DEBUG_LINE_NO:381
  If passengerShipRef != PlayerShipRef ; #DEBUG_LINE_NO:383
    SQ_PlayerShip.RemovePassenger(passengerRef) ; #DEBUG_LINE_NO:386
    disembark = True ; #DEBUG_LINE_NO:387
  EndIf ; #DEBUG_LINE_NO:
  Return disembark ; #DEBUG_LINE_NO:389
EndFunction

Function CheckForCompletion()
  spaceshipreference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:395
  Bool disablePassengersOnShip = False ; #DEBUG_LINE_NO:398
  If Game.GetPlayer().GetCurrentShipRef() != PlayerShipRef ; #DEBUG_LINE_NO:400
    disablePassengersOnShip = True ; #DEBUG_LINE_NO:401
  EndIf ; #DEBUG_LINE_NO:
  Int passengerCount = Passengers.GetCount() ; #DEBUG_LINE_NO:404
  Int disembarkedCount = 0 ; #DEBUG_LINE_NO:405
  Int I = 0 ; #DEBUG_LINE_NO:406
  While I < passengerCount ; #DEBUG_LINE_NO:407
    Actor passengerRef = Passengers.GetActorAt(I) ; #DEBUG_LINE_NO:408
    If passengerRef.GetCurrentShipRef() != PlayerShipRef ; #DEBUG_LINE_NO:409
      disembarkedCount += 1 ; #DEBUG_LINE_NO:410
    ElseIf disablePassengersOnShip ; #DEBUG_LINE_NO:
      passengerRef.Disable(False) ; #DEBUG_LINE_NO:412
      SQ_PlayerShip.RemovePassenger(passengerRef) ; #DEBUG_LINE_NO:414
      disembarkedCount += 1 ; #DEBUG_LINE_NO:415
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:417
  EndWhile ; #DEBUG_LINE_NO:
  If disembarkedCount >= passengerCount ; #DEBUG_LINE_NO:420
    Self.MissionComplete() ; #DEBUG_LINE_NO:421
  EndIf ; #DEBUG_LINE_NO:
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:424
EndFunction

Function CheckForShutdown()
  Int passengerCount = Passengers.GetCount() ; #DEBUG_LINE_NO:428
  Int disabledCount = Passengers.GetCountDisabled() ; #DEBUG_LINE_NO:430
  If disabledCount >= passengerCount ; #DEBUG_LINE_NO:432
    Self.Stop() ; #DEBUG_LINE_NO:433
  Else ; #DEBUG_LINE_NO:
    Int deadCount = Passengers.GetCountDead() ; #DEBUG_LINE_NO:436
    If deadCount >= passengerCount ; #DEBUG_LINE_NO:438
      Self.Stop() ; #DEBUG_LINE_NO:439
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionFailed()
  Parent.MissionFailed() ; #DEBUG_LINE_NO:446
  If PlayerFailedQuest ; #DEBUG_LINE_NO:447
    Passengers.SetValue(MissionParent.RQ_AV_Hello, 0.0) ; #DEBUG_LINE_NO:449
  EndIf ; #DEBUG_LINE_NO:
EndFunction
