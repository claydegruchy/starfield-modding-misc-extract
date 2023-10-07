ScriptName Fragments:Quests:QF_RI02_002AAC9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BooneMorgan Auto Const mandatory
ReferenceAlias Property Alias_DossierZolaAdisa Auto Const mandatory
ReferenceAlias Property Alias_DossierArthurCruz Auto Const mandatory
ReferenceAlias Property Alias_BusinessSuit Auto Const mandatory
ReferenceAlias Property Alias_NinaRoomKeyBoone Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationReplacement Auto Const mandatory
Key Property RI02_NinaRoomKey Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
ReferenceAlias Property Alias_NinaMarker Auto Const mandatory
ReferenceAlias Property Alias_AngeloMarker Auto Const mandatory
ReferenceAlias Property Alias_NinaHart Auto Const mandatory
ReferenceAlias Property Alias_AngeloSoldani Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
GlobalVariable Property RI02_ZolaAdisaDead Auto Const mandatory
GlobalVariable Property RI02_ArthurCruzDead Auto Const mandatory
GlobalVariable Property RI02_NinaHartDead Auto Const mandatory
GlobalVariable Property RI02_AngeloSoldaniDead Auto Const mandatory
ReferenceAlias Property Alias_RyujinTowerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_AstralLoungeStartMarker Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Scene Property RI02_500_NinaAngeloScene Auto Const mandatory
GlobalVariable Property RI02_NinaHartDrunk Auto Const mandatory
GlobalVariable Property RI02_FinalResult Auto Const mandatory
GlobalVariable Property RI02_PlayerMetNina Auto Const mandatory
GlobalVariable Property RI02_PlayerMetAngelo Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property RI_LaneUnlockTLs Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property LC051InfinityLTDFaction Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationActivator Auto Const mandatory
MiscObject Property RI02_NinaPresentation Auto Const mandatory
ReferenceAlias Property Alias_NinaPresentationStatic Auto Const mandatory
ReferenceAlias Property Alias_ZolaAdisa Auto Const mandatory
ReferenceAlias Property Alias_ArthurCruz Auto Const mandatory
ReferenceAlias Property Alias_InfinityLTDMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:7
  LC044.SetStage(400) ; #DEBUG_LINE_NO:8
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(10) ; #DEBUG_LINE_NO:10
  Self.SetStage(100) ; #DEBUG_LINE_NO:11
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:13
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0001_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:23
  LC044.SetStage(400) ; #DEBUG_LINE_NO:24
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:25
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:26
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:27
  RIR03.SetStage(300) ; #DEBUG_LINE_NO:28
  Self.SetStage(10) ; #DEBUG_LINE_NO:29
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:31
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:41
  LC044.SetStage(400) ; #DEBUG_LINE_NO:42
  Self.SetStage(10) ; #DEBUG_LINE_NO:43
  Self.SetStage(100) ; #DEBUG_LINE_NO:44
  Self.SetStage(150) ; #DEBUG_LINE_NO:45
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:47
  PlayerRef.MoveTo(Alias_AstralLoungeStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(350) ; #DEBUG_LINE_NO:65
  LC044.SetStage(400) ; #DEBUG_LINE_NO:66
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:67
  Self.SetStage(600) ; #DEBUG_LINE_NO:68
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:70
  PlayerRef.MoveTo(Alias_RyujinTowerStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:71
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0010_Item_00()
  RI_LaneUnlockTLs.SetValue(1.0) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:88
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:89
  RIR03.Stop() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0110_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 100, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:106
  Self.SetStage(200) ; #DEBUG_LINE_NO:107
  Self.SetStage(300) ; #DEBUG_LINE_NO:108
  Self.SetStage(400) ; #DEBUG_LINE_NO:109
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:111
  MyPlayer.AddItem(Alias_NinaPresentationReplacement.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:113
  MyPlayer.AddItem(Alias_DossierZolaAdisa.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:114
  MyPlayer.AddItem(Alias_DossierArthurCruz.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:115
  MyPlayer.AddItem(Alias_BusinessSuit.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:116
  Alias_NinaHart.GetActorRef().MoveTo(Alias_NinaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:119
  Alias_AngeloSoldani.GetActorRef().MoveTo(Alias_AngeloMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:120
  Alias_ZolaAdisa.TryToEnable() ; #DEBUG_LINE_NO:121
  Alias_ArthurCruz.TryToEnable() ; #DEBUG_LINE_NO:122
  Alias_NinaPresentationActivator.GetRef().Enable(False) ; #DEBUG_LINE_NO:123
  Alias_AngeloSoldani.GetActorRef().SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:126
  Alias_NinaHart.GetActorRef().SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayedAtTop(200) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(250) ; #DEBUG_LINE_NO:143
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:144
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(295) ; #DEBUG_LINE_NO:148
  If Self.GetStageDone(395) ; #DEBUG_LINE_NO:150
    Self.SetStage(500) ; #DEBUG_LINE_NO:151
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetStage(295) ; #DEBUG_LINE_NO:160
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:162
    Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:163
    If Self.GetStageDone(395) ; #DEBUG_LINE_NO:164
      Self.SetStage(500) ; #DEBUG_LINE_NO:165
      If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:166
        Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:167
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  RI02_ZolaAdisaDead.SetValue(1.0) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayedAtTop(300) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0390_Item_00()
  If Self.GetStageDone(350) ; #DEBUG_LINE_NO:188
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:189
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(395) ; #DEBUG_LINE_NO:193
  If Self.GetStageDone(295) ; #DEBUG_LINE_NO:195
    Self.SetStage(500) ; #DEBUG_LINE_NO:196
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0399_Item_00()
  Self.SetStage(395) ; #DEBUG_LINE_NO:205
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:207
    Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:208
    If Self.GetStageDone(295) ; #DEBUG_LINE_NO:209
      Self.SetStage(500) ; #DEBUG_LINE_NO:210
      If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:211
        Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:212
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  RI02_ArthurCruzDead.SetValue(1.0) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420) ; #DEBUG_LINE_NO:233
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:234
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410) ; #DEBUG_LINE_NO:243
    Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:244
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400) ; #DEBUG_LINE_NO:253
    Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:254
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(575) ; #DEBUG_LINE_NO:257
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:258
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(600) ; #DEBUG_LINE_NO:260
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(250) && Self.GetStageDone(350) ; #DEBUG_LINE_NO:263
    RI02_FinalResult.SetValue(1.0) ; #DEBUG_LINE_NO:264
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0510_Item_00()
  RI02_500_NinaAngeloScene.Start() ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:281
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:282
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0530_Item_00()
  RI02_NinaHartDrunk.SetValue(1.0) ; #DEBUG_LINE_NO:291
  RI02_PlayerMetNina.SetValue(1.0) ; #DEBUG_LINE_NO:293
  Alias_NinaHart.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:295
EndFunction

Function Fragment_Stage_0535_Item_00()
  RI02_NinaHartDrunk.SetValue(0.0) ; #DEBUG_LINE_NO:303
  RI02_PlayerMetNina.SetValue(1.0) ; #DEBUG_LINE_NO:304
  Alias_NinaHart.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_0540_Item_00()
  RI02_PlayerMetAngelo.SetValue(1.0) ; #DEBUG_LINE_NO:313
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveDisplayedAtTop(500) ; #DEBUG_LINE_NO:321
  Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_0560_Item_00()
  Game.GetPlayer().AddItem(Alias_NinaRoomKeyBoone.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_0566_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:338
EndFunction

Function Fragment_Stage_0567_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Medium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:346
EndFunction

Function Fragment_Stage_0568_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:354
EndFunction

Function Fragment_Stage_0570_Item_00()
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:362
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:363
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0575_Item_00()
  If Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:372
    Self.SetStage(600) ; #DEBUG_LINE_NO:373
  EndIf ; #DEBUG_LINE_NO:
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:376
  PlayerRef.RemoveItem(Alias_NinaPresentationReplacement.GetRef() as Form, 99, False, None) ; #DEBUG_LINE_NO:377
  PlayerRef.AddItem(RI02_NinaPresentation as Form, 1, False) ; #DEBUG_LINE_NO:378
  Alias_NinaPresentationActivator.GetRef().Disable(False) ; #DEBUG_LINE_NO:379
  Alias_NinaPresentationStatic.GetRef().Enable(False) ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_0585_Item_00()
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:388
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:389
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0599_Item_00()
  RI02_NinaHartDead.SetValue(1.0) ; #DEBUG_LINE_NO:398
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:406
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:407
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:409
    Self.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:410
  EndIf ; #DEBUG_LINE_NO:
  RIR04.Start() ; #DEBUG_LINE_NO:413
EndFunction

Function Fragment_Stage_0699_Item_00()
  RI02_AngeloSoldaniDead.SetValue(1.0) ; #DEBUG_LINE_NO:421
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:429
  Actor AngeloRef = Alias_AngeloSoldani.GetActorRef() ; #DEBUG_LINE_NO:435
  Actor NinaRef = Alias_NinaHart.GetActorRef() ; #DEBUG_LINE_NO:436
  AngeloRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:438
  AngeloRef.SetCrimeFaction(LC051InfinityLTDFaction) ; #DEBUG_LINE_NO:439
  AngeloRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:440
  AngeloRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:441
  NinaRef.RemoveFromFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:442
  NinaRef.SetCrimeFaction(LC051InfinityLTDFaction) ; #DEBUG_LINE_NO:443
  NinaRef.MoveTo(Alias_InfinityLTDMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:444
  NinaRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:445
  Alias_NinaPresentationStatic.GetRef().Disable(False) ; #DEBUG_LINE_NO:448
  Alias_ZolaAdisa.GetRef().Disable(False) ; #DEBUG_LINE_NO:449
  Alias_ArthurCruz.GetRef().Disable(False) ; #DEBUG_LINE_NO:450
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:458
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:459
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:462
EndFunction
