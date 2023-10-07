ScriptName Fragments:Quests:QF_RIR06_0024FB39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_RogueOperative Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RIR06_OperativeType Auto Const mandatory
GlobalVariable Property RIR06_RadiantCount Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
ReferenceAlias Property Alias_OperativeMarker Auto Const mandatory
ReferenceAlias Property Alias_Tomo Auto Const mandatory
ReferenceAlias Property Alias_Operative Auto Const mandatory
ReferenceAlias Property Alias_Dalton Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Quest Property RI07 Auto Const mandatory
GlobalVariable Property RIR06_Tomo_CreditsSmall Auto Const mandatory
GlobalVariable Property RIR06_Tomo_CreditsLarge Auto Const mandatory
GlobalVariable Property RIR06_Operative_CreditsSmall Auto Const mandatory
GlobalVariable Property RIR06_Operative_CreditsLarge Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property RI06 Auto Const mandatory
ReferenceAlias Property Alias_VeenaOfficeQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoRI06Marker Auto Const mandatory
ReferenceAlias Property Alias_RivalOperative Auto Const mandatory
GlobalVariable Property RI05_ImogeneDead Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_DaltonRI07Marker Auto Const mandatory
GlobalVariable Property RI05_Track_BayuDispleased Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Keyword Property LocTypeStarstation Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
GlobalVariable Property RIR06_PlayerSpokeToYuko Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_YukoFurniture Auto Const mandatory
Scene Property RIR06_350_Yuko_CommentScene Auto Const mandatory
Quest Property RIR06_YukoFollowUp Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetImogeneLive Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetOperativeLive Auto Const mandatory
GlobalVariable Property RIR06_PlayerLetTomoLive Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:7
  RI06.SetStage(15) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI05_Track_BayuDispleased.SetValue(1.0) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().MoveTo(Alias_VeenaOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
  Alias_Masako.GetRef().MoveTo(Alias_MasakoRI06Marker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Self.SetStage(100) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Alias_QuestGiver.Clear() ; #DEBUG_LINE_NO:28
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:29
  Self.SetStage(100) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  Alias_QuestGiver.Clear() ; #DEBUG_LINE_NO:39
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:40
  Self.SetStage(100) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fCheckTomo = RIR06_PlayerLetTomoLive.GetValue() ; #DEBUG_LINE_NO:49
  Float fCheckImogene = RIR06_PlayerLetImogeneLive.GetValue() ; #DEBUG_LINE_NO:50
  Float fCheckOperative = RIR06_PlayerLetOperativeLive.GetValue() ; #DEBUG_LINE_NO:51
  If RIR06_RadiantCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:53
    If RI01_TomoDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:54
      Self.SetStage(11) ; #DEBUG_LINE_NO:55
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(13) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If RIR06_RadiantCount.GetValue() > 0.0 ; #DEBUG_LINE_NO:61
    If RI01_TomoDead.GetValue() == 0.0 && fCheckTomo == -1.0 ; #DEBUG_LINE_NO:63
      Self.SetStage(11) ; #DEBUG_LINE_NO:64
    ElseIf RI05_ImogeneDead.GetValue() == 0.0 && fCheckImogene == -1.0 ; #DEBUG_LINE_NO:65
      Self.SetStage(12) ; #DEBUG_LINE_NO:66
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(13) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue() ; #DEBUG_LINE_NO:74
  If fMasakoCEO == -1.0 ; #DEBUG_LINE_NO:76
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:77
  ElseIf fMasakoCEO == 0.0 ; #DEBUG_LINE_NO:78
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0011_Item_00()
  Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue() ; #DEBUG_LINE_NO:88
  If fMasakoCEO == -1.0 ; #DEBUG_LINE_NO:90
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:91
  ElseIf fMasakoCEO == 0.0 ; #DEBUG_LINE_NO:92
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  Alias_Operative.ForceRefTo(Alias_Tomo.GetRef()) ; #DEBUG_LINE_NO:96
  Alias_Tomo.GetRef().Enable(False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:105
  Actor Imogene = Alias_Imogene.GetActorRef() ; #DEBUG_LINE_NO:107
  Alias_Operative.ForceRefTo(Imogene as ObjectReference) ; #DEBUG_LINE_NO:108
  Imogene.Enable(False) ; #DEBUG_LINE_NO:109
  Imogene.SetEssential(False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0013_Item_00()
  Int iOperative = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:118
  RIR06_OperativeType.SetValueInt(iOperative) ; #DEBUG_LINE_NO:119
  If RI01_TomoDead.GetValue() == 1.0 && RIR06_RadiantCount.GetValue() == 0.0 ; #DEBUG_LINE_NO:123
    Alias_RivalOperative.TryToEnable() ; #DEBUG_LINE_NO:124
    Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef()) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoRemainedCEO.GetValue() == 0.0 ; #DEBUG_LINE_NO:133
    If RI05_ImogeneDead.GetValue() == 1.0 && RIR06_RadiantCount.GetValue() == 1.0 || RIR06_RadiantCount.GetValue() >= 2.0 ; #DEBUG_LINE_NO:134
      If RIR06_OperativeType.GetValueInt() == 0 ; #DEBUG_LINE_NO:135
        Alias_RogueOperative.TryToEnable() ; #DEBUG_LINE_NO:136
        Alias_Operative.ForceRefTo(Alias_RogueOperative.GetRef()) ; #DEBUG_LINE_NO:137
      Else ; #DEBUG_LINE_NO:
        Alias_RivalOperative.TryToEnable() ; #DEBUG_LINE_NO:139
        Alias_Operative.ForceRefTo(Alias_RivalOperative.GetRef()) ; #DEBUG_LINE_NO:140
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:151
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:152
  RI06.Stop() ; #DEBUG_LINE_NO:153
  If RI_RadiantPointerQuest.IsRunning() ; #DEBUG_LINE_NO:156
    RI_RadiantPointerQuest.SetStage(10000) ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_03()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:166
  Location ChosenLocation = Alias_ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:168
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation) ; #DEBUG_LINE_NO:170
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:171
    If ChosenLocation.HasKeyword(LocTypeStarstation) ; #DEBUG_LINE_NO:172
      Self.SetStage(155) ; #DEBUG_LINE_NO:173
    EndIf ; #DEBUG_LINE_NO:
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:175
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:176
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:178
  EndIf ; #DEBUG_LINE_NO:
  Alias_Masako.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:188
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:189
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:190
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0200_Item_01()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:200
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:201
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:202
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0200_Item_02()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:214
  Alias_Operative.GetRef().MoveTo(Alias_OperativeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor OperativeActorRef = Alias_Operative.GetActorRef() ; #DEBUG_LINE_NO:224
  OperativeActorRef.SetEssential(False) ; #DEBUG_LINE_NO:226
  OperativeActorRef.RemoveFromFaction(RyujinIndustriesFaction) ; #DEBUG_LINE_NO:227
  OperativeActorRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:228
  OperativeActorRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:229
  OperativeActorRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:230
  OperativeActorRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:231
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:239
  If Self.GetStageDone(11) ; #DEBUG_LINE_NO:241
    RI01_TomoDead.SetValue(1.0) ; #DEBUG_LINE_NO:242
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(12) ; #DEBUG_LINE_NO:244
    RI05_ImogeneDead.SetValue(1.0) ; #DEBUG_LINE_NO:245
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Tomo_CreditsSmall.GetValueInt(), False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0275_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Tomo_CreditsLarge.GetValueInt(), False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Operative_CreditsSmall.GetValueInt(), False) ; #DEBUG_LINE_NO:270
  Self.SetStage(300) ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0285_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, RIR06_Operative_CreditsLarge.GetValueInt(), False) ; #DEBUG_LINE_NO:279
  Self.SetStage(300) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0297_Item_00()
  Int LargeAmount = NPCDemandMoney_Large.GetValue() as Int ; #DEBUG_LINE_NO:289
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, LargeAmount, False, None) ; #DEBUG_LINE_NO:290
  Self.SetStage(300) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0298_Item_00()
  Int MediumAmount = NPCDemandMoney_Medium.GetValue() as Int ; #DEBUG_LINE_NO:301
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, MediumAmount, False, None) ; #DEBUG_LINE_NO:302
  Self.SetStage(300) ; #DEBUG_LINE_NO:304
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:312
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:313
  RI07.SetStage(150) ; #DEBUG_LINE_NO:315
  Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0300_Item_01()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:324
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:325
  RI07.SetStage(150) ; #DEBUG_LINE_NO:327
  Alias_Dalton.GetRef().MoveTo(Alias_DaltonRI07Marker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:328
EndFunction

Function Fragment_Stage_0300_Item_02()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:336
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:337
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI05_ImogeneDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:339
    Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:340
    YukoRef.Enable(False) ; #DEBUG_LINE_NO:341
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:342
    YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:343
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_03()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:352
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:353
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 ; #DEBUG_LINE_NO:355
    Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:356
    YukoRef.Enable(False) ; #DEBUG_LINE_NO:357
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:358
    YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:359
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_04()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:368
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:369
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI01_TomoDead.GetValue() == 0.0 ; #DEBUG_LINE_NO:371
    Actor YukoRef = Alias_Yuko.GetActorRef() ; #DEBUG_LINE_NO:372
    YukoRef.Enable(False) ; #DEBUG_LINE_NO:373
    YukoRef.MoveTo(Alias_YukoFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:374
    YukoRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:375
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0340_Item_00()
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI08_MasakoRemainedCEO.GetValue() == 0.0 && !Self.GetStageDone(220) ; #DEBUG_LINE_NO:384
    Self.SetStage(350) ; #DEBUG_LINE_NO:385
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:394
  Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:395
  RIR06_350_Yuko_CommentScene.Start() ; #DEBUG_LINE_NO:397
EndFunction

Function Fragment_Stage_0355_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:405
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:406
  RIR06_PlayerSpokeToYuko.SetValue(1.0) ; #DEBUG_LINE_NO:407
  Alias_Yuko.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:408
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:416
  If Self.GetStageDone(220) ; #DEBUG_LINE_NO:418
    RIR06_PlayerLetTomoLive.SetValue(0.0) ; #DEBUG_LINE_NO:419
  Else ; #DEBUG_LINE_NO:
    RIR06_PlayerLetTomoLive.SetValue(1.0) ; #DEBUG_LINE_NO:421
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(10000) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0900_Item_01()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:432
  Self.SetStage(10000) ; #DEBUG_LINE_NO:434
EndFunction

Function Fragment_Stage_0900_Item_02()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:442
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:443
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:444
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(220) ; #DEBUG_LINE_NO:447
    RIR06_PlayerLetImogeneLive.SetValue(0.0) ; #DEBUG_LINE_NO:448
  Else ; #DEBUG_LINE_NO:
    RIR06_PlayerLetImogeneLive.SetValue(1.0) ; #DEBUG_LINE_NO:450
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(10000) ; #DEBUG_LINE_NO:453
EndFunction

Function Fragment_Stage_0900_Item_03()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:461
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:462
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:463
  EndIf ; #DEBUG_LINE_NO:
  Float fOperativeCount = RIR06_PlayerLetOperativeLive.GetValue() ; #DEBUG_LINE_NO:469
  If !Self.GetStageDone(220) && fOperativeCount == -1.0 ; #DEBUG_LINE_NO:471
    RIR06_PlayerLetOperativeLive.SetValue(1.0) ; #DEBUG_LINE_NO:472
  ElseIf !Self.GetStageDone(220) && fOperativeCount >= 1.0 ; #DEBUG_LINE_NO:473
    RIR06_PlayerLetOperativeLive.SetValue(fOperativeCount + 1.0) ; #DEBUG_LINE_NO:474
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(10000) ; #DEBUG_LINE_NO:477
EndFunction

Function Fragment_Stage_0900_Item_04()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:485
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:486
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:487
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(220) ; #DEBUG_LINE_NO:490
    RIR06_PlayerLetTomoLive.SetValue(0.0) ; #DEBUG_LINE_NO:491
  Else ; #DEBUG_LINE_NO:
    RIR06_PlayerLetTomoLive.SetValue(1.0) ; #DEBUG_LINE_NO:493
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(10000) ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_10000_Item_00()
  If RIR06_PlayerSpokeToYuko.GetValue() == 0.0 && RI08_MasakoRemainedCEO.GetValue() == 0.0 && !Self.GetStageDone(220) ; #DEBUG_LINE_NO:505
    RIR06_YukoFollowUp.SetStage(100) ; #DEBUG_LINE_NO:506
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(350) ; #DEBUG_LINE_NO:508
    Self.SetObjectiveDisplayed(350, False, False) ; #DEBUG_LINE_NO:509
  EndIf ; #DEBUG_LINE_NO:
  Float fCurrentRadiantCount = RIR06_RadiantCount.GetValue() ; #DEBUG_LINE_NO:512
  If RI_RadiantQuestGiver.GetValue() == 2.0 ; #DEBUG_LINE_NO:517
    (RI_Support as ri_radiantsupportquestscript).ResetMBCount() ; #DEBUG_LINE_NO:518
    RI_LastChosenRadiant.SetValue(2.0) ; #DEBUG_LINE_NO:519
    RIR06_RadiantCount.SetValue(fCurrentRadiantCount + 1.0) ; #DEBUG_LINE_NO:520
    Self.Stop() ; #DEBUG_LINE_NO:521
  EndIf ; #DEBUG_LINE_NO:
  If fCurrentRadiantCount == 0.0 && !RI07.IsCompleted() ; #DEBUG_LINE_NO:525
    RI07.SetStage(200) ; #DEBUG_LINE_NO:526
    RIR06_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:527
  EndIf ; #DEBUG_LINE_NO:
EndFunction
