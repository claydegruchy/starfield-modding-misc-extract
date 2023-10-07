ScriptName ObjectReference Extends Form Native hidden

;-- Properties --------------------------------------
Float Property X
  Float Function Get()
    Return Self.GetPositionX() ; #DEBUG_LINE_NO:114
  EndFunction
EndProperty
Float Property Y
  Float Function Get()
    Return Self.GetPositionY() ; #DEBUG_LINE_NO:121
  EndFunction
EndProperty
Float Property Z
  Float Function Get()
    Return Self.GetPositionZ() ; #DEBUG_LINE_NO:128
  EndFunction
EndProperty
Int Property CONST_NearPosition_Min = 0 AutoReadOnly
Int Property CONST_NearPosition_Max = 6 AutoReadOnly
Int Property CONST_NearPosition_Random = -2 AutoReadOnly
Int Property CONST_NearPosition_DeadAhead = -1 AutoReadOnly
Int Property CONST_NearPosition_ForwardTight = 0 AutoReadOnly
Int Property CONST_NearPosition_ForwardWide = 1 AutoReadOnly
Int Property CONST_NearPosition_Behind = 2 AutoReadOnly
Int Property CONST_NearPosition_Above = 3 AutoReadOnly
Int Property CONST_NearPosition_Below = 4 AutoReadOnly
Int Property CONST_NearPosition_Left = 5 AutoReadOnly
Int Property CONST_NearPosition_Right = 6 AutoReadOnly
Float Property CONST_NearPosition_TightArc = 0.100000001 AutoReadOnly
Float Property CONST_NearPosition_WideArc = 0.200000003 AutoReadOnly
Int Property CONST_NearDistance_Min = 0 AutoReadOnly
Int Property CONST_NearDistance_Max = 4 AutoReadOnly
Int Property CONST_NearDistance_RandomFar = -3 AutoReadOnly
Int Property CONST_NearDistance_Random = -2 AutoReadOnly
Int Property CONST_NearDistance_VeryClose = -1 AutoReadOnly
Int Property CONST_NearDistance_Close = 0 AutoReadOnly
Int Property CONST_NearDistance_Short = 1 AutoReadOnly
Int Property CONST_NearDistance_Moderate = 2 AutoReadOnly
Int Property CONST_NearDistance_Long = 3 AutoReadOnly
Int Property CONST_NearDistance_VeryLong = 4 AutoReadOnly
Int Property CONST_NearDistance_Close_Min = 200 AutoReadOnly
Int Property CONST_NearDistance_Close_Max = 400 AutoReadOnly
Int Property CONST_NearDistance_Short_Min = 600 AutoReadOnly
Int Property CONST_NearDistance_Short_Max = 1000 AutoReadOnly
Int Property CONST_NearDistance_Moderate_Min = 1200 AutoReadOnly
Int Property CONST_NearDistance_Moderate_Max = 2000 AutoReadOnly
Int Property CONST_NearDistance_Long_Min = 2500 AutoReadOnly
Int Property CONST_NearDistance_Long_Max = 5000 AutoReadOnly
Int Property CONST_NearDistance_VeryLong_Min = 6000 AutoReadOnly
Int Property CONST_NearDistance_VeryLong_Max = 10000 AutoReadOnly
Int Property CONST_NearFacing_Min = 0 AutoReadOnly
Int Property CONST_NearFacing_Max = 7 AutoReadOnly
Int Property CONST_NearFacing_TotallyRandom = -3 AutoReadOnly
Int Property CONST_NearFacing_Random = -2 AutoReadOnly
Int Property CONST_NearFacing_Direct = -1 AutoReadOnly
Int Property CONST_NearFacing_TowardSmall = 0 AutoReadOnly
Int Property CONST_NearFacing_TowardLarge = 1 AutoReadOnly
Int Property CONST_NearFacing_AwaySmall = 2 AutoReadOnly
Int Property CONST_NearFacing_AwayLarge = 3 AutoReadOnly
Int Property CONST_NearFacing_LeftSideOn = 4 AutoReadOnly
Int Property CONST_NearFacing_RightSideOn = 5 AutoReadOnly
Int Property CONST_NearFacing_BottomSideOn = 6 AutoReadOnly
Int Property CONST_NearFacing_TopSideOn = 7 AutoReadOnly
Float Property CONST_NearFacing_HeadingCorrectionToDirectFacing = 90.0 AutoReadOnly
Float Property CONST_NearFacing_TightAngle = 15.0 AutoReadOnly
Float Property CONST_NearFacing_WideAngle = 30.0 AutoReadOnly
Int Property Motion_Fixed = 0 AutoReadOnly
Int Property Motion_Dynamic = 1 AutoReadOnly
Int Property Motion_Keyframed = 2 AutoReadOnly

;-- Functions ---------------------------------------

Bool Function Activate(ObjectReference akActivator, Bool abDefaultProcessingOnly) Native

Bool Function AddDependentAnimatedObjectReference(ObjectReference akDependent) Native

Function AddDynamicTerminalMenuItem(terminalmenu akTemplateSource, Int aiTemplateIndex, Int aiItemID, Form[] akTagReplacementForms) Native

Function AddItem(Form akItemToAdd, Int aiCount, Bool abSilent) Native

Function AddKeyIfNeeded(ObjectReference aLockedRef) Native

Function AddKeyword(Keyword apKeyword) Native

Bool Function AddSpell(Spell akSpell, Bool abVerbose) Native

Function AddTextReplacementData(String asTokenLabel, Form akForm) Native

Function AddTextReplacementValue(String asTokenLabel, Float aValue) Native

Function AddToMap(Bool abAllowFastTravel) Native

Bool Function AddTransferLink(ObjectReference akTarget) Native

Function ApplyConveyorBelt(String aTarget, Float aLinVelX, Float aLinVelY, Float aLinVelZ, Bool abOn, Bool abReverse) Native

Function ApplyFanMotor(String aTarget, Float aAxisX, Float aAxisY, Float aAxisZ, Float aForce, Bool abOn) Native

Function ApplyHavokImpulse(Float afX, Float afY, Float afZ, Float afMagnitude) Native

Bool Function AreAllInTrigger(ObjectReference[] refsToCheck) Native

Bool Function AreAnyInTrigger(ObjectReference[] refsToCheck) Native

Function AssignCrew(Actor aCrewMember) Native

Bool Function AttachMod(objectmod akMod, Int aiAttachIndex) Native

Bool Function AttachModToInventoryItem(Form akItem, objectmod akMod) Native

Function AttachTo(ObjectReference akParent) Native

Function BlockActivation(Bool abBlocked, Bool abHideActivateText) Native

