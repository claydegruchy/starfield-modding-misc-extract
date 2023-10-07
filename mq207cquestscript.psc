ScriptName MQ207CQuestScript Extends Quest conditional
{ Quest script for MQ207C, Entangled. }

;-- Variables ---------------------------------------
Int CONST_ActivatePrimaryCalibrationStage = 770 Const
Int CONST_AllEndingsCommonStage = 900 Const
Int CONST_AllInterlocksShutDown_I_Stage = 712 Const
Int CONST_DamageToFreeArtifact = 99 Const
Int CONST_DisengagePowerInterlocksObjective = 700 Const
Int CONST_EmergencyShutdownTriggeredStage_I = 721 Const
Int CONST_EmergencyShutdownTriggeredStage_II = 722 Const
Int CONST_EnteredResearchLabStage = 700 Const
Float CONST_FrequencyMultiplier = 0.25 Const
Int CONST_Frequency_FrequencyOutputInitial_I = 34 Const
Int CONST_Frequency_FrequencyOutputInitial_II = 34 Const
Int CONST_Frequency_FrequencyOutputTarget_I = 40 Const
Int CONST_Frequency_FrequencyOutputTarget_II = 24 Const
Int CONST_GiveTheArtifactStage_III = 790 Const
Int CONST_HalfInterlocksShutDownCount = 4 Const
Int CONST_HalfInterlocksShutDown_I_Stage = 711 Const
Int CONST_LockLevel_RequiresKey = 255 Const
Int CONST_MQ207CArtifactID = 12 Const
Int CONST_MaxInterlocksToDegauss = 4 Const
Int CONST_MinInterlocksToDegauss = 2 Const
Int CONST_MusicOverrideUpdateTimerDelay = 3 Const
Int CONST_MusicOverrideUpdateTimerID = 1 Const
Int CONST_PlayerSitInBedFurnitureStage_III = 933 Const
Int CONST_QuickstartLevel = 24 Const
Int CONST_ReachedSecurityOfficeStage = 450 Const
Int CONST_ShutDownTheProbeObjective = 710 Const
Int CONST_SpeakToMariaStage = 500 Const
Int CONST_StorageCorridorShiftBackStageToSet = 155 Const
Int CONST_StorageRoomGaveFoodStage = 27 Const
Int CONST_TakeTheArtifactStage_I = 721 Const
Int CONST_TakeTheArtifactStage_II = 722 Const
Int CONST_TookTheArtifactStage_I = 731 Const
Int CONST_TookTheArtifactStage_II = 732 Const
Int CONST_WaitForTheExperimentStage_III = 780 Const
inputenablelayer MQ207CInputEnableLayer
ObjectReference NishinaExt_ExteriorDoor_I_Ref
ObjectReference NishinaExt_IntercomRef
genericswitchscript PrimaryCalibration_I
genericswitchscript PrimaryCalibration_II
ObjectReference artifactActivator_I
ObjectReference artifactActivator_II
genericswitchscript emergencyShutdown_I
genericswitchscript emergencyShutdown_II
Float frequencyIntake_I
Float frequencyIntake_II
Int frequencyOutput_I
Int frequencyOutput_II
Bool hasCompletedOnQuestInit
Bool hasCompletedStartupStage
Bool hasStartedStorageCorridorReturnShift
Bool initializedResearchLabEvent
ObjectReference labControlTerminal_I
ObjectReference labControlTerminal_II
Bool musicOverrideActive
Actor player
genericswitchscript[] powerInterlocksRemaining_I
genericswitchscript[] powerInterlocksRemaining_II
genericswitchscript[] powerInterlocksToDegauss_I
genericswitchscript[] powerInterlocksToDegauss_II
genericswitchscript[] powerInterlocks_I
genericswitchscript[] powerInterlocks_II
mq207cshiftingquestscript selfAsShiftingQuest
Int totalInterlocks

