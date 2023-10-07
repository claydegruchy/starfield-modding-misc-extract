ScriptName Fragments:Quests:QF_City_CY_RedTape03_0023748F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Trevor Auto Const mandatory
ReferenceAlias Property Alias_Clint Auto Const mandatory
ReferenceAlias Property Alias_Hank Auto Const mandatory
ReferenceAlias Property Alias_BarMarker Auto Const mandatory
Potion Property DrinkBottle_BeerAle_Md Auto Const mandatory
Faction Property CityCYRedTape03HankHostileFaction Auto Const mandatory
Scene Property City_CY_RedTape03_0880_Booth_Hank_Jail Auto Const mandatory
Scene Property City_CY_RedTape03_0800_Hank_Threaten Auto Const mandatory
ReferenceAlias Property Alias_Booth Auto Const mandatory
GlobalVariable Property City_CY_RedTape03_HankMad Auto Const mandatory
Quest Property City_CY_Psych01 Auto Const mandatory
ReferenceAlias Property Alias_HankJailMarker Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Scene Property City_CY_RedTape03_0855_Companion_HankDead Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankAV Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankAtShipAV Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankInBarAV Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking01Topic Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking02Topic Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking03Topic Auto Const mandatory
ReferenceAlias Property Alias_HankShip Auto Const mandatory
Perk Property BackgroundLongHauler Auto Const mandatory
Perk Property BackgroundBouncer Auto Const mandatory
Perk Property BackgroundGangster Auto Const mandatory
Perk Property TRAIT_Empath Auto Const mandatory
Perk Property TRAIT_Wanted Auto Const mandatory
Weapon Property Cutter Auto Const mandatory
LeveledItem Property LL_Weapon_UrbanEagle Auto Const mandatory
LeveledItem Property LLW_Ammo_UrbanEagle Auto Const mandatory
Weapon Property UrbanEagle Auto Const mandatory
ReferenceAlias Property Alias_HankWeapon Auto Const mandatory
ReferenceAlias Property Alias_JailDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  myPlayer.MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  myPlayer.AddPerk(BackgroundLongHauler, False) ; #DEBUG_LINE_NO:9
  myPlayer.AddPerk(BackgroundBouncer, False) ; #DEBUG_LINE_NO:10
  myPlayer.AddPerk(BackgroundGangster, False) ; #DEBUG_LINE_NO:11
  myPlayer.AddPerk(TRAIT_Empath, False) ; #DEBUG_LINE_NO:12
  myPlayer.AddPerk(TRAIT_Wanted, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Clint.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_Hank.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:45
  myPlayer.MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:46
  Actor myHank = Alias_Hank.GetActorRef() ; #DEBUG_LINE_NO:47
  If myHank.IsDead() == False ; #DEBUG_LINE_NO:48
    myHank.MoveTo(myPlayer as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0006_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:58
  myPlayer.MoveTo(Alias_Booth.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  Alias_Hank.GetRef().MoveTo(myPlayer as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Hank.GetRef().Disable(False) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:69
  Self.SetActive(True) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:78
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:79
  Alias_HankShip.GetShipRef().Enable(False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:89
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0400_Item_01()
  If !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:101
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0500_Item_00()
  ObjectReference myHankRef = Alias_Hank.GetRef() ; #DEBUG_LINE_NO:114
  myHankRef.MoveTo(Alias_BarMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:115
  myHankRef.Enable(False) ; #DEBUG_LINE_NO:116
  ObjectReference myHankActor = Alias_Hank.GetRef() ; #DEBUG_LINE_NO:118
  myHankActor.RemoveItem(Cutter as Form, 1, False, None) ; #DEBUG_LINE_NO:119
  myHankActor.AddItem(LLW_Ammo_UrbanEagle as Form, 1, False) ; #DEBUG_LINE_NO:120
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:122
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:131
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0610_Item_00()
  Game.GetPlayer().AddItem(DrinkBottle_BeerAle_Md as Form, 1, False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:148
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript ; #DEBUG_LINE_NO:149
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:152
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:153
  Actor myHank = Alias_Hank.GetActorRef() ; #DEBUG_LINE_NO:155
  myHank.EvaluatePackage(False) ; #DEBUG_LINE_NO:158
  myHank.EquipItem(Alias_HankWeapon.GetRef() as Form, False, False) ; #DEBUG_LINE_NO:161
  kmyQuest.StartDistanceCheck() ; #DEBUG_LINE_NO:165
  If Game.GetPlayer().GetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV) == 1.0 ; #DEBUG_LINE_NO:167
    myHank.SetEssential(False) ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_Hank.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0720_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:186
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript ; #DEBUG_LINE_NO:187
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking01Topic, None, False, None) ; #DEBUG_LINE_NO:190
  kmyQuest.StartDistanceCheck() ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0721_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:201
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript ; #DEBUG_LINE_NO:202
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking02Topic, None, False, None) ; #DEBUG_LINE_NO:205
  kmyQuest.StartDistanceCheck() ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0722_Item_00()
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking03Topic, None, False, None) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0800_Item_00()
  Alias_Hank.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:225
  City_CY_RedTape03_0800_Hank_Threaten.Start() ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0805_Item_00()
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV, 1.0) ; #DEBUG_LINE_NO:235
  Utility.Wait(2.5) ; #DEBUG_LINE_NO:237
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:238
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:239
EndFunction

Function Fragment_Stage_0806_Item_00()
  Actor myHank = Alias_Hank.GetActorRef() ; #DEBUG_LINE_NO:248
  (myHank as ObjectReference).RemoveItem(Alias_HankWeapon.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:249
  Game.GetPlayer().AddItem(LL_Weapon_UrbanEagle as Form, 1, False) ; #DEBUG_LINE_NO:250
  myHank.EvaluatePackage(False) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0850_Item_00()
  Actor myHank = Alias_Hank.GetActorRef() ; #DEBUG_LINE_NO:260
  myHank.RemoveFromAllFactions() ; #DEBUG_LINE_NO:261
  myHank.AddToFaction(CityCYRedTape03HankHostileFaction) ; #DEBUG_LINE_NO:262
  myHank.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:263
  myHank.EvaluatePackage(False) ; #DEBUG_LINE_NO:264
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:266
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:267
  If City_CY_Psych01.IsRunning() ; #DEBUG_LINE_NO:270
    If !City_CY_Psych01.GetStageDone(120) ; #DEBUG_LINE_NO:271
      City_CY_Psych01.SetStage(121) ; #DEBUG_LINE_NO:272
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0855_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:282
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAtShipAV, 1.0) ; #DEBUG_LINE_NO:283
  City_CY_RedTape03_0855_Companion_HankDead.Start() ; #DEBUG_LINE_NO:284
EndFunction

Function Fragment_Stage_0860_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:292
  Self.SetObjectiveDisplayed(860, True, False) ; #DEBUG_LINE_NO:293
  Alias_Hank.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:296
  If City_CY_Psych01.IsRunning() ; #DEBUG_LINE_NO:299
    If !City_CY_Psych01.GetStageDone(120) ; #DEBUG_LINE_NO:300
      City_CY_Psych01.SetStage(121) ; #DEBUG_LINE_NO:301
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0861_Item_00()
  City_CY_RedTape03_HankMad.SetValue(1.0) ; #DEBUG_LINE_NO:311
EndFunction

Function Fragment_Stage_0880_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:319
  Alias_JailDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:320
  City_CY_RedTape03_0880_Booth_Hank_Jail.Start() ; #DEBUG_LINE_NO:321
  Alias_Hank.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_0881_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:330
  citycyredtape03questscript kmyQuest = __temp as citycyredtape03questscript ; #DEBUG_LINE_NO:331
  kmyQuest.CloseJailCell() ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_0886_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:342
  citycyredtape03questscript kmyQuest = __temp as citycyredtape03questscript ; #DEBUG_LINE_NO:343
  kmyQuest.CloseJailCell() ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:354
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:355
  If Self.IsObjectiveDisplayed(850) ; #DEBUG_LINE_NO:357
    Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:358
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(860) ; #DEBUG_LINE_NO:360
    If !Self.GetStageDone(855) ; #DEBUG_LINE_NO:361
      Self.SetObjectiveCompleted(860, True) ; #DEBUG_LINE_NO:362
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveFailed(860, True) ; #DEBUG_LINE_NO:364
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(855) ; #DEBUG_LINE_NO:368
    Alias_Hank.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:369
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:371
EndFunction

Function Fragment_Stage_0901_Item_00()
  If Self.GetStageDone(880) ; #DEBUG_LINE_NO:379
    Alias_Hank.GetRef().MoveTo(Alias_HankJailMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:380
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_10000_Item_00()
  DialogueCydonia.SetStage(2600) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:397
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAV, 1.0) ; #DEBUG_LINE_NO:399
  DialogueCydonia.SetStage(1120) ; #DEBUG_LINE_NO:403
  ObjectReference myHank = Alias_Hank.GetRef() ; #DEBUG_LINE_NO:407
  If myHank.IsDisabled() == True ; #DEBUG_LINE_NO:408
    myHank.Enable(False) ; #DEBUG_LINE_NO:409
  EndIf ; #DEBUG_LINE_NO:
  DialogueCydonia.SetStage(1120) ; #DEBUG_LINE_NO:414
  ObjectReference myHankActor = Alias_Hank.GetRef() ; #DEBUG_LINE_NO:416
  myHankActor.RemoveItem(Alias_HankWeapon.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:417
  If !Self.GetStageDone(880) ; #DEBUG_LINE_NO:418
    myHankActor.AddItem(Cutter as Form, 1, False) ; #DEBUG_LINE_NO:419
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:423
EndFunction
