ScriptName MissionSupplyScript Extends MissionQuestScript conditional
{ mission to supply resource to a settlement }

;-- Variables ---------------------------------------
ObjectReference incomingCargoRef
outpostcargolinkmarkerscript myCargoLink
missionboardsupplymarkerscript supplyMarker

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard cargoLinkGuard
Guard outpostaliasguard

;-- Properties --------------------------------------
Group MissionTypeData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
  RefCollectionAlias Property SourceCollection01 Auto Const
  { Optional - only needed if there are multiple ref types }
  RefCollectionAlias Property SourceCollection02 Auto Const
  { Optional - only needed if there are multiple ref types }
  Keyword Property LinkOutpostCargoLink Auto Const mandatory
  { keyword to find linked ref of my cargo link }
  ReferenceAlias Property SourceCargoLinkActivator Auto Const mandatory
  { activator player uses to establish cargo link }
  ReferenceAlias Property PlayerCargoLink Auto Const mandatory
  { player's linked cargo link }
  ReferenceAlias Property Builder Auto Const mandatory
  { created "builder" to simulate supply need }
  Int Property EstablishCargoLinkObjective = 10 Auto Const
  { objective for establishing a cargo link }
  Int Property SupplyResourceObjective = 20 Auto Const
  { objective for supplying resource }
  ActorValue Property MissionAmountMax Auto Const mandatory
  { holds max amount of shipment on supply marker }
  ActorValue Property MissionSupplyAmountMult Auto Const mandatory
  { holds max amount of shipment on supply marker }
  ActorValue Property MissionRewardBase Auto Const mandatory
  { holds base reward value (per unit) for shipment on supply marker }
  Int Property MissionAcceptTutorialID = 4 Auto Const
  { tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }
  LocationAlias Property PlayerOutpostLocation Auto Const mandatory
  { filled when player enters an outpost location }
  ReferenceAlias Property PlayerOutpostBeacon Auto Const mandatory
  { filled when player enters an outpost location }
  RefCollectionAlias Property PlayerCargoLinks Auto Const mandatory
  { used to provide QT to nearby player cargo links if they exist }
  Keyword Property LocTypeOutpost Auto Const mandatory
  { keyword to find outpost locations }
  Keyword Property OutpostTutorialCargoLink Auto Const mandatory
  { keyword to find when a cargo link is placed }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  myCargoLink = SourceCargoLinkActivator.GetRef().GetLinkedRef(LinkOutpostCargoLink) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:68
  incomingCargoRef = myCargoLink.GetLinkedRef(SQ_OutpostCargoLink.LinkOutpostCargoIncoming) ; #DEBUG_LINE_NO:69
  If SourceCollection01 as Bool && SourceCollection02 as Bool ; #DEBUG_LINE_NO:71
    ObjectReference[] validRefs = new ObjectReference[0] ; #DEBUG_LINE_NO:73
    Int I = 0 ; #DEBUG_LINE_NO:74
    While I < SourceCollection01.GetCount() ; #DEBUG_LINE_NO:75
      ObjectReference testRef = SourceCollection01.GetAt(I) ; #DEBUG_LINE_NO:76
      If SourceCollection02.Find(testRef) > -1 ; #DEBUG_LINE_NO:77
        validRefs.add(testRef, 1) ; #DEBUG_LINE_NO:78
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:80
    EndWhile ; #DEBUG_LINE_NO:
    If validRefs.Length > 0 ; #DEBUG_LINE_NO:83
      Int randomIndex = Utility.RandomInt(0, validRefs.Length - 1) ; #DEBUG_LINE_NO:84
      PrimaryRef.ForceRefTo(validRefs[randomIndex]) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  supplyMarker = PrimaryRef.GetRef() as missionboardsupplymarkerscript ; #DEBUG_LINE_NO:88
  If supplyMarker ; #DEBUG_LINE_NO:90
    Parent.OnQuestStarted() ; #DEBUG_LINE_NO:91
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:100
    SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID) ; #DEBUG_LINE_NO:101
    Self.RegisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo") ; #DEBUG_LINE_NO:102
    Self.RegisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkChanged") ; #DEBUG_LINE_NO:103
    Self.RegisterForRemoteEvent(PlayerOutpostBeacon as ScriptObject, "OnWorkshopObjectRemoved") ; #DEBUG_LINE_NO:104
    Self.RegisterForRemoteEvent(PlayerOutpostBeacon as ScriptObject, "OnWorkshopObjectPlaced") ; #DEBUG_LINE_NO:105
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnOutpostPlaced") ; #DEBUG_LINE_NO:106
    missioncargolinkactivatorscript activatorRef = SourceCargoLinkActivator.GetRef() as missioncargolinkactivatorscript ; #DEBUG_LINE_NO:109
    activatorRef.AllowActivation(True) ; #DEBUG_LINE_NO:110
    Builder.TryToEnable() ; #DEBUG_LINE_NO:112
    myCargoLink.EnableNoWait(False) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:116
