ScriptName Fragments:Quests:QF_MQ201B_001B41D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ201B_Eye_EnableMarker Auto Const mandatory
Scene Property MQ201B_01_SamScene Auto Const mandatory
ReferenceAlias Property Alias_WelderTrigger Auto Const mandatory
Scene Property MQ201B_01_BarrettScene Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
Message Property MQ201B_BoxMSGSuccess Auto Const mandatory
Message Property MQ201B_BoxMSGFail Auto Const mandatory
Scene Property MQ201B_02a_AndrejaScene_Success Auto Const mandatory
Scene Property MQ201B_02b_AndrejaScene_Fail Auto Const mandatory
Scene Property MQ201B_01_SarahScene Auto Const mandatory
Scene Property MQ201B_02a_SarahScene_Success Auto Const mandatory
Scene Property MQ201B_02b_SarahScene_Fail Auto Const mandatory
Message Property MQ201B_WrenchMSGFail Auto Const mandatory
Message Property MQ201B_WrenchMSGSuccess Auto Const mandatory
ReferenceAlias Property Alias_BoxTrigger Auto Const mandatory
ReferenceAlias Property Alias_Computer Auto Const mandatory
Scene Property MQ201B_02a_BarrettScene_Success Auto Const mandatory
Scene Property MQ201B_02b_BarrettScene_Fail Auto Const mandatory
Scene Property MQ201B_01_AndrejaScene Auto Const mandatory
Message Property MQ201B_WelderingMSGSuccess Auto Const mandatory
Scene Property MQ201B_02a_SamScene_Success Auto Const mandatory
Message Property MQ201B_WelderingMSGFail Auto Const mandatory
Scene Property MQ201B_02b_SamScene_Fail Auto Const mandatory
ReferenceAlias Property Alias_WrenchTrigger Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const
ObjectReference Property MQ201B_Marker_Andreja Auto Const mandatory
ObjectReference Property MQ201BMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BMarker_Cora Auto Const mandatory
ObjectReference Property MQ201B_Marker_Sarah Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Perk Property Scanning Auto Const mandatory
Perk Property StarshipEngineering Auto Const mandatory
ObjectReference Property EyeVladimirMarker Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const
GlobalVariable Property MQ_CompanionAtLodge Auto Const mandatory
ReferenceAlias Property Alias_ResearchBench Auto Const mandatory
Message Property MQ201B_ResearchMSGSuccess Auto Const mandatory
Message Property MQ201B_ResearchMSGFail Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const mandatory
ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const mandatory
ReferenceAlias Property Alias_MQ00_CompanionAtEye Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const
Quest Property SQ_Crew Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const
Quest Property COM_Quest_Andreja_Commitment Auto Const mandatory
Quest Property COM_Quest_Barrett_Commitment Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Commitment Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_ScannerRepair Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_Welding Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ201_TextBox_WrenchSparks Auto Const mandatory
Quest Property COM_Quest_Barrett_Q01 Auto Const mandatory
Quest Property COM_Quest_Andreja_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
Quest Property COM_Quest_Barrett_Q02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ101.CompleteQuest() ; #DEBUG_LINE_NO:10
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:11
  MQ104B.CompleteQuest() ; #DEBUG_LINE_NO:12
  Game.GetPlayer().AddPerk(StarshipEngineering, False) ; #DEBUG_LINE_NO:14
  Game.GetPlayer().AddPerk(Scanning, False) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
  Alias_Vladimir.GetActorRef().MoveTo(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:21
  MQ201.SetStage(120) ; #DEBUG_LINE_NO:23
  MQ201.SetStage(1000) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  mq201bscript kmyQuest = __temp as mq201bscript ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:36
  MQ201B_Eye_EnableMarker.Enable(False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetCompanionsAtRisk() ; #DEBUG_LINE_NO:40
  kmyQuest.SetCompanionsHomeLink() ; #DEBUG_LINE_NO:43
  MQ404.Start() ; #DEBUG_LINE_NO:46
  Self.SetActive(True) ; #DEBUG_LINE_NO:48
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:50
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:51
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:52
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:53
  (SQ_Companions as sq_companionsscript).SetRoleInactive(AndrejaREF, False, True, False) ; #DEBUG_LINE_NO:56
  (SQ_Companions as sq_companionsscript).SetRoleInactive(BarrettREF, False, True, False) ; #DEBUG_LINE_NO:57
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SamCoeREF, False, True, False) ; #DEBUG_LINE_NO:58
  (SQ_Companions as sq_companionsscript).SetRoleInactive(SarahMorganREF, False, True, False) ; #DEBUG_LINE_NO:59
  (SQ_Crew as sq_crewscript).SetRoleInactive(AndrejaREF, False, True, False) ; #DEBUG_LINE_NO:61
  (SQ_Crew as sq_crewscript).SetRoleInactive(BarrettREF, False, True, False) ; #DEBUG_LINE_NO:62
  (SQ_Crew as sq_crewscript).SetRoleInactive(SamCoeREF, False, True, False) ; #DEBUG_LINE_NO:63
  (SQ_Crew as sq_crewscript).SetRoleInactive(SarahMorganREF, False, True, False) ; #DEBUG_LINE_NO:64
  DismissedCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:66
  DismissedCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:67
  DismissedCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:68
  DismissedCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:69
  DisembarkingCrew.RemoveRef(AndrejaREF as ObjectReference) ; #DEBUG_LINE_NO:70
  DisembarkingCrew.RemoveRef(BarrettREF as ObjectReference) ; #DEBUG_LINE_NO:71
  DisembarkingCrew.RemoveRef(SamCoeREF as ObjectReference) ; #DEBUG_LINE_NO:72
  DisembarkingCrew.RemoveRef(SarahMorganREF as ObjectReference) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:82
  Actor CompanionREF = Alias_Companion.GetActorRef() ; #DEBUG_LINE_NO:85
  (SQ_Companions as sq_companionsscript).SetRoleInactive(Alias_Companion.GetActorRef(), True, False, True) ; #DEBUG_LINE_NO:86
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:87
  DismissedCrew.RemoveRef(CompanionREF as ObjectReference) ; #DEBUG_LINE_NO:88
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:90
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:91
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:92
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:93
  Actor CoraCoeREF = Alias_CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:94
  Actor VladimirREF = Alias_Vladimir.GetActorRef() ; #DEBUG_LINE_NO:95
  If !AndrejaREF.IsInLocation(MQ201B_Marker_Andreja.GetCurrentLocation()) ; #DEBUG_LINE_NO:98
    AndrejaREF.MoveTo(MQ201B_Marker_Andreja, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  If !BarrettREF.IsInLocation(MQ201BMarker_Barrett.GetCurrentLocation()) ; #DEBUG_LINE_NO:102
    BarrettREF.MoveTo(MQ201BMarker_Barrett, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  If !SamCoeREF.IsInLocation(MQ201BMarker_Sam.GetCurrentLocation()) ; #DEBUG_LINE_NO:106
    SamCoeREF.MoveTo(MQ201BMarker_Sam, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  If !CoraCoeREF.IsInLocation(MQ201BMarker_Cora.GetCurrentLocation()) ; #DEBUG_LINE_NO:110
    CoraCoeREF.MoveTo(MQ201BMarker_Cora, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  If !SarahMorganREF.IsInLocation(MQ201B_Marker_Sarah.GetCurrentLocation()) ; #DEBUG_LINE_NO:114
    SarahMorganREF.MoveTo(MQ201B_Marker_Sarah, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
  If !VladimirREF.IsInLocation(EyeVladimirMarker.GetCurrentLocation()) ; #DEBUG_LINE_NO:118
    VladimirREF.MoveTo(EyeVladimirMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0022_Item_00()
  MQ201B_01_AndrejaScene.Start() ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_BoxTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:137
  WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:138
  MQ201B_BoxMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:140
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:141
  MQ201B_02a_AndrejaScene_Success.Start() ; #DEBUG_LINE_NO:142
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0030_Item_01()
  Alias_BoxTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:152
  WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:153
  MQ201B_BoxMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:155
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:156
  MQ201B_02b_AndrejaScene_Fail.Start() ; #DEBUG_LINE_NO:157
  MQ201BSparksEnableMarker_Andreja.Enable(False) ; #DEBUG_LINE_NO:159
  Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:163
  Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:164
  Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:165
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:167
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:168
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:169
  Self.SetStage(100) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0042_Item_00()
  MQ201B_01_BarrettScene.Start() ; #DEBUG_LINE_NO:179
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ201B_02a_BarrettScene_Success.Start() ; #DEBUG_LINE_NO:188
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0050_Item_01()
  MQ201B_02b_BarrettScene_Fail.Start() ; #DEBUG_LINE_NO:198
  MQ201BSparksEnableMarker_Barrett.Enable(False) ; #DEBUG_LINE_NO:200
  Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:203
  Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:205
  Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:206
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:208
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:210
  Self.SetStage(100) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0052_Item_00()
  MQ201B_01_SamScene.Start() ; #DEBUG_LINE_NO:220
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_WelderTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:229
  WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:230
  MQ201B_WelderingMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:231
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:232
  MQ201B_02a_SamScene_Success.Start() ; #DEBUG_LINE_NO:233
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:234
EndFunction

Function Fragment_Stage_0060_Item_01()
  Alias_WelderTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:242
  WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:243
  MQ201B_WelderingMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:244
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:245
  MQ201B_02b_SamScene_Fail.Start() ; #DEBUG_LINE_NO:246
  MQ201BSparksEnableMarker_Sam.Enable(False) ; #DEBUG_LINE_NO:248
  Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:251
  Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:252
  Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:253
  Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:254
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:256
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:257
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:258
  Self.SetStage(100) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_0062_Item_00()
  MQ201B_01_SarahScene.Start() ; #DEBUG_LINE_NO:267
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:268
EndFunction

Function Fragment_Stage_0070_Item_00()
  Alias_WrenchTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:276
  WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:277
  MQ201B_WrenchMSGSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:278
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:279
  MQ201B_02a_SarahScene_Success.Start() ; #DEBUG_LINE_NO:280
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_0070_Item_01()
  Alias_WrenchTrigger.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:289
  WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:290
  MQ201B_WrenchMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:291
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:292
  MQ201B_02b_SarahScene_Fail.Start() ; #DEBUG_LINE_NO:293
  MQ201BSparksEnableMarker_Sarah.Enable(False) ; #DEBUG_LINE_NO:295
  Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:298
  Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:299
  Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:300
  Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:301
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:303
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:304
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:305
  Self.SetStage(100) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ00_CompanionAtEye.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:322
  mq201bscript kmyQuest = __temp as mq201bscript ; #DEBUG_LINE_NO:323
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:326
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:328
  MQ202.SetStage(10) ; #DEBUG_LINE_NO:330
  kmyQuest.ResetCompanionsHomeLink() ; #DEBUG_LINE_NO:333
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:336
  Actor BarrettREF = Alias_Barrett.GetActorRef() ; #DEBUG_LINE_NO:337
  Actor SamCoeREF = Alias_SamCoe.GetActorRef() ; #DEBUG_LINE_NO:338
  Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:339
  If COM_Quest_Andreja_Commitment.IsRunning() || COM_Quest_Andreja_Q01.IsRunning() ; #DEBUG_LINE_NO:341
    (SQ_Companions as sq_companionsscript).SetRoleActive(AndrejaREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:342
    AndrejaREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:343
  ElseIf COM_Quest_Barrett_Commitment.IsRunning() || COM_Quest_Barrett_Q01.IsRunning() || COM_Quest_Barrett_Q02.IsRunning() ; #DEBUG_LINE_NO:344
    (SQ_Companions as sq_companionsscript).SetRoleActive(BarrettREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:345
    BarrettREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:346
  ElseIf COM_Quest_SamCoe_Commitment.IsRunning() || COM_Quest_SamCoe_Q01.IsRunning() ; #DEBUG_LINE_NO:347
    (SQ_Companions as sq_companionsscript).SetRoleActive(SamCoeREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:348
    SamCoeREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:349
  ElseIf COM_Quest_SarahMorgan_Commitment.IsRunning() || COM_Quest_SarahMorgan_Q01.IsRunning() ; #DEBUG_LINE_NO:350
    (SQ_Companions as sq_companionsscript).SetRoleActive(SarahMorganREF, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:351
    SarahMorganREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:352
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:363
  mq201bscript kmyQuest = __temp as mq201bscript ; #DEBUG_LINE_NO:364
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:367
  kmyQuest.ResetCompanionsHomeLink() ; #DEBUG_LINE_NO:370
  Self.Stop() ; #DEBUG_LINE_NO:372
EndFunction
