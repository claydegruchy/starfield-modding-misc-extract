ScriptName DefaultPassengerQuestScript Extends Quest default
{ Manages handling passengers getting on and off your ship at a destination, and setting quest stages dealing with passengers and delivery.

IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property.

Call these functions to make aliases into passengers (which also adds them to this script's Alias_Passengers RefCollectionAlias)
*AddPassenger(Alias_To_Make_A_Passenger)
*AddPassengers(RefCollectionAlias_To_Make_Passengers)

You shouldn't need to do this, but if you find a reason you need to manually remove an actor from being a passenger:
*RemovePassengerActor(Actor_To_Stop_Being_Passenger) }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard PassengerGuard

;-- Properties --------------------------------------
Group AutofillProperties
  sq_playershipscript Property SQ_Playership Auto Const mandatory
  Keyword Property LinkPassengerShipMarker Auto Const mandatory
  Keyword Property LinkPassengerDestinationMarker Auto Const mandatory
  ActorValue Property DefaultPassengerState Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_0_WalkToShipThenSandbox Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_1_RunToShipThenSandbox Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_2_WalkToDestination Auto Const mandatory
  GlobalVariable Property DefaultPassengerState_3_RunToDestination Auto Const mandatory
EndGroup

Group Aliases
  RefCollectionAlias Property Alias_Passengers Auto Const mandatory
  { The references in this alias should be managed by this script. Use AddPassenger() and AddPassengers() to add refs to this alias. }
  LocationAlias Property Alias_PassengerDestination Auto Const mandatory
  { Location alias that represents the destination you are delivering the passenger to. }
  ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const mandatory
  { A marker for where you want the passengers to walk to when they disembark at the destination. }
EndGroup

Group Stages
  Int Property StageToSetOnPlayerShipArrivesAtDestination Auto Const mandatory
  { will set this stage when player's ship arrives at Alias_PassengerDestination }
  Int Property StageToSetWhenAllPassengersDisembark Auto Const mandatory
  { will set this stage when all the Passengers exit the ship after it arrives at Alias_PassengerDestination }
  Float Property ArrivalDistance = 5.0 Auto Const
  { how close to the Arrival Marker do Passengers need to be to be considered to have arrived? }
EndGroup

Group Default_Passenger_Behavior_REMEMBER_Add_DefaultPassengerAlias_to_Passengers_Alias
{ IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property. }
  Bool Property RunToShip = True Auto Const
  { (Default: false) If true, passengers will run instead of walk to get to the player ship. }
  Bool Property RunToDestination = False Auto Const
  { (Default: false) If true, passengers will run instead of walk to get to the destination upon arrival. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
  String Property CustomLog = "" Auto Const
  { *Default: "") If not empy, will trace to this log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Alias_PassengerDestinationMarker as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:72
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:74
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:75
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:76
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:77
    Self.RegisterForRemoteEvent(Alias_Passengers as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:78
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:81
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipTakeoff") ; #DEBUG_LINE_NO:82
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipDock") ; #DEBUG_LINE_NO:83
  Self.RegisterForRemoteEvent(SQ_Playership.PlayerShip as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:84
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Alias_PassengerDestinationMarker ; #DEBUG_LINE_NO:92
    If abRemove ; #DEBUG_LINE_NO:93
      Self._UpdatePassengerDestinationLinks(None) ; #DEBUG_LINE_NO:95
    Else ; #DEBUG_LINE_NO:
      Self._UpdatePassengerDestinationLinks(Alias_PassengerDestinationMarker.GetReference()) ; #DEBUG_LINE_NO:98
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:104
    If akSender == Alias_Passengers ; #DEBUG_LINE_NO:107
      ObjectReference destinationMarkerRef = Alias_PassengerDestinationMarker.GetReference() ; #DEBUG_LINE_NO:109
      If abRemove ; #DEBUG_LINE_NO:111
        Self.UnregisterForDistanceEvents(akObject as ScriptObject, destinationMarkerRef as ScriptObject, -1) ; #DEBUG_LINE_NO:113
        akObject.SetLinkedRef(None, LinkPassengerDestinationMarker, True) ; #DEBUG_LINE_NO:114
      Else ; #DEBUG_LINE_NO:
        Self.RegisterForDistanceLessThanEvent(akObject as ScriptObject, destinationMarkerRef as ScriptObject, ArrivalDistance, 0) ; #DEBUG_LINE_NO:118
        akObject.SetLinkedRef(destinationMarkerRef, LinkPassengerDestinationMarker, True) ; #DEBUG_LINE_NO:119
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:127
    If akSender == Alias_Passengers ; #DEBUG_LINE_NO:129
      Self.RemovePassengerActor(akSenderRef as Actor) ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:136
    If akSender == Alias_Passengers && Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) ; #DEBUG_LINE_NO:139
      Self._HandlePassengerArrival(akSenderRef) ; #DEBUG_LINE_NO:141
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:147
    If akSender == Alias_Passengers && Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) ; #DEBUG_LINE_NO:150
      Self._HandlePassengerArrival(akSenderRef) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:158
    ObjectReference passengerRef = None ; #DEBUG_LINE_NO:159
    If Alias_Passengers.find(akObj1) > -1 ; #DEBUG_LINE_NO:161
      passengerRef = akObj1 ; #DEBUG_LINE_NO:162
    ElseIf Alias_Passengers.find(akObj2) > -1 ; #DEBUG_LINE_NO:163
      passengerRef = akObj2 ; #DEBUG_LINE_NO:164
    EndIf ; #DEBUG_LINE_NO:
    If passengerRef ; #DEBUG_LINE_NO:167
      Self._HandlePassengerArrival(passengerRef) ; #DEBUG_LINE_NO:169
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, Bool abComplete)
  Self.ShipArriving(akSender, abComplete) ; #DEBUG_LINE_NO:178
EndEvent

Event ReferenceAlias.OnShipTakeOff(ReferenceAlias akSender, Bool abComplete)
  Self.ShipDeparting(akSender, abComplete) ; #DEBUG_LINE_NO:183
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Self.ShipArriving(akSender, abComplete) ; #DEBUG_LINE_NO:188
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSender, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Self.ShipDeparting(akSender, abComplete) ; #DEBUG_LINE_NO:193
EndEvent

Function ShipArriving(ReferenceAlias akSender, Bool abComplete)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:200
    ObjectReference shipRef = akSender.GetShipReference() as ObjectReference ; #DEBUG_LINE_NO:201
    If abComplete && shipRef.IsInLocation(Alias_PassengerDestination.GetLocation()) && Self.HavePassengers() ; #DEBUG_LINE_NO:209
      If Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) == False ; #DEBUG_LINE_NO:210
        Self.SetStage(StageToSetOnPlayerShipArrivesAtDestination) ; #DEBUG_LINE_NO:212
        Self.SetAllPassengersGoToDestination() ; #DEBUG_LINE_NO:214
        SQ_Playership.RemovePassengers(Alias_Passengers) ; #DEBUG_LINE_NO:217
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ShipDeparting(ReferenceAlias akSender, Bool abComplete)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:226
    If Self.GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) && Alias_Passengers.GetCount() > 0 ; #DEBUG_LINE_NO:229
      Self.MoveAllPassengersToLinkedRef(LinkPassengerDestinationMarker, ArrivalDistance) ; #DEBUG_LINE_NO:234
    Else ; #DEBUG_LINE_NO:
      Float notOnShipDistance = 1000.0 ; #DEBUG_LINE_NO:237
      Self.MoveAllPassengersToLinkedRef(LinkPassengerShipMarker, notOnShipDistance) ; #DEBUG_LINE_NO:238
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function HavePassengers()
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:244
    Bool returnVal = Alias_Passengers as Bool && Alias_Passengers.GetCount() > 0 ; #DEBUG_LINE_NO:245
    Return returnVal ; #DEBUG_LINE_NO:248
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveAllPassengersToLinkedRef(Keyword linkedRefKeyword, Float MoveIfDistanceGreaterThan)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:253
    Actor[] passengers = Alias_Passengers.GetActorArray() ; #DEBUG_LINE_NO:256
    Int I = 0 ; #DEBUG_LINE_NO:258
    While I < passengers.Length ; #DEBUG_LINE_NO:259
      Actor currentPassenger = passengers[I] ; #DEBUG_LINE_NO:260
      ObjectReference linkedRef = currentPassenger.GetLinkedRef(linkedRefKeyword) ; #DEBUG_LINE_NO:261
      If currentPassenger.GetDistance(linkedRef) > MoveIfDistanceGreaterThan ; #DEBUG_LINE_NO:262
        currentPassenger.MoveTo(currentPassenger.GetLinkedRef(linkedRefKeyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:263
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:265
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function _HandlePassengerArrival(ObjectReference arrivingPassenger)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:272
    Self.RemovePassengerActor(arrivingPassenger as Actor) ; #DEBUG_LINE_NO:274
    Int passengerCount = Alias_Passengers.GetCount() ; #DEBUG_LINE_NO:277
    If passengerCount == 0 ; #DEBUG_LINE_NO:278
      Self.SetStage(StageToSetWhenAllPassengersDisembark) ; #DEBUG_LINE_NO:280
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function _UpdatePassengerDestinationLinks(ObjectReference DestinationMarker)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:288
    ObjectReference[] passengerRefs = Alias_Passengers.GetArray() ; #DEBUG_LINE_NO:291
    Int I = 0 ; #DEBUG_LINE_NO:293
    While I < passengerRefs.Length ; #DEBUG_LINE_NO:294
      ObjectReference currentRef = passengerRefs[I] ; #DEBUG_LINE_NO:295
      currentRef.SetLinkedRef(DestinationMarker, LinkPassengerDestinationMarker, True) ; #DEBUG_LINE_NO:296
      I += 1 ; #DEBUG_LINE_NO:297
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function AddPassenger(ReferenceAlias PassengerToAdd)
  Self._AddPassengers(PassengerToAdd.GetReference().GetSingleRefArray() as Actor[]) ; #DEBUG_LINE_NO:304
EndFunction

Function AddPassengers(RefCollectionAlias PassengersToAdd)
  Self._AddPassengers(PassengersToAdd.GetActorArray()) ; #DEBUG_LINE_NO:309
EndFunction

Function _AddPassengers(Actor[] PassengersToAdd)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:313
    Int I = 0 ; #DEBUG_LINE_NO:314
    While I < PassengersToAdd.Length ; #DEBUG_LINE_NO:315
      Actor currentActor = PassengersToAdd[I] ; #DEBUG_LINE_NO:316
      If currentActor.IsDead() == False ; #DEBUG_LINE_NO:318
        SQ_Playership.AddPassenger(currentActor) ; #DEBUG_LINE_NO:319
        Alias_Passengers.AddRef(currentActor as ObjectReference) ; #DEBUG_LINE_NO:320
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:323
    EndWhile ; #DEBUG_LINE_NO:
    Self.SetAllPassengersGoToShip() ; #DEBUG_LINE_NO:326
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RemovePassengerActor(Actor ActorToRemove)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:331
    SQ_Playership.RemovePassenger(ActorToRemove) ; #DEBUG_LINE_NO:333
    Alias_Passengers.RemoveRef(ActorToRemove as ObjectReference) ; #DEBUG_LINE_NO:334
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function SetAllPassengersGoToShip()
  If RunToShip ; #DEBUG_LINE_NO:340
    Self._SetAllPassengersAV(DefaultPassengerState_1_RunToShipThenSandbox) ; #DEBUG_LINE_NO:341
  Else ; #DEBUG_LINE_NO:
    Self._SetAllPassengersAV(DefaultPassengerState_0_WalkToShipThenSandbox) ; #DEBUG_LINE_NO:343
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetAllPassengersGoToDestination()
  If RunToDestination ; #DEBUG_LINE_NO:348
    Self._SetAllPassengersAV(DefaultPassengerState_3_RunToDestination) ; #DEBUG_LINE_NO:349
  Else ; #DEBUG_LINE_NO:
    Self._SetAllPassengersAV(DefaultPassengerState_2_WalkToDestination) ; #DEBUG_LINE_NO:351
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetAllPassengersAV(GlobalVariable GlobalWithValue)
  Guard PassengerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:356
    ActorValue AV = DefaultPassengerState ; #DEBUG_LINE_NO:357
    Actor[] passengers = Alias_Passengers.GetActorArray() ; #DEBUG_LINE_NO:360
    Int I = 0 ; #DEBUG_LINE_NO:363
    While I < passengers.Length ; #DEBUG_LINE_NO:364
      Actor currentActor = passengers[I] ; #DEBUG_LINE_NO:365
      currentActor.SetValue(AV, GlobalWithValue.GetValue()) ; #DEBUG_LINE_NO:366
      currentActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:367
      I += 1 ; #DEBUG_LINE_NO:368
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