EndFunction

Function HandleOnQuestRejected()
  Self.UpdateSupplyAmount(MissionIntValue02.GetValueInt()) ; #DEBUG_LINE_NO:123
  If MissionIntValue02.GetValueInt() > 0 ; #DEBUG_LINE_NO:124
    Self.MissionComplete() ; #DEBUG_LINE_NO:125
  Else ; #DEBUG_LINE_NO:
    Self.MissionFailed() ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc as Bool && akNewLoc.HasKeyword(LocTypeOutpost) ; #DEBUG_LINE_NO:134
    PlayerOutpostLocation.ForceLocationTo(akNewLoc) ; #DEBUG_LINE_NO:135
    PlayerOutpostLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:136
    Self.UpdatePlayerOutpostAliases(None) ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionComplete()
  Self.CleanupMission() ; #DEBUG_LINE_NO:143
  Parent.MissionComplete() ; #DEBUG_LINE_NO:144
EndFunction

Function MissionFailed()
  Self.CleanupMission() ; #DEBUG_LINE_NO:149
  Parent.MissionFailed() ; #DEBUG_LINE_NO:150
EndFunction

Function CleanupMission()
  Self.UnregisterForCustomEvent(SQ_OutpostCargoLink as ScriptObject, "sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo") ; #DEBUG_LINE_NO:154
  missioncargolinkactivatorscript activatorRef = SourceCargoLinkActivator.GetRef() as missioncargolinkactivatorscript ; #DEBUG_LINE_NO:156
  activatorRef.AllowActivation(False) ; #DEBUG_LINE_NO:157
  ObjectReference theBuilder = Builder.GetRef() ; #DEBUG_LINE_NO:159
  incomingCargoRef.RemoveTransferLink(theBuilder) ; #DEBUG_LINE_NO:161
  theBuilder.Disable(False) ; #DEBUG_LINE_NO:162
  SQ_OutpostCargoLink.ClearCargoLink(myCargoLink as ObjectReference, None) ; #DEBUG_LINE_NO:164
  myCargoLink.DisableNoWait(False) ; #DEBUG_LINE_NO:166
EndFunction

Int Function GetActualReward()
  Return Self.UpdateSupplyAmount(-1) ; #DEBUG_LINE_NO:171
EndFunction

