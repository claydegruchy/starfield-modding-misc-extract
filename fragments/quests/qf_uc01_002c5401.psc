ScriptName Fragments:Quests:QF_UC01_002C5401 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC01_200_RegistrationCompleteScene Auto Const
ReferenceAlias Property Alias_CurrentOrientationTarget Auto Const mandatory
ReferenceAlias Property Alias_OrientTarget01 Auto Const mandatory
Scene Property UC01_300_ProceedToExam Auto Const mandatory
GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const mandatory
ReferenceAlias Property Alias_MainExamDoor Auto Const mandatory
ObjectReference Property UC01_OrientDebugMarker Auto Const mandatory
ObjectReference Property DebugMarkerStage100 Auto Const
Scene Property UC01_100_TualaIntroScene Auto Const mandatory
ObjectReference Property PrePilotExamDebugMarker Auto Const
ReferenceAlias Property Alias_PilotsExamDoor Auto Const mandatory
Scene Property UC01_410_PilotsEntranceScene Auto Const mandatory
ReferenceAlias Property Alias_PilotExamSeat Auto Const mandatory
Scene Property UC01_600_ReturntoTuala Auto Const mandatory
ReferenceAlias Property Alias_QuickExitToMAST Auto Const mandatory
ReferenceAlias Property Alias_FromPilotExamDoor Auto Const mandatory
LocationAlias Property Alias_PlayerBackgroundLoc Auto Const mandatory
Location Property UC01_UnknownLocation Auto Const mandatory
LeveledItem Property LL_Grendel_Simple Auto Const mandatory
Ammo Property Ammo777mm Auto Const mandatory
Weapon Property FragGrenade Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Message Property UC01_DEBUG_StealthFixes Auto Const mandatory
GlobalVariable Property UC01_Adaptability_FoundASecretPath Auto Const mandatory
GlobalVariable Property UC01_ResultGlobal Auto Const mandatory
ReferenceAlias Property Alias_Tuala Auto Const mandatory
Message Property UC01_DEBUG_BeaWalkNotWorking Auto Const mandatory
GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const mandatory
Quest Property UC02 Auto Const mandatory
ObjectReference Property DebugMarker07 Auto Const
Message Property UC01_DEBUG_ApproachSectorA Auto Const mandatory
Message Property UC01_DEBUG_TheStoryThusFar Auto Const mandatory
Message Property UC01_DEBUG_Murals Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Body_LightArmored Auto Const mandatory
Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const mandatory
Faction Property PlayerVanguardFaction Auto Const mandatory
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
Perk Property FactionUnitedColoniesVanguardPerk Auto Const mandatory
ReferenceAlias Property Alias_PilotExamEntranceTrigger Auto Const mandatory
Message Property UC01_DEBUG_DontBug Auto Const mandatory
Quest Property UC_Tuala_Misc Auto Const mandatory
Quest Property UC_NA_CL_VanguardScene Auto Const mandatory
Key Property VanguardCourseElevatorKey Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0355_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0395_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01_DEBUG_TheStoryThusFar.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:7
  Self.SetStage(100) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(DebugMarkerStage100, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  UC01_100_TualaIntroScene.Start() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:18
  Self.SetStage(200) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().MoveTo(UC01_OrientDebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:28
  Self.SetStage(200) ; #DEBUG_LINE_NO:29
  Self.SetStage(300) ; #DEBUG_LINE_NO:30
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:39
  Self.SetStage(200) ; #DEBUG_LINE_NO:40
  Self.SetStage(300) ; #DEBUG_LINE_NO:41
  Game.GetPlayer().MoveTo(PrePilotExamDebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:50
  Self.SetStage(410) ; #DEBUG_LINE_NO:51
  UC01_410_PilotsEntranceScene.Stop() ; #DEBUG_LINE_NO:52
  Self.SetStage(450) ; #DEBUG_LINE_NO:53
  Alias_PilotExamSeat.GetRef().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:62
  UC01_ShipSim_PlayerKillCount.SetValue(3.0) ; #DEBUG_LINE_NO:63
  Self.SetStage(600) ; #DEBUG_LINE_NO:64
  Game.GetPlayer().MoveTo(DebugMarkerStage100, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:73
  Self.SetStage(200) ; #DEBUG_LINE_NO:74
  Self.SetStage(310) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().MoveTo(DebugMarker07, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0011_Item_00()
  UC01_ShipSimulatorHelperQuest.SetStage(1000) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:93
  If UC_Tuala_Misc.GetStageDone(100) ; #DEBUG_LINE_NO:96
    UC_Tuala_Misc.SetStage(1000) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_CurrentOrientationTarget.ForceRefTo(Alias_OrientTarget01.GetRef()) ; #DEBUG_LINE_NO:106
  UC01_200_RegistrationCompleteScene.Start() ; #DEBUG_LINE_NO:107
  Game.GetPlayer().AddItem(VanguardCourseElevatorKey as Form, 1, True) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayedAtTop(300) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0299_Item_00()
  (Alias_QuickExitToMAST.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:119
  If !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:120
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:138
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:142
    Self.SetObjectiveDisplayed(301, True, False) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0302_Item_00()
  Self.SetObjectiveCompleted(301, True) ; #DEBUG_LINE_NO:153
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:155
  PlayREF.AddItem(LL_Grendel_Simple as Form, 1, False) ; #DEBUG_LINE_NO:157
  PlayREF.AddItem(Ammo777mm as Form, 100, False) ; #DEBUG_LINE_NO:158
  PlayREF.AddItem(FragGrenade as Form, 5, False) ; #DEBUG_LINE_NO:159
  PlayREF.AddItem(Aid_MedPack as Form, 3, False) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0303_Item_00()
  If Self.GetStageDone(302) ; #DEBUG_LINE_NO:168
    Self.SetStage(304) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0304_Item_00()
  Self.SetObjectiveCompleted(301, True) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0305_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:186
    Self.SetObjectiveDisplayed(315, True, False) ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0306_Item_00()
  Self.SetObjectiveCompleted(315, True) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:206
  Self.UpdateCurrentInstanceGlobal(UC01_SectorReleaseCountActivated) ; #DEBUG_LINE_NO:207
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0325_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:216
    UC01_Adaptability_FoundASecretPath.Mod(1.0) ; #DEBUG_LINE_NO:217
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0331_Item_00()
  UC01_DEBUG_StealthFixes.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0345_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:235
    UC01_Adaptability_FoundASecretPath.Mod(1.0) ; #DEBUG_LINE_NO:236
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0349_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:245
    Self.SetObjectiveFailed(340, True) ; #DEBUG_LINE_NO:246
    Self.SetObjectiveFailed(360, True) ; #DEBUG_LINE_NO:247
    Self.SetObjectiveFailed(370, True) ; #DEBUG_LINE_NO:248
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(348) ; #DEBUG_LINE_NO:250
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0360_Item_00()
  If !Self.GetStageDone(370) && !Self.GetStageDone(400) ; #DEBUG_LINE_NO:269
    Self.SetObjectiveDisplayed(360, True, False) ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0362_Item_00()
  If Self.GetStageDone(364) && Self.GetStageDone(366) ; #DEBUG_LINE_NO:279
    Self.SetStage(370) ; #DEBUG_LINE_NO:280
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0364_Item_00()
  If Self.GetStageDone(362) && Self.GetStageDone(366) ; #DEBUG_LINE_NO:289
    Self.SetStage(370) ; #DEBUG_LINE_NO:290
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0366_Item_00()
  If Self.GetStageDone(364) && Self.GetStageDone(362) ; #DEBUG_LINE_NO:299
    Self.SetStage(370) ; #DEBUG_LINE_NO:300
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(360) ; #DEBUG_LINE_NO:309
    Self.SetObjectiveCompleted(360, True) ; #DEBUG_LINE_NO:310
    Self.SetObjectiveDisplayed(370, True, False) ; #DEBUG_LINE_NO:311
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0371_Item_00()
  Self.SetObjectiveCompleted(370, True) ; #DEBUG_LINE_NO:320
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:330
    UC01_Adaptability_FoundASecretPath.Mod(1.0) ; #DEBUG_LINE_NO:331
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(401) ; #DEBUG_LINE_NO:355
  Alias_PilotsExamDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:357
  Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:359
  Self.SetObjectiveFailed(310, True) ; #DEBUG_LINE_NO:360
  If !Self.IsObjectiveCompleted(301) ; #DEBUG_LINE_NO:361
    Self.SetObjectiveDisplayed(301, False, False) ; #DEBUG_LINE_NO:362
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(360) ; #DEBUG_LINE_NO:364
    Self.SetObjectiveDisplayed(360, False, False) ; #DEBUG_LINE_NO:365
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(370) ; #DEBUG_LINE_NO:367
    Self.SetObjectiveDisplayed(370, False, False) ; #DEBUG_LINE_NO:368
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:370
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(401) ; #DEBUG_LINE_NO:385
  Alias_PilotsExamDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:387
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:389
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:390
  If !Self.IsObjectiveCompleted(301) ; #DEBUG_LINE_NO:391
    Self.SetObjectiveDisplayed(301, False, False) ; #DEBUG_LINE_NO:392
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(360) ; #DEBUG_LINE_NO:394
    Self.SetObjectiveDisplayed(360, False, False) ; #DEBUG_LINE_NO:395
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(370) ; #DEBUG_LINE_NO:397
    Self.SetObjectiveDisplayed(370, False, False) ; #DEBUG_LINE_NO:398
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:400
EndFunction

Function Fragment_Stage_0410_Item_00()
  If !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:415
    Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:416
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:419
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:420
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:421
  Alias_PilotExamSeat.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:423
  UC01_410_PilotsEntranceScene.Start() ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0425_Item_00()
  Self.SetStage(420) ; #DEBUG_LINE_NO:432
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_0599_Item_00()
  UC01_600_ReturntoTuala.Start() ; #DEBUG_LINE_NO:448
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !UC_NA_CL_VanguardScene.GetStageDone(1000) ; #DEBUG_LINE_NO:457
    UC_NA_CL_VanguardScene.SetStage(999) ; #DEBUG_LINE_NO:458
  EndIf ; #DEBUG_LINE_NO:
  Alias_FromPilotExamDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:461
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:462
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:463
EndFunction

Function Fragment_Stage_0641_Item_00()
  UC01_ResultGlobal.SetValue(5.0) ; #DEBUG_LINE_NO:471
EndFunction

Function Fragment_Stage_0642_Item_00()
  UC01_ResultGlobal.SetValue(4.0) ; #DEBUG_LINE_NO:479
EndFunction

Function Fragment_Stage_0643_Item_00()
  UC01_ResultGlobal.SetValue(3.0) ; #DEBUG_LINE_NO:487
EndFunction

Function Fragment_Stage_0644_Item_00()
  UC01_ResultGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:495
EndFunction

Function Fragment_Stage_0645_Item_00()
  UC01_ResultGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:503
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:511
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:512
  Alias_Tuala.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:514
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:522
  Self.SetObjectiveDisplayed(660, True, False) ; #DEBUG_LINE_NO:523
EndFunction

Function Fragment_Stage_0690_Item_00()
  Alias_Tuala.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:531
EndFunction

Function Fragment_Stage_0694_Item_00()
  Alias_Tuala.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:539
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:547
  PlayACT.AddToFaction(PlayerVanguardFaction) ; #DEBUG_LINE_NO:548
  PlayACT.AddPerk(FactionUnitedColoniesVanguardPerk, False) ; #DEBUG_LINE_NO:549
  UC02.Start() ; #DEBUG_LINE_NO:551
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:552
  Self.Stop() ; #DEBUG_LINE_NO:553
EndFunction
