ScriptName Fragments:Quests:QF_FC09_001A54F9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RonHope Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_AllGuards Auto Const mandatory
Faction Property FC09_HopeTechEnemyFaction Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property FC09_RonHopeInitialScene Auto Const mandatory
Key Property FreestarRangerBadge_Ranger Auto Const mandatory
ObjectReference Property FC09_PT1 Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
ObjectReference Property FC09_IntroSceneMarker_Hope Auto Const mandatory
ObjectReference Property FC09_IntroSceneMarker_Cosette Auto Const mandatory
ObjectReference Property FC09_IntroSceneMarker_Birgit Auto Const mandatory
ReferenceAlias Property Alias_Cosette Auto Const mandatory
ReferenceAlias Property Alias_BirgitMacDougall Auto Const mandatory
ReferenceAlias Property Alias_GuardM01 Auto Const mandatory
ReferenceAlias Property Alias_GuardF01 Auto Const mandatory
ObjectReference Property FC09_IntroSceneMarker_GuardF01 Auto Const mandatory
ObjectReference Property FC09_IntroSceneMarker_GuardM01 Auto Const mandatory
Scene Property FC09_CompanionBribeReactScene Auto Const mandatory
Faction Property HT_GenericSecurityFaction Auto Const mandatory
Quest Property FC01 Auto Const mandatory
RefCollectionAlias Property Alias_WorkersToDisable Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
ReferenceAlias Property Alias_EvidenceSlate Auto Const mandatory
Scene Property FC09_CheerForPlayerPromotionScene Auto Const mandatory
ActorValue Property FreestarRangerRank Auto Const mandatory
Quest Property FC_EvidenceSlateHolderQuest Auto Const mandatory
Quest Property AutumnEliteCrewQuest Auto Const
ActorValue Property FC09_Completed Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const mandatory
Armor Property Spacesuit_Ranger_01 Auto Const mandatory
Armor Property Spacesuit_Ranger_Helmet_01 Auto Const mandatory
Armor Property Spacesuit_Ranger_Backpack_01 Auto Const mandatory
GlobalVariable Property FC09_PayoffAmountBig Auto Const mandatory
GlobalVariable Property FC09_PayoffAmountSmall Auto Const mandatory
Armor Property Clothes_Ranger_Vested Auto Const mandatory
LeveledItem Property LL_Weapon_FreestarRangersRifle Auto Const mandatory
ReferenceAlias Property Alias_RewardShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_FreestarCollective Auto Const mandatory
ObjectReference Property FC09_GuardM01TravelMarker Auto Const mandatory
Message Property FC09_ShipRewardMessage Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
Float Property cooldownDays Auto Const
GlobalVariable Property SE_FAB23_Timestamp Auto Const mandatory
GlobalVariable Property SE_FAB22_Timestamp Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_FreestarCollective_Cooldown Auto Const mandatory
Keyword Property LocTypeSENotAllowed Auto Const mandatory
Location Property SArcturus_PArcturusII_Orbit Auto Const mandatory
Location Property scLC053Location Auto Const mandatory
Faction Property FC09_CombatMusicFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0425_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Alias_RonHope.GetRef().MoveTo(FC09_IntroSceneMarker_Hope, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_Cosette.GetRef().MoveTo(FC09_IntroSceneMarker_Cosette, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  Alias_BirgitMacDougall.GetRef().MoveTo(FC09_IntroSceneMarker_Hope, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Alias_GuardF01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardF01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Alias_GuardM01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardM01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[] ; #DEBUG_LINE_NO:14
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < workers.Length ; #DEBUG_LINE_NO:16
    workers[I].DisableNoWait(False) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
  FC01.SetStage(2000) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetobjectiveCompleted(50, True) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:39
  Alias_AllGuards.ResetAll() ; #DEBUG_LINE_NO:42
  Alias_RonHope.GetRef().Reset(None) ; #DEBUG_LINE_NO:43
  Alias_Cosette.GetRef().Reset(None) ; #DEBUG_LINE_NO:44
  Alias_Cosette.GetActorRef().AddToFaction(HT_GenericSecurityFaction) ; #DEBUG_LINE_NO:46
  Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[] ; #DEBUG_LINE_NO:49
  Int I = 0 ; #DEBUG_LINE_NO:50
  While I < workers.Length ; #DEBUG_LINE_NO:51
    workers[I].DisableNoWait(False) ; #DEBUG_LINE_NO:52
    I += 1 ; #DEBUG_LINE_NO:53
  EndWhile ; #DEBUG_LINE_NO:
  Alias_RonHope.GetRef().MoveTo(FC09_IntroSceneMarker_Hope, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
  Alias_Cosette.GetRef().MoveTo(FC09_IntroSceneMarker_Cosette, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
  Alias_BirgitMacDougall.GetRef().MoveTo(FC09_IntroSceneMarker_Birgit, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  Alias_GuardM01.GetRef().MoveTo(FC09_GuardM01TravelMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
  Alias_GuardF01.GetRef().MoveTo(FC09_IntroSceneMarker_GuardF01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:61
  SArcturus_PArcturusII_Orbit.RemoveKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:64
  scLC053Location.RemoveKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0150_Item_00()
  FC09_RonHopeInitialScene.Start() ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0160_Item_00()
  Alias_RonHope.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:84
  Alias_Cosette.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:85
  Alias_BirgitMacDougall.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, 10, False) ; #DEBUG_LINE_NO:95
  Self.SetobjectiveCompleted(100, True) ; #DEBUG_LINE_NO:97
  Self.SetStage(700) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0310_Item_00()
  Int PayoffSmall = FC09_PayoffAmountSmall.GetValue() as Int ; #DEBUG_LINE_NO:117
  Alias_Player.GetActorRef().AddItem(Credits as Form, PayoffSmall, False) ; #DEBUG_LINE_NO:118
  Self.SetobjectiveCompleted(100, True) ; #DEBUG_LINE_NO:121
  Self.SetStage(300) ; #DEBUG_LINE_NO:122
  Self.SetStage(700) ; #DEBUG_LINE_NO:123
  FC09_CompanionBribeReactScene.Start() ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0320_Item_00()
  Int PayoffBig = FC09_PayoffAmountBig.GetValue() as Int ; #DEBUG_LINE_NO:135
  Alias_Player.GetActorRef().AddItem(Credits as Form, PayoffBig, False) ; #DEBUG_LINE_NO:136
  Alias_Player.GetActorRef().RemoveItem(Alias_EvidenceSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:139
  Self.SetobjectiveCompleted(100, True) ; #DEBUG_LINE_NO:142
  Self.SetStage(300) ; #DEBUG_LINE_NO:143
  Self.SetStage(700) ; #DEBUG_LINE_NO:144
  FC09_CompanionBribeReactScene.Start() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Alias_EvidenceSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:158
  Self.SetobjectiveCompleted(100, True) ; #DEBUG_LINE_NO:161
  Self.SetStage(700) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetobjectiveCompleted(100, True) ; #DEBUG_LINE_NO:179
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:180
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:181
  Alias_RonHope.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:184
  Alias_Cosette.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:185
  Alias_RonHope.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:188
  Alias_RonHope.GetActorRef().AddToFaction(FC09_CombatMusicFaction) ; #DEBUG_LINE_NO:191
  Alias_AllGuards.AddToFaction(FC09_CombatMusicFaction) ; #DEBUG_LINE_NO:192
  Alias_AllGuards.RemoveFromFaction(GuardFaction) ; #DEBUG_LINE_NO:195
  Alias_AllGuards.RemoveFromFaction(HT_GenericSecurityFaction) ; #DEBUG_LINE_NO:196
  Alias_AllGuards.RemoveFromFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:197
  Alias_RonHope.GetActorRef().RemoveFromFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:198
  Alias_Cosette.GetActorRef().RemoveFromFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:199
  Alias_Cosette.GetActorRef().RemoveFromFaction(HT_GenericSecurityFaction) ; #DEBUG_LINE_NO:200
  Self.SetStage(525) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0525_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC09_HopeTechEnemyFaction) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetobjectiveCompleted(220, True) ; #DEBUG_LINE_NO:219
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:221
    Self.SetStage(610) ; #DEBUG_LINE_NO:222
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetobjectiveCompleted(200, True) ; #DEBUG_LINE_NO:231
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:233
    Self.SetStage(610) ; #DEBUG_LINE_NO:234
  EndIf ; #DEBUG_LINE_NO:
  RAD02.SetStage(500) ; #DEBUG_LINE_NO:238
  Alias_BirgitMacDougall.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:248
  Alias_BirgitMacDougall.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:250
EndFunction

Function Fragment_Stage_0620_Item_00()
  Alias_BirgitMacDougall.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_0700_Item_00()
  If Self.IsObjectiveDisplayed(250) ; #DEBUG_LINE_NO:266
    Self.SetobjectiveCompleted(250, True) ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
  Alias_BirgitMacDougall.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:271
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0700_Item_01()
  Self.SetobjectiveCompleted(200, True) ; #DEBUG_LINE_NO:281
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_0800_Item_00()
  Alias_Player.GetActorRef().AddItem(FreestarRangerBadge_Ranger as Form, 1, False) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0900_Item_00()
  FC09_CheerForPlayerPromotionScene.Start() ; #DEBUG_LINE_NO:299
  AutumnEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:302
EndFunction

Function Fragment_Stage_2000_Item_00()
  MQ305_FSC_RonHopeKilled.SetValue(1.0) ; #DEBUG_LINE_NO:313
  Alias_Player.GetActorRef().SetValue(FC09_Completed, 1.0) ; #DEBUG_LINE_NO:316
  RAD02.SetStage(505) ; #DEBUG_LINE_NO:319
  Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[] ; #DEBUG_LINE_NO:322
  Int I = 0 ; #DEBUG_LINE_NO:323
  While I < workers.Length ; #DEBUG_LINE_NO:324
    workers[I].EnableNoWait(False) ; #DEBUG_LINE_NO:325
    I += 1 ; #DEBUG_LINE_NO:326
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 2.0) ; #DEBUG_LINE_NO:330
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:332
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_01 as Form, 1, False) ; #DEBUG_LINE_NO:335
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Helmet_01 as Form, 1, False) ; #DEBUG_LINE_NO:336
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Backpack_01 as Form, 1, False) ; #DEBUG_LINE_NO:337
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Vested as Form, 1, False) ; #DEBUG_LINE_NO:338
  Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersRifle as Form, 1, False) ; #DEBUG_LINE_NO:339
  spaceshipreference myShip = Alias_RewardShip.GetShipRef() ; #DEBUG_LINE_NO:342
  myShip.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:343
  myShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:344
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:347
  SQ_PlayerShip.AddPlayerOwnedShip(myShip) ; #DEBUG_LINE_NO:348
  FC09_ShipRewardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:352
  Game.AddAchievement(16) ; #DEBUG_LINE_NO:355
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:358
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:359
  Int z = 0 ; #DEBUG_LINE_NO:360
  While z < Alias_Companions.Length ; #DEBUG_LINE_NO:361
    Alias_Companions[z].GetActorRef().SetValue(COM_WantsToTalk_FreestarCollective_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:362
    z += 1 ; #DEBUG_LINE_NO:363
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_FreestarCollective.Send(None) ; #DEBUG_LINE_NO:365
  SE_FAB23_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:368
  FC_EvidenceSlateHolderQuest.Stop() ; #DEBUG_LINE_NO:370
  Self.Stop() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_2000_Item_01()
  Actor[] workers = Alias_WorkersToDisable.GetArray() as Actor[] ; #DEBUG_LINE_NO:381
  Int I = 0 ; #DEBUG_LINE_NO:382
  While I < workers.Length ; #DEBUG_LINE_NO:383
    workers[I].EnableNoWait(False) ; #DEBUG_LINE_NO:384
    I += 1 ; #DEBUG_LINE_NO:385
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Player.GetActorRef().SetValue(FC09_Completed, 1.0) ; #DEBUG_LINE_NO:389
  Self.SetStage(900) ; #DEBUG_LINE_NO:392
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:395
    MQ305_FSC_RonHopeBribeAccepted.SetValue(1.0) ; #DEBUG_LINE_NO:396
  Else ; #DEBUG_LINE_NO:
    MQ305_FSC_RonHopeJailed.SetValue(1.0) ; #DEBUG_LINE_NO:400
  EndIf ; #DEBUG_LINE_NO:
  RAD02.SetStage(505) ; #DEBUG_LINE_NO:404
  Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 2.0) ; #DEBUG_LINE_NO:407
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_01 as Form, 1, False) ; #DEBUG_LINE_NO:410
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Helmet_01 as Form, 1, False) ; #DEBUG_LINE_NO:411
  Alias_Player.GetActorRef().AddItem(Spacesuit_Ranger_Backpack_01 as Form, 1, False) ; #DEBUG_LINE_NO:412
  Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Vested as Form, 1, False) ; #DEBUG_LINE_NO:413
  Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersRifle as Form, 1, False) ; #DEBUG_LINE_NO:414
  spaceshipreference myShip = Alias_RewardShip.GetShipRef() ; #DEBUG_LINE_NO:417
  myShip.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:418
  myShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:419
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:422
  SQ_PlayerShip.AddPlayerOwnedShip(myShip) ; #DEBUG_LINE_NO:423
  FC09_ShipRewardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:427
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:429
  Game.AddAchievement(16) ; #DEBUG_LINE_NO:432
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:435
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:436
  Int z = 0 ; #DEBUG_LINE_NO:437
  While z < Alias_Companions.Length ; #DEBUG_LINE_NO:438
    Alias_Companions[z].GetActorRef().SetValue(COM_WantsToTalk_FreestarCollective_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:439
    z += 1 ; #DEBUG_LINE_NO:440
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_FreestarCollective.Send(None) ; #DEBUG_LINE_NO:442
  SE_FAB22_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:445
  FC_EvidenceSlateHolderQuest.Stop() ; #DEBUG_LINE_NO:447
  Self.Stop() ; #DEBUG_LINE_NO:449
EndFunction
