ScriptName SQ_OutpostCargoLinkScript Extends Quest
{ script to handle outpost cargo links }

;-- Structs -----------------------------------------
Struct animData
  Int stateID
  String lightColorEvent
  String lightStateEvent
  String description
EndStruct


;-- Variables ---------------------------------------
Bool cargoLinkAchievementDone = False
Float cargoLinkCreationTimer = 1.0 Const
Int cargoLinkCreationTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard cargoLinkGuard
Guard linkedOutpostGuard

;-- Properties --------------------------------------
Group cargoLinkAchivementData
  RefCollectionAlias Property CargoLinks Auto Const mandatory
  { used to count linked outposts for cargo link achievement }
  Int Property CargoLinkAchievement = 24 Auto Const
  Int Property CargoLinkOutpostCountRequired = 5 Auto Const
  { min linked outposts to get achievement }
EndGroup

Group cargoshipLinks
  Keyword Property LinkOutpostCargoShipIncoming01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipIncoming02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipOutgoing01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipOutgoing02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarker01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarker02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipCargoLink01 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipCargoLink02 Auto Const mandatory
  Keyword Property LinkOutpostCargoShipLandingMarkerCurrent Auto Const mandatory
EndGroup

Keyword Property LinkOutpostCargoLandingMarker Auto Const mandatory
{ get linked ref for landing marker }
Keyword Property LinkOutpostCargoOutgoing Auto Const mandatory
{ get linked ref for outgoing container }
Keyword Property LinkOutpostCargoIncoming Auto Const mandatory
{ get linked ref for incoming container }
Keyword Property LinkOutpostCargoLinkActive Auto Const mandatory
{ used to link cargo link refs to each other }
Keyword Property LinkOutpostCargoLinkShip Auto Const mandatory
{ used to link primary cargo link ref to the ship }
Keyword Property OutpostCargoLinkKeyword Auto Const mandatory
{ keyword used to find cargo links }
Keyword Property OutpostCargoLinkMission Auto Const mandatory
{ keyword to identify supply mission cargo links }
Keyword Property OutpostProductionHalted Auto Const mandatory
{ used to halt production }
ReferenceAlias Property LinkedOutpost Auto Const mandatory
{ used for text replacement in cargo link messages }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ to put inventory into when a cargo link is deleted }
Message Property OutpostCargoLinkFailureMessage Auto Const mandatory
{ message in case unable to create a link (this should only be possible to happen at a "mission" cargo link) }
spaceshipbase Property OutpostCargoLinkShip01 Auto Const mandatory
{ spaceship base for cargo ship }
ActorValue Property OutpostCargoLinkShipDestination Auto Const mandatory
{ use to condition packages }
sq_outpostcargolinkscript:animdata[] Property animationStates Auto Const
{ array of animations to play at different states }
Int Property stateEnum00_unlinked = 0 Auto Const hidden
Int Property stateEnum01_linked = 1 Auto Const hidden
Int Property stateEnum02_landing = 2 Auto Const hidden
Int Property stateEnum03_landed = 3 Auto Const hidden

;-- Functions ---------------------------------------

Event OnQuestInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function ShipLanding(spaceshipreference cargoShipRef, Bool atOutpost01, Int animState)
  outpostcargolinkmarkerscript cargolinkMarker = None ; #DEBUG_LINE_NO:100
  If atOutpost01 ; #DEBUG_LINE_NO:101
    cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:102
  Else ; #DEBUG_LINE_NO:
    cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  Self.SetAnimationState(cargolinkMarker as ObjectReference, animState) ; #DEBUG_LINE_NO:106
EndFunction

