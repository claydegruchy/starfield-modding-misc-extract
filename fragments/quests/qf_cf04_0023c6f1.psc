ScriptName Fragments:Quests:QF_CF04_0023C6F1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property CF04_LoveLetter_Slate01Ref Auto Const mandatory
ObjectReference Property CF04_GalbankRecording_Slate01Ref Auto Const mandatory
ReferenceAlias Property Alias_CF04_Dumbrosky Auto Const mandatory
ReferenceAlias Property Alias_CF04_Vera Auto Const mandatory
ReferenceAlias Property Alias_CF04_Swist Auto Const mandatory
ObjectReference Property CF04_DumbroskyLockdownMarker Auto Const mandatory
ObjectReference Property CF04_SwistLockdownMarker Auto Const mandatory
ObjectReference Property CF04_VeraLockdownMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_Rokov Auto Const mandatory
ReferenceAlias Property Alias_CF04_LoveNote Auto Const mandatory
ReferenceAlias Property Alias_CF04_BankData Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankCredentials Auto Const mandatory
ObjectReference Property CF04_SheilaDoorRef Auto Const mandatory
ReferenceAlias Property Alias_CF04_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF04_Toft Auto Const mandatory
ObjectReference Property CF03KibweWrapUpMarker Auto Const mandatory
ObjectReference Property CF03ToftWrapUpMarker Auto Const mandatory
ObjectReference Property CF03DelgadoWrapUpMarker Auto Const mandatory
ObjectReference Property CF03NaevaWrapUpMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF04_Naeva Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
LeveledItem Property LL_Credits_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_CF04_StarviewPass Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankGuard Auto Const mandatory
GlobalVariable Property CF04_VeraBribe Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBribe Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBribeDone Auto Const mandatory
GlobalVariable Property CF04_VeraBribeDone Auto Const mandatory
GlobalVariable Property CF04_SwistBribe Auto Const mandatory
GlobalVariable Property CF04_SwistBribeDone Auto Const mandatory
GlobalVariable Property CF04_GuardBribeDone Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ActorBase Property CF_LarryDumbrosky Auto Const mandatory
ActorBase Property CF_GabrielVera Auto Const mandatory
ActorBase Property CF_GalbankGuard Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
ObjectReference Property CF04_StartMarker Auto Const mandatory
ObjectReference Property CF04_BallroomMarker Auto Const mandatory
ObjectReference Property CF04_FastNilesMarker Auto Const mandatory
ObjectReference Property CF04_FastDumbroskyCabinMarker Auto Const mandatory
ObjectReference Property CF04_FastSabotageMarker Auto Const mandatory
ObjectReference Property CF04_FastGalbankMarker Auto Const mandatory
ObjectReference Property CF04_PlayerReturnsMarker Auto Const mandatory
ObjectReference Property CF01PlayerOpsMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_GalbankAccessCardAlias Auto Const mandatory
ObjectReference Property CF_ArchivesDoorInterior Auto Const mandatory
Quest Property CF03 Auto Const mandatory
ReferenceAlias Property Alias_CF04_Mathis Auto Const mandatory
ObjectReference Property CF04_AccessDoor01Ref Auto Const mandatory
ObjectReference Property CF04_AccessDoor02Ref Auto Const mandatory
ReferenceAlias Property Alias_CF04_Evidence_GalbankScheme Auto Const mandatory
ReferenceAlias Property Alias_CF04_SandinPass Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
ReferenceAlias Property Alias_CF04_ClaimID Auto Const mandatory
ReferenceAlias Property Alias_CF04_Sheila Auto Const mandatory
ReferenceAlias Property Alias_CF_ESAward Auto Const mandatory
GlobalVariable Property CF04_ESAwardNoRokov Auto Const mandatory
GlobalVariable Property CF04_ESAwardWithRokov Auto Const mandatory
ReferenceAlias Property Alias_CF04_Sandin Auto Const mandatory
ObjectReference Property CF04_RokovInitMarker Auto Const mandatory
ReferenceAlias Property Alias_CF04_SheilaEvidence Auto Const mandatory
ObjectReference Property CF04_SheilaLockdownMarker Auto Const mandatory
ObjectReference Property CF04_VeraDoorRef Auto Const mandatory
ObjectReference Property CF04_SwistDoorRef Auto Const mandatory
ObjectReference Property CF04_DumbroskyDoorRef Auto Const mandatory
Quest Property LC102LifeSupportSequence Auto Const mandatory
GlobalVariable Property CF04_SandinBribe Auto Const mandatory
ReferenceAlias Property Alias_CF04_Murata Auto Const mandatory
ObjectReference Property CF04_PurserSafeCombatRef Auto Const mandatory
ObjectReference Property CF04_PurserSafeRef Auto Const mandatory
ObjectReference Property CF04_FastSwistPreMarker Auto Const mandatory
ObjectReference Property CF04_FastVeraMarker Auto Const mandatory
ObjectReference Property CF04_DumbroskyCabinMarker Auto Const mandatory
ObjectReference Property CF04_PlayerExitingMarker Auto Const mandatory
ObjectReference Property CF05_Start100MarkerRef Auto Const mandatory
Quest Property CF04GalbankArchivesAmbush Auto Const mandatory
ReferenceAlias Property Alias_CF04_EclipticBoss Auto Const mandatory
Scene Property CF04_StageXXX_SirenEmergencyScene_Interior Auto Const mandatory
Scene Property CF04_StageXXX_SirenEmergencyScene_Exterior Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
ObjectReference Property CF04_SandboxAfterTalkRef Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
ObjectReference Property CF04_scLc102MarkerRef Auto Const mandatory
ObjectReference Property CF04StartCrew01Ref Auto Const mandatory
ObjectReference Property VigilancePlayerOpsMarker Auto Const mandatory
GlobalVariable Property CF04_DumbroskyBlock Auto Const mandatory
ObjectReference Property CF04_CombatEnablerRef Auto Const mandatory
ReferenceAlias Property Alias_CF04_Jazz Auto Const mandatory
Quest Property LC102Combat Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
Faction Property LC102_SecurityFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ObjectReference Property CF04_LifeSupportAccessComputerRef Auto Const mandatory
ObjectReference Property CF_Key_RokovMarker Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
ObjectReference Property CF04BallroomDoorRef02 Auto Const mandatory
ObjectReference Property CF04_RokovCombatExitMarker Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB21_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:7
  Self.SetStage(20) ; #DEBUG_LINE_NO:8
  Self.SetStage(30) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:11
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:14
  Game.GetPlayer().MoveTo(CF04_StartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:25
  Self.SetStage(20) ; #DEBUG_LINE_NO:26
  Self.SetStage(30) ; #DEBUG_LINE_NO:27
  Self.SetStage(40) ; #DEBUG_LINE_NO:28
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:30
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:43
  Self.SetStage(20) ; #DEBUG_LINE_NO:44
  Self.SetStage(30) ; #DEBUG_LINE_NO:45
  Self.SetStage(40) ; #DEBUG_LINE_NO:46
  Self.SetStage(50) ; #DEBUG_LINE_NO:47
  Self.SetStage(60) ; #DEBUG_LINE_NO:48
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:50
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:53
  Game.GetPlayer().MoveTo(CF04_FastSwistPreMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:63
  Self.SetStage(20) ; #DEBUG_LINE_NO:64
  Self.SetStage(30) ; #DEBUG_LINE_NO:65
  Self.SetStage(40) ; #DEBUG_LINE_NO:66
  Self.SetStage(50) ; #DEBUG_LINE_NO:67
  Self.SetStage(60) ; #DEBUG_LINE_NO:68
  Self.SetStage(70) ; #DEBUG_LINE_NO:69
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:71
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:74
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:84
  Self.SetStage(20) ; #DEBUG_LINE_NO:85
  Self.SetStage(30) ; #DEBUG_LINE_NO:86
  Self.SetStage(40) ; #DEBUG_LINE_NO:87
  Self.SetStage(50) ; #DEBUG_LINE_NO:88
  Self.SetStage(60) ; #DEBUG_LINE_NO:89
  Self.SetStage(70) ; #DEBUG_LINE_NO:90
  Self.SetStage(90) ; #DEBUG_LINE_NO:91
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:93
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:96
  Game.GetPlayer().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:106
  Self.SetStage(20) ; #DEBUG_LINE_NO:107
  Self.SetStage(30) ; #DEBUG_LINE_NO:108
  Self.SetStage(40) ; #DEBUG_LINE_NO:109
  Self.SetStage(50) ; #DEBUG_LINE_NO:110
  Self.SetStage(60) ; #DEBUG_LINE_NO:111
  Self.SetStage(70) ; #DEBUG_LINE_NO:112
  Self.SetStage(90) ; #DEBUG_LINE_NO:113
  Self.SetStage(100) ; #DEBUG_LINE_NO:114
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:116
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:119
  Game.GetPlayer().MoveTo(CF04_FastSabotageMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:129
  Self.SetStage(20) ; #DEBUG_LINE_NO:130
  Self.SetStage(30) ; #DEBUG_LINE_NO:131
  Self.SetStage(40) ; #DEBUG_LINE_NO:132
  Self.SetStage(50) ; #DEBUG_LINE_NO:133
  Self.SetStage(60) ; #DEBUG_LINE_NO:134
  Self.SetStage(70) ; #DEBUG_LINE_NO:135
  Self.SetStage(90) ; #DEBUG_LINE_NO:136
  Self.SetStage(100) ; #DEBUG_LINE_NO:137
  Self.SetStage(110) ; #DEBUG_LINE_NO:138
  Self.SetStage(120) ; #DEBUG_LINE_NO:139
  Self.SetStage(130) ; #DEBUG_LINE_NO:140
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:142
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:145
  Game.GetPlayer().MoveTo(CF04_FastVeraMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:155
  Self.SetStage(20) ; #DEBUG_LINE_NO:156
  Self.SetStage(30) ; #DEBUG_LINE_NO:157
  Self.SetStage(40) ; #DEBUG_LINE_NO:158
  Self.SetStage(50) ; #DEBUG_LINE_NO:159
  Self.SetStage(60) ; #DEBUG_LINE_NO:160
  Self.SetStage(70) ; #DEBUG_LINE_NO:161
  Self.SetStage(90) ; #DEBUG_LINE_NO:162
  Self.SetStage(100) ; #DEBUG_LINE_NO:163
  Self.SetStage(110) ; #DEBUG_LINE_NO:164
  Self.SetStage(120) ; #DEBUG_LINE_NO:165
  Self.SetStage(130) ; #DEBUG_LINE_NO:166
  Self.SetStage(150) ; #DEBUG_LINE_NO:167
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:169
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:172
  Game.GetPlayer().MoveTo(CF04_DumbroskyCabinMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:182
  Self.SetStage(20) ; #DEBUG_LINE_NO:183
  Self.SetStage(30) ; #DEBUG_LINE_NO:184
  Self.SetStage(40) ; #DEBUG_LINE_NO:185
  Self.SetStage(50) ; #DEBUG_LINE_NO:186
  Self.SetStage(60) ; #DEBUG_LINE_NO:187
  Self.SetStage(70) ; #DEBUG_LINE_NO:188
  Self.SetStage(90) ; #DEBUG_LINE_NO:189
  Self.SetStage(100) ; #DEBUG_LINE_NO:190
  Self.SetStage(110) ; #DEBUG_LINE_NO:191
  Self.SetStage(120) ; #DEBUG_LINE_NO:192
  Self.SetStage(130) ; #DEBUG_LINE_NO:193
  Self.SetStage(150) ; #DEBUG_LINE_NO:194
  Self.SetStage(160) ; #DEBUG_LINE_NO:195
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:197
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:200
  Game.GetPlayer().MoveTo(CF04_PlayerExitingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:210
  Self.SetStage(20) ; #DEBUG_LINE_NO:211
  Self.SetStage(30) ; #DEBUG_LINE_NO:212
  Self.SetStage(40) ; #DEBUG_LINE_NO:213
  Self.SetStage(50) ; #DEBUG_LINE_NO:214
  Self.SetStage(60) ; #DEBUG_LINE_NO:215
  Self.SetStage(70) ; #DEBUG_LINE_NO:216
  Self.SetStage(90) ; #DEBUG_LINE_NO:217
  Self.SetStage(100) ; #DEBUG_LINE_NO:218
  Self.SetStage(110) ; #DEBUG_LINE_NO:219
  Self.SetStage(120) ; #DEBUG_LINE_NO:220
  Self.SetStage(130) ; #DEBUG_LINE_NO:221
  Self.SetStage(150) ; #DEBUG_LINE_NO:222
  Self.SetStage(160) ; #DEBUG_LINE_NO:223
  Self.SetStage(310) ; #DEBUG_LINE_NO:224
  Self.SetStage(330) ; #DEBUG_LINE_NO:225
  Self.SetStage(340) ; #DEBUG_LINE_NO:226
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:228
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:231
  Game.GetPlayer().MoveTo(CF04_FastGalbankMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:241
  Self.SetStage(20) ; #DEBUG_LINE_NO:242
  Self.SetStage(30) ; #DEBUG_LINE_NO:243
  Self.SetStage(40) ; #DEBUG_LINE_NO:244
  Self.SetStage(50) ; #DEBUG_LINE_NO:245
  Self.SetStage(60) ; #DEBUG_LINE_NO:246
  Self.SetStage(70) ; #DEBUG_LINE_NO:247
  Self.SetStage(90) ; #DEBUG_LINE_NO:248
  Self.SetStage(100) ; #DEBUG_LINE_NO:249
  Self.SetStage(110) ; #DEBUG_LINE_NO:250
  Self.SetStage(120) ; #DEBUG_LINE_NO:251
  Self.SetStage(130) ; #DEBUG_LINE_NO:252
  Self.SetStage(150) ; #DEBUG_LINE_NO:253
  Self.SetStage(160) ; #DEBUG_LINE_NO:254
  Self.SetStage(310) ; #DEBUG_LINE_NO:255
  Self.SetStage(330) ; #DEBUG_LINE_NO:256
  Self.SetStage(340) ; #DEBUG_LINE_NO:257
  Self.SetStage(343) ; #DEBUG_LINE_NO:258
  Self.SetStage(346) ; #DEBUG_LINE_NO:259
  Self.SetStage(350) ; #DEBUG_LINE_NO:260
  Self.SetStage(360) ; #DEBUG_LINE_NO:261
  Self.SetStage(370) ; #DEBUG_LINE_NO:262
  Self.SetStage(410) ; #DEBUG_LINE_NO:263
  Self.SetStage(420) ; #DEBUG_LINE_NO:264
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:266
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:269
  Game.GetPlayer().MoveTo(CF04_PlayerReturnsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:279
  Self.SetStage(20) ; #DEBUG_LINE_NO:280
  Self.SetStage(30) ; #DEBUG_LINE_NO:281
  Self.SetStage(40) ; #DEBUG_LINE_NO:282
  Self.SetStage(50) ; #DEBUG_LINE_NO:283
  Self.SetStage(60) ; #DEBUG_LINE_NO:284
  Self.SetStage(70) ; #DEBUG_LINE_NO:285
  Self.SetStage(90) ; #DEBUG_LINE_NO:286
  Self.SetStage(100) ; #DEBUG_LINE_NO:287
  Self.SetStage(110) ; #DEBUG_LINE_NO:288
  Self.SetStage(120) ; #DEBUG_LINE_NO:289
  Self.SetStage(130) ; #DEBUG_LINE_NO:290
  Self.SetStage(150) ; #DEBUG_LINE_NO:291
  Self.SetStage(160) ; #DEBUG_LINE_NO:292
  Self.SetStage(310) ; #DEBUG_LINE_NO:293
  Self.SetStage(330) ; #DEBUG_LINE_NO:294
  Self.SetStage(340) ; #DEBUG_LINE_NO:295
  Self.SetStage(343) ; #DEBUG_LINE_NO:296
  Self.SetStage(346) ; #DEBUG_LINE_NO:297
  Self.SetStage(350) ; #DEBUG_LINE_NO:298
  Self.SetStage(360) ; #DEBUG_LINE_NO:299
  Self.SetStage(370) ; #DEBUG_LINE_NO:300
  Self.SetStage(410) ; #DEBUG_LINE_NO:301
  Self.SetStage(420) ; #DEBUG_LINE_NO:302
  Self.SetStage(430) ; #DEBUG_LINE_NO:303
  Self.SetStage(450) ; #DEBUG_LINE_NO:304
  Self.SetStage(460) ; #DEBUG_LINE_NO:305
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:307
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:310
  Game.GetPlayer().MoveTo(CF05_Start100MarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:312
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:320
  Self.SetStage(20) ; #DEBUG_LINE_NO:321
  Self.SetStage(30) ; #DEBUG_LINE_NO:322
  Self.SetStage(40) ; #DEBUG_LINE_NO:323
  Self.SetStage(50) ; #DEBUG_LINE_NO:324
  Self.SetStage(60) ; #DEBUG_LINE_NO:325
  Self.SetStage(70) ; #DEBUG_LINE_NO:326
  Self.SetStage(90) ; #DEBUG_LINE_NO:327
  Self.SetStage(100) ; #DEBUG_LINE_NO:328
  Self.SetStage(110) ; #DEBUG_LINE_NO:329
  Self.SetStage(120) ; #DEBUG_LINE_NO:330
  Self.SetStage(130) ; #DEBUG_LINE_NO:331
  Self.SetStage(150) ; #DEBUG_LINE_NO:332
  Self.SetStage(160) ; #DEBUG_LINE_NO:333
  Self.SetStage(310) ; #DEBUG_LINE_NO:334
  Self.SetStage(330) ; #DEBUG_LINE_NO:335
  Self.SetStage(340) ; #DEBUG_LINE_NO:336
  Self.SetStage(343) ; #DEBUG_LINE_NO:337
  Self.SetStage(346) ; #DEBUG_LINE_NO:338
  Self.SetStage(350) ; #DEBUG_LINE_NO:339
  Self.SetStage(360) ; #DEBUG_LINE_NO:340
  Self.SetStage(370) ; #DEBUG_LINE_NO:341
  Self.SetStage(410) ; #DEBUG_LINE_NO:342
  Self.SetStage(420) ; #DEBUG_LINE_NO:343
  Self.SetStage(430) ; #DEBUG_LINE_NO:344
  Self.SetStage(450) ; #DEBUG_LINE_NO:345
  Self.SetStage(460) ; #DEBUG_LINE_NO:346
  Self.SetStage(510) ; #DEBUG_LINE_NO:347
  Self.SetStage(520) ; #DEBUG_LINE_NO:348
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:350
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:353
  Game.GetPlayer().MoveTo(VigilancePlayerOpsMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:363
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:365
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:368
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:376
  CF04_scLc102MarkerRef.Enable(False) ; #DEBUG_LINE_NO:379
  If CF03.GetStageDone(360) == True ; #DEBUG_LINE_NO:382
    Alias_CF04_Mathis.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovInitMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:386
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:387
  Self.SetActive(True) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(510) == True ; #DEBUG_LINE_NO:400
    Self.SetObjectiveDisplayed(510, False, False) ; #DEBUG_LINE_NO:401
    Self.SetStage(1000) ; #DEBUG_LINE_NO:402
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(520) == True ; #DEBUG_LINE_NO:405
    Self.SetObjectiveDisplayed(520, False, False) ; #DEBUG_LINE_NO:406
    Self.SetStage(1000) ; #DEBUG_LINE_NO:407
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:416
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:417
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:425
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:426
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:428
  LC102Combat.SetStage(0) ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:437
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:445
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:446
  Self.SetStage(50) ; #DEBUG_LINE_NO:447
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:449
  Game.GetPlayer().AddItem(Alias_CF04_StarviewPass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:450
  CF04_SandboxAfterTalkRef.Enable(False) ; #DEBUG_LINE_NO:453
  Self.SetStage(600) ; #DEBUG_LINE_NO:456
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF_LarryDumbrosky.SetEssential(False) ; #DEBUG_LINE_NO:464
  CF_LarryDumbrosky.SetProtected(True) ; #DEBUG_LINE_NO:465
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:467
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:475
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:476
  CF04StartCrew01Ref.Enable(False) ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:487
EndFunction

Function Fragment_Stage_0066_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF04_LoveNote.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:495
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:503
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:504
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_BallroomMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:506
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:507
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:515
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:524
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:525
  LC102LifeSupportSequence.Start() ; #DEBUG_LINE_NO:528
EndFunction

Function Fragment_Stage_0106_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:536
EndFunction

Function Fragment_Stage_0107_Item_00()
  Self.SetStage(250) ; #DEBUG_LINE_NO:544
  Alias_CF04_Sandin.GetActorRef().AddItem(Alias_CF04_SandinPass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:546
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:554
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:555
  Alias_CF04_Sandin.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:558
  If Self.GetStageDone(107) == False ; #DEBUG_LINE_NO:560
    Game.GetPlayer().AddItem(Alias_CF04_SandinPass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:561
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:570
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:571
  CF04_AccessDoor01Ref.SetLockLevel(0) ; #DEBUG_LINE_NO:573
  CF04_AccessDoor01Ref.Unlock(False) ; #DEBUG_LINE_NO:574
  CF04_AccessDoor02Ref.SetLockLevel(0) ; #DEBUG_LINE_NO:575
  CF04_AccessDoor02Ref.Unlock(False) ; #DEBUG_LINE_NO:576
  CF04_AccessDoor01Ref.SetOpen(True) ; #DEBUG_LINE_NO:577
  CF04_AccessDoor02Ref.SetOpen(True) ; #DEBUG_LINE_NO:578
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:586
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:587
  Alias_CF04_Dumbrosky.GetActorRef().MoveTo(CF04_DumbroskyLockdownMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:590
  Alias_CF04_Dumbrosky.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:591
  Alias_CF04_Swist.GetActorRef().MoveTo(CF04_SwistLockdownMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:592
  Alias_CF04_Swist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:593
  Alias_CF04_Vera.GetActorRef().MoveTo(CF04_VeraLockdownMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:594
  Alias_CF04_Vera.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:595
  Alias_CF04_Sheila.GetActorRef().MoveTo(CF04_SheilaLockdownMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:596
  Alias_CF04_Sheila.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:597
  CF04_SheilaDoorRef.SetLockLevel(0) ; #DEBUG_LINE_NO:600
  CF04_SheilaDoorRef.Unlock(False) ; #DEBUG_LINE_NO:601
  CF04_DumbroskyDoorRef.SetLockLevel(0) ; #DEBUG_LINE_NO:602
  CF04_DumbroskyDoorRef.Unlock(False) ; #DEBUG_LINE_NO:603
  CF04_SwistDoorRef.SetLockLevel(0) ; #DEBUG_LINE_NO:604
  CF04_SwistDoorRef.Unlock(False) ; #DEBUG_LINE_NO:605
  CF04_VeraDoorRef.SetLockLevel(0) ; #DEBUG_LINE_NO:606
  CF04_VeraDoorRef.Unlock(False) ; #DEBUG_LINE_NO:607
  CF_GabrielVera.SetEssential(False) ; #DEBUG_LINE_NO:610
  CF_GabrielVera.SetProtected(True) ; #DEBUG_LINE_NO:611
  Alias_CF04_Murata.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:614
  CF04_StageXXX_SirenEmergencyScene_Interior.Start() ; #DEBUG_LINE_NO:617
  CF04_StageXXX_SirenEmergencyScene_Exterior.Start() ; #DEBUG_LINE_NO:618
EndFunction

Function Fragment_Stage_0145_Item_00()
  Alias_CF04_Vera.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:627
  Alias_CF04_Vera.GetActorRef().Setvalue(Aggression, 1.0) ; #DEBUG_LINE_NO:628
EndFunction

Function Fragment_Stage_0148_Item_00()
  If CF04_VeraBribeDone.GetValue() == 0.0 ; #DEBUG_LINE_NO:636
    Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:637
    CF04_VeraBribeDone.Setvalue(1.0) ; #DEBUG_LINE_NO:638
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0149_Item_00()
  If Self.IsObjectiveDisplayed(130) == True ; #DEBUG_LINE_NO:647
    Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:648
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(150) == False ; #DEBUG_LINE_NO:650
    Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:651
    Alias_CF04_Vera.GetActorRef().AddItem(Alias_CF04_BankData.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:652
    Alias_CF04_Vera.GetActorRef().AddItem(Alias_CF04_Evidence_GalbankScheme.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:653
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(250) ; #DEBUG_LINE_NO:655
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.IsObjectiveDisplayed(130) == True ; #DEBUG_LINE_NO:663
    Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:664
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(140) == True ; #DEBUG_LINE_NO:666
    Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:667
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:669
  If Self.GetStageDone(149) == False ; #DEBUG_LINE_NO:671
    Game.GetPlayer().AddItem(Alias_CF04_BankData.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:672
    Game.GetPlayer().AddItem(Alias_CF04_Evidence_GalbankScheme.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:673
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(250) == False ; #DEBUG_LINE_NO:677
    Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_PlayerExitingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:678
    Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:679
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0155_Item_00()
  Alias_CF04_Dumbrosky.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:689
  Alias_CF04_Dumbrosky.GetActorRef().Setvalue(Aggression, 1.0) ; #DEBUG_LINE_NO:690
EndFunction

Function Fragment_Stage_0158_Item_00()
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:698
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:699
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(260) == True ; #DEBUG_LINE_NO:702
    Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:703
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(160) == False ; #DEBUG_LINE_NO:706
    Alias_CF04_Dumbrosky.GetActorRef().AddItem(Alias_CF04_GalbankCredentials.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:707
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(250) == False ; #DEBUG_LINE_NO:710
    Self.SetStage(250) ; #DEBUG_LINE_NO:711
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(260) == True && Self.GetStageDone(160) == False ; #DEBUG_LINE_NO:714
    Self.SetStage(270) ; #DEBUG_LINE_NO:715
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:719
    Self.SetStage(280) ; #DEBUG_LINE_NO:720
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovCombatExitMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:724
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:725
EndFunction

Function Fragment_Stage_0158_Item_01()
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:733
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:734
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(260) == True ; #DEBUG_LINE_NO:737
    Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:738
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(250) == False ; #DEBUG_LINE_NO:741
    Self.SetStage(250) ; #DEBUG_LINE_NO:742
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF04_RokovCombatExitMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:746
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:747
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:755
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:756
  If Self.GetStageDone(158) == False ; #DEBUG_LINE_NO:758
    Game.GetPlayer().RemoveItem(Alias_CF04_BankData.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:759
    Game.GetPlayer().AddItem(Alias_CF04_GalbankCredentials.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:760
    If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:761
      Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:762
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0248_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:774
EndFunction

Function Fragment_Stage_0250_Item_00()
  LC102_SecurityFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:784
  If Self.IsObjectiveCompleted(30) == False ; #DEBUG_LINE_NO:786
    Self.SetObjectiveDisplayed(30, False, False) ; #DEBUG_LINE_NO:787
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(40) == False ; #DEBUG_LINE_NO:789
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:790
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(50) == False ; #DEBUG_LINE_NO:792
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:793
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(60) == False ; #DEBUG_LINE_NO:795
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:796
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(70) == False ; #DEBUG_LINE_NO:798
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:799
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(90) == False ; #DEBUG_LINE_NO:801
    Self.SetObjectiveDisplayed(90, False, False) ; #DEBUG_LINE_NO:802
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(100) == False ; #DEBUG_LINE_NO:804
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:805
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(110) == False ; #DEBUG_LINE_NO:807
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:808
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(120) == False ; #DEBUG_LINE_NO:810
    Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:811
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(130) == False ; #DEBUG_LINE_NO:813
    Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:814
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(140) == False ; #DEBUG_LINE_NO:816
    Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:817
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(150) == False ; #DEBUG_LINE_NO:819
    Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:820
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(170) == False ; #DEBUG_LINE_NO:822
    Self.SetObjectiveDisplayed(170, False, False) ; #DEBUG_LINE_NO:823
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(600) == False ; #DEBUG_LINE_NO:827
    Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:828
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(610) == False ; #DEBUG_LINE_NO:830
    Self.SetObjectiveDisplayed(610, False, False) ; #DEBUG_LINE_NO:831
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(620) == False ; #DEBUG_LINE_NO:833
    Self.SetObjectiveDisplayed(620, False, False) ; #DEBUG_LINE_NO:834
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(630) == False ; #DEBUG_LINE_NO:836
    Self.SetObjectiveDisplayed(630, False, False) ; #DEBUG_LINE_NO:837
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(640) == False ; #DEBUG_LINE_NO:839
    Self.SetObjectiveDisplayed(640, False, False) ; #DEBUG_LINE_NO:840
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(158) == False ; #DEBUG_LINE_NO:844
    Self.SetStage(260) ; #DEBUG_LINE_NO:845
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == False ; #DEBUG_LINE_NO:849
    Self.SetStage(270) ; #DEBUG_LINE_NO:850
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(158) == True && Self.GetStageDone(160) == True ; #DEBUG_LINE_NO:854
    Self.SetStage(280) ; #DEBUG_LINE_NO:855
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(630) == False ; #DEBUG_LINE_NO:859
    CF04_PurserSafeCombatRef.Enable(False) ; #DEBUG_LINE_NO:860
    CF04_PurserSafeRef.Disable(False) ; #DEBUG_LINE_NO:861
  EndIf ; #DEBUG_LINE_NO:
  CF04_CombatEnablerRef.Enable(False) ; #DEBUG_LINE_NO:865
  CF04BallroomDoorRef02.SetLockLevel(0) ; #DEBUG_LINE_NO:868
  CF04BallroomDoorRef02.Unlock(False) ; #DEBUG_LINE_NO:869
  CF_LarryDumbrosky.SetEssential(False) ; #DEBUG_LINE_NO:872
  CF_LarryDumbrosky.SetProtected(True) ; #DEBUG_LINE_NO:873
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:881
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:882
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(260, True, False) ; #DEBUG_LINE_NO:884
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.IsObjectiveDisplayed(260) == True ; #DEBUG_LINE_NO:892
    Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:893
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(270, True, False) ; #DEBUG_LINE_NO:895
EndFunction

Function Fragment_Stage_0280_Item_00()
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:903
  Self.SetObjectiveDisplayed(280, True, False) ; #DEBUG_LINE_NO:904
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.IsObjectiveDisplayed(170) == True ; #DEBUG_LINE_NO:912
    Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:913
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(280) == True ; #DEBUG_LINE_NO:916
    Self.SetObjectiveCompleted(280, True) ; #DEBUG_LINE_NO:917
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:920
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:921
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:924
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:926
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:934
  Self.SetObjectiveDisplayed(330, True, False) ; #DEBUG_LINE_NO:935
  CF_GalbankGuard.SetEssential(False) ; #DEBUG_LINE_NO:938
  CF_GalbankGuard.SetProtected(True) ; #DEBUG_LINE_NO:939
  CF04GalbankArchivesAmbush.Start() ; #DEBUG_LINE_NO:942
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetObjectiveCompleted(330, True) ; #DEBUG_LINE_NO:950
  Self.SetObjectiveDisplayed(340, True, False) ; #DEBUG_LINE_NO:951
EndFunction

Function Fragment_Stage_0344_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().AddItem(Alias_CF04_GalbankAccessCardAlias.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:959
  Self.SetObjectiveCompleted(340, True) ; #DEBUG_LINE_NO:961
  Self.SetObjectiveDisplayed(346, True, False) ; #DEBUG_LINE_NO:962
EndFunction

Function Fragment_Stage_0345_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:971
  Alias_CF04_GalbankGuard.GetActorRef().Setvalue(Aggression, 1.0) ; #DEBUG_LINE_NO:972
EndFunction

Function Fragment_Stage_0346_Item_00()
  CF_ArchivesDoorInterior.Unlock(False) ; #DEBUG_LINE_NO:980
  Alias_CF04_GalbankGuard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:981
  Self.SetObjectiveCompleted(340, True) ; #DEBUG_LINE_NO:983
  Self.SetObjectiveDisplayed(346, True, False) ; #DEBUG_LINE_NO:984
EndFunction

Function Fragment_Stage_0347_Item_00()
  Alias_CF04_GalbankGuard.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:992
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(346, True) ; #DEBUG_LINE_NO:1000
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:1001
  Alias_CF04_GalbankGuard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1003
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:1011
  Self.SetObjectiveDisplayed(370, True, False) ; #DEBUG_LINE_NO:1012
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:1020
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:1021
  Alias_CF04_Delgado.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:1024
  Alias_CF04_Delgado.GetActorRef().MoveTo(CF03DelgadoWrapUpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1025
  Alias_CF04_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1026
  Alias_CF04_Naeva.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:1027
  Alias_CF04_Naeva.GetActorRef().MoveTo(CF03NaevaWrapUpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1028
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1029
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:1037
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:1038
  If Self.GetStageDone(680) == False ; #DEBUG_LINE_NO:1041
    If Self.IsObjectiveDisplayed(600) == True ; #DEBUG_LINE_NO:1042
      Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:1043
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(610) == True ; #DEBUG_LINE_NO:1045
      Self.SetObjectiveDisplayed(610, False, False) ; #DEBUG_LINE_NO:1046
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(620) == True ; #DEBUG_LINE_NO:1048
      Self.SetObjectiveDisplayed(620, False, False) ; #DEBUG_LINE_NO:1049
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(630) == True ; #DEBUG_LINE_NO:1051
      Self.SetObjectiveDisplayed(630, False, False) ; #DEBUG_LINE_NO:1052
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(640) == True ; #DEBUG_LINE_NO:1054
      Self.SetObjectiveDisplayed(640, False, False) ; #DEBUG_LINE_NO:1055
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  CF04_StageXXX_SirenEmergencyScene_Interior.Stop() ; #DEBUG_LINE_NO:1060
  CF04_StageXXX_SirenEmergencyScene_Exterior.Stop() ; #DEBUG_LINE_NO:1061
EndFunction

Function Fragment_Stage_0430_Item_00()
  Alias_CF04_Rokov.GetActorRef().MoveTo(CF_Key_RokovMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1069
  Alias_CF04_Rokov.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:1070
  Alias_CF04_Rokov.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False) ; #DEBUG_LINE_NO:1071
  Alias_CF04_Rokov.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1072
EndFunction

Function Fragment_Stage_0435_Item_00()
  CrimsonFleetCaptainState_Rokov.Setvalue(1.0) ; #DEBUG_LINE_NO:1081
EndFunction

Function Fragment_Stage_0440_Item_00()
  CrimsonFleetCaptainState_Rokov.Setvalue(1.0) ; #DEBUG_LINE_NO:1090
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:1098
  Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:1099
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1101
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:1109
  Self.SetObjectiveDisplayed(460, True, False) ; #DEBUG_LINE_NO:1110
  Alias_CF04_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1112
  If Self.GetStageDone(680) == True ; #DEBUG_LINE_NO:1115
    Self.SetObjectiveDisplayed(680, True, False) ; #DEBUG_LINE_NO:1116
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0510_Item_00()
  If CF_SysDefShutdown.GetValue() == 0.0 ; #DEBUG_LINE_NO:1125
    Self.SetObjectiveCompleted(460, True) ; #DEBUG_LINE_NO:1126
    Self.SetObjectiveDisplayed(510, True, False) ; #DEBUG_LINE_NO:1127
    Alias_CF04_Kibwe.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:1130
    Alias_CF04_Kibwe.GetActorRef().MoveTo(CF03KibweWrapUpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1131
    Alias_CF04_Kibwe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1132
    Alias_CF04_Toft.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:1133
    Alias_CF04_Toft.GetActorRef().MoveTo(CF03ToftWrapUpMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1134
    Alias_CF04_Toft.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1135
  ElseIf CF_SysDefShutdown.GetValue() == 1.0 ; #DEBUG_LINE_NO:1136
    Self.SetObjectiveCompleted(460, True) ; #DEBUG_LINE_NO:1137
    Self.SetStage(1000) ; #DEBUG_LINE_NO:1138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(510, True) ; #DEBUG_LINE_NO:1147
  Self.SetObjectiveDisplayed(520, True, False) ; #DEBUG_LINE_NO:1148
EndFunction

Function Fragment_Stage_0530_Item_00()
  CF_Main.SetStage(250) ; #DEBUG_LINE_NO:1156
EndFunction

Function Fragment_Stage_0540_Item_00()
  CF_Main.SetStage(275) ; #DEBUG_LINE_NO:1164
  CF04_UCArrested.Setvalue(1.0) ; #DEBUG_LINE_NO:1165
EndFunction

Function Fragment_Stage_0545_Item_00()
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:1173
  Self.SetStage(1000) ; #DEBUG_LINE_NO:1174
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:1182
EndFunction

Function Fragment_Stage_0605_Item_00()
  If Self.GetStageDone(640) == False ; #DEBUG_LINE_NO:1190
    Alias_CF04_Sheila.GetActorRef().AddItem(Alias_CF04_ClaimID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:1191
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(250) ; #DEBUG_LINE_NO:1194
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:1202
  Self.SetObjectiveDisplayed(610, True, False) ; #DEBUG_LINE_NO:1203
  Alias_CF04_Sheila.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:1205
EndFunction

Function Fragment_Stage_0617_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1213
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:1221
  Self.SetObjectiveDisplayed(620, True, False) ; #DEBUG_LINE_NO:1222
EndFunction

Function Fragment_Stage_0625_Item_00()
  Self.SetStage(250) ; #DEBUG_LINE_NO:1230
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:1238
  Self.SetObjectiveDisplayed(630, True, False) ; #DEBUG_LINE_NO:1239
EndFunction

Function Fragment_Stage_0640_Item_00()
  Self.SetObjectiveCompleted(630, True) ; #DEBUG_LINE_NO:1247
  Self.SetObjectiveDisplayed(640, True, False) ; #DEBUG_LINE_NO:1248
  If Self.IsObjectiveDisplayed(610) == True ; #DEBUG_LINE_NO:1250
    Self.SetObjectiveDisplayed(610, False, False) ; #DEBUG_LINE_NO:1251
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(617) == True ; #DEBUG_LINE_NO:1254
    Game.GetPlayer().RemoveItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1255
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Alias_CF04_ClaimID.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:1258
EndFunction

Function Fragment_Stage_0650_Item_00()
  Game.GetPlayer().AddItem(Alias_CF04_SheilaEvidence.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:1266
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveCompleted(640, True) ; #DEBUG_LINE_NO:1274
EndFunction

Function Fragment_Stage_0685_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF_ESAward.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1284
  Game.GetPlayer().AddItem(Credits as Form, CF04_ESAwardNoRokov.GetValueInt(), False) ; #DEBUG_LINE_NO:1285
  Self.SetObjectiveCompleted(680, True) ; #DEBUG_LINE_NO:1286
EndFunction

Function Fragment_Stage_0690_Item_00()
  Game.GetPlayer().RemoveItem(Alias_CF_ESAward.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:1294
  Game.GetPlayer().AddItem(Credits as Form, CF04_ESAwardWithRokov.GetValueInt(), False) ; #DEBUG_LINE_NO:1295
  Self.SetObjectiveCompleted(680, True) ; #DEBUG_LINE_NO:1296
EndFunction

Function Fragment_Stage_0695_Item_00()
  Self.SetObjectiveCompleted(680, True) ; #DEBUG_LINE_NO:1304
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(520, True) ; #DEBUG_LINE_NO:1312
  CF04_scLc102MarkerRef.Disable(False) ; #DEBUG_LINE_NO:1315
  LC082.UpdateVigilanceLocation("CF05") ; #DEBUG_LINE_NO:1318
  CF05.SetStage(100) ; #DEBUG_LINE_NO:1319
  If Self.GetStageDone(158) ; #DEBUG_LINE_NO:1322
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:1323
    SE_Player_FAB21_Timestamp.Setvalue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:1324
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:1327
EndFunction
