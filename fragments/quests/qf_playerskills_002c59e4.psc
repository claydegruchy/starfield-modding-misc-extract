ScriptName Fragments:Quests:QF_PlayerSkills_002C59E4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
ActorValue Property CarryWeight Auto Const mandatory
ActorValue Property Oxygen Auto Const mandatory
Int Property WellnessBonus Auto Const mandatory
Int Property FitnessBonus Auto Const mandatory
Int Property WeightLiftingBonus Auto Const mandatory
Int Property BotanyBonus Auto Const mandatory
Int Property GeologyBonus Auto Const mandatory
ActorValue Property ScanningPowerLevel Auto Const mandatory
ActorValue Property ZoologyRank Auto Const mandatory
ActorValue Property BotanyRank Auto Const mandatory
GlobalVariable Property Outpost_BuildLimit_CrewStations Auto Const
Int Property OutpostManagementBonus = 1 Auto Const
GlobalVariable Property Outpost_BuildLimit_CargoLinks Auto Const
Int Property OutpostManagementCargoLinksBonus Auto Const
ActorValue Property OutpostMaxDeployed Auto Const
Int Property OutpostMaxDeployedBonus = 20 Auto Const
ActorValue Property PayloadLevel Auto Const
ActorValue Property SecurityMenuRingHighlightingEnabled Auto Const mandatory
ActorValue Property SecurityMenuDisableUnusedKeysOptionEnabled Auto Const mandatory
ActorValue Property SecurityMenuAutoattemptPointsMultiplier Auto Const mandatory
ActorValue Property SecurityMenuMaxAutoattemptPoints Auto Const mandatory
GlobalVariable Property Outpost_BuildLimit_Robots Auto Const
ActorValue Property GalaxyBodyScanAbility Auto Const mandatory
ActorValue Property SurveyingPowerLevel Auto Const mandatory
ActorValue Property SurveyingTraitBonus Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_Cheap Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_Expensive Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_Cheap Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_Expensive Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_CheapBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeHighImportance_ExpensiveBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_CheapBase Auto Const mandatory
GlobalVariable Property SpeechChallengeBribeLowImportance_ExpensiveBase Auto Const mandatory
GlobalVariable Property FloraPlantRareMin Auto Const mandatory
GlobalVariable Property FloraMineralRareMin Auto Const mandatory
GlobalVariable Property Ships_Piracy_Low Auto Const mandatory
GlobalVariable Property Ships_Piracy_High Auto Const mandatory
GlobalVariable Property Ships_Piracy_High_Base Auto Const mandatory
GlobalVariable Property Ships_Piracy_Low_Base Auto Const mandatory
GlobalVariable Property Skill_Astrophysics_DiscoverTraitChance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0501_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0502_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0503_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0101_Item_00()
  Game.GetPlayer().ModValue(Oxygen, FitnessBonus as Float) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0102_Item_00()
  Game.GetPlayer().ModValue(Oxygen, FitnessBonus as Float) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0103_Item_00()
  Game.GetPlayer().ModValue(Oxygen, FitnessBonus as Float) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0201_Item_00()
  Game.GetPlayer().SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0202_Item_00()
  Self.SetStage(201) ; #DEBUG_LINE_NO:41
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:43
  player.SetValue(SecurityMenuRingHighlightingEnabled, 1.0) ; #DEBUG_LINE_NO:44
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0203_Item_00()
  Self.SetStage(202) ; #DEBUG_LINE_NO:55
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:57
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0204_Item_00()
  Self.SetStage(203) ; #DEBUG_LINE_NO:69
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:71
  player.SetValue(SecurityMenuAutoattemptPointsMultiplier, 2.0) ; #DEBUG_LINE_NO:72
  player.SetValue(SecurityMenuDisableUnusedKeysOptionEnabled, 1.0) ; #DEBUG_LINE_NO:73
  player.SetValue(SecurityMenuMaxAutoattemptPoints, Game.GetPlayer().GetValue(SecurityMenuMaxAutoattemptPoints) + 1.0) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0301_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0302_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0303_Item_00()
  Game.GetPlayer().ModValue(Health, WellnessBonus as Float) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0304_Item_00()
  Game.GetPlayer().ModValue(Health, (WellnessBonus * 2) as Float) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0401_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 1.0) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0402_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 2.0) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0403_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 3.0) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0404_Item_00()
  Game.GetPlayer().SetValue(BotanyRank, 4.0) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0601_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 1.0) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0602_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 2.0) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0603_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 3.0) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0604_Item_00()
  Game.GetPlayer().SetValue(ScanningPowerLevel, 4.0) ; #DEBUG_LINE_NO:195