Bool Function TransferCargo(sq_outpostcargolinkshipscript cargoShipRef, Bool atOutpost01, Bool bUnloadCargo)
  Keyword outgoingKeyword = None ; #DEBUG_LINE_NO:113
  Keyword incomingKeyword = None ; #DEBUG_LINE_NO:114
  If atOutpost01 ; #DEBUG_LINE_NO:116
    outgoingKeyword = LinkOutpostCargoShipOutgoing01 ; #DEBUG_LINE_NO:117
    incomingKeyword = LinkOutpostCargoShipIncoming01 ; #DEBUG_LINE_NO:118
  Else ; #DEBUG_LINE_NO:
    outgoingKeyword = LinkOutpostCargoShipOutgoing02 ; #DEBUG_LINE_NO:120
    incomingKeyword = LinkOutpostCargoShipIncoming02 ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
  Bool canProduce = True ; #DEBUG_LINE_NO:123
  outpostcargolinkmarkerscript cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:125
  outpostcargolinkmarkerscript cargolinkMarker2 = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:126
  If bUnloadCargo ; #DEBUG_LINE_NO:128
    ObjectReference incomingRef = cargoShipRef.GetLinkedRef(incomingKeyword) ; #DEBUG_LINE_NO:130
    If cargolinkMarker as Bool && cargolinkMarker.SpecificCargo as Bool ; #DEBUG_LINE_NO:132
      cargoShipRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, False, incomingRef) ; #DEBUG_LINE_NO:135
    ElseIf cargolinkMarker2 as Bool && cargolinkMarker2.SpecificCargo as Bool ; #DEBUG_LINE_NO:136
      cargoShipRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, False, incomingRef) ; #DEBUG_LINE_NO:139
    Else ; #DEBUG_LINE_NO:
      cargoShipRef.RemoveAllItems(incomingRef, False, True) ; #DEBUG_LINE_NO:143
    EndIf ; #DEBUG_LINE_NO:
    incomingRef.MoveContainerContentToUnfilledContainers() ; #DEBUG_LINE_NO:146
    canProduce = Self.CargoLinkCanProduce(cargoShipRef, atOutpost01) ; #DEBUG_LINE_NO:147
    Self.SendOutpostCargoLinkUnloadCargoEvent(incomingRef, cargoShipRef as spaceshipreference) ; #DEBUG_LINE_NO:149
  Else ; #DEBUG_LINE_NO:
    ObjectReference outgoingRef = cargoShipRef.GetLinkedRef(outgoingKeyword) ; #DEBUG_LINE_NO:152
    outgoingRef.MoveContainerContentToUnfilledContainers() ; #DEBUG_LINE_NO:154
    Bool bDoneLoading = False ; #DEBUG_LINE_NO:155
    Int totalLoaded = 0 ; #DEBUG_LINE_NO:156
    While bDoneLoading == False ; #DEBUG_LINE_NO:157
      outgoingRef.MoveContainerContentToUnfilledContainers() ; #DEBUG_LINE_NO:159
      Int itemCountBeforeLoading = outgoingRef.GetItemCount(None) ; #DEBUG_LINE_NO:160
      If cargolinkMarker as Bool && cargolinkMarker.SpecificCargo as Bool ; #DEBUG_LINE_NO:161
        totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, False, cargoShipRef as ObjectReference) ; #DEBUG_LINE_NO:164
      ElseIf cargolinkMarker2 as Bool && cargolinkMarker2.SpecificCargo as Bool ; #DEBUG_LINE_NO:165
        totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, False, cargoShipRef as ObjectReference) ; #DEBUG_LINE_NO:168
      Else ; #DEBUG_LINE_NO:
        outgoingRef.RemoveAllItems(cargoShipRef as ObjectReference, False, True) ; #DEBUG_LINE_NO:172
      EndIf ; #DEBUG_LINE_NO:
      bDoneLoading = itemCountBeforeLoading == outgoingRef.GetItemCount(None) ; #DEBUG_LINE_NO:174
      If (bDoneLoading == False && cargolinkMarker as Bool) && cargolinkMarker.SpecificCargo as Bool ; #DEBUG_LINE_NO:175
        bDoneLoading = totalLoaded >= cargolinkMarker.SpecificCargoMax ; #DEBUG_LINE_NO:177
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    Self.SendOutpostCargoLinkLoadCargoEvent(outgoingRef, cargoShipRef as spaceshipreference) ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
  Return canProduce ; #DEBUG_LINE_NO:183
EndFunction

