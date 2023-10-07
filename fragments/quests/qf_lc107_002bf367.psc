ScriptName Fragments:Quests:QF_LC107_002BF367 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF_Main Auto Const mandatory
Quest Property CF07 Auto Const mandatory
ObjectReference Property LC107_EscapeStateNonvault_DisableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateNonvault_EnableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_DisableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_EnableMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeStateEnableSpecialMarkerRef Auto Const mandatory
ObjectReference Property LC107_EntranceMarkerRef Auto Const mandatory
ObjectReference Property LC107_VaultEntranceMarkerRef Auto Const mandatory
ObjectReference Property LC107_EngineeringMarkerRef Auto Const mandatory
ObjectReference Property LC107_VaultFloorMarkerRef Auto Const mandatory
ObjectReference Property LC107_ControlRoomMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeEngineMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeEngineeringMarkerRef Auto Const mandatory
ObjectReference Property LC107_EscapeVaultEntranceMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_DockingPortDoor Auto Const mandatory
ReferenceAlias Property Alias_CaptainTransferModule Auto Const mandatory
ReferenceAlias Property Alias_JasperKryxTransferModule Auto Const mandatory
ReferenceAlias Property Alias_DataCoreEmpty Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
ReferenceAlias Property Alias_LegacyShip Auto Const mandatory
ReferenceAlias Property Alias_UnknownShipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_LegacyShipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VaultEntranceDoor Auto Const mandatory
ReferenceAlias Property Alias_VaultControlEntryDoor Auto Const mandatory
ReferenceAlias Property Alias_VaultControlsDataCoreSlot Auto Const mandatory
ReferenceAlias Property Alias_JasperKryxSlateFinal Auto Const mandatory
ReferenceAlias Property Alias_ErebosShip Auto Const mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_LC107_DestructionAudioSwitchMarker Auto Const mandatory
RefCollectionAlias Property HullBreachTriggers Auto Const
RefCollectionAlias Property Alias_EntryEnemies Auto Const mandatory
RefCollectionAlias Property Alias_EscapeEnemies Auto Const mandatory
RefCollectionAlias Property Alias_EscapeDoors Auto Const mandatory
RefCollectionAlias Property Alias_EscapeTriggers Auto Const mandatory
RefCollectionAlias Property Alias_QuickstartDoors Auto Const mandatory
RefCollectionAlias Property Alias_ReactorsMain Auto Const mandatory
RefCollectionAlias Property Alias_ReactorsAux Auto Const mandatory
RefCollectionAlias Property Alias_NavmeshGenOnlyRefs Auto Const mandatory
RefCollectionAlias Property Alias_NavmeshGenInitialRefs Auto Const mandatory
Scene Property CF07_zzLegacy000_Companion_Storm_Approach Auto Const mandatory
Scene Property CF07_zzLegacy001_Companion_Storm_During Auto Const mandatory
Scene Property CF07_zzLegacy002_Companion_Storm_ShipSighted Auto Const mandatory
Scene Property CF07_zLegacy000_Callout_InitialLockdown Auto Const mandatory
Scene Property CF07_zLegacy004_Callout_CurrencyTransfer Auto Const mandatory
Scene Property CF07_zLegacy005_Callout_CurrencyTransferComplete Auto Const mandatory
Scene Property CF07_zLegacy006_Callout_HullBreach Auto Const mandatory
Scene Property CF07_zLegacy008_Callout_SecurityAlarm Auto Const mandatory
Scene Property CF07_zzLegacy003_Companion_Ship_Robots Auto Const mandatory
Scene Property CF07_zzLegacy004_Companion_Ship_CrewQuarters Auto Const mandatory
Scene Property CF07_zzLegacy006_Companion_Ship_CredTank Auto Const mandatory
Scene Property CF07_zzLegacy007_Companion_Ship_CredTankBay Auto Const mandatory
Scene Property CF07_zzLegacy008_Companion_Ship_KryxRemains Auto Const mandatory
Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const mandatory
Key Property LC107_EngineeringSafeKey Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
wwiseevent Property WwiseEvent_QST_CF07_BlackScreen Auto Const mandatory
ReferenceAlias Property Alias_LegacyShipNameOverride Auto Const mandatory
ActorValue Property Invulnerable Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ObjectReference Property LC107_EscapeStateVault_Lighting_EnableMarkerRef Auto Const mandatory
VisualEffect Property FX_ShipExplosionHuge02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0012_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0013_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0202_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0245_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0290_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0301_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0310_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0373_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0501_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0511_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0650_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:10
  CF07.SetStage(220) ; #DEBUG_LINE_NO:13
  CF07.SetStage(230) ; #DEBUG_LINE_NO:14
  Self.SetStage(20) ; #DEBUG_LINE_NO:15
  Self.SetStage(190) ; #DEBUG_LINE_NO:16
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:19
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:20
  playerRef.MoveTo(LC107_EntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:38
  CF07.SetStage(220) ; #DEBUG_LINE_NO:41
  CF07.SetStage(230) ; #DEBUG_LINE_NO:42
  Self.SetStage(20) ; #DEBUG_LINE_NO:43
  Self.SetStage(190) ; #DEBUG_LINE_NO:44
  Self.SetStage(200) ; #DEBUG_LINE_NO:45
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:48
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:49
  playerRef.MoveTo(LC107_VaultEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:67
  CF07.SetStage(220) ; #DEBUG_LINE_NO:70
  CF07.SetStage(230) ; #DEBUG_LINE_NO:71
  Self.SetStage(20) ; #DEBUG_LINE_NO:72
  Self.SetStage(190) ; #DEBUG_LINE_NO:73
  Self.SetStage(200) ; #DEBUG_LINE_NO:74
  Self.SetStage(240) ; #DEBUG_LINE_NO:75
  Self.SetStage(250) ; #DEBUG_LINE_NO:76
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:79
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:80
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:82
  playerRef.MoveTo(LC107_EngineeringMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:95
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:96
  Self.SetStage(9) ; #DEBUG_LINE_NO:102
  CF07.SetStage(220) ; #DEBUG_LINE_NO:105
  CF07.SetStage(230) ; #DEBUG_LINE_NO:106
  Self.SetStage(20) ; #DEBUG_LINE_NO:107
  Self.SetStage(190) ; #DEBUG_LINE_NO:108
  Self.SetStage(200) ; #DEBUG_LINE_NO:109
  Self.SetStage(220) ; #DEBUG_LINE_NO:110
  Self.SetStage(240) ; #DEBUG_LINE_NO:111
  Self.SetStage(250) ; #DEBUG_LINE_NO:112
  Self.SetStage(270) ; #DEBUG_LINE_NO:113
  Self.SetStage(290) ; #DEBUG_LINE_NO:114
  Self.SetStage(300) ; #DEBUG_LINE_NO:115
  Self.SetStage(310) ; #DEBUG_LINE_NO:116
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:119
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:122
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:123
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:125
  playerRef.MoveTo(LC107_VaultFloorMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:130
  kmyQuest.WaitForCredTankInitialization() ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:142
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:143
  Self.SetStage(9) ; #DEBUG_LINE_NO:149
  CF07.SetStage(220) ; #DEBUG_LINE_NO:152
  CF07.SetStage(230) ; #DEBUG_LINE_NO:153
  CF07.SetStage(270) ; #DEBUG_LINE_NO:154
  CF07.SetStage(275) ; #DEBUG_LINE_NO:155
  CF07.SetStage(276) ; #DEBUG_LINE_NO:156
  CF07.SetStage(280) ; #DEBUG_LINE_NO:157
  CF07.SetStage(290) ; #DEBUG_LINE_NO:158
  Self.SetStage(20) ; #DEBUG_LINE_NO:159
  Self.SetStage(190) ; #DEBUG_LINE_NO:160
  Self.SetStage(200) ; #DEBUG_LINE_NO:161
  Self.SetStage(240) ; #DEBUG_LINE_NO:162
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:165
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:168
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:169
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:171
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:172
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:173
  playerRef.MoveTo(LC107_ControlRoomMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:176
  kmyQuest.WaitForCredTankInitialization() ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:191
  Self.SetStage(20) ; #DEBUG_LINE_NO:194
  Self.SetStage(190) ; #DEBUG_LINE_NO:195
  Self.SetStage(200) ; #DEBUG_LINE_NO:196
  Self.SetStage(240) ; #DEBUG_LINE_NO:197
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:200
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:203
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:205
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:206
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:207
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:208
  Alias_EntryEnemies.DisableAll(False) ; #DEBUG_LINE_NO:211
  playerRef.MoveTo(LC107_ControlRoomMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:214
  Self.SetStage(510) ; #DEBUG_LINE_NO:217
  Self.SetStage(515) ; #DEBUG_LINE_NO:218
  Self.SetStage(521) ; #DEBUG_LINE_NO:219
  CF07.SetStage(400) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:234
  Self.SetStage(20) ; #DEBUG_LINE_NO:237
  Self.SetStage(190) ; #DEBUG_LINE_NO:238
  Self.SetStage(200) ; #DEBUG_LINE_NO:239
  Self.SetStage(240) ; #DEBUG_LINE_NO:240
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:243
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:246
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:248
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:249
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:250
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:251
  Alias_EntryEnemies.DisableAll(False) ; #DEBUG_LINE_NO:254
  playerRef.MoveTo(LC107_EscapeEngineMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:257
  Self.SetStage(510) ; #DEBUG_LINE_NO:260
  Self.SetStage(515) ; #DEBUG_LINE_NO:261
  Self.SetStage(521) ; #DEBUG_LINE_NO:262
  CF07.SetStage(400) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:277
  Self.SetStage(20) ; #DEBUG_LINE_NO:280
  Self.SetStage(190) ; #DEBUG_LINE_NO:281
  Self.SetStage(200) ; #DEBUG_LINE_NO:282
  Self.SetStage(240) ; #DEBUG_LINE_NO:283
  Self.SetStage(600) ; #DEBUG_LINE_NO:284
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:287
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:290
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:292
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:293
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:294
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:295
  Alias_EntryEnemies.DisableAll(False) ; #DEBUG_LINE_NO:298
  playerRef.MoveTo(LC107_EscapeEngineeringMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:301
  Self.SetStage(510) ; #DEBUG_LINE_NO:304
  Self.SetStage(515) ; #DEBUG_LINE_NO:305
  Self.SetStage(521) ; #DEBUG_LINE_NO:306
  CF07.SetStage(400) ; #DEBUG_LINE_NO:307
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(9) ; #DEBUG_LINE_NO:321
  Self.SetStage(20) ; #DEBUG_LINE_NO:324
  Self.SetStage(190) ; #DEBUG_LINE_NO:325
  Self.SetStage(200) ; #DEBUG_LINE_NO:326
  Self.SetStage(240) ; #DEBUG_LINE_NO:327
  Self.SetStage(650) ; #DEBUG_LINE_NO:328
  Alias_QuickstartDoors.SetOpen(True) ; #DEBUG_LINE_NO:331
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:334
  playerRef.AddItem(Alias_DataCoreFull.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:336
  playerRef.AddItem(Alias_CaptainTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:337
  playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:338
  playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:339
  Alias_EntryEnemies.DisableAll(False) ; #DEBUG_LINE_NO:342
  playerRef.MoveTo(LC107_EscapeVaultEntranceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:345
  Self.SetStage(510) ; #DEBUG_LINE_NO:348
  Self.SetStage(515) ; #DEBUG_LINE_NO:349
  Self.SetStage(521) ; #DEBUG_LINE_NO:350
  CF07.SetStage(400) ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:373
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:374
  kmyQuest.SetReactorState(Alias_ReactorsMain, kmyQuest.CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:380
  kmyQuest.SetReactorState(Alias_ReactorsAux, kmyQuest.CONST_ReactorState_Active) ; #DEBUG_LINE_NO:381
  Alias_NavmeshGenOnlyRefs.DisableAll(False) ; #DEBUG_LINE_NO:384
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:392
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:393
  kmyQuest.ResetStandardCredTanks() ; #DEBUG_LINE_NO:401
EndFunction

Function Fragment_Stage_0015_Item_00()
  Game.GetPlayer().AddItem(LC107_EngineeringSafeKey as Form, 1, False) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0018_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:436
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:437
  Self.SetStage(9) ; #DEBUG_LINE_NO:443
  CF07.SetStage(210) ; #DEBUG_LINE_NO:446
  Self.SetStage(20) ; #DEBUG_LINE_NO:447
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:450
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:451
  kmyQuest.DEBUG_GoToSpaceAndWait(False) ; #DEBUG_LINE_NO:458
EndFunction

Function Fragment_Stage_0019_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:466
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:467
  Self.SetStage(9) ; #DEBUG_LINE_NO:473
  CF07.SetStage(210) ; #DEBUG_LINE_NO:476
  Self.SetStage(20) ; #DEBUG_LINE_NO:477
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:480
  playerRef.AddItem(Alias_DataCoreEmpty.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:481
  kmyQuest.DEBUG_GoToSpaceAndWait(True) ; #DEBUG_LINE_NO:488
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:496
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:497
  spaceshipreference legacyRef = Alias_LegacyShip.GetShipRef() ; #DEBUG_LINE_NO:503
  spaceshipreference erebosRef = Alias_ErebosShip.GetShipRef() ; #DEBUG_LINE_NO:504
  legacyRef.Enable(False) ; #DEBUG_LINE_NO:505
  erebosRef.Enable(False) ; #DEBUG_LINE_NO:506
  erebosRef.InstantDock(legacyRef as ObjectReference) ; #DEBUG_LINE_NO:507
  Alias_UnknownShipMapMarker.TryToEnable() ; #DEBUG_LINE_NO:508
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:516
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:517
  If !Self.GetStageDone(190) ; #DEBUG_LINE_NO:522
    CF07_zzLegacy000_Companion_Storm_Approach.Start() ; #DEBUG_LINE_NO:524
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0101_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:533
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:534
  kmyQuest.UpdateArrivalProcess() ; #DEBUG_LINE_NO:540
EndFunction

Function Fragment_Stage_0150_Item_00()
  If !Self.GetStageDone(190) ; #DEBUG_LINE_NO:550
    CF07_zzLegacy001_Companion_Storm_During.Start() ; #DEBUG_LINE_NO:552
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0151_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:561
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:562
  kmyQuest.UpdateArrivalProcess() ; #DEBUG_LINE_NO:568
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetStage(172) ; #DEBUG_LINE_NO:579
  If !Self.GetStageDone(190) ; #DEBUG_LINE_NO:581
    CF07_zzLegacy002_Companion_Storm_ShipSighted.Start() ; #DEBUG_LINE_NO:583
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0171_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:592
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:593
EndFunction

Function Fragment_Stage_0172_Item_00()
  Alias_LegacyShipNameOverride.Clear() ; #DEBUG_LINE_NO:607
  Alias_UnknownShipMapMarker.TryToDisable() ; #DEBUG_LINE_NO:608
  Alias_LegacyShipMapMarker.TryToEnable() ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:620
  Self.SetStage(150) ; #DEBUG_LINE_NO:621
  Self.SetStage(170) ; #DEBUG_LINE_NO:622
  Self.SetStage(172) ; #DEBUG_LINE_NO:623
EndFunction

Function Fragment_Stage_0201_Item_00()
  CF07_zLegacy000_Callout_InitialLockdown.Start() ; #DEBUG_LINE_NO:642
EndFunction

Function Fragment_Stage_0204_Item_00()
  CF07_zzLegacy004_Companion_Ship_CrewQuarters.Start() ; #DEBUG_LINE_NO:661
EndFunction

Function Fragment_Stage_0220_Item_00()
  CF07.SetStage(240) ; #DEBUG_LINE_NO:672
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:680
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:681
  Alias_VaultEntranceDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:687
  CF07.SetStage(255) ; #DEBUG_LINE_NO:690
EndFunction

Function Fragment_Stage_0260_Item_00()
  CF07.SetStage(260) ; #DEBUG_LINE_NO:717
  CF07_zzLegacy006_Companion_Ship_CredTank.Start() ; #DEBUG_LINE_NO:720
EndFunction

Function Fragment_Stage_0265_Item_00()
  CF07.SetStage(265) ; #DEBUG_LINE_NO:731
EndFunction

Function Fragment_Stage_0270_Item_00()
  CF07.SetStage(266) ; #DEBUG_LINE_NO:742
EndFunction

Function Fragment_Stage_0280_Item_00()
  CF07_zLegacy008_Callout_SecurityAlarm.Start() ; #DEBUG_LINE_NO:753
EndFunction

Function Fragment_Stage_0302_Item_00()
  CF07_zzLegacy007_Companion_Ship_CredTankBay.Start() ; #DEBUG_LINE_NO:788
EndFunction

Function Fragment_Stage_0320_Item_00()
  CF07_zzLegacy008_Companion_Ship_KryxRemains.Start() ; #DEBUG_LINE_NO:807
  CF07.SetStage(270) ; #DEBUG_LINE_NO:810
EndFunction

Function Fragment_Stage_0330_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:818
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:819
  kmyQuest.UnblockVaultPowerSwitches() ; #DEBUG_LINE_NO:825
EndFunction

Function Fragment_Stage_0331_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:833
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:834
  If Self.GetStageDone(331) && Self.GetStageDone(332) ; #DEBUG_LINE_NO:840
    Self.SetStage(333) ; #DEBUG_LINE_NO:841
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_HalfPower) ; #DEBUG_LINE_NO:843
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0332_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:852
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:853
  If Self.GetStageDone(331) && Self.GetStageDone(332) ; #DEBUG_LINE_NO:859
    Self.SetStage(333) ; #DEBUG_LINE_NO:860
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_HalfPower) ; #DEBUG_LINE_NO:862
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0333_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:871
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:872
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Powered) ; #DEBUG_LINE_NO:878
  CF07.SetStage(300) ; #DEBUG_LINE_NO:881
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStageDone(340) && Self.GetStageDone(341) ; #DEBUG_LINE_NO:892
    Self.SetStage(342) ; #DEBUG_LINE_NO:893
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0341_Item_00()
  If Self.GetStageDone(340) && Self.GetStageDone(341) ; #DEBUG_LINE_NO:905
    Self.SetStage(342) ; #DEBUG_LINE_NO:906
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0342_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:915
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:916
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert) ; #DEBUG_LINE_NO:922
EndFunction

Function Fragment_Stage_0343_Item_00()
  CF07.SetStage(360) ; #DEBUG_LINE_NO:933
EndFunction

Function Fragment_Stage_0345_Item_00()
  Self.SetStage(350) ; #DEBUG_LINE_NO:944
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:952
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:953
  Self.SetStageNoWait(351) ; #DEBUG_LINE_NO:959
  CF07_zLegacy004_Callout_CurrencyTransfer.Start() ; #DEBUG_LINE_NO:962
  CF07.SetStage(370) ; #DEBUG_LINE_NO:963
  kmyQuest.PerformCredTankDataTransfer() ; #DEBUG_LINE_NO:964
  Self.SetStage(360) ; #DEBUG_LINE_NO:967
EndFunction

Function Fragment_Stage_0351_Item_00()
  ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef() ; #DEBUG_LINE_NO:978
  vaultControlEntryDoorRef.SetOpen(False) ; #DEBUG_LINE_NO:979
  vaultControlEntryDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:980
  vaultControlEntryDoorRef.SetLockLevel(253) ; #DEBUG_LINE_NO:981
  LC107_EscapeStateNonvault_DisableMarkerRef.Disable(False) ; #DEBUG_LINE_NO:984
  LC107_EscapeStateNonvault_EnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:985
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:993
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:994
  kmyQuest.DisableFastTravelOnLegacy() ; #DEBUG_LINE_NO:1000
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_DownloadFinished) ; #DEBUG_LINE_NO:1003
  CF07_zLegacy005_Callout_CurrencyTransferComplete.Start() ; #DEBUG_LINE_NO:1006
  CF07.SetStage(380) ; #DEBUG_LINE_NO:1007
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(370) && Self.GetStageDone(371) ; #DEBUG_LINE_NO:1018
    Self.SetStage(372) ; #DEBUG_LINE_NO:1019
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0371_Item_00()
  If Self.GetStageDone(370) && Self.GetStageDone(371) ; #DEBUG_LINE_NO:1031
    Self.SetStage(372) ; #DEBUG_LINE_NO:1032
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0372_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1041
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1042
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval) ; #DEBUG_LINE_NO:1048
  kmyQuest.PopupDataCore() ; #DEBUG_LINE_NO:1051
  Self.SetStage(373) ; #DEBUG_LINE_NO:1054
EndFunction

Function Fragment_Stage_0374_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1070
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1071
  kmyQuest.LockPlayerForEscape() ; #DEBUG_LINE_NO:1077
  CF07_zLegacy006_Callout_HullBreach.Start() ; #DEBUG_LINE_NO:1080
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1088
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1089
  kmyQuest.PlayBreachSequenceStartVFX() ; #DEBUG_LINE_NO:1095
  Self.SetStage(501) ; #DEBUG_LINE_NO:1098
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1114
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1115
  kmyQuest.CallFunctionNoWait("CredTanksShutdown", None) ; #DEBUG_LINE_NO:1127
  kmyQuest.CallFunctionNoWait("BreakVaultInstantBreaches", None) ; #DEBUG_LINE_NO:1130
  LC107_EscapeStateVault_DisableMarkerRef.Disable(False) ; #DEBUG_LINE_NO:1134
  LC107_EscapeStateVault_EnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:1135
  LC107_EscapeStateVault_Lighting_EnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:1136
  Alias_NavmeshGenInitialRefs.DisableAll(False) ; #DEBUG_LINE_NO:1141
  HullBreachTriggers.EnableAll(False) ; #DEBUG_LINE_NO:1145
  kmyQuest.WaitForBreachesAndCredTanks() ; #DEBUG_LINE_NO:1149
  Alias_LC107_DestructionAudioSwitchMarker.TryToEnable() ; #DEBUG_LINE_NO:1157
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Shutdown) ; #DEBUG_LINE_NO:1160
  Self.SetStage(511) ; #DEBUG_LINE_NO:1163
  Self.SetStageNoWait(515) ; #DEBUG_LINE_NO:1166
EndFunction

Function Fragment_Stage_0515_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1182
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1183
  If Self.GetStageDone(3) || Self.GetStageDone(4) ; #DEBUG_LINE_NO:1190
    Alias_EntryEnemies.DisableAll(False) ; #DEBUG_LINE_NO:1191
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef() ; #DEBUG_LINE_NO:1195
  vaultControlEntryDoorRef.Unlock(False) ; #DEBUG_LINE_NO:1196
  vaultControlEntryDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:1197
  Alias_EscapeTriggers.EnableAll(False) ; #DEBUG_LINE_NO:1200
  Alias_EscapeEnemies.EnableAll(False) ; #DEBUG_LINE_NO:1201
  Alias_EscapeDoors.SetOpen(True) ; #DEBUG_LINE_NO:1204
  LC107_EscapeStateNonvault_DisableMarkerRef.Disable(False) ; #DEBUG_LINE_NO:1207
  LC107_EscapeStateNonvault_EnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:1208
  kmyQuest.SetReactorState(Alias_ReactorsMain, kmyQuest.CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:1211
  kmyQuest.SetReactorState(Alias_ReactorsAux, kmyQuest.CONST_ReactorState_Inactive) ; #DEBUG_LINE_NO:1212
  kmyQuest.SetVaultControlsPowerStatus(kmyQuest.CONST_VaultControlsPowerStatus_Reset) ; #DEBUG_LINE_NO:1215
  kmyQuest.SetNotSealedEnvironment() ; #DEBUG_LINE_NO:1218
  kmyQuest.BreakOtherInstantBreaches() ; #DEBUG_LINE_NO:1221
  kmyQuest.DamageDestructibleTraps() ; #DEBUG_LINE_NO:1224
EndFunction

Function Fragment_Stage_0520_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1232
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1233
  kmyQuest.PlayBreachSequenceEndVFX() ; #DEBUG_LINE_NO:1239
  kmyQuest.UnlockPlayerMovement() ; #DEBUG_LINE_NO:1242
  Self.SetStage(521) ; #DEBUG_LINE_NO:1245
EndFunction

Function Fragment_Stage_0521_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1253
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1254
  kmyQuest.StartAmbientExplosions(0) ; #DEBUG_LINE_NO:1260
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:1263
  (Alias_LC107HullBreachInitialTrigger02.GetRef() as lc107hullbreachtriggerscript).TriggerBreaches() ; #DEBUG_LINE_NO:1264
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:1265
  (Alias_LC107HullBreachInitialTrigger01.GetRef() as lc107hullbreachtriggerscript).TriggerBreaches() ; #DEBUG_LINE_NO:1266
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1282
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1283
  kmyQuest.StartAmbientExplosions(1) ; #DEBUG_LINE_NO:1289
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1305
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1306
  kmyQuest.StartAmbientExplosions(2) ; #DEBUG_LINE_NO:1312
EndFunction

Function Fragment_Stage_0770_Item_00()
  LC107_EscapeStateEnableSpecialMarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:1324
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1340
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1341
  spaceshipreference erebosShip = Alias_ErebosShip.GetShipRef() ; #DEBUG_LINE_NO:1347
  erebosShip.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:1348
  erebosShip.SetEssential(False) ; #DEBUG_LINE_NO:1349
  erebosShip.InstantUndock() ; #DEBUG_LINE_NO:1350
  erebosShip.Kill(None) ; #DEBUG_LINE_NO:1351
  spaceshipreference legacyRef = Alias_LegacyShip.GetShipRef() ; #DEBUG_LINE_NO:1352
  legacyRef.SetValue(Invulnerable, 0.0) ; #DEBUG_LINE_NO:1353
  legacyRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:1354
  legacyRef.SetEssential(False) ; #DEBUG_LINE_NO:1355
  FX_ShipExplosionHuge02.Play(legacyRef as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:1356
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:1357
  legacyRef.Kill(None) ; #DEBUG_LINE_NO:1358
  Alias_UnknownShipMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1361
  Alias_LegacyShipMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1362
  kmyQuest.UnlockFastTravel() ; #DEBUG_LINE_NO:1365
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1373
  lc107questscript kmyQuest = __temp as lc107questscript ; #DEBUG_LINE_NO:1374
  Self.SetStage(1000) ; #DEBUG_LINE_NO:1380
  Alias_ErebosShip.TryToDisable() ; #DEBUG_LINE_NO:1381
  Alias_LegacyShip.TryToDisable() ; #DEBUG_LINE_NO:1382
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:1385
  Self.Stop() ; #DEBUG_LINE_NO:1388
EndFunction
