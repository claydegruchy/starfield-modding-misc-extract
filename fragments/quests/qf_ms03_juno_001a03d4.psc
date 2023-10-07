ScriptName Fragments:Quests:QF_MS03_Juno_001A03D4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS03_Juno_Arrival Auto Const mandatory
Scene Property MS03_Juno_Space_PostCombat Auto Const mandatory
ReferenceAlias Property Alias_RyujinOperative1 Auto Const mandatory
ReferenceAlias Property Alias_RyujinOperative2 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Perk Property MS03_JunoActivationPromptPerk Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_RyujinShip Auto Const mandatory
ReferenceAlias Property Alias_JunoMysteriousName Auto Const mandatory
RefCollectionAlias Property Alias_EclipticShips Auto Const mandatory
ReferenceAlias Property Alias_InsideShipStartMarker Auto Const mandatory
Scene Property MS03_Space_Initial Auto Const mandatory
ReferenceAlias Property Alias_SceneStartMarker Auto Const mandatory
ReferenceAlias Property Alias_JunoShip Auto Const mandatory
ReferenceAlias Property Alias_JunoHoldingCellMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Scene Property MS03_Juno_JumpAway_Switchboard Auto Const mandatory
ReferenceAlias Property Alias_ControlBoard Auto Const mandatory
GlobalVariable Property MS03Outcome Auto Const
ObjectReference Property SoundMarkerEnabler Auto Const
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property Juno00 Auto Const
ActorValue Property DockingPermission Auto Const
ObjectReference Property JunoActivationVolume Auto Const
ObjectReference Property JunoDoor Auto Const
Faction Property RyujinFaction Auto Const
GlobalVariable Property SE_Player_FAB19a_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB19b_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_RyujinShip.GetShipRef().Kill(None) ; #DEBUG_LINE_NO:8
  Alias_RyujinOperative1.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:11
  Alias_RyujinOperative2.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Player.GetActorReference().AddPerk(MS03_JunoActivationPromptPerk, False) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:29
  MS03_Juno_Space_PostCombat.Start() ; #DEBUG_LINE_NO:30
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0101_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:42
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:45
  Alias_EclipticShips.KillAll(None) ; #DEBUG_LINE_NO:48
  Self.SetStage(100) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:57
  MS03_Juno_Arrival.Start() ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:59
  JunoActivationVolume.BlockActivation(True, True) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0111_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:72
  Self.SetStage(101) ; #DEBUG_LINE_NO:73
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:76
  Game.GetPlayer().MoveTo(Alias_InsideShipStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:79
  Alias_PlayerShip.GetShipReference().InstantDock(Alias_JunoShip.GetShipReference() as ObjectReference) ; #DEBUG_LINE_NO:80
  Self.SetStage(110) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0112_Item_00()
  Juno00.PlayAnimation("Play01") ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:98
  Alias_RyujinOperative2.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:101
  Alias_RyujinOperative1.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0201_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:113
  Self.SetStage(101) ; #DEBUG_LINE_NO:114
  Self.SetStage(111) ; #DEBUG_LINE_NO:115
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:118
  Game.GetPlayer().MoveTo(Alias_SceneStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:121
  Self.SetStage(200) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:132
  Alias_RyujinOperative1.GetRef().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:138
  Game.GetPlayer().AddItem(Alias_ControlBoard.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0301_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:150
  Self.SetStage(101) ; #DEBUG_LINE_NO:151
  Self.SetStage(111) ; #DEBUG_LINE_NO:152
  Self.SetStage(201) ; #DEBUG_LINE_NO:153
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:156
  Self.SetStage(300) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:167
  Alias_JunoMysteriousName.ForceRefTo(None) ; #DEBUG_LINE_NO:170
  JunoActivationVolume.BlockActivation(False, False) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0351_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:183
  Self.SetStage(101) ; #DEBUG_LINE_NO:184
  Self.SetStage(111) ; #DEBUG_LINE_NO:185
  Self.SetStage(201) ; #DEBUG_LINE_NO:186
  Self.SetStage(301) ; #DEBUG_LINE_NO:187
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:190
  Self.SetStage(350) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0355_Item_00()
  Alias_RyujinOperative1.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:202
  Alias_RyujinOperative2.GetActorReference().SetEssential(False) ; #DEBUG_LINE_NO:203
  Alias_RyujinOperative1.GetActorReference().SetGhost(False) ; #DEBUG_LINE_NO:204
  Alias_RyujinOperative2.GetActorReference().SetGhost(False) ; #DEBUG_LINE_NO:205
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:207
  Self.SetObjectiveDisplayed(352, True, False) ; #DEBUG_LINE_NO:208
  Self.SetObjectiveDisplayed(355, True, False) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0356_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:220
  Self.SetStage(101) ; #DEBUG_LINE_NO:221
  Self.SetStage(111) ; #DEBUG_LINE_NO:222
  Self.SetStage(201) ; #DEBUG_LINE_NO:223
  Self.SetStage(301) ; #DEBUG_LINE_NO:224
  Self.SetStage(351) ; #DEBUG_LINE_NO:225
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:228
  Self.SetStage(355) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveSkipped(300) ; #DEBUG_LINE_NO:239
  Self.SetObjectiveCompleted(355, True) ; #DEBUG_LINE_NO:240
  Self.SetStage(550) ; #DEBUG_LINE_NO:241
  Alias_RyujinOperative1.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:244
  Alias_RyujinOperative2.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:245
  Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:248
  Alias_RyujinOperative1.GetActorRef().AddItem(Alias_ControlBoard.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:249
  Alias_RyujinOperative1.GetActorReference().SetGhost(True) ; #DEBUG_LINE_NO:252
  Alias_RyujinOperative2.GetActorReference().SetGhost(True) ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:264
  Self.SetStage(101) ; #DEBUG_LINE_NO:265
  Self.SetStage(111) ; #DEBUG_LINE_NO:266
  Self.SetStage(201) ; #DEBUG_LINE_NO:267
  Self.SetStage(301) ; #DEBUG_LINE_NO:268
  Self.SetStage(351) ; #DEBUG_LINE_NO:269
  Self.SetStage(356) ; #DEBUG_LINE_NO:270
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:274
  Self.SetStage(400) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420) ; #DEBUG_LINE_NO:285
    Self.SetStage(490) ; #DEBUG_LINE_NO:286
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410) ; #DEBUG_LINE_NO:295
    Self.SetStage(490) ; #DEBUG_LINE_NO:296
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0490_Item_00()
  Self.SetObjectiveCompleted(355, True) ; #DEBUG_LINE_NO:305
  Self.SetStage(550) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0491_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:317
  Self.SetStage(101) ; #DEBUG_LINE_NO:318
  Self.SetStage(111) ; #DEBUG_LINE_NO:319
  Self.SetStage(201) ; #DEBUG_LINE_NO:320
  Self.SetStage(301) ; #DEBUG_LINE_NO:321
  Self.SetStage(351) ; #DEBUG_LINE_NO:322
  Self.SetStage(356) ; #DEBUG_LINE_NO:323
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:326
  Alias_RyujinOperative1.TryToKill(None) ; #DEBUG_LINE_NO:329
  Alias_RyujinOperative2.TryToKill(None) ; #DEBUG_LINE_NO:330
  Self.SetStage(490) ; #DEBUG_LINE_NO:331
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Player.GetActorReference().RemovePerk(MS03_JunoActivationPromptPerk) ; #DEBUG_LINE_NO:339
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:340
  Self.SetObjectiveCompleted(352, True) ; #DEBUG_LINE_NO:341
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:343
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:345
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:346
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddToFaction(RyujinFaction) ; #DEBUG_LINE_NO:350
  Alias_RyujinOperative1.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:351
  Alias_RyujinOperative2.GetActorReference().SetEssential(True) ; #DEBUG_LINE_NO:352
  Alias_RyujinOperative1.GetActorReference().IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:353
  Alias_RyujinOperative2.GetActorReference().IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:354
  Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:357
  MS03Outcome.SetValue(1.0) ; #DEBUG_LINE_NO:360
  Juno00.BlockActivation(True, True) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0501_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:377
  Self.SetStage(101) ; #DEBUG_LINE_NO:378
  Self.SetStage(111) ; #DEBUG_LINE_NO:379
  Self.SetStage(201) ; #DEBUG_LINE_NO:380
  Self.SetStage(301) ; #DEBUG_LINE_NO:381
  Self.SetStage(351) ; #DEBUG_LINE_NO:382
  Self.SetStage(356) ; #DEBUG_LINE_NO:383
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:386
  Self.SetStage(500) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveSkipped(300) ; #DEBUG_LINE_NO:397
  Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:398
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:406
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:407
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:410
  Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:411
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:412
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:414
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:415
  EndIf ; #DEBUG_LINE_NO:
  JunoDoor.Unlock(False) ; #DEBUG_LINE_NO:419
  JunoDoor.SetOpen(True) ; #DEBUG_LINE_NO:420
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:423
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:424
    kmyQuest.AddPassenger(Alias_RyujinOperative1) ; #DEBUG_LINE_NO:425
    kmyQuest.AddPassenger(Alias_RyujinOperative2) ; #DEBUG_LINE_NO:426
  EndIf ; #DEBUG_LINE_NO:
  Juno00.BlockActivation(True, True) ; #DEBUG_LINE_NO:430
EndFunction

Function Fragment_Stage_0601_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:441
  Self.SetStage(101) ; #DEBUG_LINE_NO:442
  Self.SetStage(111) ; #DEBUG_LINE_NO:443
  Self.SetStage(201) ; #DEBUG_LINE_NO:444
  Self.SetStage(301) ; #DEBUG_LINE_NO:445
  Self.SetStage(351) ; #DEBUG_LINE_NO:446
  Self.SetStage(356) ; #DEBUG_LINE_NO:447
  Self.SetStage(401) ; #DEBUG_LINE_NO:448
  ((Self as Quest) as debugstopallscenesquestscript).StopAllScenes() ; #DEBUG_LINE_NO:451
  Self.SetStage(600) ; #DEBUG_LINE_NO:454
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:462
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:463
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:471
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:472
  Alias_JunoShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:475
  MS03_Juno_JumpAway_Switchboard.Start() ; #DEBUG_LINE_NO:477
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:485
  Alias_JunoShip.GetShipRef().SetGhost(False) ; #DEBUG_LINE_NO:488
  Alias_JunoShip.GetShipRef().IsEssential(False) ; #DEBUG_LINE_NO:489
  spaceshipreference shipRef = Alias_JunoShip.GetShipReference() ; #DEBUG_LINE_NO:492
  shipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:493
  shipRef.MoveTo(Alias_JunoHoldingCellMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:494
  If Self.GetStageDone(400) == False ; #DEBUG_LINE_NO:496
    Self.SetStage(1000) ; #DEBUG_LINE_NO:498
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:507
  Self.SetStage(1000) ; #DEBUG_LINE_NO:510
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(400) == False ; #DEBUG_LINE_NO:519
    Self.SetStage(9999) ; #DEBUG_LINE_NO:520
  EndIf ; #DEBUG_LINE_NO:
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:525
  SE_Player_FAB19a_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:526
  SE_Player_FAB19b_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:527
EndFunction

Function Fragment_Stage_9999_Item_00()
  Alias_RyujinOperative1.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:536
  Alias_RyujinOperative2.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:537
  Self.Stop() ; #DEBUG_LINE_NO:540
EndFunction
