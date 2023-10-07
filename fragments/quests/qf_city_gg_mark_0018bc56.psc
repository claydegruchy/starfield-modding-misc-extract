ScriptName Fragments:Quests:QF_City_GG_Mark_0018BC56 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
ReferenceAlias Property Alias_CaptiveMarker Auto Const mandatory
ReferenceAlias Property Alias_Maldonado Auto Const mandatory
ReferenceAlias Property Alias_BonCaptiveAlias Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Scene Property City_GG_Mark_295_Bonifac_MalDead Auto Const mandatory
Scene Property City_GG_Mark_110_Bonifac_Attract Auto Const mandatory
Scene Property City_GG_Mark_310_Bonifac_MeetAtGG Auto Const mandatory
ReferenceAlias Property Alias_Data Auto Const mandatory
ReferenceAlias Property Alias_EdgeMarker Auto Const mandatory
ReferenceAlias Property Alias_BossContainer Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const mandatory
Scene Property City_GG_Mark_155_Bon_FindAWeapon Auto Const mandatory
Scene Property City_GG_Mark_260_MalBonifac_Intro Auto Const mandatory
Scene Property City_GG_Mark_299_Mal_PostBonDeath Auto Const mandatory
ObjectReference Property BonifacTeleportMarker Auto Const mandatory
ReferenceAlias Property Alias_CourierCorpse Auto Const mandatory
GlobalVariable Property GG_Mark_KilledBonifac Auto Const mandatory
GlobalVariable Property GG_Mark_PlayerToldHelenaBonifacDead Auto Const mandatory
ReferenceAlias Property Alias_BonifacTeleportMarker Auto Const mandatory
Quest Property City_GG_Connections Auto Const mandatory
Perk Property BackgroundBouncer Auto Const mandatory
Quest Property SQ_Followers Auto Const mandatory
ActorValue Property UC_GG_Mark_Foreknowledge_BonifacKidnappedAV Auto Const mandatory
LocationAlias Property Alias_DungeonLoc Auto Const mandatory
Keyword Property LocEncEcliptic_Exclusive Auto Const mandatory
Keyword Property LocEncCrimsonFleet_Exclusive Auto Const mandatory
ReferenceAlias Property Alias_EavesdroppingTrigger Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
RefCollectionAlias Property Alias_Corpses Auto Const mandatory
GlobalVariable Property GG_Mark_ReturnedSlate Auto Const mandatory
GlobalVariable Property GG_Mark_PlayerToldHelenaAboutMaldonado Auto Const mandatory
ReferenceAlias Property Alias_MurderEnableMarker Auto Const mandatory
Keyword Property COM_NotCivilian Auto Const mandatory
ReferenceAlias Property Alias_EavesdroppingEnemies Auto Const mandatory
ReferenceAlias Property Alias_QuestEnemies Auto Const mandatory
Quest Property City_GG_Mark_EnemyHolder Auto Const mandatory
GlobalVariable Property GG_Mark_BlockHelenaScene Auto Const mandatory
Faction Property City_GG_Mark_MaldonadoEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  City_GG_Connections.Start() ; #DEBUG_LINE_NO:7
  City_GG_Connections.SetStage(1000) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().AddPerk(Intimidation, False) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_GG_Connections.Start() ; #DEBUG_LINE_NO:18
  City_GG_Connections.SetStage(1000) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().AddPerk(Intimidation, False) ; #DEBUG_LINE_NO:20
  Self.SetStage(300) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().MoveTo(UC_GG_Connect_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Bonifac.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
  Alias_CaptiveMarker.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_DungeonLoc.GetLocation().RemoveKeyword(LocEncCrimsonFleet_Exclusive) ; #DEBUG_LINE_NO:41
  Alias_DungeonLoc.GetLocation().AddKeyword(LocEncEcliptic_Exclusive) ; #DEBUG_LINE_NO:42
  Alias_EavesdroppingTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:45
  Alias_EavesdroppingEnemies.GetRef().Disable(False) ; #DEBUG_LINE_NO:46
  Alias_QuestEnemies.GetRef().Enable(False) ; #DEBUG_LINE_NO:49
  Actor MalACT = Alias_Maldonado.GetActorRef() ; #DEBUG_LINE_NO:51
  Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:52
  MalACT.Enable(False) ; #DEBUG_LINE_NO:55
  MalACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:56
  BonACT.MoveTo(Alias_CaptiveMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  BonACT.SetRestrained(True) ; #DEBUG_LINE_NO:60
  BonACT.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:61
  BonACT.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:62
  If BonACT.IsDisabled() ; #DEBUG_LINE_NO:64
    BonACT.Enable(False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  BonACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:68
  Alias_Corpses.DisableAll(False) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:73
  City_GG_Mark_EnemyHolder.Start() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0110_Item_00()
  City_GG_Mark_110_Bonifac_Attract.Start() ; #DEBUG_LINE_NO:84
  Alias_CourierCorpse.GetRef().Disable(False) ; #DEBUG_LINE_NO:87
  Alias_MurderEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:96
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Bonifac.GetActorRef().SetRestrained(False) ; #DEBUG_LINE_NO:105
  Alias_BonCaptiveAlias.Clear() ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:114
  City_GG_Mark_155_Bon_FindAWeapon.Start() ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:123
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:124
  If !Self.GetStageDone(310) ; #DEBUG_LINE_NO:126
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:127
    Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:129
    BonACT.AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:130
    (SQ_Followers as sq_followersscript).SetRoleActive(BonACT, False, True, 0.0, 0.0) ; #DEBUG_LINE_NO:131
    (SQ_Followers as sq_followersscript).CommandFollow(BonACT) ; #DEBUG_LINE_NO:132
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().SetValue(UC_GG_Mark_Foreknowledge_BonifacKidnappedAV, 1.0) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:146
  Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:148
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:149
  If PlayACT.IsInCombat() || BonACT.IsInCombat() ; #DEBUG_LINE_NO:151
    Self.SetObjectiveDisplayed(261, True, False) ; #DEBUG_LINE_NO:152
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
  (SQ_Followers as sq_followersscript).SetRoleInactive(BonACT, False, False, True) ; #DEBUG_LINE_NO:157
  BonACT.MoveTo(Alias_BonifacTeleportMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:158
  City_GG_Mark_260_MalBonifac_Intro.Start() ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0263_Item_00()
  Self.SetObjectiveCompleted(261, True) ; #DEBUG_LINE_NO:168
  If Self.GetStageDone(250) ; #DEBUG_LINE_NO:170
    Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:171
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(310) && !Self.GetStageDone(314) ; #DEBUG_LINE_NO:174
    City_GG_Mark_310_Bonifac_MeetAtGG.Start() ; #DEBUG_LINE_NO:175
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0265_Item_00()
  Alias_Maldonado.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0267_Item_00()
  Alias_Bonifac.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:200
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:201
  Self.SetObjectiveDisplayed(270, True, False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0285_Item_00()
  Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:210
  ActorBase BonBase = BonACT.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:211
  BonACT.AddKeyword(COM_NotCivilian) ; #DEBUG_LINE_NO:212
  BonBase.SetEssential(False) ; #DEBUG_LINE_NO:213
  (SQ_Followers as sq_followersscript).SetRoleInactive(BonACT, False, False, True) ; #DEBUG_LINE_NO:214
  BonACT.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:215
  BonACT.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:216
  BonACT.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:217
  BonACT.AddToFaction(City_GG_Mark_MaldonadoEnemyFaction) ; #DEBUG_LINE_NO:218
  BonACT.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:219
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:221
  Self.SetObjectiveDisplayed(285, True, False) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0290_Item_00()
  Actor MalACT = Alias_Maldonado.GetActorRef() ; #DEBUG_LINE_NO:230
  MalACT.SetProtected(False) ; #DEBUG_LINE_NO:231
  MalACT.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:232
  MalACT.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:233
  If City_GG_Mark_260_MalBonifac_Intro.IsPlaying() ; #DEBUG_LINE_NO:235
    City_GG_Mark_260_MalBonifac_Intro.Stop() ; #DEBUG_LINE_NO:236
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(200) && !Self.GetStageDone(299) && !Self.GetStageDone(310) ; #DEBUG_LINE_NO:239
    Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:240
    Self.SetObjectiveDisplayed(290, True, False) ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0295_Item_00()
  GG_Mark_KilledBonifac.SetValue(1.0) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:251
  Self.SetStage(307) ; #DEBUG_LINE_NO:254
  If !Self.GetStageDone(299) ; #DEBUG_LINE_NO:256
    If !Self.GetStageDone(310) && !Self.GetStageDone(285) ; #DEBUG_LINE_NO:257
      City_GG_Mark_295_Bonifac_MalDead.Start() ; #DEBUG_LINE_NO:258
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(300) ; #DEBUG_LINE_NO:261
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetObjectiveCompleted(285, True) ; #DEBUG_LINE_NO:270
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:271
  GG_Mark_BlockHelenaScene.SetValue(0.0) ; #DEBUG_LINE_NO:272
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:274
  City_GG_Mark_299_Mal_PostBonDeath.Start() ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(290, True) ; #DEBUG_LINE_NO:284
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:285
  Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:288
  BonACT.RemoveFromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_0305_Item_00()
  Game.GetPlayer().AddItem(Alias_Data.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:297
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:305
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:306
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:307
  Self.SetStage(307) ; #DEBUG_LINE_NO:310
  If Self.GetStageDone(190) ; #DEBUG_LINE_NO:312
    If Self.GetStageDone(263) && !Self.GetStageDone(314) && !Self.GetStageDone(280) ; #DEBUG_LINE_NO:314
      City_GG_Mark_310_Bonifac_MeetAtGG.Start() ; #DEBUG_LINE_NO:315
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(280) && !Self.GetStageDone(299) ; #DEBUG_LINE_NO:321
      GG_Mark_BlockHelenaScene.SetValue(1.0) ; #DEBUG_LINE_NO:322
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:324
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(190) || Self.GetStageDone(200) ; #DEBUG_LINE_NO:328
    (SQ_Followers as sq_followersscript).SetRoleInactive(Alias_Bonifac.GetActorRef(), False, False, True) ; #DEBUG_LINE_NO:329
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0311_Item_00()
  If City_GG_Mark_310_Bonifac_MeetAtGG.IsPlaying() ; #DEBUG_LINE_NO:339
    City_GG_Mark_310_Bonifac_MeetAtGG.Stop() ; #DEBUG_LINE_NO:340
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_Maldonado.GetRef().Disable(False) ; #DEBUG_LINE_NO:349
EndFunction

Function Fragment_Stage_0960_Item_00()
  GG_Mark_PlayerToldHelenaBonifacDead.SetValue(1.0) ; #DEBUG_LINE_NO:357
EndFunction

Function Fragment_Stage_0965_Item_00()
  GG_Mark_PlayerToldHelenaAboutMaldonado.SetValue(1.0) ; #DEBUG_LINE_NO:365
EndFunction

Function Fragment_Stage_0970_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:381
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Data.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:389
  Actor BonACT = Alias_Bonifac.GetActorRef() ; #DEBUG_LINE_NO:392
  If !BonACT.IsDead() ; #DEBUG_LINE_NO:393
    BonACT.MoveTo(BonifacTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:394
  EndIf ; #DEBUG_LINE_NO:
  Alias_CourierCorpse.GetRef().Disable(False) ; #DEBUG_LINE_NO:398
  Alias_MurderEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:399
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:401
  Self.Stop() ; #DEBUG_LINE_NO:402
EndFunction