Int Function UpdateSupplyAmount(Int overrideAmount)
  Location sourceLocation = TargetLocation.GetLocation() ; #DEBUG_LINE_NO:177
  missionparentscript:missionsupplytype[] resourceAVs = MissionParent.resourceAVs ; #DEBUG_LINE_NO:179
  Int I = 0 ; #DEBUG_LINE_NO:180
  resource myResource = None ; #DEBUG_LINE_NO:181
  ActorValue myActorValue = None ; #DEBUG_LINE_NO:182
  While I < resourceAVs.Length && myResource == None ; #DEBUG_LINE_NO:184
    missionparentscript:missionsupplytype theSupplyType = resourceAVs[I] ; #DEBUG_LINE_NO:185
    Int minSupplyAmount = supplyMarker.GetValue(theSupplyType.supplyAV) as Int ; #DEBUG_LINE_NO:186
    If minSupplyAmount > 0 ; #DEBUG_LINE_NO:187
      myActorValue = theSupplyType.supplyAV ; #DEBUG_LINE_NO:188
      myResource = myActorValue.GetResource() ; #DEBUG_LINE_NO:189
      supplyMarker.myResource = myResource ; #DEBUG_LINE_NO:191
      Int supplyAmount = Utility.RandomInt(minSupplyAmount, supplyMarker.GetValueInt(MissionAmountMax)) ; #DEBUG_LINE_NO:194
      If supplyAmount > 1000 ; #DEBUG_LINE_NO:195
        Int supplyAmountModulo = supplyAmount % 100 ; #DEBUG_LINE_NO:197
        If supplyAmountModulo > 50 ; #DEBUG_LINE_NO:198
          supplyAmount += 100 - supplyAmountModulo ; #DEBUG_LINE_NO:199
        Else ; #DEBUG_LINE_NO:
          supplyAmount -= supplyAmountModulo ; #DEBUG_LINE_NO:201
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Int supplyamountmodulo = supplyAmount % 10 ; #DEBUG_LINE_NO:205
        If supplyamountmodulo > 5 ; #DEBUG_LINE_NO:206
          supplyAmount += 10 - supplyamountmodulo ; #DEBUG_LINE_NO:207
        Else ; #DEBUG_LINE_NO:
          supplyAmount -= supplyamountmodulo ; #DEBUG_LINE_NO:209
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If overrideAmount < 0 ; #DEBUG_LINE_NO:213
        Float supplyAmountMult = sourceLocation.GetValue(MissionSupplyAmountMult) ; #DEBUG_LINE_NO:217
        If supplyAmountMult > 0.0 ; #DEBUG_LINE_NO:218
          supplyAmount = (supplyAmount as Float * supplyAmountMult) as Int ; #DEBUG_LINE_NO:219
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        supplyAmount = overrideAmount ; #DEBUG_LINE_NO:222
      EndIf ; #DEBUG_LINE_NO:
      MissionIntValue01.SetValueInt(supplyAmount) ; #DEBUG_LINE_NO:226
      Self.UpdateCurrentInstanceGlobal(MissionIntValue01) ; #DEBUG_LINE_NO:228
      ObjectReference theBuilder = Builder.GetRef() ; #DEBUG_LINE_NO:231
      ActorValue supplyNeedAV = MissionParent.supplyNeedAVs[I] ; #DEBUG_LINE_NO:232
      theBuilder.SetValue(supplyNeedAV, supplyAmount as Float) ; #DEBUG_LINE_NO:234
      myCargoLink.SpecificCargoMax = supplyAmount ; #DEBUG_LINE_NO:239
      myCargoLink.SpecificCargo = supplyMarker.myResource as Form ; #DEBUG_LINE_NO:240
      Bool bSuccess = incomingCargoRef.AddTransferLink(theBuilder) ; #DEBUG_LINE_NO:243
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:247
  EndWhile ; #DEBUG_LINE_NO:
  Float reward = MissionIntValue01.GetValue() * supplyMarker.GetValue(MissionRewardBase) ; #DEBUG_LINE_NO:252
  Float locationMult = sourceLocation.GetValue(myActorValue) ; #DEBUG_LINE_NO:255
  If locationMult > 0.0 ; #DEBUG_LINE_NO:256
    reward *= locationMult ; #DEBUG_LINE_NO:258
  EndIf ; #DEBUG_LINE_NO:
  Return reward as Int ; #DEBUG_LINE_NO:262
EndFunction

