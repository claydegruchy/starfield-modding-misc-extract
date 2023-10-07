ScriptName Fragments:Quests:QF_FC01_0029A8F0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC01_RobberLeaderShowHostagesScene Auto Const mandatory
Scene Property FC01_RobberLeaderWarningScene Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ObjectReference Property FC01_PT1 Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Scene Property FC01_BlakeAnnouncePlayerScene Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_BankRobbersAll Auto Const mandatory
Message Property FC01_UnlockRearDoor_MSG Auto Const mandatory
ReferenceAlias Property Alias_GalBankRearDoor Auto Const mandatory
Scene Property FC01_PlayerPickedUpGun Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderInt_Rename Auto Const mandatory
ReferenceAlias Property Alias_DanielBlake Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Quest Property City_Akila_Ashta01 Auto Const mandatory
Scene Property FC01_ThreatenBankManagerScene Auto Const mandatory
Key Property FC01_GallBankRearDoorKey Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderInt Auto Const mandatory
ReferenceAlias Property Alias_WilliamCrowley Auto Const mandatory
Faction Property FC01_GunmanEnemyFaction Auto Const mandatory
GlobalVariable Property FC01_RobbersSurrendered Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
ReferenceAlias Property Alias_VaultDoor Auto Const mandatory
ReferenceAlias Property Alias_GalBankFrontDoor Auto Const mandatory
ReferenceAlias Property Alias_InteriorLightsOn_EnableMarker Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property AkilaCityShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_RobberLeaderExt Auto Const mandatory
Scene Property FC01_CompanionReactSurrender Auto Const mandatory
ReferenceAlias Property Alias_Robber02 Auto Const mandatory
ReferenceAlias Property Alias_Robber03 Auto Const mandatory
ReferenceAlias Property Alias_Robber04 Auto Const mandatory
ReferenceAlias Property Alias_Robber05 Auto Const mandatory
ReferenceAlias Property Alias_Robber06 Auto Const mandatory
GlobalVariable Property FC01CrowdDisable Auto Const mandatory
ActorValue Property FC01_Completed Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
ReferenceAlias Property Alias_ElizabethCardwell Auto Const mandatory
ObjectReference Property FC01_ElizabethCowerMarker Auto Const mandatory
ReferenceAlias Property Alias_MarkoJansen Auto Const mandatory
ObjectReference Property FC01_Marko_CowerMarker Auto Const mandatory
Keyword Property ObjectTypeWeapon Auto Const mandatory
Quest Property FC_JobsDoneSlateHolderQuest Auto Const mandatory
Quest Property FC01_DialogueHolderQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0530_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().moveto(FC01_PT1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  Frontier_ModularREF.moveto(AkilaCityShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:12
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:13
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:14
  FC01CrowdDisable.SetValue(1.0) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_VaultDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:26
  Alias_VaultDoor.GetRef().SetLockLevel(0) ; #DEBUG_LINE_NO:27
  Alias_ElizabethCardwell.GetRef().moveto(FC01_ElizabethCowerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
  Alias_MarkoJansen.GetRef().moveto(FC01_Marko_CowerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
  Alias_InteriorLightsOn_EnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:34
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:37
  FC01CrowdDisable.SetValue(1.0) ; #DEBUG_LINE_NO:40
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:43
  FC_JobsDoneSlateHolderQuest.Start() ; #DEBUG_LINE_NO:46
  FC01_DialogueHolderQuest.Start() ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:70
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:71
  If MQ103.IsRunning() && MQ103.GetStageDone(100) ; #DEBUG_LINE_NO:74
    MQ103.SetStage(220) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  FC01_RobberLeaderWarningScene.Start() ; #DEBUG_LINE_NO:86
  If MQ103.IsRunning() && MQ103.GetStageDone(100) ; #DEBUG_LINE_NO:89
    MQ103.SetStage(220) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0203_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0210_Item_00()
  FC01_BlakeAnnouncePlayerScene.Start() ; #DEBUG_LINE_NO:119
  Alias_RobberLeaderExt.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:122
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:124
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0310_Item_00()
  Alias_RobberLeaderInt_Rename.Clear() ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetStage(320) ; #DEBUG_LINE_NO:160
  Self.SetStage(345) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0340_Item_00()
  Self.SetStage(345) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:177
  FC01_RobbersSurrendered.SetValue(1.0) ; #DEBUG_LINE_NO:180
  Alias_RobberLeaderInt.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:183
  Alias_RobberLeaderInt_Rename.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:184
  Alias_Robber02.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:185
  Alias_Robber03.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:186
  Alias_Robber04.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:187
  Alias_Robber05.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:188
  Alias_Robber06.GetActorRef().SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:189
  Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:192
  Self.SetStage(400) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0355_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:210
  Self.SetStage(400) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0370_Item_00()
  FC01_CompanionReactSurrender.Start() ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:230
    Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:234
EndFunction

Function Fragment_Stage_0410_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0470_Item_00()
  FC01_UnlockRearDoor_MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:253
  Alias_GalBankRearDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:256
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Player.GetRef().AddItem(FC01_GallBankRearDoorKey as Form, 1, False) ; #DEBUG_LINE_NO:267
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:269
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:270
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:280
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:281
  Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:284
  Alias_GalBankFrontDoor.GetRef().SetLockLevel(0) ; #DEBUG_LINE_NO:287
  Alias_GalBankFrontDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:288
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_0517_Item_00()
  Self.SetStage(510) ; #DEBUG_LINE_NO:299
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Alias_Player.GetActorRef().GetItemCount(ObjectTypeWeapon as Form) != 0 && !Self.GetStageDone(517) ; #DEBUG_LINE_NO:310
    FC01_PlayerPickedUpGun.Start() ; #DEBUG_LINE_NO:311
  Else ; #DEBUG_LINE_NO:
    FC01_RobberLeaderShowHostagesScene.Start() ; #DEBUG_LINE_NO:313
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0540_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:334
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:335
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:336
  Alias_RobberLeaderExt.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:339
EndFunction

Function Fragment_Stage_0545_Item_00()
  FC01_RobberLeaderShowHostagesScene.Stop() ; #DEBUG_LINE_NO:350
  If Game.GetPlayer().IsDetectedBy(Alias_RobberLeaderInt.GetActorRef()) ; #DEBUG_LINE_NO:353
    FC01_PlayerPickedUpGun.Start() ; #DEBUG_LINE_NO:354
    Alias_RobberLeaderInt.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:355
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_BankRobbersAll.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:367
EndFunction

Function Fragment_Stage_0555_Item_00()
  FC01_ThreatenBankManagerScene.Start() ; #DEBUG_LINE_NO:375
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:377
  Alias_Robber02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:378
EndFunction

Function Fragment_Stage_0560_Item_00()
  Alias_WilliamCrowley.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:387
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:388
  Alias_Robber02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:392
EndFunction

Function Fragment_Stage_0570_Item_00()
  Alias_WilliamCrowley.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:401
  Alias_Robber02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:404
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_WilliamCrowley.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:415
  Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:417
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:418
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:427
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:435
  Alias_DanielBlake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:438
  Alias_Player.GetActorRef().SetValue(FC01_Completed, 1.0) ; #DEBUG_LINE_NO:441
  FC01_PostQuest.Start() ; #DEBUG_LINE_NO:444
  FC02.Start() ; #DEBUG_LINE_NO:445
  If Self.GetStageDone(350) ; #DEBUG_LINE_NO:448
    Self.SetStage(2010) ; #DEBUG_LINE_NO:449
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(2020) ; #DEBUG_LINE_NO:451
  EndIf ; #DEBUG_LINE_NO:
  If MQ103.IsRunning() && MQ103.GetStageDone(100) ; #DEBUG_LINE_NO:455
    MQ103.SetStage(230) ; #DEBUG_LINE_NO:456
  EndIf ; #DEBUG_LINE_NO:
  RAD02.SetStage(300) ; #DEBUG_LINE_NO:460
  City_Akila_Ashta01.SetStage(5) ; #DEBUG_LINE_NO:463
  DialogueFCAkilaCity.SetStage(1000) ; #DEBUG_LINE_NO:466
  Alias_InteriorLightsOn_EnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:469
  FC01CrowdDisable.SetValue(0.0) ; #DEBUG_LINE_NO:472
  Self.Stop() ; #DEBUG_LINE_NO:474
EndFunction
