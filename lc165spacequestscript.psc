ScriptName LC165SpaceQuestScript Extends Quest
{ One of the quest scripts for LC165, Buried Temple. Handles the space encounter at the beginning of the quest. }

;-- Variables ---------------------------------------
Float CONST_AdversaryShipRetreatHealthPercent = 0.400000006 Const
Float CONST_AllyAppearsDelay = 3.0 Const
Int CONST_AllySpawnTimerID = 1 Const
Float CONST_InitialCloakingDelayMax = 0.5 Const
Float CONST_InitialCloakingDelayMin = 0.25 Const
Float CONST_InitialSpawnDelayMax = 0.5 Const
Float CONST_InitialSpawnDelayMin = 0.25 Const
Int CONST_LevelMod_Medium = 1 Const
Float CONST_ReinforcementSpawnDelayMax = 1.5 Const
Float CONST_ReinforcementSpawnDelayMin = 0.5 Const
Int CONST_ShipDockingPermission_Never = 4 Const
Int CONST_Stage_AdversaryShipRetreatedStage = 180 Const
Int CONST_Stage_AllyShipEnabledStage = 150 Const
Int CONST_Stage_ReinforcementsFinishedSpawningStage = 131 Const
Int CONST_Stage_SpaceBattleCompletedStage = 190 Const
Int CONST_Stage_SpaceBattleStartedStage = 110 Const
Int CONST_Stage_SpawnReinforcementsStage = 130 Const
Float adversary01ShipBaseHealth
spaceshipreference adversary01ShipRef
Bool adversary01ShipRetreated
Float adversary02ShipBaseHealth
spaceshipreference adversary02ShipRef
Bool adversary02ShipRetreated
spaceshipreference allyShipRef
Bool hasEnabledAllyShip
Actor player
ObjectReference spaceHoldPositionTriggerRef
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForAdversaryRetreat

;-- Properties --------------------------------------
Group QuestProperties
  spaceshipbase Property QuickstartShip Auto Const mandatory
  { If the player is not in a ship when the space quickstart is run, spawn this ship and force them into it. }
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property AllyShip Auto Const mandatory
  ReferenceAlias Property Adversary01Ship Auto Const mandatory
  ReferenceAlias Property Adversary02Ship Auto Const mandatory
  ReferenceAlias Property AdversaryShipStartMarker Auto Const mandatory
  ReferenceAlias Property Adversary01ShipStartMarker Auto Const mandatory
  ReferenceAlias Property Adversary02ShipStartMarker Auto Const mandatory
  ReferenceAlias Property GenericShipSpawnPoint01Marker Auto Const mandatory
  ReferenceAlias Property GenericShipSpawnPoint02Marker Auto Const mandatory
  ReferenceAlias Property SpaceHoldPositionTrigger Auto Const mandatory
  RefCollectionAlias Property InitialGenericShips Auto Const mandatory
  RefCollectionAlias Property ReinforcementGenericShips Auto Const mandatory
  RefCollectionAlias Property AllShips Auto Const mandatory
  MusicType Property MUSGenesisCombatBoss_MQ302_SpaceBattle Auto Const mandatory
  ObjectReference Property NewGameShipMarkerRef Auto Const mandatory
  spaceshipbase Property LC165_LvlStarbornShip Auto Const mandatory
  Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
  Faction Property PlayerFriendFaction Auto Const mandatory
  Perk Property Piloting Auto Const mandatory
  Spell Property AbStarbornShipCloaking Auto Const mandatory
  Keyword Property DMP_Combat_HoldPosition Auto Const mandatory
  GlobalVariable Property MQ302B_AllyShipSpawnDelay Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:92
  spaceHoldPositionTriggerRef = SpaceHoldPositionTrigger.GetRef() ; #DEBUG_LINE_NO:93
EndEvent

