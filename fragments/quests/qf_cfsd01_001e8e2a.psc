ScriptName Fragments:Quests:QF_CFSD01_001E8E2A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CFSD01_Evidence_CF01_Kemp Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF03_Carter Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF03_LockRiots Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF04_Rokov Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF04_GalbankScheme Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF05_Daiyu Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF05_ComSpike Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_BayuGenerdyne Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_AyumiKomiko Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF06_EstelleVincent Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CF07_KryxFate Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ01_Maddie Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_CFKeyZ02_Kirova Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Durand Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Voss Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Jaso Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chunks Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Chiroptera Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Paradiso Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_Evidence_MSC_Kreet Auto Const mandatory
ObjectReference Property CF01_Evidence_KempRef Auto Const mandatory
ObjectReference Property CF06_Evidence_EstelleVincentRef Auto Const mandatory
ObjectReference Property CF06_Evidence_AyumiKomikoRef Auto Const mandatory
ObjectReference Property CFKeyZ02_Evidence_AytonRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_HopeTownRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_ChunksRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_KreetRef Auto Const mandatory
ObjectReference Property CF05_Evidence_HuanDaiyuRef Auto Const mandatory
ObjectReference Property CFSD01_Evidence_MSC_ChiopteraRef Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CydoniaFaction Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_AdlerKemp Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_EstelleVincent Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ReferenceAlias Property Alias_CFSD01_EvgenyRokov Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_CFSD01_Tofts Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ObjectReference Property CF06_TTGWallSafeRef Auto Const mandatory
ActorBase Property Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:7
  Self.SetStage(5) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:17
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:20
  Self.SetStage(5) ; #DEBUG_LINE_NO:21
  kmyQuest.DebugAddAll() ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0005_Item_00()
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:31
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
  CF01_Evidence_KempRef.Enable(False) ; #DEBUG_LINE_NO:36
  CF06_Evidence_EstelleVincentRef.Enable(False) ; #DEBUG_LINE_NO:37
  Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef().Enable(False) ; #DEBUG_LINE_NO:38
  CF06_TTGWallSafeRef.AddItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:39
  CFKeyZ02_Evidence_AytonRef.Enable(False) ; #DEBUG_LINE_NO:40
  CFSD01_Evidence_MSC_HopeTownRef.Enable(False) ; #DEBUG_LINE_NO:41
  CFSD01_Evidence_MSC_ChunksRef.Enable(False) ; #DEBUG_LINE_NO:42
  CFSD01_Evidence_MSC_KreetRef.Enable(False) ; #DEBUG_LINE_NO:43
  CF05_Evidence_HuanDaiyuRef.Enable(False) ; #DEBUG_LINE_NO:44
  CFSD01_Evidence_MSC_ChiopteraRef.Enable(False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:53
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:54
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:57
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:68
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF01_Kemp.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:71
  Utility.wait(1.0) ; #DEBUG_LINE_NO:72
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:73
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:82
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:83
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:86
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:96
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:97
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_Carter.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:100
  Utility.wait(1.0) ; #DEBUG_LINE_NO:101
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:102
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:111
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:112
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:115
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0035_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:125
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:126
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF03_LockRiots.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:129
  Utility.wait(1.0) ; #DEBUG_LINE_NO:130
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:131
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:140
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:141
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:144
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:154
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:155
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_Rokov.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:158
  Utility.wait(1.0) ; #DEBUG_LINE_NO:159
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:160
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:169
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:170
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:173
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0055_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:183
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:184
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF04_GalbankScheme.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:187
  Utility.wait(1.0) ; #DEBUG_LINE_NO:188
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:189
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:198
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:199
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:202
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:203
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0065_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:212
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:213
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_Daiyu.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:216
  Utility.wait(1.0) ; #DEBUG_LINE_NO:217
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:218
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:227
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:228
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:231
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:232
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0075_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:241
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:242
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF05_ComSpike.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:245
  Utility.wait(1.0) ; #DEBUG_LINE_NO:246
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:247
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0080_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:256
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:257
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:260
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:261
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0085_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:270
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:271
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_EstelleVincent.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:274
  Utility.wait(1.0) ; #DEBUG_LINE_NO:275
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:276
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:285
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:286
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:289
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:290
  EndIf ; #DEBUG_LINE_NO:
  Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef().SetActorOwner(Player, False) ; #DEBUG_LINE_NO:293
EndFunction

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:301
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:302
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:305
  Utility.wait(1.0) ; #DEBUG_LINE_NO:306
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:307
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:308
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:316
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:317
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:320
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:321
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0105_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:330
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:331
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF06_AyumiKomiko.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:334
  Utility.wait(1.0) ; #DEBUG_LINE_NO:335
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:336
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:345
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:346
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:349
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:350
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0115_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:359
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:360
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CF07_KryxFate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:363
  Utility.wait(1.0) ; #DEBUG_LINE_NO:364
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:365
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:366
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:374
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:375
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:378
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:379
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0125_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:388
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:389
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Durand.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:392
  Utility.wait(1.0) ; #DEBUG_LINE_NO:393
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:394
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:395
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:403
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:404
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:407
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:408
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0135_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:417
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:418
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Voss.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:421
  Utility.wait(1.0) ; #DEBUG_LINE_NO:422
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:423
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:432
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:433
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:436
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:437
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0145_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:446
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:447
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ01_Maddie.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:450
  Utility.wait(1.0) ; #DEBUG_LINE_NO:451
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:452
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:453
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:461
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:462
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:465
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:466
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0155_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:475
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:476
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_CFKeyZ02_Kirova.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:479
  Utility.wait(1.0) ; #DEBUG_LINE_NO:480
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:481
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:482
EndFunction

Function Fragment_Stage_0160_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:490
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:491
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:494
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:495
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0165_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:504
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:505
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Jaso.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:508
  Utility.wait(1.0) ; #DEBUG_LINE_NO:509
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:510
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:511
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:519
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:520
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:523
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:524
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0175_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:533
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:534
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chunks.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:537
  Utility.wait(1.0) ; #DEBUG_LINE_NO:538
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:539
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:540
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:548
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:549
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:552
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:553
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0185_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:562
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:563
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Chiroptera.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:566
  Utility.wait(1.0) ; #DEBUG_LINE_NO:567
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:568
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:569
EndFunction

Function Fragment_Stage_0190_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:577
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:578
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:581
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:582
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0195_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:591
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:592
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Paradiso.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:595
  Utility.wait(1.0) ; #DEBUG_LINE_NO:596
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:597
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:598
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:606
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:607
  If CF_Main.GetStageDone(300) == False ; #DEBUG_LINE_NO:610
    kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:611
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:620
  cfsd01_questscript kmyQuest = __temp as cfsd01_questscript ; #DEBUG_LINE_NO:621
  Game.GetPlayer().RemoveItem(Alias_CFSD01_Evidence_MSC_Kreet.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:624
  Utility.wait(1.0) ; #DEBUG_LINE_NO:625
  kmyQuest.EvidenceCheck() ; #DEBUG_LINE_NO:626
  kmyQuest.EvidenceCounter() ; #DEBUG_LINE_NO:627
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:636
  Alias_CFSD01_AdlerKemp.GetActorRef().RemoveFromFaction(CydoniaFaction) ; #DEBUG_LINE_NO:637
  Alias_CFSD01_AdlerKemp.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:638
  CrimsonFleetCaptainState_Adler.SetValue(3.0) ; #DEBUG_LINE_NO:641
EndFunction

Function Fragment_Stage_0420_Item_00()
  Alias_CFSD01_EvgenyRokov.GetActorRef().AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:649
  CrimsonFleetCaptainState_Rokov.SetValue(3.0) ; #DEBUG_LINE_NO:652
EndFunction

Function Fragment_Stage_0430_Item_00()
  CrimsonFleetCaptainState_Huan.SetValue(3.0) ; #DEBUG_LINE_NO:661
EndFunction

Function Fragment_Stage_0440_Item_00()
  Actor EstelleRef = Alias_CFSD01_EstelleVincent.GetActorRef() ; #DEBUG_LINE_NO:670
  EstelleRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:671
  EstelleRef.AddToFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:672
  CrimsonFleetCaptainState_Estelle.SetValue(3.0) ; #DEBUG_LINE_NO:675
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.IsObjectiveDisplayed(100) == True ; #DEBUG_LINE_NO:683
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:684
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:687
EndFunction

Function Fragment_Stage_1500_Item_00()
  If Self.IsObjectiveDisplayed(100) == True ; #DEBUG_LINE_NO:698
    Self.SetObjectiveDisplayed(10, False, False) ; #DEBUG_LINE_NO:699
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(200) == True ; #DEBUG_LINE_NO:702
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:703
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(300) == True ; #DEBUG_LINE_NO:706
    Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:707
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:716
  Game.GetPlayer().AddItem(LL_Weapon_Reward_CFSD01_Tofts as Form, 1, False) ; #DEBUG_LINE_NO:717
EndFunction