Int Function CalculateEncounterLevel(Int aiDifficulty) Native

Bool Function CanFastTravelToMarker() Native

Bool Function CanProduceForWorkshop() Native

Function ClearDestruction() Native

Function ClearDynamicTerminalMenuItems() Native

Function ClearFromOldLocations() Native

Function ConveyorBeltOn(Bool abOn) Native

Int Function CountActorsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Int Function CountLinkedRefChain(Keyword apKeyword, Int maxExpectedLinkedRefs) Native

Int Function CountRefsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Function CreateDetectionEvent(Actor akOwner, Int aiSoundLevel) Native

Function DamageObject(Float afDamage) Native

Function DamageValue(ActorValue akAV, Float afDamage) Native

Function Delete() Native

Function Disable(Bool abFadeOut) Native

Function DisableLinkChain(Keyword apKeyword, Bool abFadeOut) Native

Function DisableNoWait(Bool abFadeOut) Native

Bool Function DispelSpell(Spell akSpell) Native

Function Drop(Bool abSilent) Native

ObjectReference Function DropFirstObject(Bool abInitiallyDisabled) Native

ObjectReference Function DropObject(Form akObject, Int aiCount) Native

Bool Function Enable(Bool abFadeIn) Native

Function EnableFastTravel(Bool abEnable) Native

Function EnableLinkChain(Keyword apKeyword, Bool abFadeIn) Native

Bool Function EnableNoWait(Bool abFadeIn) Native

Function FanMotorOn(Bool abOn) Native

ObjectReference[] Function FindAllReferencesOfType(Form akObjectOrList, Float afRadius) Native

ObjectReference[] Function FindAllReferencesWithKeyword(Form akKeywordOrList, Float afRadius) Native

Function ForceAddRagdollToWorld() Native

Function ForceRemoveRagdollFromWorld() Native

ActorBase Function GetActorBaseForResource(ActorValue akAV) Native

ActorBase Function GetActorOwner() Native

Actor Function GetActorRefOwner() Native

Actor[] Function GetActorsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Actor[] Function GetAllCrewMembers() Native

ObjectReference[] Function GetAllRefsInTrigger() Native

Float Function GetAngleX() Native

Float Function GetAngleY() Native

Float Function GetAngleZ() Native

Bool Function GetAnimationVariableBool(String arVariableName) Native

Float Function GetAnimationVariableFloat(String arVariableName) Native

Int Function GetAnimationVariableInt(String arVariableName) Native

Form Function GetBaseObject() Native

Float Function GetBaseValue(ActorValue akAV) Native

ActorBase[] Function GetBiomeActors(Float afMaxPercentageKnown) Native

Flora[] Function GetBiomeFlora(Float afMaxPercentageKnown) Native

Int Function GetComponentCount(Form akItem) Native

ObjectReference Function GetContainer() Native

Int Function GetCurrentDestructionStage() Native

Location Function GetCurrentLocation() Native

planet Function GetCurrentPlanet() Native

Scene Function GetCurrentScene() Native

Int[] Function GetDebugTextColor() Native

Int Function GetDebugTextSize() Native

String Function GetDebugTextString() Native

ObjectReference[] Function GetDestructibleOutpostObjects() Native

Location Function GetEditorLocation() Native

Faction Function GetFactionOwner() Native

Flora Function GetFloraForResource(ActorValue akAV) Native

Float Function GetGravityScale() Native

Float Function GetHeadingAngle(ObjectReference akOther) Native

Float Function GetHeight() Native

Int Function GetHighestItemCountKeywords(FormList akKeywords, Bool abMustMatchAll) Native

Int Function GetInventoryValue() Native

Int Function GetItemCount(Form akItem) Native

Int Function GetItemCountKeywords(FormList akKeywords, Bool abMustMatchAll) Native

Float Function GetItemHealthPercent() Native

Key Function GetKey() Native

Float Function GetLength() Native

Cell Function GetLinkedCell(Keyword akKeyword) Native

ObjectReference Function GetLinkedRef(Keyword apKeyword) Native

ObjectReference[] Function GetLinkedRefChain(Keyword apKeyword, Int iMaxExpectedLinkedRefs) Native

LocationRefType[] Function GetLocRefTypes() Native

Int Function GetLockLevel() Native

Float Function GetMass() Native

ObjectReference Function GetNthLinkedRef(Int aiLinkedRef, Keyword apKeyword) Native

Int Function GetOpenState() Native

Cell Function GetParentCell() Native

Float Function GetPercentageKnown() Native

Float Function GetPositionX() Native

Float Function GetPositionY() Native

Float Function GetPositionZ() Native

Float Function GetRadioFrequency() Native

Float Function GetRadioVolume() Native

ObjectReference[] Function GetRefsLinkedToMe(Keyword apLinkKeyword, Keyword apExcludeKeyword) Native

Float Function GetResourceDamage(ActorValue akValue) Native

Float[] Function GetSafePosition(Float aSearchRadius, Float aSafeRadius) Native

Float Function GetScale() Native

Float[] Function GetSpacePosition() Native

Float[] Function GetSpaceTransform() Native

Actor Function GetSpaceshipAutopilotAI() Native

Cell Function GetTeleportCell() Native

Cell Function GetTransitionCell() Native

Float Function GetTransmitterDistance() Native

Int Function GetTriggerObjectCount() Native

Float Function GetValue(ActorValue akAV) Native

Float Function GetValuePercentage(ActorValue akAV) Native

resource[] Function GetValueResources() Native

VoiceType Function GetVoiceType() Native

Float Function GetWeight() Native

Float Function GetWeightInContainer() Native

Float Function GetWidth() Native

ObjectReference Function GetWorkshop() Native

ObjectReference[] Function GetWorkshopOwnedObjects(Actor akActor) Native

Float Function GetWorkshopResourceDamage(ActorValue akValue) Native

ObjectReference[] Function GetWorkshopResourceObjects(ActorValue akAV, Int aiOption) Native

WorldSpace Function GetWorldSpace() Native

Bool Function HasActorRefOwner() Native

Bool Function HasCrew() Native

Bool Function HasDirectLOS(ObjectReference akTarget, String asSourceNode, String asTargetNode) Native

Bool Function HasEffectKeyword(Keyword akKeyword) Native

Bool Function HasKeyword(Keyword apKeyword) Native

Bool Function HasKeywordInFormList(FormList akKeywordList) Native

Bool Function HasLocRefType(LocationRefType akRefType) Native

Bool Function HasMagicEffect(MagicEffect akMagicEffect) Native

Bool Function HasNode(String asNodeName) Native

Bool Function HasSharedPowerGrid(ObjectReference akCompare) Native

