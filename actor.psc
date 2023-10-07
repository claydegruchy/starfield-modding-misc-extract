ScriptName Actor Extends ObjectReference Native hidden

;-- Properties --------------------------------------
Int Property PathingResult_Success = 0 AutoReadOnly
Int Property PathingResult_Failure = 1 AutoReadOnly
Int Property PathingResult_Stopped = 2 AutoReadOnly
Int Property PathingResult_Cleared = 3 AutoReadOnly
Int Property PathingResult_Timeout = 4 AutoReadOnly
Int Property CritStage_None = 0 AutoReadOnly
Int Property CritStage_GooStart = 1 AutoReadOnly
Int Property CritStage_GooEnd = 2 AutoReadOnly
Int Property CritStage_DisintegrateStart = 3 AutoReadOnly
Int Property CritStage_DisintegrateEnd = 4 AutoReadOnly
Int Property CritStage_FreezeStart = 5 AutoReadOnly
Int Property CritStage_FreezeEnd = 6 AutoReadOnly

;-- Functions ---------------------------------------

Function AddPassiveAffinity(Float afAmountToAdd) Native

Function AddPerk(Perk akPerk, Bool abNotify) Native

Function AllowBleedoutDialogue(Bool abCanTalk) Native

Function AllowPCDialogue(Bool abTalk) Native

Function ApplyUnityCharacterData() Native

Function AttachAshPile(Form akAshPileBase) Native

Int Function AttackOutpostObjects(ObjectReference akOutpostBeacon) Native

Function AttemptAnimationSetSwitch() Native

Bool Function CanFlyHere() Native

Bool Function CanMoveVertical() Native

Bool Function CanStrafe() Native

Bool Function ChangeAnimArchetype(Keyword apKeyword) Native

Function ChangeAnimFaceArchetype(Keyword apKeyword) Native

Bool Function ChangeAnimFlavor(Keyword apKeyword) Native

Function ChangeHeadPart(headpart apHeadPart, Bool abRemovePart, Bool abRemoveExtraParts) Native

Function ClearArrested() Native

Function ClearExpressionOverride() Native

Function ClearExtraArrows() Native

Function ClearForcedMovement() Native

Function ClearLookAt() Native

Function CopyAppearance(Actor akSourceToCopyFrom) Native

Bool Function Dismount() Native

Function DispelAllSpells() Native

Function DoCombatSpellApply(Spell akSpell, ObjectReference akTarget) Native

Function DogDropItems() Native

Function DogPlaceInMouth(Form akItem) Native

Function DrawWeapon() Native

Function EnableAI(Bool abEnable, Bool abPauseVoice) Native

Function EndDeferredKill() Native

Function EquipItem(Form akItem, Bool abPreventRemoval, Bool abSilent) Native

Function EquipSpell(Spell akSpell, Int aiSource) Native

Function EvaluatePackage(Bool abResetAI) Native

Function ForceMovementDirection(Float afXAngle, Float afYAngle, Float afZAngle) Native

Function ForceMovementDirectionRamp(Float afXAngle, Float afYAngle, Float afZAngle, Float afRampTime) Native

Function ForceMovementRotationSpeed(Float afXMult, Float afYMult, Float afZMult) Native

Function ForceMovementRotationSpeedRamp(Float afXMult, Float afYMult, Float afZMult, Float afRampTime) Native

Function ForceMovementSpeed(Float afSpeedMult) Native

Function ForceMovementSpeedRamp(Float afSpeedMult, Float afRampTime) Native

Function ForceTargetAngle(Float afXAngle, Float afYAngle, Float afZAngle) Native

Function ForceTargetDirection(Float afXAngle, Float afYAngle, Float afZAngle) Native

Function ForceTargetSpeed(Float afSpeed) Native

Actor Function GetActorInDialogueWithRobot() Native

Actor[] Function GetAllActorsInCombatWithMe() Native

Actor[] Function GetAllCombatTargets() Native

Int Function GetBribeAmount() Native

Int Function GetCombatState() Native

Actor Function GetCombatTarget() Native

ObjectReference Function GetCrewAssignment() Native

Faction Function GetCrimeFaction() Native

Package Function GetCurrentPackage() Native

Actor Function GetDialogueTarget() Native

Int Function GetEquippedItemType(Int aiEquipIndex) Native

Armor Function GetEquippedShield() Native