;-- Properties --------------------------------------
Group QuestProperties
  String[] Property AttackAnimEventNames Auto Const mandatory
  { Array of animation events that indicate the player is attacking. In the Storage Corridor event, register for these events and shift in response. }
  Perk[] Property QuickstartPerks Auto Const mandatory
  { Array of perks to give the player for quickstarts, to satisfy dialogue condition checks. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property AnnouncementMarker Auto Const mandatory
  ReferenceAlias Property Alias_EthanHughes Auto Const mandatory
  ReferenceAlias Property Alias_MariaHughes Auto Const mandatory
  ReferenceAlias Property Alias_DirectorPatel Auto Const mandatory
  ReferenceAlias Property Alias_RafaelAguerro Auto Const mandatory
  ReferenceAlias Property NishinaExt_LandingPadWaitMarker Auto Const mandatory
  ReferenceAlias Property NishinaExt_ExteriorDoor_I Auto Const mandatory
  ReferenceAlias Property NishinaExt_Intercom Auto Const mandatory
  ReferenceAlias Property Nishina01_StorageCorridorFailsafeMarker_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave2Activator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave3Activator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave2Activator_II Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomWave3Activator_II Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomMusicTrigger_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactRoomMusicTrigger_II Auto Const mandatory
  ReferenceAlias Property Nishina02_PowerInterlockChainHead_I Auto Const mandatory
  ReferenceAlias Property Nishina02_PowerInterlockChainHead_II Auto Const mandatory
  ReferenceAlias Property Nishina02_EmergencyShutdown_I Auto Const mandatory
  ReferenceAlias Property Nishina02_EmergencyShutdown_II Auto Const mandatory
  ReferenceAlias Property Nishina02_LabControlTerminal_I Auto Const mandatory
  ReferenceAlias Property Nishina02_LabControlTerminal_II Auto Const mandatory
  ReferenceAlias Property Nishina02_PrimaryCalibration_I Auto Const mandatory
  ReferenceAlias Property Nishina02_PrimaryCalibration_II Auto Const mandatory
  ReferenceAlias Property Nishina01_DrOfficeBedFurniture_III Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactActivator_I Auto Const mandatory
  ReferenceAlias Property Nishina02_ArtifactActivator_II Auto Const mandatory
  ReferenceAlias Property MQ207B_Artifact02QuestObject Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamLights_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamLights_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ArtifactBeckonSFX_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ArtifactBeckonSFX_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_GuidanceTriggers_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_StorageCorridorCreatures_II Auto Const mandatory
  RefCollectionAlias Property Nishina01_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_Alarms_All_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsAndTurrets_All_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsToDisablePostquest_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_PowerInterlocks_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_PowerInterlocks_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeams_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeams_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_ExperimentBeamHazards Auto Const mandatory
  RefCollectionAlias Property Nishina02_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_TerminalsAll Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_II Auto Const mandatory
  GlobalVariable Property MQ207CTotalInterlockCountGlobal Auto Const mandatory
  GlobalVariable Property MQ207CCurrentInterlockCountGlobal Auto Const mandatory
  ActorValue Property MQ207C_PowerInterlockIDValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalUniverseValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalDegaussingCountValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalDegaussingActiveValue Auto Const mandatory
  ActorValue Property MQ207C_LabControlTerminalCalibrationActiveValue Auto Const mandatory
  Message Property MQ207C_QuickstartLevelForceMessage Auto Const mandatory
  Message Property MQ207C_PowerInterlockNotRespondingMessage Auto Const mandatory
  Message Property MQ207C_EmergencyShutdownNotReadyMessage Auto Const mandatory
  Message Property MQ207C_EmergencyShutdownAlreadyUsedMessage Auto Const mandatory
  Message Property MQ207C_PrimaryCalibrationNotReadyMessage Auto Const mandatory
  Message Property MQ207C_PrimaryCalibrationAlreadyUsedMessage Auto Const mandatory
  Message Property MQ207C_PowerInterlock_Engage Auto Const mandatory
  Message Property MQ207C_PowerInterlock_Disengage Auto Const mandatory
  Message Property MQ207C_ShutdownWarningMessage Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef Auto Const mandatory
  ObjectReference Property QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef Auto Const mandatory
  starborntemplequestscript Property StarbornTempleQuest Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  wwiseevent Property WwiseEvent_DRSRemoteUnlock Auto Const mandatory
  Static Property XMarkerHeading Auto Const mandatory
  FormList Property FilterList_InventoryCategoryAidFood Auto Const mandatory
  Faction Property MQ207CNishinaEscortFaction Auto Const mandatory
  Faction Property MQ207CNishinaIEnemyFaction Auto Const mandatory
  Faction Property MQ207CNishinaIFaction Auto Const mandatory
  ActorValue Property AmbushTriggered Auto Const mandatory
  ActorValue Property Experience Auto Const mandatory
  ActorValue Property MQ207C_Nishina01GuidanceTriggerValue Auto Const mandatory
  MusicType Property MUSGenesisCombat_MQ207C_Nishina Auto Const mandatory
  wwiseevent Property QST_MQ207C_Elevator_Activate_Fail_WEF Auto Const mandatory
  wwiseevent Property OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF Auto Const mandatory
EndGroup

Bool Property frequencyStable Auto conditional hidden
Bool Property allPowerInterlocksEngaged_I Auto conditional hidden
Bool Property allPowerInterlocksEngaged_II Auto conditional hidden
Bool Property degaussingStarted_I Auto conditional hidden
Bool Property degaussingStarted_II Auto conditional hidden
Bool Property allPowerInterlocksDegaussed_I Auto conditional hidden
Bool Property allPowerInterlocksDegaussed_II Auto conditional hidden
Bool Property frequencyCalibrationStarted_I Auto conditional hidden
Bool Property frequencyCalibrationStarted_II Auto conditional hidden
Bool Property PrimaryCalibrationEngaged_I Auto conditional hidden
Bool Property PrimaryCalibrationEngaged_II Auto conditional hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:213
  selfAsShiftingQuest = (Self as Quest) as mq207cshiftingquestscript ; #DEBUG_LINE_NO:214
  NishinaExt_IntercomRef = NishinaExt_Intercom.GetRef() ; #DEBUG_LINE_NO:215
  NishinaExt_ExteriorDoor_I_Ref = NishinaExt_ExteriorDoor_I.GetRef() ; #DEBUG_LINE_NO:216
  Alias_EthanHughes.TryToReset() ; #DEBUG_LINE_NO:219
  Alias_MariaHughes.TryToReset() ; #DEBUG_LINE_NO:220
  Alias_DirectorPatel.TryToReset() ; #DEBUG_LINE_NO:221
  Alias_RafaelAguerro.TryToReset() ; #DEBUG_LINE_NO:222
  Nishina01_CreaturesAll_II.ResetAll() ; #DEBUG_LINE_NO:223
  Nishina02_CreaturesAll_II.ResetAll() ; #DEBUG_LINE_NO:224
  Nishina02_RobotsAndTurrets_All_I.ResetAll() ; #DEBUG_LINE_NO:225
  Nishina02_SecurityCameras_I.ResetAll() ; #DEBUG_LINE_NO:226
  Nishina02_SecurityCameras_II.ResetAll() ; #DEBUG_LINE_NO:227
  artifactActivator_I = Nishina02_ArtifactActivator_I.GetRef() ; #DEBUG_LINE_NO:230
  artifactActivator_I.BlockActivation(True, True) ; #DEBUG_LINE_NO:231
  Self.RegisterForRemoteEvent(artifactActivator_I as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:232
  artifactActivator_II = Nishina02_ArtifactActivator_II.GetRef() ; #DEBUG_LINE_NO:233
  artifactActivator_II.BlockActivation(True, True) ; #DEBUG_LINE_NO:234
  Self.RegisterForRemoteEvent(artifactActivator_II as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:235
  Self.SetRefColCameraState(Nishina02_SecurityCameras_II, False, True) ; #DEBUG_LINE_NO:238
  ObjectReference powerInterlockChainHead = Nishina02_PowerInterlockChainHead_I.GetRef() ; #DEBUG_LINE_NO:242
  If powerInterlockChainHead.Is3DLoaded() ; #DEBUG_LINE_NO:243
    Self.InitResearchLabEvent() ; #DEBUG_LINE_NO:244
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(powerInterlockChainHead as ScriptObject, "OnCellLoad") ; #DEBUG_LINE_NO:246
  EndIf ; #DEBUG_LINE_NO:
  hasCompletedOnQuestInit = True ; #DEBUG_LINE_NO:250
EndEvent

Function StartupStageDone()
  hasCompletedStartupStage = True ; #DEBUG_LINE_NO:254
EndFunction

Function WaitForStartup()
  While !hasCompletedOnQuestInit || !hasCompletedStartupStage ; #DEBUG_LINE_NO:260
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:261
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AddQuickstartPerks()
  Int I = 0 ; #DEBUG_LINE_NO:267
  While I < QuickstartPerks.Length ; #DEBUG_LINE_NO:268
    player.AddPerk(QuickstartPerks[I], False) ; #DEBUG_LINE_NO:269
    I += 1 ; #DEBUG_LINE_NO:270
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetQuickstartLevel()
  Int currentLevel = Game.GetPlayerLevel() ; #DEBUG_LINE_NO:276
  Float currentXP = Game.GetXPForLevel(currentLevel) as Float ; #DEBUG_LINE_NO:277
  Float targetXP = Game.GetXPForLevel(CONST_QuickstartLevel) as Float ; #DEBUG_LINE_NO:278
  player.SetValue(Experience, targetXP - currentXP) ; #DEBUG_LINE_NO:279
  MQ207C_QuickstartLevelForceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:280
EndFunction

Function UnlockExteriorDoor()
  NishinaExt_IntercomRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:290
  WwiseEvent_DRSRemoteUnlock.Play(NishinaExt_ExteriorDoor_I_Ref, None, None) ; #DEBUG_LINE_NO:291
  Self.RegisterForRemoteEvent(NishinaExt_ExteriorDoor_I_Ref as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:292
  NishinaExt_ExteriorDoor_I_Ref.Unlock(False) ; #DEBUG_LINE_NO:293
EndFunction

Function BlockFollowersAtExteriorDoor()
  SQ_Followers.AllFollowersWait(NishinaExt_LandingPadWaitMarker.GetRef(), True, False) ; #DEBUG_LINE_NO:298
EndFunction

Function RegisterForAttackEvents()
  Int I = 0 ; #DEBUG_LINE_NO:310
  While I < AttackAnimEventNames.Length ; #DEBUG_LINE_NO:311
    Self.RegisterForAnimationEvent(player as ObjectReference, AttackAnimEventNames[I]) ; #DEBUG_LINE_NO:312
    I += 1 ; #DEBUG_LINE_NO:313
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:315
  While I < Nishina01_StorageCorridorCreatures_II.GetCount() ; #DEBUG_LINE_NO:316
    Self.RegisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(I) as ScriptObject, player as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:317
    I += 1 ; #DEBUG_LINE_NO:318
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UnregisterForAttackEvents()
  Int I = 0 ; #DEBUG_LINE_NO:323
  While I < AttackAnimEventNames.Length ; #DEBUG_LINE_NO:324
    Self.UnregisterForAnimationEvent(player as ObjectReference, AttackAnimEventNames[I]) ; #DEBUG_LINE_NO:325
    I += 1 ; #DEBUG_LINE_NO:326
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:328
  While I < Nishina01_StorageCorridorCreatures_II.GetCount() ; #DEBUG_LINE_NO:329
    Self.UnregisterForHitEvent(Nishina01_StorageCorridorCreatures_II.GetAt(I) as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:330
    I += 1 ; #DEBUG_LINE_NO:331
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String eventName)
  If AttackAnimEventNames.find(eventName, 0) >= 0 ; #DEBUG_LINE_NO:336
    Self.SetStage(CONST_StorageCorridorShiftBackStageToSet) ; #DEBUG_LINE_NO:337
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.SetStage(CONST_StorageCorridorShiftBackStageToSet) ; #DEBUG_LINE_NO:342
EndEvent

Function UpdateGuidanceTriggerAV()
  If Self.GetStageDone(CONST_ReachedSecurityOfficeStage) && !Self.GetStageDone(CONST_SpeakToMariaStage) ; #DEBUG_LINE_NO:352
    ObjectReference[] guidanceTriggerRefs = Nishina01_GuidanceTriggers_II.GetArray() ; #DEBUG_LINE_NO:353
    Int I = 0 ; #DEBUG_LINE_NO:354
    While I < guidanceTriggerRefs.Length ; #DEBUG_LINE_NO:355
      If guidanceTriggerRefs[I].IsInTrigger(player as ObjectReference) ; #DEBUG_LINE_NO:356
        player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 1.0) ; #DEBUG_LINE_NO:358
        Return  ; #DEBUG_LINE_NO:359
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:361
    EndWhile ; #DEBUG_LINE_NO:
    player.SetValue(MQ207C_Nishina01GuidanceTriggerValue, 0.0) ; #DEBUG_LINE_NO:363
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableControls(Bool shouldDisableCamSwitch)
  If MQ207CInputEnableLayer == None ; #DEBUG_LINE_NO:375
    MQ207CInputEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:376
  EndIf ; #DEBUG_LINE_NO:
  MQ207CInputEnableLayer.DisablePlayerControls(True, True, shouldDisableCamSwitch, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:378
EndFunction

Function EnableControls()
  If MQ207CInputEnableLayer != None ; #DEBUG_LINE_NO:383
    MQ207CInputEnableLayer.Reset() ; #DEBUG_LINE_NO:384
    MQ207CInputEnableLayer.Delete() ; #DEBUG_LINE_NO:385
    MQ207CInputEnableLayer = None ; #DEBUG_LINE_NO:386
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnCellLoad(ObjectReference akSource)
  If !initializedResearchLabEvent ; #DEBUG_LINE_NO:404
    Self.InitResearchLabEvent() ; #DEBUG_LINE_NO:405
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(CONST_EnteredResearchLabStage) && Self.GetStage() < CONST_TookTheArtifactStage_I ; #DEBUG_LINE_NO:407
    Self.StartMusicOverride() ; #DEBUG_LINE_NO:408
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function InitResearchLabEvent()
  If !initializedResearchLabEvent ; #DEBUG_LINE_NO:414
    initializedResearchLabEvent = True ; #DEBUG_LINE_NO:415
    genericswitchscript powerInterlockChainHead_I = Nishina02_PowerInterlockChainHead_I.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:419
    powerInterlocks_I = powerInterlockChainHead_I.GetLinkedRefChain(None, 100) as genericswitchscript[] ; #DEBUG_LINE_NO:420
    powerInterlocks_I.insert(powerInterlockChainHead_I, 0) ; #DEBUG_LINE_NO:421
    powerInterlocksRemaining_I = Self.CopySwitchArray(powerInterlocks_I) ; #DEBUG_LINE_NO:422
    Nishina02_PowerInterlocks_I.AddArray(powerInterlocks_I as ObjectReference[]) ; #DEBUG_LINE_NO:423
    genericswitchscript powerInterlockChainHead_II = Nishina02_PowerInterlockChainHead_II.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:424
    powerInterlocks_II = powerInterlockChainHead_II.GetLinkedRefChain(None, 100) as genericswitchscript[] ; #DEBUG_LINE_NO:425
    powerInterlocks_II.insert(powerInterlockChainHead_II, 0) ; #DEBUG_LINE_NO:426
    powerInterlocksRemaining_II = Self.CopySwitchArray(powerInterlocks_II) ; #DEBUG_LINE_NO:427
    Nishina02_PowerInterlocks_II.AddArray(powerInterlocks_II as ObjectReference[]) ; #DEBUG_LINE_NO:428
    If powerInterlocks_I.Length != powerInterlocks_II.Length ; #DEBUG_LINE_NO:430
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    totalInterlocks = powerInterlocks_I.Length ; #DEBUG_LINE_NO:433
    MQ207CTotalInterlockCountGlobal.SetValue(totalInterlocks as Float) ; #DEBUG_LINE_NO:434
    Self.UpdateCurrentInstanceGlobal(MQ207CTotalInterlockCountGlobal) ; #DEBUG_LINE_NO:435
    Int I = 0 ; #DEBUG_LINE_NO:437
    While I < powerInterlocks_I.Length ; #DEBUG_LINE_NO:438
      Self.RegisterForRemoteEvent(powerInterlocks_I[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:439
      powerInterlocks_I[I].SetColor("Green") ; #DEBUG_LINE_NO:440
      powerInterlocks_I[I].SetValue(MQ207C_PowerInterlockIDValue, (I + 1) as Float) ; #DEBUG_LINE_NO:441
      I += 1 ; #DEBUG_LINE_NO:442
    EndWhile ; #DEBUG_LINE_NO:
    I = 0 ; #DEBUG_LINE_NO:444
    While I < powerInterlocks_II.Length ; #DEBUG_LINE_NO:445
      Self.RegisterForRemoteEvent(powerInterlocks_II[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:446
      powerInterlocks_II[I].SetColor("Green") ; #DEBUG_LINE_NO:447
      powerInterlocks_II[I].SetValue(MQ207C_PowerInterlockIDValue, (I + 1) as Float) ; #DEBUG_LINE_NO:448
      I += 1 ; #DEBUG_LINE_NO:449
    EndWhile ; #DEBUG_LINE_NO:
    allPowerInterlocksEngaged_I = True ; #DEBUG_LINE_NO:453
    allPowerInterlocksEngaged_II = True ; #DEBUG_LINE_NO:454
    Self.Private_EngaussPowerInterlocks(1) ; #DEBUG_LINE_NO:457
    Self.Private_EngaussPowerInterlocks(2) ; #DEBUG_LINE_NO:458
    frequencyOutput_I = CONST_Frequency_FrequencyOutputInitial_I ; #DEBUG_LINE_NO:461
    frequencyOutput_II = CONST_Frequency_FrequencyOutputInitial_II ; #DEBUG_LINE_NO:462
    Self.Private_UpdateFrequencyIntakes() ; #DEBUG_LINE_NO:463
    labControlTerminal_I = Nishina02_LabControlTerminal_I.GetRef() ; #DEBUG_LINE_NO:466
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalUniverseValue, 1.0) ; #DEBUG_LINE_NO:467
    labControlTerminal_II = Nishina02_LabControlTerminal_II.GetRef() ; #DEBUG_LINE_NO:468
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalUniverseValue, 2.0) ; #DEBUG_LINE_NO:469
    Self.Private_UpdateTerminalData(1) ; #DEBUG_LINE_NO:472
    Self.Private_UpdateTerminalData(2) ; #DEBUG_LINE_NO:473
    emergencyShutdown_I = Nishina02_EmergencyShutdown_I.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:476
    emergencyShutdown_I.BlockActivation(True, False) ; #DEBUG_LINE_NO:477
    Self.RegisterForRemoteEvent(emergencyShutdown_I as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:478
    emergencyShutdown_II = Nishina02_EmergencyShutdown_II.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:479
    emergencyShutdown_II.BlockActivation(True, False) ; #DEBUG_LINE_NO:480
    Self.RegisterForRemoteEvent(emergencyShutdown_II as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:481
    PrimaryCalibration_I = Nishina02_PrimaryCalibration_I.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:484
    Self.RegisterForRemoteEvent(PrimaryCalibration_I as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:485
    PrimaryCalibration_II = Nishina02_PrimaryCalibration_II.GetRef() as genericswitchscript ; #DEBUG_LINE_NO:486
    Self.RegisterForRemoteEvent(PrimaryCalibration_II as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:487
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "OnFlicker") ; #DEBUG_LINE_NO:490
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "OnFlickerFast") ; #DEBUG_LINE_NO:491
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ProcessResearchLabActivation(genericswitchscript akSource, ObjectReference akActivator)
  If akSource == emergencyShutdown_I ; #DEBUG_LINE_NO:498
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_I) ; #DEBUG_LINE_NO:499
      MQ207C_EmergencyShutdownAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:500
    ElseIf powerInterlocksRemaining_I.Length > 0 ; #DEBUG_LINE_NO:501
      MQ207C_EmergencyShutdownNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:502
    ElseIf MQ207C_ShutdownWarningMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:504
      emergencyShutdown_I.PlayAnimation("Play01") ; #DEBUG_LINE_NO:505
      Self.ShutdownExperiment(False) ; #DEBUG_LINE_NO:506
      Self.SetStage(CONST_EmergencyShutdownTriggeredStage_I) ; #DEBUG_LINE_NO:507
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSource == emergencyShutdown_II ; #DEBUG_LINE_NO:510
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_II) ; #DEBUG_LINE_NO:511
      MQ207C_EmergencyShutdownAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:512
    ElseIf powerInterlocksRemaining_II.Length > 0 ; #DEBUG_LINE_NO:513
      MQ207C_EmergencyShutdownNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:514
    ElseIf MQ207C_ShutdownWarningMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:516
      emergencyShutdown_II.PlayAnimation("Play01") ; #DEBUG_LINE_NO:517
      Self.ShutdownExperiment(False) ; #DEBUG_LINE_NO:518
      Self.SetStage(CONST_EmergencyShutdownTriggeredStage_II) ; #DEBUG_LINE_NO:519
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSource == PrimaryCalibration_I ; #DEBUG_LINE_NO:523
    If PrimaryCalibrationEngaged_I ; #DEBUG_LINE_NO:524
      MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:525
    ElseIf !frequencyStable ; #DEBUG_LINE_NO:526
      MQ207C_PrimaryCalibrationNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:527
    Else ; #DEBUG_LINE_NO:
      PrimaryCalibration_I.SetColor("White") ; #DEBUG_LINE_NO:529
      PrimaryCalibration_I.SetState("On") ; #DEBUG_LINE_NO:530
      PrimaryCalibrationEngaged_I = True ; #DEBUG_LINE_NO:531
      If PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II ; #DEBUG_LINE_NO:532
        Self.DisableControls(False) ; #DEBUG_LINE_NO:533
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running") ; #DEBUG_LINE_NO:534
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running") ; #DEBUG_LINE_NO:535
        QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:536
        QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:537
        QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:538
        QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:539
        Self.SetStage(CONST_WaitForTheExperimentStage_III) ; #DEBUG_LINE_NO:540
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSource == PrimaryCalibration_II ; #DEBUG_LINE_NO:543
    If PrimaryCalibrationEngaged_II ; #DEBUG_LINE_NO:544
      MQ207C_PrimaryCalibrationAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:545
    ElseIf !frequencyStable ; #DEBUG_LINE_NO:546
      MQ207C_PrimaryCalibrationNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:547
    Else ; #DEBUG_LINE_NO:
      PrimaryCalibrationEngaged_II = True ; #DEBUG_LINE_NO:549
      PrimaryCalibration_II.SetColor("White") ; #DEBUG_LINE_NO:550
      PrimaryCalibration_II.SetState("On") ; #DEBUG_LINE_NO:551
      If PrimaryCalibrationEngaged_I && PrimaryCalibrationEngaged_II ; #DEBUG_LINE_NO:552
        Self.DisableControls(False) ; #DEBUG_LINE_NO:553
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running") ; #DEBUG_LINE_NO:554
        Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running") ; #DEBUG_LINE_NO:555
        QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:556
        QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:557
        QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:558
        QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:559
        Self.SetStage(CONST_WaitForTheExperimentStage_III) ; #DEBUG_LINE_NO:560
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf powerInterlocks_I.find(akSource, 0) >= 0 ; #DEBUG_LINE_NO:564
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_I) ; #DEBUG_LINE_NO:565
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:566
    ElseIf frequencyStable ; #DEBUG_LINE_NO:
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:568
    Else ; #DEBUG_LINE_NO:
      Int remainingIndex = powerInterlocksRemaining_I.find(akSource, 0) ; #DEBUG_LINE_NO:570
      If remainingIndex >= 0 ; #DEBUG_LINE_NO:571
        akSource.SetColor("Red") ; #DEBUG_LINE_NO:572
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage) ; #DEBUG_LINE_NO:573
        powerInterlocksRemaining_I.remove(remainingIndex, 1) ; #DEBUG_LINE_NO:574
        Nishina02_PowerInterlocks_I.RemoveRef(akSource as ObjectReference) ; #DEBUG_LINE_NO:575
        Self.Private_TryToDegaussPowerInterlock(akSource) ; #DEBUG_LINE_NO:576
        Self.Private_UpdateInterlockAndShutdownObjectives(1) ; #DEBUG_LINE_NO:577
        If powerInterlocksRemaining_I.Length == CONST_HalfInterlocksShutDownCount ; #DEBUG_LINE_NO:578
          Self.SetStage(CONST_HalfInterlocksShutDown_I_Stage) ; #DEBUG_LINE_NO:579
        ElseIf powerInterlocksRemaining_I.Length == 0 ; #DEBUG_LINE_NO:580
          Self.SetStage(CONST_AllInterlocksShutDown_I_Stage) ; #DEBUG_LINE_NO:581
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        akSource.SetColor("Green") ; #DEBUG_LINE_NO:584
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage) ; #DEBUG_LINE_NO:585
        powerInterlocksRemaining_I.add(akSource, 1) ; #DEBUG_LINE_NO:586
        Nishina02_PowerInterlocks_I.AddRef(akSource as ObjectReference) ; #DEBUG_LINE_NO:587
        Self.Private_UpdateInterlockAndShutdownObjectives(1) ; #DEBUG_LINE_NO:588
      EndIf ; #DEBUG_LINE_NO:
      Self.Private_UpdatePowerInterlocksState(1) ; #DEBUG_LINE_NO:590
    EndIf ; #DEBUG_LINE_NO:
  ElseIf powerInterlocks_II.find(akSource, 0) >= 0 ; #DEBUG_LINE_NO:592
    If Self.GetStageDone(CONST_EmergencyShutdownTriggeredStage_II) ; #DEBUG_LINE_NO:593
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:594
    ElseIf frequencyStable ; #DEBUG_LINE_NO:
      MQ207C_PowerInterlockNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:596
    Else ; #DEBUG_LINE_NO:
      Int remainingindex = powerInterlocksRemaining_II.find(akSource, 0) ; #DEBUG_LINE_NO:598
      If remainingindex >= 0 ; #DEBUG_LINE_NO:599
        akSource.SetColor("Red") ; #DEBUG_LINE_NO:600
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Engage) ; #DEBUG_LINE_NO:601
        powerInterlocksRemaining_II.remove(remainingindex, 1) ; #DEBUG_LINE_NO:602
        Nishina02_PowerInterlocks_II.RemoveRef(akSource as ObjectReference) ; #DEBUG_LINE_NO:603
        Self.Private_TryToDegaussPowerInterlock(akSource) ; #DEBUG_LINE_NO:604
        Self.Private_UpdateInterlockAndShutdownObjectives(2) ; #DEBUG_LINE_NO:605
      Else ; #DEBUG_LINE_NO:
        akSource.SetColor("Green") ; #DEBUG_LINE_NO:607
        akSource.SetActivateTextOverride(MQ207C_PowerInterlock_Disengage) ; #DEBUG_LINE_NO:608
        powerInterlocksRemaining_II.add(akSource, 1) ; #DEBUG_LINE_NO:609
        Nishina02_PowerInterlocks_II.AddRef(akSource as ObjectReference) ; #DEBUG_LINE_NO:610
        Self.Private_UpdateInterlockAndShutdownObjectives(2) ; #DEBUG_LINE_NO:611
      EndIf ; #DEBUG_LINE_NO:
      Self.Private_UpdatePowerInterlocksState(2) ; #DEBUG_LINE_NO:613
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdateLabResearchLabStateOnShift(Int universeID)
  If Self.GetStageDone(CONST_EnteredResearchLabStage) ; #DEBUG_LINE_NO:622
    Self.Private_UpdateInterlockAndShutdownObjectives(universeID) ; #DEBUG_LINE_NO:623
    Self.Private_UpdateTerminalData(universeID) ; #DEBUG_LINE_NO:624
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdateInterlockAndShutdownObjectives(Int universeID)
  If Self.IsObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective) || Self.IsObjectiveDisplayed(CONST_ShutDownTheProbeObjective) ; #DEBUG_LINE_NO:629
    Int currentInterlockCount = 0 ; #DEBUG_LINE_NO:630
    genericswitchscript currentEmergencyShutdownSwitch = None ; #DEBUG_LINE_NO:631
    If universeID == 1 ; #DEBUG_LINE_NO:632
      currentInterlockCount = totalInterlocks - powerInterlocksRemaining_I.Length ; #DEBUG_LINE_NO:633
      currentEmergencyShutdownSwitch = emergencyShutdown_I ; #DEBUG_LINE_NO:634
    Else ; #DEBUG_LINE_NO:
      currentInterlockCount = totalInterlocks - powerInterlocksRemaining_II.Length ; #DEBUG_LINE_NO:636
      currentEmergencyShutdownSwitch = emergencyShutdown_II ; #DEBUG_LINE_NO:637
    EndIf ; #DEBUG_LINE_NO:
    MQ207CCurrentInterlockCountGlobal.SetValue(currentInterlockCount as Float) ; #DEBUG_LINE_NO:639
    Self.UpdateCurrentInstanceGlobal(MQ207CCurrentInterlockCountGlobal) ; #DEBUG_LINE_NO:640
    If universeID == 1 && powerInterlocksRemaining_I.Length == 0 || universeID == 2 && powerInterlocksRemaining_II.Length == 0 ; #DEBUG_LINE_NO:642
      Self.SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective, True) ; #DEBUG_LINE_NO:643
      Self.SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective, True, False) ; #DEBUG_LINE_NO:644
      currentEmergencyShutdownSwitch.SetState("PulseFast") ; #DEBUG_LINE_NO:645
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveCompleted(CONST_DisengagePowerInterlocksObjective, False) ; #DEBUG_LINE_NO:647
      Self.SetObjectiveDisplayed(CONST_DisengagePowerInterlocksObjective, True, True) ; #DEBUG_LINE_NO:648
      Self.SetObjectiveDisplayed(CONST_ShutDownTheProbeObjective, False, False) ; #DEBUG_LINE_NO:649
      currentEmergencyShutdownSwitch.SetState("Off") ; #DEBUG_LINE_NO:650
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdateTerminalData(Int universeID)
  genericswitchscript[] currentInterlocksToDegauss = None ; #DEBUG_LINE_NO:656
  ObjectReference terminalToUpdate = None ; #DEBUG_LINE_NO:657
  If universeID == 1 ; #DEBUG_LINE_NO:658
    terminalToUpdate = labControlTerminal_I ; #DEBUG_LINE_NO:659
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_I.Length as Float) ; #DEBUG_LINE_NO:660
    currentInterlocksToDegauss = powerInterlocksToDegauss_I ; #DEBUG_LINE_NO:661
    terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_I as Float) ; #DEBUG_LINE_NO:662
    terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_I) ; #DEBUG_LINE_NO:663
  Else ; #DEBUG_LINE_NO:
    terminalToUpdate = labControlTerminal_II ; #DEBUG_LINE_NO:665
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingCountValue, powerInterlocksToDegauss_II.Length as Float) ; #DEBUG_LINE_NO:666
    currentInterlocksToDegauss = powerInterlocksToDegauss_II ; #DEBUG_LINE_NO:667
    terminalToUpdate.AddTextReplacementValue("OutputFrequency", frequencyOutput_II as Float) ; #DEBUG_LINE_NO:668
    terminalToUpdate.AddTextReplacementValue("IntakeFrequency", frequencyIntake_II) ; #DEBUG_LINE_NO:669
  EndIf ; #DEBUG_LINE_NO:
  If currentInterlocksToDegauss.Length > 3 ; #DEBUG_LINE_NO:672
    terminalToUpdate.AddTextReplacementValue("Degauss4", currentInterlocksToDegauss[3].GetValue(MQ207C_PowerInterlockIDValue)) ; #DEBUG_LINE_NO:673
  Else ; #DEBUG_LINE_NO:
    terminalToUpdate.AddTextReplacementValue("Degauss4", 0.0) ; #DEBUG_LINE_NO:675
  EndIf ; #DEBUG_LINE_NO:
  If currentInterlocksToDegauss.Length > 2 ; #DEBUG_LINE_NO:677
    terminalToUpdate.AddTextReplacementValue("Degauss3", currentInterlocksToDegauss[2].GetValue(MQ207C_PowerInterlockIDValue)) ; #DEBUG_LINE_NO:678
  Else ; #DEBUG_LINE_NO:
    terminalToUpdate.AddTextReplacementValue("Degauss3", 0.0) ; #DEBUG_LINE_NO:680
  EndIf ; #DEBUG_LINE_NO:
  If currentInterlocksToDegauss.Length > 1 ; #DEBUG_LINE_NO:682
    terminalToUpdate.AddTextReplacementValue("Degauss2", currentInterlocksToDegauss[1].GetValue(MQ207C_PowerInterlockIDValue)) ; #DEBUG_LINE_NO:683
  Else ; #DEBUG_LINE_NO:
    terminalToUpdate.AddTextReplacementValue("Degauss2", 0.0) ; #DEBUG_LINE_NO:685
  EndIf ; #DEBUG_LINE_NO:
  If currentInterlocksToDegauss.Length > 0 ; #DEBUG_LINE_NO:687
    terminalToUpdate.AddTextReplacementValue("Degauss1", currentInterlocksToDegauss[0].GetValue(MQ207C_PowerInterlockIDValue)) ; #DEBUG_LINE_NO:688
  Else ; #DEBUG_LINE_NO:
    terminalToUpdate.AddTextReplacementValue("Degauss1", 0.0) ; #DEBUG_LINE_NO:690
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateAllPowerInterlocks(String newColor, String newState)
  Int I = 0 ; #DEBUG_LINE_NO:695
  While I < powerInterlocks_I.Length ; #DEBUG_LINE_NO:696
    powerInterlocks_I[I].SetColor(newColor) ; #DEBUG_LINE_NO:697
    powerInterlocks_I[I].SetColor(newState) ; #DEBUG_LINE_NO:698
    I += 1 ; #DEBUG_LINE_NO:699
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:701
  While I < powerInterlocks_II.Length ; #DEBUG_LINE_NO:702
    powerInterlocks_II[I].SetColor(newColor) ; #DEBUG_LINE_NO:703
    powerInterlocks_II[I].SetColor(newState) ; #DEBUG_LINE_NO:704
    I += 1 ; #DEBUG_LINE_NO:705
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UpdateAllExperimentBeams(RefCollectionAlias beamCollection, String newState)
  defaultmultistateactivator[] beamCollectionRefs = beamCollection.GetArray() as defaultmultistateactivator[] ; #DEBUG_LINE_NO:710
  Int I = 0 ; #DEBUG_LINE_NO:711
  While I < beamCollectionRefs.Length ; #DEBUG_LINE_NO:712
    beamCollectionRefs[I].SetAnimationState(newState, False) ; #DEBUG_LINE_NO:713
    I += 1 ; #DEBUG_LINE_NO:714
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UpdateAllExperimentLights(RefCollectionAlias lightCollection, String newState)
  ObjectReference[] lightCollectionRefs = lightCollection.GetArray() ; #DEBUG_LINE_NO:719
  Int I = 0 ; #DEBUG_LINE_NO:720
  While I < lightCollectionRefs.Length ; #DEBUG_LINE_NO:721
    If newState == "Off" ; #DEBUG_LINE_NO:722
      lightCollectionRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:723
    Else ; #DEBUG_LINE_NO:
      lightCollectionRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:725
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:727
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ShutdownExperiment(Bool shouldDisableArtifact)
  If shouldDisableArtifact ; #DEBUG_LINE_NO:732
    artifactActivator_I.DisableNoWait(False) ; #DEBUG_LINE_NO:733
    artifactActivator_II.DisableNoWait(False) ; #DEBUG_LINE_NO:734
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateAllPowerInterlocks("", "Off") ; #DEBUG_LINE_NO:736
  emergencyShutdown_I.SetState("Off") ; #DEBUG_LINE_NO:737
  emergencyShutdown_II.SetState("Off") ; #DEBUG_LINE_NO:738
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Off") ; #DEBUG_LINE_NO:739
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Off") ; #DEBUG_LINE_NO:740
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, "Off") ; #DEBUG_LINE_NO:741
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, "Off") ; #DEBUG_LINE_NO:742
  Nishina02_ExperimentBeamHazards.DisableAll(False) ; #DEBUG_LINE_NO:743
  QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:744
  QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:745
  QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:746
  QST_MQ207C_Set_Universe_01_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:747
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:748
  QST_MQ207C_Set_Universe_02_State_01_Solved_Off_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:749
  QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:750
  QST_MQ207C_Set_Universe_02_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:751
  QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:752
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:753
  QST_MQ207C_Universe_01_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:754
  QST_MQ207C_Set_Universe_01_State_01_Solved_Off_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:755
  QST_MQ207C_Universe_01_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:756
  QST_MQ207C_Universe_01_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:757
  QST_MQ207C_Universe_02_Laser_Experiment_01_Machine_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:758
  QST_MQ207C_Universe_02_Laser_Experiment_02_Laser_Beam_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:759
  QST_MQ207C_Universe_02_Laser_Experiment_03_Impact_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:760
