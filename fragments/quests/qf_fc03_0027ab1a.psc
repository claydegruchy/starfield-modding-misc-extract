ScriptName Fragments:Quests:QF_FC03_0027AB1A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Blake Auto Const mandatory
ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const mandatory
ReferenceAlias Property Alias_Hannah Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC03_PT1 Auto Const mandatory
ObjectReference Property FC03_PT1_Hannah Auto Const mandatory
ObjectReference Property FC03_PT2_Hannah Auto Const mandatory
ReferenceAlias Property Alias_Emma Auto Const mandatory
Key Property FC03_ArmoryLockerKey Auto Const mandatory
Scene Property FC03_HopeIntroScene Auto Const mandatory
Scene Property FC03_CosetteInterruptScene Auto Const mandatory
Quest Property FC01 Auto Const mandatory
ObjectReference Property FC03_PT2 Auto Const mandatory
Quest Property FC04 Auto Const mandatory
ReferenceAlias Property Alias_Birgit Auto Const mandatory
ReferenceAlias Property Alias_Ron Auto Const mandatory
Scene Property FC03_ConcludeDebriefing Auto Const mandatory
Scene Property FC03_NiaDistressCallScene Auto Const mandatory
ReferenceAlias Property Alias_NiaKaluShip Auto Const mandatory
Message Property FC03_RepairMSG Auto Const mandatory
ObjectReference Property FC03_Nia_St1300SceneMarker Auto Const mandatory
ReferenceAlias Property Alias_Nia Auto Const mandatory
ReferenceAlias Property Alias_Cosette Auto Const mandatory
ReferenceAlias Property Alias_HopeOfficeDoor Auto Const mandatory
ObjectReference Property FC03_NiaWoundedMarkerRef Auto Const mandatory
Quest Property FC03_SpaceEncounterQuest Auto Const mandatory
LocationAlias Property Alias_HopeTechLocation Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ObjectReference Property SettleWaggonerFarm_ShipLandingMarkerRef Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
LocationAlias Property Alias_NiaKaluShipLocation Auto Const mandatory
ObjectReference Property FC03_StartQuestTriggerRef Auto Const mandatory
Quest Property FC01_PostQuest Auto Const mandatory
Quest Property FC02 Auto Const mandatory
ObjectReference Property FC03_EmmaDebriefMarker Auto Const mandatory
Scene Property FC03_NiaShipLandingScene Auto Const mandatory
Scene Property FC03_NiaWalkTalkScene Auto Const mandatory
ObjectReference Property FC03_Birgit_St1300Marker Auto Const mandatory
ObjectReference Property FC03_NiaWaitMarker Auto Const mandatory
ObjectReference Property FC03_Ron_St1400Marker Auto Const mandatory
Faction Property FreestarRangerFaction Auto Const mandatory
RefCollectionAlias Property Alias_GuardShips Auto Const mandatory
ActorValue Property FC03_Completed Auto Const mandatory
GlobalVariable Property NiaKaluIsInjured Auto Const mandatory
ObjectReference Property HopetownLandingMarker_NonPlayer Auto Const mandatory
ObjectReference Property HopetownLandingMarker Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel01 Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel02 Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel03 Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ReferenceAlias Property Alias_JobsDoneSlate Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel03_FX Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel02_FX Auto Const mandatory
ReferenceAlias Property Alias_RepairPanel01_FX Auto Const mandatory
Keyword Property Artifact_GravImmune Auto Const mandatory
GlobalVariable Property SQ_GuardShipsWaitToScan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1185_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1500_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1700_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Frontier_ModularREF.moveto(SettleWaggonerFarm_ShipLandingMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Frontier_ModularREF.setlinkedref(SettleWaggonerFarm_ShipLandingMarkerRef, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:11
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:12
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:13
  FC01.SetStage(2000) ; #DEBUG_LINE_NO:16
  FC01_PostQuest.SetStage(2000) ; #DEBUG_LINE_NO:17
  FC02.SetStage(2000) ; #DEBUG_LINE_NO:18
  Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction) ; #DEBUG_LINE_NO:21
  Alias_Player.GetRef().moveto(FC03_PT1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  Alias_Hannah.GetRef().moveto(FC03_PT1_Hannah, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  Alias_Blake.GetRef().moveto(FC03_DebriefScene_BlakeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
  Alias_HopeOfficeDoor.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:40
  Alias_HopeOfficeDoor.GetRef().SetLockLevel(255) ; #DEBUG_LINE_NO:41
  NiaKaluIsInjured.SetValue(1.0) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Hannah.GetRef().moveto(FC03_PT2_Hannah, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
  Alias_Player.GetRef().moveto(FC03_PT2, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Blake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:78
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:80
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_Hannah.GetRef().moveto(FC03_EmmaDebriefMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetStage(305) ; #DEBUG_LINE_NO:103
  Alias_Blake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Blake.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_Emma.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:142
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:144
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:153
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Alias_JobsDoneSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:164
  Alias_NiaKaluShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:167
  Alias_NiaKaluShip.GetShipRef().EnablePartRepair(Health, False) ; #DEBUG_LINE_NO:168
  Float fBlastDamage03 = Alias_NiaKaluShip.GetShipRef().GetBaseValue(Health) * 0.800000012 ; #DEBUG_LINE_NO:169
  Alias_NiaKaluShip.GetShipRef().DamageValue(Health, fBlastDamage03) ; #DEBUG_LINE_NO:170
  Alias_Nia.GetActorRef().SetRestrained(True) ; #DEBUG_LINE_NO:171
  Alias_Nia.GetRef().moveto(FC03_NiaWoundedMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:174
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:176
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_1025_Item_00()
  FC03_NiaDistressCallScene.Start() ; #DEBUG_LINE_NO:188
  SQ_GuardShipsWaitToScan.SetValue(1.0) ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_1030_Item_00()
  SQ_GuardShipsWaitToScan.SetValue(0.0) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(950, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(950, True) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_1150_Item_00()
  Alias_Nia.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_1160_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:241
  Self.SetObjectiveDisplayed(1050, True, False) ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_1162_Item_00()
  If Self.GetStageDone(1164) && Self.GetStageDone(1166) ; #DEBUG_LINE_NO:251
    Self.SetStage(1170) ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  Alias_RepairPanel01.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:256
  Alias_RepairPanel01_FX.GetReference().Disable(False) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_1164_Item_00()
  If Self.GetStageDone(1162) && Self.GetStageDone(1166) ; #DEBUG_LINE_NO:268
    Self.SetStage(1170) ; #DEBUG_LINE_NO:269
  EndIf ; #DEBUG_LINE_NO:
  Alias_RepairPanel02.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:273
  Alias_RepairPanel02_FX.GetReference().Disable(False) ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_1166_Item_00()
  If Self.GetStageDone(1162) && Self.GetStageDone(1164) ; #DEBUG_LINE_NO:285
    Self.SetStage(1170) ; #DEBUG_LINE_NO:286
  EndIf ; #DEBUG_LINE_NO:
  Alias_RepairPanel03.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:290
  Alias_RepairPanel03_FX.GetReference().Disable(False) ; #DEBUG_LINE_NO:293
EndFunction

Function Fragment_Stage_1170_Item_00()
  If Self.IsObjectiveDisplayed(1000) ; #DEBUG_LINE_NO:303
    Self.SetObjectiveDisplayed(1000, False, False) ; #DEBUG_LINE_NO:304
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(1050) ; #DEBUG_LINE_NO:307
    Self.SetObjectiveCompleted(1050, True) ; #DEBUG_LINE_NO:308
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_1180_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:321
  Self.SetObjectiveDisplayed(1110, True, False) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_1182_Item_00()
  FC03_SpaceEncounterQuest.Start() ; #DEBUG_LINE_NO:331
  Self.SetObjectiveCompleted(1110, True) ; #DEBUG_LINE_NO:333
  Self.SetObjectiveDisplayed(1125, True, False) ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_1190_Item_00()
  Self.SetObjectiveCompleted(1125, True) ; #DEBUG_LINE_NO:353
  Self.SetObjectiveDisplayed(1130, True, False) ; #DEBUG_LINE_NO:354
  FC03_NiaShipLandingScene.Start() ; #DEBUG_LINE_NO:357
  Alias_NiaKaluShip.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:360
  Alias_Nia.GetRef().moveto(FC03_NiaWaitMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:363
  Alias_NiaKaluShip.GetRef().moveto(HopetownLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:366
EndFunction

Function Fragment_Stage_1192_Item_00()
  Alias_Nia.GetActorRef().RemoveKeyword(Artifact_GravImmune) ; #DEBUG_LINE_NO:377
  Alias_Nia.GetActorRef().SetRestrained(False) ; #DEBUG_LINE_NO:378
  NiaKaluIsInjured.SetValue(0.0) ; #DEBUG_LINE_NO:382
  Self.SetObjectiveCompleted(1130, True) ; #DEBUG_LINE_NO:384
  Self.SetObjectiveDisplayed(1150, True, False) ; #DEBUG_LINE_NO:385
  Alias_Birgit.GetRef().moveto(FC03_Birgit_St1300Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:388
  Alias_Ron.GetRef().moveto(FC03_Ron_St1400Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_1195_Item_00()
  Alias_Nia.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_1200_Item_00()
  FC03_NiaWalkTalkScene.Start() ; #DEBUG_LINE_NO:406
  Alias_HopeOfficeDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:409
  Alias_HopeOfficeDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:410
  Self.SetObjectiveCompleted(1150, True) ; #DEBUG_LINE_NO:412
  Self.SetObjectiveDisplayed(1170, True, False) ; #DEBUG_LINE_NO:413
EndFunction

Function Fragment_Stage_1300_Item_00()
  FC03_HopeIntroScene.Start() ; #DEBUG_LINE_NO:424
  Alias_Cosette.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:427
EndFunction

Function Fragment_Stage_1350_Item_00()
  Alias_Birgit.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:439
  Alias_Nia.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_1400_Item_00()
  Alias_Ron.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:451
  Alias_GuardShips.EnableAll(False) ; #DEBUG_LINE_NO:454
  Self.SetObjectiveCompleted(1170, True) ; #DEBUG_LINE_NO:456
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:457
EndFunction

Function Fragment_Stage_1550_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:475
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:476
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:486
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:487
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:506
  Alias_Player.GetActorRef().SetValue(FC03_Completed, 1.0) ; #DEBUG_LINE_NO:509
  FC04.Start() ; #DEBUG_LINE_NO:512
  Self.Stop() ; #DEBUG_LINE_NO:514
EndFunction