Function QuickstartToSpace()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:97
  If playerShipRef == None ; #DEBUG_LINE_NO:98
    inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:100
    myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:101
    spaceshipreference testShip = NewGameShipMarkerRef.PlaceShipAtMe(QuickstartShip as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:102
    SQ_PlayerShip.ResetPlayerShip(testShip) ; #DEBUG_LINE_NO:103
    SQ_PlayerShip.ResetHomeShip(testShip) ; #DEBUG_LINE_NO:104
    player.AddPerk(Piloting, False) ; #DEBUG_LINE_NO:105
    player.AddPerk(Piloting, False) ; #DEBUG_LINE_NO:106
    player.AddPerk(Piloting, False) ; #DEBUG_LINE_NO:107
    player.AddPerk(Piloting, False) ; #DEBUG_LINE_NO:108
    player.MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:109
    SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:110
    PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False) ; #DEBUG_LINE_NO:111
    myEnableLayer.Delete() ; #DEBUG_LINE_NO:112
    waitingForPlayerToSit = True ; #DEBUG_LINE_NO:113
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:114
    While waitingForPlayerToSit ; #DEBUG_LINE_NO:
      Utility.Wait(0.5) ; #DEBUG_LINE_NO:116
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False ; #DEBUG_LINE_NO:122
EndEvent