EndFunction

Function Private_EngaussPowerInterlocks(Int universe)
  If universe == 1 ; #DEBUG_LINE_NO:770
    powerInterlocksToDegauss_I = commonarrayfunctions.SortRefsByValue(Self.SelectRandomSwitch(powerInterlocks_I, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as genericswitchscript[] ; #DEBUG_LINE_NO:771
  Else ; #DEBUG_LINE_NO:
    powerInterlocksToDegauss_II = commonarrayfunctions.SortRefsByValue(Self.SelectRandomSwitch(powerInterlocks_II, Utility.RandomInt(CONST_MinInterlocksToDegauss, CONST_MaxInterlocksToDegauss)) as ObjectReference[], MQ207C_PowerInterlockIDValue) as genericswitchscript[] ; #DEBUG_LINE_NO:773
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToStartDegaussing(Int universe)
  If universe == 1 && allPowerInterlocksEngaged_I ; #DEBUG_LINE_NO:779
    degaussingStarted_I = True ; #DEBUG_LINE_NO:780
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1.0) ; #DEBUG_LINE_NO:781
  ElseIf universe == 2 && allPowerInterlocksEngaged_II ; #DEBUG_LINE_NO:782
    degaussingStarted_II = True ; #DEBUG_LINE_NO:783
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 1.0) ; #DEBUG_LINE_NO:784
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_TryToDegaussPowerInterlock(genericswitchscript powerInterlock)
  Int index1 = powerInterlocksToDegauss_I.find(powerInterlock, 0) ; #DEBUG_LINE_NO:790
  If index1 >= 0 && degaussingStarted_I ; #DEBUG_LINE_NO:791
    powerInterlocksToDegauss_I.remove(index1, 1) ; #DEBUG_LINE_NO:792
    Self.Private_UpdateTerminalData(1) ; #DEBUG_LINE_NO:793
  Else ; #DEBUG_LINE_NO:
    Int index2 = powerInterlocksToDegauss_II.find(powerInterlock, 0) ; #DEBUG_LINE_NO:795
    If index2 >= 0 && degaussingStarted_II ; #DEBUG_LINE_NO:796
      powerInterlocksToDegauss_II.remove(index2, 1) ; #DEBUG_LINE_NO:797
      Self.Private_UpdateTerminalData(2) ; #DEBUG_LINE_NO:798
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdatePowerInterlocksState(Int universe)
  If universe == 1 ; #DEBUG_LINE_NO:805
    allPowerInterlocksEngaged_I = powerInterlocksRemaining_I.Length == powerInterlocks_I.Length ; #DEBUG_LINE_NO:806
    allPowerInterlocksDegaussed_I = powerInterlocksToDegauss_I.Length == 0 ; #DEBUG_LINE_NO:807
    If frequencyCalibrationStarted_I ; #DEBUG_LINE_NO:808
      Self.Private_FailFrequencyCalibration(1) ; #DEBUG_LINE_NO:809
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    allPowerInterlocksEngaged_II = powerInterlocksRemaining_II.Length == powerInterlocks_II.Length ; #DEBUG_LINE_NO:812
    allPowerInterlocksDegaussed_II = powerInterlocksToDegauss_II.Length == 0 ; #DEBUG_LINE_NO:813
    If frequencyCalibrationStarted_II ; #DEBUG_LINE_NO:814
      Self.Private_FailFrequencyCalibration(2) ; #DEBUG_LINE_NO:815
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToStartFrequencyCalibration(Int universe)
  If universe == 1 ; #DEBUG_LINE_NO:827
    If allPowerInterlocksEngaged_I && allPowerInterlocksDegaussed_I ; #DEBUG_LINE_NO:828
      frequencyCalibrationStarted_I = True ; #DEBUG_LINE_NO:829
      labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0) ; #DEBUG_LINE_NO:830
    Else ; #DEBUG_LINE_NO:
      Self.Private_FailFrequencyCalibration(1) ; #DEBUG_LINE_NO:832
    EndIf ; #DEBUG_LINE_NO:
  ElseIf allPowerInterlocksEngaged_II && allPowerInterlocksDegaussed_II ; #DEBUG_LINE_NO:835
    frequencyCalibrationStarted_II = True ; #DEBUG_LINE_NO:836
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0) ; #DEBUG_LINE_NO:837
  Else ; #DEBUG_LINE_NO:
    Self.Private_FailFrequencyCalibration(2) ; #DEBUG_LINE_NO:839
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetFrequencyOutput(Int universe, Int output)
  If universe == 1 ; #DEBUG_LINE_NO:846
    frequencyOutput_I = output ; #DEBUG_LINE_NO:847
  Else ; #DEBUG_LINE_NO:
    frequencyOutput_II = output ; #DEBUG_LINE_NO:849
  EndIf ; #DEBUG_LINE_NO:
  Self.Private_UpdateFrequencyIntakes() ; #DEBUG_LINE_NO:851
  Self.Private_UpdateTerminalData(universe) ; #DEBUG_LINE_NO:852
