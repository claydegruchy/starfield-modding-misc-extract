ScriptName Fragments:Quests:QF_LC088_Space_0021E73C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Key Auto Const mandatory
LocationAlias Property KeyLocation Auto Const mandatory
LocationAlias Property KeySpaceCellLocation Auto Const mandatory
LocationAlias Property DBAlphaSpaceCellLocation Auto Const mandatory
LocationAlias Property DBBetaSpaceCellLocation Auto Const mandatory
LocationAlias Property DBGammaSpaceCellLocation Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
LocationAlias Property VigilanceSpaceCellLocation Auto Const mandatory
LocationAlias Property Alias_SuvorovSurfaceLocation Auto Const mandatory
LocationAlias Property Alias_SuvorovOrbitLocation Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_RokovShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_MathisShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_NaevaShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_AdlerShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_HuanShip Auto Const mandatory
ReferenceAlias Property Alias_CF_Captain_EstelleShip Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlpha Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBeta Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGamma Auto Const mandatory
ReferenceAlias Property Alias_KeyMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlphaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBetaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGammaMapMarker Auto Const mandatory
ReferenceAlias Property Alias_VigilanceMapMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryAlphaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryBetaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_DefensiveBatteryGammaProjectileSourceMarker Auto Const mandatory
ReferenceAlias Property Alias_VigilanceArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyMapMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_KeyPlanetArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyOriginMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyBehindCFLinesMarker Auto Const mandatory
ReferenceAlias Property Alias_KeySDArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Mines_Alpha_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_SD_Mines_Alpha_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyTurretsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_MainBattleAnnouncementMarker Auto Const mandatory
ReferenceAlias Property Alias_KeyDistantArrivalMarker Auto Const mandatory
ReferenceAlias Property Alias_SD_BriefingQuickstartMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_BriefingQuickstartMarker Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_CF_Allies_Main Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_All Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Main Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_All Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Skirmish Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Alpha Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Beta Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Gamma Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Main Auto Const mandatory
RefCollectionAlias Property Alias_CF_Captains_All Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_1 Auto Const mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_2 Auto Const mandatory
RefCollectionAlias Property Alias_SD_Allies_Main_SysDefFleet Auto Const
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_1 Auto Const mandatory
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_2 Auto Const mandatory
Scene Property LC088_Space_CF_100_SkirmishStart Auto Const mandatory
Scene Property LC088_Space_CF_105_SkirmishComplete Auto Const mandatory
Scene Property LC088_Space_CF_120_AlphaStart Auto Const mandatory
Scene Property LC088_Space_CF_128_AlphaComplete Auto Const mandatory
Scene Property LC088_Space_CF_130_BetaStart Auto Const mandatory
Scene Property LC088_Space_CF_138_BetaComplete Auto Const mandatory
Scene Property LC088_Space_CF_140_GammaStart Auto Const mandatory
Scene Property LC088_Space_CF_148_GammaComplete Auto Const mandatory
Scene Property LC088_Space_CF_150_ReadyForMainBattle Auto Const mandatory
Scene Property LC088_Space_CF_160_MainBattleStart Auto Const mandatory
Scene Property LC088_Space_CF_165_VigilanceInvulnerable Auto Const mandatory
Scene Property LC088_Space_CF_170_VigilanceEscortsDefeated Auto Const mandatory
Scene Property LC088_Space_CF_180_VigilanceDefeated Auto Const mandatory
Scene Property LC088_Space_CF_190_BoardVigilance Auto Const mandatory
Scene Property LC088_Space_SD_200_SkirmishStart Auto Const mandatory
Scene Property LC088_Space_SD_205_SkirmishComplete Auto Const mandatory
Scene Property LC088_Space_SD_220_AlphaStart Auto Const mandatory
Scene Property LC088_Space_SD_228_AlphaComplete Auto Const mandatory
Scene Property LC088_Space_SD_230_BetaStart Auto Const mandatory
Scene Property LC088_Space_SD_238_BetaComplete Auto Const mandatory
Scene Property LC088_Space_SD_240_GammaStart Auto Const mandatory
Scene Property LC088_Space_SD_248_GammaComplete Auto Const mandatory
Scene Property LC088_Space_SD_260_MainBattleStart Auto Const mandatory
Scene Property LC088_Space_SD_270_CFDefendersDefeated Auto Const mandatory
Scene Property LC088_Space_SD_290_BoardKey Auto Const mandatory
Scene Property LC088_Space_CF_175_VigilanceEscortsDefeated Auto Const mandatory
Scene Property LC088_Space_CF_163_VigilanceInvulnerable Auto Const mandatory
Scene Property LC088_Space_CF_165_Reinforcements1 Auto Const mandatory
Scene Property LC088_Space_CF_170_Reinforcements2 Auto Const mandatory
Scene Property LC088_Space_CF_122_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_132_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_142_AllyStart Auto Const mandatory
Scene Property LC088_Space_CF_169_AllyStart Auto Const mandatory
Scene Property LC088_Space_SD_225_BatteryDestroyed Auto Const mandatory
Scene Property LC088_Space_SD_280_CFDefendersDefeated Auto Const mandatory
Scene Property LC088_Space_SD_265_VigilanceArrives01 Auto Const mandatory
Scene Property LC088_Space_SD_266_VigilanceArrives02 Auto Const mandatory
Scene Property LC088_Space_SD_267_VigilanceArrives03 Auto Const mandatory
Scene Property LC088_Space_SD_226_BatteryPhaseComplete Auto Const mandatory
lc082_vigilancequestscript Property LC082 Auto Const mandatory
cf_postquestscript Property CF_Post Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF07 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SysDef Auto Const mandatory
Quest Property CFKey Auto Const mandatory
Quest Property CF_Main Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadAlpha Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadBeta Auto Const mandatory
GlobalVariable Property LC088_Space_CFSD01EvidenceCountForSquadGamma Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
Spell Property LC088_DefensiveBatteryRegenSpell Auto Const mandatory
Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
RefCollectionAlias Property Alias_KeyTurrets Auto Const mandatory
ObjectReference Property LC088_KeyTurretsEnableMarkerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0164_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0178_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0193_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:8
  Self.SetStage(11) ; #DEBUG_LINE_NO:14
  Alias_playerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:26
  Self.SetStage(11) ; #DEBUG_LINE_NO:32
  Self.SetStage(100) ; #DEBUG_LINE_NO:35
  Self.SetStage(110) ; #DEBUG_LINE_NO:36
  CF08_Fleet.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:37
  CF08_Fleet.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:38
  CF08_Fleet.SetStage(110) ; #DEBUG_LINE_NO:39
  spaceshipreference playerShip = Alias_playerShip.GetShipRef() ; #DEBUG_LINE_NO:42
  ObjectReference markerHeading = Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:43
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:52
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:53
  Self.SetStage(11) ; #DEBUG_LINE_NO:59
  Self.SetStage(100) ; #DEBUG_LINE_NO:62
  Self.SetStage(110) ; #DEBUG_LINE_NO:63
  CF08_Fleet.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:64
  CF08_Fleet.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:65
  CF08_Fleet.SetStage(110) ; #DEBUG_LINE_NO:66
  spaceshipreference playerShip = Alias_playerShip.GetShipRef() ; #DEBUG_LINE_NO:69
  ObjectReference markerHeading = Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:70
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:79
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:80
  Self.SetStage(11) ; #DEBUG_LINE_NO:86
  Self.SetStage(100) ; #DEBUG_LINE_NO:89
  Self.SetStage(110) ; #DEBUG_LINE_NO:90
  CF08_Fleet.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:91
  CF08_Fleet.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:92
  CF08_Fleet.SetStage(110) ; #DEBUG_LINE_NO:93
  spaceshipreference playerShip = Alias_playerShip.GetShipRef() ; #DEBUG_LINE_NO:96
  ObjectReference markerHeading = Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:97
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:106
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:107
  Self.SetStage(11) ; #DEBUG_LINE_NO:113
  Self.SetStage(100) ; #DEBUG_LINE_NO:116
  Self.SetStage(110) ; #DEBUG_LINE_NO:117
  Self.SetStage(150) ; #DEBUG_LINE_NO:118
  CF08_Fleet.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:119
  CF08_Fleet.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:120
  spaceshipreference playerShip = Alias_playerShip.GetShipRef() ; #DEBUG_LINE_NO:123
  ObjectReference markerHeading = Alias_KeyMapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:124
  playerShip.MoveTo(markerHeading, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(12) ; #DEBUG_LINE_NO:136
  Alias_playerShip.GetShipRef().MoveTo(Alias_VigilanceMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(12) ; #DEBUG_LINE_NO:152
  Self.SetStage(200) ; #DEBUG_LINE_NO:155
  Self.SetStage(210) ; #DEBUG_LINE_NO:156
  CF08_SysDef.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:157
  CF08_SysDef.SetStage(110) ; #DEBUG_LINE_NO:158
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(12) ; #DEBUG_LINE_NO:172
  Self.SetStage(200) ; #DEBUG_LINE_NO:175
  Self.SetStage(210) ; #DEBUG_LINE_NO:176
  Self.SetStage(220) ; #DEBUG_LINE_NO:177
  Self.SetStage(229) ; #DEBUG_LINE_NO:178
  CF08_SysDef.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:179
  CF08_SysDef.SetStage(110) ; #DEBUG_LINE_NO:180
  CF08_SysDef.SetStage(120) ; #DEBUG_LINE_NO:181
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(12) ; #DEBUG_LINE_NO:195
  Self.SetStage(200) ; #DEBUG_LINE_NO:198
  Self.SetStage(210) ; #DEBUG_LINE_NO:199
  Self.SetStage(220) ; #DEBUG_LINE_NO:200
  Self.SetStage(229) ; #DEBUG_LINE_NO:201
  Self.SetStage(230) ; #DEBUG_LINE_NO:202
  Self.SetStage(239) ; #DEBUG_LINE_NO:203
  CF08_SysDef.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:204
  CF08_SysDef.SetStage(110) ; #DEBUG_LINE_NO:205
  CF08_SysDef.SetStage(120) ; #DEBUG_LINE_NO:206
  CF08_SysDef.SetStage(130) ; #DEBUG_LINE_NO:207
  Alias_playerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0009_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:218
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:219
  Self.SetStage(12) ; #DEBUG_LINE_NO:225
  Self.SetStage(200) ; #DEBUG_LINE_NO:228
  Self.SetStage(210) ; #DEBUG_LINE_NO:229
  Self.SetStage(220) ; #DEBUG_LINE_NO:230
  Self.SetStage(229) ; #DEBUG_LINE_NO:231
  Self.SetStage(230) ; #DEBUG_LINE_NO:232
  Self.SetStage(239) ; #DEBUG_LINE_NO:233
  Self.SetStage(240) ; #DEBUG_LINE_NO:234
  Self.SetStage(249) ; #DEBUG_LINE_NO:235
  Self.SetStage(250) ; #DEBUG_LINE_NO:236
  CF08_SysDef.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:237
  CF08_SysDef.SetStage(110) ; #DEBUG_LINE_NO:238
  CF08_SysDef.SetStage(120) ; #DEBUG_LINE_NO:239
  CF08_SysDef.SetStage(130) ; #DEBUG_LINE_NO:240
  CF08_SysDef.SetStage(140) ; #DEBUG_LINE_NO:241
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False) ; #DEBUG_LINE_NO:244
  Alias_playerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:255
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:256
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:262
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:263
  kmyQuest.DEBUG_GoToSpaceAndWait() ; #DEBUG_LINE_NO:266
  CF08_Fleet.SetStage(0) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:277
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:278
  PlayerFaction.SetAlly(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:284
  Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:285
  kmyQuest.DEBUG_GoToSpaceAndWait() ; #DEBUG_LINE_NO:288
  CF08_SysDef.SetStage(0) ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:299
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:300
  PlayerFaction.SetEnemy(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:306
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:307
  kmyQuest.DEBUG_SpawnPlayerShip(True) ; #DEBUG_LINE_NO:310
  Alias_playerShip.GetShipRef().InstantDock(Alias_Key.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:311
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:314
  CF_Main.SetStage(10) ; #DEBUG_LINE_NO:315
  CF_Main.SetStage(20) ; #DEBUG_LINE_NO:316
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:317
  CF08_Fleet.SetStage(0) ; #DEBUG_LINE_NO:318
  CF08_Fleet.SetStage(10) ; #DEBUG_LINE_NO:319
  CF08_Fleet.SetStage(20) ; #DEBUG_LINE_NO:320
  CF08_Fleet.SetStage(30) ; #DEBUG_LINE_NO:321
  CF08_Fleet.SetStage(35) ; #DEBUG_LINE_NO:322
  CF08_Fleet.SetStage(40) ; #DEBUG_LINE_NO:323
  CF08_Fleet.SetStage(45) ; #DEBUG_LINE_NO:324
  CF08_Fleet.SetStage(50) ; #DEBUG_LINE_NO:325
  Self.SetStage(100) ; #DEBUG_LINE_NO:326
  kmyQuest.EnableDataCoreAnalyzer(False) ; #DEBUG_LINE_NO:329
  Game.GetPlayer().MoveTo(Alias_CF_BriefingQuickstartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:340
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:341
  PlayerFaction.SetAlly(UCSysDefFaction, False, False) ; #DEBUG_LINE_NO:347
  Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:348
  kmyQuest.DEBUG_SpawnPlayerShip(False) ; #DEBUG_LINE_NO:351
  Alias_playerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:352
  Alias_CF_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:355
  Alias_CF_Allies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:356
  Alias_SD_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:357
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:360
  CF_Main.SetStage(10) ; #DEBUG_LINE_NO:361
  CF_Main.SetStage(20) ; #DEBUG_LINE_NO:362
  CF_Main.SetStage(200) ; #DEBUG_LINE_NO:363
  LC082.SetStage(210) ; #DEBUG_LINE_NO:364
  CF08_SysDef.SetStage(0) ; #DEBUG_LINE_NO:365
  CF08_SysDef.SetStage(10) ; #DEBUG_LINE_NO:366
  CF08_SysDef.SetStage(20) ; #DEBUG_LINE_NO:367
  CF08_SysDef.SetStage(30) ; #DEBUG_LINE_NO:368
  Self.SetStage(200) ; #DEBUG_LINE_NO:369
  kmyQuest.EnableDataCoreAnalyzer(False) ; #DEBUG_LINE_NO:372
  Game.GetPlayer().MoveTo(Alias_SD_BriefingQuickstartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:375
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:383
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:384
  kmyQuest.DEBUG_DamageVigilance() ; #DEBUG_LINE_NO:390
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:398
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:399
  kmyQuest.WaitForQuestStartup() ; #DEBUG_LINE_NO:405
  kmyQuest.DEBUG_SpawnPlayerShip(True) ; #DEBUG_LINE_NO:409
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:412
  CF_Main.SetStage(10) ; #DEBUG_LINE_NO:413
  CF_Main.SetStage(20) ; #DEBUG_LINE_NO:414
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:415
  kmyQuest.Main_EnableVigilance() ; #DEBUG_LINE_NO:418
  kmyQuest.DEBUG_DamageVigilance() ; #DEBUG_LINE_NO:419
  Alias_CF_Allies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:422
  Alias_CF_Allies_Main.EnableAll(False) ; #DEBUG_LINE_NO:423
  Alias_CF_Enemies_All.DisableAll(False) ; #DEBUG_LINE_NO:424
  kmyQuest.EnableDataCoreAnalyzer(True) ; #DEBUG_LINE_NO:427
  kmyQuest.InsertDataCore(True) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:436
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:437
  kmyQuest.WaitForQuestStartup() ; #DEBUG_LINE_NO:443
  kmyQuest.DEBUG_SpawnPlayerShip(False) ; #DEBUG_LINE_NO:447
  Alias_CF_Allies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:450
  Alias_CF_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:451
  Alias_SD_Allies_Main.EnableAll(False) ; #DEBUG_LINE_NO:452
  Alias_SD_Enemies_All.DisableAll(False) ; #DEBUG_LINE_NO:453
  LC088_KeyTurretsEnableMarkerRef.Disable(False) ; #DEBUG_LINE_NO:454
  kmyQuest.DisableAllCaptainShips() ; #DEBUG_LINE_NO:455
  CF_Main.SetStage(1) ; #DEBUG_LINE_NO:458
  CF_Main.SetStage(10) ; #DEBUG_LINE_NO:459
  CF_Main.SetStage(20) ; #DEBUG_LINE_NO:460
  CF_Main.SetStage(200) ; #DEBUG_LINE_NO:461
  LC082.SetStage(210) ; #DEBUG_LINE_NO:462
  kmyQuest.Main_EnableVigilance() ; #DEBUG_LINE_NO:465
  kmyQuest.SD_SwitchKeyToSDDocking() ; #DEBUG_LINE_NO:468
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True) ; #DEBUG_LINE_NO:469
  kmyQuest.EnableDataCoreAnalyzer(False) ; #DEBUG_LINE_NO:472
  kmyQuest.InsertDataCore(False) ; #DEBUG_LINE_NO:473
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef()) ; #DEBUG_LINE_NO:486
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef()) ; #DEBUG_LINE_NO:487
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:495
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:496
  CF_Main.SetStage(300) ; #DEBUG_LINE_NO:503
  Alias_SD_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:507
  kmyQuest.IgnoreAlliedFriendlyHits() ; #DEBUG_LINE_NO:510
  CF07.SetStage(1500) ; #DEBUG_LINE_NO:513
  CF08_Fleet.SetStage(10) ; #DEBUG_LINE_NO:514
  kmyQuest.EnableDataCoreAnalyzer(False) ; #DEBUG_LINE_NO:517
  CFKey.SetStage(200) ; #DEBUG_LINE_NO:521
  Alias_Vigilance.GetShipRef().SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:524
  kmyQuest.SetupAllCaptainEvents() ; #DEBUG_LINE_NO:527
  kmyQuest.SetupKeyTurrets() ; #DEBUG_LINE_NO:530
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:533
  kmyQuest.PlaySpaceScene(LC088_Space_CF_100_SkirmishStart) ; #DEBUG_LINE_NO:534
EndFunction

Function Fragment_Stage_0101_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:542
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:543
  kmyQuest.UnblockIncidentalDialogue(0) ; #DEBUG_LINE_NO:549
EndFunction

Function Fragment_Stage_0105_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:557
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:558
  kmyQuest.PlaySpaceScene(LC088_Space_CF_105_SkirmishComplete) ; #DEBUG_LINE_NO:564
EndFunction

Function Fragment_Stage_0106_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:572
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:573
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True) ; #DEBUG_LINE_NO:579
  CF08_Fleet.SetStage(30) ; #DEBUG_LINE_NO:582
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:590
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:591
  kmyQuest.SetupDefensiveBatteries() ; #DEBUG_LINE_NO:597
  Alias_CF_Allies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:600
  Alias_CF_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:601
  Alias_CF_Enemies_Alpha.EnableAll(False) ; #DEBUG_LINE_NO:602
  Alias_CF_Enemies_Beta.EnableAll(False) ; #DEBUG_LINE_NO:603
  Alias_CF_Enemies_Gamma.EnableAll(False) ; #DEBUG_LINE_NO:604
  Alias_CF_Allies_Main.EnableAll(False) ; #DEBUG_LINE_NO:608
  Alias_CF_Captain_EstelleShip.TryToDisable() ; #DEBUG_LINE_NO:611
  Alias_CF_Captain_MathisShip.TryToDisable() ; #DEBUG_LINE_NO:612
  Alias_CF_Captain_HuanShip.TryToDisable() ; #DEBUG_LINE_NO:613
  Alias_CF_Mines_Alpha_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:616
  kmyQuest.RegisterForLoadScreenEvent() ; #DEBUG_LINE_NO:620
  Alias_DefensiveBatteryAlphaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:623
  Alias_DefensiveBatteryBetaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:624
  Alias_DefensiveBatteryGammaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:625
  Self.SetStageNoWait(111) ; #DEBUG_LINE_NO:628
EndFunction

Function Fragment_Stage_0111_Item_00()
  LC088_Vigilance.Start() ; #DEBUG_LINE_NO:639
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:647
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:648
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:654
  If Self.GetStageDone(14) ; #DEBUG_LINE_NO:655
    kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Alpha, Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:656
    kmyQuest.PlaySpaceScene(LC088_Space_CF_122_AllyStart) ; #DEBUG_LINE_NO:657
  Else ; #DEBUG_LINE_NO:
    kmyQuest.PlaySpaceScene(LC088_Space_CF_120_AlphaStart) ; #DEBUG_LINE_NO:659
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0121_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:668
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:669
  kmyQuest.UnblockIncidentalDialogue(1) ; #DEBUG_LINE_NO:675
EndFunction

Function Fragment_Stage_0128_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:683
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:684
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryAlpha.GetShipRef()) ; #DEBUG_LINE_NO:690
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148) ; #DEBUG_LINE_NO:693
    Self.SetStage(150) ; #DEBUG_LINE_NO:694
  Else ; #DEBUG_LINE_NO:
    kmyQuest.PlaySpaceScene(LC088_Space_CF_128_AlphaComplete) ; #DEBUG_LINE_NO:697
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0129_Item_00()
  CF08_Fleet.SetStage(120) ; #DEBUG_LINE_NO:709
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:717
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:718
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:724
  kmyQuest.PlaySpaceScene(LC088_Space_CF_130_BetaStart) ; #DEBUG_LINE_NO:725
