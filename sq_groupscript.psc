ScriptName SQ_GroupScript Extends Activator

;-- Structs -----------------------------------------
Struct OccupationDatum
  sq_groupoccupationscript Occupation
  { the occupation }
  ActorBase ActorBaseToSpawn_Female
  { which actorbase to spawn for the group's use of this occupation - with female specific voicetypes }
  ActorBase ActorBaseToSpawn_Male
  { which actorbase to spawn for the group's use of this occupation - with male specific voicetypes }
  ActorBase CorpseToSpawn_Female
  { which actorbase to spawn a corpse associated the this group's use of this occupation }
  ActorBase CorpseToSpawn_Male
  { which actorbase to spawn a corpse associated the this group's use of this occupation }
  Faction VendorFaction
  { OPTIONAL: Vendor Faction for vendors spawned for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation }
  LeveledItem VendorList
  { OPTIONAL: Leveled list for populating vendor container for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Child_Female
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Child_Male
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with male child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Older_Female
  { OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with female old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Older_Male
  { OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with male old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  ActorBase ActorBaseToSpawn_Robot
  { OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation }
  spaceshipbase ShipToSpawn_Fighter
  { OPTIONAL: When spawning a fighter for this group, use this. (otherwise use the main faction ships) }
  spaceshipbase ShipToSpawn_Destroyer
  { OPTIONAL: When spawning a destroyer for this group, use this. }
  spaceshipbase ShipToSpawn_Cruiser
  { OPTIONAL: When spawning a cruiser for this group, use this. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  GlobalVariable Property SQ_Group_Gender_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Female Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Male Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Actor Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Corpse Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Child Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Robot Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Older Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_0_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_1_Fighter Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_2_Destroyer Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Ship_3_Cruiser Auto Const mandatory
  Keyword Property SpaceshipLandingMarker Auto Const mandatory
  Faction Property SQ_Group_VendorFaction_Default Auto Const mandatory
  Container Property SQ_VendorContainerEmptyBase Auto Const mandatory
  Keyword Property VendorContainerKeyword01 Auto Const mandatory
  Keyword Property SpaceshipLandingPadMedium Auto Const mandatory
  Keyword Property SpaceshipLandingPadLarge Auto Const mandatory
EndGroup

Group GroupData
  GlobalVariable Property FactionID Auto Const mandatory
  { A global that holds an enum used to identify this group. Can be stored in AVs and variables for conditions on dialogue, etc.
	Filter for: SQ_Group_FactionID_ }
  Faction[] Property GroupFactions Auto Const mandatory
  { The main faction(s) members of this group are in. This is an identifying faction that should be closely tied with the factions identity. An actor in ANY of these factions is considered a member of this group. }
  Keyword[] Property LocEncKeywords Auto Const
  { NOT YET IMPLEMENTED -- optional: A keyword on locations where this group resides. This will be used to help determine what group is in an area }
  Faction Property FactionForLocationOwnership Auto Const
  { When a group is spawned from this faction, it will assign this faction to be the owner of the location they spawn into. }
  FormList Property FactionListForLocationOwnership Auto Const
  { When a group is spawned from this faction, it will randomly assign one of these factions to be the owner of the location they spawn into.
	(IGNORED IF FactionForLocationOwnership is not none.) }
  spaceshipbase Property ShipToSpawn_Fighter Auto Const mandatory
  { When spawning a fighter for this group, use this. }
  spaceshipbase Property ShipToSpawn_Destroyer Auto Const mandatory
  { When spawning a destroyer for this group, use this. }
  spaceshipbase Property ShipToSpawn_Cruiser Auto Const mandatory
  { When spawning a cruiser for this group, use this. }
  Float Property ActorLevelModChanceEasy = 0.400000006 Auto Const
  { Chance the actor's aiLevelMod will be 0, Easy. }
  Float Property ActorLevelModChanceMedium = 0.800000012 Auto Const
  { Chance the actor's aiLevelMod will be 1, Medium. If not Easy or Medium, the actor will be 2, Hard. }
EndGroup

Group Occupations
  sq_groupscript:occupationdatum[] Property OccupationData Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Int Function GetFactionIDValue()
  Return FactionID.GetValue() as Int ; #DEBUG_LINE_NO:118
EndFunction

Bool Function ValidateActor(Actor ActorToValidate, sq_groupoccupationscript OccupationToValidate)
  Bool validated = OccupationToValidate == None || OccupationToValidate.ValidateActor(ActorToValidate) ; #DEBUG_LINE_NO:124
  If validated ; #DEBUG_LINE_NO:127
    validated = Self.CheckActorFactions(ActorToValidate) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  Return validated ; #DEBUG_LINE_NO:132
EndFunction

Bool Function CheckActorFactions(Actor ActorToTest)
  Bool factionCheck = commonarrayfunctions.CheckActorAgainstFactionArray(ActorToTest, GroupFactions, False) ; #DEBUG_LINE_NO:137
  Return factionCheck ; #DEBUG_LINE_NO:139
EndFunction

sq_groupoccupationscript[] Function GetAllOccupations()
  sq_groupoccupationscript[] Occupations = new sq_groupoccupationscript[OccupationData.Length] ; #DEBUG_LINE_NO:143
  Int I = 0 ; #DEBUG_LINE_NO:145
  While I < OccupationData.Length ; #DEBUG_LINE_NO:146
    Occupations[I] = OccupationData[I].Occupation ; #DEBUG_LINE_NO:147
    I += 1 ; #DEBUG_LINE_NO:148
  EndWhile ; #DEBUG_LINE_NO:
  Return Occupations ; #DEBUG_LINE_NO:153
EndFunction

sq_groupoccupationscript Function GetRandomOccupation()
  sq_groupoccupationscript[] allOccupations = Self.GetAllOccupations() ; #DEBUG_LINE_NO:159
  Int iRandom = Utility.RandomInt(0, allOccupations.Length - 1) ; #DEBUG_LINE_NO:162
  sq_groupoccupationscript randomOccupation = allOccupations[iRandom] ; #DEBUG_LINE_NO:163
  Return randomOccupation ; #DEBUG_LINE_NO:166
EndFunction

Bool Function HasOccupation(sq_groupoccupationscript OccupationToFind)
  Return OccupationData.findstruct("Occupation", OccupationToFind, 0) > -1 ; #DEBUG_LINE_NO:170
EndFunction

sq_groupoccupationscript Function GetRandomMatchingOccupation(sq_groupoccupationscript[] OccupationsToCheck)
  sq_groupoccupationscript[] matchingOccupations = Self.GetMatchingOccupations(OccupationsToCheck) ; #DEBUG_LINE_NO:178
  Int iRandom = Utility.RandomInt(0, matchingOccupations.Length - 1) ; #DEBUG_LINE_NO:180
  sq_groupoccupationscript randomOccupation = matchingOccupations[iRandom] ; #DEBUG_LINE_NO:181
  Return randomOccupation ; #DEBUG_LINE_NO:184
EndFunction

sq_groupoccupationscript[] Function GetMatchingOccupations(sq_groupoccupationscript[] OccupationsToCheck)
  sq_groupoccupationscript[] matchingOccupations = new sq_groupoccupationscript[0] ; #DEBUG_LINE_NO:191
  Int I = 0 ; #DEBUG_LINE_NO:193
  While I < OccupationData.Length ; #DEBUG_LINE_NO:194
    sq_groupscript:occupationdatum currentOccupationDatum = OccupationData[I] ; #DEBUG_LINE_NO:195
    If OccupationsToCheck.find(currentOccupationDatum.Occupation, 0) >= 0 ; #DEBUG_LINE_NO:199
      matchingOccupations.add(currentOccupationDatum.Occupation, 1) ; #DEBUG_LINE_NO:201
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:204
  EndWhile ; #DEBUG_LINE_NO:
  Return matchingOccupations ; #DEBUG_LINE_NO:208
EndFunction

Faction Function GetFactionForLocationOwnership()
  Faction owningFaction = FactionForLocationOwnership ; #DEBUG_LINE_NO:212
  If owningFaction == None && FactionListForLocationOwnership as Bool ; #DEBUG_LINE_NO:214
    Int iRandom = Utility.RandomInt(0, FactionListForLocationOwnership.GetSize() - 1) ; #DEBUG_LINE_NO:216
    Faction randomFaction = FactionListForLocationOwnership.GetAt(iRandom) as Faction ; #DEBUG_LINE_NO:217
    owningFaction = randomFaction ; #DEBUG_LINE_NO:218
  EndIf ; #DEBUG_LINE_NO:
  Return owningFaction ; #DEBUG_LINE_NO:223
EndFunction

ObjectReference Function SpawnGroupReference(ObjectReference SpawnAtRef, sq_groupoccupationscript OccupationToSpawn, Keyword LinkToSpawnAt, Bool LinkToSpawnAtWithNoKeyword, GlobalVariable SpawnType, GlobalVariable GenderToSpawn, Bool IsVendor, Faction crimeFaction, Bool InitiallyDisabled, Int Aggression)
  If SpawnAtRef == None ; #DEBUG_LINE_NO:229
    Return None ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  If OccupationToSpawn == None ; #DEBUG_LINE_NO:233
    Return None ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  If SpawnType == None ; #DEBUG_LINE_NO:238
    SpawnType = SQ_Group_SpawnType_Actor ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
  Form formToSpawn = None ; #DEBUG_LINE_NO:242
  Bool isShipSpawning = False ; #DEBUG_LINE_NO:243
  Faction VendorFaction = None ; #DEBUG_LINE_NO:244
  LeveledItem VendorList = None ; #DEBUG_LINE_NO:245
  Int iFound = OccupationData.findstruct("Occupation", OccupationToSpawn, 0) ; #DEBUG_LINE_NO:247
  sq_groupscript:occupationdatum foundOccupationDatum = None ; #DEBUG_LINE_NO:248
  If iFound > -1 ; #DEBUG_LINE_NO:249
    foundOccupationDatum = OccupationData[iFound] ; #DEBUG_LINE_NO:250
    Bool SpawnMale = False ; #DEBUG_LINE_NO:252
    If GenderToSpawn == None || GenderToSpawn == SQ_Group_Gender_Any ; #DEBUG_LINE_NO:254
      SpawnMale = Utility.RandomInt(1, 100) <= 50 ; #DEBUG_LINE_NO:255
    ElseIf GenderToSpawn == SQ_Group_Gender_Male ; #DEBUG_LINE_NO:256
      SpawnMale = True ; #DEBUG_LINE_NO:257
    ElseIf GenderToSpawn != SQ_Group_Gender_Female ; #DEBUG_LINE_NO:258
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If SpawnType == SQ_Group_SpawnType_Actor ; #DEBUG_LINE_NO:263
      If SpawnMale ; #DEBUG_LINE_NO:264
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Male as Form ; #DEBUG_LINE_NO:265
      Else ; #DEBUG_LINE_NO:
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Female as Form ; #DEBUG_LINE_NO:267
      EndIf ; #DEBUG_LINE_NO:
    ElseIf SpawnType == SQ_Group_SpawnType_Child ; #DEBUG_LINE_NO:271
      If SpawnMale ; #DEBUG_LINE_NO:272
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Male as Form ; #DEBUG_LINE_NO:273
        If formToSpawn == None ; #DEBUG_LINE_NO:274
          formToSpawn = OccupationToSpawn.DefaultChild_Male as Form ; #DEBUG_LINE_NO:275
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Female as Form ; #DEBUG_LINE_NO:279
        If formToSpawn == None ; #DEBUG_LINE_NO:280
          formToSpawn = OccupationToSpawn.DefaultChild_Female as Form ; #DEBUG_LINE_NO:281
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf SpawnType == SQ_Group_SpawnType_Older ; #DEBUG_LINE_NO:286
      If SpawnMale ; #DEBUG_LINE_NO:287
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Male as Form ; #DEBUG_LINE_NO:288
        If formToSpawn == None ; #DEBUG_LINE_NO:289
          formToSpawn = OccupationToSpawn.DefaultOlder_Male as Form ; #DEBUG_LINE_NO:290
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Female as Form ; #DEBUG_LINE_NO:294
        If formToSpawn == None ; #DEBUG_LINE_NO:295
          formToSpawn = OccupationToSpawn.DefaultOlder_Female as Form ; #DEBUG_LINE_NO:296
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf SpawnType == SQ_Group_SpawnType_Robot ; #DEBUG_LINE_NO:302
      formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Robot as Form ; #DEBUG_LINE_NO:303
      If formToSpawn == None ; #DEBUG_LINE_NO:304
        formToSpawn = OccupationToSpawn.DefaultRobot as Form ; #DEBUG_LINE_NO:305
      EndIf ; #DEBUG_LINE_NO:
    ElseIf SpawnType == SQ_Group_SpawnType_Corpse ; #DEBUG_LINE_NO:309
      If SpawnMale ; #DEBUG_LINE_NO:310
        formToSpawn = foundOccupationDatum.CorpseToSpawn_Male as Form ; #DEBUG_LINE_NO:311
      Else ; #DEBUG_LINE_NO:
        formToSpawn = foundOccupationDatum.CorpseToSpawn_Female as Form ; #DEBUG_LINE_NO:313
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.IsSpawnTypeShip(SpawnType) ; #DEBUG_LINE_NO:317
      isShipSpawning = True ; #DEBUG_LINE_NO:318
      If SpawnAtRef.HasKeyword(SpaceshipLandingMarker) ; #DEBUG_LINE_NO:321
        formToSpawn = Self.GetSpaceshipBaseToSpawn(SpawnAtRef, SpawnType, foundOccupationDatum.Occupation) as Form ; #DEBUG_LINE_NO:322
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If IsVendor ; #DEBUG_LINE_NO:331
      VendorList = foundOccupationDatum.VendorList ; #DEBUG_LINE_NO:332
      If VendorList == None ; #DEBUG_LINE_NO:334
        VendorList = foundOccupationDatum.Occupation.DefaultVendorList ; #DEBUG_LINE_NO:335
      EndIf ; #DEBUG_LINE_NO:
      VendorFaction = foundOccupationDatum.VendorFaction ; #DEBUG_LINE_NO:338
      If VendorFaction == None ; #DEBUG_LINE_NO:340
        VendorFaction = foundOccupationDatum.Occupation.DefaultOccupationVendorFaction ; #DEBUG_LINE_NO:341
      EndIf ; #DEBUG_LINE_NO:
      If VendorFaction == None ; #DEBUG_LINE_NO:344
        VendorFaction = SQ_Group_VendorFaction_Default ; #DEBUG_LINE_NO:345
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Return None ; #DEBUG_LINE_NO:352
  EndIf ; #DEBUG_LINE_NO:
  If formToSpawn == None ; #DEBUG_LINE_NO:357
    Return None ; #DEBUG_LINE_NO:359
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference spawnedRef = None ; #DEBUG_LINE_NO:365
  If isShipSpawning ; #DEBUG_LINE_NO:367
    spawnedRef = SpawnAtRef.PlaceShipAtMe((formToSpawn as spaceshipbase) as Form, 4, True, False, True, True, None, None, None, True) as ObjectReference ; #DEBUG_LINE_NO:369
    spawnedRef.SetLinkedRef(SpawnAtRef, None, False) ; #DEBUG_LINE_NO:372
    spawnedRef.Enable(False) ; #DEBUG_LINE_NO:375
  Else ; #DEBUG_LINE_NO:
    ActorBase actorBaseToSpawn = formToSpawn as ActorBase ; #DEBUG_LINE_NO:379
    If actorBaseToSpawn ; #DEBUG_LINE_NO:380
      Int actorLevelMod = 0 ; #DEBUG_LINE_NO:381
      Float actorLevelModChance = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:382
      If actorLevelModChance < ActorLevelModChanceEasy ; #DEBUG_LINE_NO:383
        actorLevelMod = 0 ; #DEBUG_LINE_NO:384
      ElseIf actorLevelModChance < ActorLevelModChanceMedium ; #DEBUG_LINE_NO:385
        actorLevelMod = 1 ; #DEBUG_LINE_NO:386
      Else ; #DEBUG_LINE_NO:
        actorLevelMod = 2 ; #DEBUG_LINE_NO:388
      EndIf ; #DEBUG_LINE_NO:
      spawnedRef = SpawnAtRef.PlaceActorAtMe(actorBaseToSpawn, actorLevelMod, SpawnAtRef.GetCurrentLocation(), False, InitiallyDisabled, True, None, True) as ObjectReference ; #DEBUG_LINE_NO:392
    Else ; #DEBUG_LINE_NO:
      spawnedRef = SpawnAtRef.PlaceAtMe(formToSpawn, 1, False, InitiallyDisabled, True, None, None, True) ; #DEBUG_LINE_NO:394
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor spawnedActor = spawnedRef as Actor ; #DEBUG_LINE_NO:398
  spaceshipreference spawnedShip = spawnedRef as spaceshipreference ; #DEBUG_LINE_NO:399
  If crimeFaction ; #DEBUG_LINE_NO:401
    If spawnedActor ; #DEBUG_LINE_NO:402
      spawnedActor.SetCrimeFaction(crimeFaction) ; #DEBUG_LINE_NO:403
    ElseIf spawnedShip ; #DEBUG_LINE_NO:
      spawnedShip.SetCrimeFaction(crimeFaction) ; #DEBUG_LINE_NO:405
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Aggression > -1 && Aggression < 4 ; #DEBUG_LINE_NO:409
    If spawnedActor ; #DEBUG_LINE_NO:410
      spawnedActor.SetValue(Game.GetAggressionAV(), Aggression as Float) ; #DEBUG_LINE_NO:411
    ElseIf spawnedShip ; #DEBUG_LINE_NO:
      spawnedShip.SetValue(Game.GetAggressionAV(), Aggression as Float) ; #DEBUG_LINE_NO:413
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If LinkToSpawnAt as Bool || LinkToSpawnAtWithNoKeyword ; #DEBUG_LINE_NO:419
    spawnedRef.SetLinkedRef(SpawnAtRef, LinkToSpawnAt, False) ; #DEBUG_LINE_NO:421
  EndIf ; #DEBUG_LINE_NO:
  If IsVendor ; #DEBUG_LINE_NO:424
    spawnedActor.AddToFaction(VendorFaction) ; #DEBUG_LINE_NO:427
    ObjectReference vendorContainerRef = spawnedActor.PlaceAtMe(SQ_VendorContainerEmptyBase as Form, 1, False, True, True, None, None, True) ; #DEBUG_LINE_NO:430
    vendorContainerRef.AddItem(VendorList as Form, 1, False) ; #DEBUG_LINE_NO:431
    spawnedRef.SetLinkedRef(vendorContainerRef, VendorContainerKeyword01, False) ; #DEBUG_LINE_NO:435
  EndIf ; #DEBUG_LINE_NO:
  Return spawnedRef ; #DEBUG_LINE_NO:438
EndFunction

Bool Function IsSpawnTypeShip(GlobalVariable SpawnTypeGlobal)
  Return SpawnTypeGlobal == SQ_Group_SpawnType_Ship_0_Any || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_1_Fighter || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_2_Destroyer || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_3_Cruiser ; #DEBUG_LINE_NO:443
EndFunction

spaceshipbase Function GetSpaceshipBaseToSpawn(ObjectReference landingMarkerRef, GlobalVariable RequestedShip_SpawnType, sq_groupoccupationscript Occupation)
  spaceshipbase shipbaseToReturn = None ; #DEBUG_LINE_NO:449
  Int sizeMax = 1 ; #DEBUG_LINE_NO:452
  If RequestedShip_SpawnType == None || RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_0_Any ; #DEBUG_LINE_NO:453
    If landingMarkerRef.HasKeyword(SpaceshipLandingPadMedium) ; #DEBUG_LINE_NO:454
      sizeMax = 2 ; #DEBUG_LINE_NO:455
    ElseIf landingMarkerRef.HasKeyword(SpaceshipLandingPadLarge) ; #DEBUG_LINE_NO:456
      sizeMax = 3 ; #DEBUG_LINE_NO:457
    EndIf ; #DEBUG_LINE_NO:
    Int RandomInt = Utility.RandomInt(1, sizeMax) ; #DEBUG_LINE_NO:460
    If RandomInt == 1 ; #DEBUG_LINE_NO:462
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_1_Fighter ; #DEBUG_LINE_NO:463
    ElseIf RandomInt == 2 ; #DEBUG_LINE_NO:464
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_2_Destroyer ; #DEBUG_LINE_NO:465
    ElseIf RandomInt == 3 ; #DEBUG_LINE_NO:466
      RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_3_Cruiser ; #DEBUG_LINE_NO:467
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  sq_groupscript:occupationdatum shipOccupation = None ; #DEBUG_LINE_NO:474
  If Occupation ; #DEBUG_LINE_NO:475
    Int occupationIndex = OccupationData.findstruct("Occupation", Occupation, 0) ; #DEBUG_LINE_NO:476
    If occupationIndex > -1 ; #DEBUG_LINE_NO:477
      shipOccupation = OccupationData[occupationIndex] ; #DEBUG_LINE_NO:478
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_3_Cruiser && sizeMax == 3 ; #DEBUG_LINE_NO:483
    If shipOccupation as Bool && shipOccupation.ShipToSpawn_Cruiser as Bool ; #DEBUG_LINE_NO:484
      shipbaseToReturn = shipOccupation.ShipToSpawn_Cruiser ; #DEBUG_LINE_NO:485
    Else ; #DEBUG_LINE_NO:
      shipbaseToReturn = ShipToSpawn_Cruiser ; #DEBUG_LINE_NO:487
    EndIf ; #DEBUG_LINE_NO:
  ElseIf RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_2_Destroyer && sizeMax >= 2 ; #DEBUG_LINE_NO:489
    If shipOccupation as Bool && shipOccupation.ShipToSpawn_Destroyer as Bool ; #DEBUG_LINE_NO:490
      shipbaseToReturn = shipOccupation.ShipToSpawn_Destroyer ; #DEBUG_LINE_NO:491
    Else ; #DEBUG_LINE_NO:
      shipbaseToReturn = ShipToSpawn_Destroyer ; #DEBUG_LINE_NO:493
    EndIf ; #DEBUG_LINE_NO:
  ElseIf shipOccupation as Bool && shipOccupation.ShipToSpawn_Fighter as Bool ; #DEBUG_LINE_NO:496
    shipbaseToReturn = shipOccupation.ShipToSpawn_Fighter ; #DEBUG_LINE_NO:497
  Else ; #DEBUG_LINE_NO:
    shipbaseToReturn = ShipToSpawn_Fighter ; #DEBUG_LINE_NO:499
  EndIf ; #DEBUG_LINE_NO:
  Return shipbaseToReturn ; #DEBUG_LINE_NO:505
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:513
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:517
EndFunction
