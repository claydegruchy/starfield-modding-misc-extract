ScriptName Fragments:Quests:QF_CF08_SysDef_001B41D0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088 Auto Const mandatory
lc088_spacequestscript Property LC088_Space Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ObjectReference Property CF08_SysDef_Kibwe_BriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const mandatory
ObjectReference Property CF08_SysDef_Toft_BriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Toft Auto Const mandatory
Quest Property RAD02 Auto Const mandatory
ActorValue Property CF08_SysDefComplete_AV Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_ToftBriefingMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_IkandeBriefingMarker Auto Const mandatory
Quest Property CF08_SysDef_Misc Auto Const mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const mandatory
Quest Property CF08_SpeechChallenge_Delgado Auto Const mandatory
ReferenceAlias Property Alias_CF08_Toft_EndMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Kibwe_EndMarker Auto Const mandatory
ObjectReference Property CF08_PlayerRoomDoorRef Auto Const mandatory
GlobalVariable Property MQ305_CF_SysDefEnding Auto Const mandatory
Quest Property CFKey_TerminalQuest Auto Const mandatory
Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const mandatory
RefCollectionAlias Property Alias_ComTriggerKey Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Mathis Auto Const mandatory
Scene Property CF08_SysDef_Stage030_Ikande_IntroScene Auto Const mandatory
Scene Property CF08_SysDef_Stage520_Ikande_OutroPre Auto Const mandatory
LocationAlias Property Alias_StationTheKeyInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Delgado Auto Const mandatory
ReferenceAlias Property Alias_AlarmStation Auto Const mandatory
RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Voss Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_VossSurrenderMarker Auto Const mandatory
Quest Property FFKeyZ01 Auto Const mandatory
Quest Property FFKeyZ01MiscObjective Auto Const mandatory
Quest Property FFKeyZ02 Auto Const mandatory
Quest Property MB_Piracy01Far_CFR01 Auto Const mandatory
Quest Property MB_Piracy02Far_CFR01 Auto Const mandatory
Quest Property MB_Piracy03Far_CFR01 Auto Const mandatory
Quest Property MB_Smuggle01_CFR02 Auto Const mandatory
Quest Property MB_Smuggle01_CFR0200 Auto Const mandatory
Quest Property MB_Smuggle01_CFR0201 Auto Const mandatory
Quest Property MB_Steal01Far_CFR03 Auto Const mandatory
Quest Property MB_Steal02Far_CFR03 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const mandatory
affinityevent Property CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01 Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_ZW11_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_ZW12_Timestamp Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  DialogueCFTheKey.SetStage(300) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_CF08_SysDef_Mathis.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0007_Item_00()
  CF08_SysDef_Stage030_Ikande_IntroScene.Start() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0008_Item_00()
  CF08_SysDef_Stage520_Ikande_OutroPre.Start() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0009_Item_00()
  CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01.Send(None) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:56
  defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:60
  CF08_SysDef_Misc.Start() ; #DEBUG_LINE_NO:63
  ObjectReference IkandeMarkerRef = Alias_CF08_SysDef_IkandeBriefingMarker.GetRef() ; #DEBUG_LINE_NO:66
  Alias_CF08_SysDef_Ikande.GetRef().MoveTo(IkandeMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:68
  Alias_CF08_SysDef_Toft.GetRef().MoveTo(Alias_CF08_SysDef_ToftBriefingMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:69
  CFKey_TerminalQuest.Stop() ; #DEBUG_LINE_NO:72
  Alias_ComTriggerKey.DisableAll(False) ; #DEBUG_LINE_NO:73
  DialogueCFTheKey.SetStage(20) ; #DEBUG_LINE_NO:74
  Self.SetActive(True) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0010_Item_01()
  FFKeyZ01.SetStage(66) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0010_Item_02()
  FFKeyZ01MiscObjective.SetStage(66) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0010_Item_03()
  FFKeyZ02.SetStage(66) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0010_Item_04()
  If MB_Piracy01Far_CFR01.IsRunning() ; #DEBUG_LINE_NO:108
    MB_Piracy01Far_CFR01.FailAllObjectives() ; #DEBUG_LINE_NO:109
    MB_Piracy01Far_CFR01.SetStage(200) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
  If MB_Piracy02Far_CFR01.IsRunning() ; #DEBUG_LINE_NO:113
    MB_Piracy02Far_CFR01.FailAllObjectives() ; #DEBUG_LINE_NO:114
    MB_Piracy02Far_CFR01.SetStage(200) ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
  If MB_Piracy03Far_CFR01.IsRunning() ; #DEBUG_LINE_NO:118
    MB_Piracy03Far_CFR01.FailAllObjectives() ; #DEBUG_LINE_NO:119
    MB_Piracy03Far_CFR01.SetStage(200) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
  If MB_Smuggle01_CFR02.IsRunning() ; #DEBUG_LINE_NO:123
    MB_Smuggle01_CFR02.FailAllObjectives() ; #DEBUG_LINE_NO:124
    MB_Smuggle01_CFR02.SetStage(200) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  If MB_Smuggle01_CFR0200.IsRunning() ; #DEBUG_LINE_NO:128
    MB_Smuggle01_CFR0200.FailAllObjectives() ; #DEBUG_LINE_NO:129
    MB_Smuggle01_CFR0200.SetStage(200) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  If MB_Smuggle01_CFR0201.IsRunning() ; #DEBUG_LINE_NO:133
    MB_Smuggle01_CFR0201.FailAllObjectives() ; #DEBUG_LINE_NO:134
    MB_Smuggle01_CFR0201.SetStage(200) ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
  If MB_Steal01Far_CFR03.IsRunning() ; #DEBUG_LINE_NO:138
    MB_Steal01Far_CFR03.FailAllObjectives() ; #DEBUG_LINE_NO:139
    MB_Steal01Far_CFR03.SetStage(200) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
  If MB_Steal02Far_CFR03.IsRunning() ; #DEBUG_LINE_NO:143
    MB_Steal02Far_CFR03.FailAllObjectives() ; #DEBUG_LINE_NO:144
    MB_Steal02Far_CFR03.SetStage(200) ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:154
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:163
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:164
  Alias_AlarmStation.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0035_Item_00()
  CF08_SysDef_Misc.SetStage(40) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0110_Item_00()
  LC088_Space.SetStage(210) ; #DEBUG_LINE_NO:184
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:185
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:186
  CF08_SysDef_Stage030_Ikande_IntroScene.Stop() ; #DEBUG_LINE_NO:187
  LC088_Space.InsertDataCore(False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:207
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:216
  Self.SetStage(210) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:233
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:234
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:242
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:243
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:251
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_0315_Item_00()
  If Self.GetStage() == 315 ; #DEBUG_LINE_NO:260
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:261
    Self.SetObjectiveDisplayed(105, True, False) ; #DEBUG_LINE_NO:262
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0316_Item_00()
  If Self.GetStage() == 316 ; #DEBUG_LINE_NO:271
    Self.SetObjectiveCompleted(105, True) ; #DEBUG_LINE_NO:272
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  If Self.GetStage() == 320 ; #DEBUG_LINE_NO:282
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:283
    Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:284
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStage() == 330 ; #DEBUG_LINE_NO:293
    Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:294
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:295
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStage() == 340 ; #DEBUG_LINE_NO:304
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:305
    Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:306
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0345_Item_00()
  If Self.GetStage() == 345 ; #DEBUG_LINE_NO:315
    Self.SetObjectiveDisplayed(125, True, False) ; #DEBUG_LINE_NO:316
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0349_Item_00()
  Self.SetObjectiveFailed(125, True) ; #DEBUG_LINE_NO:325
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStage() == 350 ; #DEBUG_LINE_NO:333
    Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:334
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:335
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0358_Item_00()
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:345
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:353
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:354
  CF08_SpeechChallenge_Delgado.Start() ; #DEBUG_LINE_NO:357
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:358
EndFunction

Function Fragment_Stage_0370_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:366
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:367
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:368
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:369
  Alias_CF_AlarmBattlePrep.DisableAll(False) ; #DEBUG_LINE_NO:371
EndFunction

Function Fragment_Stage_0390_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:379
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:388
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:397
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:398
  Self.SetStage(420) ; #DEBUG_LINE_NO:399
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:407
  Alias_CF08_SysDef_Delgado.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:410
EndFunction

Function Fragment_Stage_0425_Item_00()
  CF08_SysDef_Misc.SetStage(200) ; #DEBUG_LINE_NO:419
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:427
  Self.SetObjectiveDisplayed(185, True, False) ; #DEBUG_LINE_NO:428
EndFunction

Function Fragment_Stage_0435_Item_00()
  Self.SetObjectiveCompleted(185, True) ; #DEBUG_LINE_NO:436
  Self.SetObjectiveDisplayed(188, True, False) ; #DEBUG_LINE_NO:437
EndFunction

Function Fragment_Stage_0437_Item_00()
  Self.SetObjectiveCompleted(188, True) ; #DEBUG_LINE_NO:445
  Self.SetStage(510) ; #DEBUG_LINE_NO:446
EndFunction

Function Fragment_Stage_0440_Item_00()
  Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:454
  Alias_CF08_SysDef_VossSurrenderMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:455
  Actor VossRef = Alias_CF08_SysDef_Voss.GetActorRef() ; #DEBUG_LINE_NO:456
  VossRef.SetEssential(True) ; #DEBUG_LINE_NO:457
  VossRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:458
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(440) == False ; #DEBUG_LINE_NO:468
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0495_Item_00()
  CF08_SysDef_Misc.SetStage(100) ; #DEBUG_LINE_NO:478
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.IsObjectiveDisplayed(130) == True ; #DEBUG_LINE_NO:486
    Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:487
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(140) == True ; #DEBUG_LINE_NO:489
    Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:490
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:492
  Actor KibweRef = Alias_CF08_SysDef_Ikande.GetActorRef() ; #DEBUG_LINE_NO:495
  Actor ToftRef = Alias_CF08_SysDef_Toft.GetActorRef() ; #DEBUG_LINE_NO:496
  KibweRef.MoveTo(Alias_CF08_Kibwe_EndMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:498
  KibweRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:499
  ToftRef.MoveTo(Alias_CF08_Toft_EndMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:500
  ToftRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:501
  CF08_SysDef_Misc.SetStage(50) ; #DEBUG_LINE_NO:503
  Alias_CF_AlarmBattlePrep.DisableAll(False) ; #DEBUG_LINE_NO:505
  Alias_AlarmStation.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:506
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:514
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:515
  Alias_CF_AlarmBattlePrep.DisableAll(False) ; #DEBUG_LINE_NO:516
EndFunction

Function Fragment_Stage_1000_Item_00()
  RAD02.SetStage(700) ; #DEBUG_LINE_NO:525
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:527
  CF08_SpeechChallenge_Delgado.Stop() ; #DEBUG_LINE_NO:530
  Game.GetPlayer().SetValue(CF08_SysDefComplete_AV, 1.0) ; #DEBUG_LINE_NO:533
  CF08_PlayerRoomDoorRef.Lock(False, False, True) ; #DEBUG_LINE_NO:536
  MQ305_CF_SysDefEnding.SetValue(1.0) ; #DEBUG_LINE_NO:539
  CF08_SysDef_Misc.SetStage(200) ; #DEBUG_LINE_NO:542
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:545
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:546
  Int I = 0 ; #DEBUG_LINE_NO:547
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:548
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:549
    I += 1 ; #DEBUG_LINE_NO:550
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_CrimsonFleet.Send(None) ; #DEBUG_LINE_NO:552
  SE_Player_ZW11_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:555
  SE_Player_ZW12_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:556
  Game.AddAchievement(22) ; #DEBUG_LINE_NO:559
  Self.Stop() ; #DEBUG_LINE_NO:560
EndFunction
