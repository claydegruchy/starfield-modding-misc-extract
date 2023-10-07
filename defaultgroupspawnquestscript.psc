ScriptName DefaultGroupSpawnQuestScript Extends Quest default
{ Used to spawn groups defined in SQ_GroupsScript attached to SQ_Groups quest

You can register for the custom event "SpawnEvent" defined on this script to know when when something has spawned.
You can cast the event's akArgs[0] as DefaultGroupSpawnQuestScript:SpawnEventArgs to access various data about what was spawned. }

;-- Structs -----------------------------------------
Struct SpawnEventArgs
  Int SpawnGroupNumber
  Int SpawnDataIndex
  sq_groupscript SpawnedGroup
  sq_groupoccupationscript SpawnedOccupation
  Alias SpawnAlias
  Alias SpawnAtAlias
EndStruct

Struct SpawnGroupDoneEventArgs
  Int SpawnGroupNumber
  sq_groupscript SpawnedGroup
  sq_groupoccupationscript SpawnedOccupation
EndStruct

Struct SpawnGroup_DefinitionDatum
  String Name = ""
  { Optional. For organizational/debug purposes. Printed to logs. }
  LocationAlias LocationAliasToSetOwnershipOn
  { Optional: if not none, will set owner data on this alias's location for faction defined in SQ_GroupScript }
  GlobalVariable Role
  { if the actor(s) being spawned are part of a group, this is their role (ie enemy, victim, etc) 
        Filter for: SQ_GroupRole_* }
  conditionform Conditions
  { default none; if set, these conditions must be true for ANY of this groups SpawnData to spawn. }
  ReferenceAlias ConditionAlias
  { default none; if set, the reference in this alias is used as the subject for the Conditions above }
  sq_groupscript ChosenGroup hidden
  { Set by script system }
  sq_groupoccupationscript ChosenOccupation hidden
  { Set by script system }
  Faction crimeFaction hidden
  { set during spawning }
  Int SpawnStage = -1
  { if this is > -1, wait for this stage to spawn anything in this group }
  Bool AllowSpawningIntoNonEmptyAliases = True
  { if this is false, don't spawn into an alias that already has something in it - useful if you have multiple mutually-exclusive spawn groups }
  Int Aggression = -1
  { if this is 0-3, this aggression value will be set on all spawned actors in this group
				0: Unaggressive - Will not initiate combat. Standard aggression for actors with reaction radius.
				1: Aggressive - Will attack Enemies on sight.
				2: Very Aggressive - Will attack Enemies and Neutrals on sight.
				3: Frenzied - Will attack anyone on sight.
		  Any other value means don't change aggression. }
EndStruct

Struct SpawnGroup_SpawnDatum
  Alias SpawnAlias
  { Alias to force ref(s) into after spawning }
  Alias SpawnAt
  { Reference(s) to spawn at.

		Note: If this a RefCollectionAlias and if SpawnAlias is also a RefCollection alias, it will iterate over the references in SpawnAt when spawning things.
		If you have multiple things you want to spawn at similar markers, make sure you have collected those makers into seperate RefCollectionAliases.
		Example: if you have two types of corpses to spawn, make sure you have two different corpse marker RefCollectionAliases for them to spawn at.

		*** If SpawnType is a SHIP this should be a landing marker 
			And you should consider using OE_ShipAddonScript instead of this script to spawn and manage the ship.
		*** }
  GlobalVariable Gender
  { This gender should match that of the voicetype you are forcing for this alias.
		NONE (default) == Any
		Filter for: SQ_Group_Gender_* }
  GlobalVariable SpawnType
  { This is the type of object to spawn
		NONE (Default) = Actor
		Filter for: SQ_Group_SpawnType

		*** If this is a ship:
			*SpawnAt* should be a landing marker
			And you should consider using OE_ShipAddonScript to spawn and manage its functionality INSTEAD of using this script to spawn the ship. (All this script will do is spawn the ship, OE_ShipAddonScript is more fully featured.)
		*** }
  Bool SetOverrideNameLeader
  { if true, will override the actor's name with the LeaderName message defined in SQ_GroupOccupationScript }
  Bool IsVendor
  { if true, will set up this actor to be a vendor as defined in SQ_GroupOccupationScript and SQ_GroupScript. }
  Bool SetOverrideNameVendor
  { if true, will override the actor's name with the VendorName message defined in SQ_GroupOccupationScript }
  Bool Register_With_REScript = True
  { If true (default), will call RegisterAlias on REScript if it is also attached to this quest. }
  Int MinToSpawn = 2
  { OPTIONAL: only used if SpawnAlias is a RefCollection }
  Int MaxToSpawn = 5
  { OPTIONAL: only used if SpawnAlias is a RefCollection }
  Bool SpawnAllAtEach = False
  { OPTIONAL: only used if SpawnAlias is a RefCollection; if true, at each reference in SpawnAlias, it will spawn a number of refs between MinToSpawn and MaxToSpawn }
  Keyword LinkToSpawnAt
  { OPTIONAL: will link the spawned reference to the reference in it's SpawnAt alias }
  Bool LinkToSpawnAtWithNoKeyword = False
  { OPTIONAL: if true, will link to SpawnAt without a keyword (ignore if LinkToSpawnAt isn't none) }
  Int StageToSpawn = -1
  { OPTIONAL: -1 (default) spawns at startup. }
  conditionform SpawnConditions
  { OPTIONAL: Default: none; If set and conditions are not true when the Group's Stage is called, it will not spawn. Subject of conditions is the SpawnAt reference (or first of in case of ref collection) }
  Bool InitiallyDisabled = False
  { if true, will spawn initially disabled (quest will have to handle enabling them)
		 NOTE: this does NOT apply to ships - ships are always spawned initially disabled, regardless of this flag }
EndStruct


;-- Variables ---------------------------------------
oescript Self_As_OEScript
rescript Self_As_REScript
customlogs:logdatum[] logs

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ProcessGroupsGuard

;-- Properties --------------------------------------
Group Autofill
  sq_groups_questscript Property SQ_Groups Auto Const mandatory
EndGroup

Group SpawnGroupA
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupA_Definition Auto
  FormList[] Property SpawnGroupA_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupA_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupA_SpawnData Auto Const mandatory
EndGroup

Group SpawnGroupB
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupB_Definition Auto
  FormList[] Property SpawnGroupB_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupB_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupB_SpawnData Auto Const
EndGroup

Group SpawnGroupC
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupC_Definition Auto
  FormList[] Property SpawnGroupC_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupC_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupC_SpawnData Auto Const
EndGroup

Group SpawnGroupD
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupD_Definition Auto
  FormList[] Property SpawnGroupD_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupD_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupD_SpawnData Auto Const
EndGroup

Group SpawnGroupE
  defaultgroupspawnquestscript:spawngroup_definitiondatum Property SpawnGroupE_Definition Auto
  FormList[] Property SpawnGroupE_AllowedGroups Auto Const
  { formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_ }
  FormList[] Property SpawnGroupE_AllowedOccupations Auto Const
  { formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_ }
  defaultgroupspawnquestscript:spawngroup_spawndatum[] Property SpawnGroupE_SpawnData Auto Const
EndGroup

Group Debug
  String Property LocalScriptName = "DefaultGroupSpawnQuestScript" Auto
  { Inherits the LocalScriptName from OEScript, if used. Otherwise, the value set here is used. }
  GlobalVariable Property SQ_Group_RandomOccupationIndexOverride Auto Const
  { Global that overrides the random occupation selection behavior. Set at runtime to force spawning NPCs from the Spawn Group's allowed occupations array. }
EndGroup

Bool Property GroupSetupCompleted = False Auto hidden

;-- Functions ---------------------------------------

Function SendSpawnEvent(defaultgroupspawnquestscript:spawneventargs Args)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:228
  akArgs[0] = Args as Var ; #DEBUG_LINE_NO:229
  Self.SendCustomEvent("defaultgroupspawnquestscript_SpawnEvent", akArgs) ; #DEBUG_LINE_NO:231
EndFunction

Function SendSpawnGroupDoneEvent(defaultgroupspawnquestscript:spawngroupdoneeventargs Args)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:244
  akArgs[0] = Args as Var ; #DEBUG_LINE_NO:245
  Self.SendCustomEvent("defaultgroupspawnquestscript_SpawnGroupDoneEvent", akArgs) ; #DEBUG_LINE_NO:247
EndFunction

Event OnQuestInit()
  Self_As_OEScript = (Self as Quest) as oescript ; #DEBUG_LINE_NO:256
  Self.DefineCustomLogs() ; #DEBUG_LINE_NO:257
  Self.SetUpGroups() ; #DEBUG_LINE_NO:261
  If Self_As_OEScript ; #DEBUG_LINE_NO:264
    LocalScriptName = Self_As_OEScript.LocalScriptName ; #DEBUG_LINE_NO:265
  ElseIf Self_As_OEScript == None ; #DEBUG_LINE_NO:266
    Self.InitialGroupSpawn(LocalScriptName) ; #DEBUG_LINE_NO:268
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnStageSet(Int iStageID, Int iItemID)
  If Self.WaitForInitialGroupSetup() == False ; #DEBUG_LINE_NO:279
    Return  ; #DEBUG_LINE_NO:281
  EndIf ; #DEBUG_LINE_NO:
  Self.ProcessGroups(iStageID) ; #DEBUG_LINE_NO:285
EndEvent

Function InitialGroupSpawn(String LocalScriptName)
  If Self.WaitForInitialGroupSetup() == False ; #DEBUG_LINE_NO:297
    Return  ; #DEBUG_LINE_NO:299
  EndIf ; #DEBUG_LINE_NO:
  Self.ProcessGroups(-1) ; #DEBUG_LINE_NO:302
EndFunction

Function SetUpGroups()
  If SpawnGroupA_SpawnData as Bool && !SpawnGroupA_Definition ; #DEBUG_LINE_NO:311
    SpawnGroupA_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum ; #DEBUG_LINE_NO:312
  EndIf ; #DEBUG_LINE_NO:
  If SpawnGroupB_SpawnData as Bool && !SpawnGroupB_Definition ; #DEBUG_LINE_NO:314
    SpawnGroupB_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum ; #DEBUG_LINE_NO:315
  EndIf ; #DEBUG_LINE_NO:
  If SpawnGroupC_SpawnData as Bool && !SpawnGroupC_Definition ; #DEBUG_LINE_NO:317
    SpawnGroupC_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum ; #DEBUG_LINE_NO:318
  EndIf ; #DEBUG_LINE_NO:
  If SpawnGroupD_SpawnData as Bool && !SpawnGroupD_Definition ; #DEBUG_LINE_NO:320
    SpawnGroupD_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum ; #DEBUG_LINE_NO:321
  EndIf ; #DEBUG_LINE_NO:
  If SpawnGroupE_SpawnData as Bool && !SpawnGroupE_Definition ; #DEBUG_LINE_NO:323
    SpawnGroupE_Definition = new defaultgroupspawnquestscript:spawngroup_definitiondatum ; #DEBUG_LINE_NO:324
  EndIf ; #DEBUG_LINE_NO:
  Self.SetUpGroup("SpawnGroupA", SpawnGroupA_Definition, SpawnGroupA_AllowedGroups, SpawnGroupA_AllowedOccupations) ; #DEBUG_LINE_NO:327
  Self.SetUpGroup("SpawnGroupB", SpawnGroupB_Definition, SpawnGroupB_AllowedGroups, SpawnGroupB_AllowedOccupations) ; #DEBUG_LINE_NO:328
  Self.SetUpGroup("SpawnGroupC", SpawnGroupC_Definition, SpawnGroupC_AllowedGroups, SpawnGroupC_AllowedOccupations) ; #DEBUG_LINE_NO:329
  Self.SetUpGroup("SpawnGroupD", SpawnGroupD_Definition, SpawnGroupD_AllowedGroups, SpawnGroupD_AllowedOccupations) ; #DEBUG_LINE_NO:330
  Self.SetUpGroup("SpawnGroupE", SpawnGroupE_Definition, SpawnGroupE_AllowedGroups, SpawnGroupE_AllowedOccupations) ; #DEBUG_LINE_NO:331
  GroupSetupCompleted = True ; #DEBUG_LINE_NO:333
EndFunction

Function SetUpGroup(String DefaultName, defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, FormList[] AllowedGroups, FormList[] AllowedOccupations)
  If Definition == None && AllowedGroups == None && AllowedOccupations == None ; #DEBUG_LINE_NO:338
    Return  ; #DEBUG_LINE_NO:342
  EndIf ; #DEBUG_LINE_NO:
  Self.SetDefaultName(Definition, DefaultName) ; #DEBUG_LINE_NO:347
  sq_groupscript[] AllowedGroupsArray = Self.ConvertAllowedGroupsToArray(AllowedGroups) ; #DEBUG_LINE_NO:351
  sq_groupoccupationscript[] AllowedOccupationsArray = Self.ConvertAllowedOccupationsToArray(AllowedOccupations) ; #DEBUG_LINE_NO:354
  Bool haveAllowedGroups = AllowedGroupsArray as Bool && AllowedGroupsArray.Length >= 0 ; #DEBUG_LINE_NO:359
  Bool haveAllowedOccupations = AllowedOccupationsArray as Bool && AllowedOccupationsArray.Length >= 0 ; #DEBUG_LINE_NO:360
  If haveAllowedGroups == False && haveAllowedOccupations == False ; #DEBUG_LINE_NO:361
    Return  ; #DEBUG_LINE_NO:363
  EndIf ; #DEBUG_LINE_NO:
  sq_groupoccupationscript[] validOccupationsToChooseFrom = new sq_groupoccupationscript[0] ; #DEBUG_LINE_NO:367
  If haveAllowedOccupations == False ; #DEBUG_LINE_NO:370
    AllowedOccupationsArray = SQ_Groups.GetAllPossibleOccupations() ; #DEBUG_LINE_NO:372
  EndIf ; #DEBUG_LINE_NO:
  If haveAllowedGroups == False ; #DEBUG_LINE_NO:376
    validOccupationsToChooseFrom = AllowedOccupationsArray ; #DEBUG_LINE_NO:378
  Else ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:383
    While I < AllowedOccupationsArray.Length ; #DEBUG_LINE_NO:384
      sq_groupoccupationscript currentOccupation = AllowedOccupationsArray[I] ; #DEBUG_LINE_NO:385
      If SQ_Groups.CheckGroupsForOccupation(AllowedGroupsArray, currentOccupation) ; #DEBUG_LINE_NO:387
        validOccupationsToChooseFrom.add(currentOccupation, 1) ; #DEBUG_LINE_NO:389
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:394
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If validOccupationsToChooseFrom.Length == 0 ; #DEBUG_LINE_NO:401
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Int randomOccupationIndexOverride = -1 ; #DEBUG_LINE_NO:408
    If SQ_Group_RandomOccupationIndexOverride ; #DEBUG_LINE_NO:409
      randomOccupationIndexOverride = SQ_Group_RandomOccupationIndexOverride.GetValueInt() ; #DEBUG_LINE_NO:410
    EndIf ; #DEBUG_LINE_NO:
    If randomOccupationIndexOverride >= 0 && randomOccupationIndexOverride < validOccupationsToChooseFrom.Length ; #DEBUG_LINE_NO:414
      Definition.ChosenOccupation = validOccupationsToChooseFrom[randomOccupationIndexOverride] ; #DEBUG_LINE_NO:415
      If !Definition.ChosenOccupation ; #DEBUG_LINE_NO:417
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Int iRandom = Utility.RandomInt(0, validOccupationsToChooseFrom.Length - 1) ; #DEBUG_LINE_NO:421
      Definition.ChosenOccupation = validOccupationsToChooseFrom[iRandom] ; #DEBUG_LINE_NO:422
    EndIf ; #DEBUG_LINE_NO:
    If haveAllowedGroups ; #DEBUG_LINE_NO:427
      Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation, AllowedGroupsArray) ; #DEBUG_LINE_NO:430
    Else ; #DEBUG_LINE_NO:
      Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation, None) ; #DEBUG_LINE_NO:434
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Definition.ChosenGroup == None || Definition.ChosenOccupation == None ; #DEBUG_LINE_NO:442
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetDefaultName(defaultgroupspawnquestscript:spawngroup_definitiondatum GroupDefinitionToSetName, String DefaultName)
  If GroupDefinitionToSetName.Name == "" ; #DEBUG_LINE_NO:450
    GroupDefinitionToSetName.Name = DefaultName ; #DEBUG_LINE_NO:451
  EndIf ; #DEBUG_LINE_NO:
EndFunction

sq_groupscript[] Function ConvertAllowedGroupsToArray(FormList[] ArrayOfFormlistsToBuildFrom)
  sq_groupscript[] arrayToReturn = new sq_groupscript[0] ; #DEBUG_LINE_NO:458
  If ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0 ; #DEBUG_LINE_NO:460
    Return arrayToReturn ; #DEBUG_LINE_NO:461
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:464
  While I < ArrayOfFormlistsToBuildFrom.Length ; #DEBUG_LINE_NO:465
    Form[] formArray = ArrayOfFormlistsToBuildFrom[I].GetArray(False) ; #DEBUG_LINE_NO:466
    Int j = 0 ; #DEBUG_LINE_NO:468
    While j < formArray.Length ; #DEBUG_LINE_NO:469
      sq_groupscript currentGroup = formArray[j] as sq_groupscript ; #DEBUG_LINE_NO:470
      If currentGroup ; #DEBUG_LINE_NO:472
        arrayToReturn.add(currentGroup, 1) ; #DEBUG_LINE_NO:473
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:477
    EndWhile ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:480
  EndWhile ; #DEBUG_LINE_NO:
  Return arrayToReturn ; #DEBUG_LINE_NO:484
EndFunction

sq_groupoccupationscript[] Function ConvertAllowedOccupationsToArray(FormList[] ArrayOfFormlistsToBuildFrom)
  sq_groupoccupationscript[] arrayToReturn = new sq_groupoccupationscript[0] ; #DEBUG_LINE_NO:489
  If ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0 ; #DEBUG_LINE_NO:491
    Return arrayToReturn ; #DEBUG_LINE_NO:492
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:495
  While I < ArrayOfFormlistsToBuildFrom.Length ; #DEBUG_LINE_NO:496
    Form[] formArray = ArrayOfFormlistsToBuildFrom[I].GetArray(False) ; #DEBUG_LINE_NO:497
    Int j = 0 ; #DEBUG_LINE_NO:499
    While j < formArray.Length ; #DEBUG_LINE_NO:500
      sq_groupoccupationscript currentGroupOccupation = formArray[j] as sq_groupoccupationscript ; #DEBUG_LINE_NO:501
      If currentGroupOccupation ; #DEBUG_LINE_NO:502
        arrayToReturn.add(currentGroupOccupation, 1) ; #DEBUG_LINE_NO:503
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:507
    EndWhile ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:510
  EndWhile ; #DEBUG_LINE_NO:
  Return arrayToReturn ; #DEBUG_LINE_NO:514
EndFunction

Function ProcessGroups(Int iStageID)
  Guard ProcessGroupsGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:522
    Self.ProcessGroupData(SpawnGroupA_Definition, SpawnGroupA_SpawnData, iStageID) ; #DEBUG_LINE_NO:524
    Self.ProcessGroupData(SpawnGroupB_Definition, SpawnGroupB_SpawnData, iStageID) ; #DEBUG_LINE_NO:525
    Self.ProcessGroupData(SpawnGroupC_Definition, SpawnGroupC_SpawnData, iStageID) ; #DEBUG_LINE_NO:526
    Self.ProcessGroupData(SpawnGroupD_Definition, SpawnGroupD_SpawnData, iStageID) ; #DEBUG_LINE_NO:527
    Self.ProcessGroupData(SpawnGroupE_Definition, SpawnGroupE_SpawnData, iStageID) ; #DEBUG_LINE_NO:528
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ProcessGroupData(defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, Int StageToCheck)
  If Definition == None || Definition.ChosenGroup == None || Definition.ChosenOccupation == None || SpawnData == None || SpawnData.Length == 0 ; #DEBUG_LINE_NO:536
    Return  ; #DEBUG_LINE_NO:538
  EndIf ; #DEBUG_LINE_NO:
  If Definition.SpawnStage > -1 && Definition.SpawnStage != StageToCheck ; #DEBUG_LINE_NO:541
    Return  ; #DEBUG_LINE_NO:543
  EndIf ; #DEBUG_LINE_NO:
  If Definition.Conditions as Bool && Definition.Conditions.IsTrue(Definition.ConditionAlias.GetReference(), None) == False ; #DEBUG_LINE_NO:546
    Return  ; #DEBUG_LINE_NO:548
  EndIf ; #DEBUG_LINE_NO:
  Int spawnGroupID = 0 ; #DEBUG_LINE_NO:551
  If Definition == SpawnGroupA_Definition ; #DEBUG_LINE_NO:552
    spawnGroupID = 1 ; #DEBUG_LINE_NO:553
  ElseIf Definition == SpawnGroupB_Definition ; #DEBUG_LINE_NO:554
    spawnGroupID = 2 ; #DEBUG_LINE_NO:555
  ElseIf Definition == SpawnGroupC_Definition ; #DEBUG_LINE_NO:556
    spawnGroupID = 3 ; #DEBUG_LINE_NO:557
  ElseIf Definition == SpawnGroupD_Definition ; #DEBUG_LINE_NO:558
    spawnGroupID = 4 ; #DEBUG_LINE_NO:559
  ElseIf Definition == SpawnGroupE_Definition ; #DEBUG_LINE_NO:560
    spawnGroupID = 5 ; #DEBUG_LINE_NO:561
  EndIf ; #DEBUG_LINE_NO:
  If Definition.SpawnStage > -1 && Definition.SpawnStage == StageToCheck ; #DEBUG_LINE_NO:565
    StageToCheck = -1 ; #DEBUG_LINE_NO:567
  EndIf ; #DEBUG_LINE_NO:
  defaultgroupspawnquestscript:spawngroup_spawndatum[] validSpawnData = Self.GetValidSpawnData(SpawnData, StageToCheck) ; #DEBUG_LINE_NO:570
  If validSpawnData.Length > 0 ; #DEBUG_LINE_NO:573
    Bool spawnedSomething = False ; #DEBUG_LINE_NO:574
    Int I = 0 ; #DEBUG_LINE_NO:575
    While I < validSpawnData.Length ; #DEBUG_LINE_NO:576
      defaultgroupspawnquestscript:spawngroup_spawndatum SpawnDatum = validSpawnData[I] ; #DEBUG_LINE_NO:577
      If Self.Spawn(Definition, SpawnData, SpawnDatum) ; #DEBUG_LINE_NO:578
        spawnedSomething = True ; #DEBUG_LINE_NO:580
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:584
    EndWhile ; #DEBUG_LINE_NO:
    If spawnedSomething ; #DEBUG_LINE_NO:587
      defaultgroupspawnquestscript:spawngroupdoneeventargs spawnArgs = new defaultgroupspawnquestscript:spawngroupdoneeventargs ; #DEBUG_LINE_NO:590
      spawnArgs.SpawnGroupNumber = spawnGroupID ; #DEBUG_LINE_NO:591
      spawnArgs.SpawnedGroup = Definition.ChosenGroup ; #DEBUG_LINE_NO:592
      spawnArgs.SpawnedOccupation = Definition.ChosenOccupation ; #DEBUG_LINE_NO:593
      If Definition.LocationAliasToSetOwnershipOn ; #DEBUG_LINE_NO:596
        Location locToSetOwnerOn = Definition.LocationAliasToSetOwnershipOn.GetLocation() ; #DEBUG_LINE_NO:597
        If locToSetOwnerOn ; #DEBUG_LINE_NO:598
          Faction owningFaction = Definition.ChosenGroup.GetFactionForLocationOwnership() ; #DEBUG_LINE_NO:599
          locToSetOwnerOn.SetFactionOwner(owningFaction) ; #DEBUG_LINE_NO:602
          If Self_As_OEScript as Bool && Self_As_OEScript.owningFaction == None ; #DEBUG_LINE_NO:607
            Self_As_OEScript.owningFaction = owningFaction ; #DEBUG_LINE_NO:609
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.SendSpawnGroupDoneEvent(spawnArgs) ; #DEBUG_LINE_NO:614
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

defaultgroupspawnquestscript:spawngroup_spawndatum[] Function GetValidSpawnData(defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, Int iStageID)
  defaultgroupspawnquestscript:spawngroup_spawndatum[] validData = new defaultgroupspawnquestscript:spawngroup_spawndatum[0] ; #DEBUG_LINE_NO:622
  defaultgroupspawnquestscript:spawngroup_spawndatum[] spawnDataWithMatchingStage = SpawnData.GetMatchingStructs("StageToSpawn", iStageID, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:624
  Int index = 0 ; #DEBUG_LINE_NO:627
  While index < spawnDataWithMatchingStage.Length ; #DEBUG_LINE_NO:628
    defaultgroupspawnquestscript:spawngroup_spawndatum currentSpawnData = spawnDataWithMatchingStage[index] ; #DEBUG_LINE_NO:629
    ObjectReference spawnAtRef = None ; #DEBUG_LINE_NO:635
    If currentSpawnData.SpawnAt is ReferenceAlias ; #DEBUG_LINE_NO:636
      spawnAtRef = (currentSpawnData.SpawnAt as ReferenceAlias).GetRef() ; #DEBUG_LINE_NO:637
    ElseIf currentSpawnData.SpawnAt is RefCollectionAlias ; #DEBUG_LINE_NO:638
      spawnAtRef = (currentSpawnData.SpawnAt as RefCollectionAlias).GetAt(0) ; #DEBUG_LINE_NO:639
    EndIf ; #DEBUG_LINE_NO:
    If spawnAtRef == None ; #DEBUG_LINE_NO:642
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      conditionform spawnConditionsToCheck = currentSpawnData.SpawnConditions ; #DEBUG_LINE_NO:645
      If spawnConditionsToCheck == None || spawnConditionsToCheck.IsTrue(spawnAtRef, None) ; #DEBUG_LINE_NO:647
        validData.add(currentSpawnData, 1) ; #DEBUG_LINE_NO:649
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:655
  EndWhile ; #DEBUG_LINE_NO:
  Return validData ; #DEBUG_LINE_NO:659
EndFunction

Bool Function Spawn(defaultgroupspawnquestscript:spawngroup_definitiondatum Definition, defaultgroupspawnquestscript:spawngroup_spawndatum[] SpawnData, defaultgroupspawnquestscript:spawngroup_spawndatum SpawnDatum)
  If Definition == None || SpawnDatum == None ; #DEBUG_LINE_NO:680
    Return False ; #DEBUG_LINE_NO:682
  EndIf ; #DEBUG_LINE_NO:
  If Definition.ChosenGroup == None || Definition.ChosenOccupation == None ; #DEBUG_LINE_NO:685
    Return False ; #DEBUG_LINE_NO:687
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference spawnAtRef = None ; #DEBUG_LINE_NO:691
  ReferenceAlias spawnAtRefAlias = SpawnDatum.SpawnAt as ReferenceAlias ; #DEBUG_LINE_NO:693
  RefCollectionAlias spawnAtRefCol = None ; #DEBUG_LINE_NO:694
  If spawnAtRefAlias ; #DEBUG_LINE_NO:695
    spawnAtRef = spawnAtRefAlias.GetReference() ; #DEBUG_LINE_NO:696
  Else ; #DEBUG_LINE_NO:
    spawnAtRefCol = SpawnDatum.SpawnAt as RefCollectionAlias ; #DEBUG_LINE_NO:698
    If spawnAtRefCol == None ; #DEBUG_LINE_NO:700
      Return False ; #DEBUG_LINE_NO:702
    EndIf ; #DEBUG_LINE_NO:
    spawnAtRef = spawnAtRefCol.GetAt(0) ; #DEBUG_LINE_NO:705
  EndIf ; #DEBUG_LINE_NO:
  If spawnAtRef == None ; #DEBUG_LINE_NO:708
    Return False ; #DEBUG_LINE_NO:710
  EndIf ; #DEBUG_LINE_NO:
  Faction crimeFaction = Definition.crimeFaction ; #DEBUG_LINE_NO:714
  If crimeFaction == None ; #DEBUG_LINE_NO:715
    Definition.crimeFaction = Definition.ChosenGroup.GetFactionForLocationOwnership() ; #DEBUG_LINE_NO:717
    crimeFaction = Definition.crimeFaction ; #DEBUG_LINE_NO:718
  EndIf ; #DEBUG_LINE_NO:
  RefCollectionAlias currentRefCol = SpawnDatum.SpawnAlias as RefCollectionAlias ; #DEBUG_LINE_NO:724
  If currentRefCol ; #DEBUG_LINE_NO:725
    If Definition.AllowSpawningIntoNonEmptyAliases == True || currentRefCol.GetCount() == 0 ; #DEBUG_LINE_NO:726
      Bool spawningCorpses = SpawnDatum.SpawnType == SQ_Groups.SQ_Group_SpawnType_Corpse ; #DEBUG_LINE_NO:727
      If SpawnDatum.SpawnAllAtEach && spawningCorpses == False ; #DEBUG_LINE_NO:730
        Int I = 0 ; #DEBUG_LINE_NO:733
        While I < spawnAtRefCol.GetCount() ; #DEBUG_LINE_NO:734
          spawnAtRef = spawnAtRefCol.GetAt(I) ; #DEBUG_LINE_NO:735
          Int numToSpawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn) ; #DEBUG_LINE_NO:737
          Int countSpawned = 0 ; #DEBUG_LINE_NO:740
          While countSpawned < numToSpawn ; #DEBUG_LINE_NO:741
            ObjectReference refToAdd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression) ; #DEBUG_LINE_NO:742
            currentRefCol.AddRef(refToAdd) ; #DEBUG_LINE_NO:744
            countSpawned += 1 ; #DEBUG_LINE_NO:745
          EndWhile ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:748
        EndWhile ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Int numtospawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn) ; #DEBUG_LINE_NO:753
        Int CountOfSpawnAtRefCol = 1 ; #DEBUG_LINE_NO:755
        If spawnAtRefCol ; #DEBUG_LINE_NO:756
          CountOfSpawnAtRefCol = spawnAtRefCol.GetCount() ; #DEBUG_LINE_NO:757
        EndIf ; #DEBUG_LINE_NO:
        If spawningCorpses ; #DEBUG_LINE_NO:760
          numtospawn = Math.Min(CountOfSpawnAtRefCol as Float, numtospawn as Float) as Int ; #DEBUG_LINE_NO:762
        EndIf ; #DEBUG_LINE_NO:
        Int countspawned = 0 ; #DEBUG_LINE_NO:766
        While countspawned < numtospawn ; #DEBUG_LINE_NO:767
          If spawnAtRefCol ; #DEBUG_LINE_NO:770
            spawnAtRef = spawnAtRefCol.GetAt(countspawned % CountOfSpawnAtRefCol) ; #DEBUG_LINE_NO:771
          EndIf ; #DEBUG_LINE_NO:
          ObjectReference reftoadd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression) ; #DEBUG_LINE_NO:774
          currentRefCol.AddRef(reftoadd) ; #DEBUG_LINE_NO:776
          countspawned += 1 ; #DEBUG_LINE_NO:778
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If SpawnDatum.SetOverrideNameLeader || SpawnDatum.SetOverrideNameVendor ; #DEBUG_LINE_NO:782
        Int i = 0 ; #DEBUG_LINE_NO:783
        While i < currentRefCol.GetCount() ; #DEBUG_LINE_NO:784
          ObjectReference refToName = currentRefCol.GetAt(i) ; #DEBUG_LINE_NO:785
          If SpawnDatum.SetOverrideNameLeader ; #DEBUG_LINE_NO:787
            Definition.ChosenOccupation.SetOverrideNameLeader(refToName as Actor) ; #DEBUG_LINE_NO:789
          EndIf ; #DEBUG_LINE_NO:
          If SpawnDatum.SetOverrideNameVendor ; #DEBUG_LINE_NO:792
            Definition.ChosenOccupation.SetOverrideNameVendor(refToName as Actor) ; #DEBUG_LINE_NO:794
          EndIf ; #DEBUG_LINE_NO:
          i += 1 ; #DEBUG_LINE_NO:797
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If SpawnDatum.Register_With_REScript && Self_As_REScript as Bool ; #DEBUG_LINE_NO:804
        Self_As_REScript.RegisterCollectionAlias(currentRefCol) ; #DEBUG_LINE_NO:805
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Return False ; #DEBUG_LINE_NO:809
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    ReferenceAlias currentRefAlias = SpawnDatum.SpawnAlias as ReferenceAlias ; #DEBUG_LINE_NO:813
    If currentRefAlias ; #DEBUG_LINE_NO:814
      If Definition.AllowSpawningIntoNonEmptyAliases == True || currentRefAlias.GetRef() == None ; #DEBUG_LINE_NO:815
        ObjectReference spawnedRef = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression) ; #DEBUG_LINE_NO:817
        currentRefAlias.ForceRefTo(spawnedRef) ; #DEBUG_LINE_NO:818
        If SpawnDatum.SetOverrideNameLeader ; #DEBUG_LINE_NO:822
          Definition.ChosenOccupation.SetOverrideNameLeader(spawnedRef as Actor) ; #DEBUG_LINE_NO:824
        EndIf ; #DEBUG_LINE_NO:
        If SpawnDatum.SetOverrideNameVendor ; #DEBUG_LINE_NO:827
          Definition.ChosenOccupation.SetOverrideNameVendor(spawnedRef as Actor) ; #DEBUG_LINE_NO:829
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Return False ; #DEBUG_LINE_NO:833
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Return False ; #DEBUG_LINE_NO:837
    EndIf ; #DEBUG_LINE_NO:
    If SpawnDatum.Register_With_REScript && Self_As_REScript as Bool ; #DEBUG_LINE_NO:841
      Self_As_REScript.RegisterAlias(currentRefAlias) ; #DEBUG_LINE_NO:842
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  defaultgroupspawnquestscript:spawneventargs spawnArgs = new defaultgroupspawnquestscript:spawneventargs ; #DEBUG_LINE_NO:847
  If Definition == SpawnGroupA_Definition ; #DEBUG_LINE_NO:848
    spawnArgs.SpawnGroupNumber = 1 ; #DEBUG_LINE_NO:849
  ElseIf Definition == SpawnGroupB_Definition ; #DEBUG_LINE_NO:850
    spawnArgs.SpawnGroupNumber = 2 ; #DEBUG_LINE_NO:851
  ElseIf Definition == SpawnGroupC_Definition ; #DEBUG_LINE_NO:852
    spawnArgs.SpawnGroupNumber = 3 ; #DEBUG_LINE_NO:853
  ElseIf Definition == SpawnGroupD_Definition ; #DEBUG_LINE_NO:854
    spawnArgs.SpawnGroupNumber = 4 ; #DEBUG_LINE_NO:855
  ElseIf Definition == SpawnGroupE_Definition ; #DEBUG_LINE_NO:856
    spawnArgs.SpawnGroupNumber = 5 ; #DEBUG_LINE_NO:857
  EndIf ; #DEBUG_LINE_NO:
  spawnArgs.SpawnDataIndex = SpawnData.find(SpawnDatum, 0) ; #DEBUG_LINE_NO:860
  spawnArgs.SpawnAlias = SpawnDatum.SpawnAlias ; #DEBUG_LINE_NO:861
  spawnArgs.SpawnAtAlias = SpawnDatum.SpawnAt ; #DEBUG_LINE_NO:862
  spawnArgs.SpawnedGroup = Definition.ChosenGroup ; #DEBUG_LINE_NO:863
  spawnArgs.SpawnedOccupation = Definition.ChosenOccupation ; #DEBUG_LINE_NO:864
  Self.SendSpawnEvent(spawnArgs) ; #DEBUG_LINE_NO:866
  Return True ; #DEBUG_LINE_NO:869
EndFunction

Bool Function WaitForInitialGroupSetup()
  Float maxWait = 30.0 ; #DEBUG_LINE_NO:874
  Float waitTime = 0.200000003 ; #DEBUG_LINE_NO:875
  Float waitingFor = 0.0 ; #DEBUG_LINE_NO:876
  While GroupSetupCompleted == False && waitingFor < maxWait ; #DEBUG_LINE_NO:877
    Utility.Wait(waitTime) ; #DEBUG_LINE_NO:878
    waitingFor += waitTime ; #DEBUG_LINE_NO:879
  EndWhile ; #DEBUG_LINE_NO:
  If waitingFor >= maxWait ; #DEBUG_LINE_NO:883
    Return False ; #DEBUG_LINE_NO:885
  EndIf ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:888
EndFunction

spaceshipbase Function GetShipToSpawnForGroup(Int GroupToGetShipFor, ObjectReference landingMarkerRef, GlobalVariable SpawnType)
  If Self.WaitForInitialGroupSetup() == False ; #DEBUG_LINE_NO:899
    Return None ; #DEBUG_LINE_NO:901
  EndIf ; #DEBUG_LINE_NO:
  defaultgroupspawnquestscript:spawngroup_definitiondatum definitionToSpawnWith = Self.GetSpawnGroupDefinitionDatum(GroupToGetShipFor) ; #DEBUG_LINE_NO:904
  If definitionToSpawnWith == None ; #DEBUG_LINE_NO:906
    Return None ; #DEBUG_LINE_NO:908
  EndIf ; #DEBUG_LINE_NO:
  spaceshipbase spaceshipBaseToReturn = definitionToSpawnWith.ChosenGroup.GetSpaceshipBaseToSpawn(landingMarkerRef, SpawnType, definitionToSpawnWith.ChosenOccupation) ; #DEBUG_LINE_NO:911
  Return spaceshipBaseToReturn ; #DEBUG_LINE_NO:914
EndFunction

Faction Function GetGroupOwnershipFaction(Int groupID)
  If Self.WaitForInitialGroupSetup() == False ; #DEBUG_LINE_NO:919
    Return None ; #DEBUG_LINE_NO:921
  EndIf ; #DEBUG_LINE_NO:
  defaultgroupspawnquestscript:spawngroup_definitiondatum groupDefinition = Self.GetSpawnGroupDefinitionDatum(groupID) ; #DEBUG_LINE_NO:924
  Faction owningFaction = groupDefinition.ChosenGroup.GetFactionForLocationOwnership() ; #DEBUG_LINE_NO:926
  Return owningFaction ; #DEBUG_LINE_NO:928
EndFunction

defaultgroupspawnquestscript:spawngroup_definitiondatum Function GetSpawnGroupDefinitionDatum(Int groupID)
  defaultgroupspawnquestscript:spawngroup_definitiondatum definitionToSpawnWith = None ; #DEBUG_LINE_NO:932
  If groupID == 0 ; #DEBUG_LINE_NO:934
    definitionToSpawnWith = SpawnGroupA_Definition ; #DEBUG_LINE_NO:935
  ElseIf groupID == 1 ; #DEBUG_LINE_NO:936
    definitionToSpawnWith = SpawnGroupB_Definition ; #DEBUG_LINE_NO:937
  ElseIf groupID == 2 ; #DEBUG_LINE_NO:938
    definitionToSpawnWith = SpawnGroupC_Definition ; #DEBUG_LINE_NO:939
  ElseIf groupID == 3 ; #DEBUG_LINE_NO:940
    definitionToSpawnWith = SpawnGroupD_Definition ; #DEBUG_LINE_NO:941
  ElseIf groupID == 4 ; #DEBUG_LINE_NO:942
    definitionToSpawnWith = SpawnGroupE_Definition ; #DEBUG_LINE_NO:943
  EndIf ; #DEBUG_LINE_NO:
  Return definitionToSpawnWith ; #DEBUG_LINE_NO:947
EndFunction

Function DefineCustomLogs()
  logs = new customlogs:logdatum[0] ; #DEBUG_LINE_NO:956
  customlogs.AddCustomLog(logs, "SQ_Groups", "DefaultGroupSpawnQuestScript", True, True, "", True) ; #DEBUG_LINE_NO:959
  If Self_As_OEScript ; #DEBUG_LINE_NO:969
    customlogs.AddCustomLog(logs, Self_As_OEScript.MainLogName, "", !Self_As_OEScript.TerseLog, True, LocalScriptName, Self_As_OEScript.DebugMode) ; #DEBUG_LINE_NO:971,973,976,970
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:983
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint) ; #DEBUG_LINE_NO:987
EndFunction