Bool Function CreateCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
  Bool success = False ; #DEBUG_LINE_NO:190
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:191
    ObjectReference cargoLink01LandingMarker = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLandingMarker) ; #DEBUG_LINE_NO:200
    ObjectReference cargoLink02LandingMarker = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoLandingMarker) ; #DEBUG_LINE_NO:201
    ObjectReference cargoLink01Outgoing = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoOutgoing) ; #DEBUG_LINE_NO:203
    ObjectReference cargoLink02Outgoing = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoOutgoing) ; #DEBUG_LINE_NO:204
    ObjectReference cargoLink01Incoming = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoIncoming) ; #DEBUG_LINE_NO:206
    ObjectReference cargoLink02Incoming = cargoLink02Ref.GetLinkedRef(LinkOutpostCargoIncoming) ; #DEBUG_LINE_NO:207
    spaceshipbase cargoLinkShipBase = OutpostCargoLinkShip01 ; #DEBUG_LINE_NO:214
    outpostcargolinkmarkerscript cargolinkMarker = cargoLink01Ref as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:215
    Bool CreateShipAtCargoLink01 = True ; #DEBUG_LINE_NO:216
    If cargolinkMarker ; #DEBUG_LINE_NO:217
      CreateShipAtCargoLink01 = cargolinkMarker.CreateShipAtCargoLink01 ; #DEBUG_LINE_NO:218
    EndIf ; #DEBUG_LINE_NO:
    If cargolinkMarker as Bool && cargolinkMarker.OutpostCargoLinkShip as Bool ; #DEBUG_LINE_NO:220
      cargoLinkShipBase = cargolinkMarker.OutpostCargoLinkShip ; #DEBUG_LINE_NO:221
    EndIf ; #DEBUG_LINE_NO:
    spaceshipreference cargoShipRef = None ; #DEBUG_LINE_NO:223
    Int failsafeCount = 0 ; #DEBUG_LINE_NO:224
    While cargoShipRef == None && failsafeCount < 30 ; #DEBUG_LINE_NO:225
      If CreateShipAtCargoLink01 ; #DEBUG_LINE_NO:226
        cargoShipRef = cargoLink01LandingMarker.PlaceShipAtMe(cargoLinkShipBase as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:227
      Else ; #DEBUG_LINE_NO:
        cargoShipRef = cargoLink02LandingMarker.PlaceShipAtMe(cargoLinkShipBase as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:229
      EndIf ; #DEBUG_LINE_NO:
      If cargoShipRef == None ; #DEBUG_LINE_NO:233
        failsafeCount += 1 ; #DEBUG_LINE_NO:234
        Utility.wait(1.0) ; #DEBUG_LINE_NO:235
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    If cargoShipRef ; #DEBUG_LINE_NO:239
      success = True ; #DEBUG_LINE_NO:240
      If cargolinkMarker ; #DEBUG_LINE_NO:242
        (cargoShipRef as sq_outpostcargolinkshipscript).RequiresFuel = cargolinkMarker.RequiresFuel ; #DEBUG_LINE_NO:244
      EndIf ; #DEBUG_LINE_NO:
      cargoLink01Ref.SetLinkedRef(cargoShipRef as ObjectReference, LinkOutpostCargoLinkShip, True) ; #DEBUG_LINE_NO:247
      cargoLink02Ref.SetLinkedRef(cargoShipRef as ObjectReference, LinkOutpostCargoLinkShip, True) ; #DEBUG_LINE_NO:248
      cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarker01, True) ; #DEBUG_LINE_NO:251
      cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarker02, True) ; #DEBUG_LINE_NO:252
      If CreateShipAtCargoLink01 ; #DEBUG_LINE_NO:255
        cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent, True) ; #DEBUG_LINE_NO:256
        Self.SetAnimationState(cargoLink01Ref, stateEnum02_landing) ; #DEBUG_LINE_NO:257
        Self.SetAnimationState(cargoLink02Ref, stateEnum01_linked) ; #DEBUG_LINE_NO:258
      Else ; #DEBUG_LINE_NO:
        cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent, True) ; #DEBUG_LINE_NO:260
        cargoShipRef.SetValue(OutpostCargoLinkShipDestination, 1.0) ; #DEBUG_LINE_NO:261
        Self.SetAnimationState(cargoLink02Ref, stateEnum02_landing) ; #DEBUG_LINE_NO:262
        Self.SetAnimationState(cargoLink01Ref, stateEnum01_linked) ; #DEBUG_LINE_NO:263
      EndIf ; #DEBUG_LINE_NO:
      cargoShipRef.SetLinkedRef(cargoLink01Outgoing, LinkOutpostCargoShipOutgoing01, True) ; #DEBUG_LINE_NO:267
      cargoShipRef.SetLinkedRef(cargoLink02Outgoing, LinkOutpostCargoShipOutgoing02, True) ; #DEBUG_LINE_NO:268
      cargoShipRef.SetLinkedRef(cargoLink01Incoming, LinkOutpostCargoShipIncoming01, True) ; #DEBUG_LINE_NO:270
      cargoShipRef.SetLinkedRef(cargoLink02Incoming, LinkOutpostCargoShipIncoming02, True) ; #DEBUG_LINE_NO:271
      cargoShipRef.SetLinkedRef(cargoLink01Ref, LinkOutpostCargoShipCargoLink01, True) ; #DEBUG_LINE_NO:274
      cargoShipRef.SetLinkedRef(cargoLink02Ref, LinkOutpostCargoShipCargoLink02, True) ; #DEBUG_LINE_NO:275
      LinkedOutpost.ForceRefTo(cargoLink02Ref.GetWorkshop()) ; #DEBUG_LINE_NO:277
      cargoLink01Ref.RemoveKeyword(OutpostProductionHalted) ; #DEBUG_LINE_NO:280
      cargoLink02Ref.RemoveKeyword(OutpostProductionHalted) ; #DEBUG_LINE_NO:281
    EndIf ; #DEBUG_LINE_NO:
    If success == False ; #DEBUG_LINE_NO:284
      OutpostCargoLinkFailureMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:285
    Else ; #DEBUG_LINE_NO:
      (cargoLink01Ref as outpostcargolinkmarkerscript).isLinked = True ; #DEBUG_LINE_NO:287
      (cargoLink02Ref as outpostcargolinkmarkerscript).isLinked = True ; #DEBUG_LINE_NO:288
      If cargoLinkAchievementDone == False ; #DEBUG_LINE_NO:290
        Self.StartTimer(cargoLinkCreationTimer, cargoLinkCreationTimerID) ; #DEBUG_LINE_NO:291
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:295
EndFunction

