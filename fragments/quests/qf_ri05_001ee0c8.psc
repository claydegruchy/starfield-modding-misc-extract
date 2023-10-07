ScriptName Fragments:Quests:QF_RI05_001EE0C8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI05_Track_BayuBypassed Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_ImogeneMarker Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_ImogeneOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_YukoTravelMarker Auto Const mandatory
Scene Property RI05_0100_Yuko_PlayerAddressScene Auto Const mandatory
ReferenceAlias Property Alias_Kumiho Auto Const mandatory
Book Property RI05_KumihoSlate Auto Const mandatory
Scene Property RI05_0800_Imogene_PlayerAddressScene Auto Const mandatory
ReferenceAlias Property Alias_ImogeneOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_TradeTowerQS Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_SeokguhQS Auto Const mandatory
ReferenceAlias Property Alias_KumihoSlate Auto Const mandatory
ReferenceAlias Property Alias_DaltonOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_ImogeneSeokguhQS Auto Const mandatory
Quest Property LC115 Auto Const mandatory
Faction Property LC115SeokguhFaction Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Book Property RI05_ImogeneEvidenceSlate Auto Const mandatory
ReferenceAlias Property Alias_ImogeneEvidenceSlate Auto Const mandatory
GlobalVariable Property RI05_Track_BayuFavorRefused Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property RI05_Track_ImogeneSpared Auto Const mandatory
Scene Property RI05_0550_Companion_ReactToRejectingBayuScene Auto Const mandatory
Scene Property RI05_0550_Compantion_ReactToDoingBayuFavorScene Auto Const mandatory
Scene Property RI05_0915_Companion_PlayerKilledImogeneScene Auto Const mandatory
Scene Property RI05_930_Companion_PlayerLetImogeneLiveScene Auto Const mandatory
Scene Property RI05_1150_Companion_RespondToBayuDecisionScene Auto Const mandatory
Quest Property RI06 Auto Const mandatory
Quest Property DialogueFCSeokguhSyndicateHideout_RI05 Auto Const mandatory
GlobalVariable Property RI05_Imogene_Credits Auto Const mandatory
GlobalVariable Property RI05_Bayu_Credits Auto Const mandatory
Faction Property LC044RyujinGuardCrimeFaction Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
GlobalVariable Property RI05_Frankie_LargeCredits Auto Const mandatory
ReferenceAlias Property Alias_FrankiesDoor Auto Const mandatory
ReferenceAlias Property Alias_UlaruDoor Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_FrankiesQS Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Key Property RI05_UlaruKeycard Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
ReferenceAlias Property Alias_Maeve Auto Const mandatory
ReferenceAlias Property Alias_MaeveSceneMarker Auto Const mandatory
GlobalVariable Property RI05_Track_BayuDispleased Auto Const mandatory
GlobalVariable Property RI05_Track_BayuPlayerKeptSlate Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_Frankie Auto Const mandatory
Scene Property RI05_0600_Frankie_ForceGreetScene Auto Const mandatory
ReferenceAlias Property Alias_SyndicateGuard01 Auto Const mandatory
ReferenceAlias Property Alias_SyndicateGuard02 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property LC115SeokguhTrespassFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_YukoReturnStartMarker Auto Const mandatory
Location Property LC115Location Auto Const mandatory
GlobalVariable Property RI05_LC115PreviouslyExplored Auto Const mandatory
Cell Property LC115SeokguhHideout Auto Const mandatory
ReferenceAlias Property Alias_MaeveGuardFurniture Auto Const mandatory
ReferenceAlias Property Alias_MaeveGuard Auto Const mandatory
ReferenceAlias Property Alias_YukoReturnQS Auto Const mandatory
ActorValue Property RI07_Foreknowledge_ImogeneInnocentAV Auto Const mandatory
ReferenceAlias Property Alias_YukoDoor Auto Const mandatory
ReferenceAlias Property Alias_YukoStartMarker Auto Const mandatory
Quest Property RI04 Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
ReferenceAlias Property Alias_EnableFriendlyAddsMarker Auto Const mandatory
Key Property RI05_SeokguhSyndicateHideoutKey Auto Const mandatory
ReferenceAlias Property Alias_UlaruChairSwapEnableMarker Auto Const mandatory
Scene Property RI05_1000_Ularu_ConfrontationPartIIScene Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Keyword Property Artifact_GravImmune Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI_Support.SetStage(1) ; #DEBUG_LINE_NO:7
  Alias_YukoDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI04.SetStage(9) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:24
  Self.SetStage(100) ; #DEBUG_LINE_NO:25
  Game.GetPlayer().MoveTo(Alias_ImogeneOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:34
  Self.SetStage(100) ; #DEBUG_LINE_NO:35
  Self.SetStage(105) ; #DEBUG_LINE_NO:36
  Self.SetStage(300) ; #DEBUG_LINE_NO:37
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:39
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:40
  Game.GetPlayer().MoveTo(Alias_ImogeneOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:49
  Self.SetStage(400) ; #DEBUG_LINE_NO:50
  Self.SetStage(600) ; #DEBUG_LINE_NO:51
  Alias_YukoDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:53
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:54
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:55
  Game.GetPlayer().MoveTo(Alias_DaltonOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:65
  Self.SetStage(100) ; #DEBUG_LINE_NO:66
  Self.SetStage(105) ; #DEBUG_LINE_NO:67
  Self.SetStage(300) ; #DEBUG_LINE_NO:68
  Self.SetStage(399) ; #DEBUG_LINE_NO:69
  Self.SetStage(400) ; #DEBUG_LINE_NO:70
  Self.SetStage(450) ; #DEBUG_LINE_NO:71
  Self.SetStage(500) ; #DEBUG_LINE_NO:72
  Self.SetStage(600) ; #DEBUG_LINE_NO:73
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:75
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().MoveTo(Alias_TradeTowerQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:85
  Self.SetStage(100) ; #DEBUG_LINE_NO:86
  Self.SetStage(105) ; #DEBUG_LINE_NO:87
  Self.SetStage(300) ; #DEBUG_LINE_NO:88
  Self.SetStage(399) ; #DEBUG_LINE_NO:89
  Self.SetStage(400) ; #DEBUG_LINE_NO:90
  Self.SetStage(450) ; #DEBUG_LINE_NO:91
  Self.SetStage(500) ; #DEBUG_LINE_NO:92
  Self.SetStage(520) ; #DEBUG_LINE_NO:93
  Self.SetStage(550) ; #DEBUG_LINE_NO:94
  Self.SetStage(600) ; #DEBUG_LINE_NO:95
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:97
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:98
  Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:107
  Self.SetStage(100) ; #DEBUG_LINE_NO:108
  Self.SetStage(105) ; #DEBUG_LINE_NO:109
  Self.SetStage(300) ; #DEBUG_LINE_NO:110
  Self.SetStage(399) ; #DEBUG_LINE_NO:111
  Self.SetStage(400) ; #DEBUG_LINE_NO:112
  Self.SetStage(450) ; #DEBUG_LINE_NO:113
  Self.SetStage(500) ; #DEBUG_LINE_NO:114
  Self.SetStage(510) ; #DEBUG_LINE_NO:115
  Self.SetStage(550) ; #DEBUG_LINE_NO:116
  Self.SetStage(600) ; #DEBUG_LINE_NO:117
  Self.SetStage(610) ; #DEBUG_LINE_NO:118
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:120
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:121
  Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:130
  Self.SetStage(100) ; #DEBUG_LINE_NO:131
  Self.SetStage(105) ; #DEBUG_LINE_NO:132
  Self.SetStage(300) ; #DEBUG_LINE_NO:133
  Self.SetStage(399) ; #DEBUG_LINE_NO:134
  Self.SetStage(400) ; #DEBUG_LINE_NO:135
  Self.SetStage(450) ; #DEBUG_LINE_NO:136
  Self.SetStage(500) ; #DEBUG_LINE_NO:137
  Self.SetStage(503) ; #DEBUG_LINE_NO:138
  Self.SetStage(550) ; #DEBUG_LINE_NO:139
  Self.SetStage(600) ; #DEBUG_LINE_NO:140
  Self.SetStage(610) ; #DEBUG_LINE_NO:141
  Self.SetStage(620) ; #DEBUG_LINE_NO:142
  Self.SetStage(622) ; #DEBUG_LINE_NO:143
  Self.SetStage(635) ; #DEBUG_LINE_NO:144
  Self.SetStage(660) ; #DEBUG_LINE_NO:145
  Self.SetStage(800) ; #DEBUG_LINE_NO:146
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:148
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:149
  Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:158
  Self.SetStage(100) ; #DEBUG_LINE_NO:159
  Self.SetStage(105) ; #DEBUG_LINE_NO:160
  Self.SetStage(300) ; #DEBUG_LINE_NO:161
  Self.SetStage(399) ; #DEBUG_LINE_NO:162
  Self.SetStage(400) ; #DEBUG_LINE_NO:163
  Self.SetStage(450) ; #DEBUG_LINE_NO:164
  Self.SetStage(500) ; #DEBUG_LINE_NO:165
  Self.SetStage(503) ; #DEBUG_LINE_NO:166
  Self.SetStage(550) ; #DEBUG_LINE_NO:167
  Self.SetStage(600) ; #DEBUG_LINE_NO:168
  Self.SetStage(610) ; #DEBUG_LINE_NO:169
  Self.SetStage(620) ; #DEBUG_LINE_NO:170
  Self.SetStage(622) ; #DEBUG_LINE_NO:171
  Self.SetStage(635) ; #DEBUG_LINE_NO:172
  Self.SetStage(660) ; #DEBUG_LINE_NO:173
  Self.SetStage(800) ; #DEBUG_LINE_NO:174
  Self.SetStage(900) ; #DEBUG_LINE_NO:175
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:177
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:178
  Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:187
  Self.SetStage(100) ; #DEBUG_LINE_NO:188
  Self.SetStage(105) ; #DEBUG_LINE_NO:189
  Self.SetStage(300) ; #DEBUG_LINE_NO:190
  Self.SetStage(399) ; #DEBUG_LINE_NO:191
  Self.SetStage(400) ; #DEBUG_LINE_NO:192
  Self.SetStage(450) ; #DEBUG_LINE_NO:193
  Self.SetStage(500) ; #DEBUG_LINE_NO:194
  Self.SetStage(503) ; #DEBUG_LINE_NO:195
  Self.SetStage(550) ; #DEBUG_LINE_NO:196
  Self.SetStage(600) ; #DEBUG_LINE_NO:197
  Self.SetStage(610) ; #DEBUG_LINE_NO:198
  Self.SetStage(620) ; #DEBUG_LINE_NO:199
  Self.SetStage(622) ; #DEBUG_LINE_NO:200
  Self.SetStage(635) ; #DEBUG_LINE_NO:201
  Self.SetStage(660) ; #DEBUG_LINE_NO:202
  Self.SetStage(800) ; #DEBUG_LINE_NO:203
  Self.SetStage(900) ; #DEBUG_LINE_NO:204
  Self.SetStage(911) ; #DEBUG_LINE_NO:205
  Self.SetStage(960) ; #DEBUG_LINE_NO:206
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:208
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:209
  Game.GetPlayer().MoveTo(Alias_ImogeneSeokguhQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:218
  Self.SetStage(100) ; #DEBUG_LINE_NO:219
  Self.SetStage(105) ; #DEBUG_LINE_NO:220
  Self.SetStage(300) ; #DEBUG_LINE_NO:221
  Self.SetStage(399) ; #DEBUG_LINE_NO:222
  Self.SetStage(400) ; #DEBUG_LINE_NO:223
  Self.SetStage(450) ; #DEBUG_LINE_NO:224
  Self.SetStage(500) ; #DEBUG_LINE_NO:225
  Self.SetStage(510) ; #DEBUG_LINE_NO:226
  Self.SetStage(540) ; #DEBUG_LINE_NO:227
  Self.SetStage(550) ; #DEBUG_LINE_NO:228
  Self.SetStage(600) ; #DEBUG_LINE_NO:229
  Self.SetStage(610) ; #DEBUG_LINE_NO:230
  Self.SetStage(620) ; #DEBUG_LINE_NO:231
  Self.SetStage(622) ; #DEBUG_LINE_NO:232
  Self.SetStage(635) ; #DEBUG_LINE_NO:233
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:235
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:236
  Game.GetPlayer().MoveTo(Alias_SeokguhQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:245
  Self.SetStage(100) ; #DEBUG_LINE_NO:246
  Self.SetStage(105) ; #DEBUG_LINE_NO:247
  Self.SetStage(300) ; #DEBUG_LINE_NO:248
  Self.SetStage(399) ; #DEBUG_LINE_NO:249
  Self.SetStage(400) ; #DEBUG_LINE_NO:250
  Self.SetStage(450) ; #DEBUG_LINE_NO:251
  Self.SetStage(500) ; #DEBUG_LINE_NO:252
  Self.SetStage(510) ; #DEBUG_LINE_NO:253
  Self.SetStage(550) ; #DEBUG_LINE_NO:254
  Self.SetStage(600) ; #DEBUG_LINE_NO:255
  Self.SetStage(610) ; #DEBUG_LINE_NO:256
  Self.SetStage(620) ; #DEBUG_LINE_NO:257
  Self.SetStage(622) ; #DEBUG_LINE_NO:258
  Self.SetStage(635) ; #DEBUG_LINE_NO:259
  Self.SetStage(660) ; #DEBUG_LINE_NO:260
  Self.SetStage(700) ; #DEBUG_LINE_NO:261
  Self.SetStage(799) ; #DEBUG_LINE_NO:262
  Self.SetStage(800) ; #DEBUG_LINE_NO:263
  Self.SetStage(900) ; #DEBUG_LINE_NO:264
  Self.SetStage(930) ; #DEBUG_LINE_NO:265
  Self.SetStage(950) ; #DEBUG_LINE_NO:266
  Self.SetStage(990) ; #DEBUG_LINE_NO:267
  Self.SetStage(1100) ; #DEBUG_LINE_NO:268
  Game.GetPlayer().MoveTo(Alias_TradeTowerQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:270
  Game.GetPlayer().AddItem(Alias_KumihoSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:279
  Self.SetStage(100) ; #DEBUG_LINE_NO:280
  Self.SetStage(105) ; #DEBUG_LINE_NO:281
  Self.SetStage(300) ; #DEBUG_LINE_NO:282
  Self.SetStage(399) ; #DEBUG_LINE_NO:283
  Self.SetStage(400) ; #DEBUG_LINE_NO:284
  Self.SetStage(450) ; #DEBUG_LINE_NO:285
  Self.SetStage(500) ; #DEBUG_LINE_NO:286
  Self.SetStage(510) ; #DEBUG_LINE_NO:287
  Self.SetStage(550) ; #DEBUG_LINE_NO:288
  Self.SetStage(600) ; #DEBUG_LINE_NO:289
  Self.SetStage(610) ; #DEBUG_LINE_NO:290
  Self.SetStage(620) ; #DEBUG_LINE_NO:291
  Self.SetStage(622) ; #DEBUG_LINE_NO:292
  Self.SetStage(635) ; #DEBUG_LINE_NO:293
  Self.SetStage(660) ; #DEBUG_LINE_NO:294
  Self.SetStage(800) ; #DEBUG_LINE_NO:295
  Self.SetStage(900) ; #DEBUG_LINE_NO:296
  Self.SetStage(930) ; #DEBUG_LINE_NO:297
  Self.SetStage(950) ; #DEBUG_LINE_NO:298
  Self.SetStage(1000) ; #DEBUG_LINE_NO:299
  Self.SetStage(1100) ; #DEBUG_LINE_NO:300
  Self.SetStage(1110) ; #DEBUG_LINE_NO:301
  Self.SetStage(1150) ; #DEBUG_LINE_NO:302
  Self.SetStage(1200) ; #DEBUG_LINE_NO:303
  Self.SetStage(1300) ; #DEBUG_LINE_NO:304
  Self.SetStage(1301) ; #DEBUG_LINE_NO:305
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:307
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:315
  Self.SetStage(100) ; #DEBUG_LINE_NO:316
  Self.SetStage(105) ; #DEBUG_LINE_NO:317
  Self.SetStage(300) ; #DEBUG_LINE_NO:318
  Self.SetStage(399) ; #DEBUG_LINE_NO:319
  Self.SetStage(400) ; #DEBUG_LINE_NO:320
  Self.SetStage(450) ; #DEBUG_LINE_NO:321
  Self.SetStage(500) ; #DEBUG_LINE_NO:322
  Self.SetStage(510) ; #DEBUG_LINE_NO:323
  Self.SetStage(550) ; #DEBUG_LINE_NO:324
  Self.SetStage(600) ; #DEBUG_LINE_NO:325
  Self.SetStage(610) ; #DEBUG_LINE_NO:326
  Self.SetStage(620) ; #DEBUG_LINE_NO:327
  Self.SetStage(622) ; #DEBUG_LINE_NO:328
  Self.SetStage(635) ; #DEBUG_LINE_NO:329
  Self.SetStage(660) ; #DEBUG_LINE_NO:330
  Self.SetStage(800) ; #DEBUG_LINE_NO:331
  Self.SetStage(900) ; #DEBUG_LINE_NO:332
  Self.SetStage(930) ; #DEBUG_LINE_NO:333
  Self.SetStage(950) ; #DEBUG_LINE_NO:334
  Self.SetStage(1000) ; #DEBUG_LINE_NO:335
  Self.SetStage(1070) ; #DEBUG_LINE_NO:336
  Self.SetStage(1100) ; #DEBUG_LINE_NO:337
  Self.SetStage(1110) ; #DEBUG_LINE_NO:338
  Self.SetStage(1150) ; #DEBUG_LINE_NO:339
  Self.SetStage(1200) ; #DEBUG_LINE_NO:340
  Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:341
  Game.GetPlayer().AddItem(RI05_UlaruKeycard as Form, 1, False) ; #DEBUG_LINE_NO:344
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:353
  Self.SetStage(100) ; #DEBUG_LINE_NO:354
  Self.SetStage(105) ; #DEBUG_LINE_NO:355
  Self.SetStage(300) ; #DEBUG_LINE_NO:356
  Self.SetStage(399) ; #DEBUG_LINE_NO:357
  Self.SetStage(400) ; #DEBUG_LINE_NO:358
  Self.SetStage(450) ; #DEBUG_LINE_NO:359
  Self.SetStage(500) ; #DEBUG_LINE_NO:360
  Self.SetStage(510) ; #DEBUG_LINE_NO:361
  Self.SetStage(550) ; #DEBUG_LINE_NO:362
  Self.SetStage(600) ; #DEBUG_LINE_NO:363
  Self.SetStage(610) ; #DEBUG_LINE_NO:364
  Self.SetStage(620) ; #DEBUG_LINE_NO:365
  Self.SetStage(622) ; #DEBUG_LINE_NO:366
  Self.SetStage(635) ; #DEBUG_LINE_NO:367
  Self.SetStage(660) ; #DEBUG_LINE_NO:368
  Self.SetStage(800) ; #DEBUG_LINE_NO:369
  Self.SetStage(900) ; #DEBUG_LINE_NO:370
  Self.SetStage(930) ; #DEBUG_LINE_NO:371
  Self.SetStage(950) ; #DEBUG_LINE_NO:372
  Self.SetStage(1000) ; #DEBUG_LINE_NO:373
  Self.SetStage(1060) ; #DEBUG_LINE_NO:374
  Self.SetStage(1090) ; #DEBUG_LINE_NO:375
  Self.SetStage(1100) ; #DEBUG_LINE_NO:376
  Self.SetStage(1110) ; #DEBUG_LINE_NO:377
  Self.SetStage(1150) ; #DEBUG_LINE_NO:378
  Self.SetStage(1200) ; #DEBUG_LINE_NO:379
  Game.GetPlayer().MoveTo(Alias_DaltonOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:381
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:382
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:390
  Self.SetStage(100) ; #DEBUG_LINE_NO:391
  Self.SetStage(105) ; #DEBUG_LINE_NO:392
  Self.SetStage(300) ; #DEBUG_LINE_NO:393
  Self.SetStage(399) ; #DEBUG_LINE_NO:394
  Self.SetStage(400) ; #DEBUG_LINE_NO:395
  Self.SetStage(450) ; #DEBUG_LINE_NO:396
  Self.SetStage(500) ; #DEBUG_LINE_NO:397
  Self.SetStage(510) ; #DEBUG_LINE_NO:398
  Self.SetStage(550) ; #DEBUG_LINE_NO:399
  Self.SetStage(600) ; #DEBUG_LINE_NO:400
  Self.SetStage(610) ; #DEBUG_LINE_NO:401
  Self.SetStage(620) ; #DEBUG_LINE_NO:402
  Self.SetStage(622) ; #DEBUG_LINE_NO:403
  Self.SetStage(635) ; #DEBUG_LINE_NO:404
  Self.SetStage(660) ; #DEBUG_LINE_NO:405
  Self.SetStage(800) ; #DEBUG_LINE_NO:406
  Self.SetStage(900) ; #DEBUG_LINE_NO:407
  Self.SetStage(930) ; #DEBUG_LINE_NO:408
  Self.SetStage(950) ; #DEBUG_LINE_NO:409
  Self.SetStage(1000) ; #DEBUG_LINE_NO:410
  Self.SetStage(1100) ; #DEBUG_LINE_NO:411
  Self.SetStage(1110) ; #DEBUG_LINE_NO:412
  Self.SetStage(1150) ; #DEBUG_LINE_NO:413
  Self.SetStage(1200) ; #DEBUG_LINE_NO:414
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:416
  Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:417
EndFunction

Function Fragment_Stage_0017_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:425
  Self.SetStage(100) ; #DEBUG_LINE_NO:426
  Self.SetStage(105) ; #DEBUG_LINE_NO:427
  Self.SetStage(300) ; #DEBUG_LINE_NO:428
  Self.SetStage(399) ; #DEBUG_LINE_NO:429
  Self.SetStage(400) ; #DEBUG_LINE_NO:430
  Self.SetStage(450) ; #DEBUG_LINE_NO:431
  Self.SetStage(500) ; #DEBUG_LINE_NO:432
  Self.SetStage(510) ; #DEBUG_LINE_NO:433
  Self.SetStage(550) ; #DEBUG_LINE_NO:434
  Self.SetStage(600) ; #DEBUG_LINE_NO:435
  Self.SetStage(610) ; #DEBUG_LINE_NO:436
  Self.SetStage(620) ; #DEBUG_LINE_NO:437
  Self.SetStage(622) ; #DEBUG_LINE_NO:438
  Self.SetStage(635) ; #DEBUG_LINE_NO:439
  Self.SetStage(660) ; #DEBUG_LINE_NO:440
  Self.SetStage(800) ; #DEBUG_LINE_NO:441
  Self.SetStage(900) ; #DEBUG_LINE_NO:442
  Self.SetStage(915) ; #DEBUG_LINE_NO:443
  Self.SetStage(950) ; #DEBUG_LINE_NO:444
  Self.SetStage(1000) ; #DEBUG_LINE_NO:445
  Self.SetStage(1100) ; #DEBUG_LINE_NO:446
  Self.SetStage(1110) ; #DEBUG_LINE_NO:447
  Self.SetStage(1150) ; #DEBUG_LINE_NO:448
  Self.SetStage(1200) ; #DEBUG_LINE_NO:449
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:451
  Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:452
EndFunction

Function Fragment_Stage_0018_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:460
  Self.SetStage(100) ; #DEBUG_LINE_NO:461
  Self.SetStage(105) ; #DEBUG_LINE_NO:462
  Self.SetStage(300) ; #DEBUG_LINE_NO:463
  Self.SetStage(399) ; #DEBUG_LINE_NO:464
  Self.SetStage(400) ; #DEBUG_LINE_NO:465
  Self.SetStage(450) ; #DEBUG_LINE_NO:466
  Self.SetStage(500) ; #DEBUG_LINE_NO:467
  Self.SetStage(510) ; #DEBUG_LINE_NO:468
  Self.SetStage(550) ; #DEBUG_LINE_NO:469
  Self.SetStage(600) ; #DEBUG_LINE_NO:470
  Self.SetStage(610) ; #DEBUG_LINE_NO:471
  Self.SetStage(620) ; #DEBUG_LINE_NO:472
  Self.SetStage(622) ; #DEBUG_LINE_NO:473
  Self.SetStage(635) ; #DEBUG_LINE_NO:474
  Self.SetStage(660) ; #DEBUG_LINE_NO:475
  Self.SetStage(800) ; #DEBUG_LINE_NO:476
  Self.SetStage(900) ; #DEBUG_LINE_NO:477
  Self.SetStage(915) ; #DEBUG_LINE_NO:478
  Self.SetStage(950) ; #DEBUG_LINE_NO:479
  Self.SetStage(1000) ; #DEBUG_LINE_NO:480
  Self.SetStage(1060) ; #DEBUG_LINE_NO:481
  Self.SetStage(1090) ; #DEBUG_LINE_NO:482
  Self.SetStage(1100) ; #DEBUG_LINE_NO:483
  Self.SetStage(1110) ; #DEBUG_LINE_NO:484
  Self.SetStage(1150) ; #DEBUG_LINE_NO:485
  Self.SetStage(1200) ; #DEBUG_LINE_NO:486
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:488
  Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:489
EndFunction

Function Fragment_Stage_0019_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:497
  Self.SetStage(100) ; #DEBUG_LINE_NO:498
  Self.SetStage(105) ; #DEBUG_LINE_NO:499
  Self.SetStage(300) ; #DEBUG_LINE_NO:500
  Self.SetStage(399) ; #DEBUG_LINE_NO:501
  Self.SetStage(400) ; #DEBUG_LINE_NO:502
  Self.SetStage(450) ; #DEBUG_LINE_NO:503
  Self.SetStage(500) ; #DEBUG_LINE_NO:504
  Self.SetStage(510) ; #DEBUG_LINE_NO:505
  Self.SetStage(550) ; #DEBUG_LINE_NO:506
  Self.SetStage(600) ; #DEBUG_LINE_NO:507
  Self.SetStage(610) ; #DEBUG_LINE_NO:508
  Self.SetStage(620) ; #DEBUG_LINE_NO:509
  Self.SetStage(622) ; #DEBUG_LINE_NO:510
  Self.SetStage(635) ; #DEBUG_LINE_NO:511
  Self.SetStage(660) ; #DEBUG_LINE_NO:512
  Self.SetStage(800) ; #DEBUG_LINE_NO:513
  Self.SetStage(900) ; #DEBUG_LINE_NO:514
  Self.SetStage(915) ; #DEBUG_LINE_NO:515
  Self.SetStage(950) ; #DEBUG_LINE_NO:516
  Self.SetStage(1000) ; #DEBUG_LINE_NO:517
  Self.SetStage(1050) ; #DEBUG_LINE_NO:518
  Self.SetStage(1090) ; #DEBUG_LINE_NO:519
  Self.SetStage(1100) ; #DEBUG_LINE_NO:520
  Self.SetStage(1110) ; #DEBUG_LINE_NO:521
  Self.SetStage(1150) ; #DEBUG_LINE_NO:522
  Self.SetStage(1200) ; #DEBUG_LINE_NO:523
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:525
  Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:526
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:534
  Self.SetStage(100) ; #DEBUG_LINE_NO:535
  Self.SetStage(105) ; #DEBUG_LINE_NO:536
  Self.SetStage(300) ; #DEBUG_LINE_NO:537
  Self.SetStage(399) ; #DEBUG_LINE_NO:538
  Self.SetStage(400) ; #DEBUG_LINE_NO:539
  Self.SetStage(450) ; #DEBUG_LINE_NO:540
  Self.SetStage(500) ; #DEBUG_LINE_NO:541
  Self.SetStage(510) ; #DEBUG_LINE_NO:542
  Self.SetStage(550) ; #DEBUG_LINE_NO:543
  Self.SetStage(600) ; #DEBUG_LINE_NO:544
  Self.SetStage(610) ; #DEBUG_LINE_NO:545
  Self.SetStage(620) ; #DEBUG_LINE_NO:546
  Self.SetStage(622) ; #DEBUG_LINE_NO:547
  Self.SetStage(635) ; #DEBUG_LINE_NO:548
  Self.SetStage(660) ; #DEBUG_LINE_NO:549
  Self.SetStage(800) ; #DEBUG_LINE_NO:550
  Self.SetStage(900) ; #DEBUG_LINE_NO:551
  Self.SetStage(915) ; #DEBUG_LINE_NO:552
  Self.SetStage(950) ; #DEBUG_LINE_NO:553
  Self.SetStage(1000) ; #DEBUG_LINE_NO:554
  Self.SetStage(1060) ; #DEBUG_LINE_NO:555
  Self.SetStage(1070) ; #DEBUG_LINE_NO:556
  Self.SetStage(1090) ; #DEBUG_LINE_NO:557
  Self.SetStage(1100) ; #DEBUG_LINE_NO:558
  Self.SetStage(1110) ; #DEBUG_LINE_NO:559
  Self.SetStage(1150) ; #DEBUG_LINE_NO:560
  Self.SetStage(1200) ; #DEBUG_LINE_NO:561
  Game.GetPlayer().AddItem(RI05_ImogeneEvidenceSlate as Form, 1, False) ; #DEBUG_LINE_NO:563
  Game.GetPlayer().MoveTo(Alias_YukoReturnQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:564
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:572
  Self.SetStage(400) ; #DEBUG_LINE_NO:573
  Self.SetStage(600) ; #DEBUG_LINE_NO:574
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:576
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:577
  Game.GetPlayer().MoveTo(Alias_FrankiesQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:578
EndFunction

Function Fragment_Stage_0072_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:586
  Self.SetStage(100) ; #DEBUG_LINE_NO:587
  Self.SetStage(105) ; #DEBUG_LINE_NO:588
  Self.SetStage(300) ; #DEBUG_LINE_NO:589
  Self.SetStage(399) ; #DEBUG_LINE_NO:590
  Self.SetStage(400) ; #DEBUG_LINE_NO:591
  Self.SetStage(450) ; #DEBUG_LINE_NO:592
  Self.SetStage(500) ; #DEBUG_LINE_NO:593
  Self.SetStage(503) ; #DEBUG_LINE_NO:594
  Self.SetStage(550) ; #DEBUG_LINE_NO:595
  Self.SetStage(600) ; #DEBUG_LINE_NO:596
  Self.SetStage(610) ; #DEBUG_LINE_NO:597
  Self.SetStage(620) ; #DEBUG_LINE_NO:598
  Self.SetStage(622) ; #DEBUG_LINE_NO:599
  Self.SetStage(635) ; #DEBUG_LINE_NO:600
  Alias_Imogene.GetRef().MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:602
  Alias_Imogene.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:603
  Game.GetPlayer().MoveTo(Alias_SeokguhQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:604
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:613
  Actor ImogeneRef = Alias_Imogene.GetActorRef() ; #DEBUG_LINE_NO:614
  ImogeneRef.RemoveFromFaction(RyujinIndustriesFaction) ; #DEBUG_LINE_NO:616
  ImogeneRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:617
  ImogeneRef.MoveTo(Alias_ImogeneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:618
  ImogeneRef.SetEssential(False) ; #DEBUG_LINE_NO:619
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:620
  Alias_YukoDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:621
  Alias_YukoDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:622
  Alias_Yuko.GetRef().MoveTo(Alias_YukoStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:623
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:624
  Alias_ImogeneOfficeDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:625
  Alias_Frankie.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:626
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:628
EndFunction

Function Fragment_Stage_0101_Item_00()
  Alias_YukoDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:636
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:637
EndFunction

Function Fragment_Stage_0105_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:645
    Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:646
    RI05_0100_Yuko_PlayerAddressScene.Start() ; #DEBUG_LINE_NO:647
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  If !Self.GetStageDone(105) && !Self.GetStageDone(300) ; #DEBUG_LINE_NO:656
    Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:657
    RI05_0100_Yuko_PlayerAddressScene.Start() ; #DEBUG_LINE_NO:658
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:667
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:668
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:676
  If !Self.GetStageDone(350) ; #DEBUG_LINE_NO:678
    Self.SetStage(400) ; #DEBUG_LINE_NO:679
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(500) ; #DEBUG_LINE_NO:681
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:684
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:692
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:700
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:701
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:709
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:710
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:712
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:713
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_01()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:722
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:723
EndFunction

Function Fragment_Stage_0503_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:731
  RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:732
EndFunction

Function Fragment_Stage_0504_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:740
  RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:741
EndFunction

Function Fragment_Stage_0505_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:749
  RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:750
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(540) ; #DEBUG_LINE_NO:758
EndFunction

Function Fragment_Stage_0520_Item_00()
  RI05_Track_BayuFavorRefused.SetValue(1.0) ; #DEBUG_LINE_NO:766
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:767
EndFunction

Function Fragment_Stage_0525_Item_00()
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:775
  Self.SetStage(550) ; #DEBUG_LINE_NO:776
EndFunction

Function Fragment_Stage_0530_Item_00()
  RI05_Track_BayuBypassed.SetValue(1.0) ; #DEBUG_LINE_NO:784
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:785
EndFunction

Function Fragment_Stage_0540_Item_00()
  LC115.SetStage(20) ; #DEBUG_LINE_NO:794
  Alias_EnableFriendlyAddsMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:795
  DialogueFCSeokguhSyndicateHideout_RI05.Start() ; #DEBUG_LINE_NO:798
  Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:801
  Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:802
  Self.SetStage(550) ; #DEBUG_LINE_NO:803
  Self.SetStage(980) ; #DEBUG_LINE_NO:804
EndFunction

Function Fragment_Stage_0550_Item_00()
  If Self.GetStageDone(510) ; #DEBUG_LINE_NO:812
    Self.SetStage(610) ; #DEBUG_LINE_NO:813
    RI05_0550_Compantion_ReactToDoingBayuFavorScene.Start() ; #DEBUG_LINE_NO:814
  ElseIf Self.GetStageDone(520) ; #DEBUG_LINE_NO:815
    RI05_0550_Companion_ReactToRejectingBayuScene.Start() ; #DEBUG_LINE_NO:816
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:818
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:819
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:820
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(505) || Self.GetStageDone(504) || Self.GetStageDone(503) ; #DEBUG_LINE_NO:822
    Self.SetStage(610) ; #DEBUG_LINE_NO:823
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayedAtTop(600) ; #DEBUG_LINE_NO:832
  LC115SeokguhHideout.Reset() ; #DEBUG_LINE_NO:834
  LC115Location.Reset() ; #DEBUG_LINE_NO:835
  LC115.SetStage(0) ; #DEBUG_LINE_NO:836
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:844
  Self.SetObjectiveDisplayed(610, True, False) ; #DEBUG_LINE_NO:845
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:853
  Self.SetObjectiveDisplayed(620, True, False) ; #DEBUG_LINE_NO:854
  Alias_Frankie.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:855
EndFunction

Function Fragment_Stage_0622_Item_00()
  Self.SetStage(635) ; #DEBUG_LINE_NO:863
  Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:864
EndFunction

Function Fragment_Stage_0625_Item_00()
  If Game.GetPlayer().GetItemCount(RI05_SeokguhSyndicateHideoutKey as Form) == 0 ; #DEBUG_LINE_NO:872
    RI05_0600_Frankie_ForceGreetScene.Start() ; #DEBUG_LINE_NO:873
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetStage(650) ; #DEBUG_LINE_NO:882
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:883
  Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:884
EndFunction

Function Fragment_Stage_0635_Item_00()
  Alias_FrankiesDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:892
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:893
  Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:894
  Alias_Frankie.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:895
EndFunction

Function Fragment_Stage_0645_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RI05_Frankie_LargeCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:903
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:911
EndFunction

Function Fragment_Stage_0651_Item_00()
  If Self.IsObjectiveDisplayed(620) ; #DEBUG_LINE_NO:919
    Self.SetObjectiveDisplayed(620, False, False) ; #DEBUG_LINE_NO:920
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(650) ; #DEBUG_LINE_NO:922
    Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:923
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveDisplayed(620, False, False) ; #DEBUG_LINE_NO:932
  Alias_Frankie.Clear() ; #DEBUG_LINE_NO:933
  DialogueFCNeon.SetStage(700) ; #DEBUG_LINE_NO:934
EndFunction

Function Fragment_Stage_0660_Item_00()
  If !Self.GetStageDone(550) ; #DEBUG_LINE_NO:943
    RI05_Track_BayuBypassed.SetValue(1.0) ; #DEBUG_LINE_NO:944
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:949
    Self.SetObjectiveDisplayedAtTop(660) ; #DEBUG_LINE_NO:950
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(510) ; #DEBUG_LINE_NO:952
    Self.SetStage(700) ; #DEBUG_LINE_NO:953
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:957
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:958
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:960
    Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:961
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(650) ; #DEBUG_LINE_NO:966
    Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:967
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:970
  Self.SetObjectiveDisplayed(660, True, False) ; #DEBUG_LINE_NO:971
  Self.SetStage(980) ; #DEBUG_LINE_NO:973
EndFunction

Function Fragment_Stage_0670_Item_00()
  RI05_0800_Imogene_PlayerAddressScene.Start() ; #DEBUG_LINE_NO:981
EndFunction

Function Fragment_Stage_0680_Item_00()
  Alias_SyndicateGuard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:989
EndFunction

Function Fragment_Stage_0686_Item_00()
  Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:997
  LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:998
EndFunction

Function Fragment_Stage_0690_Item_00()
  Alias_SyndicateGuard02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1006
EndFunction

Function Fragment_Stage_0696_Item_00()
  Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:1014
  LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:1015
EndFunction

Function Fragment_Stage_0699_Item_00()
  LC115.SetStage(10) ; #DEBUG_LINE_NO:1023
  Alias_SyndicateGuard01.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:1024
  Alias_SyndicateGuard02.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:1025
  LC115SeokguhTrespassFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:1026
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:1034
  Alias_Kumiho.GetRef().Enable(False) ; #DEBUG_LINE_NO:1037
  Alias_KumihoSlate.GetRef().Enable(False) ; #DEBUG_LINE_NO:1038
EndFunction

Function Fragment_Stage_0750_Item_00()
  Alias_Kumiho.Clear() ; #DEBUG_LINE_NO:1046
EndFunction

Function Fragment_Stage_0799_Item_00()
  If Self.GetStageDone(925) || Self.GetStageDone(950) ; #DEBUG_LINE_NO:1054
    Self.SetStage(1100) ; #DEBUG_LINE_NO:1055
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:1058
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:1067
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:1068
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:1070
    Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:1071
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:1073
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:1074
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:1076
    Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:1077
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(660) ; #DEBUG_LINE_NO:1079
    Self.SetObjectiveCompleted(660, True) ; #DEBUG_LINE_NO:1080
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayedAtTop(800) ; #DEBUG_LINE_NO:1083
EndFunction

Function Fragment_Stage_0800_Item_01()
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:1092
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:1093
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:1095
    Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:1096
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:1098
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:1099
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:1101
    Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:1102
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(660) ; #DEBUG_LINE_NO:1104
    Self.SetObjectiveCompleted(660, True) ; #DEBUG_LINE_NO:1105
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayedAtTop(800) ; #DEBUG_LINE_NO:1108
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:1116
  Self.SetObjectiveDisplayedAtTop(900) ; #DEBUG_LINE_NO:1117
EndFunction

Function Fragment_Stage_0900_Item_01()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:1125
  Self.SetObjectiveDisplayedAtTop(900) ; #DEBUG_LINE_NO:1126
EndFunction

Function Fragment_Stage_0910_Item_00()
  If !Self.GetStageDone(805) ; #DEBUG_LINE_NO:1134
    Self.SetStage(810) ; #DEBUG_LINE_NO:1135
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(911) ; #DEBUG_LINE_NO:1138
  Self.SetStage(960) ; #DEBUG_LINE_NO:1139
EndFunction

Function Fragment_Stage_0911_Item_00()
  Actor ImogeneRef = Alias_Imogene.GetActorRef() ; #DEBUG_LINE_NO:1148
  ImogeneRef.RemoveFromFaction(RyujinIndustriesFaction) ; #DEBUG_LINE_NO:1150
  ImogeneRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:1151
  ImogeneRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:1152
  ImogeneRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:1153
  ImogeneRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1154
  If !Self.GetStageDone(950) ; #DEBUG_LINE_NO:1156
    Self.SetStage(960) ; #DEBUG_LINE_NO:1157
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0915_Item_00()
  If Self.IsObjectiveDisplayed(660) ; #DEBUG_LINE_NO:1166
    Self.SetObjectiveCompleted(660, True) ; #DEBUG_LINE_NO:1167
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(960) ; #DEBUG_LINE_NO:1169
    Self.SetObjectiveCompleted(960, True) ; #DEBUG_LINE_NO:1170
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:1172
    Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1173
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(800) ; #DEBUG_LINE_NO:1176
    Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:1177
  EndIf ; #DEBUG_LINE_NO:
  RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:1180
  If Self.GetStageDone(930) ; #DEBUG_LINE_NO:1182
    Self.SetStage(970) ; #DEBUG_LINE_NO:1183
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(965) ; #DEBUG_LINE_NO:1185
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:1188
  RI05_0915_Companion_PlayerKilledImogeneScene.Start() ; #DEBUG_LINE_NO:1189
  Alias_Imogene.Clear() ; #DEBUG_LINE_NO:1190
EndFunction

Function Fragment_Stage_0920_Item_00()
  RI05_Track_ImogeneSpared.SetValue(1.0) ; #DEBUG_LINE_NO:1198
  Game.GetPlayer().AddItem(Credits as Form, RI05_Imogene_Credits.GetValueInt(), False) ; #DEBUG_LINE_NO:1199
  Self.SetStage(950) ; #DEBUG_LINE_NO:1200
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:1202
  RI05_930_Companion_PlayerLetImogeneLiveScene.Start() ; #DEBUG_LINE_NO:1203
EndFunction

Function Fragment_Stage_0925_Item_00()
  If Self.IsObjectiveDisplayed(965) ; #DEBUG_LINE_NO:1211
    Self.SetObjectiveCompleted(965, True) ; #DEBUG_LINE_NO:1212
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:1215
    Self.SetStage(1200) ; #DEBUG_LINE_NO:1216
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(799) ; #DEBUG_LINE_NO:1219
    Self.SetStage(1100) ; #DEBUG_LINE_NO:1220
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(990) ; #DEBUG_LINE_NO:1222
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0930_Item_00()
  RI05_Track_ImogeneSpared.SetValue(1.0) ; #DEBUG_LINE_NO:1231
  Self.SetStage(950) ; #DEBUG_LINE_NO:1232
  RI05_930_Companion_PlayerLetImogeneLiveScene.Start() ; #DEBUG_LINE_NO:1234
EndFunction

Function Fragment_Stage_0950_Item_00()
  Game.GetPlayer().AddItem(Alias_ImogeneEvidenceSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:1242
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:1243
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1244
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:1246
    Self.SetStage(1200) ; #DEBUG_LINE_NO:1247
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(799) ; #DEBUG_LINE_NO:1250
    Self.SetStage(1100) ; #DEBUG_LINE_NO:1251
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(990) ; #DEBUG_LINE_NO:1253
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0960_Item_00()
  If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:1262
    Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1263
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayedAtTop(960) ; #DEBUG_LINE_NO:1265
EndFunction

Function Fragment_Stage_0960_Item_01()
  If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:1273
    Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:1274
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayedAtTop(960) ; #DEBUG_LINE_NO:1276
EndFunction

Function Fragment_Stage_0965_Item_00()
  Self.SetObjectiveDisplayedAtTop(965) ; #DEBUG_LINE_NO:1284
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:1292
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:1293
    Self.SetObjectiveDisplayed(1000, False, False) ; #DEBUG_LINE_NO:1294
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(1300) ; #DEBUG_LINE_NO:1296
    Self.SetObjectiveDisplayed(1300, False, False) ; #DEBUG_LINE_NO:1297
  EndIf ; #DEBUG_LINE_NO:
  LC115.SetStage(10) ; #DEBUG_LINE_NO:1300
  Alias_EnableFriendlyAddsMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:1301
  Game.GetPlayer().RemoveFromFaction(LC115SeokguhFaction) ; #DEBUG_LINE_NO:1304
  RI06.SetStage(100) ; #DEBUG_LINE_NO:1306
  Game.AddAchievement(18) ; #DEBUG_LINE_NO:1309
  If RI05_Track_PlayerSidedWithUlaru.GetValue() == 0.0 && RI05_Track_PlayerSidedWithMasako.GetValue() == 0.0 ; #DEBUG_LINE_NO:1311
    RI05_Track_PlayerSidedWithMasako.SetValue(1.0) ; #DEBUG_LINE_NO:1312
  EndIf ; #DEBUG_LINE_NO:
  Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:1315
  Alias_UlaruChairSwapEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:1316
  Self.Stop() ; #DEBUG_LINE_NO:1318
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_UlaruChairSwapEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:1326
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1327
  Alias_Ularu.GetRef().AddKeyword(Artifact_GravImmune) ; #DEBUG_LINE_NO:1328
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:1329
  Alias_UlaruDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:1332
  Alias_UlaruDoor.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:1333
EndFunction

Function Fragment_Stage_1001_Item_00()
  ObjectReference UlaruDoorRef = Alias_UlaruDoor.GetRef() ; #DEBUG_LINE_NO:1341
  UlaruDoorRef.SetOpen(False) ; #DEBUG_LINE_NO:1343
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:1344
  UlaruDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:1345
  UlaruDoorRef.SetLockLevel(255) ; #DEBUG_LINE_NO:1346
  UlaruDoorRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:1347
EndFunction

Function Fragment_Stage_1006_Item_00()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:1355
EndFunction

Function Fragment_Stage_1040_Item_00()
  Game.GetPlayer().SetValue(RI07_Foreknowledge_ImogeneInnocentAV, 1.0) ; #DEBUG_LINE_NO:1363
EndFunction

Function Fragment_Stage_1050_Item_00()
  RI05_Track_PlayerSidedWithUlaru.SetValue(1.0) ; #DEBUG_LINE_NO:1371
  Self.SetStage(1090) ; #DEBUG_LINE_NO:1372
EndFunction

Function Fragment_Stage_1055_Item_00()
  Game.GetPlayer().RemoveItem(RI05_ImogeneEvidenceSlate as Form, 1, False, None) ; #DEBUG_LINE_NO:1380
EndFunction

Function Fragment_Stage_1060_Item_00()
  RI05_Track_PlayerSidedWithMasako.SetValue(1.0) ; #DEBUG_LINE_NO:1388
  Self.SetStage(1090) ; #DEBUG_LINE_NO:1389
EndFunction

Function Fragment_Stage_1065_Item_00()
  Actor UlaruRef = Alias_Ularu.GetActorRef() ; #DEBUG_LINE_NO:1397
  UlaruRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:1399
  UlaruRef.RemoveFromFaction(RyujinIndustriesFaction) ; #DEBUG_LINE_NO:1400
  UlaruRef.RemoveFromFaction(LC044RyujinGuardCrimeFaction) ; #DEBUG_LINE_NO:1401
  UlaruRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:1402
  UlaruRef.SetEssential(False) ; #DEBUG_LINE_NO:1403
  UlaruRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:1404
  UlaruRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:1405
  UlaruRef.RemoveKeyword(Artifact_GravImmune) ; #DEBUG_LINE_NO:1406
EndFunction

Function Fragment_Stage_1070_Item_00()
  RI05_UlaruDead.SetValue(1.0) ; #DEBUG_LINE_NO:1414
  Alias_Maeve.GetRef().MoveTo(Alias_MaeveSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1415
  Alias_MaeveGuard.GetRef().MoveTo(Alias_MaeveGuardFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1416
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:1417
  Alias_Ularu.Clear() ; #DEBUG_LINE_NO:1418
  Alias_UlaruDoor.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:1419
EndFunction

Function Fragment_Stage_1081_Item_00()
  Alias_Maeve.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1427
EndFunction

Function Fragment_Stage_1090_Item_00()
  If !Self.GetStageDone(1065) ; #DEBUG_LINE_NO:1435
    Alias_UlaruDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:1436
    Alias_UlaruDoor.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:1437
    Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:1438
  EndIf ; #DEBUG_LINE_NO:
  Alias_Ularu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1441
  Alias_Ularu.GetRef().RemoveKeyword(Artifact_GravImmune) ; #DEBUG_LINE_NO:1442
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:1450
  Self.SetObjectiveDisplayedAtTop(1100) ; #DEBUG_LINE_NO:1451
EndFunction

Function Fragment_Stage_1110_Item_00()
  Game.GetPlayer().RemoveItem(RI05_KumihoSlate as Form, 1, False, None) ; #DEBUG_LINE_NO:1459
  Self.SetStage(1150) ; #DEBUG_LINE_NO:1460
  RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:1461
EndFunction

Function Fragment_Stage_1120_Item_00()
  Self.SetStage(1150) ; #DEBUG_LINE_NO:1469
  RI05_Track_BayuPlayerKeptSlate.SetValue(1.0) ; #DEBUG_LINE_NO:1470
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:1471
EndFunction

Function Fragment_Stage_1130_Item_00()
  Actor PlayerActor = Game.GetPlayer() ; #DEBUG_LINE_NO:1479
  PlayerActor.RemoveItem(RI05_KumihoSlate as Form, 1, False, None) ; #DEBUG_LINE_NO:1481
  PlayerActor.AddItem(Credits as Form, RI05_Bayu_Credits.GetValueInt(), False) ; #DEBUG_LINE_NO:1482
  RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:1484
  Self.SetStage(1150) ; #DEBUG_LINE_NO:1485
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:1493
  Self.SetStage(1200) ; #DEBUG_LINE_NO:1494
  RI05_1150_Companion_RespondToBayuDecisionScene.Start() ; #DEBUG_LINE_NO:1496
  If RI05_Track_BayuDispleased.GetValue() == -1.0 ; #DEBUG_LINE_NO:1497
    RI05_Track_BayuDispleased.SetValue(0.0) ; #DEBUG_LINE_NO:1498
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveDisplayedAtTop(1200) ; #DEBUG_LINE_NO:1507
  Self.SetStage(1000) ; #DEBUG_LINE_NO:1508
  Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:1509
  YukoRef.MoveTo(Alias_YukoReturnStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1510
  YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:1511
EndFunction

Function Fragment_Stage_1230_Item_00()
  Game.GetPlayer().RemoveItem(RI05_ImogeneEvidenceSlate as Form, 1, False, None) ; #DEBUG_LINE_NO:1519
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:1527
EndFunction

Function Fragment_Stage_1305_Item_00()
  Self.SetStage(1300) ; #DEBUG_LINE_NO:1535
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1536
EndFunction

Function Fragment_Stage_1350_Item_00()
  Self.SetStage(1390) ; #DEBUG_LINE_NO:1544
EndFunction

Function Fragment_Stage_1390_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:1552
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1553
EndFunction
