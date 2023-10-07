ScriptName TestSteveCQuestScript Extends Quest

;-- Variables ---------------------------------------
Int CONST_TeleportOutVFXDelay = 2 Const
Int CONST_TestSwapTimerDelay = 5 Const
Int CONST_TestSwapTimerID = 2 Const
ObjectReference[] allTestActivators
Int currentActivatorCount
Actor temp
ObjectReference testDecal
spaceshipreference testShipN

;-- Properties --------------------------------------
ReferenceAlias Property TestSteveCHoldingContainer Auto Const mandatory
textureset Property Decal_JGVectera01 Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
Cell Property TestSteveCSpaceCell Auto Const mandatory
RefCollectionAlias Property TestSpaceCellRefs Auto Const mandatory
RefCollectionAlias Property TestSpaceCellRefs_Ship01 Auto Const mandatory
ReferenceAlias Property TestSpaceCellRefs_Ship02 Auto Const mandatory
ReferenceAlias Property DebugText Auto Const mandatory
ReferenceAlias Property TestDoor Auto Const mandatory
spaceshipbase Property PirateShipModular01 Auto Const mandatory
spaceshipbase[] Property TestShips Auto Const mandatory
ReferenceAlias Property TestLinkedRefShip Auto Const mandatory
ReferenceAlias Property TestLinkedRefNonship Auto Const mandatory
ReferenceAlias Property TestLinkedRefNonship2 Auto Const mandatory
ReferenceAlias Property TestLever Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
Message Property MQ206D_PowerInterlock_Disengage Auto Const mandatory
Message Property MQ206D_PowerInterlock_Engage Auto Const mandatory
ReferenceAlias Property SimonSaysMarker Auto Const mandatory
ReferenceAlias Property SimonSaysActor Auto Const mandatory
Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Static Property XMarker Auto Const mandatory
ObjectReference Property TestSteveCSpaceTrigger1Ref Auto Const mandatory
spaceshipreference Property TestSteveCDockingParentShipRef Auto Const mandatory
spaceshipreference Property TestSteveCDockingChildShipRef Auto Const mandatory
ObjectReference Property TestSteveCAsteroidRef Auto Const mandatory
ObjectReference Property TestSteveCBossChest Auto Const mandatory
Message Property TestSteveCOnActivateEventMessage Auto Const mandatory
Message Property TestSteveCOnOpenEventMessage Auto Const mandatory
Message Property TestMessageBox01 Auto Const mandatory
ReferenceAlias Property TestAliasedItem01 Auto Const mandatory
ReferenceAlias Property TestAliasedItem02 Auto Const mandatory
ReferenceAlias Property TestSteveCUniqueShip Auto Const mandatory
ReferenceAlias Property TheKeyMapMarkerHeadingRef Auto Const mandatory
ReferenceAlias Property TheKeyAlternateMapMarkerHeadingRef Auto Const mandatory
ReferenceAlias Property TheKeyOriginMarkerRef Auto Const mandatory
ReferenceAlias Property SuvorovPlanetUniqueArrivalMarkerRef Auto Const mandatory
ReferenceAlias Property DefensiveBatteryLaphaMapMarkerHeadingRef Auto Const mandatory
ObjectReference Property TestSteveCTerminalRef Auto Const mandatory
Perk Property TestVorpalShipPerk Auto Const mandatory
ObjectReference Property TestSteveCAmbushLeverRef Auto Const mandatory
ObjectReference Property TestSteveCAmbushMarkerRef Auto Const mandatory
ObjectReference Property MQ206DLandingMarkerRef Auto Const mandatory
spaceshipbase Property TestLeveledShip Auto Const mandatory
ReferenceAlias Property LC165TestStarbornCaster Auto Const mandatory
ActorValue Property LC165_StarbornStateValue Auto Const mandatory
Spell Property LC165_Starborn_Bridge_GravityWell Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
RefCollectionAlias Property PipeTraps Auto Const mandatory
spaceshipreference Property TestDisembarking02 Auto Const mandatory
ReferenceAlias Property TestDialogueBugs2Actor Auto Const mandatory
Faction Property LC165StarbornEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
Spell Property AIPower_VoidForm Auto Const mandatory
Spell Property LC165_Scripted_VoidFormAb Auto Const mandatory
Spell Property TestSteveCStarbornCasterScriptedSpell Auto Const mandatory
FormList Property FilterList_InventoryCategoryAidFood Auto Const mandatory
ObjectReference Property TestSteveCCloseDoorOnDetachRef Auto Const mandatory
ObjectReference Property TestSteveCProjectileSourceMarkerRef Auto Const mandatory
ObjectReference Property TestSteveCTrafficManagerSettingsRef Auto Const mandatory
ReferenceAlias Property TestSwapActor01 Auto Const mandatory
ReferenceAlias Property TestSwapActor02 Auto Const mandatory
Spell Property LC165_AbTeleportSwapIn Auto Const mandatory
Spell Property LC165_AbTeleportSwapOut Auto Const mandatory
Explosion Property LC165_StarbornTeleportSwapExplosion Auto Const mandatory
ReferenceAlias Property MentatsAlias1 Auto Const mandatory
ReferenceAlias Property MentatsAlias2 Auto Const mandatory
ReferenceAlias Property BerryMentatsAlias1 Auto Const mandatory
ReferenceAlias Property BerryMentatsAlias2 Auto Const mandatory
ReferenceAlias Property BourbonAlias Auto Const mandatory
RefCollectionAlias Property TestActivators Auto Const mandatory
GlobalVariable Property TestSteveCCurrentCountGlobal Auto Const mandatory
GlobalVariable Property TestSteveCTotalCountGlobal Auto Const mandatory
GlobalVariable Property TestSteveCQuestTargetsGlobal Auto Const mandatory
Spell Property TestSteveCPerkSpell Auto Const mandatory
ReferenceAlias Property TestTurret Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
ObjectReference Property TestPlatformHelperRef Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akTriggerRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript source, Var[] akArgs)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function TraceGravity(ObjectReference testObject)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function TraceHasSpell()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function TraceObjectsInTrigger(ObjectReference obj)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function TestSpawnLeveledShip(Int difficulty)
  If testShipN != None ; #DEBUG_LINE_NO:80
    testShipN.Disable(False) ; #DEBUG_LINE_NO:81
    testShipN.Delete() ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference ship = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:84
  testShipN = ship.PlaceShipNearMe(TestLeveledShip as Form, ship.CONST_NearPosition_DeadAhead, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, difficulty, True, False, False, True, None) ; #DEBUG_LINE_NO:85
