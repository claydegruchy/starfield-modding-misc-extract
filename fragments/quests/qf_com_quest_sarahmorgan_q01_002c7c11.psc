ScriptName Fragments:Quests:QF_COM_Quest_SarahMorgan_Q01_002C7C11 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property COM_SQ01_LoganStartTriggerRef Auto Const mandatory
ReferenceAlias Property Alias_Sarah Auto Const mandatory
ReferenceAlias Property Alias_Sona Auto Const mandatory
ReferenceAlias Property Alias_AdmiralLogan Auto Const mandatory
ObjectReference Property COM_SMQ01_LoganOfficeMarker Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage020_LoganScene Auto Const mandatory
ObjectReference Property COM_SMQ01_PowerConduitRef Auto Const mandatory
ObjectReference Property COM_SMQ01_Stage140TriggerRef Auto Const mandatory
ObjectReference Property COM_SMQ01_Stage170TriggerRef Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard Auto Const mandatory
Scene Property COM_SarahMorgan_System_RomanceScene Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahMemorialTriggerRef Auto Const mandatory
ObjectReference Property COM_SMQ01_RomanceTriggerRef Auto Const mandatory
Quest Property LC125 Auto Const
ObjectReference Property COM_SQ01CrashSite02Marker Auto Const mandatory
ObjectReference Property COM_SMSQ01_PlanetStartMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_FirstCrashsiteMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_SecondCrashsiteMarker Auto Const mandatory
ObjectReference Property COM_SMSQ01_SonaCampMarker Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene Auto Const mandatory
Scene Property COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival Auto Const mandatory
ObjectReference Property COM_SMSQ01_GravesMarker Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahSceneMarker Auto Const mandatory
GlobalVariable Property COM_SQ01_SarahSceneReady Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaStayed Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaLeft Auto Const mandatory
ObjectReference Property Lodge_RoomMarker_SarahMorgan Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const mandatory
Outfit Property Outfit_SMQ01_Sona_Clean Auto Const mandatory
Outfit Property Outfit_SMQ01_Sona_Dirty Auto Const mandatory
wwiseevent Property OBJ_Powercell_Power_Up_WEF Auto Const mandatory
Quest Property LC070 Auto Const
ActorValue Property COM_Quest_SarahMorgan_Q01_Complete_AV Auto Const mandatory
GlobalVariable Property COM_SMQ01_GenetagsCollected Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property CF04CrashSiteTriggerRef Auto Const mandatory
Faction Property ConstellationFaction Auto Const mandatory
Scene Property COM_SMQ01_Stage200_SarahDecided Auto Const mandatory
ObjectReference Property COM_SMQ01_OverlookFastMarker Auto Const mandatory
Scene Property COM_SMQ01_Stage200_SarahOverlookStartScene Auto Const mandatory
Scene Property COM_SMQ01_Stage232_ApproachMemorialScene Auto Const mandatory
ObjectReference Property COM_SMQ01_PlayerFastMemorial Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahFastMemorial Auto Const mandatory
ObjectReference Property UC_NA_MemorialBot_Ref Auto Const mandatory
ReferenceAlias Property Alias_Genetag01 Auto Const mandatory
ReferenceAlias Property Alias_Genetag02 Auto Const mandatory
ReferenceAlias Property Alias_Genetag03 Auto Const mandatory
ReferenceAlias Property Alias_Genetag04 Auto Const mandatory
ReferenceAlias Property Alias_Genetag05 Auto Const mandatory
ReferenceAlias Property Alias_Genetag06 Auto Const mandatory
ReferenceAlias Property Alias_Genetag07 Auto Const mandatory
ReferenceAlias Property Alias_Genetag08 Auto Const mandatory
ReferenceAlias Property Alias_Genetag09 Auto Const mandatory
ReferenceAlias Property Alias_Genetag10 Auto Const mandatory
conditionform Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const mandatory
conditionform Property MQ102_SarahLockedInCND Auto Const mandatory
ObjectReference Property COM_SMQ01FirstMMRef Auto Const mandatory
ObjectReference Property COM_SQ01_RailMarker Auto Const mandatory
Activator Property COM_PQ_TxtReplace_QuestName_Sarah Auto Const mandatory
GlobalVariable Property COM_SMQ01_WaitToggle Auto Const mandatory
ObjectReference Property COM_SMQ01_SarahWarpMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:10
  Alias_Sarah.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  Self.SetStage(10) ; #DEBUG_LINE_NO:16
  Self.SetStage(20) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:28
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
  Self.SetStage(10) ; #DEBUG_LINE_NO:34
  Self.SetStage(20) ; #DEBUG_LINE_NO:35
  Self.SetStage(23) ; #DEBUG_LINE_NO:36
  Self.SetStage(25) ; #DEBUG_LINE_NO:37
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:38
  Self.SetStage(30) ; #DEBUG_LINE_NO:39
  Self.SetStage(40) ; #DEBUG_LINE_NO:40
  Self.SetStage(50) ; #DEBUG_LINE_NO:41
  Utility.wait(1.0) ; #DEBUG_LINE_NO:42
  Game.GetPlayer().MoveTo(COM_SMSQ01_PlanetStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0002_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:54
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
  Self.SetStage(10) ; #DEBUG_LINE_NO:60
  Self.SetStage(20) ; #DEBUG_LINE_NO:61
  Self.SetStage(23) ; #DEBUG_LINE_NO:62
  Self.SetStage(25) ; #DEBUG_LINE_NO:63
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:64
  Self.SetStage(30) ; #DEBUG_LINE_NO:65
  Self.SetStage(40) ; #DEBUG_LINE_NO:66
  Self.SetStage(50) ; #DEBUG_LINE_NO:67
  Self.SetStage(60) ; #DEBUG_LINE_NO:68
  Utility.wait(1.0) ; #DEBUG_LINE_NO:69
  Game.GetPlayer().MoveTo(COM_SMSQ01_FirstCrashsiteMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0003_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:81
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
  Self.SetStage(10) ; #DEBUG_LINE_NO:87
  Self.SetStage(20) ; #DEBUG_LINE_NO:88
  Self.SetStage(23) ; #DEBUG_LINE_NO:89
  Self.SetStage(25) ; #DEBUG_LINE_NO:90
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:91
  Self.SetStage(30) ; #DEBUG_LINE_NO:92
  Self.SetStage(40) ; #DEBUG_LINE_NO:93
  Self.SetStage(50) ; #DEBUG_LINE_NO:94
  Self.SetStage(60) ; #DEBUG_LINE_NO:95
  Self.SetStage(70) ; #DEBUG_LINE_NO:96
  Self.SetStage(80) ; #DEBUG_LINE_NO:97
  Self.SetStage(90) ; #DEBUG_LINE_NO:98
  Self.SetStage(100) ; #DEBUG_LINE_NO:99
  Self.SetStage(110) ; #DEBUG_LINE_NO:100
  Self.SetStage(120) ; #DEBUG_LINE_NO:101
  Utility.wait(1.0) ; #DEBUG_LINE_NO:102
  Game.GetPlayer().MoveTo(COM_SMSQ01_SecondCrashsiteMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0004_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:114
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:117
  Self.SetStage(10) ; #DEBUG_LINE_NO:120
  Self.SetStage(20) ; #DEBUG_LINE_NO:121
  Self.SetStage(23) ; #DEBUG_LINE_NO:122
  Self.SetStage(25) ; #DEBUG_LINE_NO:123
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:124
  Self.SetStage(30) ; #DEBUG_LINE_NO:125
  Self.SetStage(40) ; #DEBUG_LINE_NO:126
  Self.SetStage(50) ; #DEBUG_LINE_NO:127
  Self.SetStage(60) ; #DEBUG_LINE_NO:128
  Self.SetStage(70) ; #DEBUG_LINE_NO:129
  Self.SetStage(80) ; #DEBUG_LINE_NO:130
  Self.SetStage(90) ; #DEBUG_LINE_NO:131
  Self.SetStage(100) ; #DEBUG_LINE_NO:132
  Self.SetStage(110) ; #DEBUG_LINE_NO:133
  Self.SetStage(120) ; #DEBUG_LINE_NO:134
  Self.SetStage(130) ; #DEBUG_LINE_NO:135
  Self.SetStage(140) ; #DEBUG_LINE_NO:136
  Self.SetStage(150) ; #DEBUG_LINE_NO:137
  Self.SetStage(160) ; #DEBUG_LINE_NO:138
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop() ; #DEBUG_LINE_NO:139
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop() ; #DEBUG_LINE_NO:140
  Utility.wait(1.0) ; #DEBUG_LINE_NO:141
  Game.GetPlayer().MoveTo(COM_SMSQ01_GravesMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:142
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:143
  Alias_Sarah.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0005_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:155
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:158
  Self.SetStage(10) ; #DEBUG_LINE_NO:161
  Self.SetStage(20) ; #DEBUG_LINE_NO:162
  Self.SetStage(23) ; #DEBUG_LINE_NO:163
  Self.SetStage(25) ; #DEBUG_LINE_NO:164
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:165
  Self.SetStage(30) ; #DEBUG_LINE_NO:166
  Self.SetStage(40) ; #DEBUG_LINE_NO:167
  Self.SetStage(50) ; #DEBUG_LINE_NO:168
  Self.SetStage(60) ; #DEBUG_LINE_NO:169
  Self.SetStage(70) ; #DEBUG_LINE_NO:170
  Self.SetStage(80) ; #DEBUG_LINE_NO:171
  Self.SetStage(90) ; #DEBUG_LINE_NO:172
  Self.SetStage(100) ; #DEBUG_LINE_NO:173
  Self.SetStage(110) ; #DEBUG_LINE_NO:174
  Self.SetStage(120) ; #DEBUG_LINE_NO:175
  Self.SetStage(130) ; #DEBUG_LINE_NO:176
  Self.SetStage(140) ; #DEBUG_LINE_NO:177
  Self.SetStage(150) ; #DEBUG_LINE_NO:178
  Self.SetStage(160) ; #DEBUG_LINE_NO:179
  Self.SetStage(170) ; #DEBUG_LINE_NO:180
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop() ; #DEBUG_LINE_NO:181
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop() ; #DEBUG_LINE_NO:182
  Utility.wait(1.0) ; #DEBUG_LINE_NO:183
  Game.GetPlayer().MoveTo(COM_SMSQ01_SonaCampMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:184
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:185
  Alias_Sarah.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:195
  Alias_AdmiralLogan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:196
  Self.SetStage(20) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0007_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:208
  Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:211
  Self.SetStage(10) ; #DEBUG_LINE_NO:214
  Self.SetStage(20) ; #DEBUG_LINE_NO:215
  Self.SetStage(23) ; #DEBUG_LINE_NO:216
  Self.SetStage(25) ; #DEBUG_LINE_NO:217
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:218
  Self.SetStage(30) ; #DEBUG_LINE_NO:219
  Self.SetStage(40) ; #DEBUG_LINE_NO:220
  Self.SetStage(50) ; #DEBUG_LINE_NO:221
  Self.SetStage(60) ; #DEBUG_LINE_NO:222
  Self.SetStage(70) ; #DEBUG_LINE_NO:223
  Self.SetStage(80) ; #DEBUG_LINE_NO:224
  Self.SetStage(90) ; #DEBUG_LINE_NO:225
  Self.SetStage(100) ; #DEBUG_LINE_NO:226
  Self.SetStage(110) ; #DEBUG_LINE_NO:227
  Self.SetStage(120) ; #DEBUG_LINE_NO:228
  Self.SetStage(130) ; #DEBUG_LINE_NO:229
  Self.SetStage(140) ; #DEBUG_LINE_NO:230
  Self.SetStage(150) ; #DEBUG_LINE_NO:231
  Self.SetStage(160) ; #DEBUG_LINE_NO:232
  Self.SetStage(170) ; #DEBUG_LINE_NO:233
  Self.SetStage(178) ; #DEBUG_LINE_NO:234
  Self.SetStage(180) ; #DEBUG_LINE_NO:235
  Self.SetStage(185) ; #DEBUG_LINE_NO:236
  Self.SetStage(195) ; #DEBUG_LINE_NO:237
  Self.SetStage(198) ; #DEBUG_LINE_NO:238
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop() ; #DEBUG_LINE_NO:239
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop() ; #DEBUG_LINE_NO:240
  Utility.wait(1.0) ; #DEBUG_LINE_NO:241
  Game.GetPlayer().MoveTo(COM_SMQ01_OverlookFastMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:242
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_OverlookFastMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0008_Item_00()
  SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:254
  Self.SetStage(10) ; #DEBUG_LINE_NO:257
  Self.SetStage(20) ; #DEBUG_LINE_NO:258
  Self.SetStage(23) ; #DEBUG_LINE_NO:259
  Self.SetStage(25) ; #DEBUG_LINE_NO:260
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop() ; #DEBUG_LINE_NO:261
  Self.SetStage(30) ; #DEBUG_LINE_NO:262
  Self.SetStage(40) ; #DEBUG_LINE_NO:263
  Self.SetStage(50) ; #DEBUG_LINE_NO:264
  Self.SetStage(60) ; #DEBUG_LINE_NO:265
  Self.SetStage(70) ; #DEBUG_LINE_NO:266
  Self.SetStage(80) ; #DEBUG_LINE_NO:267
  Self.SetStage(90) ; #DEBUG_LINE_NO:268
  Self.SetStage(100) ; #DEBUG_LINE_NO:269
  Self.SetStage(110) ; #DEBUG_LINE_NO:270
  Self.SetStage(120) ; #DEBUG_LINE_NO:271
  Self.SetStage(130) ; #DEBUG_LINE_NO:272
  Self.SetStage(140) ; #DEBUG_LINE_NO:273
  Self.SetStage(150) ; #DEBUG_LINE_NO:274
  Self.SetStage(160) ; #DEBUG_LINE_NO:275
  Self.SetStage(170) ; #DEBUG_LINE_NO:276
  Self.SetStage(178) ; #DEBUG_LINE_NO:277
  Self.SetStage(180) ; #DEBUG_LINE_NO:278
  Self.SetStage(185) ; #DEBUG_LINE_NO:279
  Self.SetStage(195) ; #DEBUG_LINE_NO:280
  Self.SetStage(198) ; #DEBUG_LINE_NO:281
  Self.SetStage(205) ; #DEBUG_LINE_NO:282
  Self.SetStage(210) ; #DEBUG_LINE_NO:283
  Self.SetStage(220) ; #DEBUG_LINE_NO:284
  Self.SetStage(230) ; #DEBUG_LINE_NO:285
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop() ; #DEBUG_LINE_NO:286
  COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop() ; #DEBUG_LINE_NO:287
  Utility.wait(1.0) ; #DEBUG_LINE_NO:288
  Game.GetPlayer().MoveTo(COM_SMQ01_PlayerFastMemorial, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:289
  Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahFastMemorial, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_Companions.LockInCompanion(Alias_Sarah.GetActorReference() as companionactorscript, True, None, COM_PQ_TxtReplace_QuestName_Sarah) ; #DEBUG_LINE_NO:299
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:310
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:311
  COM_SQ01_LoganStartTriggerRef.Enable(False) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_0023_Item_00()
  If Alias_Sarah.GetRef().GetDistance(Game.GetPlayer() as ObjectReference) > 10.0 ; #DEBUG_LINE_NO:328
    Alias_Sarah.GetRef().MoveTo(COM_SMQ01_SarahWarpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:329
  EndIf ; #DEBUG_LINE_NO:
  COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Start() ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:340
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:341
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:344
  Alias_Sarah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:346
  COM_SMQ01FirstMMRef.Enable(False) ; #DEBUG_LINE_NO:349
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:357
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:366
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:367
  COM_SMQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:370
  SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef()) ; #DEBUG_LINE_NO:371
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:379
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:380
  CF04CrashSiteTriggerRef.Disable(False) ; #DEBUG_LINE_NO:383
  Utility.wait(2.0) ; #DEBUG_LINE_NO:384
  CF04CrashSiteTriggerRef.Enable(False) ; #DEBUG_LINE_NO:385
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:393
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:394
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:402
  If Self.GetStageDone(85) == False ; #DEBUG_LINE_NO:404
    Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:405
  ElseIf Self.GetStageDone(85) == True ; #DEBUG_LINE_NO:406
    Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:407
  EndIf ; #DEBUG_LINE_NO:
  COM_SMQ01_WaitToggle.SetValue(0.0) ; #DEBUG_LINE_NO:411
EndFunction

Function Fragment_Stage_0090_Item_00()
  If Self.IsObjectiveDisplayed(80) == True ; #DEBUG_LINE_NO:419
    Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:420
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:422
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:430
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:431
  LC070.SetStage(20) ; #DEBUG_LINE_NO:432
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:434
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:435
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(80) == True ; #DEBUG_LINE_NO:438
    Self.SetObjectiveDisplayed(80, False, False) ; #DEBUG_LINE_NO:439
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:448
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:449
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:457
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:458
  COM_SQ01CrashSite02Marker.Enable(False) ; #DEBUG_LINE_NO:460
EndFunction

Function Fragment_Stage_0130_Item_00()
  COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival.Start() ; #DEBUG_LINE_NO:469
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:477
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:478
  COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Start() ; #DEBUG_LINE_NO:481
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True) ; #DEBUG_LINE_NO:484
  Alias_Sarah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:485
EndFunction

Function Fragment_Stage_0145_Item_00()
  COM_SMQ01_Stage140TriggerRef.Disable(False) ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:504
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:505
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:513
  Self.UpdateCurrentInstanceGlobal(COM_SMQ01_GenetagsCollected) ; #DEBUG_LINE_NO:514
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:515
  (Alias_Player as com_smq01_aliasscript).SpawnBossOrEnd() ; #DEBUG_LINE_NO:518
EndFunction

Function Fragment_Stage_0165_Item_00()
  LC125.SetStage(10) ; #DEBUG_LINE_NO:526
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:534
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:535
  COM_SMQ01_Stage170TriggerRef.Enable(False) ; #DEBUG_LINE_NO:538
EndFunction

Function Fragment_Stage_0175_Item_00()
  COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard.Start() ; #DEBUG_LINE_NO:547
EndFunction

Function Fragment_Stage_0178_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:555
  Self.SetObjectiveDisplayed(175, True, False) ; #DEBUG_LINE_NO:556
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(175, True) ; #DEBUG_LINE_NO:564
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:565
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:566
EndFunction

Function Fragment_Stage_0185_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:574
  Self.SetObjectiveDisplayed(190, False, False) ; #DEBUG_LINE_NO:575
  COM_SQ01_SonaStayed.SetValue(1.0) ; #DEBUG_LINE_NO:576
  Self.SetStage(195) ; #DEBUG_LINE_NO:577
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:585
  Self.SetObjectiveDisplayed(180, False, False) ; #DEBUG_LINE_NO:586
  COM_SQ01_SonaLeft.SetValue(1.0) ; #DEBUG_LINE_NO:587
  Self.SetStage(195) ; #DEBUG_LINE_NO:588
EndFunction

Function Fragment_Stage_0195_Item_00()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:596
  Self.SetObjectiveDisplayed(195, True, False) ; #DEBUG_LINE_NO:597
EndFunction

Function Fragment_Stage_0195_Item_01()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:605
  Self.SetObjectiveDisplayed(195, True, False) ; #DEBUG_LINE_NO:606
EndFunction

Function Fragment_Stage_0198_Item_00()
  Self.SetObjectiveCompleted(195, True) ; #DEBUG_LINE_NO:614
  Self.SetObjectiveDisplayed(198, True, False) ; #DEBUG_LINE_NO:615
  Alias_Sona.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:618
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:621
  LC125.SetStage(40) ; #DEBUG_LINE_NO:624
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:632
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:633
  Self.SetObjectiveCompleted(198, True) ; #DEBUG_LINE_NO:636
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True) ; #DEBUG_LINE_NO:639
  Alias_Sarah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:640
  COM_SMQ01_Stage200_SarahOverlookStartScene.Start() ; #DEBUG_LINE_NO:642
  If COM_SQ01_SonaLeft.GetValue() == 1.0 ; #DEBUG_LINE_NO:645
    kmyQuest.AddPassenger(Alias_Sona) ; #DEBUG_LINE_NO:647
    Alias_Sona.GetActorRef().AddToFaction(ConstellationFaction) ; #DEBUG_LINE_NO:648
    Alias_Sona.GetActorRef().SetFactionRank(ConstellationFaction, 0) ; #DEBUG_LINE_NO:649
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:658
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:666
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:667
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:670
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:678
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:679
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Genetag01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:688
  Game.GetPlayer().RemoveItem(Alias_Genetag02.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:689
  Game.GetPlayer().RemoveItem(Alias_Genetag03.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:690
  Game.GetPlayer().RemoveItem(Alias_Genetag04.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:691
  Game.GetPlayer().RemoveItem(Alias_Genetag05.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:692
  Game.GetPlayer().RemoveItem(Alias_Genetag06.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:693
  Game.GetPlayer().RemoveItem(Alias_Genetag07.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:694
  Game.GetPlayer().RemoveItem(Alias_Genetag08.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:695
  Game.GetPlayer().RemoveItem(Alias_Genetag09.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:696
  Game.GetPlayer().RemoveItem(Alias_Genetag10.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:697
EndFunction

Function Fragment_Stage_0226_Item_00()
  If COM_SQ01_SonaLeft.GetValue() == 1.0 ; #DEBUG_LINE_NO:705
    Alias_Sona.GetActorRef().MoveTo(Lodge_RoomMarker_SarahMorgan, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:706
    Alias_Sona.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:707
    Alias_Sona.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:708
    Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:709
    Self.SetObjectiveDisplayed(226, True, False) ; #DEBUG_LINE_NO:710
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.IsObjectiveDisplayed(220) == True ; #DEBUG_LINE_NO:719
    Self.SetObjectiveCompleted(220, True) ; #DEBUG_LINE_NO:720
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(226) == True ; #DEBUG_LINE_NO:722
    Self.SetObjectiveCompleted(226, True) ; #DEBUG_LINE_NO:723
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:725
  COM_SMQ01_SarahMemorialTriggerRef.Enable(False) ; #DEBUG_LINE_NO:728
  COM_Quest_SarahMorgan_Q01_Post.SetStage(10) ; #DEBUG_LINE_NO:731
  Alias_Sona.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:732
  UC_NA_MemorialBot_Ref.Disable(False) ; #DEBUG_LINE_NO:735
  COM_SQ01_RailMarker.Disable(False) ; #DEBUG_LINE_NO:738
EndFunction

Function Fragment_Stage_0232_Item_00()
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True) ; #DEBUG_LINE_NO:747
  Alias_Sarah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:748
  COM_SMQ01_Stage232_ApproachMemorialScene.Start() ; #DEBUG_LINE_NO:750
EndFunction

Function Fragment_Stage_0235_Item_00()
  Self.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:758
  Self.SetObjectiveDisplayed(235, True, False) ; #DEBUG_LINE_NO:759
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(235, True) ; #DEBUG_LINE_NO:767
  Self.SetObjectiveDisplayed(240, True, False) ; #DEBUG_LINE_NO:768
  COM_SMQ01_RomanceTriggerRef.Enable(False) ; #DEBUG_LINE_NO:771
  SQ_Followers.SetRoleActive(Alias_Sarah.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:774
  SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef()) ; #DEBUG_LINE_NO:775
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(240, True) ; #DEBUG_LINE_NO:783
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:784
  SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference(), True, False, True) ; #DEBUG_LINE_NO:787
  Alias_Sarah.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:788
  COM_SarahMorgan_System_RomanceScene.Start() ; #DEBUG_LINE_NO:791
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:799
  Actor SarahMorganREF = Alias_Sarah.GetActorReference() ; #DEBUG_LINE_NO:800
  If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF as ObjectReference, None) ; #DEBUG_LINE_NO:804
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    SQ_Companions.LockInCompanion(SarahMorganREF as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:807
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1.0) ; #DEBUG_LINE_NO:811
  (Alias_Sarah.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest() ; #DEBUG_LINE_NO:814
  UC_NA_MemorialBot_Ref.Enable(False) ; #DEBUG_LINE_NO:817
  COM_SQ01_RailMarker.Enable(False) ; #DEBUG_LINE_NO:820
  Self.Stop() ; #DEBUG_LINE_NO:822
EndFunction

Function Fragment_Stage_1000_Item_01()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:830
  Actor SarahMorganREF = Alias_Sarah.GetActorReference() ; #DEBUG_LINE_NO:831
  If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF as ObjectReference, None) ; #DEBUG_LINE_NO:835
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    SQ_Companions.LockInCompanion(SarahMorganREF as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:838
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1.0) ; #DEBUG_LINE_NO:842
  (Alias_Sarah.GetActorReference() as companionactorscript).COM_CompanionQuest.FinishedPersonalQuest() ; #DEBUG_LINE_NO:845
  UC_NA_MemorialBot_Ref.Enable(False) ; #DEBUG_LINE_NO:848
  COM_SQ01_RailMarker.Enable(False) ; #DEBUG_LINE_NO:851
  Self.Stop() ; #DEBUG_LINE_NO:853
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:861
  Self.Stop() ; #DEBUG_LINE_NO:862
EndFunction
