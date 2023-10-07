ScriptName Fragments:Quests:QF_CF08_Fleet_001EF7F1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088 Auto Const mandatory
lc088_spacequestscript Property LC088_Space Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Naeva Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Jazz Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ObjectReference Property CF08_Fleet_NaevaMarker_Breifing Auto Const mandatory
ObjectReference Property CF08_Fleet_DelgadoMarker Auto Const mandatory
ObjectReference Property CF08_Fleet_JazzMarker_Briefing Auto Const mandatory
Scene Property LC088_1019_SurrenderScene Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property MathisEliteCrewQuest Auto Const
GlobalVariable Property UC_PlayerSidedWithCF Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
Quest Property CF08_Fleet_Misc Auto Const mandatory
Scene Property CF08_Fleet_Stage045_DelgadoIntro Auto Const mandatory
Scene Property CF08_Fleet_Stage050_Delgado_IntroScene Auto Const mandatory
Scene Property CF08_Fleet_Stage040_Naeva_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_JasmineBriefingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF08_Operations_Marker01 Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const mandatory
ActorValue Property CF08_FleetComplete_AV Auto Const mandatory
ActorValue Property CF08_KibweKilled_AV Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
GlobalVariable Property MQ305_CF_PirateEnding Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_Mathis Auto Const mandatory
Scene Property LC088_1020_ExecutionScene Auto Const mandatory
Scene Property CF08_Fleet_Stage520_Delgado_OutroScene Auto Const mandatory
RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const mandatory
ReferenceAlias Property Alias_MathisSitMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_NaevaWaitsMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker04 Auto Const mandatory
Quest Property CFSD01 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const mandatory
Quest Property CF08_SpeechChallenge_Kibwe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  DialogueCFTheKey.SetStage(300) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:15
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:18
  CFSD01.SetObjectiveSkipped(100) ; #DEBUG_LINE_NO:19
  CFSD01.SetObjectiveSkipped(200) ; #DEBUG_LINE_NO:20
  CFSD01.SetObjectiveSkipped(300) ; #DEBUG_LINE_NO:21
  CFSD01.Stop() ; #DEBUG_LINE_NO:22
  Self.SetActive(True) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:41
  CF08_Fleet_Misc.Start() ; #DEBUG_LINE_NO:44
  Alias_CF08_Fleet_Delgado.GetRef().MoveTo(Alias_CF08_Fleet_DelgadoBriefingMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  Alias_CF08_Fleet_Naeva.GetRef().MoveTo(Alias_CF08_Fleet_NaevaWaitsMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:46
  Alias_CF_AlarmBattlePrep.EnableAll(False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0035_Item_00()
  CF08_Fleet_Stage040_Naeva_IntroScene.Start() ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:66
  CF08_Fleet_Misc.SetStage(5) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0048_Item_00()
  CF08_Fleet_Stage045_DelgadoIntro.Start() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0049_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:96
  LC088_Space.InsertDataCore(True) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:107
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:108
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:109
  Alias_CF08_Fleet_Delgado.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_DelgadoBriefingMarker04.GetRef()) ; #DEBUG_LINE_NO:111
  Alias_CF08_Fleet_Jazz.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_JasmineBriefingMarker01.GetRef()) ; #DEBUG_LINE_NO:112
  CF08_Fleet_Misc.SetStage(10) ; #DEBUG_LINE_NO:114
  ObjectReference MathisSitRef = Alias_MathisSitMarker.GetRef() ; #DEBUG_LINE_NO:116
  Alias_CF08_Fleet_Mathis.GetActorRef().SnapIntoInteraction(MathisSitRef) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0051_Item_00()
  CF08_Fleet_Stage045_DelgadoIntro.Stop() ; #DEBUG_LINE_NO:126
  CF08_Fleet_Stage050_Delgado_IntroScene.Start() ; #DEBUG_LINE_NO:127
  Alias_CF08_Fleet_Naeva.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0052_Item_00()
  Alias_CF_AlarmBattlePrep.EnableAll(False) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0055_Item_00()
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:146
  Alias_CF_AlarmBattlePrep.DisableAll(False) ; #DEBUG_LINE_NO:147
  Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:156
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:158
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:159
  LC088_Space.SetStage(110) ; #DEBUG_LINE_NO:160
  CF08_Fleet_Stage050_Delgado_IntroScene.Stop() ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:199
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:200
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:201
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:218
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:227
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:228
  Alias_CF08_Fleet_Naeva.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:229
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:237
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:238
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0330_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:254
  Self.SetStage(340) ; #DEBUG_LINE_NO:255
EndFunction

Function Fragment_Stage_0340_Item_00()
  If LC088_Vigilance.GetStageDone(310) == False && Self.GetStageDone(350) == False ; #DEBUG_LINE_NO:263
    Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:264
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0375_Item_00()
  If !Self.GetStageDone(370) ; #DEBUG_LINE_NO:297
    Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:298
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0380_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:307
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:308
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:316
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:317
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:325
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:326
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:334
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:342
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:350
EndFunction

Function Fragment_Stage_0440_Item_00()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:358
  UC_PlayerSidedWithCF.SetValue(1.0) ; #DEBUG_LINE_NO:361
  Game.GetPlayer().SetValue(CF08_KibweKilled_AV, 1.0) ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_0505_Item_00()
  CF08_Fleet_Stage520_Delgado_OutroScene.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:380
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:381
  Alias_CF08_Fleet_Delgado.GetActorRef().MoveTo(CF08_Fleet_DelgadoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:386
  Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:387
  Alias_CF08_Fleet_Jazz.GetActorRef().MoveTo(CF08_Fleet_JazzMarker_Briefing, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:388
  Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:389
  CF08_Fleet_Misc.SetStage(100) ; #DEBUG_LINE_NO:392
  Alias_CF_AlarmBattlePrep.DisableAll(False) ; #DEBUG_LINE_NO:393
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:401
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:402
  LC088_1019_SurrenderScene.Stop() ; #DEBUG_LINE_NO:407
  LC088_1020_ExecutionScene.Stop() ; #DEBUG_LINE_NO:408
  Actor NaevaRef = Alias_CF08_Fleet_Naeva.GetActorRef() ; #DEBUG_LINE_NO:411
  If NaevaRef.IsDisabled() ; #DEBUG_LINE_NO:413
    NaevaRef.EnableNoWait(False) ; #DEBUG_LINE_NO:414
  EndIf ; #DEBUG_LINE_NO:
  NaevaRef.MoveTo(CF08_Fleet_NaevaMarker_Breifing, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:416
  NaevaRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:417
  CF08_Fleet_Misc.SetStage(120) ; #DEBUG_LINE_NO:420
EndFunction

Function Fragment_Stage_0525_Item_00()
  Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:436
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:444
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetObjectiveDisplayed(250, False, False) ; #DEBUG_LINE_NO:452
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetObjectiveDisplayed(260, True, False) ; #DEBUG_LINE_NO:460
EndFunction

Function Fragment_Stage_0625_Item_00()
  Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:468
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveDisplayed(260, False, False) ; #DEBUG_LINE_NO:476
EndFunction

Function Fragment_Stage_0635_Item_00()
  Self.SetObjectiveDisplayed(270, True, False) ; #DEBUG_LINE_NO:484
EndFunction

Function Fragment_Stage_0640_Item_00()
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:492
EndFunction

Function Fragment_Stage_0645_Item_00()
  Self.SetObjectiveDisplayed(270, False, False) ; #DEBUG_LINE_NO:500
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveDisplayed(280, True, False) ; #DEBUG_LINE_NO:508
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveCompleted(280, True) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveDisplayed(280, False, False) ; #DEBUG_LINE_NO:524
EndFunction

Function Fragment_Stage_0665_Item_00()
  Self.SetObjectiveDisplayed(290, True, False) ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(290, True) ; #DEBUG_LINE_NO:540
EndFunction

Function Fragment_Stage_0675_Item_00()
  Self.SetObjectiveDisplayed(290, False, False) ; #DEBUG_LINE_NO:548
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.GetStageDone(330) ; #DEBUG_LINE_NO:556
    Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:557
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(350) ; #DEBUG_LINE_NO:560
    Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:561
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  RAD02.SetStage(600) ; #DEBUG_LINE_NO:571
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:573
  MathisEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:574
  Alias_CF08_Fleet_Mathis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:575
  CF08_Fleet_Misc.SetStage(500) ; #DEBUG_LINE_NO:576
  Game.GetPlayer().SetValue(CF08_FleetComplete_AV, 1.0) ; #DEBUG_LINE_NO:579
  MQ305_CF_PirateEnding.SetValue(1.0) ; #DEBUG_LINE_NO:582
  Game.AddAchievement(22) ; #DEBUG_LINE_NO:585
  (Alias_CF08_Fleet_Jazz.GetRef() as shipvendorscript).CheckForInventoryRefresh(True) ; #DEBUG_LINE_NO:588
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:591
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:592
  Int I = 0 ; #DEBUG_LINE_NO:593
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:594
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:595
    I += 1 ; #DEBUG_LINE_NO:596
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_CrimsonFleet.Send(None) ; #DEBUG_LINE_NO:598
  CF08_SpeechChallenge_Kibwe.Stop() ; #DEBUG_LINE_NO:600
  Self.Stop() ; #DEBUG_LINE_NO:602
EndFunction