EndFunction

Function Private_UpdateFrequencyIntakes()
  frequencyIntake_I = frequencyOutput_I as Float - (frequencyOutput_II as Float * CONST_FrequencyMultiplier) ; #DEBUG_LINE_NO:857
  frequencyIntake_II = frequencyOutput_II as Float + (frequencyOutput_I as Float * CONST_FrequencyMultiplier) ; #DEBUG_LINE_NO:858
  If frequencyOutput_I == CONST_Frequency_FrequencyOutputTarget_I && frequencyOutput_II == CONST_Frequency_FrequencyOutputTarget_II ; #DEBUG_LINE_NO:859
    frequencyStable = True ; #DEBUG_LINE_NO:860
    Self.UpdateAllPowerInterlocks("White", "") ; #DEBUG_LINE_NO:861
    PrimaryCalibration_I.SetState("Pulse") ; #DEBUG_LINE_NO:862
    PrimaryCalibration_II.SetState("Pulse") ; #DEBUG_LINE_NO:863
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized") ; #DEBUG_LINE_NO:864
    Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized") ; #DEBUG_LINE_NO:865
    QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:866
    QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:867
    QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:868
    QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:869
    Self.SetStage(CONST_ActivatePrimaryCalibrationStage) ; #DEBUG_LINE_NO:870
  Else ; #DEBUG_LINE_NO:
    frequencyStable = False ; #DEBUG_LINE_NO:872
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Private_FailFrequencyCalibration(Int universe)
  If universe == 1 ; #DEBUG_LINE_NO:878
    degaussingStarted_I = False ; #DEBUG_LINE_NO:879
    frequencyCalibrationStarted_I = False ; #DEBUG_LINE_NO:880
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0.0) ; #DEBUG_LINE_NO:881
    labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0.0) ; #DEBUG_LINE_NO:882
    Self.Private_EngaussPowerInterlocks(1) ; #DEBUG_LINE_NO:883
    Self.Private_UpdateTerminalData(1) ; #DEBUG_LINE_NO:884
  ElseIf universe == 2 ; #DEBUG_LINE_NO:885
    degaussingStarted_II = False ; #DEBUG_LINE_NO:886
    frequencyCalibrationStarted_II = False ; #DEBUG_LINE_NO:887
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalDegaussingActiveValue, 0.0) ; #DEBUG_LINE_NO:888
    labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 0.0) ; #DEBUG_LINE_NO:889
    Self.Private_EngaussPowerInterlocks(2) ; #DEBUG_LINE_NO:890
    Self.Private_UpdateTerminalData(2) ; #DEBUG_LINE_NO:891
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlaySpecialEndingShifting()
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:901
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:902
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:903
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:904
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:905
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:906
  Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:907
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:908
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:909
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:910
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:911
  selfAsShiftingQuest.Shift(None, False, False, -1, None) ; #DEBUG_LINE_NO:912
  If !player.IsDead() ; #DEBUG_LINE_NO:913
    Self.SetStage(CONST_GiveTheArtifactStage_III) ; #DEBUG_LINE_NO:914
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnblockArtifactActivator_I()
  Nishina02_ArtifactBeckonSFX_I.EnableAll(False) ; #DEBUG_LINE_NO:924
  artifactActivator_I.BlockActivation(False, False) ; #DEBUG_LINE_NO:925
