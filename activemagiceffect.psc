ScriptName ActiveMagicEffect Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Function Dispel() Native

MagicEffect Function GetBaseObject() Native

Actor Function GetCasterActor() Native

Float Function GetDuration() Native

Float Function GetElapsedTime() Native

Form Function GetMagicItem() Native

Float Function GetMagnitude() Native

ActorValue Function GetResistanceValue() Native

Actor Function GetTargetActor() Native

Event OnActivate(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActorActivatedRef(ObjectReference akActivatedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
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

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
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

Event OnShipGravJump(Location aDestination, Int aState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
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

Function StartObjectProfiling() Native

Function StopObjectProfiling() Native