Function CargoLinkEstablished(ObjectReference newCargoLink)
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:269
    Self.SetObjectiveCompleted(EstablishCargoLinkObjective, True) ; #DEBUG_LINE_NO:271
    Self.SetObjectiveDisplayed(SupplyResourceObjective, True, False) ; #DEBUG_LINE_NO:272
    PlayerCargoLink.ForceRefTo(newCargoLink) ; #DEBUG_LINE_NO:273
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function CargoLinkCleared()
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:279
    Self.SetObjectiveCompleted(EstablishCargoLinkObjective, False) ; #DEBUG_LINE_NO:281
    PlayerCargoLink.Clear() ; #DEBUG_LINE_NO:282
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkUnloadCargo(sq_outpostcargolinkscript akSender, Var[] akArgs)
  ObjectReference eventCargoRef = akArgs[0] as ObjectReference ; #DEBUG_LINE_NO:287
  spaceshipreference cargoShipRef = akArgs[1] as spaceshipreference ; #DEBUG_LINE_NO:288
  If incomingCargoRef == eventCargoRef ; #DEBUG_LINE_NO:292
    Int neededAmount = MissionIntValue01.GetValueInt() ; #DEBUG_LINE_NO:294
    Int newResources = incomingCargoRef.RemoveResources(supplyMarker.myResource, neededAmount, True) ; #DEBUG_LINE_NO:295
    incomingCargoRef.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:296
    If newResources > 0 ; #DEBUG_LINE_NO:300
      Self.ModObjectiveGlobal(newResources as Float, MissionIntValue02, SupplyResourceObjective, neededAmount as Float, True, True, True, False) ; #DEBUG_LINE_NO:301
    EndIf ; #DEBUG_LINE_NO:
    Int currentAmount = MissionIntValue02.GetValueInt() ; #DEBUG_LINE_NO:304
    If currentAmount >= neededAmount ; #DEBUG_LINE_NO:305
      Self.MissionComplete() ; #DEBUG_LINE_NO:306
    Else ; #DEBUG_LINE_NO:
      myCargoLink.SpecificCargoMax = neededAmount - currentAmount ; #DEBUG_LINE_NO:309
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkChanged(sq_outpostcargolinkscript akSender, Var[] akArgs)
  ObjectReference outpostRef = akArgs[0] as ObjectReference ; #DEBUG_LINE_NO:315
  ObjectReference cargoLinkRef = akArgs[1] as ObjectReference ; #DEBUG_LINE_NO:316
  ObjectReference akOldTarget = akArgs[2] as ObjectReference ; #DEBUG_LINE_NO:317
  ObjectReference akNewTarget = akArgs[3] as ObjectReference ; #DEBUG_LINE_NO:318
  If (akOldTarget == myCargoLink as ObjectReference) && (akNewTarget != myCargoLink as ObjectReference) ; #DEBUG_LINE_NO:321
    Self.CargoLinkCleared() ; #DEBUG_LINE_NO:323
  ElseIf (akNewTarget == myCargoLink as ObjectReference) && akNewTarget != akOldTarget ; #DEBUG_LINE_NO:324
    Self.CargoLinkEstablished(cargoLinkRef) ; #DEBUG_LINE_NO:326
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdatePlayerOutpostAliases(ObjectReference akSourceRef)
  Guard outpostaliasguard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:334
    Location outpostLocation = None ; #DEBUG_LINE_NO:335
    If akSourceRef ; #DEBUG_LINE_NO:336
      outpostLocation = akSourceRef.GetCurrentLocation() ; #DEBUG_LINE_NO:338
      PlayerOutpostLocation.ForceLocationTo(outpostLocation) ; #DEBUG_LINE_NO:339
      PlayerOutpostLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:340
    Else ; #DEBUG_LINE_NO:
      outpostLocation = PlayerOutpostLocation.GetLocation() ; #DEBUG_LINE_NO:342
    EndIf ; #DEBUG_LINE_NO:
    Bool sameSystem = MissionSourceLocation.IsSameLocation(outpostLocation, MissionParent.LocTypeStarSystem) ; #DEBUG_LINE_NO:346
    If sameSystem == False ; #DEBUG_LINE_NO:348
      Keyword OutpostCargoLinkFueledKeyword = MissionParent.OutpostCargoLinkFueledKeyword ; #DEBUG_LINE_NO:350
      Int I = PlayerCargoLinks.GetCount() - 1 ; #DEBUG_LINE_NO:351
      While I >= 0 ; #DEBUG_LINE_NO:352
        outpostcargolinkmenuscript cargoLinkActivatorRef = PlayerCargoLinks.GetAt(I) as outpostcargolinkmenuscript ; #DEBUG_LINE_NO:353
        If cargoLinkActivatorRef ; #DEBUG_LINE_NO:354
          ObjectReference cargoLinkRef = cargoLinkActivatorRef.GetLinkedRef(cargoLinkActivatorRef.LinkOutpostCargoLink) ; #DEBUG_LINE_NO:355
          If cargoLinkRef as Bool && cargoLinkRef.HasKeyword(OutpostCargoLinkFueledKeyword) == False ; #DEBUG_LINE_NO:356
            PlayerCargoLinks.RemoveRef(cargoLinkActivatorRef as ObjectReference) ; #DEBUG_LINE_NO:358
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I -= 1 ; #DEBUG_LINE_NO:361
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.HasKeyword(OutpostTutorialCargoLink) ; #DEBUG_LINE_NO:369
    Self.UpdatePlayerOutpostAliases(akReference) ; #DEBUG_LINE_NO:370
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
  If akReference.HasKeyword(OutpostTutorialCargoLink) ; #DEBUG_LINE_NO:376
    Self.UpdatePlayerOutpostAliases(akReference) ; #DEBUG_LINE_NO:377
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
  Self.UpdatePlayerOutpostAliases(akOutpostBeacon) ; #DEBUG_LINE_NO:383
EndEvent
