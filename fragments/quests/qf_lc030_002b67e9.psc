ScriptName Fragments:Quests:QF_LC030_002B67E9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory
Location Property LC030LockLocation Auto Const mandatory
ReferenceAlias Property Alias_DelgadosShip Auto Const mandatory
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly01 Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly02 Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly01_Corpse Auto Const mandatory
ReferenceAlias Property Alias_GenericAlly02_Corpse Auto Const mandatory
ReferenceAlias Property Alias_InteriorEnemiesEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger03 Auto Const mandatory
RefCollectionAlias Property Alias_TransferChamberOffscreenCombatEnemies Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger03 Auto Const mandatory
RefCollectionAlias Property Alias_ShuttleBayEnemies_All Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger01 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger02 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger03 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayGryllobaQueen Auto Const mandatory
ObjectReference Property LC030_Postquest_ShuttleBaySwapEnableMarker Auto Const mandatory
ObjectReference Property LC030_Postquest_ShuttleBaySwapDisableMarker Auto Const mandatory
RefCollectionAlias Property Alias_TransferChamberSecurityDoors Auto Const mandatory
RefCollectionAlias Property Alias_DBlockSecurityDoors Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker01Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker02Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker03Ref Auto Const mandatory
ObjectReference Property LC030_LightsEnableMarker04Ref Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section01 Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section02 Auto Const mandatory
ReferenceAlias Property Alias_FissureSwitch_Section03 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section01 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section02 Auto Const mandatory
RefCollectionAlias Property Alias_FissureCellDoors_Section03 Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayDoorManager Auto Const mandatory
ReferenceAlias Property Alias_ShuttleBayWardensDoor Auto Const mandatory
ReferenceAlias Property Alias_HomeShip Auto Const mandatory
ReferenceAlias Property Alias_KeyPlayerDockingPort Auto Const mandatory
Keyword Property SpaceshipStoredLink Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_1 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_2 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_3 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPoweringUp_4 Auto Const mandatory
wwiseevent Property QST_CF03_FacilityPowerOn_MachinesOn Auto Const mandatory
wwiseevent Property QST_CF03_Stage7_AmbushQueen Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_A Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_B Auto Const mandatory
wwiseevent Property QST_CF03_CellblockLiftLockdown_Switch_C Auto Const mandatory
ReferenceAlias Property Alias_WeatherManager Auto Const mandatory
ReferenceAlias Property Alias_FissureKryxCellDoor Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_MapMarkerHeadingClose Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0642_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0660_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_DelgadosShip.TryToEnable() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_MapMarker.GetRef().SetLinkedRef(Alias_MapMarkerHeadingClose.GetRef(), None, True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_InteriorEnemiesEnableMarker.TryToEnable() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:40
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:41
  Self.SetStage(20) ; #DEBUG_LINE_NO:47
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:48
  (Alias_TransferChamberAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:51
  kmyQuest.StartTransferChamberMonitor() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0211_Item_00()
  (Alias_TransferChamberAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0212_Item_00()
  (Alias_TransferChamberAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0220_Item_00()
  CF03.SetStage(70) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0250_Item_00()
  CF03.SetStage(85) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0260_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:107
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:108
  kmyQuest.UnblockCollapsingWallActivation() ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0269_Item_00()
  CF03.SetStage(105) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0270_Item_00()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:136
  Alias_TransferChamberOffscreenCombatEnemies.EnableAll(False) ; #DEBUG_LINE_NO:139
  Alias_TransferChamberOffscreenCombatEnemies.StartCombatAll(Alias_Delgado.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0279_Item_00()
  Alias_GenericAlly01.TryToDisable() ; #DEBUG_LINE_NO:151
  Alias_GenericAlly02.TryToDisable() ; #DEBUG_LINE_NO:152
  Alias_GenericAlly01_Corpse.TryToEnable() ; #DEBUG_LINE_NO:153
  Alias_GenericAlly02_Corpse.TryToEnable() ; #DEBUG_LINE_NO:154
  Actor[] offscreenCombatEnemies = Alias_TransferChamberOffscreenCombatEnemies.GetArray() as Actor[] ; #DEBUG_LINE_NO:157
  Int I = 0 ; #DEBUG_LINE_NO:158
  While I < offscreenCombatEnemies.Length ; #DEBUG_LINE_NO:159
    If !offscreenCombatEnemies[I].IsDead() ; #DEBUG_LINE_NO:160
      offscreenCombatEnemies[I].Kill(None) ; #DEBUG_LINE_NO:161
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:163
  EndWhile ; #DEBUG_LINE_NO:
  Actor delgadoRef = Alias_Delgado.GetActorRef() ; #DEBUG_LINE_NO:167
  delgadoRef.StopCombat() ; #DEBUG_LINE_NO:168
  delgadoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:169
  delgadoRef.MoveToPackageLocation() ; #DEBUG_LINE_NO:170
  delgadoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0280_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:182
  While I < Alias_TransferChamberSecurityDoors.GetCount() ; #DEBUG_LINE_NO:183
    ObjectReference current = Alias_TransferChamberSecurityDoors.GetAt(I) ; #DEBUG_LINE_NO:184
    current.SetOpen(True) ; #DEBUG_LINE_NO:185
    I += 1 ; #DEBUG_LINE_NO:186
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:198
  Int I = 0 ; #DEBUG_LINE_NO:201
  While I < Alias_DBlockSecurityDoors.GetCount() ; #DEBUG_LINE_NO:202
    ObjectReference current = Alias_DBlockSecurityDoors.GetAt(I) ; #DEBUG_LINE_NO:203
    current.SetOpen(True) ; #DEBUG_LINE_NO:204
    I += 1 ; #DEBUG_LINE_NO:205
  EndWhile ; #DEBUG_LINE_NO:
  CF03.SetStageNoWait(136) ; #DEBUG_LINE_NO:209
  LC030_LightsEnableMarker01Ref.Enable(False) ; #DEBUG_LINE_NO:212
  QST_CF03_FacilityPoweringUp_1.Play(LC030_LightsEnableMarker01Ref, None, None) ; #DEBUG_LINE_NO:213
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:214
  LC030_LightsEnableMarker02Ref.Enable(False) ; #DEBUG_LINE_NO:215
  QST_CF03_FacilityPoweringUp_2.Play(LC030_LightsEnableMarker02Ref, None, None) ; #DEBUG_LINE_NO:216
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:217
  LC030_LightsEnableMarker03Ref.Enable(False) ; #DEBUG_LINE_NO:218
  QST_CF03_FacilityPoweringUp_3.Play(LC030_LightsEnableMarker03Ref, None, None) ; #DEBUG_LINE_NO:219
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:220
  LC030_LightsEnableMarker04Ref.Enable(False) ; #DEBUG_LINE_NO:221
  QST_CF03_FacilityPoweringUp_4.Play(LC030_LightsEnableMarker04Ref, None, None) ; #DEBUG_LINE_NO:222
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:223
  QST_CF03_FacilityPowerOn_MachinesOn.Play(LC030_LightsEnableMarker04Ref, None, None) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0411_Item_00()
  (Alias_FissureSwitch_Section01.GetRef() as genericswitchscript).SetState("On") ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_0412_Item_00()
  (Alias_FissureSwitch_Section02.GetRef() as genericswitchscript).SetState("On") ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0413_Item_00()
  (Alias_FissureSwitch_Section03.GetRef() as genericswitchscript).SetState("On") ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0421_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_B.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:268
  Alias_FissureCellDoors_Section01.SetOpen(True) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0422_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_C.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:280
  Alias_FissureCellDoors_Section02.SetOpen(True) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0423_Item_00()
  QST_CF03_CellblockLiftLockdown_Switch_A.Play(Alias_FissureKryxCellDoor.GetRef(), None, None) ; #DEBUG_LINE_NO:292
  Alias_FissureCellDoors_Section03.SetOpen(True) ; #DEBUG_LINE_NO:293
  CF03.SetStage(177) ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0520_Item_00()
  (Alias_BarracksAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:307
  (Alias_BarracksAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:308
  (Alias_BarracksAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:309
EndFunction

Function Fragment_Stage_0630_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:317
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:318
  Alias_ShuttleBayWardensDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:324
EndFunction

Function Fragment_Stage_0631_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:332
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:333
  Alias_DelgadosShip.TryToDisable() ; #DEBUG_LINE_NO:339
  (Alias_ShuttleBayDoorManager.GetRef() as shuttlebaydoormanagerscript).OpenShuttleBayDoors() ; #DEBUG_LINE_NO:342
EndFunction

Function Fragment_Stage_0640_Item_00()
  (Alias_ShuttleBayAmbushTrigger01.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_0641_Item_00()
  (Alias_ShuttleBayAmbushTrigger02.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:364
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:367
  QST_CF03_Stage7_AmbushQueen.Play(Alias_ShuttleBayGryllobaQueen.GetRef(), None, None) ; #DEBUG_LINE_NO:368
  Utility.Wait(1.299999952) ; #DEBUG_LINE_NO:369
  (Alias_ShuttleBayAmbushTrigger03.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:370
  Self.SetStage(642) ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_0650_Item_00()
  CF03.SetStage(270) ; #DEBUG_LINE_NO:392
EndFunction

Function Fragment_Stage_0690_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:408
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:409
  CF03.SetStage(315) ; #DEBUG_LINE_NO:414
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:422
  lc030_questscript kmyQuest = __temp as lc030_questscript ; #DEBUG_LINE_NO:423
  Self.SetStage(20) ; #DEBUG_LINE_NO:429
  Self.SetStage(280) ; #DEBUG_LINE_NO:430
  Self.SetStage(300) ; #DEBUG_LINE_NO:431
  Self.SetStage(630) ; #DEBUG_LINE_NO:432
  Self.SetStage(631) ; #DEBUG_LINE_NO:433
  LC030_Postquest_ShuttleBaySwapEnableMarker.Enable(False) ; #DEBUG_LINE_NO:436
  LC030_Postquest_ShuttleBaySwapDisableMarker.Disable(False) ; #DEBUG_LINE_NO:437
  Alias_WeatherManager.TryToDisable() ; #DEBUG_LINE_NO:440
  kmyQuest.SetIgnoreFriendlyHitsOnAllies(False) ; #DEBUG_LINE_NO:443
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:446
  Self.Stop() ; #DEBUG_LINE_NO:449
EndFunction
