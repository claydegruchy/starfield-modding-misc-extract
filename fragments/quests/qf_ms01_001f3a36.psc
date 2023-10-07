ScriptName Fragments:Quests:QF_MS01_001F3A36 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS01_0200_DistressCall Auto Const mandatory
Quest Property MS01SpaceEncounter01 Auto Const mandatory
Quest Property MS01SpaceEncounter02 Auto Const mandatory
ReferenceAlias Property Alias_FC_LtTorres Auto Const mandatory
ReferenceAlias Property Alias_FC_SargeDasari Auto Const mandatory
ReferenceAlias Property Alias_UC_CaptMyeong Auto Const mandatory
ReferenceAlias Property Alias_FC_PvtMahoney Auto Const mandatory
ReferenceAlias Property Alias_UC_CplLezama Auto Const mandatory
ReferenceAlias Property Alias_UC_PvtTsai Auto Const mandatory
RefCollectionAlias Property Alias_EndFightBaddies Auto Const mandatory
Quest Property MS01SpaceEncounter03 Auto Const mandatory
Scene Property MS01_0100_HaulerIntro Auto Const mandatory
ReferenceAlias Property Alias_ScientistMapMarker Auto Const mandatory
ReferenceAlias Property Alias_Hauler Auto Const mandatory
Key Property MS01_MedicalKey Auto Const mandatory
ObjectReference Property OutpostCOC Auto Const
Key Property MS01_SecurityKey Auto Const mandatory
RefCollectionAlias Property Alias_MyeongInitialEnemies Auto Const mandatory
Scene Property MS01_0475_PostCombatMyeongIntro Auto Const mandatory
ReferenceAlias Property Alias_InfirmaryDoor Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property MS01_0410_MahoneySaved Auto Const mandatory
Scene Property MS01_0422_DoctorDoorReact Auto Const mandatory
Scene Property MS01_0075_HaulerHail Auto Const mandatory
Scene Property MS01_0430_TorresDoorOpened Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Scene Property MS01_0900_MahoneyDistress Auto Const mandatory
ActorValue Property MS01_ForeknowledgeAV Auto Const mandatory
Location Property SAltair Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship Auto Const mandatory
LocationAlias Property Alias_SpaceFightersLocation02 Auto Const mandatory
Keyword Property LocTypeSENotAllowed Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToCleanUp Auto Const mandatory
ReferenceAlias Property Alias_Rescue_Scientist Auto Const mandatory
ReferenceAlias Property Alias_Rescue_Soldier Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ReferenceAlias Property Alias_FC_DrMoussa Auto Const mandatory
LocationAlias Property Alias_SpaceFightersLocation01 Auto Const mandatory
ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship02 Auto Const mandatory
GlobalVariable Property SE_FAB06_CooldownDays Auto Const mandatory
Float Property cooldownDays Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  If !Alias_PlayerShip.GetRef().IsInLocation(SAltair) ; #DEBUG_LINE_NO:8
    MS01SpaceEncounter03.Start() ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Alias_ScientistMapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:17
  Alias_SpaceFightersLocation01.GetLocation().AddKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:20
  Alias_SpaceFightersLocation02.GetLocation().AddKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(OutpostCOC, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0003_Item_00()
  MS01SpaceEncounter03.Start() ; #DEBUG_LINE_NO:42
  MS01_0100_HaulerIntro.Start() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_ScientistMapMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0050_Item_00()
  MS01_0075_HaulerHail.Start() ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:71
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:74
  spaceshipreference srHauler = Alias_Hauler.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:75
  srHauler.DisableWithGravJump() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:85
  MS01_0200_DistressCall.Start() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:96
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveDisplayed(475, True, False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0410_Item_00()
  MS01_0410_MahoneySaved.Start() ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:123
  Self.SetObjectiveDisplayed(425, True, False) ; #DEBUG_LINE_NO:124
  Alias_FC_PvtMahoney.GetActorRef().RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0420_Item_00()
  Alias_InfirmaryDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0422_Item_00()
  If !Self.GetStageDone(415) ; #DEBUG_LINE_NO:142
    Self.SetObjectiveDisplayed(425, True, False) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
  MS01_0422_DoctorDoorReact.Start() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0425_Item_00()
  Self.SetObjectiveCompleted(425, True) ; #DEBUG_LINE_NO:155
  Self.SetObjectiveDisplayed(435, True, False) ; #DEBUG_LINE_NO:156
  Game.GetPlayer().AddItem(MS01_MedicalKey as Form, 1, False) ; #DEBUG_LINE_NO:159
  Alias_FC_DrMoussa.GetActorRef().RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:161
  Alias_UC_CplLezama.GetActorRef().RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0430_Item_00()
  MS01_0430_TorresDoorOpened.Start() ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0435_Item_00()
  Self.SetObjectiveCompleted(435, True) ; #DEBUG_LINE_NO:179
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:180
  Game.GetPlayer().AddItem(MS01_SecurityKey as Form, 1, False) ; #DEBUG_LINE_NO:183
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:186
  Alias_FC_SargeDasari.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_MyeongInitialEnemies.EnableAll(False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0475_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:204
  ms01script kmyQuest = __temp as ms01script ; #DEBUG_LINE_NO:205
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:208
  Self.SetObjectiveDisplayed(475, True, False) ; #DEBUG_LINE_NO:209
  MS01_0475_PostCombatMyeongIntro.Start() ; #DEBUG_LINE_NO:212
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:215
  Alias_FC_SargeDasari.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:216
  Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:217
  Alias_UC_PvtTsai.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:218
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(475, True) ; #DEBUG_LINE_NO:226
  Self.SetObjectiveDisplayed(490, True, False) ; #DEBUG_LINE_NO:227
  Alias_ScientistMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:230
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:238
  ms01script kmyQuest = __temp as ms01script ; #DEBUG_LINE_NO:239
  Self.SetObjectiveCompleted(490, True) ; #DEBUG_LINE_NO:242
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:243
  kmyQuest.LockDoors(True) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:254
  ms01script kmyQuest = __temp as ms01script ; #DEBUG_LINE_NO:255
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:258
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:259
  kmyQuest.LockDoors(False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:270
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:271
  Actor aTarg = Alias_FC_LtTorres.GetActorRef() ; #DEBUG_LINE_NO:274
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:275
  aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:276
  aTarg = Alias_UC_CaptMyeong.GetActorRef() ; #DEBUG_LINE_NO:278
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:279
  aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:288
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:289
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0820_Item_00()
  MS01SpaceEncounter01.Start() ; #DEBUG_LINE_NO:299
EndFunction

Function Fragment_Stage_0830_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:307
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:310
    Self.SetStage(900) ; #DEBUG_LINE_NO:311
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0840_Item_00()
  MS01SpaceEncounter02.Start() ; #DEBUG_LINE_NO:321
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:329
  If Self.GetStageDone(830) ; #DEBUG_LINE_NO:332
    Self.SetStage(900) ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:342
  MS01_0900_MahoneyDistress.Start() ; #DEBUG_LINE_NO:345
  Alias_SpaceFightersLocation01.GetLocation().RemoveKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:348
  Alias_SpaceFightersLocation02.GetLocation().RemoveKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:349
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_NPCsToCleanUp.DisableAll(False) ; #DEBUG_LINE_NO:357
  Alias_Rescue_Scientist.GetRef().Disable(False) ; #DEBUG_LINE_NO:358
  Alias_Rescue_Soldier.GetRef().Disable(False) ; #DEBUG_LINE_NO:359
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:363
  SE_FAB06_CooldownDays.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:372
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:373
  Actor aTarg = None ; #DEBUG_LINE_NO:376
  aTarg = Alias_FC_LtTorres.GetActorRef() ; #DEBUG_LINE_NO:377
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:378
  aTarg = Alias_FC_PvtMahoney.GetActorRef() ; #DEBUG_LINE_NO:379
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:380
  aTarg = Alias_FC_SargeDasari.GetActorRef() ; #DEBUG_LINE_NO:381
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:382
  aTarg = Alias_UC_CaptMyeong.GetActorRef() ; #DEBUG_LINE_NO:384
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:385
  aTarg = Alias_UC_CplLezama.GetActorRef() ; #DEBUG_LINE_NO:386
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:387
  aTarg = Alias_UC_PvtTsai.GetActorRef() ; #DEBUG_LINE_NO:388
  aTarg.MoveTo(aTarg.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:389
  Alias_EndFightBaddies.EnableAll(False) ; #DEBUG_LINE_NO:393
EndFunction

Function Fragment_Stage_1010_Item_00()
  Alias_EndFightBaddies_Wave02_Ship.GetRef().Enable(False) ; #DEBUG_LINE_NO:402
EndFunction

Function Fragment_Stage_1020_Item_00()
  Alias_EndFightBaddies_Wave02_Ship02.GetRef().Enable(False) ; #DEBUG_LINE_NO:411
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:419
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:420
  Alias_FC_LtTorres.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:423
  Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_1190_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:432
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:440
  Game.GetPlayer().SetValue(MS01_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:443
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:451
EndFunction