EndFunction

Function Fragment_Stage_0131_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:733
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:734
  If Self.GetStageDone(18) ; #DEBUG_LINE_NO:740
    Self.SetStage(132) ; #DEBUG_LINE_NO:741
  Else ; #DEBUG_LINE_NO:
    kmyQuest.UnblockIncidentalDialogue(2) ; #DEBUG_LINE_NO:744
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0132_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:753
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:754
  kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Beta, Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:761
  kmyQuest.PlaySpaceScene(LC088_Space_CF_132_AllyStart) ; #DEBUG_LINE_NO:762
EndFunction

Function Fragment_Stage_0133_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:770
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:771
  kmyQuest.UnblockIncidentalDialogue(2) ; #DEBUG_LINE_NO:777
EndFunction

Function Fragment_Stage_0138_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:785
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:786
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryBeta.GetShipRef()) ; #DEBUG_LINE_NO:792
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148) ; #DEBUG_LINE_NO:795
    Self.SetStage(150) ; #DEBUG_LINE_NO:796
  Else ; #DEBUG_LINE_NO:
    kmyQuest.PlaySpaceScene(LC088_Space_CF_138_BetaComplete) ; #DEBUG_LINE_NO:799
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0139_Item_00()
  CF08_Fleet.SetStage(130) ; #DEBUG_LINE_NO:811
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:819
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:820
  kmyQuest.SetUpGammaShipsAll() ; #DEBUG_LINE_NO:826
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:829
  If Self.GetStageDone(17) ; #DEBUG_LINE_NO:830
    kmyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Gamma, Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:831
    kmyQuest.PlaySpaceScene(LC088_Space_CF_142_AllyStart) ; #DEBUG_LINE_NO:832
  Else ; #DEBUG_LINE_NO:
    kmyQuest.PlaySpaceScene(LC088_Space_CF_140_GammaStart) ; #DEBUG_LINE_NO:834
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0141_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:843
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:844
  kmyQuest.UnblockIncidentalDialogue(3) ; #DEBUG_LINE_NO:850