EndFunction

Function Fragment_Stage_0701_Item_00()
  Outpost_BuildLimit_CargoLinks.Mod(OutpostManagementCargoLinksBonus as Float) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0702_Item_00()
  Outpost_BuildLimit_Robots.Mod(OutpostManagementBonus as Float) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_0703_Item_00()
  Outpost_BuildLimit_CrewStations.Mod(OutpostManagementBonus as Float) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0801_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 1.0) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0802_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 2.0) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_0803_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 3.0) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0804_Item_00()
  Game.GetPlayer().SetValue(ZoologyRank, 4.0) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0901_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 12.0) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_0902_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 16.0) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0903_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 20.0) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0904_Item_00()
  Game.GetPlayer().SetValue(OutpostMaxDeployed, 24.0) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_1101_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 1.0) ; #DEBUG_LINE_NO:291
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(10) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_1102_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 2.0) ; #DEBUG_LINE_NO:300
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(20) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_1103_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0) ; #DEBUG_LINE_NO:309
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(30) ; #DEBUG_LINE_NO:310
EndFunction

Function Fragment_Stage_1104_Item_00()
  Game.GetPlayer().SetValue(GalaxyBodyScanAbility, 3.0) ; #DEBUG_LINE_NO:318
  Skill_Astrophysics_DiscoverTraitChance.SetValueInt(50) ; #DEBUG_LINE_NO:319
EndFunction

Function Fragment_Stage_1201_Item_00()
  Game.GetPlayer().SetValue(SurveyingPowerLevel, 1.0) ; #DEBUG_LINE_NO:327
EndFunction

Function Fragment_Stage_1202_Item_00()
  Game.GetPlayer().SetValue(SurveyingPowerLevel, 2.0) ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_1203_Item_00()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:343
  playerRef.SetValue(SurveyingPowerLevel, 3.0) ; #DEBUG_LINE_NO:344
  playerRef.SetValue(SurveyingTraitBonus, 1.0) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_1204_Item_00()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:353
  playerRef.SetValue(SurveyingPowerLevel, 4.0) ; #DEBUG_LINE_NO:354
  playerRef.SetValue(SurveyingTraitBonus, 2.0) ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_1302_Item_00()
  Float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue() ; #DEBUG_LINE_NO:363
  Float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue() ; #DEBUG_LINE_NO:364
  Float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue() ; #DEBUG_LINE_NO:365
  Float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue() ; #DEBUG_LINE_NO:366
  Float costMult = 0.75 ; #DEBUG_LINE_NO:367
  SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive * costMult) as Int) ; #DEBUG_LINE_NO:369
  SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive * costMult) as Int) ; #DEBUG_LINE_NO:370
  SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap * costMult) as Int) ; #DEBUG_LINE_NO:371
  SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap * costMult) as Int) ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_1303_Item_00()
  Float bribeLowExpensive = SpeechChallengeBribeLowImportance_ExpensiveBase.GetValue() ; #DEBUG_LINE_NO:380
  Float bribeHighExpensive = SpeechChallengeBribeHighImportance_ExpensiveBase.GetValue() ; #DEBUG_LINE_NO:381
  Float bribeLowCheap = SpeechChallengeBribeLowImportance_CheapBase.GetValue() ; #DEBUG_LINE_NO:382
  Float bribeHighCheap = SpeechChallengeBribeHighImportance_CheapBase.GetValue() ; #DEBUG_LINE_NO:383
  Float costMult = 0.5 ; #DEBUG_LINE_NO:384
  SpeechChallengeBribeLowImportance_Expensive.SetValueInt((bribeLowExpensive * costMult) as Int) ; #DEBUG_LINE_NO:386
  SpeechChallengeBribeHighImportance_Expensive.SetValueInt((bribeHighExpensive * costMult) as Int) ; #DEBUG_LINE_NO:387
  SpeechChallengeBribeLowImportance_Cheap.SetValueInt((bribeLowCheap * costMult) as Int) ; #DEBUG_LINE_NO:388
  SpeechChallengeBribeHighImportance_Cheap.SetValueInt((bribeHighCheap * costMult) as Int) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_1401_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 1.0) ; #DEBUG_LINE_NO:397
  Float piracyLow = Ships_Piracy_Low_Base.GetValue() ; #DEBUG_LINE_NO:399
  Float piracyHigh = Ships_Piracy_High_Base.GetValue() ; #DEBUG_LINE_NO:400
  Float piracyMult = 1.100000024 ; #DEBUG_LINE_NO:403
  Float piracyLowNew = piracyLow * piracyMult ; #DEBUG_LINE_NO:405
  Ships_Piracy_Low.SetValue(piracyLowNew) ; #DEBUG_LINE_NO:406
  Float piracyHighNew = piracyHigh * piracyMult ; #DEBUG_LINE_NO:408
  Ships_Piracy_High.SetValue(piracyHighNew) ; #DEBUG_LINE_NO:409