Spell Function GetEquippedSpell(Int aiSource) Native

Weapon Function GetEquippedWeapon(Int aiEquipIndex) Native

Int Function GetFactionRank(Faction akFaction) Native

Int Function GetFactionReaction(Actor akOther) Native

Int Function GetFlyingState() Native

ObjectReference Function GetForcedLandingMarker() Native

ObjectReference Function GetFurnitureUsing() Native

Int Function GetGoldAmount() Native

Faction Function GetGroupFaction() Native

Int Function GetHighestRelationshipRank() Native

Actor Function GetKiller() Native

Int Function GetLevel() Native

ActorBase Function GetLeveledActorBase() Native

Float Function GetLightLevel() Native

Int Function GetLowestRelationshipRank() Native

ActorBase Function GetMatchingPlanetActorBase() Native

Bool Function GetNoBleedoutRecovery() Native

Bool Function GetPlayerControls() Native

Race Function GetRace() Native

Int Function GetRelationshipRank(Actor akOther) Native

Int Function GetSitState() Native

Int Function GetSleepState() Native

spaceshipreference Function GetSpaceship() Native

Bool Function HasAssociation(AssociationType akAssociation, Actor akOther) Native

Bool Function HasDetectionLOS(ObjectReference akOther) Native

Bool Function HasFamilyRelationship(Actor akOther) Native

Bool Function HasMagicEffect(MagicEffect akEffect) Native

Bool Function HasMagicEffectWithKeyword(Keyword akKeyword) Native

Bool Function HasParentRelationship(Actor akOther) Native

Bool Function HasPerk(Perk akPerk) Native

Bool Function HasSpell(Form akForm) Native

Bool Function IsAIEnabled() Native

Bool Function IsAlarmed() Native

Bool Function IsAlerted() Native

Bool Function IsAllowedToFly() Native

Bool Function IsArrested() Native

Bool Function IsArrestingTarget() Native

Bool Function IsBeingRidden() Native

Bool Function IsBeingRiddenBy(Actor akActor) Native

Int Function IsBleedingOut() Native

Bool Function IsBribed() Native

Bool Function IsChild() Native

Bool Function IsCommandedActor() Native

Bool Function IsDead() Native

Bool Function IsDetectedBy(Actor akOther) Native

Bool Function IsDoingFavor() Native

Bool Function IsEquipped(Form akItem) Native

Bool Function IsEssential() Native

Bool Function IsFlying() Native

Bool Function IsGhost() Native

Bool Function IsGuard() Native

Bool Function IsHostileToActor(Actor akActor) Native

Bool Function IsInCombat() Native

Bool Function IsInFaction(Faction akFaction) Native

Bool Function IsInIronSights() Native

Bool Function IsInKillMove() Native

Bool Function IsInScene() Native

Bool Function IsIntimidated() Native

Bool Function IsOnMount() Native

Bool Function IsOverEncumbered() Native

Bool Function IsPlayerTeammate() Native

Bool Function IsPlayersLastRiddenHorse() Native

Bool Function IsRunning() Native

Bool Function IsSeatOccupied(Keyword apKeyword) Native

Bool Function IsSneaking() Native

Bool Function IsSprinting() Native

Bool Function IsTalking() Native

Bool Function IsTrespassing() Native

Bool Function IsUnconscious() Native

Bool Function IsWeaponDrawn() Native

Function Kill(Actor akKiller) Native

Function KillSilent(Actor akKiller) Native

Function MarkItemAsFavorite(Form akItem, Int aiSlot) Native

Function ModFactionRank(Faction akFaction, Int aiMod) Native

Function MoveToPackageLocation() Native