EndFunction

Function Fragment_Stage_0148_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:858
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:859
  kmyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryGamma.GetShipRef()) ; #DEBUG_LINE_NO:865
  If Self.GetStageDone(128) && Self.GetStageDone(138) && Self.GetStageDone(148) ; #DEBUG_LINE_NO:868
    Self.SetStage(150) ; #DEBUG_LINE_NO:869
  Else ; #DEBUG_LINE_NO:
    kmyQuest.PlaySpaceScene(LC088_Space_CF_148_GammaComplete) ; #DEBUG_LINE_NO:872
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0149_Item_00()
  CF08_Fleet.SetStage(140) ; #DEBUG_LINE_NO:884
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:892
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:893
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False) ; #DEBUG_LINE_NO:899
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef()) ; #DEBUG_LINE_NO:903
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef()) ; #DEBUG_LINE_NO:904
  kmyQuest.Main_FormCFBattleLine() ; #DEBUG_LINE_NO:907
  Alias_CF_MainBattleAnnouncementMarker.GetRef().MoveTo(Alias_playerShip.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:910
  kmyQuest.PlaySpaceScene(LC088_Space_CF_150_ReadyForMainBattle) ; #DEBUG_LINE_NO:911
EndFunction

Function Fragment_Stage_0151_Item_00()
  CF08_Fleet.SetStage(210) ; #DEBUG_LINE_NO:922
EndFunction

Function Fragment_Stage_0160_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:930
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:931
  If Self.GetStageDone(33) ; #DEBUG_LINE_NO:937
    Self.SetStage(162) ; #DEBUG_LINE_NO:938
    Self.SetStage(161) ; #DEBUG_LINE_NO:939
    Return  ; #DEBUG_LINE_NO:940
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.PlaySpaceScene(LC088_Space_CF_160_MainBattleStart) ; #DEBUG_LINE_NO:944
EndFunction

Function Fragment_Stage_0161_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:952
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:953
  CF08_Fleet.SetStage(220) ; #DEBUG_LINE_NO:959
  kmyQuest.CF_Main_ReadyForVigilanceInvulnerableScene() ; #DEBUG_LINE_NO:962
  kmyQuest.Main_SetMusicOverrideActive(True) ; #DEBUG_LINE_NO:965
  kmyQuest.Main_SetPlayerControlsEnabled(True) ; #DEBUG_LINE_NO:968
  kmyQuest.Main_EVPAllNoWait(False) ; #DEBUG_LINE_NO:971
  kmyQuest.UnblockIncidentalDialogue(4) ; #DEBUG_LINE_NO:974
EndFunction

Function Fragment_Stage_0162_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:982
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:983
  kmyQuest.Main_EnableSDFleet(Alias_CF_Enemies_Main) ; #DEBUG_LINE_NO:989
EndFunction

Function Fragment_Stage_0163_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:997
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:998
  kmyQuest.PlaySpaceScene(LC088_Space_CF_163_VigilanceInvulnerable) ; #DEBUG_LINE_NO:1004
EndFunction

Function Fragment_Stage_0165_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1020
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1021
  kmyQuest.PlaySpaceScene(LC088_Space_CF_165_Reinforcements1) ; #DEBUG_LINE_NO:1027
  kmyQuest.Main_TriggerReinforcements(1) ; #DEBUG_LINE_NO:1030
EndFunction

Function Fragment_Stage_0169_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1038
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1039
  kmyQuest.Main_TriggerReinforcements(2) ; #DEBUG_LINE_NO:1045
  kmyQuest.PlaySpaceScene(LC088_Space_CF_169_AllyStart) ; #DEBUG_LINE_NO:1048
EndFunction

Function Fragment_Stage_0170_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1056
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1057
  kmyQuest.PlaySpaceScene(LC088_Space_CF_170_Reinforcements2) ; #DEBUG_LINE_NO:1063
  kmyQuest.Main_TriggerReinforcements(3) ; #DEBUG_LINE_NO:1066
EndFunction

Function Fragment_Stage_0173_Item_00()
  CF08_Fleet.SetStage(225) ; #DEBUG_LINE_NO:1077
EndFunction

Function Fragment_Stage_0175_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1085
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1086
  kmyQuest.PlaySpaceScene(LC088_Space_CF_175_VigilanceEscortsDefeated) ; #DEBUG_LINE_NO:1092
EndFunction

Function Fragment_Stage_0179_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1108
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1109
  kmyQuest.CF_Main_FireBatteriesAtVigilance() ; #DEBUG_LINE_NO:1115
  CF08_Fleet.SetStage(230) ; #DEBUG_LINE_NO:1118
  kmyQuest.CF_Main_RemoveVigilanceInvulnerability() ; #DEBUG_LINE_NO:1121
EndFunction

Function Fragment_Stage_0180_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1129
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1130
  kmyQuest.PlaySpaceScene(LC088_Space_CF_180_VigilanceDefeated) ; #DEBUG_LINE_NO:1136
EndFunction

Function Fragment_Stage_0181_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1144
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1145
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True) ; #DEBUG_LINE_NO:1151
  kmyQuest.CF_Main_StartDockingWithVigilance() ; #DEBUG_LINE_NO:1154
  CF08_Fleet.SetStage(240) ; #DEBUG_LINE_NO:1157