Function ClearCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
  Guard cargoLinkGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:301
    sq_outpostcargolinkshipscript cargoShipRef = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkShip) as sq_outpostcargolinkshipscript ; #DEBUG_LINE_NO:302
    If cargoShipRef ; #DEBUG_LINE_NO:303
      ObjectReference playerShip = SQ_PlayerShip.HomeShip.GetRef() ; #DEBUG_LINE_NO:305
      If playerShip ; #DEBUG_LINE_NO:306
        cargoShipRef.RemoveAllItems(playerShip, False, True) ; #DEBUG_LINE_NO:308
      EndIf ; #DEBUG_LINE_NO:
      cargoShipRef.RemoveAllItems(Game.GetPlayer() as ObjectReference, False, False) ; #DEBUG_LINE_NO:311
    EndIf ; #DEBUG_LINE_NO:
    If cargoLink02Ref == None ; #DEBUG_LINE_NO:315
      cargoLink02Ref = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkActive) ; #DEBUG_LINE_NO:316
    EndIf ; #DEBUG_LINE_NO:
    Self.ClearCargoLinkRef(cargoLink01Ref as outpostcargolinkmarkerscript) ; #DEBUG_LINE_NO:320
    Self.ClearCargoLinkRef(cargoLink02Ref as outpostcargolinkmarkerscript) ; #DEBUG_LINE_NO:321
    If cargoShipRef ; #DEBUG_LINE_NO:325
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarker01, True) ; #DEBUG_LINE_NO:327
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarker02, True) ; #DEBUG_LINE_NO:328
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipLandingMarkerCurrent, True) ; #DEBUG_LINE_NO:330
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipOutgoing01, True) ; #DEBUG_LINE_NO:332
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipOutgoing02, True) ; #DEBUG_LINE_NO:333
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipIncoming01, True) ; #DEBUG_LINE_NO:335
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipIncoming02, True) ; #DEBUG_LINE_NO:336
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipCargoLink01, True) ; #DEBUG_LINE_NO:338
      cargoShipRef.SetLinkedRef(None, LinkOutpostCargoShipCargoLink02, True) ; #DEBUG_LINE_NO:339
      If cargoShipRef.IsLanded() == False ; #DEBUG_LINE_NO:342
        cargoShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:344
      Else ; #DEBUG_LINE_NO:
        cargoShipRef.DisableWithTakeOffOrLandingNoWait() ; #DEBUG_LINE_NO:348
      EndIf ; #DEBUG_LINE_NO:
      cargoShipRef.CancelTimers() ; #DEBUG_LINE_NO:350
      cargoShipRef = None ; #DEBUG_LINE_NO:351
    EndIf ; #DEBUG_LINE_NO:
    Self.SetAnimationState(cargoLink01Ref, stateEnum00_unlinked) ; #DEBUG_LINE_NO:354
    Self.SetAnimationState(cargoLink02Ref, stateEnum00_unlinked) ; #DEBUG_LINE_NO:355
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ClearCargoLinkRef(outpostcargolinkmarkerscript cargoLinkRef)
  If cargoLinkRef ; #DEBUG_LINE_NO:360
    If cargoLinkRef.RequiresFuel ; #DEBUG_LINE_NO:362
      cargoLinkRef.AddKeyword(OutpostProductionHalted) ; #DEBUG_LINE_NO:363
    EndIf ; #DEBUG_LINE_NO:
    cargoLinkRef.SetLinkedRef(None, LinkOutpostCargoLinkShip, True) ; #DEBUG_LINE_NO:366
    cargoLinkRef.SetLinkedRef(None, LinkOutpostCargoLinkActive, True) ; #DEBUG_LINE_NO:369
    cargoLinkRef.isLinked = False ; #DEBUG_LINE_NO:371
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SendOutpostCargoLinkUnloadCargoEvent(ObjectReference incomingCargoRef, spaceshipreference cargoShipRef)
  Var[] kargs = new Var[2] ; #DEBUG_LINE_NO:377
  kargs[0] = incomingCargoRef as Var ; #DEBUG_LINE_NO:378
  kargs[1] = cargoShipRef as Var ; #DEBUG_LINE_NO:379
  Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkUnloadCargo", kargs) ; #DEBUG_LINE_NO:380
