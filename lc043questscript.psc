ScriptName LC043QuestScript Extends Quest conditional
{ Quest script for LC043, SY-920. }

;-- Variables ---------------------------------------
Int CONST_GuardShipConfrontationSceneDelay = 0 Const
Int CONST_Stage_SY01_AccessGrantedStage = 120 Const
Int CONST_Stage_SY01_EntryStage = 100 Const
Int CONST_Stage_SY01_SecurityAlarmTriggeredStage = 150 Const
Int CONST_Stage_SY02_EntryStage = 200 Const
Int CONST_Stage_SY03_EntryStage = 300 Const
Int CONST_Stage_SY03_HuanBetrayedStage = 320 Const
Int CONST_Stage_Space_NonquestGuardsHostile = 50 Const
Int CONST_Stage_Space_PostquestSetupStage = 1000 Const
Int CONST_Stage_Space_QuestEscapeStartedStage = 460 Const
Int CONST_Stage_Space_QuestSetupStage = 99 Const
Float CONST_UpdateSY01StateTimerDelay = 0.5 Const
Int CONST_UpdateSY01StateTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard SY01State

;-- Properties --------------------------------------
Group AutofillProperties
  LocationAlias Property Alias_LC043SY01Location Auto Const mandatory
  LocationAlias Property Alias_LC043SY02Location Auto Const mandatory
  LocationAlias Property Alias_LC043SY03Location Auto Const mandatory
  Location Property LC043SYLocation Auto Const mandatory
  Location Property LC043SYSpaceCellLocation Auto Const mandatory
  Location Property LC043SY01Location Auto Const mandatory
  Location Property LC043SY02Location Auto Const mandatory
  Location Property LC043SY03Location Auto Const mandatory
  Location Property SLuytensStar_PLuytensRock_Orbit Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Prequest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Quest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Postquest_All Auto Const mandatory
  RefCollectionAlias Property SY_Ships_Guards Auto Const mandatory
  ReferenceAlias Property SY_Ships_GuardLeader Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  RefCollectionAlias Property SY01_ActorsAll Auto Const mandatory
  RefCollectionAlias Property SY02_ActorsAll Auto Const mandatory
  RefCollectionAlias Property SY03_ActorsAll Auto Const mandatory
  Faction Property LC043SY01Faction Auto Const mandatory
  Faction Property LC043SY02Faction Auto Const mandatory
  Faction Property LC043SY03Faction Auto Const mandatory
  RefCollectionAlias Property SY01_CargoBayLoungeGuards Auto Const mandatory
  RefCollectionAlias Property SY01_CargoBayTrespassTriggers Auto Const mandatory
  ReferenceAlias Property SY03_AlarmGuardRemovalTrigger Auto Const mandatory
  RefCollectionAlias Property SY03_AlarmGuards Auto Const mandatory
  ActorValue Property Suspicious Auto Const mandatory
  ActorValue Property LC043_GuardConfrontActiveConfrontValue Auto Const mandatory
  Message Property LC043_TrespassMessage Auto Const mandatory
  Scene Property LC043_10_GuardConfront Auto Const mandatory
  wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const mandatory
EndGroup

Bool Property playerWasInTrespassTrigger Auto conditional hidden

;-- Functions ---------------------------------------

Function UpdateTrespassTriggerStatus()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:71
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:72
  Self.RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:73
  Self.RegisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:74
  Self.RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:75
  If PlayerShip.GetRef().GetCurrentLocation() == LC043SYSpaceCellLocation ; #DEBUG_LINE_NO:78
    Var[] akArgs = new Var[2] ; #DEBUG_LINE_NO:79
    akArgs[0] = None ; #DEBUG_LINE_NO:80
    akArgs[1] = LC043SYSpaceCellLocation as Var ; #DEBUG_LINE_NO:81
    Self.CallFunctionNoWait("HandleLocationChange", akArgs) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CleanupPrequestAliases()
  SY_Ships_Prequest_All.RemoveAll() ; #DEBUG_LINE_NO:96
  LC043SYSpaceCellLocation.Reset() ; #DEBUG_LINE_NO:97
  SY_Ships_Quest_All.ResetAll() ; #DEBUG_LINE_NO:98
EndFunction

Function CleanupQuestAliases()
  SY_Ships_Quest_All.RemoveAll() ; #DEBUG_LINE_NO:102
  Alias_LC043SY01Location.ForceLocationTo(None) ; #DEBUG_LINE_NO:103
  Alias_LC043SY02Location.ForceLocationTo(None) ; #DEBUG_LINE_NO:104
  Alias_LC043SY03Location.ForceLocationTo(None) ; #DEBUG_LINE_NO:105
  Alias_LC043SY01Location.RefillDependentAliases() ; #DEBUG_LINE_NO:106
  Alias_LC043SY02Location.RefillDependentAliases() ; #DEBUG_LINE_NO:107
  Alias_LC043SY03Location.RefillDependentAliases() ; #DEBUG_LINE_NO:108
  LC043SYSpaceCellLocation.Reset() ; #DEBUG_LINE_NO:109
  SY_Ships_Postquest_All.ResetAll() ; #DEBUG_LINE_NO:110