Function IgnoreFriendlyHits(Bool abIgnore) Native

Function InterruptCast() Native

Bool Function Is3DLoaded() Native

Bool Function IsActivateChild(ObjectReference akChild) Native

Bool Function IsActivationBlocked() Native

Bool Function IsConveyorBeltOn() Native

Bool Function IsCreated() Native

Bool Function IsDebugTextBillboard() Native

Bool Function IsDeleted() Native

Bool Function IsDestroyed() Native

Bool Function IsDisabled() Native

Bool Function IsDoorInaccessible() Native

Bool Function IsFanMotorOn() Native

Bool Function IsFurnitureInUse(Bool abIgnoreReserved) Native

Bool Function IsFurnitureMarkerInUse(Int aiMarker, Bool abIgnoreReserved) Native

Bool Function IsIgnoringFriendlyHits() Native

Bool Function IsInDialogueWithPlayer() Native

Bool Function IsInSpace() Native

Bool Function IsInTrigger(ObjectReference refToCheck) Native

Bool Function IsLockBroken() Native

Bool Function IsLocked() Native

Bool Function IsMapMarkerVisible() Native

Bool Function IsOwnedBy(Actor akOwner) Native

Bool Function IsPowered() Native

Bool Function IsQuestItem() Native

Bool Function IsRadioOn() Native

Bool Function IsRefInTransitionCell(ObjectReference akRef) Native

Bool Function IsScanned() Native

Bool Function IsSpellTarget(Form akMagicItemForm) Native

Bool Function IsTeleportAreaLoaded() Native

Bool Function IsWithinBuildableArea(ObjectReference akRef) Native

Function KnockAreaEffect(Float afMagnitude, Float afRadius) Native

Function Lock(Bool abLock, Bool abAsOwner, Bool abTraverseLinkedLockables) Native

ObjectReference Function MakeAliasedRefFromInventory(Form akObject, Alias akAlias) Native

Function MakeTransmitterRepeater(ObjectReference akTransmitterToRepeat, Float afInnerRadius, Float afOuterRadius, Bool abUnlimitedRange) Native

Function ModValue(ActorValue akAV, Float afAmount) Native

Function MoveContainerContentToUnfilledContainers() Native

Function MoveTo(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset, Bool abMatchRotation, Bool abRotateOffset) Native

Function MoveToMyEditorLocation() Native

Function MoveToNearestNavmeshLocation() Native

Function MoveToNode(ObjectReference akTarget, String asNodeName, String asMatchNodeName) Native