EndFunction

Function Fragment_Stage_0190_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1165
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1166
  kmyQuest.PlaySpaceScene(LC088_Space_CF_190_BoardVigilance) ; #DEBUG_LINE_NO:1172
EndFunction

Function Fragment_Stage_0191_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1180
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1181
  CF08_Fleet.SetStage(310) ; #DEBUG_LINE_NO:1187
  kmyQuest.Main_SetMusicOverrideActive(False) ; #DEBUG_LINE_NO:1190
EndFunction

Function Fragment_Stage_0195_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1206
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1207
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True) ; #DEBUG_LINE_NO:1213
EndFunction

Function Fragment_Stage_0199_Item_00()
  Alias_DefensiveBatteryAlphaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1224
  Alias_DefensiveBatteryBetaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1225
  Alias_DefensiveBatteryGammaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1226
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef()) ; #DEBUG_LINE_NO:1229
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef()) ; #DEBUG_LINE_NO:1230
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1238
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1239
  Alias_KeyMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1246
  Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self as Quest, False) ; #DEBUG_LINE_NO:1247
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, False) ; #DEBUG_LINE_NO:1248
  CF_Main.SetStage(200) ; #DEBUG_LINE_NO:1251
  LC082.SetStage(210) ; #DEBUG_LINE_NO:1254
  kmyQuest.SD_SetupAllyGroup() ; #DEBUG_LINE_NO:1258
  kmyQuest.IgnoreAlliedFriendlyHits() ; #DEBUG_LINE_NO:1261
  Alias_Vigilance.GetShipRef().IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:1262
  CF07.SetStage(1000) ; #DEBUG_LINE_NO:1265
  CF08_SysDef.SetStage(10) ; #DEBUG_LINE_NO:1266
  kmyQuest.EnableDataCoreAnalyzer(False) ; #DEBUG_LINE_NO:1269
  Alias_CF_Enemies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:1272
  Alias_CF_Allies_Skirmish.DisableAll(False) ; #DEBUG_LINE_NO:1273
  kmyQuest.SetupAllCaptainEvents() ; #DEBUG_LINE_NO:1276
  kmyQuest.SetupKeyTurrets() ; #DEBUG_LINE_NO:1279
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:1282
  kmyQuest.PlaySpaceScene(LC088_Space_SD_200_SkirmishStart) ; #DEBUG_LINE_NO:1283