EndFunction

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:92
  Self.RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:93
  Self.RegisterForRemoteEvent(TestSteveCBossChest as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:94
  Self.RegisterForRemoteEvent(TestSteveCBossChest as ScriptObject, "OnOpen") ; #DEBUG_LINE_NO:95
  Self.RegisterForRemoteEvent(TestSteveCAmbushLeverRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:96
  Self.RegisterForRemoteEvent(TestSteveCCloseDoorOnDetachRef as ScriptObject, "OnCellDetach") ; #DEBUG_LINE_NO:97
  Self.RegisterForRemoteEvent(TestSwapActor01 as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:98
EndEvent

Function TestSpaceCell()
  PlayerShip.GetRef().PlaceCellAtMe(TestSteveCSpaceCell, TestSpaceCellRefs, False, True, False, None) ; #DEBUG_LINE_NO:102
  TestSpaceCellRefs_Ship01.RefillAlias() ; #DEBUG_LINE_NO:103
  TestSpaceCellRefs_Ship02.RefillAlias() ; #DEBUG_LINE_NO:104
EndFunction

Function SetDebugTextColor(Int r, Int g, Int b, Int a)
  DebugText.GetRef() ; #DEBUG_LINE_NO:108
EndFunction

Function SetDebugTextSize(Int S)
  DebugText.GetRef() ; #DEBUG_LINE_NO:112
EndFunction

Function SetDebugTextString(String t)
  DebugText.GetRef() ; #DEBUG_LINE_NO:116
EndFunction

Function SetDebugTextBillboard(Bool b)
  DebugText.GetRef() ; #DEBUG_LINE_NO:120
EndFunction

Function SetLockedWithDelay(Bool shouldUnlock)
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:124
  If shouldUnlock ; #DEBUG_LINE_NO:125
    TestDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:126
  Else ; #DEBUG_LINE_NO:
    TestDoor.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnTestShip(Int I)
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:133
  offsets[1] = 1000.0 ; #DEBUG_LINE_NO:134
  ObjectReference marker = PlayerShip.GetRef().PlaceShipAtMe(TestShips[I] as Form, 4, True, False, False, True, offsets, None, None, True) as ObjectReference ; #DEBUG_LINE_NO:135
EndFunction

Function MoveShip1(spaceshipreference ship)
  ship.MoveTo(ship as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:139
EndFunction

Function MoveShip2(spaceshipreference ship)
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:143
  offsets[1] = 1000.0 ; #DEBUG_LINE_NO:144
  ObjectReference marker = ship.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:145
  ship.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:146
EndFunction

Function MoveShip3(spaceshipreference ship)
  ship.Disable(False) ; #DEBUG_LINE_NO:150
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:151
  offsets[1] = 1000.0 ; #DEBUG_LINE_NO:152
  ObjectReference marker = ship.PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:153
  ship.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:154
  ship.Enable(False) ; #DEBUG_LINE_NO:155
EndFunction

Function MoveShip4()
  ObjectReference newShip = PlayerShip.GetRef().PlaceShipAtMe(PirateShipModular01 as Form, 4, True, False, False, True, None, None, None, True) as ObjectReference ; #DEBUG_LINE_NO:159
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:160
  offsets[1] = 1000.0 ; #DEBUG_LINE_NO:161
  ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:162
  newShip.MoveTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:163
  newShip.Enable(False) ; #DEBUG_LINE_NO:164
EndFunction

Function TestShipOpen(spaceshipreference S, Bool shouldBeOpen)
  S.SetOpen(shouldBeOpen) ; #DEBUG_LINE_NO:168
EndFunction

Function TestGravJumpVFX(spaceshipreference ship, Bool shouldEnable)
  If shouldEnable ; #DEBUG_LINE_NO:173
    ship.EnableWithGravJump() ; #DEBUG_LINE_NO:174
  Else ; #DEBUG_LINE_NO:
    ship.DisableWithGravJump() ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TraceLinkedRefs()
  ObjectReference testNonShip = TestLinkedRefNonship.GetRef() ; #DEBUG_LINE_NO:181
  ObjectReference[] refsLinkedToMe3 = testNonShip.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:182
  Actor[] actorsLinkedToMe3 = testNonShip.GetActorsLinkedToMe(None, None) ; #DEBUG_LINE_NO:183
  ObjectReference[] refsLinkedToMe4 = testNonShip.GetRefsLinkedToMe(BEDisembarkerLink, None) ; #DEBUG_LINE_NO:185
  Actor[] actorsLinkedToMe4 = testNonShip.GetActorsLinkedToMe(BEDisembarkerLink, None) ; #DEBUG_LINE_NO:186
EndFunction

Function AddBourbonByRef()
  ObjectReference aliasedBourbonRef = BourbonAlias.GetRef() ; #DEBUG_LINE_NO:202
  Game.GetPlayer().AddItem(aliasedBourbonRef as Form, 1, False) ; #DEBUG_LINE_NO:203
EndFunction

Function AddBerryMentatsByRef()
  ObjectReference aliasedBerryMentats = BerryMentatsAlias1.GetRef() ; #DEBUG_LINE_NO:207
  Game.GetPlayer().AddItem(aliasedBerryMentats as Form, 1, False) ; #DEBUG_LINE_NO:208
EndFunction

Function TestActivatorCounting()
  currentActivatorCount = 0 ; #DEBUG_LINE_NO:222
  TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount as Float) ; #DEBUG_LINE_NO:223
  If allTestActivators == None ; #DEBUG_LINE_NO:224
    Int totalActivatorCount = TestActivators.GetCount() ; #DEBUG_LINE_NO:225
    TestSteveCTotalCountGlobal.SetValue(totalActivatorCount as Float) ; #DEBUG_LINE_NO:226
    Self.UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal) ; #DEBUG_LINE_NO:227
    allTestActivators = new ObjectReference[totalActivatorCount] ; #DEBUG_LINE_NO:228
    Int I = 0 ; #DEBUG_LINE_NO:229
    While I < allTestActivators.Length ; #DEBUG_LINE_NO:230
      allTestActivators[I] = TestActivators.GetAt(I) ; #DEBUG_LINE_NO:231
      Self.RegisterForRemoteEvent(allTestActivators[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:232
      I += 1 ; #DEBUG_LINE_NO:233
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateActivatorCount() ; #DEBUG_LINE_NO:236
EndFunction

Function TestActivatorsBlockActivation(Bool abBlocked, Bool abHideActivateText)
  Int I = 0 ; #DEBUG_LINE_NO:240
  While I < allTestActivators.Length ; #DEBUG_LINE_NO:241
    allTestActivators[I].BlockActivation(abBlocked, abHideActivateText) ; #DEBUG_LINE_NO:242
    I += 1 ; #DEBUG_LINE_NO:243
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UpdateActivatorCount()
  TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount as Float) ; #DEBUG_LINE_NO:248
  Self.UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal) ; #DEBUG_LINE_NO:249
  Self.UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:251
  If currentActivatorCount % 2 > 0 ; #DEBUG_LINE_NO:253
    Self.SetObjectiveDisplayed(302, False, False) ; #DEBUG_LINE_NO:254
    Self.SetObjectiveDisplayed(301, True, False) ; #DEBUG_LINE_NO:255
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(301, False, False) ; #DEBUG_LINE_NO:257
    Self.SetObjectiveDisplayed(302, True, False) ; #DEBUG_LINE_NO:258
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetActivatorCount(Int newCount, Bool redisplay)
  TestSteveCCurrentCountGlobal.SetValue(newCount as Float) ; #DEBUG_LINE_NO:263
  Self.UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal) ; #DEBUG_LINE_NO:264
  If redisplay ; #DEBUG_LINE_NO:265
    Self.SetObjectiveDisplayed(300, True, True) ; #DEBUG_LINE_NO:266
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnOpen(ObjectReference akSource, ObjectReference akActionRef)
  If akSource == TestSteveCBossChest ; #DEBUG_LINE_NO:316
    TestSteveCOnOpenEventMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetActivateTextOverride(Int index)
  If index == 0 ; #DEBUG_LINE_NO:322
    TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Engage) ; #DEBUG_LINE_NO:323
  Else ; #DEBUG_LINE_NO:
    TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Disengage) ; #DEBUG_LINE_NO:325
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TestPlayBink(Bool shouldWait)
  If shouldWait ; #DEBUG_LINE_NO:330
    Game.PlayBink("artifactvision.bk2", False, True, True, True, False) ; #DEBUG_LINE_NO:331
  Else ; #DEBUG_LINE_NO:
    Game.PlayBinkNoWait("artifactvision.bk2", False, True, True, True, False, False) ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:336
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:338
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:340
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:342
EndFunction