EndFunction

Function FillInteriorAliases()
  Alias_LC043SY01Location.ForceLocationTo(LC043SY01Location) ; #DEBUG_LINE_NO:114
  Alias_LC043SY01Location.RefillDependentAliases() ; #DEBUG_LINE_NO:115
  Self.SetCollectionCrimeFaction(SY01_ActorsAll, LC043SY01Faction) ; #DEBUG_LINE_NO:116
  LC043SY01Location.Reset() ; #DEBUG_LINE_NO:117
  SY01_ActorsAll.ResetAll() ; #DEBUG_LINE_NO:118
  Alias_LC043SY02Location.ForceLocationTo(LC043SY02Location) ; #DEBUG_LINE_NO:120
  Alias_LC043SY02Location.RefillDependentAliases() ; #DEBUG_LINE_NO:121
  Self.SetCollectionCrimeFaction(SY02_ActorsAll, LC043SY02Faction) ; #DEBUG_LINE_NO:122
  LC043SY02Location.Reset() ; #DEBUG_LINE_NO:123
  SY02_ActorsAll.ResetAll() ; #DEBUG_LINE_NO:124
  Alias_LC043SY03Location.ForceLocationTo(LC043SY03Location) ; #DEBUG_LINE_NO:126
  Alias_LC043SY03Location.RefillDependentAliases() ; #DEBUG_LINE_NO:127
  Self.SetCollectionCrimeFaction(SY03_ActorsAll, LC043SY03Faction) ; #DEBUG_LINE_NO:128
  LC043SY03Location.Reset() ; #DEBUG_LINE_NO:129
  SY03_ActorsAll.ResetAll() ; #DEBUG_LINE_NO:130
  Self.RegisterForTriggerEvents() ; #DEBUG_LINE_NO:132
EndFunction

