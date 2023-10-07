ScriptName Fragments:Quests:QF_MQ106_00021BEF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ106_001_StarbornScene01 Auto Const mandatory
Scene Property MQ106_004_AftermathScene Auto Const mandatory
Scene Property MQ106_005_LodgeScene Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ203 Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
GlobalVariable Property MQ106_SurrenderedArtifact Auto Const mandatory
ReferenceAlias Property Alias_StarbornEmissaryShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_MQ105Artifact Auto Const mandatory
Scene Property MQ106_005b_MoveEveryoneScene Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Collection Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_HelixMoveMarker Auto Const mandatory
Scene Property MQ106_004_AftermathScene_NGPlus Auto Const mandatory
ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppear Auto Const mandatory
Quest Property MQ_HunterPreMQ106 Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
ObjectReference Property MQ106VladimirFurnitureREF Auto Const mandatory
ReferenceAlias Property Alias_VoliiGuardShip01 Auto Const mandatory
ReferenceAlias Property Alias_VoliiGuardShip02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeDisplay Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
Perk Property MQ106HelixReduceDamage Auto Const mandatory
Location Property VoliiStationLocation Auto Const mandatory
Keyword Property SQ_TrafficManagerHeavy_LocType Auto Const mandatory
ObjectReference Property VoliiAlphaTrafficManagerREF Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ106 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ106_Cooldown Auto Const mandatory
Scene Property MQ106_006_LodgeScene Auto Const mandatory
Quest Property MQ00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:10
  MQ102.Stop() ; #DEBUG_LINE_NO:11
  MQ105.SetStage(920) ; #DEBUG_LINE_NO:12
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:15
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:16
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:17
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:18
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:19
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:20
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:21
  Alias_Barrett.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:24
  Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  Alias_WalterStroud.GetActorRef().moveto(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef() ; #DEBUG_LINE_NO:31
  (SQ_PlayerShip as sq_playershipscript).AddPassenger(WalterStroudREF) ; #DEBUG_LINE_NO:33
  Self.SetStage(10) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0001_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:43
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:44
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:45
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:46
  MQ102.Stop() ; #DEBUG_LINE_NO:47
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:50
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:51
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:52
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:53
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:54
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:55
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:56
  Self.SetStage(200) ; #DEBUG_LINE_NO:58
  Alias_Barrett.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:61
  Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:62
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  Self.SetStage(220) ; #DEBUG_LINE_NO:66
  Self.SetStage(230) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:75
  mq106script kmyQuest = __temp as mq106script ; #DEBUG_LINE_NO:76
  Game.SetInChargen(True, False, False) ; #DEBUG_LINE_NO:80
  kmyQuest.MQ106EnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:81
  kmyQuest.MQ106EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:82
  kmyQuest.MQ106EnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:83
  kmyQuest.MQ106EnableLayer.EnableGravJump(False) ; #DEBUG_LINE_NO:84
  kmyQuest.MQ106EnableLayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:85
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:87
  spaceshipreference PlayerShipREF = Alias_playerShip.GetShipRef() ; #DEBUG_LINE_NO:88
  HelixREF.Reset(None) ; #DEBUG_LINE_NO:89
  HelixREF.MoveNear(PlayerShipREF as ObjectReference, 1, 0, 0) ; #DEBUG_LINE_NO:90
  HelixREF.SetGhost(True) ; #DEBUG_LINE_NO:91
  HelixREF.EnableWithGravJump() ; #DEBUG_LINE_NO:92
  MQ_HunterPreMQ106.SetStageNoWait(1000) ; #DEBUG_LINE_NO:95
  MQ106_001_StarbornScene01.Start() ; #DEBUG_LINE_NO:97
  MUSGenesisStingerStarbornAppear.Add() ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ105.SetStage(2000) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:111
  Self.SetActive(True) ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:121
  spaceshipreference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:123
  EmissaryShipREF.DisableWithGravJump() ; #DEBUG_LINE_NO:124
  EmissaryShipREF.SetGhost(False) ; #DEBUG_LINE_NO:125
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:126
  Self.SetStage(200) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:135
  mq106script kmyQuest = __temp as mq106script ; #DEBUG_LINE_NO:136
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:140
  kmyQuest.MQ106EnableLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:141
  kmyQuest.MQ106EnableLayer.EnableGravJump(True) ; #DEBUG_LINE_NO:142
  kmyQuest.MQ106EnableLayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:143
  kmyQuest.MQ106EnableLayer = None ; #DEBUG_LINE_NO:144
  (MQ105 as mq105script).MQ105EnableLayer = None ; #DEBUG_LINE_NO:146
  MQ105.SetStageNoWait(1100) ; #DEBUG_LINE_NO:148
  Self.SetObjectiveDisplayed(10, False, False) ; #DEBUG_LINE_NO:150
  Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:151
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:152
  spaceshipreference StarbornShipREF = Alias_StarbornEmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:154
  StarbornShipREF.SetGhost(False) ; #DEBUG_LINE_NO:156
  StarbornShipREF.AddPerk(MQ106HelixReduceDamage, False) ; #DEBUG_LINE_NO:157
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:158
  StarbornShipREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:159
  StarbornShipREF.StartCombat(Alias_playerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:168
  mq106script kmyQuest = __temp as mq106script ; #DEBUG_LINE_NO:169
  kmyQuest.MQ106EnableLayer = None ; #DEBUG_LINE_NO:172
  (MQ105 as mq105script).MQ105EnableLayer = None ; #DEBUG_LINE_NO:173
  MQ105.SetStageNoWait(1100) ; #DEBUG_LINE_NO:175
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:177
  Game.GetPlayer().removeitem(Alias_MQ105Artifact.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:179
  MQ106_SurrenderedArtifact.SetValueInt(1) ; #DEBUG_LINE_NO:180
  spaceshipreference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:182
  EmissaryShipREF.SetGhost(False) ; #DEBUG_LINE_NO:183
  EmissaryShipREF.DisableWithGravJump() ; #DEBUG_LINE_NO:184
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:185
  Self.SetStage(200) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_StarbornEmissaryShip.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:194
  Self.SetStage(200) ; #DEBUG_LINE_NO:195
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:203
  mq106script kmyQuest = __temp as mq106script ; #DEBUG_LINE_NO:204
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:207
  HelixREF.SetGhost(False) ; #DEBUG_LINE_NO:209
  HelixREF.DisableNoWait(False) ; #DEBUG_LINE_NO:210
  Game.SetInChargen(False, False, False) ; #DEBUG_LINE_NO:213
  kmyQuest.MQ106EnableLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:214
  kmyQuest.MQ106EnableLayer.EnableGravJump(True) ; #DEBUG_LINE_NO:215
  kmyQuest.MQ106EnableLayer.EnableFarTravel(True) ; #DEBUG_LINE_NO:216
  kmyQuest.MQ106EnableLayer = None ; #DEBUG_LINE_NO:217
  (MQ105 as mq105script).MQ105EnableLayer = None ; #DEBUG_LINE_NO:218
  MQ105.SetStageNoWait(1100) ; #DEBUG_LINE_NO:219
  Alias_VoliiGuardShip01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:222
  Alias_VoliiGuardShip02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:223
  VoliiAlphaTrafficManagerREF.EnableNoWait(False) ; #DEBUG_LINE_NO:224
  If Self.GetStageDone(90) ; #DEBUG_LINE_NO:226
    MQ106_004_AftermathScene_NGPlus.Start() ; #DEBUG_LINE_NO:227
  Else ; #DEBUG_LINE_NO:
    MQ106_004_AftermathScene.Start() ; #DEBUG_LINE_NO:229
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:230
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:231
    Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:232
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:233
  EndIf ; #DEBUG_LINE_NO:
  ArmillaryMountSwapEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:237
  Actor VladimirREF = Alias_VladimirSall.GetActorRef() ; #DEBUG_LINE_NO:240
  VladimirREF.Disable(False) ; #DEBUG_LINE_NO:241
  VladimirREF.moveto(MQ106VladimirFurnitureREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:242
  VladimirREF.Enable(False) ; #DEBUG_LINE_NO:243
  MUSGenesisStingerStarbornAppear.Remove() ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:254
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:255
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:256
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:257
  Actor NoelREF = Alias_Noel.GetActorRef() ; #DEBUG_LINE_NO:260
  NoelREF.Disable(False) ; #DEBUG_LINE_NO:261
  NoelREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:262
  NoelREF.Enable(False) ; #DEBUG_LINE_NO:263
  NoelREF.MovetoPackageLocation() ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_0220_Item_00()
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef() ; #DEBUG_LINE_NO:273
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(WalterStroudREF) ; #DEBUG_LINE_NO:275
  WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:276
  WalterStroudREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:277
EndFunction

Function Fragment_Stage_0230_Item_00()
  Actor WalterStroudREF = Alias_WalterStroud.GetActorRef() ; #DEBUG_LINE_NO:286
  (SQ_PlayerShip as sq_playershipscript).RemovePassenger(WalterStroudREF) ; #DEBUG_LINE_NO:288
  WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:289
  WalterStroudREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ106_005b_MoveEveryoneScene.Start() ; #DEBUG_LINE_NO:298
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:301
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:302
EndFunction

Function Fragment_Stage_0302_Item_00()
  If !MQ106_006_LodgeScene.IsPlaying() ; #DEBUG_LINE_NO:310
    MQ106_006_LodgeScene.Start() ; #DEBUG_LINE_NO:311
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0305_Item_00()
  Alias_LodgeDisplay.GetRef().PlayAnimation("Play01") ; #DEBUG_LINE_NO:320
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:328
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:329
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(110) == False ; #DEBUG_LINE_NO:338
    Self.SetStage(505) ; #DEBUG_LINE_NO:339
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1000) ; #DEBUG_LINE_NO:341
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0505_Item_00()
  Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:350
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:351
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:359
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:367
  mq106script kmyQuest = __temp as mq106script ; #DEBUG_LINE_NO:368
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:371
  MQ201.SetStageNoWait(10) ; #DEBUG_LINE_NO:374
  kmyQuest.MQ106EnableLayer = None ; #DEBUG_LINE_NO:377
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:380
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:381
  Int I = 0 ; #DEBUG_LINE_NO:382
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:383
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ106_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:384
    I += 1 ; #DEBUG_LINE_NO:385
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_MQ106.Send(None) ; #DEBUG_LINE_NO:387
  Self.Stop() ; #DEBUG_LINE_NO:389
EndFunction

Function Fragment_Stage_2000_Item_00()
  MUSGenesisStingerStarbornAppear.Remove() ; #DEBUG_LINE_NO:398
  Alias_VoliiGuardShip01.GetRef().Enable(False) ; #DEBUG_LINE_NO:401
  Alias_VoliiGuardShip02.GetRef().Enable(False) ; #DEBUG_LINE_NO:402
  spaceshipreference HelixREF = Alias_StarbornEmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:405
  HelixREF.SetGhost(False) ; #DEBUG_LINE_NO:407
  HelixREF.RemovePerk(MQ106HelixReduceDamage) ; #DEBUG_LINE_NO:408
  HelixREF.DisableNoWait(False) ; #DEBUG_LINE_NO:409
  (MQ00 as mq00questscript).StartMQ201FailsafeTimer() ; #DEBUG_LINE_NO:412
EndFunction
