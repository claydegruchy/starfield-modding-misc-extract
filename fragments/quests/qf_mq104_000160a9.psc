ScriptName Fragments:Quests:QF_MQ104_000160A9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Quest Property MQ104 Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Scene Property MQ104_002_ReturnScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
ReferenceAlias Property Alias_TEMPSarahMorgan Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
ActorValue Property MQ104A_CompanionPresentTemple Auto Const mandatory
Scene Property MQ104A_008_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_009_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_010_TempleCompanionReaction Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
Scene Property MQ104A_012_PowerDemo Auto Const mandatory
ObjectReference Property MQ104AStartTestCell Auto Const mandatory
ObjectReference Property MQ104AVladTestMarker Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Alias_Artifact02QuestObject Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory
ObjectReference Property MQ104AArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ104AArtifactSpawnMarker02 Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
ReferenceAlias Property Alias_AndrejaMarker Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
Message Property MQ104APowerTutorialMSG Auto Const mandatory
Spell Property AntiGravityFieldSpell Auto Const mandatory
Spell Property GrantSpellAntiGravityFieldSpell Auto Const mandatory
Quest Property MQ_TempleQuest_MQ104A Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property MQ_TempleQuest_01 Auto Const mandatory
GlobalVariable Property MQ_TurnOnTemples Auto Const mandatory
Scene Property COM_Andreja_Story_IntroScene01 Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_AndrejaArtifactMarker Auto Const mandatory
Scene Property COM_Andreja_Story_IntroScene02 Auto Const mandatory
ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const mandatory
Scene Property MQ104A_002a_AndrejaScene Auto Const mandatory
Scene Property MQ104A_002b_ArtifactScene Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Artifact01Activator Auto Const mandatory
ReferenceAlias Property Alias_Artifact02Activator Auto Const mandatory
ReferenceAlias Property Alias_AndrejaIntroMarker Auto Const mandatory
ReferenceAlias Property Alias_VaruunZealot Auto Const mandatory
ReferenceAlias Property Alias_RadiantLocation02EnableMarker Auto Const mandatory
Spell Property ArtifactPowerAntiGravityField_Spell Auto Const mandatory
Scene Property MQ104A_008b_TempleCompanionReaction Auto Const mandatory
Faction Property ConstellationFaction Auto Const mandatory
GlobalVariable Property COM_PQ_LockedInCompanion Auto Const mandatory
Quest Property COM_Companion_Andreja Auto Const mandatory
GlobalVariable Property MQ104_BlockStarbornPowerTopicDialogue Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ104A Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ104A_Cooldown Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
Scene Property MQ104A_011b_PowerReaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ102.SetStage(1150) ; #DEBUG_LINE_NO:9
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:10
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:13
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:14
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:15
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:16
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().moveto(MQ104AStart, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().addtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:21
  Self.SetStage(10) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor SarahMorganREF = Alias_TEMPSarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:31
  (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:32
  SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:33
  MQ_TempleQuest_MQ104A.SetStage(10) ; #DEBUG_LINE_NO:36
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:39
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:40
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:41
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:42
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:43
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:46
  Self.SetStage(30) ; #DEBUG_LINE_NO:48
  Self.SetStage(40) ; #DEBUG_LINE_NO:49
  Self.SetStage(300) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:51
  Game.GetPlayer().addtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:53
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:71
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:74
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(0) ; #DEBUG_LINE_NO:77
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(1) ; #DEBUG_LINE_NO:78
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(2) ; #DEBUG_LINE_NO:79
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:82
  AndrejaREF.SetGhost(True) ; #DEBUG_LINE_NO:83
  AndrejaREF.moveto(Alias_AndrejaIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:93
  Self.SetObjectiveDisplayed(12, True, False) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(22, True, False) ; #DEBUG_LINE_NO:95
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:96
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:99
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:100
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:101
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:102
  Alias_RadiantLocation02EnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:105
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef() ; #DEBUG_LINE_NO:108
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:109
  MapMarker01REF.AddtoMap(True) ; #DEBUG_LINE_NO:111
  MapMarker01REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:112
  MapMarker01REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:113
  MapMarker02REF.AddtoMap(True) ; #DEBUG_LINE_NO:114
  MapMarker02REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:115
  MapMarker02REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:116
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(5, Alias_Artifact01Activator.GetRef()) ; #DEBUG_LINE_NO:119
  Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF) ; #DEBUG_LINE_NO:120
  ArtifactActivator01REF.EnableNoWait(False) ; #DEBUG_LINE_NO:121
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(6, Alias_Artifact02Activator.GetRef()) ; #DEBUG_LINE_NO:123
  Alias_Artifact02Activator.ForceRefTo(ArtifactActivator02REF) ; #DEBUG_LINE_NO:124
  ArtifactActivator02REF.EnableNoWait(False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:142
  If Self.GetStageDone(40) == True && Self.GetStageDone(50) == True ; #DEBUG_LINE_NO:145
    Self.SetStage(60) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference Artifact01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(5, MQ104AArtifactSpawnMarker01) ; #DEBUG_LINE_NO:150
  Alias_Artifact01QuestObject.ForceRefTo(Artifact01REF) ; #DEBUG_LINE_NO:151
  Artifact01REF.Enable(False) ; #DEBUG_LINE_NO:152
  Game.GetPlayer().additem(Artifact01REF as Form, 1, False) ; #DEBUG_LINE_NO:153
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(5) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetObjectiveCompleted(22, True) ; #DEBUG_LINE_NO:164
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0040_Item_00()
  COM_Companion_Andreja.SetStage(50) ; #DEBUG_LINE_NO:175
  Self.SetStage(50) ; #DEBUG_LINE_NO:176
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:178
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:181
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:182
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:183
  AndrejaREF.moveto(Alias_AndrejaArtifactMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:184
  AndrejaREF.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:185
  (SQ_Followers as sq_followersscript).SetRoleInActive(AndrejaREF, True, False, True) ; #DEBUG_LINE_NO:186
  AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:187
  COM_Andreja_Story_IntroScene02.Start() ; #DEBUG_LINE_NO:189
  If Self.GetStageDone(30) == True && Self.GetStageDone(50) == True ; #DEBUG_LINE_NO:192
    Self.SetStage(60) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference Artifact02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(6, MQ104AArtifactSpawnMarker02) ; #DEBUG_LINE_NO:197
  Alias_Artifact02QuestObject.ForceRefTo(Artifact02REF) ; #DEBUG_LINE_NO:198
  Artifact02REF.Enable(False) ; #DEBUG_LINE_NO:199
  Game.GetPlayer().additem(Artifact02REF as Form, 1, False) ; #DEBUG_LINE_NO:200
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(6) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_VaruunZealot.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:211
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:212
  Alias_Andreja.GetActorRef().StopCombatAlarm() ; #DEBUG_LINE_NO:213
  COM_Andreja_Story_IntroScene01.Start() ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:222
  Self.SetStage(32) ; #DEBUG_LINE_NO:223
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:226
  AndrejaREF.AddKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:227
  (SQ_Followers as sq_followersscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:228
  AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:229
  AndrejaREF.SetGhost(False) ; #DEBUG_LINE_NO:230
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:232
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:240
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:241
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:242
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:243
  ArmillaryMountSwapEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:246
  Actor MatteoKhatriREF = Alias_MatteoKhatri.GetActorRef() ; #DEBUG_LINE_NO:249
  MatteoKhatriREF.Disable(False) ; #DEBUG_LINE_NO:250
  MatteoKhatriREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:251
  MatteoKhatriREF.Enable(False) ; #DEBUG_LINE_NO:252
  Alias_Noel.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:261
  AndrejaREF.Disable(False) ; #DEBUG_LINE_NO:264
  AndrejaREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:265
  AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:266
  AndrejaREF.Enable(False) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0080_Item_00()
  MQ104A_002a_AndrejaScene.Start() ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ104A_002b_ArtifactScene.Start() ; #DEBUG_LINE_NO:284
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:286
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:287
EndFunction

Function Fragment_Stage_0110_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:295
  (SQ_Companions as sq_companionsscript).SetRoleAvailable(AndrejaREF, True) ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:304
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:305
  Self.SetStage(110) ; #DEBUG_LINE_NO:308
  If COM_PQ_LockedInCompanion.GetValueInt() > -1 ; #DEBUG_LINE_NO:311
    kmyQuest.ShowHelpMessage("CompanionBlocked") ; #DEBUG_LINE_NO:312
  Else ; #DEBUG_LINE_NO:
    Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:314
    (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:315
    AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:316
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:325
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:326
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:327
  MQ_TempleQuest_MQ104A.SetStageNoWait(10) ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:338
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:339
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:347
  mq104ascript kmyQuest = __temp as mq104ascript ; #DEBUG_LINE_NO:348
  kmyQuest.TempleArrived() ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_0402_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:359
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:360
  MQ104A_008b_TempleCompanionReaction.Start() ; #DEBUG_LINE_NO:363
  kmyQuest.ShowHelpMessage("ZeroG") ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0405_Item_00()
  MQ104A_008_TempleCompanionReaction.Start() ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_0500_Item_00()
  MQ104A_009_TempleCompanionReaction.Start() ; #DEBUG_LINE_NO:381
EndFunction

Function Fragment_Stage_0600_Item_00()
  MQ104A_010_TempleCompanionReaction.Start() ; #DEBUG_LINE_NO:389
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:391
  Self.SetObjectiveCompleted(73, True) ; #DEBUG_LINE_NO:392
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:393
  Actor VladimirREF = Alias_Vladimir.GetActorRef() ; #DEBUG_LINE_NO:396
  VladimirREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:397
  VladimirREF.moveto(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:398
EndFunction

Function Fragment_Stage_0600_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:406
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:407
  MQ_TutorialQuest.SetStage(100) ; #DEBUG_LINE_NO:410
EndFunction

Function Fragment_Stage_0600_Item_02()
  Alias_Companion.GetActorRef().SetValue(MQ104A_CompanionPresentTemple, 1.0) ; #DEBUG_LINE_NO:418
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_Vladimir.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:426
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_Vladimir.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:434
EndFunction

Function Fragment_Stage_0710_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(1.0) ; #DEBUG_LINE_NO:442
  MQ104A_011b_PowerReaction.Start() ; #DEBUG_LINE_NO:443
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:445
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:446
  Alias_WalterStroud.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:448
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:449
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:452
  If PlayerREF.HasSpell(AntiGravityFieldSpell as Form) == False ; #DEBUG_LINE_NO:453
    GrantSpellAntiGravityFieldSpell.Cast(PlayerREF as ObjectReference, PlayerREF as ObjectReference) ; #DEBUG_LINE_NO:454
    MQ104APowerTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:455
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0720_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:464
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:465
EndFunction

Function Fragment_Stage_1000_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(0.0) ; #DEBUG_LINE_NO:473
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:475
  MQ_TempleQuest_01.SetStageNoWait(10) ; #DEBUG_LINE_NO:478
  If MQ103.GetStageDone(2000) && MQ104B.GetStageDone(1000) ; #DEBUG_LINE_NO:481
    MQ105.SetStage(10) ; #DEBUG_LINE_NO:482
  EndIf ; #DEBUG_LINE_NO:
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:486
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:487
  Int I = 0 ; #DEBUG_LINE_NO:488
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:489
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ104A_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:490
    I += 1 ; #DEBUG_LINE_NO:491
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_MQ104A.Send(None) ; #DEBUG_LINE_NO:493
  Game.AddAchievement(3) ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_1010_Item_00()
  MQ104_BlockStarbornPowerTopicDialogue.SetValue(0.0) ; #DEBUG_LINE_NO:504
  Alias_Vladimir.GetActorRef().MoveToMyEditorLocation() ; #DEBUG_LINE_NO:506
  Self.Stop() ; #DEBUG_LINE_NO:508
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:516
  AndrejaREF.SetGhost(False) ; #DEBUG_LINE_NO:517
EndFunction
