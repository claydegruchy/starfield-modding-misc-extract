ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Q02_00002FAE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_companionsscript Property SQ_Companions Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
Perk Property StarbornPerk Auto Const mandatory
Scene Property Scene_HelloBarrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_OtherBarrett Auto Const mandatory
ReferenceAlias Property Alias_MapMarker_Temple Auto Const mandatory
ReferenceAlias Property Alias_OtherBarrett Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_Puzzle Auto Const mandatory
ReferenceAlias Property Alias_Actor_Starborn Auto Const mandatory
ReferenceAlias Property Alias_Spaceship_Starborn Auto Const mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const mandatory
Scene Property Scene_ArrivedAtTemple Auto Const mandatory
Scene Property Scene_InsideTemple Auto Const mandatory
Scene Property Scene_SolvedPuzzle Auto Const mandatory
Scene Property Scene_BarrettUsesPower Auto Const mandatory
Scene Property Scene_OtherBarrettAppears Auto Const mandatory
Scene Property Scene_BarrettReplies Auto Const mandatory
Scene Property Scene_LosingPower Auto Const mandatory
Scene Property Scene_OtherBarrettExitWarning Auto Const mandatory
Scene Property Scene_CherishThem Auto Const mandatory
Scene Property Scene_AlreadyDo Auto Const mandatory
Quest Property BarrettQuest Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Player Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Activator_Temple_TriggerEntry Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Scene Property BQ01_Scene_GREET_8700_TalkToBarretts Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const mandatory
Message Property BQ02CompanionLockInMSG Auto Const mandatory
Message Property BQ02CompanionLockInOverMSG Auto Const mandatory
Scene Property SceneThankYou Auto Const mandatory
Scene Property ScenePuzzleSolved Auto Const mandatory
LocationAlias Property BarrettTempleLocationAlias Auto Const mandatory
LocationAlias Property Alias_Location_Temple Auto Const mandatory
Scene Property BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved Auto Const mandatory
ActorValue Property COM_Quest_Barrett_Q02_Complete_AV Auto Const mandatory
Spell Property BarrettSpell Auto Const mandatory
RefCollectionAlias Property Alias_CollisionMarkers Auto Const mandatory
Spell Property AbStarbornTeleportAlt Auto Const mandatory
ReferenceAlias Property Alias_Marker_Temple_Starborn Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Spell Property AIPower_ParallelSelf Auto Const mandatory
Armor[] Property BarrettSpacesuitForms Auto Const mandatory
GlobalVariable Property COM_BQ01_WaitToggle Auto Const mandatory
ReferenceAlias Property Alias_PlayerPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  (Alias_Activator_Temple_Trigger.GetRef() as sbringpuzzlenewscript).CompletePuzzle() ; #DEBUG_LINE_NO:15
  BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0011_Item_00()
  Alias_OtherBarrett.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  Alias_OtherBarrett.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_20000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:34
  Self.Stop() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_7401_Item_00()
  Self.SetStage(8300) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_8000_Item_00()
  If !Self.GetStageDone(8010) ; #DEBUG_LINE_NO:51
    Self.SetStage(8100) ; #DEBUG_LINE_NO:52
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(8300) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8001_Item_00()
  Self.SetStage(8401) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_8010_Item_00()
  Self.SetStage(8120) ; #DEBUG_LINE_NO:71
  Self.SetStage(8301) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_8100_Item_00()
  Self.SetObjectiveDisplayed(8100, True, False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_8101_Item_00()
  If Self.GetStageDone(8120) && !Self.GetStageDone(8110) ; #DEBUG_LINE_NO:88
    Self.SetObjectiveSkipped(8100) ; #DEBUG_LINE_NO:89
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(8100, True) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(8300) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_8111_Item_00()
  Self.SetStage(8120) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_8112_Item_00()
  Self.SetStage(8120) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_8120_Item_00()
  Self.SetStage(8101) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_8200_Item_00()
  Self.SetStage(8300) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_8300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:134
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:135
  Self.SetObjectiveCompleted(7500, True) ; #DEBUG_LINE_NO:138
  Self.SetObjectiveDisplayed(8300, True, False) ; #DEBUG_LINE_NO:139
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:141
  BarrettTempleLocationAlias.ForceLocationTo(Alias_Location_Temple.GetLocation()) ; #DEBUG_LINE_NO:143
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:146
  SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, True, BQ02CompanionLockInMSG, None) ; #DEBUG_LINE_NO:147
  COM_BQ01_WaitToggle.SetValue(1.0) ; #DEBUG_LINE_NO:148
  SQ_Followers.CommandFollow(BarrettRef) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_8301_Item_00()
  Self.SetObjectiveCompleted(8300, True) ; #DEBUG_LINE_NO:157
  Self.SetStage(8400) ; #DEBUG_LINE_NO:159
  Self.SetStage(8310) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_8310_Item_00()
  Scene_ArrivedAtTemple.Start() ; #DEBUG_LINE_NO:168
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_8400_Item_00()
  Self.SetObjectiveDisplayed(8400, True, False) ; #DEBUG_LINE_NO:177
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_8401_Item_00()
  Self.SetObjectiveCompleted(8400, True) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_8405_Item_00()
  Alias_Marker_Temple_OtherBarrett.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_8410_Item_00()
  Self.SetStage(8415) ; #DEBUG_LINE_NO:202
  Self.SetStage(8500) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_8415_Item_00()
  ObjectReference BarrettRef = Alias_Barrett.GetRef() ; #DEBUG_LINE_NO:211
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:212
  If PlayerRef.GetDistance(BarrettRef) > 10.0 ; #DEBUG_LINE_NO:214
    BarrettRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:215
  EndIf ; #DEBUG_LINE_NO:
  Scene_InsideTemple.Start() ; #DEBUG_LINE_NO:218