EndFunction

Function UnblockArtifactActivator_II()
  Nishina02_ArtifactBeckonSFX_II.EnableAll(False) ; #DEBUG_LINE_NO:929
  artifactActivator_II.BlockActivation(False, False) ; #DEBUG_LINE_NO:930
EndFunction

Function ProcessArtifactActivatorActivation(ObjectReference akSource, ObjectReference akActivator)
  If akSource == artifactActivator_I && Self.GetStageDone(CONST_TakeTheArtifactStage_I) ; #DEBUG_LINE_NO:934
    Nishina02_ArtifactBeckonSFX_I.DisableAll(False) ; #DEBUG_LINE_NO:935
    Self.SetStage(CONST_TookTheArtifactStage_I) ; #DEBUG_LINE_NO:936
    Self.GiveArtifact() ; #DEBUG_LINE_NO:937
  ElseIf akSource == artifactActivator_II && Self.GetStageDone(CONST_TakeTheArtifactStage_II) ; #DEBUG_LINE_NO:938
    Nishina02_ArtifactBeckonSFX_II.DisableAll(False) ; #DEBUG_LINE_NO:939
    Self.SetStage(CONST_TookTheArtifactStage_II) ; #DEBUG_LINE_NO:940
    Self.GiveArtifact() ; #DEBUG_LINE_NO:941
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function GiveArtifact()
  artifactActivator_I.DisableNoWait(False) ; #DEBUG_LINE_NO:947
  artifactActivator_II.DisableNoWait(False) ; #DEBUG_LINE_NO:948
  ObjectReference artifactRef = StarbornTempleQuest.PlaceArtifact(CONST_MQ207CArtifactID, AnnouncementMarker.GetRef()) ; #DEBUG_LINE_NO:951
  MQ207B_Artifact02QuestObject.ForceRefTo(artifactRef) ; #DEBUG_LINE_NO:952
  player.AddItem(artifactRef as Form, 1, False) ; #DEBUG_LINE_NO:953
  StarbornTempleQuest.SetPlayerAcquiredArtifact(CONST_MQ207CArtifactID) ; #DEBUG_LINE_NO:956
