ScriptName Fragments:Quests:QF_MQ206B_002583F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ206B_001_IntroScene Auto Const mandatory
Scene Property MQ206B_003_KeeperAquilus Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ReferenceAlias Property Alias_MatteoKhatri Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
ObjectReference Property MQ206B_AquilusTravelMarker01 Auto Const mandatory
ObjectReference Property MQ206B_MatteoTravelMarker01 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
Scene Property MQ206B_002_AquilusMatteoScene Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
Scene Property MQ206B_004b_Matteo Auto Const mandatory
ObjectReference Property MQ206B_MatteoMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Mirza Auto Const mandatory
Quest Property MQ207 Auto Const mandatory
ReferenceAlias Property Alias_PilgrimDoor Auto Const mandatory
ObjectReference Property MQ206B_Quickstart1 Auto Const mandatory
ObjectReference Property LC134Start Auto Const mandatory
Perk Property TraitRaisedUniversal Auto Const mandatory
Perk Property TraitRaisedEnlightened Auto Const mandatory
Perk Property TraitSerpentsEmbrace Auto Const mandatory
Quest Property City_NA_Aquilus01 Auto Const mandatory
LeveledItem Property MQ206B_UniversalGift Auto Const mandatory
LeveledItem Property MQ206B_EnlightenedGift Auto Const mandatory
LeveledItem Property MQ206B_VaruunGift Auto Const mandatory
ObjectReference Property MQ206B_Hyla_PlayerMarker Auto Const mandatory
ReferenceAlias Property Alias_HylaBoss Auto Const mandatory
ObjectReference Property MQ206BPuzzleEnableMarker Auto Const mandatory
Scene Property MQ206B_004_Inside Auto Const mandatory
ObjectReference Property ScorpiusPuzzleMapMarkerREF Auto Const mandatory
ObjectReference Property PilgrimsRestMapMarkerREF Auto Const mandatory
Quest Property MQ204_NA_StateChangeHandler Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:9
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:10
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:11
  MQ204.SetStage(620) ; #DEBUG_LINE_NO:12
  PlayerREF.AddPerk(TraitRaisedUniversal, False) ; #DEBUG_LINE_NO:14
  PlayerREF.AddPerk(TraitRaisedEnlightened, False) ; #DEBUG_LINE_NO:15
  PlayerREF.AddPerk(TraitSerpentsEmbrace, False) ; #DEBUG_LINE_NO:16
  PlayerREF.moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:26
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:27
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:28
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:29
  Self.SetStage(100) ; #DEBUG_LINE_NO:31
  Self.SetStage(130) ; #DEBUG_LINE_NO:32
  Self.SetStage(140) ; #DEBUG_LINE_NO:33
  Self.SetStage(200) ; #DEBUG_LINE_NO:34
  PlayerREF.AddPerk(TraitRaisedUniversal, False) ; #DEBUG_LINE_NO:36
  PlayerREF.AddPerk(TraitRaisedEnlightened, False) ; #DEBUG_LINE_NO:37
  PlayerREF.AddPerk(TraitSerpentsEmbrace, False) ; #DEBUG_LINE_NO:38
  PlayerREF.moveto(MQ206B_Quickstart1, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:48
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:49
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:50
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:51
  Self.SetStage(500) ; #DEBUG_LINE_NO:53
  Self.SetStage(600) ; #DEBUG_LINE_NO:54
  Self.SetStage(670) ; #DEBUG_LINE_NO:55
  Self.SetStage(680) ; #DEBUG_LINE_NO:56
  Game.GetPlayer().moveto(LC134Start, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().moveto(MQ206B_Hyla_PlayerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
  Self.SetStage(700) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Mirza.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:76
  MQ206BPuzzleEnableMarker.Enable(False) ; #DEBUG_LINE_NO:79
  ScorpiusPuzzleMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:82
  PilgrimsRestMapMarkerREF.Enable(False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_MatteoKhatri.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_MatteoKhatri.GetActorRef().moveto(MQ206B_MatteoMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ204.SetStage(1000) ; #DEBUG_LINE_NO:110
  MQ204_NA_StateChangeHandler.SetStageNoWait(100) ; #DEBUG_LINE_NO:113
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:115
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef() ; #DEBUG_LINE_NO:117
  MatteoREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:118
  Self.SetActive(True) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0110_Item_00()
  City_NA_Aquilus01.SetStage(200) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:136
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:137
  Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef() ; #DEBUG_LINE_NO:139
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef() ; #DEBUG_LINE_NO:140
  KeeperAquilusREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:141
  MatteoREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:150
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:151
  Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef() ; #DEBUG_LINE_NO:153
  Actor MatteoREF = Alias_MatteoKhatri.GetActorRef() ; #DEBUG_LINE_NO:154
  KeeperAquilusREF.moveto(MQ206B_AquilusTravelMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:155
  MatteoREF.moveto(MQ206B_MatteoTravelMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0150_Item_00()
  MQ206B_004_Inside.Start() ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:172
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:173
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:174
  MQ206B_004b_Matteo.Start() ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().additem(MQ206B_UniversalGift as Form, 1, False) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0220_Item_00()
  Game.GetPlayer().additem(MQ206B_EnlightenedGift as Form, 1, False) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().additem(MQ206B_VaruunGift as Form, 1, False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:210
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:212
    Self.SetStage(500) ; #DEBUG_LINE_NO:213
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:222
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:224
    Self.SetStage(500) ; #DEBUG_LINE_NO:225
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:234
  Alias_MatteoKhatri.GetActorRef().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:245
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0655_Item_00()
  Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0660_Item_00()
  Self.SetObjectiveCompleted(74, True) ; #DEBUG_LINE_NO:262
  Self.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:263
  Self.SetObjectiveDisplayed(77, True, False) ; #DEBUG_LINE_NO:264
  ObjectReference PilgrimDoorREF = Alias_PilgrimDoor.GetRef() ; #DEBUG_LINE_NO:266
  PilgrimDoorREF.Lock(False, False, True) ; #DEBUG_LINE_NO:267
  PilgrimDoorREF.SetOpen(True) ; #DEBUG_LINE_NO:268
EndFunction

Function Fragment_Stage_0670_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:276
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:277
  Self.SetObjectiveDisplayed(72, True, False) ; #DEBUG_LINE_NO:278
EndFunction

Function Fragment_Stage_0680_Item_00()
  Self.SetObjectiveCompleted(72, True) ; #DEBUG_LINE_NO:286
  Self.SetObjectiveDisplayed(74, True, False) ; #DEBUG_LINE_NO:287
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetObjectiveCompleted(77, True) ; #DEBUG_LINE_NO:295
  Self.SetObjectiveDisplayed(79, True, False) ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(690) ; #DEBUG_LINE_NO:304
  Self.SetObjectiveCompleted(79, True) ; #DEBUG_LINE_NO:306
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:307
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_HylaBoss.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_0720_Item_00()
  Self.SetObjectiveDisplayed(80, True, True) ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:331
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:332
  MQ207.Start() ; #DEBUG_LINE_NO:335
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:344
  MQ207.Start() ; #DEBUG_LINE_NO:347
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetStage(2000) ; #DEBUG_LINE_NO:355
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:363
  MQ207.SetStage(10) ; #DEBUG_LINE_NO:364
  Self.Stop() ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_3000_Item_00()
  Alias_Mirza.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:374
EndFunction
