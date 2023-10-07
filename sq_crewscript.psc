ScriptName SQ_CrewScript Extends SQ_ActorRolesScript

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard crewAssignmentLock
Guard outpostCrewUpdateLock

;-- Properties --------------------------------------
Group CrewData
  ReferenceAlias Property ActiveEliteCrew Auto Const mandatory
  { autofill; when actively following the player, Elite Crew will be in this alias }
  Keyword Property COM_CREW_DismissedGenericTopic Auto Const mandatory
  { autofill; when unassigned through the menu while actively following the player, and Elite Crew will say this dialogue topic subtype, also when picking up companions or other elite crew }
  Faction Property AvailableCrewFaction Auto Const mandatory
  { autofill }
  Faction Property COM_CREW_CrimeFaction_IgnoreNonMembers Auto Const mandatory
  { autofill; makes them not report crime against non-crew after becoming available }
  Faction Property COM_CREW_CrimeFaction_IgnoreNonMembersNonViolent Auto Const mandatory
  { autofill; makes them not report non-violent crime against non-crew after becoming available }
  MiscObject Property Credits Auto Const mandatory
  { Autofill Credits }
  ReferenceAlias Property HomeShip Auto Const mandatory
  { player home ship }
  RefCollectionAlias Property CrewGoingHome Auto Const mandatory
  { actors in this alias are waiting to go home after being unassigned from an outpost }
  RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
  { actors in this alias are waiting to go to an outpost }
  crew_genericcrewquestscript Property CREW_GenericCrew Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeElite Auto Const mandatory
  { autofill }
  Keyword Property Crew_CrewTypeGeneric Auto Const mandatory
  { autofill }
  ActorValue Property Crew_Elite_BackstoryFollowup_Day Auto Const mandatory
  { autofill }
  GlobalVariable Property Crew_Elite_BackstoryFollowup_CooldownDays Auto Const mandatory
  { autofill }
  ActorValue Property Crew_CostTableIndex Auto Const mandatory
  { Autofill; Holds an index into the below CrewCostTables for a particular crew member.
Reminder: this AV defaults to -1 so we can tell the difference between unset and set index of 0, 
in case someone wants to specify a particular value for specific elite crew member }
  ActorValue Property Crew_CostMult Auto Const mandatory
  { autofill; holds the multiplier on the base crew cost for a particular crew member. Defaults to 1.0. Set to 0.75 to grant a 25% discount. }
  ActorValue Property FOL_ActiveFollower Auto Const mandatory
  { track if crew member has been dismissed }
  ActorValue Property COM_PQ_LockedIn Auto Const mandatory
  { track if crew member is Locked In }
  Int[] Property CrewCostTable_Elite Auto Const mandatory
  { A tight range of aesthetic values of hire costs for elite crew. (500, 525, 550) etc. }
  Int[] Property CrewCostTable_Generic Auto Const mandatory
  { A tight range of aesthetic values of hire costs for generic crew. (200, 225, 250) etc. }
  ReferenceAlias Property OutpostCrewApply Auto Const mandatory
  { used for stamping data onto crew assigned to an outpost }
  Keyword Property LinkOutpostCrewMarker01 Auto Const mandatory
  { autofill }
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { autofill }
  ActorBase Property Crew_LvlCrew_Any Auto Const mandatory
  { used to debug create crew }
  Keyword Property CREW_AlwaysTeammateWhenAssigned Auto Const mandatory
  { Autofill; currently for Vasco to prevent aggroing while standing outside the ship if not currently a follower but in a space the player is allowed to be because of factions }
  ActorValue Property SpaceshipCrewSlots Auto Const mandatory
  { autofill }
EndGroup