Function SetCollectionCrimeFaction(RefCollectionAlias actorCol, Faction crimeFaction)
  Int I = 0 ; #DEBUG_LINE_NO:136
  Int count = actorCol.GetCount() ; #DEBUG_LINE_NO:137
  While I < count ; #DEBUG_LINE_NO:138
    (actorCol.GetAt(I) as Actor).SetCrimeFaction(crimeFaction) ; #DEBUG_LINE_NO:139
    I += 1 ; #DEBUG_LINE_NO:140
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForTriggerEvents()
  ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray() ; #DEBUG_LINE_NO:145
  Int I = 0 ; #DEBUG_LINE_NO:146
  While I < trespassTriggerRefs.Length ; #DEBUG_LINE_NO:147
    Self.RegisterForRemoteEvent(trespassTriggerRefs[I] as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:148
    Self.RegisterForRemoteEvent(trespassTriggerRefs[I] as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:149
    I += 1 ; #DEBUG_LINE_NO:150
  EndWhile ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(SY03_AlarmGuardRemovalTrigger.GetRef() as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:152
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  Self.HandleLocationChange(akOldLoc, akNewLoc) ; #DEBUG_LINE_NO:161
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
  Self.HandleLocationChange(akOldLoc, akNewLoc) ; #DEBUG_LINE_NO:165
EndEvent

Function HandleLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == LC043SYSpaceCellLocation && (!Self.GetStageDone(CONST_Stage_SY03_EntryStage) || Self.GetStageDone(CONST_Stage_Space_PostquestSetupStage)) ; #DEBUG_LINE_NO:169
    Int currentStage = Self.GetStage() ; #DEBUG_LINE_NO:171
    If !Self.GetStageDone(CONST_Stage_Space_NonquestGuardsHostile) && (currentStage < CONST_Stage_Space_QuestSetupStage || currentStage >= CONST_Stage_Space_PostquestSetupStage) ; #DEBUG_LINE_NO:172
      Self.SetupGuardConfrontation(True) ; #DEBUG_LINE_NO:173
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akNewLoc == LC043SY01Location && !Self.GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage) ; #DEBUG_LINE_NO:175
    Self.SetStage(CONST_Stage_SY01_EntryStage) ; #DEBUG_LINE_NO:176
  ElseIf akNewLoc == LC043SY02Location && !Self.GetStageDone(CONST_Stage_SY02_EntryStage) ; #DEBUG_LINE_NO:177
    Self.SetStage(CONST_Stage_SY02_EntryStage) ; #DEBUG_LINE_NO:178
  ElseIf akNewLoc == LC043SY03Location && !Self.GetStageDone(CONST_Stage_SY03_EntryStage) ; #DEBUG_LINE_NO:179
    Self.SetStage(CONST_Stage_SY03_EntryStage) ; #DEBUG_LINE_NO:180
  ElseIf akOldLoc == LC043SYSpaceCellLocation && !akNewLoc.IsChild(LC043SYSpaceCellLocation) && Self.GetStageDone(CONST_Stage_Space_QuestEscapeStartedStage) && !Self.GetStageDone(CONST_Stage_Space_PostquestSetupStage) ; #DEBUG_LINE_NO:181,182
    Self.SetStage(CONST_Stage_Space_PostquestSetupStage) ; #DEBUG_LINE_NO:183
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActionRef)
  If SY01_CargoBayTrespassTriggers.Find(source) >= 0 ; #DEBUG_LINE_NO:190
    Self.UpdateTrespassTriggerStatus() ; #DEBUG_LINE_NO:191
  ElseIf source == SY03_AlarmGuardRemovalTrigger.GetRef() && SY03_AlarmGuards.Find(akActionRef) >= 0 && Self.GetStageDone(CONST_Stage_SY03_HuanBetrayedStage) ; #DEBUG_LINE_NO:192
    akActionRef.DisableNoWait(True) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference source, ObjectReference akActionRef)
  If SY01_CargoBayTrespassTriggers.Find(source) >= 0 ; #DEBUG_LINE_NO:198
    Self.UpdateTrespassTriggerStatus() ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetupGuardConfrontation(Bool shouldStartStandardConfrontationScene)
  SY_Ships_GuardLeader.RefillAlias() ; #DEBUG_LINE_NO:240
  SY_Ships_Guards.RefillAlias() ; #DEBUG_LINE_NO:241
  spaceshipreference[] guardShipRefs = SY_Ships_Guards.GetArray() as spaceshipreference[] ; #DEBUG_LINE_NO:242
  Int I = 0 ; #DEBUG_LINE_NO:243
  While I < guardShipRefs.Length ; #DEBUG_LINE_NO:244
    guardShipRefs[I].SetValue(LC043_GuardConfrontActiveConfrontValue, 1.0) ; #DEBUG_LINE_NO:245
    guardShipRefs[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:246
    I += 1 ; #DEBUG_LINE_NO:247
  EndWhile ; #DEBUG_LINE_NO:
  If shouldStartStandardConfrontationScene ; #DEBUG_LINE_NO:249
    Utility.Wait(CONST_GuardShipConfrontationSceneDelay as Float) ; #DEBUG_LINE_NO:250
    LC043_10_GuardConfront.Start() ; #DEBUG_LINE_NO:251
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TriggerSecurityAlarm(RefCollectionAlias enemyCol, Faction enemyFaction)
  Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:262
  enemyFaction.SetCrimeGoldViolent(1000) ; #DEBUG_LINE_NO:265
  Actor[] enemies = enemyCol.GetArray() as Actor[] ; #DEBUG_LINE_NO:267
  Int I = 0 ; #DEBUG_LINE_NO:268
  While I < enemies.Length ; #DEBUG_LINE_NO:269
    robotpodscript robotActor = enemies[I] as robotpodscript ; #DEBUG_LINE_NO:270
    If robotActor != None ; #DEBUG_LINE_NO:271
      robotActor.WakeRobotFromPod() ; #DEBUG_LINE_NO:272
    ElseIf enemies[I].IsUnconscious() ; #DEBUG_LINE_NO:273
      enemies[I].SetUnconscious(False) ; #DEBUG_LINE_NO:274
    EndIf ; #DEBUG_LINE_NO:
    enemies[I].SetValue(Suspicious, 1.0) ; #DEBUG_LINE_NO:276
    enemies[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:277
    I += 1 ; #DEBUG_LINE_NO:278
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function BlockSpaceTravelForEscape(Bool shouldBlock)
  SLuytensStar_PLuytensRock_Orbit.EnableSpaceTravel(Self as Quest, !shouldBlock) ; #DEBUG_LINE_NO:288
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Waiting

  Function UpdateTrespassTriggerStatus()
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:205
    If Self.GetStageDone(CONST_Stage_SY01_AccessGrantedStage) || Self.GetStageDone(CONST_Stage_SY01_SecurityAlarmTriggeredStage) ; #DEBUG_LINE_NO:206
      Self.UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:207
      Self.UnregisterForRemoteEvent(SY01_CargoBayTrespassTriggers as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:208
    Else ; #DEBUG_LINE_NO:
      Bool playerIsInTrespassTrigger = False ; #DEBUG_LINE_NO:210
      Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:211
      ObjectReference[] trespassTriggerRefs = SY01_CargoBayTrespassTriggers.GetArray() ; #DEBUG_LINE_NO:212
      Int I = 0 ; #DEBUG_LINE_NO:213
      While !playerIsInTrespassTrigger && I < trespassTriggerRefs.Length ; #DEBUG_LINE_NO:214
        playerIsInTrespassTrigger = trespassTriggerRefs[I].IsInTrigger(player as ObjectReference) ; #DEBUG_LINE_NO:215
        I += 1 ; #DEBUG_LINE_NO:216
      EndWhile ; #DEBUG_LINE_NO:
      If playerIsInTrespassTrigger && !playerWasInTrespassTrigger ; #DEBUG_LINE_NO:218
        LC043_TrespassMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:219
      EndIf ; #DEBUG_LINE_NO:
      playerWasInTrespassTrigger = playerIsInTrespassTrigger ; #DEBUG_LINE_NO:221
      SY01_CargoBayLoungeGuards.EvaluateAll() ; #DEBUG_LINE_NO:222
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:224
  EndFunction
EndState
