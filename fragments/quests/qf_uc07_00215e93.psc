ScriptName Fragments:Quests:QF_UC07_00215E93 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property UC03_RedDevilsHQKey Auto Const mandatory
ObjectReference Property UC07_DebugMarker01 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property RDHQShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Scene Property UC07_110_HadrianSpotsPlayer Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const mandatory
ReferenceAlias Property Alias_Kaiser Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Scene Property UC07_420_Kaiser_BiologicalContamination Auto Const mandatory
Scene Property UC07_440_Kaiser_PowerRequired Auto Const mandatory
MiscObject Property Mfg_Positron_Battery Auto Const mandatory
Message Property UC07_DEBUG_KaiserPoweringUp Auto Const mandatory
Message Property UC07_DEBUG_BeaconSound Auto Const mandatory
Scene Property UC07_550_Kaiser_ProceedToOverlook Auto Const mandatory
ReferenceAlias Property Alias_Unit99 Auto Const mandatory
Scene Property UC07_610_Ecliptic_Release99 Auto Const mandatory
RefCollectionAlias Property Alias_Ecliptic Auto Const mandatory
Scene Property UC07_700_Kaiser_Unit99Eulogy Auto Const mandatory
ObjectReference Property UC_Jakob_PostquestSandboxMarker Auto Const mandatory
ObjectReference Property UC07_JakobTeleportMarker Auto Const mandatory
GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
ObjectReference Property UC07_DebugMarker02 Auto Const mandatory
Book Property UC07_KaiserSchematics Auto Const mandatory
ReferenceAlias Property Alias_KaiserSchematics Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
ObjectReference Property UC07_HadrianTeleportMarker Auto Const mandatory
RefCollectionAlias Property Alias_HeatLeeches Auto Const mandatory
ObjectReference Property UC07_DebugMarker03 Auto Const mandatory
ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage7 Auto Const mandatory
ObjectReference Property UC07_DebugMarker05 Auto Const mandatory
ObjectReference Property UC07_DebugMarker06 Auto Const mandatory
ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage8 Auto Const mandatory
LeveledItem Property TestVSWeapons Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ObjectReference Property UC07_Kaiser_Scene850Marker Auto Const mandatory
ObjectReference Property UC07_Hadrian_Scene850Marker Auto Const mandatory
ObjectReference Property UC07_Jakob_Scene850Marker Auto Const mandatory
ReferenceAlias Property Alias_KaiserCaptiveAlias Auto Const mandatory
Scene Property UC07_850_KaiserHadrianJakob_Reunite Auto Const mandatory
Quest Property UC08 Auto Const mandatory
GlobalVariable Property UC07_GelFee_SpeechDiscount Auto Const mandatory
GlobalVariable Property UC07_GelFee Auto Const mandatory
GlobalVariable Property UC07_GelFee_FreestarDiscount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Message Property UC07_BatterySchematicLearned Auto Const mandatory
GlobalVariable Property UC07_LearnedPositronBatteryRecipe Auto Const mandatory
Scene Property UC07_604_EclipticScene Auto Const mandatory
ReferenceAlias Property Alias_CageDoor Auto Const mandatory
Faction Property UC07_EclipticEnemyFaction Auto Const mandatory
Scene Property UC07_701_Kaiser_ProceedToUnit99 Auto Const mandatory
Scene Property UC07_815_Kaiser_PlayerSatInPilotsSeatScene Auto Const mandatory
Location Property LC042BattleofNiiraLocation Auto Const mandatory
ReferenceAlias Property Alias_QuestPositronBattery Auto Const mandatory
GlobalVariable Property UC07_GelFee_AzamiDiscount Auto Const mandatory
Quest Property UC07_HadrianVVRevealQuest Auto Const mandatory
Quest Property Dialogue1OfAKindUC07 Auto Const mandatory
ReferenceAlias Property Alias_EclipticEnemyAlias Auto Const mandatory
Scene Property UC07_620_Ecliptic_Release99Hostile Auto Const mandatory
Scene Property UC07_820_Kaiser_ArrivedAtRDHQ Auto Const mandatory
RefCollectionAlias Property Alias_QuestBatteryMaterials Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadriansPast_Clone Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_HadrianBuiltKaiser Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
GlobalVariable Property UC05_FreestarObserversAccepted Auto Const mandatory
MiscObject Property UC07_Microcell_ConductorArray Auto Const mandatory
MiscObject Property UC07_Microcell_PowerSource Auto Const mandatory
MiscObject Property UC07_Microcell_Shielding Auto Const mandatory
ReferenceAlias Property Alias_Wallsafe Auto Const mandatory
ReferenceAlias Property Alias_FieldNotes Auto Const mandatory
GlobalVariable Property UC07_Niira_PreventCageRelease Auto Const mandatory
ReferenceAlias Property Alias_EmergencyBeacon Auto Const mandatory
Scene Property UC07_440a_Kaiser_HeatleechesEliminated Auto Const mandatory
ReferenceAlias Property Alias_TriggerStage825 Auto Const mandatory
ReferenceAlias Property Alias_MicroCell Auto Const mandatory
ReferenceAlias Property Alias_RHQMapMarker Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const mandatory
ActorValue Property Perception Auto Const mandatory
ReferenceAlias Property Alias_EclipticSceneTarget Auto Const mandatory
Quest Property UC05 Auto Const mandatory
Quest Property UC06 Auto Const mandatory
Keyword Property ActorSocialImmune Auto Const mandatory
Faction Property UC07_EclipticFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_EclipticBoss Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().Moveto(UC07_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:17
  Self.SetStage(200) ; #DEBUG_LINE_NO:18
  Self.SetStage(300) ; #DEBUG_LINE_NO:19
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:21
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:22
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:32
  Self.SetStage(200) ; #DEBUG_LINE_NO:33
  Self.SetStage(300) ; #DEBUG_LINE_NO:34
  Self.SetStage(400) ; #DEBUG_LINE_NO:35
  Dialogue1OfAKindUC07.SetStage(50) ; #DEBUG_LINE_NO:36
  Dialogue1OfAKindUC07.SetStage(100) ; #DEBUG_LINE_NO:37
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:39
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:40
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:50
  Self.SetStage(200) ; #DEBUG_LINE_NO:51
  Self.SetStage(300) ; #DEBUG_LINE_NO:52
  Self.SetStage(400) ; #DEBUG_LINE_NO:53
  Dialogue1OfAKindUC07.SetStage(50) ; #DEBUG_LINE_NO:54
  Dialogue1OfAKindUC07.SetStage(100) ; #DEBUG_LINE_NO:55
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:57
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:58
  PlayREF.Moveto(UC07_DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:68
  Self.SetStage(200) ; #DEBUG_LINE_NO:69
  Self.SetStage(300) ; #DEBUG_LINE_NO:70
  Self.SetStage(400) ; #DEBUG_LINE_NO:71
  Self.SetStage(410) ; #DEBUG_LINE_NO:72
  Self.SetStage(415) ; #DEBUG_LINE_NO:73
  Self.SetStage(420) ; #DEBUG_LINE_NO:74
  Self.SetStage(430) ; #DEBUG_LINE_NO:75
  Self.SetStage(440) ; #DEBUG_LINE_NO:76
  Self.SetStage(450) ; #DEBUG_LINE_NO:77
  Dialogue1OfAKindUC07.SetStage(50) ; #DEBUG_LINE_NO:78
  Dialogue1OfAKindUC07.SetStage(100) ; #DEBUG_LINE_NO:79
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:81
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:82
  Alias_HeatLeeches.DisableAll(False) ; #DEBUG_LINE_NO:83
  PlayREF.Moveto(UC07_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:93
  Self.SetStage(200) ; #DEBUG_LINE_NO:94
  Self.SetStage(300) ; #DEBUG_LINE_NO:95
  Self.SetStage(400) ; #DEBUG_LINE_NO:96
  Self.SetStage(410) ; #DEBUG_LINE_NO:97
  Self.SetStage(415) ; #DEBUG_LINE_NO:98
  Self.SetStage(420) ; #DEBUG_LINE_NO:99
  Self.SetStage(430) ; #DEBUG_LINE_NO:100
  Self.SetStage(440) ; #DEBUG_LINE_NO:101
  Self.SetStage(450) ; #DEBUG_LINE_NO:102
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:104
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:105
  PlayREF.Moveto(UC07_DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:106
  Alias_HeatLeeches.DisableAll(False) ; #DEBUG_LINE_NO:107
  PlayREF.AddItem(Mfg_Positron_Battery as Form, 1, False) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:117
  Self.SetStage(200) ; #DEBUG_LINE_NO:118
  Self.SetStage(300) ; #DEBUG_LINE_NO:119
  Self.SetStage(430) ; #DEBUG_LINE_NO:120
  Self.SetStage(440) ; #DEBUG_LINE_NO:121
  Self.SetStage(450) ; #DEBUG_LINE_NO:122
  Self.SetStage(500) ; #DEBUG_LINE_NO:123
  Self.SetStage(550) ; #DEBUG_LINE_NO:124
  Alias_KaiserCaptiveAlias.Clear() ; #DEBUG_LINE_NO:126
  Actor KaiREF = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:127
  KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage7, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:128
  KaiREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:129
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:130
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:131
  PlayREF.Moveto(UC07_DebugMarker05, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:132
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:134
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:135
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:144
  Self.SetStage(200) ; #DEBUG_LINE_NO:145
  Self.SetStage(300) ; #DEBUG_LINE_NO:146
  Self.SetStage(430) ; #DEBUG_LINE_NO:147
  Self.SetStage(440) ; #DEBUG_LINE_NO:148
  Self.SetStage(450) ; #DEBUG_LINE_NO:149
  Self.SetStage(500) ; #DEBUG_LINE_NO:150
  Self.SetStage(550) ; #DEBUG_LINE_NO:151
  Self.SetStage(560) ; #DEBUG_LINE_NO:152
  Self.SetStage(600) ; #DEBUG_LINE_NO:153
  Alias_KaiserCaptiveAlias.Clear() ; #DEBUG_LINE_NO:155
  Actor KaiREF = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:156
  KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage8, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:157
  UC07_550_Kaiser_ProceedToOverlook.Stop() ; #DEBUG_LINE_NO:158
  KaiREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:159
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:160
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:161
  PlayREF.Moveto(UC07_DebugMarker06, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:163
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:164
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:165
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:174
  Self.SetStage(200) ; #DEBUG_LINE_NO:175
  Self.SetStage(300) ; #DEBUG_LINE_NO:176
  Self.SetStage(800) ; #DEBUG_LINE_NO:177
  DialogueRedDevilsHQ.SetStage(20) ; #DEBUG_LINE_NO:178
  Alias_KaiserCaptiveAlias.Clear() ; #DEBUG_LINE_NO:180
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:181
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:182
  PlayREF.Moveto(UC07_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:183
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:184
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:185
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:186
  Self.SetStage(820) ; #DEBUG_LINE_NO:187
  Alias_Kaiser.GetActorRef().AllowPCDialogue(True) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:196
  uc07questscript kmyQuest = __temp as uc07questscript ; #DEBUG_LINE_NO:197
  Int I = 0 ; #DEBUG_LINE_NO:200
  Int iLength = kmyQuest.RecipePieces.Length ; #DEBUG_LINE_NO:201
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:202
  While I < iLength ; #DEBUG_LINE_NO:204
    PlayREF.AddItem(kmyQuest.RecipePieces[I].ComponentObject as Form, kmyQuest.RecipePieces[I].AmountRequired, False) ; #DEBUG_LINE_NO:205
    I += 1 ; #DEBUG_LINE_NO:207
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0019_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True) ; #DEBUG_LINE_NO:216
  Frontier_ModularREF.Moveto(RDHQShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:219
  Frontier_ModularREF.setlinkedref(RDHQShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:220
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:221
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:222
  UC04_JakobSandboxing_PostUC03.SetValue(1.0) ; #DEBUG_LINE_NO:225
  Alias_Jakob.GetRef().Moveto(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:226
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0) ; #DEBUG_LINE_NO:229
  Actor HadREF = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:230
  HadREF.Enable(False) ; #DEBUG_LINE_NO:231
  HadREF.Moveto(UC07_HadrianTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:232
  Game.GetPlayer().AddItem(TestVSWeapons as Form, 1, True) ; #DEBUG_LINE_NO:235
  DialogueRedDevilsHQ.SetStage(7) ; #DEBUG_LINE_NO:238
  Alias_RHQMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:241
  Alias_RHQMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:242
  UC05.SetStage(1000) ; #DEBUG_LINE_NO:245
  UC06.SetStage(1000) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:254
  uc07questscript kmyQuest = __temp as uc07questscript ; #DEBUG_LINE_NO:255
  Alias_Ecliptic.ResetAll() ; #DEBUG_LINE_NO:259
  kmyQuest.DistributeBatteryComponents() ; #DEBUG_LINE_NO:262
  UC07_HadrianVVRevealQuest.Start() ; #DEBUG_LINE_NO:265
  DialogueRedDevilsHQ.SetStage(10) ; #DEBUG_LINE_NO:268
  If UC05_FreestarObserversAccepted.GetValue() >= 1.0 ; #DEBUG_LINE_NO:271
    DialogueRedDevilsHQ.SetStage(12) ; #DEBUG_LINE_NO:272
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:275
  Self.SetActive(True) ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_0110_Item_00()
  UC07_110_HadrianSpotsPlayer.Start() ; #DEBUG_LINE_NO:284
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:285
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:293
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:294
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:303
EndFunction

Function Fragment_Stage_0220_Item_00()
  Actor PlayREF = Game.GetPlayer() ; #DEBUG_LINE_NO:311
  PlayREF.AddItem(Alias_KaiserSchematics.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:312
EndFunction

Function Fragment_Stage_0221_Item_00()
  If UC_PlayerKnows_KaiserIsARobot.GetValue() < 1.0 ; #DEBUG_LINE_NO:320
    Self.SetStage(222) ; #DEBUG_LINE_NO:322
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0223_Item_00()
  UC_PlayerKnows_KaiserIsARobot.SetValue(1.0) ; #DEBUG_LINE_NO:331
  UC_PlayerKnows_HadrianBuiltKaiser.SetValue(1.0) ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_0225_Item_00()
  UC_PlayerKnows_HadriansPast_Clone.SetValue(1.0) ; #DEBUG_LINE_NO:340
EndFunction

Function Fragment_Stage_0226_Item_00()
  Self.SetStage(225) ; #DEBUG_LINE_NO:349
EndFunction

Function Fragment_Stage_0227_Item_00()
  UC_PlayerKnows_HadriansPast_Clone.SetValue(1.0) ; #DEBUG_LINE_NO:357
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:365
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:366
  Actor KaiserREF = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:369
  KaiserREF.AddKeyword(ActorSocialImmune) ; #DEBUG_LINE_NO:370
  KaiserREF.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:371
  KaiserREF.AllowPCDialogue(False) ; #DEBUG_LINE_NO:372
  KaiserREF.SetGhost(True) ; #DEBUG_LINE_NO:373
  KaiserREF.Enable(False) ; #DEBUG_LINE_NO:374
  Alias_EmergencyBeacon.GetRef().Enable(False) ; #DEBUG_LINE_NO:375
  ObjectReference CageREF = Alias_CageDoor.GetRef() ; #DEBUG_LINE_NO:378
  CageREF.SetOpen(False) ; #DEBUG_LINE_NO:379
  CageREF.Lock(True, False, True) ; #DEBUG_LINE_NO:380
  Actor Unit99REF = Alias_Unit99.GetActorRef() ; #DEBUG_LINE_NO:383
  Unit99REF.SetRestrained(True) ; #DEBUG_LINE_NO:384
  Unit99REF.Enable(False) ; #DEBUG_LINE_NO:385
  Alias_HeatLeeches.EnableAll(False) ; #DEBUG_LINE_NO:388
  Alias_HeatLeeches.SetValue(Health, 1.0) ; #DEBUG_LINE_NO:389
  Alias_Wallsafe.GetRef().AddItem(Alias_FieldNotes.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:392
  UC07_LearnedPositronBatteryRecipe.SetValue(1.0) ; #DEBUG_LINE_NO:395
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:400
  Self.SetStage(302) ; #DEBUG_LINE_NO:401
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:409
  Self.SetObjectiveDisplayed(305, True, False) ; #DEBUG_LINE_NO:410
  Self.SetObjectiveDisplayed(306, True, False) ; #DEBUG_LINE_NO:411
EndFunction

Function Fragment_Stage_0310_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_SpeechDiscount.GetValue() ; #DEBUG_LINE_NO:419
  If UC07_GelFee.GetValue() - newValue < 1.0 ; #DEBUG_LINE_NO:421
    UC07_GelFee.SetValue(1.0) ; #DEBUG_LINE_NO:422
  Else ; #DEBUG_LINE_NO:
    UC07_GelFee.SetValue(newValue) ; #DEBUG_LINE_NO:424
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee) ; #DEBUG_LINE_NO:427
EndFunction

Function Fragment_Stage_0315_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_FreestarDiscount.GetValue() ; #DEBUG_LINE_NO:435
  If UC07_GelFee.GetValue() - newValue < 1.0 ; #DEBUG_LINE_NO:437
    UC07_GelFee.SetValue(1.0) ; #DEBUG_LINE_NO:438
  Else ; #DEBUG_LINE_NO:
    UC07_GelFee.SetValue(newValue) ; #DEBUG_LINE_NO:440
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee) ; #DEBUG_LINE_NO:443
EndFunction

Function Fragment_Stage_0317_Item_00()
  Float newValue = UC07_GelFee.GetValue() - UC07_GelFee_AzamiDiscount.GetValue() ; #DEBUG_LINE_NO:451
  If UC07_GelFee.GetValue() - newValue < 1.0 ; #DEBUG_LINE_NO:453
    UC07_GelFee.SetValue(1.0) ; #DEBUG_LINE_NO:454
  Else ; #DEBUG_LINE_NO:
    UC07_GelFee.SetValue(newValue) ; #DEBUG_LINE_NO:456
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateCurrentInstanceGlobal(UC07_GelFee) ; #DEBUG_LINE_NO:459
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC07_GelFee.GetValueInt(), False, None) ; #DEBUG_LINE_NO:467
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:475
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:483
  Self.SetObjectiveCompleted(305, True) ; #DEBUG_LINE_NO:484
  Self.SetObjectiveCompleted(306, True) ; #DEBUG_LINE_NO:485
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:486
EndFunction

Function Fragment_Stage_0407_Item_00()
  Self.SetStage(420) ; #DEBUG_LINE_NO:494
  If !Self.GetStageDone(440) ; #DEBUG_LINE_NO:496
    UC07_420_Kaiser_BiologicalContamination.Start() ; #DEBUG_LINE_NO:497
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveSkipped(305) ; #DEBUG_LINE_NO:506
  Self.SetObjectiveSkipped(306) ; #DEBUG_LINE_NO:507
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:508
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:509
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:510
EndFunction

Function Fragment_Stage_0415_Item_00()
  Alias_EmergencyBeacon.GetRef().Disable(False) ; #DEBUG_LINE_NO:518
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:526
  Self.SetObjectiveDisplayed(420, False, False) ; #DEBUG_LINE_NO:527
  Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:528
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_Kaiser.GetActorRef().AllowPCDialogue(True) ; #DEBUG_LINE_NO:536
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:537
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:538
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:539
  UC07_420_Kaiser_BiologicalContamination.Stop() ; #DEBUG_LINE_NO:540
  UC07_440a_Kaiser_HeatleechesEliminated.Start() ; #DEBUG_LINE_NO:541
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.GetPlayer().GetItemCount(Mfg_Positron_Battery as Form) < 1 ; #DEBUG_LINE_NO:549
    Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:550
    Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:551
    Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:552
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveSkipped(420) ; #DEBUG_LINE_NO:554
    Self.SetStage(500) ; #DEBUG_LINE_NO:555
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0460_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:564
  Self.SetObjectiveDisplayedAtTop(460) ; #DEBUG_LINE_NO:565
  Self.SetObjectiveDisplayed(461, True, False) ; #DEBUG_LINE_NO:566
EndFunction

Function Fragment_Stage_0470_Item_00()
  Self.SetObjectiveCompleted(461, True) ; #DEBUG_LINE_NO:574
  Self.SetStage(480) ; #DEBUG_LINE_NO:575
EndFunction

Function Fragment_Stage_0480_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:592
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:594
    If PlayACT.GetItemCount(UC07_Microcell_ConductorArray as Form) >= 1 && PlayACT.GetItemCount(UC07_Microcell_PowerSource as Form) >= 1 && PlayACT.GetItemCount(UC07_Microcell_Shielding as Form) >= 1 ; #DEBUG_LINE_NO:595,596,597
      Self.SetStage(485) ; #DEBUG_LINE_NO:598
    Else ; #DEBUG_LINE_NO:
      If PlayACT.GetItemCount(UC07_Microcell_ConductorArray as Form) < 1 ; #DEBUG_LINE_NO:600
        Self.SetObjectiveDisplayed(481, True, False) ; #DEBUG_LINE_NO:601
      EndIf ; #DEBUG_LINE_NO:
      If PlayACT.GetItemCount(UC07_Microcell_PowerSource as Form) < 1 ; #DEBUG_LINE_NO:604
        Self.SetObjectiveDisplayed(482, True, False) ; #DEBUG_LINE_NO:605
      EndIf ; #DEBUG_LINE_NO:
      If PlayACT.GetItemCount(UC07_Microcell_Shielding as Form) < 1 ; #DEBUG_LINE_NO:608
        Self.SetObjectiveDisplayed(483, True, False) ; #DEBUG_LINE_NO:609
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0481_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:620
    Self.SetObjectiveCompleted(481, True) ; #DEBUG_LINE_NO:621
    If Self.GetStageDone(482) && Self.GetStageDone(483) ; #DEBUG_LINE_NO:623
      Self.SetStage(485) ; #DEBUG_LINE_NO:624
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0482_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:634
    Self.SetObjectiveCompleted(482, True) ; #DEBUG_LINE_NO:635
    If Self.GetStageDone(481) && Self.GetStageDone(483) ; #DEBUG_LINE_NO:637
      Self.SetStage(485) ; #DEBUG_LINE_NO:638
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0483_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:648
    Self.SetObjectiveCompleted(483, True) ; #DEBUG_LINE_NO:649
    If Self.GetStageDone(482) && Self.GetStageDone(481) ; #DEBUG_LINE_NO:651
      Self.SetStage(485) ; #DEBUG_LINE_NO:652
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0485_Item_00()
  Self.SetObjectiveDisplayed(485, True, False) ; #DEBUG_LINE_NO:662
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:670
  If Self.GetStageDone(495) ; #DEBUG_LINE_NO:672
    Self.SetObjectiveDisplayed(460, False, False) ; #DEBUG_LINE_NO:673
    Self.SetObjectiveCompleted(485, True) ; #DEBUG_LINE_NO:674
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(460, True) ; #DEBUG_LINE_NO:676
    Self.SetObjectiveDisplayed(485, False, False) ; #DEBUG_LINE_NO:677
  EndIf ; #DEBUG_LINE_NO:
  If Self.isObjectiveDisplayed(461) ; #DEBUG_LINE_NO:681
    Self.SetObjectiveDisplayed(461, False, False) ; #DEBUG_LINE_NO:682
  EndIf ; #DEBUG_LINE_NO:
  If Self.isObjectiveDisplayed(481) ; #DEBUG_LINE_NO:685
    Self.SetObjectiveDisplayed(481, False, False) ; #DEBUG_LINE_NO:686
  EndIf ; #DEBUG_LINE_NO:
  If Self.isObjectiveDisplayed(482) ; #DEBUG_LINE_NO:689
    Self.SetObjectiveDisplayed(482, False, False) ; #DEBUG_LINE_NO:690
  EndIf ; #DEBUG_LINE_NO:
  If Self.isObjectiveDisplayed(483) ; #DEBUG_LINE_NO:693
    Self.SetObjectiveDisplayed(483, False, False) ; #DEBUG_LINE_NO:694
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:697
EndFunction

Function Fragment_Stage_0510_Item_00()
  Game.GetPlayer().RemoveItem(Alias_MicroCell.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:706
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:708
  Self.SetObjectiveDisplayed(510, True, False) ; #DEBUG_LINE_NO:709
  Actor KaiserREF = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:712
  KaiserREF.RemoveKeyword(ActorSocialImmune) ; #DEBUG_LINE_NO:713
  KaiserREF.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:714
  KaiserREF.AllowBleedoutDialogue(False) ; #DEBUG_LINE_NO:715
  KaiserREF.SetGhost(False) ; #DEBUG_LINE_NO:716
  KaiserREF.RestoreValue(Health, 1000000.0) ; #DEBUG_LINE_NO:717
  KaiserREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:718
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_KaiserCaptiveAlias.Clear() ; #DEBUG_LINE_NO:727
  Alias_Kaiser.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:730
  UC07_550_Kaiser_ProceedToOverlook.Start() ; #DEBUG_LINE_NO:732
  Self.SetObjectiveCompleted(510, True) ; #DEBUG_LINE_NO:734
  Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:735
EndFunction

Function Fragment_Stage_0551_Item_00()
  Self.SetStage(550) ; #DEBUG_LINE_NO:743
EndFunction

Function Fragment_Stage_0557_Item_00()
  Alias_Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:751
EndFunction

Function Fragment_Stage_0560_Item_00()
  Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:759
  Self.SetObjectiveDisplayed(560, True, False) ; #DEBUG_LINE_NO:760
  Alias_Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:761
EndFunction

Function Fragment_Stage_0563_Item_00()
  Self.SetStage(545) ; #DEBUG_LINE_NO:769
EndFunction

Function Fragment_Stage_0598_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(650) ; #DEBUG_LINE_NO:777
    If Self.GetStageDone(599) ; #DEBUG_LINE_NO:778
      Self.SetObjectiveDisplayed(598, True, False) ; #DEBUG_LINE_NO:779
      If !Self.GetStageDone(615) ; #DEBUG_LINE_NO:781
        Self.SetObjectiveDisplayed(597, True, False) ; #DEBUG_LINE_NO:782
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0599_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(650) ; #DEBUG_LINE_NO:793
    Self.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:794
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:795
    If Self.GetStageDone(598) ; #DEBUG_LINE_NO:797
      Self.SetObjectiveDisplayed(598, True, False) ; #DEBUG_LINE_NO:798
      If !Self.GetStageDone(615) ; #DEBUG_LINE_NO:800
        Self.SetObjectiveDisplayed(597, True, False) ; #DEBUG_LINE_NO:801
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(598, False, False) ; #DEBUG_LINE_NO:813
  Self.SetObjectiveDisplayed(597, False, False) ; #DEBUG_LINE_NO:814
  Actor KaiACT = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:816
  KaiACT.SetValue(Perception, 3.0) ; #DEBUG_LINE_NO:817
  Alias_EclipticEnemyAlias.ForceRefTo(KaiACT as ObjectReference) ; #DEBUG_LINE_NO:818
  KaiACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:819
  If !Self.GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0.0 ; #DEBUG_LINE_NO:821
    If !Self.GetStageDone(650) ; #DEBUG_LINE_NO:823
      Self.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:824
      Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:825
      If Self.GetStageDone(598) ; #DEBUG_LINE_NO:827
        Self.SetObjectiveDisplayed(598, True, False) ; #DEBUG_LINE_NO:828
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Alias_Unit99.GetActorRef().AddToFaction(UC07_EclipticFaction) ; #DEBUG_LINE_NO:831
      Self.SetObjectiveCompleted(599, True) ; #DEBUG_LINE_NO:832
      Self.SetStage(660) ; #DEBUG_LINE_NO:833
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0604_Item_00()
  If !Self.GetStageDone(610) && !Self.GetStageDone(700) ; #DEBUG_LINE_NO:843
    UC07_604_EclipticScene.Start() ; #DEBUG_LINE_NO:844
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0610_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:853
  uc07questscript kmyQuest = __temp as uc07questscript ; #DEBUG_LINE_NO:854
  If UC07_Niira_PreventCageRelease.GetValue() < 1.0 ; #DEBUG_LINE_NO:857
    Self.SetObjectiveFailed(598, True) ; #DEBUG_LINE_NO:858
    Self.SetObjectiveFailed(597, True) ; #DEBUG_LINE_NO:859
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(598, False, False) ; #DEBUG_LINE_NO:861
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(605) ; #DEBUG_LINE_NO:863
  ObjectReference CageREF = Alias_CageDoor.GetRef() ; #DEBUG_LINE_NO:864
  If !Self.GetStageDone(620) && !Self.GetStageDone(700) && CageREF.GetOpenState() == 3 ; #DEBUG_LINE_NO:866
    If kmyQuest.CheckForLivingSceneTarget(Alias_Ecliptic) ; #DEBUG_LINE_NO:867
      UC07_610_Ecliptic_Release99.Start() ; #DEBUG_LINE_NO:868
      Utility.Wait(6.0) ; #DEBUG_LINE_NO:871
      If UC07_Niira_PreventCageRelease.GetValue() < 1.0 ; #DEBUG_LINE_NO:872
        CageREF.Unlock(False) ; #DEBUG_LINE_NO:873
        CageREF.SetOpen(True) ; #DEBUG_LINE_NO:874
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(625) ; #DEBUG_LINE_NO:879
EndFunction

Function Fragment_Stage_0615_Item_00()
  If Self.GetStageDone(598) && !Self.GetStageDone(610) && !Self.GetStageDone(700) ; #DEBUG_LINE_NO:887
    Self.SetObjectiveCompleted(597, True) ; #DEBUG_LINE_NO:888
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0620_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:897
  uc07questscript kmyQuest = __temp as uc07questscript ; #DEBUG_LINE_NO:898
  Self.SetStage(605) ; #DEBUG_LINE_NO:901
  If Self.isObjectiveDisplayed(599) ; #DEBUG_LINE_NO:903
    Self.SetObjectiveDisplayed(599, False, False) ; #DEBUG_LINE_NO:904
  EndIf ; #DEBUG_LINE_NO:
  If Self.isObjectiveDisplayed(597) ; #DEBUG_LINE_NO:907
    Self.SetObjectiveFailed(597, True) ; #DEBUG_LINE_NO:908
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(610) ; #DEBUG_LINE_NO:911
    If kmyQuest.CheckForLivingSceneTarget(Alias_Ecliptic) ; #DEBUG_LINE_NO:912
      UC07_604_EclipticScene.Stop() ; #DEBUG_LINE_NO:913
      UC07_620_Ecliptic_Release99Hostile.Start() ; #DEBUG_LINE_NO:914
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(630) ; #DEBUG_LINE_NO:917
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(710) ; #DEBUG_LINE_NO:920
    Self.SetStage(660) ; #DEBUG_LINE_NO:921
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0625_Item_00()
  If UC07_Niira_PreventCageRelease.GetValue() < 1.0 ; #DEBUG_LINE_NO:930
    Actor Unit99REF = Alias_Unit99.GetActorRef() ; #DEBUG_LINE_NO:931
    Unit99REF.SetRestrained(False) ; #DEBUG_LINE_NO:932
    Unit99REF.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:933
    Self.SetStage(660) ; #DEBUG_LINE_NO:934
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0630_Item_00()
  Dialogue1OfAKindUC07.SetStage(200) ; #DEBUG_LINE_NO:943
  Self.SetStage(660) ; #DEBUG_LINE_NO:944
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:952
  If Self.GetStageDone(560) ; #DEBUG_LINE_NO:955
    If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:956
      If !Self.GetStageDone(600) && (!Self.GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0.0) ; #DEBUG_LINE_NO:957
        If !Self.IsObjectiveCompleted(597) ; #DEBUG_LINE_NO:958
          Self.SetObjectiveDisplayed(597, False, False) ; #DEBUG_LINE_NO:959
        EndIf ; #DEBUG_LINE_NO:
        Self.SetObjectiveCompleted(598, True) ; #DEBUG_LINE_NO:961
        Self.SetObjectiveDisplayed(599, True, False) ; #DEBUG_LINE_NO:962
      ElseIf Self.GetStageDone(700) ; #DEBUG_LINE_NO:966
        Self.SetStage(705) ; #DEBUG_LINE_NO:967
      Else ; #DEBUG_LINE_NO:
        Self.SetStage(660) ; #DEBUG_LINE_NO:969
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(599, False, False) ; #DEBUG_LINE_NO:975
      Self.SetStage(705) ; #DEBUG_LINE_NO:976
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0660_Item_00()
  UC07_701_Kaiser_ProceedToUnit99.Stop() ; #DEBUG_LINE_NO:986
  If Self.GetStageDone(560) ; #DEBUG_LINE_NO:988
    If !Self.IsObjectiveCompleted(550) ; #DEBUG_LINE_NO:989
      Self.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:990
    EndIf ; #DEBUG_LINE_NO:
    If !Self.IsObjectiveCompleted(560) ; #DEBUG_LINE_NO:993
      Self.SetObjectiveDisplayed(560, False, False) ; #DEBUG_LINE_NO:994
    EndIf ; #DEBUG_LINE_NO:
    If !Self.GetStageDone(710) ; #DEBUG_LINE_NO:998
      Self.SetObjectiveDisplayed(660, True, False) ; #DEBUG_LINE_NO:999
      Dialogue1OfAKindUC07.SetStage(190) ; #DEBUG_LINE_NO:1002
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  UC07_701_Kaiser_ProceedToUnit99.Stop() ; #DEBUG_LINE_NO:1012
  UC07_610_Ecliptic_Release99.Stop() ; #DEBUG_LINE_NO:1013
  Self.SetObjectiveCompleted(660, True) ; #DEBUG_LINE_NO:1015
  If Self.GetStageDone(550) && Self.GetStageDone(560) ; #DEBUG_LINE_NO:1018
    If Self.GetStageDone(610) ; #DEBUG_LINE_NO:1019
      If Self.GetStageDone(650) ; #DEBUG_LINE_NO:1020
        Self.SetStage(705) ; #DEBUG_LINE_NO:1021
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(600, False, False) ; #DEBUG_LINE_NO:1024
      Self.SetStage(705) ; #DEBUG_LINE_NO:1025
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0701_Item_00()
  Self.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:1035
  Self.SetObjectiveCompleted(599, True) ; #DEBUG_LINE_NO:1036
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:1037
  UC07_701_Kaiser_ProceedToUnit99.Start() ; #DEBUG_LINE_NO:1038
EndFunction

Function Fragment_Stage_0705_Item_00()
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:1047
    If Self.GetStageDone(600) ; #DEBUG_LINE_NO:1048
      Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:1049
      UC07_700_Kaiser_Unit99Eulogy.Start() ; #DEBUG_LINE_NO:1050
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(710) ; #DEBUG_LINE_NO:1052
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0707_Item_00()
  If !Alias_Unit99.GetActorRef().IsDead() ; #DEBUG_LINE_NO:1062
    WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Alias_Kaiser.GetRef(), None, None) ; #DEBUG_LINE_NO:1063
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:1072
  Self.SetObjectiveDisplayed(710, True, False) ; #DEBUG_LINE_NO:1073
  Alias_Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1074
EndFunction

Function Fragment_Stage_0715_Item_00()
  If UC07_550_Kaiser_ProceedToOverlook.IsPlaying() ; #DEBUG_LINE_NO:1082
    UC07_550_Kaiser_ProceedToOverlook.Stop() ; #DEBUG_LINE_NO:1083
  EndIf ; #DEBUG_LINE_NO:
  Alias_Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1085
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(510, True) ; #DEBUG_LINE_NO:1093
  If Self.isObjectiveDisplayed(560) ; #DEBUG_LINE_NO:1095
    Self.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:1096
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(710, True) ; #DEBUG_LINE_NO:1099
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:1100
  DialogueRedDevilsHQ.SetStage(20) ; #DEBUG_LINE_NO:1103
  Alias_Kaiser.GetActorRef().SetValue(Perception, 5.0) ; #DEBUG_LINE_NO:1106
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(820) ; #DEBUG_LINE_NO:1114
    Alias_Kaiser.GetRef().Disable(False) ; #DEBUG_LINE_NO:1115
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0815_Item_00()
  If Alias_PlayerShip.GetRef().GetCurrentLocation() == LC042BattleofNiiraLocation ; #DEBUG_LINE_NO:1124
    UC07_815_Kaiser_PlayerSatInPilotsSeatScene.Start() ; #DEBUG_LINE_NO:1125
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0817_Item_00()
  Actor Unit99 = Alias_Unit99.GetActorRef() ; #DEBUG_LINE_NO:1134
  If !Unit99.IsDead() ; #DEBUG_LINE_NO:1135
    Unit99.Disable(False) ; #DEBUG_LINE_NO:1136
    ObjectReference CageDoorRef = Alias_CageDoor.GetRef() ; #DEBUG_LINE_NO:1138
    CageDoorRef.Unlock(False) ; #DEBUG_LINE_NO:1139
    If CageDoorRef.GetOpenState() == 3 ; #DEBUG_LINE_NO:1140
      CageDoorRef.SetOpen(True) ; #DEBUG_LINE_NO:1141
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  UC07_820_Kaiser_ArrivedAtRDHQ.Start() ; #DEBUG_LINE_NO:1152
  Actor KaiREF = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:1154
  KaiREF.Moveto(UC07_Kaiser_Scene850Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1155
  KaiREF.Enable(False) ; #DEBUG_LINE_NO:1156
  Alias_TriggerStage825.GetRef().Enable(False) ; #DEBUG_LINE_NO:1158
  Alias_Hadrian.GetRef().Moveto(UC07_Jakob_Scene850Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1161
  Alias_Jakob.GetRef().Moveto(UC07_Hadrian_Scene850Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:1162
EndFunction

Function Fragment_Stage_0825_Item_00()
  Alias_Kaiser.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:1170
EndFunction

Function Fragment_Stage_0850_Item_00()
  UC07_850_KaiserHadrianJakob_Reunite.Start() ; #DEBUG_LINE_NO:1178
EndFunction

Function Fragment_Stage_1000_Item_00()
  UC08.Start() ; #DEBUG_LINE_NO:1186
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:1187
  Self.Stop() ; #DEBUG_LINE_NO:1188
EndFunction