Function SetupSpaceEncounter()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:132
  adversary01ShipRef = Adversary01Ship.GetShipRef() ; #DEBUG_LINE_NO:133
  adversary01ShipRef.Reset(None) ; #DEBUG_LINE_NO:134
  adversary01ShipBaseHealth = adversary01ShipRef.GetBaseValue(Health) ; #DEBUG_LINE_NO:135
  adversary02ShipRef = Adversary02Ship.GetShipRef() ; #DEBUG_LINE_NO:136
  If adversary02ShipRef == None ; #DEBUG_LINE_NO:138
    Self.Private_SetupAdversaryShip(adversary01ShipRef, AdversaryShipStartMarker.GetRef()) ; #DEBUG_LINE_NO:140
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax)) ; #DEBUG_LINE_NO:141
    Self.Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium) ; #DEBUG_LINE_NO:142
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax)) ; #DEBUG_LINE_NO:143
    Self.Private_SetupGenericShip(GenericShipSpawnPoint02Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium) ; #DEBUG_LINE_NO:144
  Else ; #DEBUG_LINE_NO:
    adversary02ShipRef.Reset(None) ; #DEBUG_LINE_NO:149
    adversary02ShipBaseHealth = adversary02ShipRef.GetBaseValue(Health) ; #DEBUG_LINE_NO:150
    Self.Private_SetupAdversaryShip(adversary01ShipRef, Adversary01ShipStartMarker.GetRef()) ; #DEBUG_LINE_NO:151
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax)) ; #DEBUG_LINE_NO:152
    Self.Private_SetupAdversaryShip(adversary02ShipRef, Adversary02ShipStartMarker.GetRef()) ; #DEBUG_LINE_NO:153
    Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax)) ; #DEBUG_LINE_NO:154
    Self.Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_SetupAdversaryShip(spaceshipreference ship, ObjectReference startMarker)
  ship.Disable(False) ; #DEBUG_LINE_NO:163
  ship.MoveTo(startMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:164
  ship.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:165
  ship.SetValue(DockingPermission, CONST_ShipDockingPermission_Never as Float) ; #DEBUG_LINE_NO:166
  ship.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition, True) ; #DEBUG_LINE_NO:167
  ship.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:168
  AllShips.AddRef(ship as ObjectReference) ; #DEBUG_LINE_NO:169
  Self.RegisterForHitEvent(ship as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:170
  Self.RegisterForRemoteEvent(ship as ScriptObject, "OnEnterBleedout") ; #DEBUG_LINE_NO:171
  ship.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:172
EndFunction

Function Private_SetupGenericShip(ObjectReference shipSpawnMarker, spaceshipbase shipBase, Int shipLevelMod)
  spaceshipreference genericShipRef = shipSpawnMarker.PlaceShipAtMe(shipBase as Form, shipLevelMod, True, False, True, True, None, None, None, True) ; #DEBUG_LINE_NO:177
  genericShipRef.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition, True) ; #DEBUG_LINE_NO:178
  genericShipRef.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:179
  InitialGenericShips.AddRef(genericShipRef as ObjectReference) ; #DEBUG_LINE_NO:180
  AllShips.AddRef(genericShipRef as ObjectReference) ; #DEBUG_LINE_NO:181
  Self.RegisterForRemoteEvent(genericShipRef as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:182
  genericShipRef.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:183
EndFunction

Function ForceCloakStarbornShips()
  spaceshipreference[] initialGenericShipRefs = InitialGenericShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:189
  Int I = 0 ; #DEBUG_LINE_NO:190
  While I < initialGenericShipRefs.Length ; #DEBUG_LINE_NO:191
    initialGenericShipRefs[I].AddSpell(AbStarbornShipCloaking, True) ; #DEBUG_LINE_NO:192
    Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax)) ; #DEBUG_LINE_NO:193
    I += 1 ; #DEBUG_LINE_NO:194
  EndWhile ; #DEBUG_LINE_NO:
  adversary01ShipRef.AddSpell(AbStarbornShipCloaking, True) ; #DEBUG_LINE_NO:196
  If adversary02ShipRef != None ; #DEBUG_LINE_NO:197
    Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax)) ; #DEBUG_LINE_NO:198
    adversary02ShipRef.AddSpell(AbStarbornShipCloaking, True) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartSpaceEncounter()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:205
  MUSGenesisCombatBoss_MQ302_SpaceBattle.Add() ; #DEBUG_LINE_NO:206
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:207
  adversary01ShipRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:208
  adversary01ShipRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:209
  adversary01ShipRef.StartCombat(playerShipRef, False) ; #DEBUG_LINE_NO:210
  adversary01ShipRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:211
  If adversary02ShipRef != None ; #DEBUG_LINE_NO:212
    adversary02ShipRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:213
    adversary02ShipRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:214
    adversary02ShipRef.StartCombat(playerShipRef, False) ; #DEBUG_LINE_NO:215
    adversary02ShipRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:218
  spaceshipreference[] initialGenericShipRefs = InitialGenericShips.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:219
  While I < initialGenericShipRefs.Length ; #DEBUG_LINE_NO:220
    initialGenericShipRefs[I].RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:221
    initialGenericShipRefs[I].StartCombat(playerShipRef, False) ; #DEBUG_LINE_NO:222
    initialGenericShipRefs[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:223
    I += 1 ; #DEBUG_LINE_NO:224
  EndWhile ; #DEBUG_LINE_NO:
  Self.StartTimer(MQ302B_AllyShipSpawnDelay.GetValue(), CONST_AllySpawnTimerID) ; #DEBUG_LINE_NO:226
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_AllySpawnTimerID ; #DEBUG_LINE_NO:230
    If PlayerShip.GetShipRef().GetCurrentLocation() == LC165BuriedTempleSpaceLocation ; #DEBUG_LINE_NO:231
      Self.EnablePlayerAllyShip() ; #DEBUG_LINE_NO:232
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID) ; #DEBUG_LINE_NO:234
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function EndSpaceEncounter()
  MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove() ; #DEBUG_LINE_NO:241
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC165BuriedTempleSpaceLocation && Self.GetStageDone(CONST_Stage_SpaceBattleStartedStage) && !Self.GetStageDone(CONST_Stage_SpaceBattleCompletedStage) ; #DEBUG_LINE_NO:245
    MUSGenesisCombatBoss_MQ302_SpaceBattle.Add() ; #DEBUG_LINE_NO:246
  ElseIf akOldLoc == LC165BuriedTempleSpaceLocation ; #DEBUG_LINE_NO:247
    MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove() ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnDying(spaceshipreference akSource, ObjectReference akKiller)
  If !Self.GetStageDone(CONST_Stage_SpawnReinforcementsStage) ; #DEBUG_LINE_NO:255
    Self.SetStage(CONST_Stage_SpawnReinforcementsStage) ; #DEBUG_LINE_NO:256
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnSpaceEncounterReinforcements()
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:261
  If adversary02ShipRef == None ; #DEBUG_LINE_NO:262
    Self.SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage) ; #DEBUG_LINE_NO:271
    If !hasEnabledAllyShip ; #DEBUG_LINE_NO:274
      Self.StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID) ; #DEBUG_LINE_NO:275
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage) ; #DEBUG_LINE_NO:284
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnablePlayerAllyShip()
  If !hasEnabledAllyShip ; #DEBUG_LINE_NO:289
    hasEnabledAllyShip = True ; #DEBUG_LINE_NO:290
    allyShipRef = AllyShip.GetShipRef() ; #DEBUG_LINE_NO:292
    If allyShipRef != None ; #DEBUG_LINE_NO:293
      allyShipRef.MoveNear(PlayerShip.GetShipRef() as ObjectReference, allyShipRef.CONST_NearPosition_ForwardWide, allyShipRef.CONST_NearDistance_Close, allyShipRef.CONST_NearFacing_AwaySmall) ; #DEBUG_LINE_NO:294
      allyShipRef.SetValue(DockingPermission, CONST_ShipDockingPermission_Never as Float) ; #DEBUG_LINE_NO:295
      allyShipRef.EnableWithGravJump() ; #DEBUG_LINE_NO:296
      AllShips.AddRef(allyShipRef as ObjectReference) ; #DEBUG_LINE_NO:297
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(CONST_Stage_AllyShipEnabledStage) ; #DEBUG_LINE_NO:300
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Bool retreated = Self.CheckForAdversaryRetreat(akTarget as spaceshipreference, -1.0) ; #DEBUG_LINE_NO:319
  If !retreated ; #DEBUG_LINE_NO:320
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:321
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnEnterBleedout(spaceshipreference akSource)
  Self.CheckForAdversaryRetreat(akSource, 0.0) ; #DEBUG_LINE_NO:326