EndFunction

Function SetRefColSecurityDoorStateNoWait(RefCollectionAlias securityDoorRefCol, Bool shouldSeal, Bool shouldOpenDoor)
  Var[] akArgs = new Var[3] ; #DEBUG_LINE_NO:997
  akArgs[0] = securityDoorRefCol as Var ; #DEBUG_LINE_NO:998
  akArgs[1] = shouldSeal as Var ; #DEBUG_LINE_NO:999
  akArgs[2] = shouldOpenDoor as Var ; #DEBUG_LINE_NO:1000
  Self.CallFunctionNoWait("SetRefColSecurityDoorState", akArgs) ; #DEBUG_LINE_NO:1001
EndFunction

Function SetRefColSecurityDoorState(RefCollectionAlias securityDoorRefCol, Bool shouldSeal, Bool shouldOpenDoor)
  ObjectReference[] doors = securityDoorRefCol.GetArray() ; #DEBUG_LINE_NO:1005
  Int I = 0 ; #DEBUG_LINE_NO:1006
  While I < doors.Length ; #DEBUG_LINE_NO:1007
    If shouldSeal ; #DEBUG_LINE_NO:1008
      Self.SealSecurityDoor(doors[I]) ; #DEBUG_LINE_NO:1009
    Else ; #DEBUG_LINE_NO:
      Self.UnsealSecurityDoor(doors[I], shouldOpenDoor) ; #DEBUG_LINE_NO:1011
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1013
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SealSecurityDoorNoWait(ObjectReference securityDoor)
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:1019
  akArgs[0] = securityDoor as Var ; #DEBUG_LINE_NO:1020
  Self.CallFunctionNoWait("SealSecurityDoor", akArgs) ; #DEBUG_LINE_NO:1021
EndFunction

Function SealSecurityDoor(ObjectReference securityDoor)
  If securityDoor != None ; #DEBUG_LINE_NO:1026
    Int openState = securityDoor.GetOpenState() ; #DEBUG_LINE_NO:1027
    While openState == 2 || openState == 4 ; #DEBUG_LINE_NO:1028
      Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:1029
      openState = securityDoor.GetOpenState() ; #DEBUG_LINE_NO:1030
    EndWhile ; #DEBUG_LINE_NO:
    securityDoor.SetOpen(False) ; #DEBUG_LINE_NO:1032
    If securityDoor.GetLockLevel() > 0 ; #DEBUG_LINE_NO:1033
      securityDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:1034
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnsealSecurityDoorNoWait(ObjectReference securityDoor, Bool shouldOpenDoor)
  Var[] akArgs = new Var[2] ; #DEBUG_LINE_NO:1041
  akArgs[0] = securityDoor as Var ; #DEBUG_LINE_NO:1042
  akArgs[1] = shouldOpenDoor as Var ; #DEBUG_LINE_NO:1043
  Self.CallFunctionNoWait("UnsealSecurityDoor", akArgs) ; #DEBUG_LINE_NO:1044
EndFunction

