ScriptName Fragments:Quests:QF_City_ER_Exorcism_0016B466 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ER_Exorcism_BountyHunterFaction_Enemy Auto Const mandatory
ReferenceAlias Property Alias_Tracker01 Auto Const mandatory
ReferenceAlias Property Alias_Tracker02 Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker01 Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const mandatory
Message Property ER_DEBUG_Exorcism_OptionalPaths Auto Const mandatory
Quest Property City_ER_Peace Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const mandatory
GlobalVariable Property ER_Exorcism_NevanBribeCredits Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_DungeonDebugMarker Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
Quest Property City_ER_Ghost Auto Const mandatory
Perk Property BackgroundBountyHunter Auto Const mandatory
ReferenceAlias Property Alias_HunterSpawn01 Auto Const mandatory
ReferenceAlias Property Alias_HunterSpawn02 Auto Const mandatory
Message Property DEBUG_Exorcism_SitError Auto Const mandatory
ReferenceAlias Property Alias_DungeonDebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_WaitChair Auto Const mandatory
Message Property ER_Exorcism_ChairDisplayNameOverride Auto Const mandatory
GlobalVariable Property ER_Exorcism_HunterBribeCredits Auto Const mandatory
ActorValue Property City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const mandatory
Scene Property City_ER_Exorcism_145_SloanResponse Auto Const mandatory
Scene Property City_ER_Exorcism_0310_Trackers_SpotPlayer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(City_ER_Ghost_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().MoveTo(Alias_DungeonDebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:25
  Self.SetStage(500) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().MoveTo(City_ER_Ghost_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_DungeonDebugMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  Self.SetStage(300) ; #DEBUG_LINE_NO:39
  Utility.Wait(100.0) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:50
  Self.SetStage(120) ; #DEBUG_LINE_NO:51
  Self.SetStage(130) ; #DEBUG_LINE_NO:52
  Self.SetStage(140) ; #DEBUG_LINE_NO:53
  Game.GetPlayer().AddPerk(BackgroundBountyHunter, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0019_Item_00()
  ER_Dead_KilmansReturned.SetValue(1.0) ; #DEBUG_LINE_NO:62
  DialogueEleosRetreat.SetStage(900) ; #DEBUG_LINE_NO:63
  City_ER_Ghost.SetStage(1000) ; #DEBUG_LINE_NO:64
  DialogueEleosRetreat.SetStage(25) ; #DEBUG_LINE_NO:66
  DialogueEleosRetreat.SetStage(40) ; #DEBUG_LINE_NO:67
  DialogueEleosRetreat.SetStage(50) ; #DEBUG_LINE_NO:68
  DialogueEleosRetreat_OpeningScene.Stop() ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:78
  Self.SetActive(True) ; #DEBUG_LINE_NO:79
  Alias_WaitChair.GetRef().SetActivateTextOverride(ER_Exorcism_ChairDisplayNameOverride) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0110_Item_00()
  If Self.GetStageDone(330) ; #DEBUG_LINE_NO:90
    Self.SetStage(350) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(120) && Self.GetStageDone(130) && Self.GetStageDone(140) ; #DEBUG_LINE_NO:94
    Self.SetStage(150) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Self.GetStageDone(110) && Self.GetStageDone(130) && Self.GetStageDone(140) ; #DEBUG_LINE_NO:104
    Self.SetStage(150) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, ER_Exorcism_NevanBribeCredits.GetValueInt(), False) ; #DEBUG_LINE_NO:114
  If Self.GetStageDone(120) && Self.GetStageDone(110) && Self.GetStageDone(140) ; #DEBUG_LINE_NO:116
    Self.SetStage(150) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0140_Item_00()
  If Self.GetStageDone(120) && Self.GetStageDone(130) && Self.GetStageDone(110) ; #DEBUG_LINE_NO:126
    Self.SetStage(150) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(145) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0145_Item_00()
  City_ER_Exorcism_145_SloanResponse.Start() ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:155
  Self.SetObjectiveDisplayed(290, True, False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.FadeOutGame(True, True, 0.5, 1.0, True) ; #DEBUG_LINE_NO:164
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:165
  Self.SetStage(305) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0305_Item_00()
  ObjectReference TrackRef01 = Alias_Tracker01.GetRef() ; #DEBUG_LINE_NO:174
  ObjectReference TrackRef02 = Alias_Tracker02.GetRef() ; #DEBUG_LINE_NO:175
  TrackRef01.MoveTo(Alias_HunterSpawn01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:176
  TrackRef02.MoveTo(Alias_HunterSpawn02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:177
  TrackRef01.Enable(False) ; #DEBUG_LINE_NO:178
  TrackRef02.Enable(False) ; #DEBUG_LINE_NO:179
  Game.FadeOutGame(False, True, 0.5, 1.0, False) ; #DEBUG_LINE_NO:180
  Self.SetStage(310) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0307_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:189
  Self.SetObjectiveDisplayed(310, True, False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0310_Item_00()
  City_ER_Exorcism_0310_Trackers_SpotPlayer.Start() ; #DEBUG_LINE_NO:198
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:200
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  Alias_WaitChair.GetRef().SetActivateTextOverride(None) ; #DEBUG_LINE_NO:205
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:207
  Alias_Tracker01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0315_Item_00()
  City_ER_Exorcism_0310_Trackers_SpotPlayer.Stop() ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:224
    Self.SetStage(350) ; #DEBUG_LINE_NO:225
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:234
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:236
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:237
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0405_Item_00()
  ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1.0) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:259
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:260
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, ER_Exorcism_HunterBribeCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:269
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:270
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:272
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:284
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:286
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:287
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:298
  PlayACT.AddToFaction(ER_Exorcism_BountyHunterFaction_Enemy) ; #DEBUG_LINE_NO:299
  Alias_Tracker01.GetActorRef().StartCombat(PlayACT as ObjectReference, False) ; #DEBUG_LINE_NO:300
  Alias_Tracker02.GetActorRef().StartCombat(PlayACT as ObjectReference, False) ; #DEBUG_LINE_NO:301
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:304
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:305
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0470_Item_00()
  If Self.GetStageDone(480) ; #DEBUG_LINE_NO:314
    Self.SetStage(490) ; #DEBUG_LINE_NO:315
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0480_Item_00()
  If Self.GetStageDone(470) ; #DEBUG_LINE_NO:324
    Self.SetStage(490) ; #DEBUG_LINE_NO:325
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0490_Item_00()
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:334
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:335
  Self.SetStage(500) ; #DEBUG_LINE_NO:337
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().SetValue(City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV, 1.0) ; #DEBUG_LINE_NO:346
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:348
  Self.SetObjectiveCompleted(310, True) ; #DEBUG_LINE_NO:349
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:350
  If Self.IsObjectiveDisplayed(110) && !Self.IsObjectiveCompleted(110) ; #DEBUG_LINE_NO:352
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:353
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0550_Item_00()
  Actor TrackRef01 = Alias_Tracker01.GetActorRef() ; #DEBUG_LINE_NO:362
  Actor TrackRef02 = Alias_Tracker02.GetActorRef() ; #DEBUG_LINE_NO:363
  If !TrackRef01.IsDead() ; #DEBUG_LINE_NO:365
    TrackRef01.Disable(False) ; #DEBUG_LINE_NO:366
  EndIf ; #DEBUG_LINE_NO:
  If !TrackRef02.IsDead() ; #DEBUG_LINE_NO:369
    TrackRef02.Disable(False) ; #DEBUG_LINE_NO:370
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(490) ; #DEBUG_LINE_NO:380
    If Self.GetStageDone(420) ; #DEBUG_LINE_NO:381
      ER_Exorcism_PlayerBribedTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:382
    ElseIf Self.GetStageDone(430) ; #DEBUG_LINE_NO:383
      ER_Exorcism_PlayerStarbornedTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:384
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  City_ER_Peace.Start() ; #DEBUG_LINE_NO:388
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:389
  Self.Stop() ; #DEBUG_LINE_NO:390
EndFunction