Function TestCast(ObjectReference source, ObjectReference target)
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target) ; #DEBUG_LINE_NO:347
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:348
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target) ; #DEBUG_LINE_NO:349
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:350
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target) ; #DEBUG_LINE_NO:351
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:352
  LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target) ; #DEBUG_LINE_NO:353
EndFunction

Function TestCastFromProjectileSource()
  LC088_DefensiveBatteryFireProjectileSpell.Cast(TestSteveCProjectileSourceMarkerRef, PlayerShip.GetRef()) ; #DEBUG_LINE_NO:357
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  Self.StartTimer(0.0, 1) ; #DEBUG_LINE_NO:363
EndEvent

Event OnTimer(Int timerID)
  If timerID == 1 ; #DEBUG_LINE_NO:371
    If TestSteveCSpaceTrigger1Ref.IsInTrigger(PlayerShip.GetRef()) ; #DEBUG_LINE_NO:372
      Self.StartTimer(1.0, 1) ; #DEBUG_LINE_NO:374
    EndIf ; #DEBUG_LINE_NO:
  ElseIf timerID == CONST_TestSwapTimerID ; #DEBUG_LINE_NO:378
    Self.TestSwap() ; #DEBUG_LINE_NO:379
    Self.StartTimer(CONST_TestSwapTimerDelay as Float, CONST_TestSwapTimerID) ; #DEBUG_LINE_NO:380
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function MoveDockingParent()
  TestSteveCDockingParentShipRef.MoveTo(TestSteveCDockingParentShipRef as ObjectReference, 200.0, 200.0, 200.0, True, False) ; #DEBUG_LINE_NO:386