Function UnsealSecurityDoor(ObjectReference securityDoor, Bool shouldOpenDoor)
  If securityDoor != None ; #DEBUG_LINE_NO:1049
    Int openState = securityDoor.GetOpenState() ; #DEBUG_LINE_NO:1050
    While openState == 2 || openState == 4 ; #DEBUG_LINE_NO:1051
      Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:1052
      openState = securityDoor.GetOpenState() ; #DEBUG_LINE_NO:1053
    EndWhile ; #DEBUG_LINE_NO:
    If securityDoor.Is3DLoaded() ; #DEBUG_LINE_NO:1055
      WwiseEvent_DRSRemoteUnlock.Play(securityDoor, None, None) ; #DEBUG_LINE_NO:1056
    EndIf ; #DEBUG_LINE_NO:
    securityDoor.Unlock(False) ; #DEBUG_LINE_NO:1058
    If shouldOpenDoor ; #DEBUG_LINE_NO:1059
      securityDoor.SetOpen(True) ; #DEBUG_LINE_NO:1060
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AllowSecurityDoorUnlock(ObjectReference securityDoor, Bool shouldAllow)
  If shouldAllow ; #DEBUG_LINE_NO:1067
    securityDoor.SetFactionOwner(MQ207CNishinaEscortFaction, False) ; #DEBUG_LINE_NO:1068
  Else ; #DEBUG_LINE_NO:
    securityDoor.SetFactionOwner(None, False) ; #DEBUG_LINE_NO:1070
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayLockdownEndedSFXNoWait()
  Self.CallFunctionNoWait("PlayLockdownEndedSFX", None) ; #DEBUG_LINE_NO:1076
EndFunction

Function PlayLockdownEndedSFX()
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:1080
  OBJ_Mq207C_Alarm_Science_Station_Lockdown_End_WEF.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:1081
EndFunction

Function SetRefColCameraState(RefCollectionAlias cameraCol, Bool shouldBeEssentialAndIFH, Bool shouldBeDead)
  Actor[] cameras = cameraCol.GetArray() as Actor[] ; #DEBUG_LINE_NO:1090
  Int I = 0 ; #DEBUG_LINE_NO:1091
  While I < cameras.Length ; #DEBUG_LINE_NO:1092
    If cameras[I] != None ; #DEBUG_LINE_NO:1093
      If shouldBeDead ; #DEBUG_LINE_NO:1094
        cameras[I].Kill(None) ; #DEBUG_LINE_NO:1095
      ElseIf shouldBeEssentialAndIFH ; #DEBUG_LINE_NO:
        cameras[I].IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:1097
        cameras[I].SetEssential(True) ; #DEBUG_LINE_NO:1098
        cameras[I].RemoveFromFaction(MQ207CNishinaIEnemyFaction) ; #DEBUG_LINE_NO:1099
        cameras[I].AddToFaction(MQ207CNishinaIFaction) ; #DEBUG_LINE_NO:1100
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1103
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StartMusicOverride()
  Self.StartTimer(0.0, CONST_MusicOverrideUpdateTimerID) ; #DEBUG_LINE_NO:1113
EndFunction

Function StopMusicOverride()
  Self.CancelTimer(CONST_MusicOverrideUpdateTimerID) ; #DEBUG_LINE_NO:1117
  MUSGenesisCombat_MQ207C_Nishina.Remove() ; #DEBUG_LINE_NO:1118
EndFunction

Event OnTimer(Int timerID)
  If timerID == CONST_MusicOverrideUpdateTimerID ; #DEBUG_LINE_NO:1122
    If Self.GetStage() < CONST_AllEndingsCommonStage ; #DEBUG_LINE_NO:1123
      Bool isInArtifactRoom = Nishina02_ArtifactRoomMusicTrigger_I.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) || Nishina02_ArtifactRoomMusicTrigger_II.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:1124
      If isInArtifactRoom && !musicOverrideActive ; #DEBUG_LINE_NO:1125
        musicOverrideActive = True ; #DEBUG_LINE_NO:1126
        MUSGenesisCombat_MQ207C_Nishina.Add() ; #DEBUG_LINE_NO:1127
      ElseIf !isInArtifactRoom && musicOverrideActive ; #DEBUG_LINE_NO:1128
        musicOverrideActive = False ; #DEBUG_LINE_NO:1129
        MUSGenesisCombat_MQ207C_Nishina.Remove() ; #DEBUG_LINE_NO:1130
      EndIf ; #DEBUG_LINE_NO:
      If Nishina02_ArtifactRoomMusicTrigger_I.GetRef().Is3DLoaded() ; #DEBUG_LINE_NO:1132
        Self.StartTimer(CONST_MusicOverrideUpdateTimerDelay as Float, CONST_MusicOverrideUpdateTimerID) ; #DEBUG_LINE_NO:1133
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      MUSGenesisCombat_MQ207C_Nishina.Remove() ; #DEBUG_LINE_NO:1136
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TriggerResearchLabAmbushWave(Int universeID, Int waveID)
  If universeID == 1 ; #DEBUG_LINE_NO:1149
    If waveID == 2 ; #DEBUG_LINE_NO:1150
      (Nishina02_ArtifactRoomWave2Activator_I.GetRef() as dnlocalalarmscript).TriggerAlarm() ; #DEBUG_LINE_NO:1151
    ElseIf waveID == 3 ; #DEBUG_LINE_NO:1152
      (Nishina02_ArtifactRoomWave3Activator_I.GetRef() as dnlocalalarmscript).TriggerAlarm() ; #DEBUG_LINE_NO:1153
    EndIf ; #DEBUG_LINE_NO:
  ElseIf universeID == 2 ; #DEBUG_LINE_NO:1155
    If waveID == 2 ; #DEBUG_LINE_NO:1156
      Nishina02_ArtifactRoomWave2Activator_II.GetRef().SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:1157
    ElseIf waveID == 3 ; #DEBUG_LINE_NO:1158
      Nishina02_ArtifactRoomWave3Activator_II.GetRef().SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:1159
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CleanupNishina01Creatures()
  Actor[] creatures = Nishina01_CreaturesAll_II.GetArray() as Actor[] ; #DEBUG_LINE_NO:1166
  Int I = 0 ; #DEBUG_LINE_NO:1167
  While I < creatures.Length ; #DEBUG_LINE_NO:1168
    If creatures[I] != None && !creatures[I].IsDead() ; #DEBUG_LINE_NO:1169
      creatures[I].DisableNoWait(False) ; #DEBUG_LINE_NO:1170
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1172
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetNishina02TerminalsLockedNoWait()
  Self.CallFunctionNoWait("SetNishina02TerminalsLocked", None) ; #DEBUG_LINE_NO:1178
EndFunction

Function SetNishina02TerminalsLocked()
  ObjectReference[] terminals = Nishina02_TerminalsAll.GetArray() ; #DEBUG_LINE_NO:1182
  Int I = 0 ; #DEBUG_LINE_NO:1183
  While I < terminals.Length ; #DEBUG_LINE_NO:1184
    terminals[I].Lock(True, False, True) ; #DEBUG_LINE_NO:1185
    terminals[I].SetLockLevel(CONST_LockLevel_RequiresKey) ; #DEBUG_LINE_NO:1186
    I += 1 ; #DEBUG_LINE_NO:1187
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SilenceNishina02AlarmsNoWait()
  Self.CallFunctionNoWait("SilenceNishina02Alarms", None) ; #DEBUG_LINE_NO:1194
EndFunction

Function SilenceNishina02Alarms()
  dnlocalalarmscript[] alarms = Nishina02_Alarms_All_I.GetArray() as dnlocalalarmscript[] ; #DEBUG_LINE_NO:1198
  Int I = 0 ; #DEBUG_LINE_NO:1199
  While I < alarms.Length ; #DEBUG_LINE_NO:1200
    If alarms[I] != None ; #DEBUG_LINE_NO:1201
      alarms[I].StopAlarmSFX() ; #DEBUG_LINE_NO:1202
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1204
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetNishina02RobotsAndTurretsUnconsciousNoWait()
  Self.CallFunctionNoWait("SetNishina02RobotsAndTurretsUnconscious", None) ; #DEBUG_LINE_NO:1211
EndFunction

Function SetNishina02RobotsAndTurretsUnconscious()
  Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[] ; #DEBUG_LINE_NO:1215
  Int I = 0 ; #DEBUG_LINE_NO:1216
  While I < robotsAndTurrets.Length ; #DEBUG_LINE_NO:1217
    If robotsAndTurrets[I] != None && !robotsAndTurrets[I].IsDead() ; #DEBUG_LINE_NO:1218
      robotsAndTurrets[I].SetUnconscious(True) ; #DEBUG_LINE_NO:1219
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1221
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CleanupNishina02RobotsAndTurretsNoWait()
  Self.CallFunctionNoWait("CleanupNishina02RobotsAndTurrets", None) ; #DEBUG_LINE_NO:1228
EndFunction