Event OnActorActivatedRef(ObjectReference akActivatedRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
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

Event OnCripple(ActorValue akActorValue, Bool abCrippled)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeferredKill(Actor akKiller)
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

Event OnEnterOutpostBeaconMode()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterSneaking()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStart()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEscortWaitStop()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitShipInterior(ObjectReference akShip)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGetUp(ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnKill(ObjectReference akVictim)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnOutpostPlaced(ObjectReference akOutpostBeacon)
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

Event OnRaceSwitchComplete()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRecoverFromBleedout()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSit(ObjectReference akFurniture)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function OpenInventory(Bool abForceOpen, Form akFilter, Bool abIncludeOnlyFromFilter) Native

Int Function PathToReference(ObjectReference aTarget, Float afNormalizedSpeed, Float afNormalizedRotationSpeed, Float afTargetRadius, Bool abHardRadius) Native

Bool Function PlayIdle(Idle akIdle) Native

Bool Function PlayIdleAction(Action aAction, ObjectReference aTarget) Native

Bool Function PlayIdleWithTarget(Idle akIdle, ObjectReference akTarget) Native

Function PlaySubGraphAnimation(String asEventName) Native

Function RemoveFromAllFactions() Native

Function RemoveFromFaction(Faction akFaction) Native

Function RemovePerk(Perk akPerk) Native

Bool Function RemoveSpell(Spell akSpell) Native

Function ResetHealthAndLimbs() Native

Function Resurrect() Native

Function SendAssaultAlarm() Native

Function SendSmugglingAlarm(Actor akCriminal) Native

Function SendTrespassAlarm(Actor akCriminal) Native

Function SetAlert(Bool abAlerted) Native

Function SetAllowFlying(Bool abAllowed, Bool abAllowCrash, Bool abAllowSearch) Native

Function SetAlpha(Float afTargetAlpha, Bool abFade) Native

Function SetAttackActorOnSight(Bool abAttackOnSight) Native

Function SetAvoidPlayer(Bool abAvoid) Native

Function SetBribed(Bool abBribe) Native

Function SetCanDoCommand(Bool abCanCommand) Native

Function SetCombatStyle(combatstyle akCombatStyle) Native

Function SetCommandState(Bool abStartCommandMode) Native

Function SetCrimeFaction(Faction akFaction) Native

Function SetCriticalStage(Int aiStage) Native

Function SetDoingFavor(Bool abDoingFavor, Bool abWorkShopMode) Native

Function SetEssential(Bool abEssential) Native

Function SetFactionRank(Faction akFaction, Int aiRank) Native

Function SetForcedLandingMarker(ObjectReference aMarker) Native

Function SetGhost(Bool abIsGhost) Native

Function SetGroupFaction(Faction akFaction) Native

Function SetHasCharGenSkeleton(Bool abCharGen) Native

Function SetHeadTracking(Bool abEnable) Native

Function SetIntimidated(Bool abIntimidate) Native

Function SetLookAt(ObjectReference akTarget, Bool abPathingLookAt) Native

Function SetNoBleedoutRecovery(Bool abAllowed) Native

Function SetNotShowOnStealthMeter(Bool abNotShow) Native

Function SetOutfit(Outfit akOutfit, Bool abSleepOutfit) Native

Function SetOverrideVoiceType(VoiceType akVoiceType) Native

Function SetPlayerControls(Bool abControls) Native

Function SetPlayerResistingArrest() Native

Function SetPlayerTeammate(Bool abTeammate, Bool abCanDoFavor, Bool abGivePlayerXP) Native

Function SetProtected(Bool abProtected) Native

Function SetRace(Race akRace) Native

Function SetRelationshipRank(Actor akOther, Int aiRank) Native

Bool Function SetRestrained(Bool abRestrained) Native

Function SetSubGraphFloatVariable(String asVariableName, Float afValue) Native

Bool Function SetUnconscious(Bool abUnconscious) Native

Function SetVehicle(Actor akVehicle) Native

Function SetWantSprinting(Bool abWantSprint) Native

Function SheatheWeapon() Native

Function ShowBarterMenu() Native

Function ShowCrewAssign(Bool abAssign) Native

Bool Function SnapIntoInteraction(ObjectReference akTarget) Native

Bool Function StartCombat(ObjectReference akTarget, Bool abPreferredTarget) Native

Function StartDeferredKill() Native

Function StartFrenzyAttack(Float aChance, Float aInterval) Native

Function StartSneaking() Native

Function StartVampireFeed(Actor akTarget) Native

Function StopCombat() Native

Function StopCombatAlarm() Native

Function SwitchToPowerArmor(ObjectReference aArmorFurniture) Native

Bool Function TrapSoul(Actor akTarget) Native

Function UnLockOwnedDoorsInCell() Native

Function UnequipAll() Native

Function UnequipItem(Form akItem, Bool abPreventEquip, Bool abSilent) Native

Function UnequipItemSlot(Int aiSlot) Native

Function UnequipSpell(Spell akSpell, Int aiSource) Native

Bool Function WillIntimidateSucceed() Native

Bool Function WornCoversBipedSlot(Int aiSlot) Native

Bool Function WornHasKeyword(Keyword akKeyword) Native

Bool Function WouldBeStealing(ObjectReference akObject) Native

Int Function WouldRefuseCommand(ObjectReference akObject) Native

Function ModFavorPoints(Int iFavorPoints)
  If iFavorPoints > 0 ; #DEBUG_LINE_NO:20
    Self.MakePlayerFriend() ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ModFavorPointsWithGlobal(GlobalVariable FavorPointsGlobal)
  Self.ModFavorPoints(FavorPointsGlobal.GetValueInt()) ; #DEBUG_LINE_NO:29
EndFunction

Function MakePlayerFriend()
  ActorBase myBase = Self.GetLeveledActorBase() ; #DEBUG_LINE_NO:34
  If myBase.IsUnique() ; #DEBUG_LINE_NO:35
    If Self.GetRelationshipRank(Game.GetPlayer()) == 0 ; #DEBUG_LINE_NO:36
      Self.SetRelationshipRank(Game.GetPlayer(), 1) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearForcedLandingMarker()
  Self.SetForcedLandingMarker(None) ; #DEBUG_LINE_NO:94
EndFunction

Bool Function IsOwner(ObjectReference akObject)
  If akObject.GetActorRefOwner() ; #DEBUG_LINE_NO:386
    Return akObject.GetActorRefOwner() == Self ; #DEBUG_LINE_NO:387
  ElseIf akObject.GetActorOwner() ; #DEBUG_LINE_NO:388
    Return (akObject.GetActorOwner() as Form == Self.GetBaseObject()) || akObject.GetActorOwner() == Self.GetLeveledActorBase() ; #DEBUG_LINE_NO:390
  ElseIf akObject.GetFactionOwner() ; #DEBUG_LINE_NO:391
    Return Self.IsInFaction(akObject.GetFactionOwner()) ; #DEBUG_LINE_NO:392
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:394
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function KillEssential(Actor akKiller)
  Self.SetEssential(False) ; #DEBUG_LINE_NO:434
  Self.SetProtected(False) ; #DEBUG_LINE_NO:435
  Self.Kill(akKiller) ; #DEBUG_LINE_NO:436
EndFunction

Bool Function MoveToFurniture(ObjectReference akTargetFurniture)
  Self.MoveTo(akTargetFurniture, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:459
  Return Self.SnapIntoInteraction(akTargetFurniture) ; #DEBUG_LINE_NO:460
EndFunction

Function AddToFaction(Faction akFaction)
  If !Self.IsInFaction(akFaction) ; #DEBUG_LINE_NO:598
    Self.SetFactionRank(akFaction, 0) ; #DEBUG_LINE_NO:599
  EndIf ; #DEBUG_LINE_NO:
EndFunction

VoiceType Function SetOverrideVoiceTypeRandom(FormList akVoiceList)
  ActorBase baseActor = Self.GetLeveledActorBase() ; #DEBUG_LINE_NO:627
  VoiceType[] voices = new VoiceType[0] ; #DEBUG_LINE_NO:629
  Int sex = baseActor.GetSex() ; #DEBUG_LINE_NO:631
  Int I = 0 ; #DEBUG_LINE_NO:633
  Int iMax = akVoiceList.GetSize() ; #DEBUG_LINE_NO:634
  While I < iMax ; #DEBUG_LINE_NO:635
    VoiceType currentVoiceType = akVoiceList.GetAt(I) as VoiceType ; #DEBUG_LINE_NO:636
    If currentVoiceType.GetSex() == sex ; #DEBUG_LINE_NO:638
      voices.add(currentVoiceType, 1) ; #DEBUG_LINE_NO:639
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:642
  EndWhile ; #DEBUG_LINE_NO:
  Int iRandom = Utility.RandomInt(0, voices.Length - 1) ; #DEBUG_LINE_NO:645
  VoiceType randomVoiceType = voices[iRandom] ; #DEBUG_LINE_NO:646
  If randomVoiceType ; #DEBUG_LINE_NO:648
    Self.SetOverrideVoiceType(randomVoiceType) ; #DEBUG_LINE_NO:649
  EndIf ; #DEBUG_LINE_NO:
  Return randomVoiceType ; #DEBUG_LINE_NO:654
EndFunction
