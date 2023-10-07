ScriptName ReferenceAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Function ApplyToRef(ObjectReference akRef) Native

Function Clear() Native

Function ForceRefTo(ObjectReference akNewRef) Native

ObjectReference Function GetReference() Native

Event OnActivate(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActorActivatedRef(ObjectReference akActivatedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnBuilderMenuSelect(ActorValue akActorValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellAttach()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnClose(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatListAdded(Actor akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatListRemoved(Actor akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeCompleteCommand(Int aeCommandType, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeEnter()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeExit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeGiveCommand(Int aeCommandType, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCompanionDismiss()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnConsciousnessStateChanged(Bool abUnconscious)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCripple(ActorValue akActorValue, Bool abCrippled)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeferredKill(Actor akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDifficultyChanged(Int aOldDifficulty, Int aNewDifficulty)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterBleedout()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterOutpostBeaconMode()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterSneaking()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEquipped(Actor akActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStart()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStop()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitShipInterior(ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGetUp(ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGrab()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnKill(ObjectReference akVictim)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLockStateChanged()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnMapMarkerDiscovered()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnObjectDestroyed(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnObjectRepaired(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOpen(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOutpostItemPowerOff(ObjectReference akPoweredItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOutpostItemPowerOn(ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageChange(Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageEnd(Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageStart(Package akNewPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPartialCripple(ActorValue akActorValue, Bool abCrippled)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPickLock(ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPickpocketFailed()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPipboyRadioDetection(Bool abDetected)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerBuyShip(spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, researchproject akProject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCreateRobot(Actor akNewRobot)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, Int aeCrimeGold, Int aeCrimeType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerDialogueTarget()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerEnterVertibird(ObjectReference akVertibird)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFailedPlotRoute(Int aeFailedPlotReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFallLongDistance(Float afDamage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFireWeapon(Form akBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFollowerWarp(ObjectReference akFollower)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerHealTeammate(Actor akTeammate)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerItemAdded(Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, Int aeAcquireType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerJail(ObjectReference akGuard, Form akFaction, Location akLocation, Int aeCrimeGold)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoadGame()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoiteringBegin()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoiteringEnd()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModArmorWeapon(Form akBaseObject, objectmod akModBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModRobot(Actor akRobot, objectmod akModBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModifiedShip(spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerMurderActor(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, Int aeCrimeGold)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerPlanetSurveyComplete(planet akPlanet)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerScannedObject(ObjectReference akScannedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSellShip(spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSwimming()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerUseWorkBench(ObjectReference akWorkBench)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOff()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuickContainerOpened()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRaceSwitchComplete()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRead()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRecoverFromBleedout()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRelease()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnReset()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnScanned()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSell(Actor akSeller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipBought()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipGravJump(Location aDestination, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipRefueled(Int aFuelAdded)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSold()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemRepaired(ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipTakeOff(Bool abComplete)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSit(ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSpellCast(Form akSpell)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationAlmostComplete()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationComplete()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationFailed()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTrapHitStart(ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTrapHitStop(ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnequipped(Actor akActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopFlyCam(Bool aStart)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopMode(Bool aStart)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopOutputLink(ObjectReference akSource, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function RemoveFromRef(ObjectReference akRef) Native

Bool Function ForceRefIfEmpty(ObjectReference akNewRef)
  If Self.GetReference() ; #DEBUG_LINE_NO:19
    Return False ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    Self.ForceRefTo(akNewRef) ; #DEBUG_LINE_NO:22
    Return True ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Actor Function GetActorReference()
  Return Self.GetReference() as Actor ; #DEBUG_LINE_NO:30
EndFunction

ObjectReference Function GetRef()
  Return Self.GetReference() ; #DEBUG_LINE_NO:35
EndFunction

Actor Function GetActorRef()
  Return Self.GetActorReference() ; #DEBUG_LINE_NO:40
EndFunction

spaceshipreference Function GetShipReference()
  Return Self.GetReference() as spaceshipreference ; #DEBUG_LINE_NO:45
EndFunction

spaceshipreference Function GetShipRef()
  Return Self.GetShipReference() ; #DEBUG_LINE_NO:50
EndFunction

Bool Function TryToAddToFaction(Faction FactionToAddTo)
  Bool bSuccess = False ; #DEBUG_LINE_NO:57
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:58
  If myRef ; #DEBUG_LINE_NO:59
    bSuccess = myRef.TryToAddToFaction(FactionToAddTo) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:62
EndFunction

Bool Function TryToRemoveFromFaction(Faction FactionToRemoveFrom)
  Bool bSuccess = False ; #DEBUG_LINE_NO:67
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:68
  If myRef ; #DEBUG_LINE_NO:69
    bSuccess = myRef.TryToRemoveFromFaction(FactionToRemoveFrom) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:72
EndFunction

Bool Function TryToStopCombat()
  Bool bSuccess = False ; #DEBUG_LINE_NO:77
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:78
  If myRef ; #DEBUG_LINE_NO:79
    bSuccess = myRef.TryToStopCombat() ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:82
EndFunction

Bool Function TryToDisable()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:87
  If Ref ; #DEBUG_LINE_NO:89
    Ref.Disable(False) ; #DEBUG_LINE_NO:90
    Return True ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:94
EndFunction

Bool Function TryToDisableNoWait()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:99
  If Ref ; #DEBUG_LINE_NO:101
    Ref.DisableNoWait(False) ; #DEBUG_LINE_NO:102
    Return True ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:106
EndFunction

Bool Function TryToEnable()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:111
  If Ref ; #DEBUG_LINE_NO:113
    Ref.Enable(False) ; #DEBUG_LINE_NO:114
    Return True ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:118
EndFunction

Bool Function TryToEnableNoWait()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:123
  If Ref ; #DEBUG_LINE_NO:125
    Ref.EnableNoWait(False) ; #DEBUG_LINE_NO:126
    Return True ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:130
EndFunction

Bool Function TryToEvaluatePackage()
  Bool bSuccess = False ; #DEBUG_LINE_NO:135
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:136
  If myRef ; #DEBUG_LINE_NO:137
    bSuccess = myRef.TryToEvaluatePackage() ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:140
EndFunction

Bool Function TryToKill(ObjectReference akKiller)
  Bool bSuccess = False ; #DEBUG_LINE_NO:145
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:146
  If myRef ; #DEBUG_LINE_NO:147
    bSuccess = myRef.TryToKill(akKiller) ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:150
EndFunction

Bool Function TryToMoveTo(ObjectReference RefToMoveTo)
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:155
  If Ref ; #DEBUG_LINE_NO:157
    Ref.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:158
    Return True ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:162
EndFunction

Bool Function TryToReset()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:167
  If Ref ; #DEBUG_LINE_NO:169
    Ref.Reset(None) ; #DEBUG_LINE_NO:170
    Return True ; #DEBUG_LINE_NO:171
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:174
EndFunction

Bool Function TryToClear()
  If Self.GetReference() ; #DEBUG_LINE_NO:179
    Self.Clear() ; #DEBUG_LINE_NO:180
    Return True ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:184
EndFunction

Bool Function TryToDelete()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:189
  If Ref ; #DEBUG_LINE_NO:191
    Ref.Delete() ; #DEBUG_LINE_NO:192
    Return True ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:196
EndFunction

Location Function TryToGetCurrentLocation()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:203
  If Ref ; #DEBUG_LINE_NO:205
    Return Ref.GetCurrentLocation() ; #DEBUG_LINE_NO:206
  EndIf ; #DEBUG_LINE_NO:
  Return None ; #DEBUG_LINE_NO:209
EndFunction

Float Function TryToGetActorValue(ActorValue ActorValueToGet)
  Self.TryToGetValue(ActorValueToGet) ; #DEBUG_LINE_NO:214
EndFunction

Float Function TryToGetValue(ActorValue akAV)
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:219
  If Ref ; #DEBUG_LINE_NO:221
    Return Ref.GetValue(akAV) ; #DEBUG_LINE_NO:222
  EndIf ; #DEBUG_LINE_NO:
  Return 0.0 ; #DEBUG_LINE_NO:225
EndFunction

Bool Function TryToSetActorValue(ActorValue ValueToSet, Float afValue)
  Return Self.TryToSetValue(ValueToSet, afValue) ; #DEBUG_LINE_NO:232
EndFunction

Bool Function TryToSetValue(ActorValue akAV, Float afValue)
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:237
  If Ref ; #DEBUG_LINE_NO:239
    Ref.SetValue(akAV, afValue) ; #DEBUG_LINE_NO:240
    Return True ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:244
EndFunction

Bool Function TryIsLocked()
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:249
  If Ref ; #DEBUG_LINE_NO:251
    Return Ref.IsLocked() ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:255
EndFunction

Function TryToSetPlayerResistingArrest()
  Actor guardActor = Self.GetActorRef() ; #DEBUG_LINE_NO:260
  If guardActor ; #DEBUG_LINE_NO:261
    guardActor.SetPlayerResistingArrest() ; #DEBUG_LINE_NO:262
  Else ; #DEBUG_LINE_NO:
    spaceshipreference guardShip = Self.GetShipRef() ; #DEBUG_LINE_NO:264
    If guardShip ; #DEBUG_LINE_NO:265
      guardShip.SetPlayerResistingArrest() ; #DEBUG_LINE_NO:266
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToSendPlayerToJail(Bool abRemoveInventory, Bool abRealJail)
  Faction crimeFaction = None ; #DEBUG_LINE_NO:273
  Actor guardActor = Self.GetActorRef() ; #DEBUG_LINE_NO:274
  If guardActor ; #DEBUG_LINE_NO:275
    crimeFaction = guardActor.GetCrimeFaction() ; #DEBUG_LINE_NO:276
  Else ; #DEBUG_LINE_NO:
    spaceshipreference guardShip = Self.GetShipRef() ; #DEBUG_LINE_NO:278
    If guardShip ; #DEBUG_LINE_NO:279
      crimeFaction = guardShip.GetCrimeFaction() ; #DEBUG_LINE_NO:280
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If crimeFaction ; #DEBUG_LINE_NO:284
    crimeFaction.SendPlayerToJail(abRemoveInventory, abRealJail) ; #DEBUG_LINE_NO:285
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToPlayerPayFine(Bool abRemoveStolenItems, Bool abGoToJail)
  Faction crimeFaction = Self.TryToGetCrimeFaction() ; #DEBUG_LINE_NO:291
  If crimeFaction ; #DEBUG_LINE_NO:292
    crimeFaction.PlayerPayCrimeGold(abRemoveStolenItems, abGoToJail) ; #DEBUG_LINE_NO:294
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToSendSmugglingAlarm()
  spaceshipreference guardShip = Self.GetShipRef() ; #DEBUG_LINE_NO:301
  If guardShip ; #DEBUG_LINE_NO:302
    guardShip.SendSmugglingAlarm(True) ; #DEBUG_LINE_NO:303
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function TryToInstantDock(ReferenceAlias akTarget)
  spaceshipreference selfShipRef = Self.GetShipRef() ; #DEBUG_LINE_NO:310
  spaceshipreference targetShipRef = akTarget.GetShipRef() ; #DEBUG_LINE_NO:311
  If selfShipRef as Bool && targetShipRef as Bool ; #DEBUG_LINE_NO:312
    Return selfShipRef.InstantDock(targetShipRef as ObjectReference) ; #DEBUG_LINE_NO:313
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:315
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function TryToMoveNear(ObjectReference akTarget, Int positionVal, Int distanceVal, Int facingVal)
  ObjectReference Ref = Self.GetReference() ; #DEBUG_LINE_NO:321
  If Ref as Bool && akTarget as Bool ; #DEBUG_LINE_NO:322
    Ref.MoveNear(akTarget, positionVal, distanceVal, facingVal) ; #DEBUG_LINE_NO:323
    Return True ; #DEBUG_LINE_NO:324
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:326
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Faction Function TryToGetCrimeFaction()
  Faction crimeFaction = None ; #DEBUG_LINE_NO:332
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:333
  If actorRef ; #DEBUG_LINE_NO:334
    crimeFaction = actorRef.GetCrimeFaction() ; #DEBUG_LINE_NO:335
  Else ; #DEBUG_LINE_NO:
    spaceshipreference shipRef = Self.GetShipRef() ; #DEBUG_LINE_NO:337
    If shipRef ; #DEBUG_LINE_NO:338
      crimeFaction = shipRef.GetCrimeFaction() ; #DEBUG_LINE_NO:339
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return crimeFaction ; #DEBUG_LINE_NO:342
EndFunction

Function ClearAndRefillAlias()
  Self.Clear() ; #DEBUG_LINE_NO:347
  Self.RefillAlias() ; #DEBUG_LINE_NO:348
EndFunction