EndFunction

Function Fragment_Stage_0201_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1291
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1292
  kmyQuest.UnblockIncidentalDialogue(0) ; #DEBUG_LINE_NO:1298
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1306
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1307
  kmyQuest.PlaySpaceScene(LC088_Space_SD_205_SkirmishComplete) ; #DEBUG_LINE_NO:1313
EndFunction

Function Fragment_Stage_0206_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1321
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1322
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True) ; #DEBUG_LINE_NO:1328
  CF08_SysDef.SetStage(20) ; #DEBUG_LINE_NO:1331
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1339
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1340
  kmyQuest.SetupDefensiveBatteries() ; #DEBUG_LINE_NO:1346
  Alias_SD_Enemies_Alpha.EnableAll(False) ; #DEBUG_LINE_NO:1349
  Alias_SD_Enemies_Beta.EnableAll(False) ; #DEBUG_LINE_NO:1350
  Alias_SD_Enemies_Gamma.EnableAll(False) ; #DEBUG_LINE_NO:1351
  Alias_SD_Enemies_Main.EnableAll(False) ; #DEBUG_LINE_NO:1352
  Alias_SD_Enemies_Main_Reinforcements_1.EnableAll(False) ; #DEBUG_LINE_NO:1353
  Alias_SD_Enemies_Main_Reinforcements_2.EnableAll(False) ; #DEBUG_LINE_NO:1354
  kmyQuest.Main_FormCFBattleLine() ; #DEBUG_LINE_NO:1357
  kmyQuest.SD_SetupMainEnemyReinforcements() ; #DEBUG_LINE_NO:1360
  kmyQuest.SD_CalculateMainBattleCounts() ; #DEBUG_LINE_NO:1363
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:1366
  If player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadBeta.GetValue() ; #DEBUG_LINE_NO:1367
    Self.SetStage(21) ; #DEBUG_LINE_NO:1368
    Alias_SD_Allies_Beta.EnableAll(False) ; #DEBUG_LINE_NO:1369
  EndIf ; #DEBUG_LINE_NO:
  If player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadGamma.GetValue() ; #DEBUG_LINE_NO:1371
    Self.SetStage(22) ; #DEBUG_LINE_NO:1372
    Alias_SD_Allies_Gamma.EnableAll(False) ; #DEBUG_LINE_NO:1373
  EndIf ; #DEBUG_LINE_NO:
  Alias_SD_Mines_Alpha_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:1377
  kmyQuest.RegisterForLoadScreenEvent() ; #DEBUG_LINE_NO:1381
  Alias_DefensiveBatteryAlphaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:1384
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:1388
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True) ; #DEBUG_LINE_NO:1389
  Self.SetStageNoWait(211) ; #DEBUG_LINE_NO:1392
