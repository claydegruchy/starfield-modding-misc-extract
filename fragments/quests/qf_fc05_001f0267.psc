ScriptName Fragments:Quests:QF_FC05_001F0267 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Jade Auto Const mandatory
Scene Property FC05_JadeStage500Scene Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC05_PT1 Auto Const mandatory
Scene Property FC05_AutumnPathToTableScene Auto Const mandatory
Scene Property FC05_MeiAnnounceRunScene Auto Const mandatory
Scene Property FC05_MeiRulesScene Auto Const mandatory
Scene Property FC05_MeiSpeakerScene Auto Const mandatory
ReferenceAlias Property Alias_StashRoomDoor Auto Const mandatory
Faction Property FC05_MarcoEnemyFaction Auto Const mandatory
ObjectReference Property FC05_MarcoShipEnableMarker Auto Const mandatory
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC_EncryptedSlateQuest Auto Const mandatory
ReferenceAlias Property Alias_MeiDevine Auto Const mandatory
ReferenceAlias Property Alias_AutumnMacMillan Auto Const mandatory
ReferenceAlias Property Alias_MarcoGraziani Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MarcoSlate Auto Const mandatory
Scene Property FC05_GuardWelcomeScene Auto Const mandatory
ReferenceAlias Property Alias_MarcoStarshipMapMarker Auto Const mandatory
ReferenceAlias Property Alias_MarcoDoorman Auto Const
Quest Property FFRedMileR01Misc Auto Const mandatory
ReferenceAlias Property Alias_PlayerRunningRedMile Auto Const mandatory
ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_RedMileStartingDoor Auto Const mandatory
ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const mandatory
ActorValue Property FC05_Completed Auto Const mandatory
Scene Property FC05_MarcoScene Auto Const mandatory
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
Quest Property DialogueRedMile Auto Const mandatory
ReferenceAlias Property Alias_PlayerChair Auto Const mandatory
GlobalVariable Property PlayerMetMeiDevine Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Medium Auto Const mandatory
ObjectReference Property FC05_PTMarco Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:26
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:27
  Alias_Jade.GetRef().Enable(False) ; #DEBUG_LINE_NO:30
  Alias_AutumnMacMillan.GetRef().Enable(False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0200_Item_00()
  FC05_AutumnPathToTableScene.Start() ; #DEBUG_LINE_NO:40
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Alias_Player.GetActorRef().GetFurnitureUsing() == Alias_PlayerChair.GetRef() ; #DEBUG_LINE_NO:51
    Self.SetStage(500) ; #DEBUG_LINE_NO:52
    FC05_AutumnPathToTableScene.Stop() ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_Jade.GetRef().Enable(False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(200) ; #DEBUG_LINE_NO:82
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:86
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:87
  FC05_JadeStage500Scene.Start() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:98
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:99
  Alias_PlayerRunningRedMile.ForceRefTo(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0650_Item_00()
  PlayerMetMeiDevine.SetValue(1.0) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:120
  PlayerMetMeiDevine.SetValue(1.0) ; #DEBUG_LINE_NO:122
  FC05_MeiAnnounceRunScene.Start() ; #DEBUG_LINE_NO:124
  Alias_MeiDevine.GetActorRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:126
  Alias_StageLightsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0750_Item_00()
  Alias_StageLightsEnableMarker.GetReference().Enable(False) ; #DEBUG_LINE_NO:135
  FC05_MeiRulesScene.Start() ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:144
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:145
  Alias_DoorLightsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:148
  Alias_RedMileStartingDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:149
  Alias_StageLightsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:151
  Alias_MeiDevine.GetActorRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0800_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:161
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:162
  kmyQuest.SpawnCreatures(0) ; #DEBUG_LINE_NO:166
  kmyQuest.RMDisableFastTravel() ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:186
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:187
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:190
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:191
  FC05_MeiSpeakerScene.Start() ; #DEBUG_LINE_NO:194
  kmyQuest.SpawnCreatures(1) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_1110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:218
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:219
  Alias_MeiDevine.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:222
  kmyQuest.RMEnableFastTravel() ; #DEBUG_LINE_NO:225
  Alias_DoorLightsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:228
  PlayerCompletedRedMile.Mod(1.0) ; #DEBUG_LINE_NO:232
  DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_1200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:241
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:242
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:245
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:246
  If FFRedMileR01Misc.IsRunning() && FFRedMileR01Misc.GetStageDone(110) ; #DEBUG_LINE_NO:249
    FFRedMileR01Misc.SetStage(120) ; #DEBUG_LINE_NO:250
  EndIf ; #DEBUG_LINE_NO:
  Alias_PlayerRunningRedMile.Clear() ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_1201_Item_00()
  If FFRedMileR01Misc.IsRunning() && !FFRedMileR01Misc.GetStageDone(1000) ; #DEBUG_LINE_NO:262
    FFRedMileR01Misc.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1210_Item_00()
  Alias_AutumnMacMillan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:280
  Self.SetObjectiveDisplayed(1100, True, False) ; #DEBUG_LINE_NO:281
EndFunction

Function Fragment_Stage_1600_Item_00()
  Alias_MarcoStarshipMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:291
  Alias_MarcoStarshipMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:292
  Self.SetObjectiveCompleted(1100, True) ; #DEBUG_LINE_NO:293
  Self.SetObjectiveDisplayed(1200, True, False) ; #DEBUG_LINE_NO:294
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetObjectiveCompleted(1200, True) ; #DEBUG_LINE_NO:304
  Self.SetObjectiveDisplayed(1400, True, False) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_1610_Item_00()
  Alias_MarcoDoorman.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_1650_Item_00()
  FC05_GuardWelcomeScene.Start() ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveCompleted(1400, True) ; #DEBUG_LINE_NO:331
  Self.SetObjectiveDisplayed(1500, True, False) ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_1705_Item_00()
  FC05_MarcoScene.Start() ; #DEBUG_LINE_NO:341
EndFunction

Function Fragment_Stage_1710_Item_00()
  Alias_MarcoGraziani.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:349
  Alias_Companion.GetRef().MoveTo(FC05_PTMarco, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:352
EndFunction

Function Fragment_Stage_1760_Item_00()
  Alias_Player.GetActorRef().AddItem(Credits as Form, NPCDemandMoney_Medium.GetValue() as Int, False) ; #DEBUG_LINE_NO:360
EndFunction

Function Fragment_Stage_1770_Item_00()
  Self.SetObjectiveCompleted(1500, True) ; #DEBUG_LINE_NO:368
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:369
  Alias_Player.GetActorRef().AddItem(Alias_MarcoSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:371
  Self.SetStage(2000) ; #DEBUG_LINE_NO:373
EndFunction

Function Fragment_Stage_1800_Item_00()
  Alias_Player.GetActorRef().AddToFaction(FC05_MarcoEnemyFaction) ; #DEBUG_LINE_NO:383
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(1500, True) ; #DEBUG_LINE_NO:391
  Self.SetObjectiveDisplayed(1600, True, False) ; #DEBUG_LINE_NO:392
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(1600, True) ; #DEBUG_LINE_NO:400
  Self.SetObjectiveDisplayed(1700, True, False) ; #DEBUG_LINE_NO:401
  Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1.0) ; #DEBUG_LINE_NO:404
EndFunction

Function Fragment_Stage_2100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:412
  Alias_Player.GetActorRef().SetValue(FC05_Completed, 1.0) ; #DEBUG_LINE_NO:415
  Alias_Player.GetActorRef().RemoveItem(Alias_MarcoSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:418
  Self.Stop() ; #DEBUG_LINE_NO:425
EndFunction
