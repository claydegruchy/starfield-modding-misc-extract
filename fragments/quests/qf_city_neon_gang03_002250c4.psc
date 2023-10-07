ScriptName Fragments:Quests:QF_City_Neon_Gang03_002250C4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Gang03_OutsideFinalMarker_Briggs Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Aura Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Vogal Auto Const mandatory
ReferenceAlias Property Alias_Aura Auto Const mandatory
ReferenceAlias Property Alias_Briggs Auto Const mandatory
ReferenceAlias Property Alias_Vogal Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Warehouse Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Owen Auto Const mandatory
ReferenceAlias Property Alias_OwenDexler Auto Const mandatory
ReferenceAlias Property Alias_Hatchet Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Hatchet Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout01 Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout02 Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout03 Auto Const mandatory
ReferenceAlias Property Alias_HoltHenley Auto Const mandatory
ReferenceAlias Property Alias_Disciple01Leader Auto Const mandatory
Scene Property Gang03_0400_GangEncounter Auto Const mandatory
Scene Property Gang03_0500_HoltEncounter Auto Const mandatory
ObjectReference Property Gang03_FinaleEntranceMarker Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
RefCollectionAlias Property Alias_StrikerLeaders Auto Const mandatory
Scene Property Gang03_0900_OwenArrives Auto Const mandatory
RefCollectionAlias Property Alias_BackupSecurity Auto Const mandatory
Outfit Property Outfit_Scum_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const mandatory
ObjectReference Property Gang03_PostQuestStrikerMarker Auto Const mandatory
ActorValue Property Gang03_Foreknowledge_HelpedStrikersAV Auto Const mandatory
Keyword Property AnimFlavorArmsCrossedCasual Auto Const mandatory
Keyword Property AnimFlavorCrouching Auto Const mandatory
Faction Property DisciplesGangFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Quest Property FFNeonZ10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_StrikerLeaders.AddRef(Alias_Aura.GetRef()) ; #DEBUG_LINE_NO:8
  Alias_StrikerLeaders.AddRef(Alias_Briggs.GetRef()) ; #DEBUG_LINE_NO:9
  Alias_StrikerLeaders.AddRef(Alias_Hatchet.GetRef()) ; #DEBUG_LINE_NO:10
  Alias_StrikerLeaders.AddRef(Alias_Vogal.GetRef()) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Gang03_OutsideFinalMarker_Aura, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
  Self.SetStage(700) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:46
  Alias_Disciples_Hangout01.EnableAll(False) ; #DEBUG_LINE_NO:49
  Alias_Disciples_Hangout02.EnableAll(False) ; #DEBUG_LINE_NO:50
  Alias_HoltHenley.GetRef().Enable(False) ; #DEBUG_LINE_NO:51
  Alias_Disciple01Leader.GetRef().Enable(False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:60
  gang03_script kmyQuest = __temp as gang03_script ; #DEBUG_LINE_NO:61
  kmyQuest.HangOutsCleared() ; #DEBUG_LINE_NO:64
  If Self.GetStageDone(500) && Self.GetStageDone(600) ; #DEBUG_LINE_NO:67
    Self.SetStage(700) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0405_Item_00()
  Gang03_0400_GangEncounter.Start() ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:87
  Alias_Disciple01Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:90
  Alias_Disciples_Hangout01.EvaluateAll() ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0430_Item_00()
  Alias_Disciple01Leader.GetActorRef().RemoveFromAllFactions() ; #DEBUG_LINE_NO:100
  Alias_Disciple01Leader.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:101
  Alias_Disciple01Leader.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:102
  Alias_Disciples_Hangout01.RemoveFromFaction(DisciplesGangFaction) ; #DEBUG_LINE_NO:104
  Alias_Disciples_Hangout01.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:105
  Alias_Disciples_Hangout01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:114
  gang03_script kmyQuest = __temp as gang03_script ; #DEBUG_LINE_NO:115
  kmyQuest.HangOutsCleared() ; #DEBUG_LINE_NO:118
  Self.SetObjectiveDisplayed(520, False, False) ; #DEBUG_LINE_NO:121
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:125
  Actor aTarg = Alias_Briggs.GetActorRef() ; #DEBUG_LINE_NO:126
  aTarg.SetEssential(True) ; #DEBUG_LINE_NO:127
  aTarg = Alias_Hatchet.GetActorRef() ; #DEBUG_LINE_NO:129
  aTarg.SetEssential(True) ; #DEBUG_LINE_NO:130
  aTarg = Alias_Aura.GetActorRef() ; #DEBUG_LINE_NO:132
  aTarg.SetEssential(True) ; #DEBUG_LINE_NO:133
  aTarg = Alias_Vogal.GetActorRef() ; #DEBUG_LINE_NO:135
  aTarg.SetEssential(True) ; #DEBUG_LINE_NO:136
  If Self.GetStageDone(400) && Self.GetStageDone(600) ; #DEBUG_LINE_NO:139
    Self.SetStage(700) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0505_Item_00()
  Gang03_0500_HoltEncounter.Start() ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_Disciples_Hangout02.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:160
  Alias_Disciples_Hangout02.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:161
  Actor aTarg = Alias_HoltHenley.GetActorRef() ; #DEBUG_LINE_NO:163
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:164
  aTarg.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:165
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:166
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveDisplayed(520, True, False) ; #DEBUG_LINE_NO:175
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:178
  Actor aTarg = Alias_Briggs.GetActorRef() ; #DEBUG_LINE_NO:179
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:180
  aTarg = Alias_Hatchet.GetActorRef() ; #DEBUG_LINE_NO:182
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:183
  aTarg = Alias_Aura.GetActorRef() ; #DEBUG_LINE_NO:185
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:186
  aTarg = Alias_Vogal.GetActorRef() ; #DEBUG_LINE_NO:188
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:189
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:197
  gang03_script kmyQuest = __temp as gang03_script ; #DEBUG_LINE_NO:198
  kmyQuest.HangOutsCleared() ; #DEBUG_LINE_NO:201
  If Self.GetStageDone(400) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:204
    Self.SetStage(700) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0650_Item_00()
  Alias_Disciples_Hangout03.RemoveFromFaction(DisciplesGangFaction) ; #DEBUG_LINE_NO:216
  Alias_Disciples_Hangout03.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:217
  Alias_Disciples_Hangout03.EnableAll(False) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:227
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:228
  If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:231
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:232
  EndIf ; #DEBUG_LINE_NO:
  Alias_Disciples_Warehouse.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:236
  Alias_Aura.GetRef().MoveTo(Gang03_OutsideFinalMarker_Aura, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:239
  Alias_Briggs.GetRef().MoveTo(Gang03_OutsideFinalMarker_Briggs, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:240
  Alias_Hatchet.GetRef().MoveTo(Gang03_OutsideFinalMarker_Hatchet, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:241
  Alias_Vogal.GetRef().MoveTo(Gang03_OutsideFinalMarker_Vogal, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:242
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:245
    Alias_Aura.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False) ; #DEBUG_LINE_NO:246
    Alias_Briggs.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False) ; #DEBUG_LINE_NO:247
    Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False) ; #DEBUG_LINE_NO:248
    Alias_Vogal.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False) ; #DEBUG_LINE_NO:249
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:258
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveDisplayed(520, False, False) ; #DEBUG_LINE_NO:260
  Alias_Disciples_Warehouse.EnableAll(False) ; #DEBUG_LINE_NO:263
  Alias_Aura.GetActorRef().AddToFaction(PlayerFaction) ; #DEBUG_LINE_NO:266
  Alias_Briggs.GetActorRef().AddToFaction(PlayerFaction) ; #DEBUG_LINE_NO:267
  Alias_Hatchet.GetActorRef().AddToFaction(PlayerFaction) ; #DEBUG_LINE_NO:268
  Alias_Vogal.GetActorRef().AddToFaction(PlayerFaction) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_Aura.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:278
  Alias_Briggs.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:279
  Alias_Hatchet.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:280
  Alias_Vogal.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.GetStageDone(810) ; #DEBUG_LINE_NO:290
    ObjectReference oTarg = Gang03_FinaleEntranceMarker ; #DEBUG_LINE_NO:291
    Alias_Aura.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:292
    Alias_Briggs.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:293
    Alias_Hatchet.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:294
    Alias_Vogal.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:295
    Self.SetStage(825) ; #DEBUG_LINE_NO:296
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:305
  Self.SetObjectiveDisplayed(700, False, False) ; #DEBUG_LINE_NO:306
  Self.SetObjectiveCompleted(520, True) ; #DEBUG_LINE_NO:307
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:308
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:311
  Actor aTarg = Alias_Briggs.GetActorRef() ; #DEBUG_LINE_NO:312
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:313
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:314
  aTarg = Alias_Hatchet.GetActorRef() ; #DEBUG_LINE_NO:316
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:317
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:318
  aTarg = Alias_Aura.GetActorRef() ; #DEBUG_LINE_NO:320
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:321
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:322
  aTarg = Alias_Vogal.GetActorRef() ; #DEBUG_LINE_NO:324
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:325
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0875_Item_00()
  Self.SetObjectiveDisplayed(800, False, False) ; #DEBUG_LINE_NO:335
  Self.SetStage(850) ; #DEBUG_LINE_NO:338
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:346
  gang03_script kmyQuest = __temp as gang03_script ; #DEBUG_LINE_NO:347
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:350
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:351
  CrimeFactionNeon.SetCrimeGold(0) ; #DEBUG_LINE_NO:354
  CrimeFactionNeon.SetCrimeGoldViolent(0) ; #DEBUG_LINE_NO:355
  Alias_OwenDexler.GetRef().MoveTo(Gang03_OutsideFinalMarker_Owen, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:358
  Alias_OwenDexler.GetRef().Enable(False) ; #DEBUG_LINE_NO:359
  Gang03_0900_OwenArrives.Start() ; #DEBUG_LINE_NO:362
  Alias_Aura.GetRef().AddKeyword(AnimFlavorCrouching) ; #DEBUG_LINE_NO:365
  ObjectReference oTarg = Gang03_FinaleEntranceMarker ; #DEBUG_LINE_NO:368
  If !Self.GetStageDone(810) ; #DEBUG_LINE_NO:369
    kmyQuest.MoveStriker(Alias_Aura.GetActorRef()) ; #DEBUG_LINE_NO:370
    kmyQuest.MoveStriker(Alias_Briggs.GetActorRef()) ; #DEBUG_LINE_NO:371
    kmyQuest.MoveStriker(Alias_Hatchet.GetActorRef()) ; #DEBUG_LINE_NO:372
    kmyQuest.MoveStriker(Alias_Vogal.GetActorRef()) ; #DEBUG_LINE_NO:373
    Alias_Aura.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:374
    Alias_Briggs.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:375
    Alias_Hatchet.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:376
    Alias_Vogal.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:377
  Else ; #DEBUG_LINE_NO:
    Alias_Aura.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:380
    Alias_Briggs.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:381
    Alias_Hatchet.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:382
    Alias_Vogal.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
  Alias_OwenDexler.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:385
  Alias_BackupSecurity.EnableAll(False) ; #DEBUG_LINE_NO:388
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:396
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:397
  Alias_Briggs.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:399
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:407
  Game.GetPlayer().SetValue(Gang03_Foreknowledge_HelpedStrikersAV, 1.0) ; #DEBUG_LINE_NO:410
  FFNeonZ10.Start() ; #DEBUG_LINE_NO:412
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:420
  FFNeonZ10.Start() ; #DEBUG_LINE_NO:422
  Self.SetStage(9000) ; #DEBUG_LINE_NO:425
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_BackupSecurity.DisableAll(False) ; #DEBUG_LINE_NO:434
  If Self.GetStageDone(1100) ; #DEBUG_LINE_NO:437
    Alias_Aura.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:438
    Alias_Briggs.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:439
    Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:440
    Alias_Vogal.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:441
    Alias_Aura.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:444
    Alias_Briggs.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:445
    Alias_Hatchet.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:446
    Alias_Vogal.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:447
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:450
EndFunction