EndFunction

Function Fragment_Stage_8500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:226
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:227
  kmyQuest.BQ01_Enablelayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:230
  kmyQuest.BQ01_Enablelayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:231
  kmyQuest.BQ01_Enablelayer.EnableGravJump(False) ; #DEBUG_LINE_NO:232
  kmyQuest.BQ01_Enablelayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:233
  Alias_PlayerPilotSeat.RefillAlias() ; #DEBUG_LINE_NO:234
  Alias_PlayerPilotSeat.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_8501_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:243
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:244
  BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Stop() ; #DEBUG_LINE_NO:247
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:248
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef() ; #DEBUG_LINE_NO:249
  BarrettRef.MoveTo(Alias_Marker_Temple_Barrett.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:250
  BarrettRef.AddSpell(AbStarbornTeleport, True) ; #DEBUG_LINE_NO:251
  BarrettRef.SetGhost(True) ; #DEBUG_LINE_NO:252
  BarrettRef.SetRestrained(True) ; #DEBUG_LINE_NO:253
  OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_8502_Item_00()
  ScenePuzzleSolved.Start() ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_8505_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:270
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:271
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:274
  BarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:275
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:276
  Self.SetStage(8510) ; #DEBUG_LINE_NO:278
  Self.SetStage(8600) ; #DEBUG_LINE_NO:279
  ObjectReference WaitMarkerRef = Alias_Marker_Temple_Barrett.GetRef() ; #DEBUG_LINE_NO:281
  SQ_Followers.CommandWait(Alias_Barrett.GetActorRef(), WaitMarkerRef) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_8510_Item_00()
  Scene_BarrettUsesPower.Start() ; #DEBUG_LINE_NO:291
EndFunction

Function Fragment_Stage_8600_Item_00()
  Self.SetObjectiveDisplayed(8600, True, False) ; #DEBUG_LINE_NO:299
  Self.SetStage(8605) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_8601_Item_00()
  Self.SetObjectiveCompleted(8600, True) ; #DEBUG_LINE_NO:309
  Self.SetStage(8700) ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_8605_Item_00()
  Self.SetStage(8610) ; #DEBUG_LINE_NO:319
  Self.SetStage(8001) ; #DEBUG_LINE_NO:320
  Alias_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_8615_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:330
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:331
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef() ; #DEBUG_LINE_NO:334
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:335
  Scene_BarrettUsesPower.Stop() ; #DEBUG_LINE_NO:336
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:337
  OtherBarrettRef.Enable(False) ; #DEBUG_LINE_NO:339
  OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:340
  OtherBarrettRef.AddSpell(AbStarbornTeleport, True) ; #DEBUG_LINE_NO:341
  OtherBarrettRef.SetRestrained(True) ; #DEBUG_LINE_NO:342
  OtherBarrettRef.SetGhost(True) ; #DEBUG_LINE_NO:343
  Int I = 0 ; #DEBUG_LINE_NO:345
  While I < BarrettSpacesuitForms.Length ; #DEBUG_LINE_NO:346
    If BarrettRef.IsEquipped(BarrettSpacesuitForms[I] as Form) ; #DEBUG_LINE_NO:347
      OtherBarrettRef.EquipItem(BarrettSpacesuitForms[I] as Form, False, False) ; #DEBUG_LINE_NO:348
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:350
  EndWhile ; #DEBUG_LINE_NO:
  BarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:353
  kmyQuest.BQ01_Enablelayer.EnableMenu(True) ; #DEBUG_LINE_NO:354
  Self.SetStage(8620) ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_8620_Item_00()
  Scene_OtherBarrettAppears.Start() ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_8625_Item_00()
  Scene_OtherBarrettAppears.Stop() ; #DEBUG_LINE_NO:371
  Scene_BarrettReplies.Start() ; #DEBUG_LINE_NO:372
  Self.SetStage(8700) ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_8700_Item_00()
  Self.SetObjectiveDisplayed(8700, True, False) ; #DEBUG_LINE_NO:381
  Alias_OtherBarrett.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:382
  Alias_Barrett.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:383
  Self.SetStage(8601) ; #DEBUG_LINE_NO:384
EndFunction

Function Fragment_Stage_8701_Item_00()
  Self.SetObjectiveCompleted(8700, True) ; #DEBUG_LINE_NO:392
  Self.SetStage(8800) ; #DEBUG_LINE_NO:393
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:394
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef() ; #DEBUG_LINE_NO:395
  BarrettRef.SetRestrained(False) ; #DEBUG_LINE_NO:397
  BarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:398
  OtherBarrettRef.SetRestrained(False) ; #DEBUG_LINE_NO:399
  OtherBarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:400
  SQ_Followers.CommandFollow(BarrettRef) ; #DEBUG_LINE_NO:401
EndFunction

Function Fragment_Stage_8713_Item_00()
  spaceshipreference StarbornRef = Alias_Spaceship_Starborn.GetShipRef() ; #DEBUG_LINE_NO:409
EndFunction

Function Fragment_Stage_8714_Item_00()
  spaceshipreference StarbornRef = Alias_Spaceship_Starborn.GetShipRef() ; #DEBUG_LINE_NO:417
  StarbornRef.EnableNoWait(False) ; #DEBUG_LINE_NO:419
  StarbornRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:420
EndFunction

Function Fragment_Stage_8720_Item_00()
  BQ01_Scene_GREET_8700_TalkToBarretts.Stop() ; #DEBUG_LINE_NO:428
  Self.SetStage(8701) ; #DEBUG_LINE_NO:430
  If Self.GetStageDone(8812) ; #DEBUG_LINE_NO:432
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:433
    Self.SetStage(8805) ; #DEBUG_LINE_NO:434
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8800_Item_00()
  Self.SetObjectiveDisplayed(8800, True, False) ; #DEBUG_LINE_NO:443
EndFunction

Function Fragment_Stage_8801_Item_00()
  Self.SetObjectiveCompleted(8800, True) ; #DEBUG_LINE_NO:451
  Self.SetStage(8900) ; #DEBUG_LINE_NO:452
EndFunction

Function Fragment_Stage_8805_Item_00()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:460
  Actor StarbornRef = Alias_Actor_Starborn.GetActorRef() ; #DEBUG_LINE_NO:462
  StarbornRef.Enable(False) ; #DEBUG_LINE_NO:464
  StarbornRef.MoveTo(Alias_Marker_Temple_Starborn.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:465
  StarbornRef.AddSpell(AbStarbornTeleport, True) ; #DEBUG_LINE_NO:466
EndFunction

Function Fragment_Stage_8812_Item_00()
  If Self.GetStageDone(8701) && Self.GetStageDone(8720) ; #DEBUG_LINE_NO:474
    Self.SetStage(8805) ; #DEBUG_LINE_NO:475
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8820_Item_00()
  Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef() ; #DEBUG_LINE_NO:484
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:485
  BarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:487
  OtherBarrettRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:488
  BarrettRef.BlockActivation(False, True) ; #DEBUG_LINE_NO:490
  Self.SetStage(8830) ; #DEBUG_LINE_NO:492
  Self.SetStage(8801) ; #DEBUG_LINE_NO:493
EndFunction

Function Fragment_Stage_8830_Item_00()
  Scene_LosingPower.Start() ; #DEBUG_LINE_NO:501
EndFunction

Function Fragment_Stage_8850_Item_00()
  Utility.Wait(3.5) ; #DEBUG_LINE_NO:509
  Alias_OtherBarrett.GetActorRef().AddSpell(AbStarbornDeath, True) ; #DEBUG_LINE_NO:510
EndFunction

Function Fragment_Stage_8860_Item_00()
  ObjectReference OtherBarrettRef = Alias_OtherBarrett.GetRef() ; #DEBUG_LINE_NO:518
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:519
  OtherBarrettRef.Disable(False) ; #DEBUG_LINE_NO:520
  SceneThankYou.Start() ; #DEBUG_LINE_NO:522
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.SetObjectiveDisplayed(8900, True, False) ; #DEBUG_LINE_NO:530
  Alias_Barrett.GetActorRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_8901_Item_00()
  Self.SetObjectiveCompleted(8900, True) ; #DEBUG_LINE_NO:540
  If Self.GetStageDone(275) ; #DEBUG_LINE_NO:542
    Self.SetStage(280) ; #DEBUG_LINE_NO:543
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(9000) ; #DEBUG_LINE_NO:545
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_8920_Item_00()
  Self.SetStage(8930) ; #DEBUG_LINE_NO:554
  Self.SetStage(8901) ; #DEBUG_LINE_NO:555
EndFunction

Function Fragment_Stage_8930_Item_00()
  If Self.GetStageDone(275) && !Self.GetStageDone(280) ; #DEBUG_LINE_NO:563
    Self.SetStage(280) ; #DEBUG_LINE_NO:564
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:573
  bq01_questscript kmyQuest = __temp as bq01_questscript ; #DEBUG_LINE_NO:574
  Actor BarrettRef = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:578
  If !COM_Quest_Barrett_Q01.IsRunning() ; #DEBUG_LINE_NO:580
    SQ_Companions.LockInCompanion(BarrettRef as companionactorscript, False, BQ02CompanionLockInOverMSG, None) ; #DEBUG_LINE_NO:581
    COM_BQ01_WaitToggle.SetValue(0.0) ; #DEBUG_LINE_NO:582
  EndIf ; #DEBUG_LINE_NO:
  BarrettRef.RemoveSpell(AbStarbornTeleport) ; #DEBUG_LINE_NO:585
  BarrettRef.AddSpell(AIPower_ParallelSelf, True) ; #DEBUG_LINE_NO:586
  Game.GetPlayer().SetValue(COM_Quest_Barrett_Q02_Complete_AV, 1.0) ; #DEBUG_LINE_NO:588
  Alias_CollisionMarkers.DisableAll(False) ; #DEBUG_LINE_NO:590
  kmyQuest.BQ01_Enablelayer.Delete() ; #DEBUG_LINE_NO:592
  Alias_PlayerPilotSeat.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:593
  If Self.GetStageDone(275) ; #DEBUG_LINE_NO:595
    Self.SetStage(9100) ; #DEBUG_LINE_NO:596
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(9200) ; #DEBUG_LINE_NO:598
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:607
EndFunction

Function Fragment_Stage_9200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:615
EndFunction

Function Fragment_Stage_9999_Item_00()
  Self.SetStage(8860) ; #DEBUG_LINE_NO:623
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:624
EndFunction