EndFunction

Function Fragment_Stage_0211_Item_00()
  LC088_Key.Start() ; #DEBUG_LINE_NO:1403
EndFunction

Function Fragment_Stage_0220_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1411
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1412
  LC082.UpdateVigilanceLocation("Shutdown") ; #DEBUG_LINE_NO:1418
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), False) ; #DEBUG_LINE_NO:1421
  If !Self.GetStageDone(7) && !Self.GetStageDone(8) && !Self.GetStageDone(9) ; #DEBUG_LINE_NO:1423
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:1425
    kmyQuest.SD_UpdateAndMoveAllyGroup(1) ; #DEBUG_LINE_NO:1428
    kmyQuest.PlaySpaceScene(LC088_Space_SD_220_AlphaStart) ; #DEBUG_LINE_NO:1431
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0221_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1440
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1441
  kmyQuest.UnblockIncidentalDialogue(1) ; #DEBUG_LINE_NO:1447
EndFunction

Function Fragment_Stage_0226_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1455
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1456
  If Self.GetStageDone(226) && Self.GetStageDone(227) ; #DEBUG_LINE_NO:1462
    Self.SetStage(228) ; #DEBUG_LINE_NO:1463
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(1) ; #DEBUG_LINE_NO:1465
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0227_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1474
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1475
  If Self.GetStageDone(226) && Self.GetStageDone(227) ; #DEBUG_LINE_NO:1481
    Self.SetStage(228) ; #DEBUG_LINE_NO:1482
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryDestroyedScene(1) ; #DEBUG_LINE_NO:1484
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0228_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1493
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1494
  kmyQuest.PlaySpaceScene(LC088_Space_SD_228_AlphaComplete) ; #DEBUG_LINE_NO:1500