EndFunction

Function SendOutpostCargoLinkLoadCargoEvent(ObjectReference outgoingCargoRef, spaceshipreference cargoShipRef)
  Var[] kargs = new Var[2] ; #DEBUG_LINE_NO:385
  kargs[0] = outgoingCargoRef as Var ; #DEBUG_LINE_NO:386
  kargs[1] = cargoShipRef as Var ; #DEBUG_LINE_NO:387
  Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkLoadCargo", kargs) ; #DEBUG_LINE_NO:388
EndFunction

Bool Function CargoLinkCanProduce(sq_outpostcargolinkshipscript cargoShipRef, Bool atOutpost01)
  Bool canProduce = cargoShipRef.RequiresFuel == False ; #DEBUG_LINE_NO:396
  If canProduce == False ; #DEBUG_LINE_NO:397
    ObjectReference[] shipCargoLinks = cargoShipRef.GetRefsLinkedToMe(LinkOutpostCargoLinkShip, None) ; #DEBUG_LINE_NO:398
    Int I = 0 ; #DEBUG_LINE_NO:400
    While I < shipCargoLinks.Length && canProduce == False ; #DEBUG_LINE_NO:401
      ObjectReference cargoLinkRef = shipCargoLinks[I] ; #DEBUG_LINE_NO:402
      canProduce = cargoLinkRef.HasKeyword(OutpostCargoLinkMission) == False && cargoLinkRef.CanProduceForWorkshop() ; #DEBUG_LINE_NO:404
      I += 1 ; #DEBUG_LINE_NO:406
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return canProduce ; #DEBUG_LINE_NO:410
EndFunction