Event OnActivate(ObjectReference akActionRef)
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

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEquipped(Actor akActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGrab()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
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

Event OnPipboyRadioDetection(Bool abDetected)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerDialogueTarget()
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

Event OnRead()
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

Function OpenOneWayTransferMenu(Bool aIsGiveOnly, FormList aFilterList) Native

Function PauseAudio() Native

Actor Function PlaceActorAtMe(ActorBase akActorToPlace, Int aiLevelMod, Location akEncLoc, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceAtMe(Form akFormToPlace, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceAtNode(String asNodeName, Form akFormToPlace, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Bool abAttach) Native

Cell Function PlaceCellAtMe(Cell akCellToCopy, RefCollectionAlias akRefCollection, Bool abForcePersist, Bool abDeleteWhenAble, Bool abInitiallyDisabled, Float[] akOffsetValues) Native

Actor Function PlaceDuplicateActorAtMe(Actor akActorToDuplicate, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Bool abSnapOffsetToNavmesh) Native

ObjectReference Function PlaceLockedRefKeyAtMe(ObjectReference aLockedRef, Int aiCount, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble) Native

spaceshipreference Function PlaceShipAtMe(Form akFormToPlace, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Float[] akOffsetValues, Alias akAliasToFill, Location akEncLoc, Bool abSnapOffsetToNavmesh) Native

Bool Function PlayAnimation(String asAnimation) Native

Bool Function PlayAnimationAndWait(String asAnimation, String asEventName) Native

Bool Function PlayGamebryoAnimation(String asAnimation, Bool abStartOver, Float afEaseInTime) Native

Bool Function PlayImpactEffect(ImpactDataSet akImpactEffect, String asNodeName, Float afPickDirX, Float afPickDirY, Float afPickDirZ, Float afPickLength, Bool abApplyNodeRotation, Bool abUseNodeLocalRotation) Native

Bool Function PlaySyncedAnimationAndWaitSS(String asAnimation1, String asEvent1, ObjectReference akObj2, String asAnimation2, String asEvent2) Native

Bool Function PlaySyncedAnimationSS(String asAnimation1, ObjectReference akObj2, String asAnimation2) Native

Function PlayTerrainEffect(String asEffectModelName, String asAttachBoneName) Native

Function PreloadExteriorCell() Native

Function PreloadTargetArea() Native

Function ProcessTrapHit(ObjectReference akTrap, Float afDamage, Float afPushback, Float afXVel, Float afYVel, Float afZVel, Float afXPos, Float afYPos, Float afZPos, Int aeMaterial, Float afStagger) Native

Function PromoteToLegendary(Int aiRank, legendaryitem akItemDefinition) Native

Function PushActorAway(Actor akActorToPush, Float aiKnockbackForce) Native

Function RemoveAllItems(ObjectReference akTransferTo, Bool abKeepOwnership, Bool abRespectTargetCapacity) Native

Function RemoveAllMods() Native

Function RemoveAllModsFromInventoryItem(Form akItem) Native

Bool Function RemoveDependentAnimatedObjectReference(ObjectReference akDependent) Native

Int Function RemoveItem(Form akItemToRemove, Int aiCount, Bool abSilent, ObjectReference akOtherContainer) Native

Int Function RemoveItemByComponent(Form akComponentToRemove, Int aiCount, Bool abSilent, ObjectReference akOtherContainer) Native

Function RemoveKeyword(Keyword apKeyword) Native

Function RemoveMod(objectmod akMod) Native

Function RemoveModFromInventoryItem(Form akItem, objectmod akMod) Native

Int Function RemoveResources(resource akResource, Int aiCount, Bool abSilent) Native

Function RemoveTransferLink(ObjectReference akTarget) Native

Function Repair() Native

Function Reset(ObjectReference akTarget) Native

Function ResetKeyword(Keyword apKeyword) Native

Function RestoreValue(ActorValue akAV, Float afAmount) Native

Function ResumeAudio() Native

Function ReverseConveyorBelt(Bool abReverse) Native

Function Say(Topic akTopicToSay, Actor akActorToSpeakAs, Bool abSpeakInPlayersHead, ObjectReference akTarget) Native

Function SayCustom(Keyword akKeywordToSay, Actor akActorToSpeakAs, Bool abSpeakInPlayersHead, ObjectReference akTarget) Native

Function SendStealAlarm(Actor akThief) Native

Function SetActivateTextOverride(Message akText) Native

Function SetActorCause(Actor akActor) Native

Function SetActorOwner(ActorBase akActorBase, Bool abNoCrime) Native

Function SetActorRefOwner(Actor akActor, Bool abNoCrime) Native

Function SetAngle(Float afXAngle, Float afYAngle, Float afZAngle) Native

Function SetAnimationVariableBool(String arVariableName, Bool abNewValue) Native

Function SetAnimationVariableFloat(String arVariableName, Float afNewValue) Native

Function SetAnimationVariableInt(String arVariableName, Int aiNewValue) Native

Function SetAttractionActive(Keyword apKeyword, Bool abActive) Native

Function SetConveyorBeltVelocity(Float afLinVelX, Float afLinVelY, Float afLinVelZ) Native

Function SetDebugTextBillboard(Bool abBillboard) Native

Function SetDebugTextColor(Int aiRed, Int aiGreen, Int aiBlue, Int aiAlpha) Native

Function SetDebugTextSize(Int aiFontSize) Native

Function SetDebugTextString(String asText) Native

Function SetDestroyed(Bool abDestroyed) Native

Function SetDirectAtTarget(ObjectReference akTarget) Native

Function SetDoorInaccessible(Bool abInaccessible) Native

Function SetFactionOwner(Faction akFaction, Bool abNoCrime) Native

Function SetHarvested(Bool abHarvested) Native

Function SetLinkedRef(ObjectReference akLinkedRef, Keyword apKeyword, Bool abPromoteParentRefr) Native

Function SetLocRefType(Location akLoc, LocationRefType akRefType) Native

Function SetLockLevel(Int aiLockLevel) Native

Function SetMapMarkerCategory(Int iCategory) Native

Function SetMapMarkerType(Int iType) Native

Function SetMapMarkerUnexploredName(Message aName) Native

Function SetMarkerAllowGravJump(Bool aAllowGravJump) Native

Function SetMarkerDiscovered() Native

Function SetMarkerUndiscoveredVisibility(Int iVisibilityEnum) Native

Function SetMarkerVisibleOnStarMap(Bool aVisible) Native

Function SetMotionType(Int aeMotionType, Bool abImmediatelySimulate) Native

Function SetNoFavorAllowed(Bool abNoFavor) Native

Function SetOpen(Bool abOpen) Native

Function SetOverrideName(Message akText) Native

Function SetPersistLoc(Location akLoc) Native

Function SetPlayerHasTaken(Bool abTaken) Native

Function SetPosition(Float afX, Float afY, Float afZ) Native

Function SetRadioFrequency(Float afFrequency) Native

Function SetRadioOn(Bool abOn) Native

Function SetRadioVolume(Float afVolume) Native

Function SetRequiresScanning(Bool abRequiresScanning) Native

Function SetScale(Float afScale) Native

Function SetScanned(Bool abValue) Native

Function SetValue(ActorValue akAV, Float afValue) Native

Bool Function SetWorkshopState(Int aState) Native

Function ShowHangarMenu(Int aiMode, Actor akVendor, spaceshipreference akMenuTarget, Bool abOpenToAvailableTab) Native

Function ShowWorkshopBuilderMenu() Native

Function ShowWorkshopTargetMenu(Bool abIncludeSameSystem, Keyword akSameSystemRequiredKeyword, Bool abIncludeIntersystem, Keyword akIntersystemRequiredKeyword) Native

Function SplineTranslateTo(Float afX, Float afY, Float afZ, Float afXAngle, Float afYAngle, Float afZAngle, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed) Native

Function SplineTranslateToRefNode(ObjectReference arTarget, String arNodeName, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed) Native

Function StartSequence(String aSequenceName, Bool aAttach, Float afWeight) Native

Function StartSequenceOnReferences(String aSequenceName, ObjectReference[] aRefs, Bool aAttach) Global Native

Function StartWorkshop(Bool abStart) Native

Function StopAllSequences() Native

Function StopAllSequencesOnReferences(ObjectReference[] aRefs) Global Native

Function StopSequence(String aSequenceName) Native

Function StopTranslation() Native

Function StoreInWorkshop(Form akBaseItem, Int aiCount) Native

Function TetherToHorse(ObjectReference akHorse) Native

Function TranslateTo(Float afX, Float afY, Float afZ, Float afXAngle, Float afYAngle, Float afZAngle, Float afSpeed, Float afMaxRotationSpeed) Native

Function UnassignCrew(Actor aCrewMember) Native

Bool Function WaitFor3DLoad() Native

Bool Function WaitForAnimationEvent(String asEventName) Native

Float Function getDistance(ObjectReference akOther) Native

spaceshipreference Function GetCurrentShipRef()
  ObjectReference myShip = Self.GetParentCell().GetParentRef() ; #DEBUG_LINE_NO:6
  Return myShip as spaceshipreference ; #DEBUG_LINE_NO:7
EndFunction

Function Unlock(Bool abAsOwner)
  Self.Lock(False, abAsOwner, True) ; #DEBUG_LINE_NO:12
EndFunction

Bool Function rampRumble(Float power, Float duration, Float falloff)
  If power > 1.0 || power <= 0.0 ; #DEBUG_LINE_NO:19
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Float playerDist = Game.getplayer().getDistance(Self) ; #DEBUG_LINE_NO:23
  If playerDist < falloff ; #DEBUG_LINE_NO:25
    Float intensity = 1.0 - playerDist / falloff ; #DEBUG_LINE_NO:26
    intensity *= power ; #DEBUG_LINE_NO:28
    If intensity > 1.0 ; #DEBUG_LINE_NO:29
      intensity = 1.0 ; #DEBUG_LINE_NO:32
    ElseIf intensity <= 0.0 ; #DEBUG_LINE_NO:33
      intensity = 0.0 ; #DEBUG_LINE_NO:36
      Return False ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
    Game.shakeCamera(Game.getplayer() as ObjectReference, intensity, 0.0) ; #DEBUG_LINE_NO:39
    Game.shakeController(intensity, intensity, duration) ; #DEBUG_LINE_NO:40
    Return True ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsNearPlayer()
  Actor player = Game.getplayer() ; #DEBUG_LINE_NO:50
  Cell targetCell = Self.GetParentCell() ; #DEBUG_LINE_NO:51
  Cell playerCell = player.GetParentCell() ; #DEBUG_LINE_NO:52
  If targetCell != playerCell ; #DEBUG_LINE_NO:54
    If (targetCell as Bool && targetCell.IsInterior()) || (playerCell as Bool && playerCell.IsInterior()) ; #DEBUG_LINE_NO:56
      Return False ; #DEBUG_LINE_NO:59
    ElseIf player.getDistance(Self) > 3000.0 ; #DEBUG_LINE_NO:63
      Return False ; #DEBUG_LINE_NO:65
    Else ; #DEBUG_LINE_NO:
      Return True ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Return True ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsInInterior()
{ Returns !IsInExterior() }
  Cell parentCell = Self.GetParentCell() ; #DEBUG_LINE_NO:80
  Return parentCell as Bool && parentCell.IsInterior() ; #DEBUG_LINE_NO:81
EndFunction

Bool Function MoveToIfUnloaded(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset)
{ Calls MoveTo if the calling ObjectReference is currently unloaded. Doesn't do anything if it IS loaded. No waiting or while loops. Returns true if it does the moveto }
  If !Self.Is3DLoaded() ; #DEBUG_LINE_NO:87
    Self.MoveTo(akTarget, afXOffset, afYOffset, afZOffset, True, False) ; #DEBUG_LINE_NO:88
    Return True ; #DEBUG_LINE_NO:89
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function HasRefType(LocationRefType akRefType)
  Return Self.HasLocRefType(akRefType) ; #DEBUG_LINE_NO:97
EndFunction

Function MoveToWhenUnloaded(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset)
{ DEPRECATED: DO NOT USE. Calls MoveTo if both the calling ObjectReference and the akTarget ObjectReference have current locations that are not loaded. }
  While Self.GetCurrentLocation().IsLoaded() || akTarget.GetCurrentLocation().IsLoaded() ; #DEBUG_LINE_NO:103
    Utility.Wait(5.0) ; #DEBUG_LINE_NO:106
  EndWhile ; #DEBUG_LINE_NO:
  Self.MoveTo(akTarget, afXOffset, afYOffset, afZOffset, True, False) ; #DEBUG_LINE_NO:108
EndFunction

Function AddAliasedItem(Form akItemToAdd, Alias akAlias, Int aiCount, Bool abSilent)
  Self.AddAliasedItemWithKeywords(akItemToAdd, akAlias, aiCount, abSilent, None) ; #DEBUG_LINE_NO:148
EndFunction

ObjectReference Function AddAliasedItemSingle(Form akItemToAdd, Alias akAlias, Bool abSilent)
  Return Self.AddAliasedItemWithKeywordsSingle(akItemToAdd, akAlias, abSilent, None) ; #DEBUG_LINE_NO:152
EndFunction

Function AddAliasedItemWithKeywords(Form akItemToAdd, Alias akAlias, Int aiCount, Bool abSilent, Keyword[] keywords)
  Int added = 0 ; #DEBUG_LINE_NO:156
  While added < aiCount ; #DEBUG_LINE_NO:157
    Self.AddAliasedItemWithKeywordsSingle(akItemToAdd, akAlias, abSilent, keywords) ; #DEBUG_LINE_NO:158
    added += 1 ; #DEBUG_LINE_NO:159
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

ObjectReference Function AddAliasedItemWithKeywordsSingle(Form akItemToAdd, Alias akAlias, Bool abSilent, Keyword[] keywords)
  ObjectReference itemRef = Self.PlaceAtMe(akItemToAdd, 1, False, True, True, None, akAlias, True) ; #DEBUG_LINE_NO:164
  If itemRef != None ; #DEBUG_LINE_NO:165
    If keywords != None && keywords.Length > 0 ; #DEBUG_LINE_NO:166
      Int I = 0 ; #DEBUG_LINE_NO:167
      While I < keywords.Length ; #DEBUG_LINE_NO:168
        itemRef.AddKeyword(keywords[I]) ; #DEBUG_LINE_NO:169
        I += 1 ; #DEBUG_LINE_NO:170
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.AddItem(itemRef as Form, 1, abSilent) ; #DEBUG_LINE_NO:173
  EndIf ; #DEBUG_LINE_NO:
  Return itemRef ; #DEBUG_LINE_NO:177
EndFunction

Function AddToMapScanned(Bool abAllowFastTravel)
  Self.SetScanned(True) ; #DEBUG_LINE_NO:204
  Self.AddToMap(abAllowFastTravel) ; #DEBUG_LINE_NO:205
EndFunction

Float Function GetDayLength()
  Float dayLength = 24.0 ; #DEBUG_LINE_NO:415
  planet myPlanet = Self.GetCurrentPlanet() ; #DEBUG_LINE_NO:416
  If myPlanet ; #DEBUG_LINE_NO:417
    dayLength = myPlanet.GetDayLength() ; #DEBUG_LINE_NO:418
  EndIf ; #DEBUG_LINE_NO:
  Return dayLength ; #DEBUG_LINE_NO:421
EndFunction

Int Function GetValueInt(ActorValue akAV)
  Return Self.GetValue(akAV) as Int ; #DEBUG_LINE_NO:601
EndFunction

GlobalVariable Function GetValueEnumGlobal(ActorValue akAV, GlobalVariable[] akEnumGlobals)
  Float val = Self.GetValue(akAV) ; #DEBUG_LINE_NO:615
  GlobalVariable returnVal = None ; #DEBUG_LINE_NO:616
  Int I = 0 ; #DEBUG_LINE_NO:617
  While returnVal == None && I < akEnumGlobals.Length ; #DEBUG_LINE_NO:618
    If akEnumGlobals[I].GetValue() == val ; #DEBUG_LINE_NO:619
      returnVal = akEnumGlobals[I] ; #DEBUG_LINE_NO:620
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:622
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:625
EndFunction

Actor Function GetSelfAsActor()
  Return Self as Actor ; #DEBUG_LINE_NO:644
EndFunction

ObjectReference[] Function GetSingleRefArray()
  ObjectReference[] singleArray = new ObjectReference[1] ; #DEBUG_LINE_NO:649
  singleArray[0] = Self ; #DEBUG_LINE_NO:650
  Return singleArray ; #DEBUG_LINE_NO:651
EndFunction

Bool Function HasOwner()
  Bool returnVal = False ; #DEBUG_LINE_NO:684
  If (Self.HasActorRefOwner() || Self.GetActorOwner() as Bool) || Self.GetFactionOwner() as Bool ; #DEBUG_LINE_NO:685
    returnVal = True ; #DEBUG_LINE_NO:686
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:689
EndFunction

Bool Function IsCrew(Actor akActor)
  Actor[] crewMembers = Self.GetAllCrewMembers() ; #DEBUG_LINE_NO:718
  Return crewMembers.find(akActor, 0) > -1 ; #DEBUG_LINE_NO:719
EndFunction

Bool Function IsEnabled()
  Return !Self.IsDisabled() ; #DEBUG_LINE_NO:739
EndFunction

Function ModValueTo(ActorValue akAV, Float afValue)
  Float currentValue = Self.GetValue(akAV) ; #DEBUG_LINE_NO:814
  Float modAmount = afValue - currentValue ; #DEBUG_LINE_NO:815
  Self.ModValue(akAV, modAmount) ; #DEBUG_LINE_NO:816
EndFunction

spaceshipreference Function PlaceShipAtMeOffset(Form akFormToPlace, Float xOffset, Float yOffset, Float zOffset, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Alias akAliasToFill, Location akEncLoc, Bool abSnapOffsetToNavmesh)
  Float[] offset = new Float[6] ; #DEBUG_LINE_NO:847
  offset[0] = xOffset ; #DEBUG_LINE_NO:848
  offset[1] = yOffset ; #DEBUG_LINE_NO:849
  offset[2] = zOffset ; #DEBUG_LINE_NO:850
  Return Self.PlaceShipAtMe(akFormToPlace, aiLevelMod, abPlayFx, abForcePersist, abInitiallyDisabled, abDeleteWhenAble, offset, akAliasToFill, akEncLoc, abSnapOffsetToNavmesh) ; #DEBUG_LINE_NO:851
EndFunction

Int Function IncrementLoopingValue(ActorValue akAV, Int aiMaxValue, Int aiIncrementAmount)
  Int loopedValue = (Self.GetValueInt(akAV) + aiIncrementAmount) % (aiMaxValue + 1) ; #DEBUG_LINE_NO:1120
  Self.SetValue(akAV, loopedValue as Float) ; #DEBUG_LINE_NO:1121
  Return loopedValue ; #DEBUG_LINE_NO:1122
EndFunction

Function SplineTranslateToRef(ObjectReference arTarget, Float afTangentMagnitude, Float afSpeed, Float afMaxRotationSpeed)
  Self.SplineTranslateTo(arTarget.X, arTarget.Y, arTarget.Z, arTarget.GetAngleX(), arTarget.GetAngleY(), arTarget.GetAngleZ(), afTangentMagnitude, afSpeed, afMaxRotationSpeed) ; #DEBUG_LINE_NO:1140
EndFunction

Function TranslateToRef(ObjectReference arTarget, Float afSpeed, Float afMaxRotationSpeed)
  Self.TranslateTo(arTarget.X, arTarget.Y, arTarget.Z, arTarget.GetAngleX(), arTarget.GetAngleY(), arTarget.GetAngleZ(), afSpeed, afMaxRotationSpeed) ; #DEBUG_LINE_NO:1181
EndFunction

Bool Function IsInLocation(Location akLocation)
  Location currLoc = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:1200
  If currLoc == None ; #DEBUG_LINE_NO:1201
    Return False ; #DEBUG_LINE_NO:1202
  Else ; #DEBUG_LINE_NO:
    Return akLocation != None && (akLocation.IsChild(currLoc) || currLoc == akLocation) ; #DEBUG_LINE_NO:1204
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function TryToStartCombat(ObjectReference akTarget, Bool abPreferredTarget)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1215
  Actor targetActor = akTarget as Actor ; #DEBUG_LINE_NO:1216
  If targetActor ; #DEBUG_LINE_NO:1217
    Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1218
    If selfActor ; #DEBUG_LINE_NO:1219
      bSuccess = True ; #DEBUG_LINE_NO:1220
      selfActor.StartCombat(targetActor as ObjectReference, abPreferredTarget) ; #DEBUG_LINE_NO:1221
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    spaceshipreference targetShip = akTarget as spaceshipreference ; #DEBUG_LINE_NO:1224
    If targetShip ; #DEBUG_LINE_NO:1225
      spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1226
      If selfShip ; #DEBUG_LINE_NO:1227
        bSuccess = True ; #DEBUG_LINE_NO:1228
        selfShip.StartCombat(targetShip, abPreferredTarget) ; #DEBUG_LINE_NO:1229
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1233
EndFunction

Bool Function TryToStopCombat()
  Bool bSuccess = False ; #DEBUG_LINE_NO:1239
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1240
  If selfActor ; #DEBUG_LINE_NO:1241
    bSuccess = True ; #DEBUG_LINE_NO:1242
    selfActor.StopCombat() ; #DEBUG_LINE_NO:1243
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1245
    If selfShip ; #DEBUG_LINE_NO:1246
      bSuccess = True ; #DEBUG_LINE_NO:1247
      selfShip.StopCombat() ; #DEBUG_LINE_NO:1248
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1251
EndFunction

Bool Function TryToStopCombatAlarm()
  Bool bSuccess = False ; #DEBUG_LINE_NO:1257
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1258
  If selfActor ; #DEBUG_LINE_NO:1259
    bSuccess = True ; #DEBUG_LINE_NO:1260
    selfActor.StopCombatAlarm() ; #DEBUG_LINE_NO:1261
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1263
    If selfShip ; #DEBUG_LINE_NO:1264
      bSuccess = True ; #DEBUG_LINE_NO:1265
      selfShip.StopCombatAlarm() ; #DEBUG_LINE_NO:1266
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1269
EndFunction

Bool Function TryToAddToFaction(Faction akFaction)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1275
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1276
  If selfActor ; #DEBUG_LINE_NO:1277
    bSuccess = True ; #DEBUG_LINE_NO:1278
    selfActor.AddToFaction(akFaction) ; #DEBUG_LINE_NO:1279
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1281
    If selfShip ; #DEBUG_LINE_NO:1282
      bSuccess = True ; #DEBUG_LINE_NO:1283
      selfShip.AddToFaction(akFaction) ; #DEBUG_LINE_NO:1284
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1287
EndFunction

Bool Function TryToRemoveFromFaction(Faction akFaction)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1293
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1294
  If selfActor ; #DEBUG_LINE_NO:1295
    bSuccess = True ; #DEBUG_LINE_NO:1296
    selfActor.RemoveFromFaction(akFaction) ; #DEBUG_LINE_NO:1297
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1299
    If selfShip ; #DEBUG_LINE_NO:1300
      bSuccess = True ; #DEBUG_LINE_NO:1301
      selfShip.RemoveFromFaction(akFaction) ; #DEBUG_LINE_NO:1302
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1305
EndFunction

Bool Function TryToRemoveFromAllFactions()
  Bool bSuccess = False ; #DEBUG_LINE_NO:1311
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1312
  If selfActor ; #DEBUG_LINE_NO:1313
    bSuccess = True ; #DEBUG_LINE_NO:1314
    selfActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:1315
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1317
    If selfShip ; #DEBUG_LINE_NO:1318
      bSuccess = True ; #DEBUG_LINE_NO:1319
      selfShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:1320
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1323
EndFunction

Bool Function TryToEvaluatePackage()
  Bool bSuccess = False ; #DEBUG_LINE_NO:1329
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1330
  If selfActor ; #DEBUG_LINE_NO:1331
    bSuccess = True ; #DEBUG_LINE_NO:1332
    selfActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:1333
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1335
    If selfShip ; #DEBUG_LINE_NO:1336
      bSuccess = True ; #DEBUG_LINE_NO:1337
      selfShip.EvaluatePackage(False) ; #DEBUG_LINE_NO:1338
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1341
EndFunction

Bool Function TryToKill(ObjectReference akKiller)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1347
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1348
  If selfActor ; #DEBUG_LINE_NO:1349
    bSuccess = True ; #DEBUG_LINE_NO:1350
    Actor targetActor = akKiller as Actor ; #DEBUG_LINE_NO:1351
    selfActor.Kill(targetActor) ; #DEBUG_LINE_NO:1352
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1354
    If selfShip ; #DEBUG_LINE_NO:1355
      bSuccess = True ; #DEBUG_LINE_NO:1356
      spaceshipreference targetShip = akKiller as spaceshipreference ; #DEBUG_LINE_NO:1357
      selfShip.Kill(targetShip) ; #DEBUG_LINE_NO:1358
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1361
EndFunction

Bool Function TryToSetGhost(Bool bSetGhost)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1367
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1368
  If selfActor ; #DEBUG_LINE_NO:1369
    bSuccess = True ; #DEBUG_LINE_NO:1370
    selfActor.SetGhost(bSetGhost) ; #DEBUG_LINE_NO:1371
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1373
    If selfShip ; #DEBUG_LINE_NO:1374
      bSuccess = True ; #DEBUG_LINE_NO:1375
      selfShip.SetGhost(bSetGhost) ; #DEBUG_LINE_NO:1376
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1379
EndFunction

Bool Function TryToSetProtected(Bool bSetProtected)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1385
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1386
  If selfActor ; #DEBUG_LINE_NO:1387
    bSuccess = True ; #DEBUG_LINE_NO:1388
    selfActor.SetProtected(bSetProtected) ; #DEBUG_LINE_NO:1389
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1391
    If selfShip ; #DEBUG_LINE_NO:1392
      bSuccess = True ; #DEBUG_LINE_NO:1393
      selfShip.SetProtected(bSetProtected) ; #DEBUG_LINE_NO:1394
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1397
EndFunction

Bool Function TryToSetEssential(Bool bSetEssential)
  Bool bSuccess = False ; #DEBUG_LINE_NO:1403
  Actor selfActor = Self as Actor ; #DEBUG_LINE_NO:1404
  If selfActor ; #DEBUG_LINE_NO:1405
    bSuccess = True ; #DEBUG_LINE_NO:1406
    selfActor.SetEssential(bSetEssential) ; #DEBUG_LINE_NO:1407
  Else ; #DEBUG_LINE_NO:
    spaceshipreference selfShip = Self as spaceshipreference ; #DEBUG_LINE_NO:1409
    If selfShip ; #DEBUG_LINE_NO:1410
      bSuccess = True ; #DEBUG_LINE_NO:1411
      selfShip.SetEssential(bSetEssential) ; #DEBUG_LINE_NO:1412
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1415
EndFunction

spaceshipreference Function PlaceShipNearMe(Form akFormToPlace, Int positionVal, Int distanceVal, Int facingVal, Int aiLevelMod, Bool abPlayFx, Bool abForcePersist, Bool abInitiallyDisabled, Bool abDeleteWhenAble, Alias akAliasToFill)
  spaceshipreference ship = Self.PlaceShipAtMe(akFormToPlace, aiLevelMod, False, abForcePersist, True, abDeleteWhenAble, None, akAliasToFill, None, True) ; #DEBUG_LINE_NO:1422
  ship.MoveNear(Self, positionVal, distanceVal, facingVal) ; #DEBUG_LINE_NO:1423
  If !abInitiallyDisabled ; #DEBUG_LINE_NO:1424
    If abPlayFx ; #DEBUG_LINE_NO:1425
      ship.EnableWithGravJump() ; #DEBUG_LINE_NO:1426
    Else ; #DEBUG_LINE_NO:
      ship.EnableNoWait(False) ; #DEBUG_LINE_NO:1428
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return ship ; #DEBUG_LINE_NO:1431
EndFunction

Function MoveNear(ObjectReference akTarget, Int positionVal, Int distanceVal, Int facingVal)
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:1472
  Float targetMaxBound = Math.Max(Self.GetWidth(), Math.Max(Self.GetHeight(), Self.GetLength())) ; #DEBUG_LINE_NO:1475
  Float nearRefMaxBound = Math.Max(akTarget.GetWidth(), Math.Max(akTarget.GetHeight(), akTarget.GetLength())) ; #DEBUG_LINE_NO:1476
  Float distance = targetMaxBound + nearRefMaxBound ; #DEBUG_LINE_NO:1477
  If distanceVal == Self.CONST_NearDistance_Random ; #DEBUG_LINE_NO:1478
    distanceVal = Utility.RandomInt(Self.CONST_NearDistance_Min, Self.CONST_NearDistance_Max) ; #DEBUG_LINE_NO:1479
  ElseIf distanceVal == Self.CONST_NearDistance_RandomFar ; #DEBUG_LINE_NO:1480
    distanceVal = Utility.RandomInt(Self.CONST_NearDistance_Moderate, Self.CONST_NearDistance_Long) ; #DEBUG_LINE_NO:1481
  EndIf ; #DEBUG_LINE_NO:
  If distanceVal == Self.CONST_NearDistance_VeryClose ; #DEBUG_LINE_NO:1483
     ; #DEBUG_LINE_NO:
  ElseIf distanceVal == Self.CONST_NearDistance_Close ; #DEBUG_LINE_NO:1485
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Close_Min as Float, Self.CONST_NearDistance_Close_Max as Float) ; #DEBUG_LINE_NO:1486
  ElseIf distanceVal == Self.CONST_NearDistance_Short ; #DEBUG_LINE_NO:1487
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Short_Min as Float, Self.CONST_NearDistance_Short_Max as Float) ; #DEBUG_LINE_NO:1488
  ElseIf distanceVal == Self.CONST_NearDistance_Moderate ; #DEBUG_LINE_NO:1489
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Moderate_Min as Float, Self.CONST_NearDistance_Moderate_Max as Float) ; #DEBUG_LINE_NO:1490
  ElseIf distanceVal == Self.CONST_NearDistance_Long ; #DEBUG_LINE_NO:1491
    distance += Utility.RandomFloat(Self.CONST_NearDistance_Long_Min as Float, Self.CONST_NearDistance_Long_Max as Float) ; #DEBUG_LINE_NO:1492
  ElseIf distanceVal == Self.CONST_NearDistance_VeryLong ; #DEBUG_LINE_NO:1493
    distance += Utility.RandomFloat(Self.CONST_NearDistance_VeryLong_Min as Float, Self.CONST_NearDistance_VeryLong_Max as Float) ; #DEBUG_LINE_NO:1494
  EndIf ; #DEBUG_LINE_NO:
  If positionVal == Self.CONST_NearPosition_Random ; #DEBUG_LINE_NO:1498
    positionVal = Utility.RandomInt(Self.CONST_NearPosition_Min, Self.CONST_NearPosition_Max) ; #DEBUG_LINE_NO:1499
  EndIf ; #DEBUG_LINE_NO:
  If positionVal == Self.CONST_NearPosition_DeadAhead ; #DEBUG_LINE_NO:1501
    offsets[1] = distance ; #DEBUG_LINE_NO:1502
  Else ; #DEBUG_LINE_NO:
    Float randomOffsetCoordinate1 = Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1504
    Float randomOffsetCoordinate2 = Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1505
    If positionVal == Self.CONST_NearPosition_ForwardTight ; #DEBUG_LINE_NO:1506
      offsets[0] = distance * Self.CONST_NearPosition_TightArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1507
      offsets[1] = distance ; #DEBUG_LINE_NO:1508
      offsets[2] = distance * Self.CONST_NearPosition_TightArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1509
    ElseIf positionVal == Self.CONST_NearPosition_ForwardWide ; #DEBUG_LINE_NO:1510
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1511
      offsets[1] = distance ; #DEBUG_LINE_NO:1512
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1513
    ElseIf positionVal == Self.CONST_NearPosition_Behind ; #DEBUG_LINE_NO:1514
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1515
      offsets[1] = -1.0 * distance ; #DEBUG_LINE_NO:1516
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1517
    ElseIf positionVal == Self.CONST_NearPosition_Above ; #DEBUG_LINE_NO:1518
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1519
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1520
      offsets[2] = distance ; #DEBUG_LINE_NO:1521
    ElseIf positionVal == Self.CONST_NearPosition_Below ; #DEBUG_LINE_NO:1522
      offsets[0] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1523
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1524
      offsets[2] = -1.0 * distance ; #DEBUG_LINE_NO:1525
    ElseIf positionVal == Self.CONST_NearPosition_Left ; #DEBUG_LINE_NO:1526
      offsets[0] = -1.0 * distance ; #DEBUG_LINE_NO:1527
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1528
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1529
    ElseIf positionVal == Self.CONST_NearPosition_Right ; #DEBUG_LINE_NO:1530
      offsets[0] = distance ; #DEBUG_LINE_NO:1531
      offsets[1] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate1 ; #DEBUG_LINE_NO:1532
      offsets[2] = distance * Self.CONST_NearPosition_WideArc * randomOffsetCoordinate2 ; #DEBUG_LINE_NO:1533
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If facingVal == Self.CONST_NearFacing_Random ; #DEBUG_LINE_NO:1538
    facingVal = Utility.RandomInt(Self.CONST_NearFacing_Min, Self.CONST_NearFacing_Max) ; #DEBUG_LINE_NO:1539
  EndIf ; #DEBUG_LINE_NO:
  If facingVal == Self.CONST_NearFacing_TotallyRandom ; #DEBUG_LINE_NO:1541
    offsets[3] = Utility.RandomFloat(0.0, 360.0) ; #DEBUG_LINE_NO:1542
    offsets[4] = Utility.RandomFloat(0.0, 360.0) ; #DEBUG_LINE_NO:1543
    offsets[5] = Utility.RandomFloat(0.0, 360.0) ; #DEBUG_LINE_NO:1544
  ElseIf facingVal == Self.CONST_NearFacing_Direct ; #DEBUG_LINE_NO:1545
    offsets[3] = 0.0 ; #DEBUG_LINE_NO:1546
    offsets[4] = 0.0 ; #DEBUG_LINE_NO:1547
    offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing ; #DEBUG_LINE_NO:1548
  Else ; #DEBUG_LINE_NO:
    offsets[3] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1550
    offsets[4] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1551
    offsets[5] = Self.CONST_NearFacing_TightAngle * Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1552
    Float randomOffset = Utility.RandomFloat(-1.0, 1.0) ; #DEBUG_LINE_NO:1553
    If facingVal == Self.CONST_NearFacing_TowardSmall ; #DEBUG_LINE_NO:1555
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_TightAngle * randomOffset ; #DEBUG_LINE_NO:1556
    ElseIf facingVal == Self.CONST_NearFacing_TowardLarge ; #DEBUG_LINE_NO:1557
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1558
    ElseIf facingVal == Self.CONST_NearFacing_AwaySmall ; #DEBUG_LINE_NO:1559
      offsets[5] = -1.0 * Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_TightAngle * randomOffset ; #DEBUG_LINE_NO:1560
    ElseIf facingVal == Self.CONST_NearFacing_AwayLarge ; #DEBUG_LINE_NO:1561
      offsets[5] = -1.0 * Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1562
    ElseIf facingVal == Self.CONST_NearFacing_LeftSideOn ; #DEBUG_LINE_NO:1563
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing + 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1564
    ElseIf facingVal == Self.CONST_NearFacing_RightSideOn ; #DEBUG_LINE_NO:1565
      offsets[5] = Self.CONST_NearFacing_HeadingCorrectionToDirectFacing - 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1566
    ElseIf facingVal == Self.CONST_NearFacing_TopSideOn ; #DEBUG_LINE_NO:1567
      offsets[3] = 90.0 + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1568
    ElseIf facingVal == Self.CONST_NearFacing_BottomSideOn ; #DEBUG_LINE_NO:1569
      offsets[3] = -90.0 + Self.CONST_NearFacing_WideAngle * randomOffset ; #DEBUG_LINE_NO:1570
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Form XMarker = Game.GetFormFromFile(59, "Starfield.esm") ; #DEBUG_LINE_NO:1574
  ObjectReference targetMarker = akTarget.PlaceAtMe(XMarker, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:1575
  Self.MoveTo(targetMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1576
  targetMarker.Delete() ; #DEBUG_LINE_NO:1577
EndFunction