EndFunction

Function Fragment_Stage_0229_Item_00()
  Alias_DefensiveBatteryBetaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:1511
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:1515
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True) ; #DEBUG_LINE_NO:1516
  CF08_SysDef.SetStage(120) ; #DEBUG_LINE_NO:1519
EndFunction

Function Fragment_Stage_0230_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1527
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1528
  If !Self.GetStageDone(8) && !Self.GetStageDone(9) ; #DEBUG_LINE_NO:1533
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:1535
    kmyQuest.SD_UpdateAndMoveAllyGroup(2) ; #DEBUG_LINE_NO:1538
    kmyQuest.PlaySpaceScene(LC088_Space_SD_230_BetaStart) ; #DEBUG_LINE_NO:1541
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0231_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1550
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1551
  kmyQuest.UnblockIncidentalDialogue(2) ; #DEBUG_LINE_NO:1557
EndFunction

Function Fragment_Stage_0236_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1565
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1566
  If Self.GetStageDone(236) && Self.GetStageDone(237) ; #DEBUG_LINE_NO:1572
    Self.SetStage(238) ; #DEBUG_LINE_NO:1573
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(2) ; #DEBUG_LINE_NO:1575
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0237_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1584
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1585
  If Self.GetStageDone(236) && Self.GetStageDone(237) ; #DEBUG_LINE_NO:1591
    Self.SetStage(238) ; #DEBUG_LINE_NO:1592
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryDestroyedScene(2) ; #DEBUG_LINE_NO:1594
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0238_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1603
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1604
  kmyQuest.PlaySpaceScene(LC088_Space_SD_238_BetaComplete) ; #DEBUG_LINE_NO:1610
EndFunction

Function Fragment_Stage_0239_Item_00()
  Alias_DefensiveBatteryGammaMapMarker.TryToEnable() ; #DEBUG_LINE_NO:1621
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef(None)) ; #DEBUG_LINE_NO:1625
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True) ; #DEBUG_LINE_NO:1626
  CF08_SysDef.SetStage(130) ; #DEBUG_LINE_NO:1629
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1637
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1638
  If !Self.GetStageDone(9) ; #DEBUG_LINE_NO:1643
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:1645
    kmyQuest.SD_UpdateAndMoveAllyGroup(3) ; #DEBUG_LINE_NO:1648
    kmyQuest.SetUpGammaShipsAll() ; #DEBUG_LINE_NO:1651
    kmyQuest.PlaySpaceScene(LC088_Space_SD_240_GammaStart) ; #DEBUG_LINE_NO:1654
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0241_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1663
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1664
  kmyQuest.UnblockIncidentalDialogue(3) ; #DEBUG_LINE_NO:1670
EndFunction

Function Fragment_Stage_0246_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1678
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1679
  If Self.GetStageDone(246) && Self.GetStageDone(247) ; #DEBUG_LINE_NO:1685
    Self.SetStage(248) ; #DEBUG_LINE_NO:1686
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryPhaseCompleteScene(3) ; #DEBUG_LINE_NO:1688
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0247_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1697
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1698
  If Self.GetStageDone(246) && Self.GetStageDone(247) ; #DEBUG_LINE_NO:1704
    Self.SetStage(248) ; #DEBUG_LINE_NO:1705
  Else ; #DEBUG_LINE_NO:
    kmyQuest.SD_PlayBatteryDestroyedScene(3) ; #DEBUG_LINE_NO:1707
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0248_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1716
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1717
  kmyQuest.Main_EVPAllNoWait(False) ; #DEBUG_LINE_NO:1723
  kmyQuest.PlaySpaceScene(LC088_Space_SD_248_GammaComplete) ; #DEBUG_LINE_NO:1726
EndFunction