Function SetAnimationState(ObjectReference cargoLinkRef, Int stateEnum)
  If cargoLinkRef ; #DEBUG_LINE_NO:415
    outpostcargolinkmarkerscript cargoLinkMarkerRef = cargoLinkRef as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:416
    If cargoLinkMarkerRef ; #DEBUG_LINE_NO:417
      sq_outpostcargolinkscript:animdata theData = Self.GetAnimationData(stateEnum) ; #DEBUG_LINE_NO:418
      If theData ; #DEBUG_LINE_NO:419
        cargoLinkMarkerRef.SetAnimationState(theData.stateID, theData) ; #DEBUG_LINE_NO:421
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

sq_outpostcargolinkscript:animdata Function GetAnimationData(Int stateEnum)
  sq_outpostcargolinkscript:animdata theData = None ; #DEBUG_LINE_NO:430
  Int stateIndex = animationStates.findstruct("stateID", stateEnum, 0) ; #DEBUG_LINE_NO:431
  If stateIndex > -1 ; #DEBUG_LINE_NO:432
    theData = animationStates[stateIndex] ; #DEBUG_LINE_NO:433
  EndIf ; #DEBUG_LINE_NO:
  Return theData ; #DEBUG_LINE_NO:435
EndFunction

Function SendOutpostCargoLinkChangedEvent(ObjectReference outpostRef, ObjectReference cargoLinkRef, ObjectReference akOldTarget, ObjectReference akNewTarget)
  If outpostRef as Bool && cargoLinkRef as Bool ; #DEBUG_LINE_NO:440
    Var[] kargs = new Var[4] ; #DEBUG_LINE_NO:441
    kargs[0] = outpostRef as Var ; #DEBUG_LINE_NO:442
    kargs[1] = cargoLinkRef as Var ; #DEBUG_LINE_NO:443
    kargs[2] = akOldTarget as Var ; #DEBUG_LINE_NO:444
    kargs[3] = akNewTarget as Var ; #DEBUG_LINE_NO:445
    Self.SendCustomEvent("sq_outpostcargolinkscript_SQ_OutpostCargoLinkChanged", kargs) ; #DEBUG_LINE_NO:446
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == cargoLinkCreationTimerID ; #DEBUG_LINE_NO:455
    Self.CountLinkedOutposts() ; #DEBUG_LINE_NO:456
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CountLinkedOutposts()
  Guard linkedOutpostGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:464
    CargoLinks.RefillAlias() ; #DEBUG_LINE_NO:466
    Int cargoLinkCount = CargoLinks.GetCount() ; #DEBUG_LINE_NO:467
    If cargoLinkCount > 0 ; #DEBUG_LINE_NO:469
      ObjectReference[] linkedOutposts = new ObjectReference[0] ; #DEBUG_LINE_NO:471
      Int I = 0 ; #DEBUG_LINE_NO:472
      While I < cargoLinkCount ; #DEBUG_LINE_NO:473
        outpostcargolinkmarkerscript cargoLinkRef = CargoLinks.GetAt(I) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:474
        If cargoLinkRef ; #DEBUG_LINE_NO:476
          ObjectReference myOutpostRef = cargoLinkRef.GetWorkshop() ; #DEBUG_LINE_NO:477
          If myOutpostRef as Bool && cargoLinkRef.isLinked ; #DEBUG_LINE_NO:479
            Int foundOutpost = linkedOutposts.find(myOutpostRef, 0) ; #DEBUG_LINE_NO:481
            If foundOutpost < 0 ; #DEBUG_LINE_NO:482
              linkedOutposts.add(myOutpostRef, 1) ; #DEBUG_LINE_NO:484
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:488
      EndWhile ; #DEBUG_LINE_NO:
      If linkedOutposts.Length >= CargoLinkOutpostCountRequired ; #DEBUG_LINE_NO:492
        Game.AddAchievement(CargoLinkAchievement) ; #DEBUG_LINE_NO:493
        cargoLinkAchievementDone = True ; #DEBUG_LINE_NO:494
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    CargoLinks.RemoveAll() ; #DEBUG_LINE_NO:497
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function debugRefillCargoLinks()
  CargoLinks.RefillAlias() ; #DEBUG_LINE_NO:502
EndFunction