EndEvent

Bool Function CheckForAdversaryRetreat(spaceshipreference ship, Float overrideHealthPercent)
  Bool shipRetreated = False ; #DEBUG_LINE_NO:331
  Guard CheckForAdversaryRetreat ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:333
    If ship == adversary01ShipRef ; #DEBUG_LINE_NO:335
      Float adversary01ShipHealthPercent = adversary01ShipRef.GetValue(Health) / adversary01ShipBaseHealth ; #DEBUG_LINE_NO:336
      If overrideHealthPercent >= 0.0 ; #DEBUG_LINE_NO:337
        adversary01ShipHealthPercent = overrideHealthPercent ; #DEBUG_LINE_NO:338
      EndIf ; #DEBUG_LINE_NO:
      If adversary01ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent ; #DEBUG_LINE_NO:340
        shipRetreated = True ; #DEBUG_LINE_NO:341
        adversary01ShipRetreated = True ; #DEBUG_LINE_NO:342
        If adversary01ShipRef.Is3DLoaded() ; #DEBUG_LINE_NO:343
          adversary01ShipRef.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:344
        Else ; #DEBUG_LINE_NO:
          adversary01ShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:346
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf ship == adversary02ShipRef ; #DEBUG_LINE_NO:349
      Float adversary02ShipHealthPercent = adversary02ShipRef.GetValue(Health) / adversary02ShipBaseHealth ; #DEBUG_LINE_NO:350
      If overrideHealthPercent >= 0.0 ; #DEBUG_LINE_NO:351
        adversary02ShipHealthPercent = overrideHealthPercent ; #DEBUG_LINE_NO:352
      EndIf ; #DEBUG_LINE_NO:
      If adversary02ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent ; #DEBUG_LINE_NO:354
        shipRetreated = True ; #DEBUG_LINE_NO:355
        adversary02ShipRetreated = True ; #DEBUG_LINE_NO:356
        If adversary02ShipRef.Is3DLoaded() ; #DEBUG_LINE_NO:357
          adversary02ShipRef.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:358
        Else ; #DEBUG_LINE_NO:
          adversary02ShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:360
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If adversary01ShipRetreated && (adversary02ShipRef == None || adversary02ShipRetreated) ; #DEBUG_LINE_NO:366
      Self.SetStage(CONST_Stage_AdversaryShipRetreatedStage) ; #DEBUG_LINE_NO:367
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Return shipRetreated ; #DEBUG_LINE_NO:371
EndFunction
