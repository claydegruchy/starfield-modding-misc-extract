ScriptName RefCollectionAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Int Function Find(ObjectReference akFindRef) Native

Actor[] Function GetActorArray() Native

ObjectReference[] Function GetArray() Native

ObjectReference Function GetAt(Int aiIndex) Native

Int Function GetCount() Native

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActorActivatedRef(ObjectReference akSenderRef, ObjectReference akActivatedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAffinityEvent(ObjectReference akSenderRef, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnBuilderMenuSelect(ObjectReference akSenderRef, ActorValue akActorValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellAttach(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellLoad(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnClose(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatListRemoved(ObjectReference akSenderRef, Actor akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeCompleteCommand(ObjectReference akSenderRef, Int aeCommand, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeEnter(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeExit(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCommandModeGiveCommand(ObjectReference akSenderRef, Int aeCommand, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCompanionDismiss(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnConsciousnessStateChanged(ObjectReference akSenderRef, Bool abUnconscious)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewAssigned(ObjectReference akSenderRef, Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewDismissed(ObjectReference akSenderRef, Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCripple(ObjectReference akSenderRef, ActorValue akActorValue, Bool abCrippled)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeferredKill(ObjectReference akSenderRef, Actor akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDifficultyChanged(ObjectReference akSenderRef, Int aOldDifficulty, Int aNewDifficulty)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterBleedout(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterOutpostBeaconMode()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akSenderRef, ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterSneaking(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEquipped(ObjectReference akSenderRef, Actor akActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStart(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStop(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitFurniture(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitShipInterior(ObjectReference akSenderRef, ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGetUp(ObjectReference akSenderRef, ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGrab(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnHomeShipSet(ObjectReference akSenderRef, spaceshipreference akShip, spaceshipreference akPrevious)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(ObjectReference akSenderRef, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemEquipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemRemoved(ObjectReference akSenderRef, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemUnequipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnKill(ObjectReference akSenderRef, ObjectReference akVictim)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLockStateChanged(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnMapMarkerDiscovered(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnObjectRepaired(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOpen(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOutpostItemPowerOff(ObjectReference akSenderRef, ObjectReference akPoweredItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOutpostItemPowerOn(ObjectReference akSenderRef, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPartialCripple(ObjectReference akSenderRef, ActorValue akActorValue, Bool abCrippled)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPickLock(ObjectReference akSenderRef, ObjectReference akLockedRef, Bool abCrime, Bool abSucceeded, terminalmenu akLockedTerminalMenu, Int aiTerminalMenuItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPickpocketFailed(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPipboyRadioDetection(ObjectReference akSenderRef, Bool abDetected)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerArrested(ObjectReference akSenderRef, ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerAssaultActor(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerBuyShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, researchproject akProject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCraftItem(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, Form akCreatedItem)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCreateRobot(ObjectReference akSenderRef, Actor akNewRobot)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCrimeGold(ObjectReference akSenderRef, ObjectReference akVictim, Form akFaction, Int aeCrimeGold, Int aeCrimeType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerDialogueTarget(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerEnterVertibird(ObjectReference akSenderRef, ObjectReference akVertibird)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFailedPlotRoute(ObjectReference akSenderRef, Int aeFailedPlotReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFallLongDistance(ObjectReference akSenderRef, Float afDamage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFireWeapon(ObjectReference akSenderRef, Form akBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerFollowerWarp(ObjectReference akSenderRef, ObjectReference akFollower)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerHealTeammate(ObjectReference akSenderRef, Actor akTeammate)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerItemAdded(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, Int aeAcquireType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerJail(ObjectReference akSenderRef, ObjectReference akGuard, Form akFaction, Location akLocation, Int aeCrimeGold)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoadGame(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoiteringBegin(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerLoiteringEnd(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModArmorWeapon(ObjectReference akSenderRef, Form akBaseObject, objectmod akModBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModRobot(ObjectReference akSenderRef, Actor akRobot, objectmod akModBaseObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerModifiedShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerMurderActor(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerPayFine(ObjectReference akSenderRef, ObjectReference akGuard, Form akFaction, Int aeCrimeGold)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerPlanetSurveyComplete(ObjectReference akSenderRef, planet akPlanet)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerScannedObject(ObjectReference akSenderRef, ObjectReference akScannedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSellShip(ObjectReference akSenderRef, spaceshipreference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSwimming(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerTrespass(ObjectReference akSenderRef, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerUseWorkBench(ObjectReference akSenderRef, ObjectReference akWorkBench)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOff(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOn(ObjectReference akSenderRef, ObjectReference akPowerGenerator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuickContainerOpened(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRaceSwitchComplete(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRead(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRecoverFromBleedout(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRelease(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnReset(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnScanned(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSell(ObjectReference akSenderRef, Actor akSeller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipBought(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipDock(ObjectReference akSenderRef, Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipFarTravel(ObjectReference akSenderRef, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipGravJump(ObjectReference akSenderRef, Location aDestination, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(ObjectReference akSenderRef, Bool abComplete)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipRefueled(ObjectReference akSenderRef, Int aFuelAdded)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSold(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemPowerChange(ObjectReference akSenderRef, ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemRepaired(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipTakeOff(ObjectReference akSenderRef, Bool abComplete)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipUndock(ObjectReference akSenderRef, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSit(ObjectReference akSenderRef, ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSpeechChallengeAvailable(ObjectReference akSenderRef, ObjectReference akSpeaker)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSpellCast(ObjectReference akSenderRef, Form akSpell)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTerminalMenuItemRun(ObjectReference akSenderRef, Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationAlmostComplete(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationComplete(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationFailed(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTrapHitStart(ObjectReference akSenderRef, ObjectReference akTarget, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Bool abInitialHit, Int aeMotionType)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTrapHitStop(ObjectReference akSenderRef, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akSenderRef, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnequipped(ObjectReference akSenderRef, Actor akActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akSenderRef, ObjectReference akOldTarget, ObjectReference akNewTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopFlyCam(ObjectReference akSenderRef, Bool aStart)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopMode(ObjectReference akSenderRef, Bool aStart)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopNPCTransfer(ObjectReference akSenderRef, Location akNewWorkshop, Keyword akActionKW)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akSenderRef, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopOutputLink(ObjectReference akSenderRef, ObjectReference akSource, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function RemoveAll() Native

Function RemoveRef(ObjectReference akRemoveRef) Native

Function addRef(ObjectReference akNewRef) Native

Function AddToFaction(Faction akFaction)
  Int I = 0 ; #DEBUG_LINE_NO:7
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:8
  While I < count ; #DEBUG_LINE_NO:9
    Self.GetAt(I).TryToAddToFaction(akFaction) ; #DEBUG_LINE_NO:10
    I += 1 ; #DEBUG_LINE_NO:11
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function BlockActivation(Bool abBlocked, Bool abHideActivateText)
  Int I = 0 ; #DEBUG_LINE_NO:18
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:19
  While I < count ; #DEBUG_LINE_NO:20
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:21
    If theRef ; #DEBUG_LINE_NO:22
      theRef.BlockActivation(abBlocked, abHideActivateText) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Actor Function GetActorAt(Int aiIndex)
  Return Self.GetAt(aiIndex) as Actor ; #DEBUG_LINE_NO:32
EndFunction

spaceshipreference Function GetShipAt(Int aiIndex)
  Return Self.GetAt(aiIndex) as spaceshipreference ; #DEBUG_LINE_NO:38
EndFunction

ObjectReference Function GetRandom()
  Return Self.GetAt(Utility.RandomInt(0, Self.GetCount() - 1)) ; #DEBUG_LINE_NO:45
EndFunction

ObjectReference[] Function GetRandomObjects(Int aiNumberToGet)
  ObjectReference[] randomArray = new ObjectReference[aiNumberToGet] ; #DEBUG_LINE_NO:51
  ObjectReference[] objectArray = Self.GetArray() ; #DEBUG_LINE_NO:52
  Int index = 0 ; #DEBUG_LINE_NO:54
  While index < aiNumberToGet && objectArray.Length > 0 ; #DEBUG_LINE_NO:55
    Int randIndex = Utility.RandomInt(0, objectArray.Length - 1) ; #DEBUG_LINE_NO:56
    randomArray[index] = objectArray[randIndex] ; #DEBUG_LINE_NO:57
    objectArray.remove(randIndex, 1) ; #DEBUG_LINE_NO:58
    index += 1 ; #DEBUG_LINE_NO:59
  EndWhile ; #DEBUG_LINE_NO:
  Return randomArray ; #DEBUG_LINE_NO:62
EndFunction

ObjectReference Function GetFirstOwnedObject(Actor actorOwner)
  Int I = 0 ; #DEBUG_LINE_NO:68
  Int ownerIndex = -1 ; #DEBUG_LINE_NO:69
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:70
  While I < count && ownerIndex == -1 ; #DEBUG_LINE_NO:71
    If actorOwner.IsOwner(Self.GetAt(I)) ; #DEBUG_LINE_NO:72
      ownerIndex = I ; #DEBUG_LINE_NO:73
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:75
  EndWhile ; #DEBUG_LINE_NO:
  If ownerIndex > -1 ; #DEBUG_LINE_NO:77
    Return Self.GetAt(ownerIndex) ; #DEBUG_LINE_NO:78
  Else ; #DEBUG_LINE_NO:
    Return None ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableAll(Bool bFadeIn)
  Int I = 0 ; #DEBUG_LINE_NO:87
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:88
  While I < count ; #DEBUG_LINE_NO:89
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:90
    If theRef ; #DEBUG_LINE_NO:91
      theRef.EnableNoWait(bFadeIn) ; #DEBUG_LINE_NO:92
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:94
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DisableAll(Bool bFadeOut)
  Int I = 0 ; #DEBUG_LINE_NO:101
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:102
  While I < count ; #DEBUG_LINE_NO:103
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:104
    If theRef ; #DEBUG_LINE_NO:105
      theRef.DisableNoWait(bFadeOut) ; #DEBUG_LINE_NO:106
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:108
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EvaluateAll()
  Int I = 0 ; #DEBUG_LINE_NO:116
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:117
  While I < count ; #DEBUG_LINE_NO:118
    Self.GetAt(I).TryToEvaluatePackage() ; #DEBUG_LINE_NO:119
    I += 1 ; #DEBUG_LINE_NO:120
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveAllTo(ObjectReference akTarget)
  Int I = 0 ; #DEBUG_LINE_NO:127
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:128
  While I < count ; #DEBUG_LINE_NO:129
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:130
    If theRef ; #DEBUG_LINE_NO:131
      theRef.MoveTo(akTarget, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:132
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:134
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveAllToPackageLocation()
  Int I = 0 ; #DEBUG_LINE_NO:141
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:142
  While I < count ; #DEBUG_LINE_NO:143
    ObjectReference current = Self.GetAt(I) ; #DEBUG_LINE_NO:144
    Actor theActor = current as Actor ; #DEBUG_LINE_NO:145
    If theActor ; #DEBUG_LINE_NO:146
      theActor.MoveToPackageLocation() ; #DEBUG_LINE_NO:147
    Else ; #DEBUG_LINE_NO:
      spaceshipreference theShip = current as spaceshipreference ; #DEBUG_LINE_NO:149
      If theShip ; #DEBUG_LINE_NO:150
        theShip.MoveToPackageLocation() ; #DEBUG_LINE_NO:151
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:154
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsOwnedObjectInList(Actor actorOwner)
  Int I = 0 ; #DEBUG_LINE_NO:162
  Bool foundOwner = False ; #DEBUG_LINE_NO:163
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:164
  While I < count && !foundOwner ; #DEBUG_LINE_NO:165
    If actorOwner.IsOwner(Self.GetAt(I)) ; #DEBUG_LINE_NO:166
      foundOwner = True ; #DEBUG_LINE_NO:167
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:170
  EndWhile ; #DEBUG_LINE_NO:
  Return foundOwner ; #DEBUG_LINE_NO:172
EndFunction

Bool Function IsDetectedBy(Actor detectionTarget)
  Int I = 0 ; #DEBUG_LINE_NO:178
  Bool isdetected = False ; #DEBUG_LINE_NO:179
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:180
  While I < count && !isdetected ; #DEBUG_LINE_NO:181
    Actor theActor = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:182
    If theActor as Bool && detectionTarget.IsDetectedBy(theActor) ; #DEBUG_LINE_NO:183
      isdetected = True ; #DEBUG_LINE_NO:184
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:187
  EndWhile ; #DEBUG_LINE_NO:
  Return isdetected ; #DEBUG_LINE_NO:189
EndFunction

Bool Function HasDetectionLOS(Actor actorTarget)
  Int I = 0 ; #DEBUG_LINE_NO:195
  Bool hasLOS = False ; #DEBUG_LINE_NO:196
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:197
  While I < count && !hasLOS ; #DEBUG_LINE_NO:198
    Actor theActor = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:199
    If theActor as Bool && theActor.HasDetectionLOS(actorTarget as ObjectReference) ; #DEBUG_LINE_NO:200
      hasLOS = True ; #DEBUG_LINE_NO:201
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:204
  EndWhile ; #DEBUG_LINE_NO:
  Return hasLOS ; #DEBUG_LINE_NO:206
EndFunction

Function SetOpen(Bool abOpen)
  Int I = 0 ; #DEBUG_LINE_NO:212
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:213
  While I < count ; #DEBUG_LINE_NO:214
    Self.GetAt(I).SetOpen(abOpen) ; #DEBUG_LINE_NO:215
    I += 1 ; #DEBUG_LINE_NO:216
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Lock(Bool abLock, Bool abAsOwner, Bool abTraverseLinkedLockables)
  Int I = 0 ; #DEBUG_LINE_NO:223
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:224
  While I < count ; #DEBUG_LINE_NO:225
    Self.GetAt(I).Lock(abLock, abAsOwner, abTraverseLinkedLockables) ; #DEBUG_LINE_NO:226
    I += 1 ; #DEBUG_LINE_NO:227
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function KillAll(ObjectReference akKiller)
  Int I = 0 ; #DEBUG_LINE_NO:234
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:235
  While I < count ; #DEBUG_LINE_NO:236
    Self.GetAt(I).TryToKill(akKiller) ; #DEBUG_LINE_NO:237
    I += 1 ; #DEBUG_LINE_NO:238
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StartCombatAll(ObjectReference akCombatTarget)
  Int I = 0 ; #DEBUG_LINE_NO:245
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:246
  While I < count ; #DEBUG_LINE_NO:247
    Self.GetAt(I).TryToStartCombat(akCombatTarget, False) ; #DEBUG_LINE_NO:248
    I += 1 ; #DEBUG_LINE_NO:249
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemoveFromFaction(Faction akFaction)
  Int I = 0 ; #DEBUG_LINE_NO:256
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:257
  While I < count ; #DEBUG_LINE_NO:258
    Self.GetAt(I).TryToRemoveFromFaction(akFaction) ; #DEBUG_LINE_NO:259
    I += 1 ; #DEBUG_LINE_NO:260
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemoveFromAllFactions()
  Int I = 0 ; #DEBUG_LINE_NO:267
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:268
  While I < count ; #DEBUG_LINE_NO:269
    Self.GetAt(I).TryToRemoveFromAllFactions() ; #DEBUG_LINE_NO:270
    I += 1 ; #DEBUG_LINE_NO:271
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ResetAll()
  Int I = 0 ; #DEBUG_LINE_NO:278
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:279
  While I < count ; #DEBUG_LINE_NO:280
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:281
    If theRef ; #DEBUG_LINE_NO:282
      theRef.Reset(None) ; #DEBUG_LINE_NO:283
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:285
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetGhost(Bool bSetGhost)
  Int I = 0 ; #DEBUG_LINE_NO:292
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:293
  While I < count ; #DEBUG_LINE_NO:294
    Self.GetAt(I).TryToSetGhost(bSetGhost) ; #DEBUG_LINE_NO:295
    I += 1 ; #DEBUG_LINE_NO:296
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetProtected(Bool bSetProtected)
  Int I = 0 ; #DEBUG_LINE_NO:303
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:304
  While I < count ; #DEBUG_LINE_NO:305
    Self.GetAt(I).TryToSetProtected(bSetProtected) ; #DEBUG_LINE_NO:306
    I += 1 ; #DEBUG_LINE_NO:307
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetEssential(Bool bSetEssential)
  Int I = 0 ; #DEBUG_LINE_NO:314
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:315
  While I < count ; #DEBUG_LINE_NO:316
    Self.GetAt(I).TryToSetEssential(bSetEssential) ; #DEBUG_LINE_NO:317
    I += 1 ; #DEBUG_LINE_NO:318
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StopCombat()
  Int I = 0 ; #DEBUG_LINE_NO:325
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:326
  While I < count ; #DEBUG_LINE_NO:327
    Self.GetAt(I).TryToStopCombat() ; #DEBUG_LINE_NO:328
    I += 1 ; #DEBUG_LINE_NO:329
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StopCombatAlarm()
  Int I = 0 ; #DEBUG_LINE_NO:335
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:336
  While I < count ; #DEBUG_LINE_NO:337
    Self.GetAt(I).TryToStopCombatAlarm() ; #DEBUG_LINE_NO:338
    I += 1 ; #DEBUG_LINE_NO:339
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AddRefCollection(RefCollectionAlias refCollectionAliasToAdd)
  Int CollectionCount = refCollectionAliasToAdd.GetCount() ; #DEBUG_LINE_NO:344
  Int index = 0 ; #DEBUG_LINE_NO:345
  While index < CollectionCount ; #DEBUG_LINE_NO:346
    Self.addRef(refCollectionAliasToAdd.GetAt(index)) ; #DEBUG_LINE_NO:347
    index += 1 ; #DEBUG_LINE_NO:348
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemoveRefCollection(RefCollectionAlias refCollectionAliasToRemove)
  Int CollectionCount = refCollectionAliasToRemove.GetCount() ; #DEBUG_LINE_NO:353
  Int index = 0 ; #DEBUG_LINE_NO:354
  While index < CollectionCount ; #DEBUG_LINE_NO:355
    Self.RemoveRef(refCollectionAliasToRemove.GetAt(index)) ; #DEBUG_LINE_NO:356
    index += 1 ; #DEBUG_LINE_NO:357
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AddArray(ObjectReference[] refArrayToAdd)
  Int index = 0 ; #DEBUG_LINE_NO:364
  While index < refArrayToAdd.Length ; #DEBUG_LINE_NO:365
    Self.addRef(refArrayToAdd[index]) ; #DEBUG_LINE_NO:366
    index += 1 ; #DEBUG_LINE_NO:367
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Int Function GetCountDead()
  Int iReturnCount = 0 ; #DEBUG_LINE_NO:374
  Int I = 0 ; #DEBUG_LINE_NO:376
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:377
  While I < count ; #DEBUG_LINE_NO:378
    Actor actorRef = Self.GetActorAt(I) ; #DEBUG_LINE_NO:379
    If actorRef as Bool && actorRef.IsDead() ; #DEBUG_LINE_NO:380
      iReturnCount += 1 ; #DEBUG_LINE_NO:381
    Else ; #DEBUG_LINE_NO:
      spaceshipreference theShipRef = Self.GetShipAt(I) ; #DEBUG_LINE_NO:383
      If theShipRef as Bool && theShipRef.IsDead() ; #DEBUG_LINE_NO:384
        iReturnCount += 1 ; #DEBUG_LINE_NO:385
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:389
  EndWhile ; #DEBUG_LINE_NO:
  Return iReturnCount ; #DEBUG_LINE_NO:392
EndFunction

Int Function GetCountDeadOr3DUnloaded()
  Int iReturnCount = 0 ; #DEBUG_LINE_NO:398
  Int I = 0 ; #DEBUG_LINE_NO:400
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:401
  While I < count ; #DEBUG_LINE_NO:402
    Actor actorRef = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:403
    If Self.GetAt(I).Is3DLoaded() == False || (actorRef as Bool && actorRef.IsDead()) ; #DEBUG_LINE_NO:404
      iReturnCount += 1 ; #DEBUG_LINE_NO:405
    Else ; #DEBUG_LINE_NO:
      spaceshipreference theShipRef = Self.GetShipAt(I) ; #DEBUG_LINE_NO:407
      If theShipRef as Bool && theShipRef.IsDead() ; #DEBUG_LINE_NO:408
        iReturnCount += 1 ; #DEBUG_LINE_NO:409
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:412
  EndWhile ; #DEBUG_LINE_NO:
  Return iReturnCount ; #DEBUG_LINE_NO:415
EndFunction

Int Function GetCountAliveAnd3DLoaded()
  Int iReturnCount = 0 ; #DEBUG_LINE_NO:421
  Int I = 0 ; #DEBUG_LINE_NO:423
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:424
  While I < count ; #DEBUG_LINE_NO:425
    Actor actorRef = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:426
    spaceshipreference theShipRef = Self.GetShipAt(I) ; #DEBUG_LINE_NO:427
    If Self.GetAt(I).Is3DLoaded() ; #DEBUG_LINE_NO:429
      If actorRef == None && theShipRef == None || (actorRef as Bool && actorRef.IsDead() == False) || (theShipRef as Bool && theShipRef.IsDead() == False) ; #DEBUG_LINE_NO:430
        iReturnCount += 1 ; #DEBUG_LINE_NO:431
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:435
  EndWhile ; #DEBUG_LINE_NO:
  Return iReturnCount ; #DEBUG_LINE_NO:438
EndFunction

Int Function GetCountDisabled()
  Int iReturnCount = 0 ; #DEBUG_LINE_NO:444
  Int I = 0 ; #DEBUG_LINE_NO:446
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:447
  While I < count ; #DEBUG_LINE_NO:448
    If Self.GetAt(I).IsDisabled() ; #DEBUG_LINE_NO:449
      iReturnCount += 1 ; #DEBUG_LINE_NO:450
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:453
  EndWhile ; #DEBUG_LINE_NO:
  Return iReturnCount ; #DEBUG_LINE_NO:456
EndFunction

Int Function RemoveDisabled()
  Int iReturnCount = 0 ; #DEBUG_LINE_NO:463
  Int I = Self.GetCount() - 1 ; #DEBUG_LINE_NO:465
  While I > -1 ; #DEBUG_LINE_NO:466
    ObjectReference myRef = Self.GetAt(I) ; #DEBUG_LINE_NO:467
    If myRef.IsDisabled() ; #DEBUG_LINE_NO:468
      iReturnCount += 1 ; #DEBUG_LINE_NO:469
      Self.RemoveRef(myRef) ; #DEBUG_LINE_NO:470
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:473
  EndWhile ; #DEBUG_LINE_NO:
  Return iReturnCount ; #DEBUG_LINE_NO:476
EndFunction

Function SetValue(ActorValue akActorValue, Float fValue)
  Int I = 0 ; #DEBUG_LINE_NO:483
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:484
  While I < count ; #DEBUG_LINE_NO:485
    Actor theActor = Self.GetActorAt(I) ; #DEBUG_LINE_NO:486
    If theActor ; #DEBUG_LINE_NO:487
      theActor.SetValue(akActorValue, fValue) ; #DEBUG_LINE_NO:488
    Else ; #DEBUG_LINE_NO:
      spaceshipreference theShipRef = Self.GetShipAt(I) ; #DEBUG_LINE_NO:490
      If theShipRef ; #DEBUG_LINE_NO:491
        theShipRef.SetValue(akActorValue, fValue) ; #DEBUG_LINE_NO:492
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:495
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function LinkCollectionTo(RefCollectionAlias LinkedRefCollectionAlias, Keyword LinkKeyword, Bool WrapLinks)
  Int index = 0 ; #DEBUG_LINE_NO:503
  Int LinkTargetCount = LinkedRefCollectionAlias.GetCount() ; #DEBUG_LINE_NO:504
  Int CollectionCount = Self.GetCount() ; #DEBUG_LINE_NO:505
  While index < CollectionCount ; #DEBUG_LINE_NO:506
    ObjectReference currentRef = Self.GetAt(index) ; #DEBUG_LINE_NO:507
    If currentRef ; #DEBUG_LINE_NO:508
      currentRef.SetLinkedRef(LinkedRefCollectionAlias.GetAt(index % LinkTargetCount), LinkKeyword, True) ; #DEBUG_LINE_NO:509
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:511
    If !WrapLinks && index >= LinkTargetCount ; #DEBUG_LINE_NO:512
      Return False ; #DEBUG_LINE_NO:513
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:516
EndFunction

Function SetUnconscious(Bool abUnconscious)
  Int I = 0 ; #DEBUG_LINE_NO:521
  Int iReturnCount = Self.GetCount() ; #DEBUG_LINE_NO:522
  While I < iReturnCount ; #DEBUG_LINE_NO:524
    Actor theActor = Self.GetActorAt(I) ; #DEBUG_LINE_NO:525
    If theActor ; #DEBUG_LINE_NO:526
      theActor.SetUnconscious(abUnconscious) ; #DEBUG_LINE_NO:527
    Else ; #DEBUG_LINE_NO:
      spaceshipreference theShipRef = Self.GetShipAt(I) ; #DEBUG_LINE_NO:529
      If theShipRef ; #DEBUG_LINE_NO:530
        theShipRef.SetUnconscious(abUnconscious) ; #DEBUG_LINE_NO:531
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:534
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
