ScriptName Fragments:Quests:QF_MQ207B_00256B02 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ104 Auto Const mandatory
Quest Property MQ103 Auto Const mandatory
Quest Property FFLodge01 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Scene Property MQ104_002_ReturnScene Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ObjectReference Property MQ104AStart Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
ActorValue Property MQ104A_CompanionPresentTemple Auto Const mandatory
Scene Property MQ104A_008_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_009_TempleCompanionReaction Auto Const mandatory
Scene Property MQ104A_010_TempleCompanionReaction Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
Scene Property MQ104A_012_PowerDemo Auto Const mandatory
ObjectReference Property MQ104AStartTestCell Auto Const mandatory
ObjectReference Property MQ104AVladTestMarker Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Alias_Artifact02QuestObject Auto Const mandatory
Quest Property MQ207C Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
Message Property TestMQ206AMSG Auto Const mandatory
ObjectReference Property MQ206C_Marker_Vladimir Auto Const mandatory
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
ObjectReference Property MQ206CArtifactSpawnMarker01 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
ObjectReference Property MQ206C_Marker_SarahBarrett Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
Quest Property MQ301 Auto Const mandatory
ReferenceAlias Property Alias_Artifact01Activator Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Starborn01 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
Location Property LC116NishinaResearchStationLocation Auto Const mandatory
Location Property LC116NishinaResearchStationResearchLevelLocation Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_MQ207 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_MQ207_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:10
  Alias_Vladimir.GetActorRef().moveto(MQ206C_Marker_Vladimir, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Alias_SarahMorgan.GetActorRef().moveto(MQ206C_Marker_SarahBarrett, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:15
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:16
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:17
    Alias_SarahMorgan.GetActorRef().disable(False) ; #DEBUG_LINE_NO:18
    Alias_Barrett.GetActorRef().moveto(MQ206C_Marker_SarahBarrett, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:20
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:21
    Alias_SamCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:22
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:23
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:24
    Alias_Andreja.GetActorRef().disable(False) ; #DEBUG_LINE_NO:25
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:26
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:27
    Alias_Barrett.GetActorRef().disable(False) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
  Self.SetStage(10) ; #DEBUG_LINE_NO:33
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:36
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:37
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:38
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:48
  Self.SetStage(15) ; #DEBUG_LINE_NO:49
  Self.SetStage(20) ; #DEBUG_LINE_NO:50
  Self.SetActive(False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor VladimirREF = Alias_Vladimir.GetActorRef() ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:60
  MQ204LodgeAttackClutterEnableMarker.disable(False) ; #DEBUG_LINE_NO:63
  VladimirREF.disable(False) ; #DEBUG_LINE_NO:66
  VladimirREF.moveto(MQ206C_Marker_Vladimir, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:67
  VladimirREF.Enable(False) ; #DEBUG_LINE_NO:68
  Self.SetActive(True) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:78
  mqcheckgravjumpquestscript kmyQuest = __temp as mqcheckgravjumpquestscript ; #DEBUG_LINE_NO:79
  Self.SetObjectiveDisplayed(11, True, False) ; #DEBUG_LINE_NO:82
  kmyQuest.CheckSkillsMenu() ; #DEBUG_LINE_NO:84
  MQ_TutorialQuest.SetStage(210) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetObjectiveCompleted(11, True) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:102
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:103
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:106
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:107
  Int I = 0 ; #DEBUG_LINE_NO:108
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:109
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_MQ207_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:110
    I += 1 ; #DEBUG_LINE_NO:111
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_MQ207.Send(None) ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:121
  Self.SetObjectiveDisplayed(12, True, False) ; #DEBUG_LINE_NO:122
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:123
  If Alias_playerShip.GetShipReference().GetGravJumpRange() < 21.0 ; #DEBUG_LINE_NO:126
    Self.SetStage(12) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  LC116NishinaResearchStationLocation.Reset() ; #DEBUG_LINE_NO:131
  LC116NishinaResearchStationResearchLevelLocation.Reset() ; #DEBUG_LINE_NO:132
  MQ207C.Start() ; #DEBUG_LINE_NO:133
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:136
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:137
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef() ; #DEBUG_LINE_NO:140
  MapMarker01REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:142
  MapMarker01REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:143
  MapMarker01REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:144
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(11, Alias_Artifact01Activator.GetRef()) ; #DEBUG_LINE_NO:147
  Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF) ; #DEBUG_LINE_NO:148
  ArtifactActivator01REF.EnableNoWait(False) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(11, False, False) ; #DEBUG_LINE_NO:158
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor Starborn01REF = Alias_Starborn01.GetActorRef() ; #DEBUG_LINE_NO:167
  Starborn01REF.Enable(False) ; #DEBUG_LINE_NO:169
  Starborn01REF.moveto(Alias_ArtifactRoomSpawnMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:170
  MUSGenesisStingerStarbornAppearB.add() ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:181
  If Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:184
    Self.SetStage(60) ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(11, MQ206CArtifactSpawnMarker01) ; #DEBUG_LINE_NO:189
  Alias_Artifact01QuestObject.ForceRefTo(ArtifactREF) ; #DEBUG_LINE_NO:190
  ArtifactREF.Enable(False) ; #DEBUG_LINE_NO:191
  Game.GetPlayer().additem(ArtifactREF as Form, 1, False) ; #DEBUG_LINE_NO:192
  MQ00_ArtifactsHolder.addref(ArtifactREF) ; #DEBUG_LINE_NO:193
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(11) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:205
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:206
  Self.SetObjectiveDisplayed(11, False, False) ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_0038_Item_00()
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:218
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0039_Item_00()
  Self.SetObjectiveDisplayed(35, False, False) ; #DEBUG_LINE_NO:232
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:246
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:249
  If Self.GetStageDone(30) == True ; #DEBUG_LINE_NO:252
    Self.SetStage(60) ; #DEBUG_LINE_NO:253
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:270
  If MQ301.GetStageDone(900) ; #DEBUG_LINE_NO:273
    MQ301.SetStage(1000) ; #DEBUG_LINE_NO:274
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:277
EndFunction