EndFunction

Function TraceLinkedRefChildren()
  ObjectReference[] refsLinkedToParent = TestSteveCDockingParentShipRef.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:393
  Int I = 0 ; #DEBUG_LINE_NO:394
  While I < refsLinkedToParent.Length ; #DEBUG_LINE_NO:395
    I += 1 ; #DEBUG_LINE_NO:397
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AddPerkSpell(spaceshipreference myShip)
  myShip.AddSpell(TestSteveCPerkSpell, True) ; #DEBUG_LINE_NO:404
EndFunction

Function DispelPerkSpell(spaceshipreference myShip)
  myShip.DispelSpell(TestSteveCPerkSpell) ; #DEBUG_LINE_NO:408
EndFunction

Function DisplayMessageBox()
  TestMessageBox01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:412
EndFunction

Function MoveAliasedItemToContainer01()
  TestSteveCHoldingContainer.GetRef().AddItem(TestAliasedItem01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:418
EndFunction

Function MoveAliasedItemToPlayer01()
  Game.GetPlayer().AddItem(TestAliasedItem01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:422
EndFunction

Function MoveAliasedItemToContainer02()
  Game.GetPlayer().RemoveItem(TestAliasedItem02.GetRef() as Form, 1, False, TestSteveCHoldingContainer.GetRef()) ; #DEBUG_LINE_NO:427
EndFunction

Function MoveAliasedItemToPlayer02()
  Game.GetPlayer().AddItem(TestAliasedItem02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:431
EndFunction

Function TraceMyLinkedRefs(ObjectReference obj)
  ObjectReference[] refsLinkedToMe = obj.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:439
  Int I = 0 ; #DEBUG_LINE_NO:440
  While I < refsLinkedToMe.Length ; #DEBUG_LINE_NO:441
    I += 1 ; #DEBUG_LINE_NO:443
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveKeyMapMarkerHeading(Bool returnToOriginalPosition)
  If returnToOriginalPosition ; #DEBUG_LINE_NO:453
    TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:454
  Else ; #DEBUG_LINE_NO:
    TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyAlternateMapMarkerHeadingRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:456
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MoveSuvorovArrivalMarker(Bool returnToOriginalPosition)
  If returnToOriginalPosition ; #DEBUG_LINE_NO:461
    SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:462
  Else ; #DEBUG_LINE_NO:
    SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(DefensiveBatteryLaphaMapMarkerHeadingRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:464
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TestValues(Int value1, Int value2)
  TestSteveCTerminalRef.AddTextReplacementValue("value1", value1 as Float) ; #DEBUG_LINE_NO:469
  TestSteveCTerminalRef.AddTextReplacementValue("value2", value2 as Float) ; #DEBUG_LINE_NO:470
EndFunction

Function TraceTurretLOS()
  Actor turretRef = TestTurret.GetActorRef() ; #DEBUG_LINE_NO:477
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:478
EndFunction

Function SetIgnoreFriendlyHits(Bool shouldIgnoreFriendlyHits)
  ObjectReference shipRef = TestSteveCUniqueShip.GetRef() ; #DEBUG_LINE_NO:486
  shipRef.IgnoreFriendlyHits(shouldIgnoreFriendlyHits) ; #DEBUG_LINE_NO:488
EndFunction

Function AddVorpalShipPerk()
  PlayerShip.GetShipRef().AddPerk(TestVorpalShipPerk, False) ; #DEBUG_LINE_NO:493
EndFunction

Function RegisterForShipHit()
  Self.RegisterForHitEvent(TestSteveCDockingParentShipRef as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:497
EndFunction

Function RegisterForTestBE(spaceshipreference testBEShipRef)
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted") ; #DEBUG_LINE_NO:509
EndFunction

Function TestCastSpell(Int spellID)
  Actor caster = LC165TestStarbornCaster.GetActorRef() ; #DEBUG_LINE_NO:521
  Self.RegisterForRemoteEvent(caster as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:522
  caster.SetValue(LC165_StarbornStateValue, spellID as Float) ; #DEBUG_LINE_NO:523
  caster.EvaluatePackage(False) ; #DEBUG_LINE_NO:524
EndFunction

Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
  Int spellID = akSource.GetValue(LC165_StarbornStateValue) as Int ; #DEBUG_LINE_NO:528
  If spellID == 1 ; #DEBUG_LINE_NO:530
    LC165_Starborn_Bridge_GravityWell.Cast(akSource, akSource.GetLinkedRef(LinkCustom01)) ; #DEBUG_LINE_NO:531
  ElseIf spellID == 2 ; #DEBUG_LINE_NO:532
    AIPower_VoidForm.Cast(akSource, akSource) ; #DEBUG_LINE_NO:533
  ElseIf spellID == 3 ; #DEBUG_LINE_NO:534
    akSource.AddSpell(LC165_Scripted_VoidFormAb, True) ; #DEBUG_LINE_NO:535
  EndIf ; #DEBUG_LINE_NO:
  akSource.SetValue(LC165_StarbornStateValue, 0.0) ; #DEBUG_LINE_NO:537
  (akSource as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:538
EndEvent

Function SetVariable(String name, Float value)
  TestPlatformHelperRef.SetAnimationVariableFloat(name, value) ; #DEBUG_LINE_NO:544
EndFunction

Function PlayAnimation(String name)
  TestPlatformHelperRef.PlayAnimation(name) ; #DEBUG_LINE_NO:548
EndFunction

Function BreakPipes()
  ObjectReference[] pipes = PipeTraps.GetArray() ; #DEBUG_LINE_NO:553
  Int I = 0 ; #DEBUG_LINE_NO:554
  While I < pipes.Length ; #DEBUG_LINE_NO:555
    trappipespray pipe = pipes[I] as trappipespray ; #DEBUG_LINE_NO:556
    If pipe != None ; #DEBUG_LINE_NO:557
      pipe.BreakPipe() ; #DEBUG_LINE_NO:558
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:563
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetTestDisembarking02Inaccessible(Bool shouldBeInaccessible)
  TestDisembarking02.SetExteriorLoadDoorInaccessible(shouldBeInaccessible) ; #DEBUG_LINE_NO:568
EndFunction

Function DuplicatePlayer()
  temp = Game.GetPlayer().PlaceDuplicateActorAtMe(Game.GetPlayer(), False, False, True, None, None, True) ; #DEBUG_LINE_NO:574
  temp.RemoveFromAllFactions() ; #DEBUG_LINE_NO:575
  temp.AddToFaction(LC165StarbornEnemyFaction) ; #DEBUG_LINE_NO:576
  temp.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:577
  temp.SetValue(Confidence, 4.0) ; #DEBUG_LINE_NO:578
  temp.SetGroupFaction(None) ; #DEBUG_LINE_NO:579
  temp.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:580
EndFunction

Function ForceAddSpell()
  LC165TestStarbornCaster.GetActorRef().AddSpell(TestSteveCStarbornCasterScriptedSpell, True) ; #DEBUG_LINE_NO:588
EndFunction

Function TestGivingFood()
  Actor testActor = TestDialogueBugs2Actor.GetActorRef() ; #DEBUG_LINE_NO:593
  Self.RegisterForRemoteEvent(testActor as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:594
  testActor.OpenOneWayTransferMenu(True, FilterList_InventoryCategoryAidFood) ; #DEBUG_LINE_NO:595
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.SetStage(600) ; #DEBUG_LINE_NO:599
EndEvent

Event ObjectReference.OnCellDetach(ObjectReference akSource)
  akSource.SetOpen(False) ; #DEBUG_LINE_NO:604
EndEvent

Function ClearDialogueBugsActorAlias()
  TestDialogueBugs2Actor.Clear() ; #DEBUG_LINE_NO:608
EndFunction

Function TestLOSToPlayer(Actor source)
  Int I = 0 ; #DEBUG_LINE_NO:612
  While I < 500 ; #DEBUG_LINE_NO:613
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:615
    I += 1 ; #DEBUG_LINE_NO:616
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function TestArrays()
  Int[] testArray = new Int[1] ; #DEBUG_LINE_NO:621
  testArray[0] = 591 ; #DEBUG_LINE_NO:622
  Int[] test2 = testArray ; #DEBUG_LINE_NO:623
  testArray[0] = 592 ; #DEBUG_LINE_NO:624
  Int[] test3 = testArray ; #DEBUG_LINE_NO:625
EndFunction

Function TestSnap(ObjectReference target)
  Game.GetPlayer().SnapIntoInteraction(target) ; #DEBUG_LINE_NO:630
EndFunction

Function TestActivate(ObjectReference target)
  Game.GetPlayer().Activate(target, False) ; #DEBUG_LINE_NO:634
EndFunction

Function TestOpen(ObjectReference target)
  target.SetOpen(True) ; #DEBUG_LINE_NO:638
EndFunction

Function TestSnap2(ObjectReference target)
  target.Disable(False) ; #DEBUG_LINE_NO:642
  target.Enable(False) ; #DEBUG_LINE_NO:643
  Game.GetPlayer().SnapIntoInteraction(target) ; #DEBUG_LINE_NO:644
EndFunction

Event ReferenceAlias.OnLoad(ReferenceAlias source)
  If source == TestSwapActor01 ; #DEBUG_LINE_NO:650
    Self.StartTimer(CONST_TestSwapTimerDelay as Float, CONST_TestSwapTimerID) ; #DEBUG_LINE_NO:651
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TestSwap()
  Actor testSwapActor01Ref = TestSwapActor01.GetActorRef() ; #DEBUG_LINE_NO:656
  Actor testSwapActor02Ref = TestSwapActor02.GetActorRef() ; #DEBUG_LINE_NO:657
  testSwapActor01Ref.RemoveSpell(LC165_AbTeleportSwapIn) ; #DEBUG_LINE_NO:658
  testSwapActor02Ref.RemoveSpell(LC165_AbTeleportSwapIn) ; #DEBUG_LINE_NO:659
  ObjectReference swapMarker1 = testSwapActor01Ref.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:660
  ObjectReference swapMarker2 = testSwapActor02Ref.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:661
  swapMarker1.PlaceAtMe(LC165_StarbornTeleportSwapExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:662
  Self.TeleportIn(testSwapActor01Ref, LC165_AbTeleportSwapIn, None, None) ; #DEBUG_LINE_NO:663
  Self.TeleportIn(testSwapActor02Ref, LC165_AbTeleportSwapIn, None, None) ; #DEBUG_LINE_NO:664
  testSwapActor01Ref.MoveTo(swapMarker2, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:665
  testSwapActor02Ref.MoveTo(swapMarker1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:666
  swapMarker1.Delete() ; #DEBUG_LINE_NO:667
  swapMarker2.Delete() ; #DEBUG_LINE_NO:668
EndFunction

Function TeleportIn(Actor target, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell)
  If target != None ; #DEBUG_LINE_NO:673
    If teleportInSpell == None ; #DEBUG_LINE_NO:674
      teleportInSpell = LC165_AbTeleportSwapIn ; #DEBUG_LINE_NO:675
    EndIf ; #DEBUG_LINE_NO:
    If teleportOutSpell == None ; #DEBUG_LINE_NO:677
      teleportOutSpell = LC165_AbTeleportSwapOut ; #DEBUG_LINE_NO:678
    EndIf ; #DEBUG_LINE_NO:
    If teleportInExplosion != None ; #DEBUG_LINE_NO:681
      target.PlaceAtMe(teleportInExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:682
    EndIf ; #DEBUG_LINE_NO:
    target.RemoveSpell(teleportOutSpell) ; #DEBUG_LINE_NO:684
    target.AddSpell(teleportInSpell, True) ; #DEBUG_LINE_NO:685
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TeleportOut(Actor target, Spell teleportInSpell, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay, Bool shouldDisable)
  If target != None ; #DEBUG_LINE_NO:690
    If teleportInSpell == None ; #DEBUG_LINE_NO:691
      teleportInSpell = LC165_AbTeleportSwapIn ; #DEBUG_LINE_NO:692
    EndIf ; #DEBUG_LINE_NO:
    If teleportOutSpell == None ; #DEBUG_LINE_NO:694
      teleportOutSpell = LC165_AbTeleportSwapOut ; #DEBUG_LINE_NO:695
    EndIf ; #DEBUG_LINE_NO:
    If teleportOutExplosion != None ; #DEBUG_LINE_NO:698
      target.PlaceAtMe(teleportOutExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:699
    EndIf ; #DEBUG_LINE_NO:
    target.RemoveSpell(teleportInSpell) ; #DEBUG_LINE_NO:701
    target.AddSpell(teleportOutSpell, True) ; #DEBUG_LINE_NO:702
    Utility.Wait(teleportOutSpellDelay) ; #DEBUG_LINE_NO:703
    If shouldDisable ; #DEBUG_LINE_NO:704
      target.Disable(False) ; #DEBUG_LINE_NO:705
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, Float minDistance, Float maxDistance, Bool allowZOffset, Bool alwaysInFront, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  If !actorToTeleport.IsDead() ; #DEBUG_LINE_NO:711
    Float[] akOffsets = new Float[3] ; #DEBUG_LINE_NO:712
    ObjectReference target = sourceRef.PlaceAtMe(XMarker as Form, 1, False, False, True, akOffsets, None, True) ; #DEBUG_LINE_NO:713
    If minDistance > 0.0 || maxDistance > 0.0 ; #DEBUG_LINE_NO:714
      target.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:715
    EndIf ; #DEBUG_LINE_NO:
    Self.CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay) ; #DEBUG_LINE_NO:717
    target.Delete() ; #DEBUG_LINE_NO:718
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, Bool shouldBeInvisibleAfterTeleport, Spell teleportInSpell, Explosion teleportInExplosion, Spell teleportOutSpell, Explosion teleportOutExplosion, Float teleportOutSpellDelay)
  Self.TeleportOut(actorToTeleport, teleportInSpell, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, False) ; #DEBUG_LINE_NO:723
  actorToTeleport.MoveTo(target, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:724
  Self.TeleportIn(actorToTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell) ; #DEBUG_LINE_NO:725
EndFunction

;-- State -------------------------------------------
State Busy

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String oldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnEndState(String newState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:273
    If akSource == TestSteveCBossChest ; #DEBUG_LINE_NO:274
      TestSteveCOnActivateEventMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:275
    ElseIf akSource == TestSteveCAmbushLeverRef ; #DEBUG_LINE_NO:276
      If TestSteveCAmbushMarkerRef.IsDisabled() ; #DEBUG_LINE_NO:277
        TestSteveCAmbushMarkerRef.Enable(False) ; #DEBUG_LINE_NO:278
      Else ; #DEBUG_LINE_NO:
        TestSteveCAmbushMarkerRef.Disable(False) ; #DEBUG_LINE_NO:280
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      If TestActivators.Find(akSource) >= 0 ; #DEBUG_LINE_NO:284
        TestActivators.RemoveRef(akSource) ; #DEBUG_LINE_NO:285
        currentActivatorCount += 1 ; #DEBUG_LINE_NO:286
      Else ; #DEBUG_LINE_NO:
        TestActivators.AddRef(akSource) ; #DEBUG_LINE_NO:288
        currentActivatorCount -= 1 ; #DEBUG_LINE_NO:289
      EndIf ; #DEBUG_LINE_NO:
      Self.UpdateActivatorCount() ; #DEBUG_LINE_NO:291
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(5.0) ; #DEBUG_LINE_NO:293
    Self.GoToState("Waiting") ; #DEBUG_LINE_NO:294
  EndEvent
EndState
