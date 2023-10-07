ScriptName UC04_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int iIntAlarmIndex

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CountGuard
Guard FollowerStateGuard

;-- Properties --------------------------------------
Group RefCollections
  RefCollectionAlias Property SpaceportGuards Auto Const mandatory
  { Ref collection that contains all the guards in the spaceport }
  RefCollectionAlias Property CoweringNPCs Auto Const mandatory
  { Collection of NPCs we want to stand around cowering during the sequence }
  RefCollectionAlias Property DisableNPCs Auto Const mandatory
  { Collection of NPCs we want to disable during the sequence }
  RefCollectionAlias Property KneelingNPCs Auto Const mandatory
  { Collection of NPCs we want to kneel in place during the sequence }
  RefCollectionAlias Property CaptiveCollection Auto Const mandatory
  { Collection used to keep appropriate NPCs out of combat }
  RefCollectionAlias Property Shutters Auto Const mandatory
  { Ref collection for the minister hall shutters }
  RefCollectionAlias Property PrimaryFloorManagers Auto Const mandatory
  { Floor marker objects for the main MAST floors. These get turned off during the main attack sequence }
  RefCollectionAlias Property VanguardCourseFloorManagers Auto Const mandatory
  { Floor marker objects for the Vanguard course floor. These get turned off during the main attack sequence }
  RefCollectionAlias Property VanguardRecruitmentFloorManagers Auto Const mandatory
  { Floor marker objects for the Vanguard recruitment floor. These get turned off during the main attack sequence }
  RefCollectionAlias Property AttackPathFloorManagers Auto Const mandatory
  { Floor marker objects for the that make up the path the player takes to the attack. Get turned off temporarily during the initial conversation and then turned back on during the attack }
  RefCollectionAlias Property EmergencyLights Auto Const mandatory
  { Collection of the emergency lights around the spaceport tarmac }
  RefCollectionAlias Property SpaceportCrew Auto Const mandatory
  { Collection that contains all the spawned crew (so we can turn 'em off during the attack) }
  RefCollectionAlias Property RunInGuards Auto Const mandatory
  { Collection of the guards we want to start outside the spaceport fight and then run in later }
  RefCollectionAlias Property IACrew Auto Const mandatory
  { All the workers in the Minister Hall floor }
  RefCollectionAlias Property BackUpMinisterHallGuards Auto Const mandatory
  { Ref coll for the guards that come in post-post-explosion scene }
EndGroup

Group Aliases
  ReferenceAlias Property FireTeamMarineCaptain Auto Const mandatory
  { Alias for the fire team captain Marine }
  ReferenceAlias Property FireTeamMarine Auto Const mandatory
  { Alias for the fire team assault Marine }
  ReferenceAlias Property Hadrian Auto Const mandatory
  { Ref alias for Hadrian }
  ReferenceAlias Property Obj400Marker Auto Const mandatory
  { Ref alias from which we're triggering the interior alarm }
  ReferenceAlias[] Property MinisterHallNPCs Auto Const mandatory
  { Array of individual aliases for all the NPCs in the Minister Hall }
EndGroup

Group Stages
  Int Property MindControlShoutPrereqStage = 600 Auto Const
  { Only have Hadrian shout about mind control if this stage has already been set }
  Int Property MindControlShoutShutdownStage = 850 Auto Const
  { Only have Hadrian shout about mind control if this stage hasn't already been set }
  Int Property StageToSetOnMindControl = 820 Auto Const
  { Stage to be set during the attack sequence if an NPC gets mind controlled }
  Int Property StageToSetOnPlayerMindControl = 825 Auto Const
  { Stage to be set during the attack sequence if the player gets mind controlled }
EndGroup

Group MiscObjects
  inputenablelayer Property AttackEnableLayer Auto
  { Var used to save out the enable layer used to manage the player's behavior during the attack }
  GlobalVariable Property UC04_SecurityDeathCount Auto Const mandatory
  { Global used to track how many guards have died during the attack }
  GlobalVariable Property UC04_MarineFollowerState Auto Const mandatory
  { Global used to track if the Marines are actively following the player or not }
  GlobalVariable Property UC04_HadrianWarningShoutDistance Auto Const mandatory
  { Hadrian needs to be this close to a mind control event to comment on it }
  sq_followersscript Property SQ_Followers Auto Const mandatory
  { Followers script. Used to get Marines into the proper states }
  ucparentfactionquestscript Property DialogueUCFactionAlwaysOn Auto Const mandatory
  { Used to register for successful mind control attacks }
  wwiseevent Property WEF_QST_UC04_Shutters_Close Auto Const mandatory
  { Shutter closing sound }
  Topic Property UC04_UCSecurity_WitnessMindControl Auto Const mandatory
  { Topic used to get UC Security to respond to the player's actions }
  FormList Property VoicesDialogueUCSecurity Auto Const mandatory
  { Form list of UC security voicetypes }
  MagicEffect Property CrTerrormorphMindControlEffect_NPC Auto Const mandatory
  { Magic effect used to check for mind controlled NPCs }
  Location Property CityNewAtlantisLocation Auto Const mandatory
  { New Atlantis location object }
  Faction Property AvailableCrewFaction Auto Const mandatory
  { Faction used to check if crew have been current hired by the player }
  wwiseevent Property WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior Auto Const mandatory
  { Event used to trigger the alarm inside the cabinet chamber }
  Keyword Property UC04_Spaceport_RunIn_Start_LinkedRef Auto Const mandatory
  { Keyword used to link the run-in guards to their starting points }
EndGroup


;-- Functions ---------------------------------------

Function RegisterForMindControlEvents()
  Self.RegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_MindControlTriggered") ; #DEBUG_LINE_NO:133
EndFunction

Function UnregisterForMindControlEvents()
  Self.UnRegisterForCustomEvent(DialogueUCFactionAlwaysOn as ScriptObject, "ucparentfactionquestscript_MindControlTriggered") ; #DEBUG_LINE_NO:137
EndFunction

Event UCParentFactionQuestScript.MindControlTriggered(ucparentfactionquestscript akSender, Var[] kargs)
  If Self.GetStageDone(MindControlShoutPrereqStage) && !Self.GetStageDone(MindControlShoutShutdownStage) ; #DEBUG_LINE_NO:142
    Actor ControlTarget = kargs[1] as Actor ; #DEBUG_LINE_NO:144
    If ControlTarget ; #DEBUG_LINE_NO:146
      If ControlTarget == Game.GetPlayer() ; #DEBUG_LINE_NO:147
        If !Self.GetStageDone(StageToSetOnPlayerMindControl) && Hadrian.GetRef().GetDistance(ControlTarget as ObjectReference) <= UC04_HadrianWarningShoutDistance.GetValue() ; #DEBUG_LINE_NO:149
          Self.SetStage(StageToSetOnPlayerMindControl) ; #DEBUG_LINE_NO:150
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Actor ShoutTarget = Self.FindLivingGuard() ; #DEBUG_LINE_NO:153
        If ShoutTarget ; #DEBUG_LINE_NO:155
          ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl, None, False, None) ; #DEBUG_LINE_NO:156
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Actor Function FindLivingGuard()
  Int I = 0 ; #DEBUG_LINE_NO:164
  Int iCount = SpaceportGuards.GetCount() ; #DEBUG_LINE_NO:165
  Actor TargetGuard = None ; #DEBUG_LINE_NO:166
  While I < iCount && TargetGuard == None ; #DEBUG_LINE_NO:168
    Actor currAct = SpaceportGuards.GetAt(I) as Actor ; #DEBUG_LINE_NO:169
    If !currAct.IsDead() && !currAct.HasMagicEffect(CrTerrormorphMindControlEffect_NPC) && VoicesDialogueUCSecurity.HasForm(currAct.GetVoiceType() as Form) ; #DEBUG_LINE_NO:171
      TargetGuard = currAct ; #DEBUG_LINE_NO:172
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:175
  EndWhile ; #DEBUG_LINE_NO:
  Return TargetGuard ; #DEBUG_LINE_NO:178
EndFunction

Function DEBUGTriggerMindControlShout()
  Actor ShoutTarget = Self.FindLivingGuard() ; #DEBUG_LINE_NO:182
  If ShoutTarget ; #DEBUG_LINE_NO:185
    ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl, None, False, None) ; #DEBUG_LINE_NO:186
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ToggleShutter(Bool bOpen)
  If !bOpen ; #DEBUG_LINE_NO:192
    WEF_QST_UC04_Shutters_Close.Play(Shutters.GetAt(0), None, None) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:196
  Int iCount = Shutters.GetCount() ; #DEBUG_LINE_NO:197
  While I < iCount ; #DEBUG_LINE_NO:199
    ObjectReference currRef = Shutters.GetAt(I) ; #DEBUG_LINE_NO:200
    If bOpen ; #DEBUG_LINE_NO:202
      currRef.PlayAnimation("Open") ; #DEBUG_LINE_NO:203
    Else ; #DEBUG_LINE_NO:
      currRef.PlayAnimation("Close") ; #DEBUG_LINE_NO:205
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:207
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetUpAttackState(Bool bDisable)
  Int I = 0 ; #DEBUG_LINE_NO:213
  Int iCount = DisableNPCs.GetCount() ; #DEBUG_LINE_NO:214
  While I < iCount ; #DEBUG_LINE_NO:216
    ObjectReference currRef = DisableNPCs.GetAt(I) ; #DEBUG_LINE_NO:217
    If bDisable ; #DEBUG_LINE_NO:219
      currRef.Disable(False) ; #DEBUG_LINE_NO:220
    Else ; #DEBUG_LINE_NO:
      currRef.Enable(False) ; #DEBUG_LINE_NO:223
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:227
  EndWhile ; #DEBUG_LINE_NO:
  Int j = 0 ; #DEBUG_LINE_NO:230
  Int jCount = CoweringNPCs.GetCount() ; #DEBUG_LINE_NO:231
  While j < jCount ; #DEBUG_LINE_NO:233
    Actor currAct = CoweringNPCs.GetAt(j) as Actor ; #DEBUG_LINE_NO:234
    currAct.EvaluatePackage(False) ; #DEBUG_LINE_NO:236
    currAct.MoveToPackageLocation() ; #DEBUG_LINE_NO:237
    If bDisable ; #DEBUG_LINE_NO:239
      CaptiveCollection.AddRef(currAct as ObjectReference) ; #DEBUG_LINE_NO:240
      currAct.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:241
    Else ; #DEBUG_LINE_NO:
      CaptiveCollection.RemoveRef(currAct as ObjectReference) ; #DEBUG_LINE_NO:243
      currAct.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:244
    EndIf ; #DEBUG_LINE_NO:
    j += 1 ; #DEBUG_LINE_NO:247
  EndWhile ; #DEBUG_LINE_NO:
  Int k = 0 ; #DEBUG_LINE_NO:250
  Int kCount = KneelingNPCs.GetCount() ; #DEBUG_LINE_NO:251
  While k < kCount ; #DEBUG_LINE_NO:253
    Actor curract = KneelingNPCs.GetAt(k) as Actor ; #DEBUG_LINE_NO:254
    curract.EvaluatePackage(False) ; #DEBUG_LINE_NO:256
    If bDisable ; #DEBUG_LINE_NO:258
      CaptiveCollection.AddRef(curract as ObjectReference) ; #DEBUG_LINE_NO:259
      curract.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:260
    Else ; #DEBUG_LINE_NO:
      CaptiveCollection.RemoveRef(curract as ObjectReference) ; #DEBUG_LINE_NO:262
      curract.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:263
    EndIf ; #DEBUG_LINE_NO:
    k += 1 ; #DEBUG_LINE_NO:266
  EndWhile ; #DEBUG_LINE_NO:
  Int l = 0 ; #DEBUG_LINE_NO:269
  Int lCount = SpaceportCrew.GetCount() ; #DEBUG_LINE_NO:270
  While l < lCount ; #DEBUG_LINE_NO:272
    Actor curract = SpaceportCrew.GetAt(l) as Actor ; #DEBUG_LINE_NO:273
    Location currLoc = curract.GetCurrentLocation() ; #DEBUG_LINE_NO:274
    If curract.IsEnabled() && (currLoc == CityNewAtlantisLocation || currLoc.IsChild(CityNewAtlantisLocation)) && !curract.IsInFaction(AvailableCrewFaction) ; #DEBUG_LINE_NO:276
      curract.Disable(False) ; #DEBUG_LINE_NO:277
    EndIf ; #DEBUG_LINE_NO:
    l += 1 ; #DEBUG_LINE_NO:281
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ResetLivingSpaceportGuards()
  Int I = 0 ; #DEBUG_LINE_NO:286
  Int iCount = SpaceportGuards.GetCount() ; #DEBUG_LINE_NO:287
  While I < iCount ; #DEBUG_LINE_NO:289
    Actor currAct = SpaceportGuards.GetAt(I) as Actor ; #DEBUG_LINE_NO:290
    If !currAct.IsDead() ; #DEBUG_LINE_NO:295
      currAct.Reset(None) ; #DEBUG_LINE_NO:296
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:299
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function IncrementGuardDeathCount()
  Guard CountGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:305
    UC04_SecurityDeathCount.Mod(1.0) ; #DEBUG_LINE_NO:306
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ToggleElevatorCollAccessibility(RefCollectionAlias akTargetColl, Bool bMakeAccessible)
  Int I = 0 ; #DEBUG_LINE_NO:311
  Int iCount = akTargetColl.GetCount() ; #DEBUG_LINE_NO:312
  While I < iCount ; #DEBUG_LINE_NO:314
    loadelevatorfloorscript myElev = akTargetColl.GetAt(I) as loadelevatorfloorscript ; #DEBUG_LINE_NO:315
    myElev.SetAccessible(bMakeAccessible) ; #DEBUG_LINE_NO:316
    I += 1 ; #DEBUG_LINE_NO:320
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function LockAllDoors(RefCollectionAlias akTargetColl, Bool bLock)
  Int I = 0 ; #DEBUG_LINE_NO:325
  Int iCount = akTargetColl.GetCount() ; #DEBUG_LINE_NO:326
  While I < iCount ; #DEBUG_LINE_NO:328
    ObjectReference myDoor = akTargetColl.GetAt(I) ; #DEBUG_LINE_NO:329
    If bLock ; #DEBUG_LINE_NO:331
      myDoor.BlockActivation(True, True) ; #DEBUG_LINE_NO:332
    Else ; #DEBUG_LINE_NO:
      myDoor.BlockActivation(False, False) ; #DEBUG_LINE_NO:334
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:337
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ToggleMarineFollowers(Int iForceState)
  Guard FollowerStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:342
    Int iFollowerState = UC04_MarineFollowerState.GetValueInt() ; #DEBUG_LINE_NO:343
    Actor CapACT = FireTeamMarineCaptain.GetActorRef() ; #DEBUG_LINE_NO:344
    Actor MarACT = FireTeamMarine.GetActorRef() ; #DEBUG_LINE_NO:345
    If iForceState >= 0 ; #DEBUG_LINE_NO:347
      If iForceState == 0 ; #DEBUG_LINE_NO:349
        iFollowerState = 1 ; #DEBUG_LINE_NO:350
      ElseIf iForceState == 1 ; #DEBUG_LINE_NO:352
        iFollowerState = 0 ; #DEBUG_LINE_NO:353
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If iFollowerState < 1 ; #DEBUG_LINE_NO:357
      UC04_MarineFollowerState.SetValue(1.0) ; #DEBUG_LINE_NO:358
      SQ_Followers.SetRoleActive(CapACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:359
      SQ_Followers.SetRoleActive(MarACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:360
      SQ_Followers.CommandFollow(CapACT) ; #DEBUG_LINE_NO:361
      SQ_Followers.CommandFollow(MarACT) ; #DEBUG_LINE_NO:362
    Else ; #DEBUG_LINE_NO:
      UC04_MarineFollowerState.SetValue(0.0) ; #DEBUG_LINE_NO:364
      SQ_Followers.SetRoleInactive(CapACT, False, False, True) ; #DEBUG_LINE_NO:365
      SQ_Followers.SetRoleInactive(MarACT, False, False, True) ; #DEBUG_LINE_NO:366
    EndIf ; #DEBUG_LINE_NO:
    CapACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:369
    MarACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:370
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function DisableRefifDeadRefCollection()
  Int I = 0 ; #DEBUG_LINE_NO:376
  Int iCount = SpaceportGuards.GetCount() ; #DEBUG_LINE_NO:377
  While I < iCount ; #DEBUG_LINE_NO:379
    Actor currAct = SpaceportGuards.GetAt(I) as Actor ; #DEBUG_LINE_NO:380
    If currAct.IsDead() ; #DEBUG_LINE_NO:382
      currAct.Disable(False) ; #DEBUG_LINE_NO:383
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:386
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ToggleEmergencyLights(Bool bOn)
  Int I = 0 ; #DEBUG_LINE_NO:391
  Int iCount = EmergencyLights.GetCount() ; #DEBUG_LINE_NO:392
  While I < iCount ; #DEBUG_LINE_NO:394
    ObjectReference currRef = EmergencyLights.GetAt(I) ; #DEBUG_LINE_NO:395
    If currRef.Is3DLoaded() ; #DEBUG_LINE_NO:397
      If bOn ; #DEBUG_LINE_NO:399
        currRef.PlayAnimation("Red") ; #DEBUG_LINE_NO:400
        currRef.PlayAnimation("TurnOnPulse") ; #DEBUG_LINE_NO:401
      Else ; #DEBUG_LINE_NO:
        currRef.PlayAnimation("TurnOffFull") ; #DEBUG_LINE_NO:403
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:407
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ToggleInteriorAlarm(Bool bActivate)
  If bActivate ; #DEBUG_LINE_NO:413
    iIntAlarmIndex = WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior.Play(Obj400Marker.GetRef(), None, None) ; #DEBUG_LINE_NO:414
  Else ; #DEBUG_LINE_NO:
    wwiseevent.StopInstance(iIntAlarmIndex) ; #DEBUG_LINE_NO:418
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MoveRunInGuardsToStartLocations()
  Int I = 0 ; #DEBUG_LINE_NO:423
  Int iCount = RunInGuards.GetCount() ; #DEBUG_LINE_NO:424
  While I < iCount ; #DEBUG_LINE_NO:426
    Actor currAct = RunInGuards.GetAt(I) as Actor ; #DEBUG_LINE_NO:427
    If currAct ; #DEBUG_LINE_NO:430
      ObjectReference StartRef = currAct.GetLinkedRef(UC04_Spaceport_RunIn_Start_LinkedRef) ; #DEBUG_LINE_NO:431
      If StartRef ; #DEBUG_LINE_NO:434
        currAct.EvaluatePackage(False) ; #DEBUG_LINE_NO:435
        currAct.MoveTo(StartRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:436
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:441
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function TogglePerkOnCollection(RefCollectionAlias akTargetColl, Perk akTargetPerk, Bool bAdd)
  Int I = 0 ; #DEBUG_LINE_NO:447
  Int iCount = akTargetColl.GetCount() ; #DEBUG_LINE_NO:448
  While I < iCount ; #DEBUG_LINE_NO:450
    Actor currAct = akTargetColl.GetAt(I) as Actor ; #DEBUG_LINE_NO:451
    If bAdd ; #DEBUG_LINE_NO:453
      If !currAct.IsDead() ; #DEBUG_LINE_NO:454
        currAct.AddPerk(akTargetPerk, False) ; #DEBUG_LINE_NO:455
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currAct.HasPerk(akTargetPerk) ; #DEBUG_LINE_NO:458
      currAct.RemovePerk(akTargetPerk) ; #DEBUG_LINE_NO:459
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:463
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ToggleMinistersHallNPCsGhosted(Bool abSetGhosted)
  Int I = 0 ; #DEBUG_LINE_NO:469
  Int iLength = MinisterHallNPCs.Length ; #DEBUG_LINE_NO:470
  While I < iLength ; #DEBUG_LINE_NO:472
    Actor currAct = MinisterHallNPCs[I].GetActorRef() ; #DEBUG_LINE_NO:473
    If currAct ; #DEBUG_LINE_NO:475
      currAct.SetGhost(abSetGhosted) ; #DEBUG_LINE_NO:476
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:479
  EndWhile ; #DEBUG_LINE_NO:
  IACrew.SetGhost(abSetGhosted) ; #DEBUG_LINE_NO:482
  BackUpMinisterHallGuards.SetGhost(abSetGhosted) ; #DEBUG_LINE_NO:483
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:489
EndFunction