Function Fragment_Stage_0249_Item_00()
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef()) ; #DEBUG_LINE_NO:1738
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef()) ; #DEBUG_LINE_NO:1739
  Alias_KeyMapMarker.TryToEnable() ; #DEBUG_LINE_NO:1740
  Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self as Quest, True) ; #DEBUG_LINE_NO:1741
  Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self as Quest, True) ; #DEBUG_LINE_NO:1742
  CF08_SysDef.SetStage(140) ; #DEBUG_LINE_NO:1745
EndFunction

Function Fragment_Stage_0260_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1753
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1754
  kmyQuest.SD_UpdateAndMoveAllyGroup(4) ; #DEBUG_LINE_NO:1760
  If Self.GetStageDone(33) ; #DEBUG_LINE_NO:1763
    Self.SetStage(261) ; #DEBUG_LINE_NO:1764
    Return  ; #DEBUG_LINE_NO:1765
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.PlaySpaceScene(LC088_Space_SD_260_MainBattleStart) ; #DEBUG_LINE_NO:1769
EndFunction

Function Fragment_Stage_0261_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1777
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1778
  CF08_SysDef.SetStage(220) ; #DEBUG_LINE_NO:1784
  kmyQuest.Main_SetMusicOverrideActive(True) ; #DEBUG_LINE_NO:1787
  kmyQuest.Main_SetPlayerControlsEnabled(True) ; #DEBUG_LINE_NO:1790
  kmyQuest.Main_EVPAllNoWait(False) ; #DEBUG_LINE_NO:1793
  kmyQuest.UnblockIncidentalDialogue(4) ; #DEBUG_LINE_NO:1796
EndFunction

Function Fragment_Stage_0265_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1804
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1805
  kmyQuest.PlaySpaceScene(LC088_Space_SD_265_VigilanceArrives01) ; #DEBUG_LINE_NO:1811
EndFunction

Function Fragment_Stage_0266_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1819
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1820
  kmyQuest.Main_EnableSDFleet(Alias_SD_Allies_Main_SysDefFleet) ; #DEBUG_LINE_NO:1826
  kmyQuest.Main_EVPAllNoWait(True) ; #DEBUG_LINE_NO:1829
  kmyQuest.PlaySpaceScene(LC088_Space_SD_266_VigilanceArrives02) ; #DEBUG_LINE_NO:1832
EndFunction

Function Fragment_Stage_0267_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1840
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1841
  kmyQuest.PlaySpaceScene(LC088_Space_SD_267_VigilanceArrives03) ; #DEBUG_LINE_NO:1847
EndFunction

Function Fragment_Stage_0268_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1855
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1856
  kmyQuest.Main_EVPAllNoWait(False) ; #DEBUG_LINE_NO:1862
EndFunction

Function Fragment_Stage_0269_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1870
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1871
  Self.SetStage(268) ; #DEBUG_LINE_NO:1877
  If Self.GetStageDone(270) ; #DEBUG_LINE_NO:1880
    kmyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated) ; #DEBUG_LINE_NO:1882
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1891
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1892
  If Self.GetStageDone(265) ; #DEBUG_LINE_NO:1898
    kmyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated) ; #DEBUG_LINE_NO:1900
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(265) ; #DEBUG_LINE_NO:1902
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0271_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1911
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1912
  kmyQuest.SD_SwitchKeyToSDDocking() ; #DEBUG_LINE_NO:1918
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True) ; #DEBUG_LINE_NO:1919
  CF08_SysDef.SetStage(230) ; #DEBUG_LINE_NO:1922
EndFunction

Function Fragment_Stage_0290_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1930
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1931
  kmyQuest.PlaySpaceScene(LC088_Space_SD_290_BoardKey) ; #DEBUG_LINE_NO:1937
EndFunction

Function Fragment_Stage_0291_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1945
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1946
  CF08_SysDef.SetStage(310) ; #DEBUG_LINE_NO:1952
  kmyQuest.Main_SetMusicOverrideActive(False) ; #DEBUG_LINE_NO:1955
EndFunction

Function Fragment_Stage_0293_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1963
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1964
  kmyQuest.SD_DisableAllyLeaderShips() ; #DEBUG_LINE_NO:1970
EndFunction

Function Fragment_Stage_0295_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:1978
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:1979
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True) ; #DEBUG_LINE_NO:1985
  Alias_playerShip.TryToStopCombat() ; #DEBUG_LINE_NO:1988
EndFunction

Function Fragment_Stage_0299_Item_00()
  Alias_DefensiveBatteryAlphaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:1999
  Alias_DefensiveBatteryBetaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:2000
  Alias_DefensiveBatteryGammaMapMarker.TryToDisable() ; #DEBUG_LINE_NO:2001
  Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef()) ; #DEBUG_LINE_NO:2004
  Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef()) ; #DEBUG_LINE_NO:2005
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:2013
  lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript ; #DEBUG_LINE_NO:2014
  Alias_CF_Enemies_All.DisableAll(False) ; #DEBUG_LINE_NO:2021
  Alias_CF_Allies_All.DisableAll(False) ; #DEBUG_LINE_NO:2022
  Alias_SD_Enemies_All.DisableAll(False) ; #DEBUG_LINE_NO:2023
  Alias_SD_Allies_All.DisableAll(False) ; #DEBUG_LINE_NO:2024
  kmyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True) ; #DEBUG_LINE_NO:2027
  kmyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True) ; #DEBUG_LINE_NO:2028
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:2031
    Self.SetStage(199) ; #DEBUG_LINE_NO:2032
  ElseIf Self.GetStageDone(200) ; #DEBUG_LINE_NO:2033
    Self.SetStage(299) ; #DEBUG_LINE_NO:2034
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:2038
  Self.Stop() ; #DEBUG_LINE_NO:2041
EndFunction