EndFunction

Function Fragment_Stage_1402_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 2.0) ; #DEBUG_LINE_NO:417
  Float piracyLow = Ships_Piracy_Low_Base.GetValue() ; #DEBUG_LINE_NO:419
  Float piracyHigh = Ships_Piracy_High_Base.GetValue() ; #DEBUG_LINE_NO:420
  Float piracyMult = 1.200000048 ; #DEBUG_LINE_NO:423
  Float piracyLowNew = piracyLow * piracyMult ; #DEBUG_LINE_NO:425
  Ships_Piracy_Low.SetValue(piracyLowNew) ; #DEBUG_LINE_NO:426
  Float piracyHighNew = piracyHigh * piracyMult ; #DEBUG_LINE_NO:428
  Ships_Piracy_High.SetValue(piracyHighNew) ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_1403_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 3.0) ; #DEBUG_LINE_NO:437
  Float piracyLow = Ships_Piracy_Low_Base.GetValue() ; #DEBUG_LINE_NO:439
  Float piracyHigh = Ships_Piracy_High_Base.GetValue() ; #DEBUG_LINE_NO:440
  Float piracyMult = 1.299999952 ; #DEBUG_LINE_NO:443
  Float piracyLowNew = piracyLow * piracyMult ; #DEBUG_LINE_NO:445
  Ships_Piracy_Low.SetValue(piracyLowNew) ; #DEBUG_LINE_NO:446
  Float piracyHighNew = piracyHigh * piracyMult ; #DEBUG_LINE_NO:448
  Ships_Piracy_High.SetValue(piracyHighNew) ; #DEBUG_LINE_NO:449
EndFunction

Function Fragment_Stage_1404_Item_00()
  Game.GetPlayer().SetValue(PayloadLevel, 4.0) ; #DEBUG_LINE_NO:457
  Float piracyLow = Ships_Piracy_Low_Base.GetValue() ; #DEBUG_LINE_NO:459
  Float piracyHigh = Ships_Piracy_High_Base.GetValue() ; #DEBUG_LINE_NO:460
  Float piracyMult = 1.5 ; #DEBUG_LINE_NO:463
  Float piracyLowNew = piracyLow * piracyMult ; #DEBUG_LINE_NO:465
  Ships_Piracy_Low.SetValue(piracyLowNew) ; #DEBUG_LINE_NO:466
  Float piracyHighNew = piracyHigh * piracyMult ; #DEBUG_LINE_NO:468
  Ships_Piracy_High.SetValue(piracyHighNew) ; #DEBUG_LINE_NO:469
EndFunction
