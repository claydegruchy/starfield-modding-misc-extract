ScriptName OE_ShipsAddonScript Extends Quest
{ Must be used with OEScript. }

;-- Structs -----------------------------------------
Struct LandingMarkerDatum
  ReferenceAlias LandingMarkerAlias hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ObjectReference LandingMarkerREF hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ReferenceAlias LandedShipAlias hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  Int ShipDatumIndex = -1 hidden
  { Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
EndStruct

Struct ShipDatum
  spaceshipbase ShipToSpawn
  { SpaceshipBase may be templated to a leveled list of ships. If blank, will attempt to get ship from DefaultGroupSpawnQuestScript. }
  Int SpawnGroupID = 0
  { if ShipToSpawn is blank, use this groupID to get a ship from DefaultGroupSpawnQuestScript. }
  GlobalVariable SpawnGroupShipType
  { can be used to specify a specific type of ship from DefaultGroupSpawnQuestScript.
        Filter on SQ_Group_SpawnType_Ship* }
  conditionform SpawnConditions
  { Conditions must be True at the time of spawning for the ship to spawn. }
  conditionform LaunchConditions
  { If blank, ship will launch when LaunchShip() is called. If filled, when LaunchShip() is called, the ship's LaunchConditions must also be met. }
  Int ShipLevelMod = 1
  { Default=1 (Medium). The aiLevelMod of the spawned spaceship; 0=Easy, 1=Medium, 2=Hard, 3=Boss. }
  Bool TryToStartLanded = False
  { DEFAULT=False. 
        Spaceship starts the quest while landed, if a marker exists. 
        When markers are exhausted, ships may still spawn and land later, if it works out.
        These are considered in order of top to bottom, so the last Ship with this set to True gets whatever marker is left, if any. }
  GlobalVariable LockLevel
  { Filter for: LockLevel_* }
  ReferenceAlias ShipOwner
  { if ShipOwner will be used to set ownership on the ship and doors }
  Faction ShipFaction
  { if ShipOwner is not set, ShipFaction will be used to set ownership on the ship and doors }
  Bool hasLanded = False hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  spaceshipreference SpaceshipREF hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  ObjectReference LandingMarkerREF hidden
  { Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible. }
  Int StageToSetOnLanding = -1
  { set this stage when this ship lands }
  Int StageToSetOnTakeoff = -1
  { set this stage when this ship takes off }
  Int StageToSetOnPlayerBoarding = -1
  { set this stage when this ship is boarded by the player }
  Bool StopQuestIfPlayerHomeShip = True
  { if true, stop my quest if this ship becomes the player's home ship (meaning they stole it) }
EndStruct


;-- Variables ---------------------------------------
oe_shipsaddonscript:landingmarkerdatum[] LandingMarkerData
Actor PlayerREF
spaceshipreference[] gLandedShipRefsArray
Int[] gLandingShipsArray
Int[] gStartLandedShipsArray
Bool gbEnableShips = False
Bool gbStartLandedMode = True
Bool initialized = False

;-- Properties --------------------------------------
Group Ships
  oe_shipsaddonscript:shipdatum[] Property ShipData Auto
  { These ships are eligible to start landed or land during the encounter. }
  Bool Property TryToUseAllStartLandedShips = True Auto Const
  { DEFAULT=True. If there are more ships with TryToStartLanded=True than Landing Markers, the ships not selected to Start Landed will be available to 
        land later unless this is marked as False. Ships will still need to pass the conditions to land later. }
  Bool Property RandomizeStartLandedShips = True Auto Const
  { DEFAULT=True. If multiple ships are set to TryToStartLanded=True then pick from the TryToStartLanded ships with true conditions randomly until there
        are no more Landing Markers. 
        FALSE=Picks in the order that they are entered into the array, if conditions are met. }
  Bool Property RandomizeLandingShips = True Auto Const
  { DEFAULT=TRUE. When ships land after the start of the quest, any available ship that hasn't already landed is eligible to land.
        FALSE=Selects the next landing ship in order in the array, if conditions are met. }
  Int Property minShipsStartLanded = 1 Auto
  { Minimum number of ships to Start Landed. Ships must exist with the TryToStartLanded flag set to True to be eligible.
    If 2 ships are desired, set min and max to 2. }
  Int Property maxShipsStartLanded = 3 Auto
  { This is how many ships will start landed, at max. Ships must exist with the TryToStartLanded flag set to True to be eligible. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property Marker_ShipLandingA Auto Const mandatory
  ReferenceAlias Property Marker_ShipLandingB Auto Const
  ReferenceAlias Property Marker_ShipLandingC Auto Const
  ReferenceAlias Property ShipA Auto Const
  ReferenceAlias Property ShipB Auto Const
  ReferenceAlias Property ShipC Auto Const
  Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
  Keyword Property OEShipStartsLandedKeyword Auto Const mandatory
  Keyword Property OELinkLandingMarkerKeyword Auto Const mandatory
  Keyword Property SpaceshipLinkedInterior Auto Const mandatory
  GlobalVariable Property LockLevel_Inaccessible Auto Const mandatory
  GlobalVariable Property LockLevel_Master Auto Const mandatory
  GlobalVariable Property LockLevel_Expert Auto Const mandatory
  GlobalVariable Property LockLevel_Advanced Auto Const mandatory
  GlobalVariable Property LockLevel_Novice Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
EndGroup

String Property LocalScriptName = "OE_ShipsAddonScript" Auto Const
{ Name of the local script. Don't modify. }
String Property MainLogName = "OE" Auto Const hidden
{ OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User }
String Property SubLogName = "Ships" Auto Const hidden
{ OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues. }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  String FunctionName = "OnQuestStarted()" ; #DEBUG_LINE_NO:127
  PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:128
  gStartLandedShipsArray = new Int[0] ; #DEBUG_LINE_NO:131
  gLandingShipsArray = new Int[0] ; #DEBUG_LINE_NO:132
  gLandedShipRefsArray = new spaceshipreference[ShipData.Length] ; #DEBUG_LINE_NO:133
  gbStartLandedMode = True ; #DEBUG_LINE_NO:134
  gbEnableShips = False ; #DEBUG_LINE_NO:135
  LandingMarkerData = new oe_shipsaddonscript:landingmarkerdatum[0] ; #DEBUG_LINE_NO:138
  gbEnableShips = Self.ErrorCheck() ; #DEBUG_LINE_NO:144
  Self.SetupLandingMarkers() ; #DEBUG_LINE_NO:147
  Self.SetupStartLandedShips() ; #DEBUG_LINE_NO:150
  Self.SetupLandingShips() ; #DEBUG_LINE_NO:153
  Self.SpawnStartLandedShips() ; #DEBUG_LINE_NO:156
  initialized = True ; #DEBUG_LINE_NO:161
EndEvent

Bool Function ErrorCheck()
  String FunctionName = "ErrorCheck()" ; #DEBUG_LINE_NO:168
  Int ShipDataIndex = 0 ; #DEBUG_LINE_NO:169
  Int enabledMarkers = 0 ; #DEBUG_LINE_NO:170
  Int numShips = 0 ; #DEBUG_LINE_NO:171
  Int index = 0 ; #DEBUG_LINE_NO:172
  If ShipData.Length <= 0 ; #DEBUG_LINE_NO:175
    Return False ; #DEBUG_LINE_NO:177
  Else ; #DEBUG_LINE_NO:
    If ShipA != None ; #DEBUG_LINE_NO:180
      ShipA.Clear() ; #DEBUG_LINE_NO:181
    EndIf ; #DEBUG_LINE_NO:
    If ShipB != None ; #DEBUG_LINE_NO:184
      ShipB.Clear() ; #DEBUG_LINE_NO:185
    EndIf ; #DEBUG_LINE_NO:
    If ShipC != None ; #DEBUG_LINE_NO:188
      ShipC.Clear() ; #DEBUG_LINE_NO:189
    EndIf ; #DEBUG_LINE_NO:
    If Marker_ShipLandingA != None && Marker_ShipLandingA.GetRef() != None ; #DEBUG_LINE_NO:193
      enabledMarkers += 1 ; #DEBUG_LINE_NO:194
    EndIf ; #DEBUG_LINE_NO:
    If Marker_ShipLandingB != None && Marker_ShipLandingB.GetRef() != None ; #DEBUG_LINE_NO:197
      enabledMarkers += 1 ; #DEBUG_LINE_NO:198
    EndIf ; #DEBUG_LINE_NO:
    If Marker_ShipLandingC != None && Marker_ShipLandingC.GetRef() != None ; #DEBUG_LINE_NO:201
      enabledMarkers += 1 ; #DEBUG_LINE_NO:202
    EndIf ; #DEBUG_LINE_NO:
    If enabledMarkers == 0 ; #DEBUG_LINE_NO:206
      Return False ; #DEBUG_LINE_NO:208
    EndIf ; #DEBUG_LINE_NO:
    numShips = ShipData.Length ; #DEBUG_LINE_NO:212
    If numShips < 1 ; #DEBUG_LINE_NO:213
      Return False ; #DEBUG_LINE_NO:215
    EndIf ; #DEBUG_LINE_NO:
    defaultgroupspawnquestscript myGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:218
    While ShipDataIndex < numShips ; #DEBUG_LINE_NO:221
      oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex] ; #DEBUG_LINE_NO:222
      If theShipDatum.hasLanded ; #DEBUG_LINE_NO:224
        theShipDatum.hasLanded = False ; #DEBUG_LINE_NO:225
      EndIf ; #DEBUG_LINE_NO:
      If (myGroupSpawnQuest as Bool && theShipDatum.ShipFaction == None) && theShipDatum.ShipOwner == None ; #DEBUG_LINE_NO:229
        theShipDatum.ShipFaction = myGroupSpawnQuest.GetGroupOwnershipFaction(theShipDatum.SpawnGroupID) ; #DEBUG_LINE_NO:230
      EndIf ; #DEBUG_LINE_NO:
      ShipDataIndex += 1 ; #DEBUG_LINE_NO:234
    EndWhile ; #DEBUG_LINE_NO:
    Self._ResetLandingMarkers() ; #DEBUG_LINE_NO:238
  EndIf ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:242
EndFunction

Function SetupLandingMarkers()
  String FunctionName = "SetupLandingMarkers()" ; #DEBUG_LINE_NO:249
  Bool MarkerStatus = False ; #DEBUG_LINE_NO:250
  If !gbEnableShips ; #DEBUG_LINE_NO:253
    Return  ; #DEBUG_LINE_NO:254
  EndIf ; #DEBUG_LINE_NO:
  Self._SetupLandingMarker(Marker_ShipLandingA, ShipA) ; #DEBUG_LINE_NO:258
  Self._SetupLandingMarker(Marker_ShipLandingB, ShipB) ; #DEBUG_LINE_NO:259
  Self._SetupLandingMarker(Marker_ShipLandingC, ShipC) ; #DEBUG_LINE_NO:260
  If LandingMarkerData.Length > 0 ; #DEBUG_LINE_NO:263
    MarkerStatus = True ; #DEBUG_LINE_NO:264
    minShipsStartLanded = Math.Clamp(minShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int ; #DEBUG_LINE_NO:266
    maxShipsStartLanded = Math.Clamp(maxShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
  If MarkerStatus ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  gbEnableShips = MarkerStatus ; #DEBUG_LINE_NO:278
EndFunction

Function _SetupLandingMarker(ReferenceAlias akRefAlias, ReferenceAlias akShipAlias)
  If akRefAlias as Bool && akRefAlias.GetRef() as Bool ; #DEBUG_LINE_NO:283
    oe_shipsaddonscript:landingmarkerdatum temp = new oe_shipsaddonscript:landingmarkerdatum ; #DEBUG_LINE_NO:284
    temp.LandingMarkerAlias = akRefAlias ; #DEBUG_LINE_NO:286
    temp.LandedShipAlias = akShipAlias ; #DEBUG_LINE_NO:287
    LandingMarkerData.add(temp, 1) ; #DEBUG_LINE_NO:289
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupStartLandedShips()
  String FunctionName = "SetupStartLandedShips()" ; #DEBUG_LINE_NO:298
  Int[] allStartLandedShips = new Int[0] ; #DEBUG_LINE_NO:299
  Bool enableStartLandedMode = True ; #DEBUG_LINE_NO:300
  Int allowedLandingMarkers = 0 ; #DEBUG_LINE_NO:301
  Int StartLandedShipsIndex = 0 ; #DEBUG_LINE_NO:302
  Int ShipDataIndex = 0 ; #DEBUG_LINE_NO:303
  Int index = 0 ; #DEBUG_LINE_NO:304
  If !gbEnableShips ; #DEBUG_LINE_NO:307
    Return  ; #DEBUG_LINE_NO:308
  EndIf ; #DEBUG_LINE_NO:
  allStartLandedShips = Self._GetAllStartLandedShips() ; #DEBUG_LINE_NO:312
  allowedLandingMarkers = Utility.RandomInt(minShipsStartLanded, maxShipsStartLanded) ; #DEBUG_LINE_NO:313
  If !gbStartLandedMode ; #DEBUG_LINE_NO:316
    Return  ; #DEBUG_LINE_NO:318
  EndIf ; #DEBUG_LINE_NO:
  If allStartLandedShips.Length < 1 ; #DEBUG_LINE_NO:328
     ; #DEBUG_LINE_NO:
  ElseIf allowedLandingMarkers < 1 ; #DEBUG_LINE_NO:332
    While index < ShipData.Length ; #DEBUG_LINE_NO:334
      If TryToUseAllStartLandedShips ; #DEBUG_LINE_NO:335
        ShipData[index].TryToStartLanded = False ; #DEBUG_LINE_NO:337
      EndIf ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:339
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If allowedLandingMarkers < allStartLandedShips.Length ; #DEBUG_LINE_NO:344
      While index < allStartLandedShips.Length && allowedLandingMarkers > 0 ; #DEBUG_LINE_NO:349
        If RandomizeStartLandedShips ; #DEBUG_LINE_NO:351
          StartLandedShipsIndex = Utility.RandomInt(0, allStartLandedShips.Length - 1) ; #DEBUG_LINE_NO:352
        Else ; #DEBUG_LINE_NO:
          StartLandedShipsIndex = index ; #DEBUG_LINE_NO:355
        EndIf ; #DEBUG_LINE_NO:
        ShipDataIndex = allStartLandedShips[StartLandedShipsIndex] ; #DEBUG_LINE_NO:360
        gStartLandedShipsArray.add(ShipDataIndex, 1) ; #DEBUG_LINE_NO:364
        allStartLandedShips.remove(index, 1) ; #DEBUG_LINE_NO:367
        allowedLandingMarkers -= 1 ; #DEBUG_LINE_NO:370
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      gStartLandedShipsArray = Self.CopyIntArray(allStartLandedShips, "gStartLandedShipsArray", "allStartLandedShips", FunctionName) ; #DEBUG_LINE_NO:378
      allStartLandedShips.clear() ; #DEBUG_LINE_NO:383
    EndIf ; #DEBUG_LINE_NO:
    If TryToUseAllStartLandedShips && allStartLandedShips.Length > 0 ; #DEBUG_LINE_NO:387
      While allStartLandedShips.Length > 0 ; #DEBUG_LINE_NO:388
        index = allStartLandedShips[0] ; #DEBUG_LINE_NO:389
        ShipData[index].TryToStartLanded = False ; #DEBUG_LINE_NO:391
        allStartLandedShips.remove(0, 1) ; #DEBUG_LINE_NO:392
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    allStartLandedShips.clear() ; #DEBUG_LINE_NO:397
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Int[] Function _GetAllStartLandedShips()
  String FunctionName = "GetAllStartLandedShips()" ; #DEBUG_LINE_NO:408
  Int[] potentialShips = new Int[0] ; #DEBUG_LINE_NO:409
  Int index = 0 ; #DEBUG_LINE_NO:410
  While index < ShipData.Length ; #DEBUG_LINE_NO:413
    If ShipData[index].TryToStartLanded ; #DEBUG_LINE_NO:414
      If Self._CanShipLand(index) ; #DEBUG_LINE_NO:416
        potentialShips.add(index, 1) ; #DEBUG_LINE_NO:418
      ElseIf TryToUseAllStartLandedShips ; #DEBUG_LINE_NO:
        ShipData[index].TryToStartLanded = False ; #DEBUG_LINE_NO:421
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:425
  EndWhile ; #DEBUG_LINE_NO:
  Return potentialShips ; #DEBUG_LINE_NO:428
EndFunction

Function SetupLandingShips()
  String FunctionName = "SetupLandingShips()" ; #DEBUG_LINE_NO:433
  Int ShipDataIndex = 0 ; #DEBUG_LINE_NO:434
  If !gbEnableShips ; #DEBUG_LINE_NO:437
    Return  ; #DEBUG_LINE_NO:438
  EndIf ; #DEBUG_LINE_NO:
  While ShipDataIndex < ShipData.Length ; #DEBUG_LINE_NO:441
    Bool hasLanded = ShipData[ShipDataIndex].hasLanded ; #DEBUG_LINE_NO:442
    Bool startsLanded = ShipData[ShipDataIndex].TryToStartLanded ; #DEBUG_LINE_NO:443
    If !hasLanded && !startsLanded ; #DEBUG_LINE_NO:449
      gLandingShipsArray.add(ShipDataIndex, 1) ; #DEBUG_LINE_NO:451
    EndIf ; #DEBUG_LINE_NO:
    ShipDataIndex += 1 ; #DEBUG_LINE_NO:453
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

spaceshipreference Function _LandSpecificShip(Int aiShipDataIndex)
  String FunctionName = "_LandSpecificShip()" ; #DEBUG_LINE_NO:463
  landingzonetriggerscript TriggerREF = None ; #DEBUG_LINE_NO:464
  ObjectReference LandingMarkerREF = None ; #DEBUG_LINE_NO:465
  spaceshipreference SpaceshipREF = None ; #DEBUG_LINE_NO:466
  Int ShipDataIndex = aiShipDataIndex ; #DEBUG_LINE_NO:467
  spaceshipbase Spaceship = None ; #DEBUG_LINE_NO:468
  Package RunningPackage = None ; #DEBUG_LINE_NO:469
  ReferenceAlias ShipAlias = None ; #DEBUG_LINE_NO:470
  Int LandingMarkerIndex = -1 ; #DEBUG_LINE_NO:471
  Int ShipLevelMod = 0 ; #DEBUG_LINE_NO:472
  LandingMarkerIndex = Self._GetLandingMarkerIndex(ShipDataIndex) ; #DEBUG_LINE_NO:477
  If LandingMarkerIndex > -1 ; #DEBUG_LINE_NO:480
    LandingMarkerREF = LandingMarkerData[LandingMarkerIndex].LandingMarkerAlias.GetRef() ; #DEBUG_LINE_NO:481
    TriggerREF = LandingMarkerREF.GetLinkedRef(LandingZoneTriggerKeyword) as landingzonetriggerscript ; #DEBUG_LINE_NO:482
  Else ; #DEBUG_LINE_NO:
    Return None ; #DEBUG_LINE_NO:485
  EndIf ; #DEBUG_LINE_NO:
  If LandingMarkerREF == None ; #DEBUG_LINE_NO:492
    Return None ; #DEBUG_LINE_NO:494
  EndIf ; #DEBUG_LINE_NO:
  If aiShipDataIndex > -1 && aiShipDataIndex < ShipData.Length ; #DEBUG_LINE_NO:498
    oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex] ; #DEBUG_LINE_NO:499
    If theShipDatum.ShipToSpawn == None ; #DEBUG_LINE_NO:502
      defaultgroupspawnquestscript myGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:504
      If myGroupSpawnQuest ; #DEBUG_LINE_NO:505
        theShipDatum.ShipToSpawn = myGroupSpawnQuest.GetShipToSpawnForGroup(theShipDatum.SpawnGroupID, LandingMarkerREF, theShipDatum.SpawnGroupShipType) ; #DEBUG_LINE_NO:506
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If theShipDatum.ShipToSpawn == None ; #DEBUG_LINE_NO:511
      Return None ; #DEBUG_LINE_NO:513
    EndIf ; #DEBUG_LINE_NO:
    Spaceship = theShipDatum.ShipToSpawn ; #DEBUG_LINE_NO:517
    ShipLevelMod = theShipDatum.ShipLevelMod ; #DEBUG_LINE_NO:518
    ShipAlias = LandingMarkerData[LandingMarkerIndex].LandedShipAlias ; #DEBUG_LINE_NO:519
    If gbStartLandedMode ; #DEBUG_LINE_NO:522
      SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship as Form, ShipLevelMod, False, False, True, True, None, ShipAlias as Alias, None, True) ; #DEBUG_LINE_NO:524
      If SpaceshipREF ; #DEBUG_LINE_NO:526
        SpaceshipREF.AddKeyword(OEShipStartsLandedKeyword) ; #DEBUG_LINE_NO:528
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship as Form, ShipLevelMod, False, False, True, True, None, ShipAlias as Alias, None, True) ; #DEBUG_LINE_NO:532
      If SpaceshipREF ; #DEBUG_LINE_NO:534
        SpaceshipREF.RemoveKeyword(OEShipStartsLandedKeyword) ; #DEBUG_LINE_NO:536
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If !SpaceshipREF ; #DEBUG_LINE_NO:541
      Return None ; #DEBUG_LINE_NO:543
    EndIf ; #DEBUG_LINE_NO:
    ShipAlias.RefillDependentAliases() ; #DEBUG_LINE_NO:549
    LandingMarkerData[LandingMarkerIndex].LandingMarkerREF = LandingMarkerREF ; #DEBUG_LINE_NO:552
    theShipDatum.SpaceshipREF = SpaceshipREF ; #DEBUG_LINE_NO:553
    LandingMarkerREF.SetLinkedRef(SpaceshipREF as ObjectReference, OELinkLandingMarkerKeyword, False) ; #DEBUG_LINE_NO:556
    SpaceshipREF.SetLinkedRef(LandingMarkerREF, OELinkLandingMarkerKeyword, False) ; #DEBUG_LINE_NO:557
    If theShipDatum.StageToSetOnLanding > -1 ; #DEBUG_LINE_NO:559
      Self.RegisterForRemoteEvent(SpaceshipREF as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:560
    EndIf ; #DEBUG_LINE_NO:
    If TriggerREF ; #DEBUG_LINE_NO:564
      TriggerREF.BeginLanding(SpaceshipREF, LandingMarkerREF) ; #DEBUG_LINE_NO:565
    EndIf ; #DEBUG_LINE_NO:
    If gbStartLandedMode ; #DEBUG_LINE_NO:568
      SpaceshipREF.Enable(False) ; #DEBUG_LINE_NO:570
      SpaceshipREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:573
      If theShipDatum.StageToSetOnLanding > -1 ; #DEBUG_LINE_NO:577
        Self.SetStage(theShipDatum.StageToSetOnLanding) ; #DEBUG_LINE_NO:578
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      SpaceshipREF.EnableWithLanding() ; #DEBUG_LINE_NO:582
    EndIf ; #DEBUG_LINE_NO:
    RunningPackage = SpaceshipREF.GetCurrentPackage() ; #DEBUG_LINE_NO:586
    If theShipDatum.StageToSetOnPlayerBoarding > -1 ; #DEBUG_LINE_NO:591
      Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnEnterShipInterior") ; #DEBUG_LINE_NO:592
    EndIf ; #DEBUG_LINE_NO:
    If theShipDatum.StopQuestIfPlayerHomeShip ; #DEBUG_LINE_NO:595
      Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnHomeShipSet") ; #DEBUG_LINE_NO:596
    EndIf ; #DEBUG_LINE_NO:
    theShipDatum.hasLanded = True ; #DEBUG_LINE_NO:600
    gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF ; #DEBUG_LINE_NO:601
    If gLandingShipsArray != None ; #DEBUG_LINE_NO:604
      gLandingShipsArray.remove(aiShipDataIndex, 1) ; #DEBUG_LINE_NO:605
    EndIf ; #DEBUG_LINE_NO:
    GlobalVariable gLockLevel = theShipDatum.LockLevel ; #DEBUG_LINE_NO:609
    Actor ShipOwner = None ; #DEBUG_LINE_NO:612
    Faction ShipFaction = None ; #DEBUG_LINE_NO:613
    If theShipDatum.ShipOwner ; #DEBUG_LINE_NO:614
      ShipOwner = theShipDatum.ShipOwner.GetActorRef() ; #DEBUG_LINE_NO:615
    EndIf ; #DEBUG_LINE_NO:
    If ShipOwner == None ; #DEBUG_LINE_NO:617
      ShipFaction = theShipDatum.ShipFaction ; #DEBUG_LINE_NO:618
    EndIf ; #DEBUG_LINE_NO:
    SpaceshipREF.SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:623
    If gLockLevel == None ; #DEBUG_LINE_NO:626
      SpaceshipREF.Unlock(True) ; #DEBUG_LINE_NO:627
      SpaceshipREF.Lock(False, True, True) ; #DEBUG_LINE_NO:628
    Else ; #DEBUG_LINE_NO:
      SpaceshipREF.Lock(True, True, True) ; #DEBUG_LINE_NO:630
      Self.LockShipDoors(SpaceshipREF, gLockLevel, ShipOwner, ShipFaction) ; #DEBUG_LINE_NO:631
    EndIf ; #DEBUG_LINE_NO:
    If ShipOwner as Bool || ShipFaction as Bool ; #DEBUG_LINE_NO:635
      Cell shipInterior = SpaceshipREF.GetLinkedCell(SpaceshipLinkedInterior) ; #DEBUG_LINE_NO:637
      If shipInterior ; #DEBUG_LINE_NO:638
        If ShipOwner ; #DEBUG_LINE_NO:639
          shipInterior.SetActorOwner(ShipOwner.GetLeveledActorBase()) ; #DEBUG_LINE_NO:640
        Else ; #DEBUG_LINE_NO:
          shipInterior.SetFactionOwner(ShipFaction) ; #DEBUG_LINE_NO:642
        EndIf ; #DEBUG_LINE_NO:
        shipInterior.SetPublic(True) ; #DEBUG_LINE_NO:644
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return SpaceshipREF ; #DEBUG_LINE_NO:653
EndFunction

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:658
    Int shipIndex = ShipData.findstruct("SpaceshipREF", akSource, 0) ; #DEBUG_LINE_NO:660
    If shipIndex > -1 ; #DEBUG_LINE_NO:661
      oe_shipsaddonscript:shipdatum theShipDatum = ShipData[shipIndex] ; #DEBUG_LINE_NO:662
      If theShipDatum.StageToSetOnLanding > -1 ; #DEBUG_LINE_NO:663
        Self.SetStage(theShipDatum.StageToSetOnLanding) ; #DEBUG_LINE_NO:665
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnEnterShipInterior(Actor akSource, ObjectReference akShip)
  Int shipIndex = ShipData.findstruct("SpaceshipREF", akShip as spaceshipreference, 0) ; #DEBUG_LINE_NO:673
  If shipIndex > -1 ; #DEBUG_LINE_NO:674
    If ShipData[shipIndex].StageToSetOnPlayerBoarding > -1 ; #DEBUG_LINE_NO:675
      Self.SetStage(ShipData[shipIndex].StageToSetOnPlayerBoarding) ; #DEBUG_LINE_NO:676
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, spaceshipreference akShip, spaceshipreference akPrevious)
  Int shipIndex = ShipData.findstruct("SpaceshipREF", akShip, 0) ; #DEBUG_LINE_NO:684
  If shipIndex > -1 ; #DEBUG_LINE_NO:685
    If ShipData[shipIndex].StopQuestIfPlayerHomeShip ; #DEBUG_LINE_NO:686
      Self.Stop() ; #DEBUG_LINE_NO:688
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnStartLandedShips()
  String FunctionName = "SpawnStartLandedShips()" ; #DEBUG_LINE_NO:696
  spaceshipreference SpaceshipREF = None ; #DEBUG_LINE_NO:697
  Int ShipDataIndex = -1 ; #DEBUG_LINE_NO:698
  Int index = 0 ; #DEBUG_LINE_NO:699
  If !gbStartLandedMode ; #DEBUG_LINE_NO:701
    Return  ; #DEBUG_LINE_NO:703
  EndIf ; #DEBUG_LINE_NO:
  While index < gStartLandedShipsArray.Length ; #DEBUG_LINE_NO:709
    ShipDataIndex = gStartLandedShipsArray[index] ; #DEBUG_LINE_NO:710
    SpaceshipREF = Self._LandSpecificShip(ShipDataIndex) ; #DEBUG_LINE_NO:711
    gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF ; #DEBUG_LINE_NO:712
    oe_shipsaddonscript:shipdatum theShipDatum = ShipData[ShipDataIndex] ; #DEBUG_LINE_NO:714
    index += 1 ; #DEBUG_LINE_NO:715
  EndWhile ; #DEBUG_LINE_NO:
  gStartLandedShipsArray.clear() ; #DEBUG_LINE_NO:719
  gbStartLandedMode = False ; #DEBUG_LINE_NO:720
EndFunction

Function LockShipDoors(spaceshipreference akSpaceship, GlobalVariable gLockLevel, Actor akShipOwner, Faction akShipFaction)
  ObjectReference[] ShipDoors = akSpaceship.GetExteriorLoadDoors() ; #DEBUG_LINE_NO:727
  Bool LockDoor = True ; #DEBUG_LINE_NO:728
  Int iLockLevel = 0 ; #DEBUG_LINE_NO:729
  Int I = 0 ; #DEBUG_LINE_NO:730
  If gLockLevel != None ; #DEBUG_LINE_NO:733
    iLockLevel = gLockLevel.GetValueInt() ; #DEBUG_LINE_NO:734
  EndIf ; #DEBUG_LINE_NO:
  While I < ShipDoors.Length ; #DEBUG_LINE_NO:741
    ObjectReference doorRef = ShipDoors[I] ; #DEBUG_LINE_NO:742
    doorRef.SetLockLevel(iLockLevel) ; #DEBUG_LINE_NO:743
    If akShipOwner ; #DEBUG_LINE_NO:745
      doorRef.SetActorRefOwner(akShipOwner, False) ; #DEBUG_LINE_NO:746
    ElseIf akShipFaction ; #DEBUG_LINE_NO:
      doorRef.SetFactionOwner(akShipFaction, False) ; #DEBUG_LINE_NO:748
    EndIf ; #DEBUG_LINE_NO:
    If iLockLevel == 0 ; #DEBUG_LINE_NO:750
      doorRef.Unlock(False) ; #DEBUG_LINE_NO:751
    Else ; #DEBUG_LINE_NO:
      doorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:753
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:756
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

spaceshipreference Function _LandShip(Int aiShipDataIndex)
  String FunctionName = "LandShip()" ; #DEBUG_LINE_NO:762
  Int ShipDataIndex = aiShipDataIndex ; #DEBUG_LINE_NO:763
  Int index = 0 ; #DEBUG_LINE_NO:764
  If ShipDataIndex > ShipData.Length ; #DEBUG_LINE_NO:769
    Return None ; #DEBUG_LINE_NO:771
  ElseIf ShipDataIndex < 0 ; #DEBUG_LINE_NO:772
    ShipDataIndex = Utility.RandomInt(0, gLandingShipsArray.Length) ; #DEBUG_LINE_NO:773
  EndIf ; #DEBUG_LINE_NO:
  Return Self._LandSpecificShip(ShipDataIndex) ; #DEBUG_LINE_NO:776
EndFunction

Int Function _GetLandingMarkerIndex(Int aiShipDataIndex)
  String FunctionName = "GetLandingMarkerIndex()" ; #DEBUG_LINE_NO:781
  Int index = 0 ; #DEBUG_LINE_NO:782
  While index < LandingMarkerData.Length ; #DEBUG_LINE_NO:786
    If LandingMarkerData[index].ShipDatumIndex < 0 ; #DEBUG_LINE_NO:788
      LandingMarkerData[index].ShipDatumIndex = aiShipDataIndex ; #DEBUG_LINE_NO:790
      Return index ; #DEBUG_LINE_NO:792
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:796
  EndWhile ; #DEBUG_LINE_NO:
  Return -1 ; #DEBUG_LINE_NO:801
EndFunction

Bool Function _CanShipLand(Int aiShipDataIndex)
  String FunctionName = "CanShipLand()" ; #DEBUG_LINE_NO:806
  Bool LandingConditions = False ; #DEBUG_LINE_NO:807
  If ShipData[aiShipDataIndex].hasLanded ; #DEBUG_LINE_NO:811
    Return False ; #DEBUG_LINE_NO:813
  ElseIf ShipData[aiShipDataIndex].SpawnConditions ; #DEBUG_LINE_NO:814
    LandingConditions = ShipData[aiShipDataIndex].SpawnConditions.IsTrue(None, None) ; #DEBUG_LINE_NO:815
    If !LandingConditions ; #DEBUG_LINE_NO:816
      Return False ; #DEBUG_LINE_NO:818
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:824
EndFunction

Bool Function _LaunchShip(Int aiShipDataIndex, spaceshipreference akSpaceship, Bool bForceLaunch)
  String FunctionName = "LaunchShip()" ; #DEBUG_LINE_NO:829
  Bool SuccessfullyLaunched = False ; #DEBUG_LINE_NO:830
  If aiShipDataIndex >= 0 && aiShipDataIndex < ShipData.Length ; #DEBUG_LINE_NO:833
    If gLandedShipRefsArray[aiShipDataIndex] != None ; #DEBUG_LINE_NO:834
      If !bForceLaunch && !Self._CanShipLaunch(aiShipDataIndex) ; #DEBUG_LINE_NO:836
         ; #DEBUG_LINE_NO:
      ElseIf SQ_PlayerShip.IsPlayerShip(gLandedShipRefsArray[aiShipDataIndex]) == False ; #DEBUG_LINE_NO:840
        gLandedShipRefsArray[aiShipDataIndex].TakeOff() ; #DEBUG_LINE_NO:843
        SuccessfullyLaunched = True ; #DEBUG_LINE_NO:844
        gLandedShipRefsArray[aiShipDataIndex] = None ; #DEBUG_LINE_NO:848
        Self._ReleaseLandingMarker(aiShipDataIndex) ; #DEBUG_LINE_NO:851
        If ShipData[aiShipDataIndex].StageToSetOnTakeoff > -1 ; #DEBUG_LINE_NO:854
          Self.SetStage(ShipData[aiShipDataIndex].StageToSetOnTakeoff) ; #DEBUG_LINE_NO:855
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSpaceship != None ; #DEBUG_LINE_NO:864
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return SuccessfullyLaunched ; #DEBUG_LINE_NO:869
EndFunction

Bool Function _CanShipLaunch(Int aiShipDataIndex)
  String FunctionName = "CanShipLaunch()" ; #DEBUG_LINE_NO:874
  Bool LaunchShip = False ; #DEBUG_LINE_NO:875
  oe_shipsaddonscript:shipdatum theShipDatum = ShipData[aiShipDataIndex] ; #DEBUG_LINE_NO:876
  spaceshipreference currentPlayerShip = Game.GetPlayer().GetCurrentShipRef() ; #DEBUG_LINE_NO:877
  If theShipDatum.hasLanded && (theShipDatum.LaunchConditions.IsTrue(None, None) || theShipDatum.LaunchConditions == None) ; #DEBUG_LINE_NO:879
    LaunchShip = True ; #DEBUG_LINE_NO:881
  EndIf ; #DEBUG_LINE_NO:
  Return LaunchShip ; #DEBUG_LINE_NO:886
EndFunction

Function _ResetLandingMarkers()
  Int index = 0 ; #DEBUG_LINE_NO:891
  If ShipData.Length > 0 && LandingMarkerData.Length > 0 ; #DEBUG_LINE_NO:893
    While index < LandingMarkerData.Length ; #DEBUG_LINE_NO:894
      LandingMarkerData[index].ShipDatumIndex = -1 ; #DEBUG_LINE_NO:895
      index += 1 ; #DEBUG_LINE_NO:896
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Int Function _ReleaseLandingMarker(Int aiShipDataIndex)
  Int iFound = LandingMarkerData.findstruct("ShipDatumIndex", aiShipDataIndex, 0) ; #DEBUG_LINE_NO:903
  If iFound > -1 ; #DEBUG_LINE_NO:904
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return iFound ; #DEBUG_LINE_NO:907
EndFunction

ObjectReference Function _GetMarkerFromArray(ObjectReference[] akMarkerArray, ObjectReference akSpecificMarkerRef, Bool bAllowRandomIfSpecificFails, Bool bRemoveElementFromArray)
  String FunctionName = "GetMarkerFromArray()" ; #DEBUG_LINE_NO:912
  ObjectReference MarkerREF = None ; #DEBUG_LINE_NO:913
  Int RandomIndex = 0 ; #DEBUG_LINE_NO:914
  Int index = 0 ; #DEBUG_LINE_NO:915
  If akSpecificMarkerRef != None ; #DEBUG_LINE_NO:917
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akMarkerArray.Length <= 0 ; #DEBUG_LINE_NO:921
    Return None ; #DEBUG_LINE_NO:923
  EndIf ; #DEBUG_LINE_NO:
  If akSpecificMarkerRef != None ; #DEBUG_LINE_NO:927
    While index < akMarkerArray.Length && MarkerREF == None ; #DEBUG_LINE_NO:928
      If akMarkerArray[index] == akSpecificMarkerRef ; #DEBUG_LINE_NO:932
        If bRemoveElementFromArray ; #DEBUG_LINE_NO:937
          akMarkerArray.remove(index, 1) ; #DEBUG_LINE_NO:939
        EndIf ; #DEBUG_LINE_NO:
        MarkerREF = akSpecificMarkerRef ; #DEBUG_LINE_NO:943
      EndIf ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:947
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If MarkerREF == None && (akSpecificMarkerRef == None || akSpecificMarkerRef != None && bAllowRandomIfSpecificFails) ; #DEBUG_LINE_NO:952
    RandomIndex = Utility.RandomInt(0, akMarkerArray.Length - 1) ; #DEBUG_LINE_NO:953
    MarkerREF = akMarkerArray[RandomIndex] ; #DEBUG_LINE_NO:954
    If MarkerREF != None ; #DEBUG_LINE_NO:956
      If akSpecificMarkerRef != None ; #DEBUG_LINE_NO:957
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If bRemoveElementFromArray ; #DEBUG_LINE_NO:964
      akMarkerArray.remove(RandomIndex, 1) ; #DEBUG_LINE_NO:965
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return MarkerREF ; #DEBUG_LINE_NO:975
EndFunction

ObjectReference[] Function CopyArray(ObjectReference[] akInputArray, String akOutputArrayName, String akInputArrayName)
  String FunctionName = "CopyArray()" ; #DEBUG_LINE_NO:980
  ObjectReference[] outputArray = new ObjectReference[akInputArray.Length] ; #DEBUG_LINE_NO:981
  Int I = 0 ; #DEBUG_LINE_NO:982
  While I < akInputArray.Length ; #DEBUG_LINE_NO:984
    outputArray[I] = akInputArray[I] ; #DEBUG_LINE_NO:985
    I += 1 ; #DEBUG_LINE_NO:986
  EndWhile ; #DEBUG_LINE_NO:
  If akInputArray.Length == outputArray.Length ; #DEBUG_LINE_NO:989
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return outputArray ; #DEBUG_LINE_NO:993
EndFunction

Int[] Function CopyIntArray(Int[] akInputArray, String akOutputArrayName, String akInputArrayName, String akFunctionName)
  Int[] outputArray = new Int[akInputArray.Length] ; #DEBUG_LINE_NO:998
  Int I = 0 ; #DEBUG_LINE_NO:999
  While I < akInputArray.Length ; #DEBUG_LINE_NO:1001
    outputArray[I] = akInputArray[I] ; #DEBUG_LINE_NO:1002
    I += 1 ; #DEBUG_LINE_NO:1003
  EndWhile ; #DEBUG_LINE_NO:
  If akInputArray.Length == outputArray.Length ; #DEBUG_LINE_NO:1006
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return outputArray ; #DEBUG_LINE_NO:1010
EndFunction

Bool Function LandShip(Int aiShipDataIndex)
  String FunctionName = "kmyQuest.LandShip()" ; #DEBUG_LINE_NO:1019
  Int failsafe = 100 ; #DEBUG_LINE_NO:1020
  Int index = 0 ; #DEBUG_LINE_NO:1021
  Bool bSuccess = False ; #DEBUG_LINE_NO:1023
  While Self._IsReadyToLandShip() == False && failsafe > 0 ; #DEBUG_LINE_NO:1026
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:1028
    failsafe -= 1 ; #DEBUG_LINE_NO:1029
  EndWhile ; #DEBUG_LINE_NO:
  If gbEnableShips ; #DEBUG_LINE_NO:1032
    If aiShipDataIndex >= 0 && aiShipDataIndex < ShipData.Length ; #DEBUG_LINE_NO:1034
      Self._LandShip(aiShipDataIndex) ; #DEBUG_LINE_NO:1035
      bSuccess = True ; #DEBUG_LINE_NO:1036
    Else ; #DEBUG_LINE_NO:
      While index < gLandingShipsArray.Length ; #DEBUG_LINE_NO:1040
        If Self._CanShipLand(gLandingShipsArray[index]) ; #DEBUG_LINE_NO:1042
          Self._LandShip(gLandingShipsArray[index]) ; #DEBUG_LINE_NO:1043
          bSuccess = True ; #DEBUG_LINE_NO:1044
        EndIf ; #DEBUG_LINE_NO:
        index += 1 ; #DEBUG_LINE_NO:1046
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:1050
EndFunction

Bool Function _IsReadyToLandShip()
  Return initialized && gbEnableShips == False || initialized && gbEnableShips && gbStartLandedMode == False ; #DEBUG_LINE_NO:1058
EndFunction

Bool Function LaunchShip(Int aiShipDataIndex, spaceshipreference akSpaceship, Bool abForceLaunch)
  Return Self._LaunchShip(aiShipDataIndex, akSpaceship, abForceLaunch) ; #DEBUG_LINE_NO:1064
EndFunction

Int Function LaunchAllShips(Bool bForceLaunch)
  String FunctionName = "kmyQuest.LaunchAllShips()" ; #DEBUG_LINE_NO:1069
  Int LaunchedShips = 0 ; #DEBUG_LINE_NO:1070
  Int index = 0 ; #DEBUG_LINE_NO:1071
  While index < gLandedShipRefsArray.Length ; #DEBUG_LINE_NO:1075
    If gLandedShipRefsArray[index] != None ; #DEBUG_LINE_NO:1076
      If Self._LaunchShip(index, gLandedShipRefsArray[index], bForceLaunch) ; #DEBUG_LINE_NO:1078
        LaunchedShips += 1 ; #DEBUG_LINE_NO:1079
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:1082
  EndWhile ; #DEBUG_LINE_NO:
  Return LaunchedShips ; #DEBUG_LINE_NO:1084
EndFunction

Int Function getLandingQueueCount()
  Return gLandingShipsArray.Length ; #DEBUG_LINE_NO:1089
EndFunction

spaceshipreference[] Function GetShipRefs()
  Return gLandedShipRefsArray ; #DEBUG_LINE_NO:1094
EndFunction

Key[] Function ToggleShipDoors(GlobalVariable gLockLevel, spaceshipreference akSpaceshipREF, Bool bGetKey, Bool abSetAccessible)
  spaceshipreference ShipREF = akSpaceshipREF ; #DEBUG_LINE_NO:1099
  Key[] ShipKeys = None ; #DEBUG_LINE_NO:1100
  Int iLockLevel = 0 ; #DEBUG_LINE_NO:1101
  Int I = 0 ; #DEBUG_LINE_NO:1102
  If akSpaceshipREF == None ; #DEBUG_LINE_NO:1105
    While I < gLandedShipRefsArray.Length ; #DEBUG_LINE_NO:1106
      ShipREF = gLandedShipRefsArray[I] ; #DEBUG_LINE_NO:1107
      If ShipREF != None ; #DEBUG_LINE_NO:1109
        Self.LockShipDoors(ShipREF, gLockLevel, None, None) ; #DEBUG_LINE_NO:1110
        If bGetKey ; #DEBUG_LINE_NO:1111
          ShipKeys.add(ShipREF.GetKey(), 1) ; #DEBUG_LINE_NO:1112
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:1115
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.LockShipDoors(akSpaceshipREF, gLockLevel, None, None) ; #DEBUG_LINE_NO:1118
    If bGetKey ; #DEBUG_LINE_NO:1119
      ShipKeys.add(ShipREF.GetKey(), 1) ; #DEBUG_LINE_NO:1120
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return ShipKeys ; #DEBUG_LINE_NO:1124
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:1131
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String LogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:1135
EndFunction