achievements_companionsandelitecrew Property Achievements_Quest Auto Const mandatory
{ autofill }
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Parent.OnQuestInit() ; #DEBUG_LINE_NO:99
  ReferenceAlias RefAlias_Available = Alias_Available as ReferenceAlias ; #DEBUG_LINE_NO:101
  RefCollectionAlias RefColAlias_Available = Alias_Available as RefCollectionAlias ; #DEBUG_LINE_NO:102
  If RefAlias_Available ; #DEBUG_LINE_NO:103
    Self.RegisterForRemoteEvent(RefAlias_Available as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:104
    Self.RegisterForRemoteEvent(RefAlias_Available as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:105
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(RefColAlias_Available as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:107
    Self.RegisterForRemoteEvent(RefColAlias_Available as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(CrewGoingHome as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:111
  Self.RegisterForRemoteEvent(CrewGoingToOutposts as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:112
  Self.WarnOnFalseAssumptions() ; #DEBUG_LINE_NO:115
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSource, ObjectReference akSenderRef)
  If akSource == CrewGoingHome ; #DEBUG_LINE_NO:120
    Self.HandleCrewGoingHomeUnloaded(akSource) ; #DEBUG_LINE_NO:121
  ElseIf akSource as Alias == Alias_Available ; #DEBUG_LINE_NO:122
    Self.TestAndHandleUnloadedUnassignedGenericCrew(akSenderRef as Actor) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
  Self.TestAndHandleUnloadedUnassignedGenericCrew(akSender.GetActorRef()) ; #DEBUG_LINE_NO:129
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
  Game.RemoveFromAvailableCrew(akSender.GetActorRef()) ; #DEBUG_LINE_NO:134
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
  Game.RemoveFromAvailableCrew(akSenderRef as Actor) ; #DEBUG_LINE_NO:139
EndEvent

Function WarnOnFalseAssumptions()
  Alias AliasActiveVar = Alias_Active ; #DEBUG_LINE_NO:145
  Bool isAlias_Active_a_RefCollectionAlias = AliasActiveVar is RefCollectionAlias ; #DEBUG_LINE_NO:146
  If isAlias_Active_a_RefCollectionAlias == False ; #DEBUG_LINE_NO:148
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  Game.AddToAvailableCrew(ActorToUpdate) ; #DEBUG_LINE_NO:161
  Faction replacementCrimeFaction = None ; #DEBUG_LINE_NO:163
  companioncrimeresponsescript CrimeResponseActor = ActorToUpdate as companioncrimeresponsescript ; #DEBUG_LINE_NO:165
  If CrimeResponseActor as Bool == False ; #DEBUG_LINE_NO:168
    replacementCrimeFaction = COM_CREW_CrimeFaction_IgnoreNonMembers ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
  If replacementCrimeFaction != None ; #DEBUG_LINE_NO:172
    Faction currentCrimeFaction = ActorToUpdate.GetCrimeFaction() ; #DEBUG_LINE_NO:173
    ActorToUpdate.RemoveFromFaction(currentCrimeFaction) ; #DEBUG_LINE_NO:175
    ActorToUpdate.SetCrimeFaction(replacementCrimeFaction) ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsEliteCrew(ActorToUpdate) ; #DEBUG_LINE_NO:179
    Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate) ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
  Game.RemoveFromAvailableCrew(ActorToUpdate) ; #DEBUG_LINE_NO:188
  ObjectReference assignedRef = ActorToUpdate.GetCrewAssignment() ; #DEBUG_LINE_NO:189
  If assignedRef ; #DEBUG_LINE_NO:190
    assignedRef.UnassignCrew(ActorToUpdate) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  If ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned) ; #DEBUG_LINE_NO:197
    ActorToUpdate.SetPlayerTeammate(True, False, False) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  If Self.IsEliteCrew(ActorToUpdate) ; #DEBUG_LINE_NO:206
    Self.SetEliteCrewInactive(ActorToUpdate, False) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
  If ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned) ; #DEBUG_LINE_NO:211
    ActorToUpdate.SetPlayerTeammate(False, False, False) ; #DEBUG_LINE_NO:213
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetEliteCrewActive(Actor EliteCrew)
  Actor companionActorToDismiss = SQ_Companions.GetActiveActor() ; #DEBUG_LINE_NO:223
  If companionActorToDismiss != None ; #DEBUG_LINE_NO:224
    companionActorToDismiss.SayCustom(COM_CREW_DismissedGenericTopic, None, False, None) ; #DEBUG_LINE_NO:225
    SQ_Companions.SetRoleInactive(companionActorToDismiss, True, False, True) ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  Actor eliteCrewToDismiss = ActiveEliteCrew.GetActorReference() ; #DEBUG_LINE_NO:229
  If eliteCrewToDismiss != None ; #DEBUG_LINE_NO:230
    Self.SetEliteCrewInactive(eliteCrewToDismiss, True) ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  ActiveEliteCrew.ForceRefTo(EliteCrew as ObjectReference) ; #DEBUG_LINE_NO:234
  SQ_Followers.SetRoleActive(EliteCrew, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:235
EndFunction

Function SetEliteCrewInactive(Actor EliteCrew, Bool SayUnassignedLine)
  Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef() ; #DEBUG_LINE_NO:242
  If activeEliteCrewRef as Bool && activeEliteCrewRef == EliteCrew ; #DEBUG_LINE_NO:246
    ActiveEliteCrew.Clear() ; #DEBUG_LINE_NO:247
    If SayUnassignedLine ; #DEBUG_LINE_NO:249
      EliteCrew.SayCustom(COM_CREW_DismissedGenericTopic, None, False, None) ; #DEBUG_LINE_NO:251
    EndIf ; #DEBUG_LINE_NO:
    SQ_Followers.SetRoleInactive(EliteCrew, True, False, True) ; #DEBUG_LINE_NO:254
    EliteCrew.StopCombatAlarm() ; #DEBUG_LINE_NO:257
    EliteCrew.StopCombat() ; #DEBUG_LINE_NO:258
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsEliteCrew(Actor ActorToCheck)
  Return ActorToCheck.HasKeyword(Crew_CrewTypeElite) ; #DEBUG_LINE_NO:263
EndFunction

Bool Function IsActiveEliteCrew(Actor ActorToCheck)
  Return ActiveEliteCrew.GetActorRef() == ActorToCheck ; #DEBUG_LINE_NO:267
EndFunction

Function SetRecruitCost(Actor CrewMember)
  Int[] costTable = Self.GetRecruitCostTable(CrewMember) ; #DEBUG_LINE_NO:278
  If CrewMember.GetValue(Crew_CostTableIndex) < 0.0 ; #DEBUG_LINE_NO:281
    Int iRandom = Utility.RandomInt(0, costTable.Length - 1) ; #DEBUG_LINE_NO:282
    CrewMember.SetValue(Crew_CostTableIndex, iRandom as Float) ; #DEBUG_LINE_NO:285
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetRecruitCostMult(Actor CrewMember, Float Mult)
  CrewMember.SetValue(Crew_CostMult, Mult) ; #DEBUG_LINE_NO:292
EndFunction

Int Function GetRecruitCost(Actor CrewMember)
  If CrewMember.GetValue(Crew_CostTableIndex) < 0.0 ; #DEBUG_LINE_NO:299
    Self.SetRecruitCost(CrewMember) ; #DEBUG_LINE_NO:301
  EndIf ; #DEBUG_LINE_NO:
  Int[] costTable = Self.GetRecruitCostTable(CrewMember) ; #DEBUG_LINE_NO:304
  Int cost = costTable[CrewMember.GetValue(Crew_CostTableIndex) as Int] ; #DEBUG_LINE_NO:306
  Float Mult = CrewMember.GetValue(Crew_CostMult) ; #DEBUG_LINE_NO:307
  Int returnVal = (cost as Float * Mult) as Int ; #DEBUG_LINE_NO:308
  Return returnVal ; #DEBUG_LINE_NO:312
EndFunction

Int[] Function GetRecruitCostTable(Actor CrewMember)
  Int[] costTable = None ; #DEBUG_LINE_NO:317
  If CrewMember.HasKeyword(Crew_CrewTypeElite) ; #DEBUG_LINE_NO:318
    costTable = CrewCostTable_Elite ; #DEBUG_LINE_NO:319
  ElseIf CrewMember.HasKeyword(Crew_CrewTypeGeneric) ; #DEBUG_LINE_NO:320
    costTable = CrewCostTable_Generic ; #DEBUG_LINE_NO:321
  Else ; #DEBUG_LINE_NO:
    costTable = CrewCostTable_Generic ; #DEBUG_LINE_NO:324
  EndIf ; #DEBUG_LINE_NO:
  Return costTable ; #DEBUG_LINE_NO:328
EndFunction

Function AssignCrew(Actor assignedCrew, spaceshipreference assignedShip)
  assignedShip.AssignCrew(assignedCrew) ; #DEBUG_LINE_NO:339
EndFunction

Function HandleOnCrewAssigned(Actor assignedCrew, ObjectReference assignedRef)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:346
    Self.SetRoleActive(assignedCrew, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:347
    spaceshipreference assignedShip = assignedRef as spaceshipreference ; #DEBUG_LINE_NO:348
    If assignedShip ; #DEBUG_LINE_NO:349
      CrewGoingToOutposts.RemoveRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:350
      assignedCrew.SetLinkedRef(None, LinkOutpostCrewMarker01, True) ; #DEBUG_LINE_NO:351
    Else ; #DEBUG_LINE_NO:
      DismissedCrew.RemoveRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:354
      DisembarkingCrew.RemoveRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:355
      assignedCrew.SetLinkedRef(assignedRef, LinkOutpostCrewMarker01, True) ; #DEBUG_LINE_NO:358
      If assignedCrew.Is3DLoaded() || assignedRef.Is3DLoaded() ; #DEBUG_LINE_NO:361
        CrewGoingToOutposts.AddRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:363
      ElseIf assignedCrew.GetValue(COM_PQ_LockedIn) == 1.0 && assignedCrew.GetValue(FOL_ActiveFollower) == 0.0 ; #DEBUG_LINE_NO:364
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        assignedCrew.MoveTo(assignedRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:369
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    CrewGoingHome.RemoveRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:374
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function HandleOnCrewDismissed(Actor unassignedCrew, ObjectReference previousAssignmentRef)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:384
    ObjectReference newAssignment = unassignedCrew.GetCrewAssignment() ; #DEBUG_LINE_NO:386
    Bool dismissMe = newAssignment == None ; #DEBUG_LINE_NO:388
    If dismissMe ; #DEBUG_LINE_NO:389
      If unassignedCrew.HasKeyword(Crew_CrewTypeElite) ; #DEBUG_LINE_NO:395
        Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef() ; #DEBUG_LINE_NO:396
        If activeEliteCrewRef as Bool && activeEliteCrewRef == unassignedCrew ; #DEBUG_LINE_NO:397
          Self.SetEliteCrewInactive(unassignedCrew, True) ; #DEBUG_LINE_NO:398
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.SetRoleInactive(unassignedCrew, False, False, True) ; #DEBUG_LINE_NO:402
      If previousAssignmentRef as outpostbeaconscript ; #DEBUG_LINE_NO:404
        If newAssignment is outpostbeaconscript == False ; #DEBUG_LINE_NO:406
          unassignedCrew.SetLinkedRef(None, LinkOutpostCrewMarker01, True) ; #DEBUG_LINE_NO:409
        EndIf ; #DEBUG_LINE_NO:
        If unassignedCrew.Is3DLoaded() ; #DEBUG_LINE_NO:412
          CrewGoingHome.AddRef(unassignedCrew as ObjectReference) ; #DEBUG_LINE_NO:413
        Else ; #DEBUG_LINE_NO:
          Self.MoveCrewHome(unassignedCrew as ObjectReference) ; #DEBUG_LINE_NO:415
        EndIf ; #DEBUG_LINE_NO:
      ElseIf previousAssignmentRef.IsDisabled() ; #DEBUG_LINE_NO:417
        Self.MoveCrewHome(unassignedCrew as ObjectReference) ; #DEBUG_LINE_NO:419
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Return dismissMe ; #DEBUG_LINE_NO:426
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function HandleCrewGoingHomeUnloaded(RefCollectionAlias RefCollectionOfCrewGoingHome)
  Int I = RefCollectionOfCrewGoingHome.GetCount() - 1 ; #DEBUG_LINE_NO:433
  While I > -1 ; #DEBUG_LINE_NO:434
    ObjectReference theCrew = RefCollectionOfCrewGoingHome.GetAt(I) ; #DEBUG_LINE_NO:435
    If theCrew is Actor == False ; #DEBUG_LINE_NO:437
      RefCollectionOfCrewGoingHome.RemoveRef(theCrew) ; #DEBUG_LINE_NO:439
    ElseIf Self.TestAndHandleUnloadedUnassignedGenericCrew(theCrew as Actor) ; #DEBUG_LINE_NO:442
       ; #DEBUG_LINE_NO:
    ElseIf RefCollectionOfCrewGoingHome == CrewGoingHome ; #DEBUG_LINE_NO:444
      Self.MoveCrewHome(theCrew) ; #DEBUG_LINE_NO:445
    ElseIf RefCollectionOfCrewGoingHome == CrewGoingToOutposts ; #DEBUG_LINE_NO:446
      Self.MoveCrewToAssignedOutpost(theCrew as Actor) ; #DEBUG_LINE_NO:447
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:452
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function TestAndHandleUnloadedUnassignedGenericCrew(Actor crewToTest)
  Guard crewAssignmentLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:461
    Bool isGeneric = crewToTest.HasKeyword(Crew_CrewTypeGeneric) ; #DEBUG_LINE_NO:464
    Bool isUnassigned = crewToTest.GetCrewAssignment() == None ; #DEBUG_LINE_NO:465
    Bool returnVal = False ; #DEBUG_LINE_NO:469
    If isGeneric && isUnassigned ; #DEBUG_LINE_NO:470
      Self.SetRoleUnavailable(crewToTest, True) ; #DEBUG_LINE_NO:472
      Game.RemoveFromAvailableCrew(crewToTest) ; #DEBUG_LINE_NO:475
      If CREW_GenericCrew.CrewMemberRef == crewToTest ; #DEBUG_LINE_NO:478
        CREW_GenericCrew.CrewMemberRef = None ; #DEBUG_LINE_NO:479
      EndIf ; #DEBUG_LINE_NO:
      SQ_PreventRecalc.RemoveRef(crewToTest as ObjectReference) ; #DEBUG_LINE_NO:483
      crewspawnerscript spawnMarker = crewToTest.GetLinkedRef(LinkGenericCrewSpawnMarker) as crewspawnerscript ; #DEBUG_LINE_NO:486
      If spawnMarker ; #DEBUG_LINE_NO:487
        spawnMarker.RemoveFromSpawnedCrewArray(crewToTest) ; #DEBUG_LINE_NO:488
      EndIf ; #DEBUG_LINE_NO:
      crewToTest.DisableNoWait(False) ; #DEBUG_LINE_NO:492
      crewToTest.Delete() ; #DEBUG_LINE_NO:493
      returnVal = True ; #DEBUG_LINE_NO:495
    EndIf ; #DEBUG_LINE_NO:
    Return returnVal ; #DEBUG_LINE_NO:497
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveCrewHome(ObjectReference unassignedCrew)
  RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias ; #DEBUG_LINE_NO:504
  If activeCrew.Find(unassignedCrew) < 0 ; #DEBUG_LINE_NO:506
    SQ_PlayerShip.MoveCrewToHome(unassignedCrew as Actor) ; #DEBUG_LINE_NO:509
  EndIf ; #DEBUG_LINE_NO:
  CrewGoingHome.RemoveRef(unassignedCrew) ; #DEBUG_LINE_NO:512
EndFunction

Function MoveCrewToAssignedOutpost(Actor assignedCrew)
  ObjectReference myAssignment = assignedCrew.GetCrewAssignment() ; #DEBUG_LINE_NO:516
  If myAssignment ; #DEBUG_LINE_NO:518
    If assignedCrew.GetValue(COM_PQ_LockedIn) == 1.0 && assignedCrew.GetValue(FOL_ActiveFollower) == 0.0 ; #DEBUG_LINE_NO:519
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      assignedCrew.MoveTo(myAssignment, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:522
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  CrewGoingToOutposts.RemoveRef(assignedCrew as ObjectReference) ; #DEBUG_LINE_NO:526
EndFunction

Actor[] Function GetCrewAssignedToOutpost(ObjectReference outpostRef)
  RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias ; #DEBUG_LINE_NO:530
  Actor[] assignedCrew = new Actor[0] ; #DEBUG_LINE_NO:531
  Int I = 0 ; #DEBUG_LINE_NO:532
  Int crewCount = activeCrew.GetCount() ; #DEBUG_LINE_NO:533
  While I < crewCount ; #DEBUG_LINE_NO:534
    Actor testCrew = activeCrew.GetActorAt(I) ; #DEBUG_LINE_NO:535
    If testCrew ; #DEBUG_LINE_NO:536
      ObjectReference assignedOutpost = testCrew.GetLinkedRef(LinkOutpostCrewMarker01) ; #DEBUG_LINE_NO:537
      If assignedOutpost as Bool && assignedOutpost == outpostRef ; #DEBUG_LINE_NO:538
        assignedCrew.add(testCrew, 1) ; #DEBUG_LINE_NO:539
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:542
  EndWhile ; #DEBUG_LINE_NO:
  Return assignedCrew ; #DEBUG_LINE_NO:546
EndFunction

Function CheckCrewCountAtOutpost(ObjectReference outpostRef)
  If outpostRef ; #DEBUG_LINE_NO:551
    Guard outpostCrewUpdateLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:552
      Int crewSlots = outpostRef.GetValueInt(SpaceshipCrewSlots) ; #DEBUG_LINE_NO:554
      Actor[] assignedCrew = Self.GetCrewAssignedToOutpost(outpostRef) ; #DEBUG_LINE_NO:556
      If assignedCrew as Bool && assignedCrew.Length > crewSlots ; #DEBUG_LINE_NO:558
        Int I = assignedCrew.Length - 1 ; #DEBUG_LINE_NO:562
        While I > -1 && assignedCrew.Length > crewSlots ; #DEBUG_LINE_NO:563
          Actor theCrew = assignedCrew[I] ; #DEBUG_LINE_NO:564
          outpostRef.UnassignCrew(theCrew) ; #DEBUG_LINE_NO:565
          assignedCrew.removelast() ; #DEBUG_LINE_NO:566
          Self.ShowTextReplacedMessage(theCrew, NotActiveMessage, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:568
          I -= 1 ; #DEBUG_LINE_NO:569
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Actor Function DebugCreateCrew(ActorBase CrewBaseActor, spaceshipreference ShipRef)
  If CrewBaseActor == None ; #DEBUG_LINE_NO:580
    CrewBaseActor = Crew_LvlCrew_Any ; #DEBUG_LINE_NO:581
  EndIf ; #DEBUG_LINE_NO:
  If ShipRef == None ; #DEBUG_LINE_NO:586
    ShipRef = SQ_PlayerShip.DebugGetHomeShip() ; #DEBUG_LINE_NO:587
    If ShipRef == None ; #DEBUG_LINE_NO:588
      Return None ; #DEBUG_LINE_NO:589
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor newCrew = Game.GetPlayer().PlaceAtMe(CrewBaseActor as Form, 1, False, False, True, None, None, True) as Actor ; #DEBUG_LINE_NO:593
  Self.AssignCrew(newCrew, ShipRef) ; #DEBUG_LINE_NO:596
  Return newCrew ; #DEBUG_LINE_NO:598
EndFunction

Function DebugCreateCrewOnShip(spaceshipreference ShipRef, ActorBase CrewBaseActor)
  If ShipRef == None ; #DEBUG_LINE_NO:604
    ShipRef = SQ_PlayerShip.DebugGetHomeShip() ; #DEBUG_LINE_NO:605
    If ShipRef == None ; #DEBUG_LINE_NO:606
      Return  ; #DEBUG_LINE_NO:607
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor newCrew = Self.DebugCreateCrew(CrewBaseActor, ShipRef) ; #DEBUG_LINE_NO:611
  newCrew.MoveTo(ShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:614
EndFunction

Function DebugCreateCrewFromFormlist(FormList FormlistWithCrew, Bool AddToShip, spaceshipreference ShipRef)
  If ShipRef == None ; #DEBUG_LINE_NO:620
    ShipRef = SQ_PlayerShip.DebugGetHomeShip() ; #DEBUG_LINE_NO:621
    If ShipRef == None ; #DEBUG_LINE_NO:622
      Return  ; #DEBUG_LINE_NO:623
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:628
  Int iMax = FormlistWithCrew.GetSize() ; #DEBUG_LINE_NO:629
  While I < iMax ; #DEBUG_LINE_NO:630
    Form currentForm = FormlistWithCrew.GetAt(I) ; #DEBUG_LINE_NO:631
    ActorBase currentActorBase = currentForm as ActorBase ; #DEBUG_LINE_NO:634
    If currentActorBase ; #DEBUG_LINE_NO:636
      Actor crewActor = currentActorBase.GetUniqueActor() ; #DEBUG_LINE_NO:638
      If crewActor ; #DEBUG_LINE_NO:640
        Self.AssignCrew(crewActor, ShipRef) ; #DEBUG_LINE_NO:641
      Else ; #DEBUG_LINE_NO:
        crewActor = Self.DebugCreateCrew(currentActorBase, ShipRef) ; #DEBUG_LINE_NO:643
      EndIf ; #DEBUG_LINE_NO:
      If AddToShip && crewActor as Bool ; #DEBUG_LINE_NO:648
        crewActor.MoveTo(ShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:649
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:656
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DebugNewShipWithCrewLanded(FormList FormlistWithCrew, ObjectReference ReferenceToPutShipAt)
  spaceshipreference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipLanded(ReferenceToPutShipAt) ; #DEBUG_LINE_NO:662
  Self.DebugCreateCrewFromFormlist(FormlistWithCrew, True, homeshipRef) ; #DEBUG_LINE_NO:663
EndFunction

Function DebugNewShipWithCrewInSpace(FormList FormlistWithCrew, ObjectReference ReferenceToPutShipAt)
  spaceshipreference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipInSpace(ReferenceToPutShipAt) ; #DEBUG_LINE_NO:667
  Self.DebugCreateCrewFromFormlist(FormlistWithCrew, True, homeshipRef) ; #DEBUG_LINE_NO:668
EndFunction