Function CleanupNishina02RobotsAndTurrets()
  Actor[] robotsAndTurrets = Nishina02_RobotsAndTurrets_All_I.GetArray() as Actor[] ; #DEBUG_LINE_NO:1232
  Int I = 0 ; #DEBUG_LINE_NO:1233
  While I < robotsAndTurrets.Length ; #DEBUG_LINE_NO:1234
    Actor current = robotsAndTurrets[I] ; #DEBUG_LINE_NO:1235
    If current != None && !current.IsDead() ; #DEBUG_LINE_NO:1236
      If Nishina02_RobotsToDisablePostquest_I.Find(current as ObjectReference) >= 0 ; #DEBUG_LINE_NO:1237
        current.DisableNoWait(False) ; #DEBUG_LINE_NO:1238
      Else ; #DEBUG_LINE_NO:
        current.SetUnconscious(True) ; #DEBUG_LINE_NO:1240
        current.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:1241
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:1244
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ResetArtifactPositions()
  If artifactActivator_I != None && artifactActivator_II != None && !Self.GetStageDone(CONST_TookTheArtifactStage_I) && !Self.GetStageDone(CONST_TookTheArtifactStage_II) && !Self.GetStageDone(CONST_GiveTheArtifactStage_III) ; #DEBUG_LINE_NO:1254,1255
    artifactActivator_I.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:1256
    artifactActivator_II.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:1257
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearVariables()
  NishinaExt_IntercomRef = None ; #DEBUG_LINE_NO:1268
  NishinaExt_ExteriorDoor_I_Ref = None ; #DEBUG_LINE_NO:1269
  artifactActivator_I = None ; #DEBUG_LINE_NO:1270
  artifactActivator_II = None ; #DEBUG_LINE_NO:1271
  powerInterlocks_I = None ; #DEBUG_LINE_NO:1273
  powerInterlocksRemaining_I = None ; #DEBUG_LINE_NO:1274
  powerInterlocksToDegauss_I = None ; #DEBUG_LINE_NO:1275
  powerInterlocks_II = None ; #DEBUG_LINE_NO:1276
  powerInterlocksRemaining_II = None ; #DEBUG_LINE_NO:1277
  powerInterlocksToDegauss_II = None ; #DEBUG_LINE_NO:1278
  emergencyShutdown_I = None ; #DEBUG_LINE_NO:1279
  emergencyShutdown_II = None ; #DEBUG_LINE_NO:1280
  PrimaryCalibration_I = None ; #DEBUG_LINE_NO:1281
  PrimaryCalibration_II = None ; #DEBUG_LINE_NO:1282
  labControlTerminal_I = None ; #DEBUG_LINE_NO:1283
  labControlTerminal_II = None ; #DEBUG_LINE_NO:1284
  selfAsShiftingQuest.ClearVariables() ; #DEBUG_LINE_NO:1286
EndFunction

genericswitchscript[] Function CopySwitchArray(genericswitchscript[] input)
  genericswitchscript[] output = new genericswitchscript[input.Length] ; #DEBUG_LINE_NO:1296
  Int I = 0 ; #DEBUG_LINE_NO:1297
  While I < input.Length ; #DEBUG_LINE_NO:1298
    output[I] = input[I] ; #DEBUG_LINE_NO:1299
    I += 1 ; #DEBUG_LINE_NO:1300
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:1302
EndFunction

genericswitchscript[] Function CopyAndRandomizeSwitchArray(genericswitchscript[] input)
  genericswitchscript[] output = Self.CopySwitchArray(input) ; #DEBUG_LINE_NO:1307
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0) ; #DEBUG_LINE_NO:1308
  Int I = output.Length - 1 ; #DEBUG_LINE_NO:1309
  While I >= 0 ; #DEBUG_LINE_NO:1310
    Int currentRandomIndex = (random[I] * I as Float) as Int ; #DEBUG_LINE_NO:1311
    genericswitchscript temp = output[I] ; #DEBUG_LINE_NO:1312
    output[I] = output[currentRandomIndex] ; #DEBUG_LINE_NO:1313
    output[currentRandomIndex] = temp ; #DEBUG_LINE_NO:1314
    I -= 1 ; #DEBUG_LINE_NO:1315
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:1317
EndFunction

genericswitchscript[] Function SelectRandomSwitch(genericswitchscript[] input, Int numToSelect)
  genericswitchscript[] randomizedInput = Self.CopyAndRandomizeSwitchArray(input) ; #DEBUG_LINE_NO:1322
  genericswitchscript[] output = new genericswitchscript[numToSelect] ; #DEBUG_LINE_NO:1323
  Int I = 0 ; #DEBUG_LINE_NO:1324
  While I < numToSelect ; #DEBUG_LINE_NO:1325
    output[I] = randomizedInput[I] ; #DEBUG_LINE_NO:1326
    I += 1 ; #DEBUG_LINE_NO:1327
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:1329
EndFunction

Function DebugOpenDoors()
  Self.SetStage(30) ; #DEBUG_LINE_NO:1336
  Self.SetStage(40) ; #DEBUG_LINE_NO:1337
  Self.SetStage(580) ; #DEBUG_LINE_NO:1338
EndFunction

Function DEBUG_ForceFrequencyCalibration()
  frequencyCalibrationStarted_I = True ; #DEBUG_LINE_NO:1342
  labControlTerminal_I.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0) ; #DEBUG_LINE_NO:1343
  frequencyCalibrationStarted_II = True ; #DEBUG_LINE_NO:1344
  labControlTerminal_II.SetValue(MQ207C_LabControlTerminalCalibrationActiveValue, 1.0) ; #DEBUG_LINE_NO:1345
EndFunction

Function DEBUG_UpdateAllExperimentBeams(String newState)
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, newState) ; #DEBUG_LINE_NO:1349
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, newState) ; #DEBUG_LINE_NO:1350
EndFunction

Function DEBUG_UpdateAllExperimentLights(String newState)
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_I, newState) ; #DEBUG_LINE_NO:1354
  Self.UpdateAllExperimentLights(Nishina02_ExperimentBeamLights_II, newState) ; #DEBUG_LINE_NO:1355
EndFunction

Function DEBUG_Shutdown01()
  emergencyShutdown_I.PlayAnimation("Play01") ; #DEBUG_LINE_NO:1359
  Self.ShutdownExperiment(False) ; #DEBUG_LINE_NO:1360
  Self.SetStage(CONST_EmergencyShutdownTriggeredStage_I) ; #DEBUG_LINE_NO:1361
EndFunction

Function DEBUG_Shutdown02()
  emergencyShutdown_II.PlayAnimation("Play01") ; #DEBUG_LINE_NO:1365
  Self.ShutdownExperiment(False) ; #DEBUG_LINE_NO:1366
  Self.SetStage(CONST_EmergencyShutdownTriggeredStage_II) ; #DEBUG_LINE_NO:1367
EndFunction

Function DEBUG_Stabilize()
  frequencyStable = True ; #DEBUG_LINE_NO:1371
  Self.UpdateAllPowerInterlocks("White", "") ; #DEBUG_LINE_NO:1372
  PrimaryCalibration_I.SetState("Pulse") ; #DEBUG_LINE_NO:1373
  PrimaryCalibration_II.SetState("Pulse") ; #DEBUG_LINE_NO:1374
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized") ; #DEBUG_LINE_NO:1375
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Stabilized") ; #DEBUG_LINE_NO:1376
  QST_MQ207C_Set_Universe_01_State_03_Unsolved_Unstable_Flicker_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1377
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1378
  QST_MQ207C_Set_Universe_02_State_04_Unsolved_Unstable_FlickerFast_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1379
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1380
  Self.SetStage(CONST_ActivatePrimaryCalibrationStage) ; #DEBUG_LINE_NO:1381
EndFunction

Function DEBUG_Running()
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_I, "Running") ; #DEBUG_LINE_NO:1385
  Self.UpdateAllExperimentBeams(Nishina02_ExperimentBeams_II, "Running") ; #DEBUG_LINE_NO:1386
  QST_MQ207C_Set_Universe_01_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1387
  QST_MQ207C_Set_Universe_01_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1388
  QST_MQ207C_Set_Universe_02_State_05_Unsolved_Stabilized_MarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:1389
  QST_MQ207C_Set_Universe_02_State_02_Solved_Running_MarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1390
  Self.SetStage(CONST_WaitForTheExperimentStage_III) ; #DEBUG_LINE_NO:1391
EndFunction

;-- State -------------------------------------------
State ProcessingEvent

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForEvent

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("ProcessingEvent") ; #DEBUG_LINE_NO:966
    If akSource == NishinaExt_ExteriorDoor_I_Ref ; #DEBUG_LINE_NO:967
      Self.BlockFollowersAtExteriorDoor() ; #DEBUG_LINE_NO:968
    ElseIf akSource == artifactActivator_I || akSource == artifactActivator_II ; #DEBUG_LINE_NO:969
      Self.ProcessArtifactActivatorActivation(akSource, akActivator) ; #DEBUG_LINE_NO:970
    Else ; #DEBUG_LINE_NO:
      Self.ProcessResearchLabActivation(akSource as genericswitchscript, akActivator) ; #DEBUG_LINE_NO:972
    EndIf ; #DEBUG_LINE_NO:
    Self.GoToState("WaitingForEvent") ; #DEBUG_LINE_NO:974
  EndEvent
EndState
