ScriptName Fragments:Quests:QF_RI01_002C9C97 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NeonStartMarker Auto Const mandatory
Scene Property RI01_250_Imogene_IntroScene Auto Const mandatory
Scene Property RI01_400_Imogene_InterviewScene Auto Const mandatory
ReferenceAlias Property Alias_RyujinCoffeeMarker Auto Const mandatory
MiscObject Property RI01_TerraBrewOrder Auto Const mandatory
Scene Property RI01_510_Tomo_ConfrontationScene Auto Const mandatory
ReferenceAlias Property Alias_TomoHigashi Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisStartMarker Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerWillRunThePlace Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerWhateverItTakes Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerPromisedTomo Auto Const mandatory
Scene Property RI01_700_Companion_TomoPromiseScene Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
ReferenceAlias Property Alias_TerraBrewCoffeeOrder Auto Const mandatory
Scene Property RI01_500_Tomo_ConfrontationScene Auto Const mandatory
Scene Property RI01_200_Lane_GreetingScene Auto Const mandatory
ReferenceAlias Property Alias_LaneGarza Auto Const mandatory
Scene Property RI01_230_Lane_FollowScene Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewTomoMarker Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer01 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer02 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer03 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer04 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewSceneMarker01 Auto Const mandatory
Scene Property RI01_500_Customer03_CommentScene Auto Const mandatory
Scene Property RI01_500_Customer02_CommentScene Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_RyujinCounter Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property PlayerJoined_Ryujin Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
GlobalVariable Property PlayerKnows_Bayu Auto Const mandatory
ReferenceAlias Property Alias_GenevieveMonohan Auto Const mandatory
ReferenceAlias Property Alias_LindenCalderi Auto Const mandatory
ReferenceAlias Property Alias_CamdenCho Auto Const mandatory
ReferenceAlias Property Alias_AlexisPryce Auto Const mandatory
ReferenceAlias Property Alias_RyujinAlexisConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinCamdenConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinGenevieveConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinLindenConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinImogeneQS Auto Const mandatory
MiscObject Property RI01_ImogeneCoffee Auto Const mandatory
MiscObject Property RI01_LindenCoffee Auto Const mandatory
MiscObject Property RI01_GenevieveCoffee Auto Const mandatory
MiscObject Property RI01_CamdenCoffee Auto Const mandatory
MiscObject Property RI01_AlexisCoffee Auto Const mandatory
ReferenceAlias Property Alias_CoffeeCamden Auto Const mandatory
ReferenceAlias Property Alias_CoffeeLinden Auto Const mandatory
ReferenceAlias Property Alias_CoffeeGenevieve Auto Const mandatory
ReferenceAlias Property Alias_CoffeeAlexis Auto Const mandatory
ReferenceAlias Property Alias_CoffeeImogene Auto Const mandatory
ReferenceAlias Property Alias_ImogeneSalzo Auto Const mandatory
Potion Property RI01_YukoCoffee Auto Const mandatory
ActorValue Property RI01_Completed Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ReferenceAlias Property Alias_YukoSerrano Auto Const mandatory
ReferenceAlias Property Alias_RyujinPlayerChair Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewEmployee Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewTomoStartMarker Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
ReferenceAlias Property Alias_PathingOperative Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_NeonStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_NewAtlantisStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:25
  LC044.SetStage(400) ; #DEBUG_LINE_NO:26
  Self.SetStage(100) ; #DEBUG_LINE_NO:27
  Self.SetStage(150) ; #DEBUG_LINE_NO:28
  Self.SetStage(200) ; #DEBUG_LINE_NO:29
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0003_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:38
  LC044.SetStage(400) ; #DEBUG_LINE_NO:39
  Self.SetStage(500) ; #DEBUG_LINE_NO:40
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0004_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:49
  LC044.SetStage(400) ; #DEBUG_LINE_NO:50
  Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:53
  Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:54
  Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:55
  Self.SetStage(800) ; #DEBUG_LINE_NO:56
  Game.GetPlayer().MoveTo(Alias_RyujinImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:67
  LC044.SetStage(400) ; #DEBUG_LINE_NO:68
  Self.SetStage(800) ; #DEBUG_LINE_NO:69
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:78
  Alias_YukoSerrano.GetRef().Disable(False) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:87
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:96
  Self.SetObjectiveDisplayedAtTop(200) ; #DEBUG_LINE_NO:97
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:99
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
  LC044.SetStage(350) ; #DEBUG_LINE_NO:103
  LC044.SetStage(400) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0210_Item_00()
  RI01_200_Lane_GreetingScene.Start() ; #DEBUG_LINE_NO:112
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(220) ; #DEBUG_LINE_NO:129
  Self.SetObjectiveDisplayed(230, True, False) ; #DEBUG_LINE_NO:130
  Alias_LaneGarza.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0235_Item_00()
  RI01_230_Lane_FollowScene.Start() ; #DEBUG_LINE_NO:139
  Alias_PathingOperative.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0250_Item_00()
  RI01_250_Imogene_IntroScene.Start() ; #DEBUG_LINE_NO:156
  Alias_LaneGarza.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:157
  If Self.IsObjectiveDisplayed(210) ; #DEBUG_LINE_NO:159
    Self.SetObjectiveDisplayed(210, False, False) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_PathingOperative.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(230) ; #DEBUG_LINE_NO:177
    Self.SetObjectiveDisplayed(230, False, False) ; #DEBUG_LINE_NO:178
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:181
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:190
  ri01_questscript kmyQuest = __temp as ri01_questscript ; #DEBUG_LINE_NO:191
  kmyQuest.FreezeControls() ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:202
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:203
  If Self.IsObjectiveDisplayed(210) ; #DEBUG_LINE_NO:204
    Self.SetObjectiveDisplayed(210, False, False) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:208
  RI01_250_Imogene_IntroScene.Stop() ; #DEBUG_LINE_NO:209
  RI01_400_Imogene_InterviewScene.Start() ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0410_Item_00()
  RI01_Track_PlayerWhateverItTakes.SetValue(1.0) ; #DEBUG_LINE_NO:218
EndFunction

Function Fragment_Stage_0411_Item_00()
  RI01_Track_PlayerWillRunThePlace.SetValue(1.0) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:234
  ri01_questscript kmyQuest = __temp as ri01_questscript ; #DEBUG_LINE_NO:235
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:238
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:239
  kmyQuest.UnfreezeControls() ; #DEBUG_LINE_NO:240
  Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:242
  PlayerJoined_Ryujin.SetValue(1.0) ; #DEBUG_LINE_NO:243
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False) ; #DEBUG_LINE_NO:244
  RI01_JobAdRadio.SetStage(1000) ; #DEBUG_LINE_NO:245
  Alias_NeonTerraBrewCustomer01.GetRef().Enable(False) ; #DEBUG_LINE_NO:247
  Alias_NeonTerraBrewCustomer01.GetRef().MoveTo(Alias_NeonTerraBrewSceneMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:248
  Alias_NeonTerraBrewCustomer02.TryToEnable() ; #DEBUG_LINE_NO:249
  Alias_NeonTerraBrewCustomer03.TryToEnable() ; #DEBUG_LINE_NO:250
  Alias_NeonTerraBrewCustomer04.TryToEnable() ; #DEBUG_LINE_NO:251
  ObjectReference ChairRef = Alias_RyujinPlayerChair.GetRef() ; #DEBUG_LINE_NO:253
  If ChairRef.IsFurnitureInUse(False) ; #DEBUG_LINE_NO:254
    ChairRef.Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:255
  EndIf ; #DEBUG_LINE_NO:
  Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef() ; #DEBUG_LINE_NO:258
  TBEmployeeRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:259
  TBEmployeeRef.AddAliasedItem(RI01_TerraBrewOrder as Form, Alias_TerraBrewCoffeeOrder as Alias, 1, True) ; #DEBUG_LINE_NO:260
  TBEmployeeRef.SetValue(Assistance, 0.0) ; #DEBUG_LINE_NO:261
EndFunction

Function Fragment_Stage_0515_Item_00()
  RI01_500_Customer02_CommentScene.Start() ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0516_Item_00()
  RI01_500_Customer03_CommentScene.Start() ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0520_Item_00()
  Actor TomoRef = Alias_TomoHigashi.GetActorRef() ; #DEBUG_LINE_NO:285
  TomoRef.Enable(False) ; #DEBUG_LINE_NO:286
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:287
  RI01_500_Tomo_ConfrontationScene.Start() ; #DEBUG_LINE_NO:288
  Alias_NeonTerraBrewEmployee.Clear() ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0530_Item_00()
  If Self.GetStageDone(700) ; #DEBUG_LINE_NO:297
    Self.SetStage(800) ; #DEBUG_LINE_NO:298
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_TomoHigashi.GetRef().Enable(False) ; #DEBUG_LINE_NO:307
  Alias_TomoHigashi.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:308
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:316
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:317
  Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef() ; #DEBUG_LINE_NO:319
  TBEmployeeRef.AddToFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:320
  TBEmployeeRef.SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:321
EndFunction

Function Fragment_Stage_0628_Item_00()
  RI01_Track_PlayerPromisedTomo.SetValue(1.0) ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0629_Item_00()
  RI01_Track_PlayerPromisedTomo.SetValue(2.0) ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:345
  Self.SetObjectiveDisplayed(630, True, False) ; #DEBUG_LINE_NO:346
  Actor TomoRef = Alias_TomoHigashi.GetActorRef() ; #DEBUG_LINE_NO:347
  TomoRef.SetEssential(False) ; #DEBUG_LINE_NO:349
  TomoRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:350
  TomoRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:351
  TomoRef.SetValue(Confidence, 4.0) ; #DEBUG_LINE_NO:352
  TomoRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:353
  TomoRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0640_Item_00()
  Alias_TomoHigashi.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:362
  Alias_TomoHigashi.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:363
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(630, True) ; #DEBUG_LINE_NO:371
  Self.SetStage(700) ; #DEBUG_LINE_NO:372
  RI01_TomoDead.SetValue(1.0) ; #DEBUG_LINE_NO:373
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:374
  Alias_TomoHigashi.Clear() ; #DEBUG_LINE_NO:375
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:383
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:384
  If !Self.GetStageDone(520) ; #DEBUG_LINE_NO:386
    RI01_700_Companion_TomoPromiseScene.Start() ; #DEBUG_LINE_NO:387
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(530) ; #DEBUG_LINE_NO:390
    Self.SetStage(800) ; #DEBUG_LINE_NO:391
  EndIf ; #DEBUG_LINE_NO:
  Actor TomoRef = Alias_TomoHigashi.GetActorRef() ; #DEBUG_LINE_NO:394
  TomoRef.SetEssential(False) ; #DEBUG_LINE_NO:396
  TomoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:405
EndFunction

Function Fragment_Stage_0710_Item_00()
  Game.GetPlayer().AddItem(Alias_TerraBrewCoffeeOrder.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:413
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:421
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:422
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:424
  Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:427
  Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:428
  Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:429
  Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:430
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:438
  Self.SetStage(900) ; #DEBUG_LINE_NO:439
  Self.SetStage(1000) ; #DEBUG_LINE_NO:440
  Self.SetStage(1100) ; #DEBUG_LINE_NO:441
  Self.SetStage(1200) ; #DEBUG_LINE_NO:442
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:447
  PlayerRef.AddItem(RI01_YukoCoffee as Form, 1, True) ; #DEBUG_LINE_NO:448
  PlayerRef.AddAliasedItem(RI01_ImogeneCoffee as Form, Alias_CoffeeImogene as Alias, 1, True) ; #DEBUG_LINE_NO:449
  PlayerRef.RemoveItem(RI01_ImogeneCoffee as Form, 1, False, None) ; #DEBUG_LINE_NO:450
  Alias_ImogeneSalzo.GetRef().AddItem(RI01_ImogeneCoffee as Form, 1, False) ; #DEBUG_LINE_NO:451
  PlayerRef.RemoveItem(RI01_TerraBrewOrder as Form, 99, True, None) ; #DEBUG_LINE_NO:452
  PlayerRef.AddAliasedItem(RI01_AlexisCoffee as Form, Alias_CoffeeAlexis as Alias, 1, True) ; #DEBUG_LINE_NO:453
  PlayerRef.AddAliasedItem(RI01_CamdenCoffee as Form, Alias_CoffeeCamden as Alias, 1, True) ; #DEBUG_LINE_NO:454
  PlayerRef.AddAliasedItem(RI01_GenevieveCoffee as Form, Alias_CoffeeGenevieve as Alias, 1, True) ; #DEBUG_LINE_NO:455
  PlayerRef.AddAliasedItem(RI01_LindenCoffee as Form, Alias_CoffeeLinden as Alias, 1, True) ; #DEBUG_LINE_NO:456
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:464
EndFunction

Function Fragment_Stage_0905_Item_00()
  Game.GetPlayer().RemoveItem(RI01_AlexisCoffee as Form, 1, False, None) ; #DEBUG_LINE_NO:472
  Alias_AlexisPryce.GetRef().AddItem(RI01_AlexisCoffee as Form, 1, False) ; #DEBUG_LINE_NO:473
EndFunction

Function Fragment_Stage_0910_Item_00()
  PlayerKnows_Bayu.SetValue(1.0) ; #DEBUG_LINE_NO:481
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:489
  If Self.GetStageDone(1050) && Self.GetStageDone(1150) && Self.GetStageDone(1250) ; #DEBUG_LINE_NO:491
    Self.SetStage(1300) ; #DEBUG_LINE_NO:492
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(1300, True) ; #DEBUG_LINE_NO:501
  Game.AddAchievement(17) ; #DEBUG_LINE_NO:504
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:512
EndFunction

Function Fragment_Stage_1005_Item_00()
  Game.GetPlayer().RemoveItem(RI01_CamdenCoffee as Form, 1, False, None) ; #DEBUG_LINE_NO:520
  Alias_CamdenCho.GetRef().AddItem(RI01_CamdenCoffee as Form, 1, False) ; #DEBUG_LINE_NO:521
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:529
  If Self.GetStageDone(950) && Self.GetStageDone(1150) && Self.GetStageDone(1250) ; #DEBUG_LINE_NO:531
    Self.SetStage(1300) ; #DEBUG_LINE_NO:532
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:541
EndFunction

Function Fragment_Stage_1105_Item_00()
  Game.GetPlayer().RemoveItem(RI01_GenevieveCoffee as Form, 1, False, None) ; #DEBUG_LINE_NO:549
  Alias_GenevieveMonohan.GetRef().AddItem(RI01_GenevieveCoffee as Form, 1, False) ; #DEBUG_LINE_NO:550
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:558
  If Self.GetStageDone(950) && Self.GetStageDone(1050) && Self.GetStageDone(1250) ; #DEBUG_LINE_NO:560
    Self.SetStage(1300) ; #DEBUG_LINE_NO:561
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:570
EndFunction

Function Fragment_Stage_1205_Item_00()
  Game.GetPlayer().RemoveItem(RI01_LindenCoffee as Form, 1, False, None) ; #DEBUG_LINE_NO:578
  Alias_LindenCalderi.GetRef().AddItem(RI01_LindenCoffee as Form, 1, False) ; #DEBUG_LINE_NO:579
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:587
  If Self.GetStageDone(950) && Self.GetStageDone(1050) && Self.GetStageDone(1150) ; #DEBUG_LINE_NO:589
    Self.SetStage(1300) ; #DEBUG_LINE_NO:590
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False) ; #DEBUG_LINE_NO:599
  RIR01.Start() ; #DEBUG_LINE_NO:600
EndFunction
