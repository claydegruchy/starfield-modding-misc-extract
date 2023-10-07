ScriptName Fragments:Quests:QF_MQ201_00017CE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArtifactCollection Auto Const mandatory
Scene Property MQ204_002_ReturnScene Auto Const mandatory
Quest Property MQ202 Auto Const mandatory
Quest Property MQ203 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Alias_Vladimir Auto Const mandatory
ObjectReference Property MQ203VladimirStartMarker Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactQuestObject01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactQuestObject02 Auto Const mandatory
ReferenceAlias Property Alias_MQ204CompanionChoice Auto Const mandatory
ObjectReference Property SarahMorganREF Auto Const mandatory
ObjectReference Property MQ106_VladimirMarker01 Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const
ReferenceAlias Property Alias_MapMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker02 Auto Const mandatory
ObjectReference Property MQ201ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ201ArtifactSpawnMarker02 Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
Quest Property MQ201B Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactActivator02 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Starborn01 Auto Const mandatory
ReferenceAlias Property Alias_Starborn02 Auto Const mandatory
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const mandatory
Message Property MQCompanionLockedBailoutMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:10
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(0) ; #DEBUG_LINE_NO:13
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:14
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(18) ; #DEBUG_LINE_NO:15
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(3) ; #DEBUG_LINE_NO:16
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(4) ; #DEBUG_LINE_NO:17
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(5) ; #DEBUG_LINE_NO:18
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(6) ; #DEBUG_LINE_NO:19
  (Alias_ArtifactCollection.GetRef().GetLinkedRef(None) as armillaryscript).DebugSetArtifactAdded(7) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().MoveTo(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  Alias_Vladimir.GetActorRef().MoveTo(MQ106_VladimirMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:27
  Self.SetStage(10) ; #DEBUG_LINE_NO:29
  Frontier_ModularREF.MoveTo(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:33
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:34
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:43
  MQ404.Start() ; #DEBUG_LINE_NO:46
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:49
  Self.SetActive(True) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(12, True, False) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveDisplayed(22, True, False) ; #DEBUG_LINE_NO:61
  Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:64
  Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:65
  Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:66
  Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:67
  ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef() ; #DEBUG_LINE_NO:70
  ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef() ; #DEBUG_LINE_NO:71
  MapMarker01REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:73
  MapMarker01REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:74
  MapMarker01REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:75
  MapMarker02REF.AddToMapScanned(True) ; #DEBUG_LINE_NO:76
  MapMarker02REF.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:77
  MapMarker02REF.SetRequiresScanning(False) ; #DEBUG_LINE_NO:78
  ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator01.GetRef()) ; #DEBUG_LINE_NO:81
  Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF) ; #DEBUG_LINE_NO:82
  ArtifactActivator01REF.EnableNoWait(False) ; #DEBUG_LINE_NO:83
  ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator02.GetRef()) ; #DEBUG_LINE_NO:85
  Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF) ; #DEBUG_LINE_NO:86
  ArtifactActivator02REF.EnableNoWait(False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0022_Item_00()
  Self.SetObjectiveCompleted(12, True) ; #DEBUG_LINE_NO:95
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0024_Item_00()
  Self.SetObjectiveCompleted(14, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor Starborn01REF = Alias_Starborn01.GetActorRef() ; #DEBUG_LINE_NO:113
  Starborn01REF.Enable(False) ; #DEBUG_LINE_NO:115
  Starborn01REF.MoveTo(Alias_ArtifactRoomSpawnMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:116
  MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:126
  If Self.GetStageDone(40) == True ; #DEBUG_LINE_NO:129
    Self.SetStage(100) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference Artifact01REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(8, MQ201ArtifactSpawnMarker01) ; #DEBUG_LINE_NO:134
  Alias_ArtifactQuestObject01.ForceRefTo(Artifact01REF) ; #DEBUG_LINE_NO:135
  Artifact01REF.Enable(False) ; #DEBUG_LINE_NO:136
  Game.GetPlayer().additem(Artifact01REF as Form, 1, False) ; #DEBUG_LINE_NO:137
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(8) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0032_Item_00()
  Self.SetObjectiveCompleted(22, True) ; #DEBUG_LINE_NO:148
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0034_Item_00()
  Self.SetObjectiveCompleted(24, True) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0035_Item_00()
  Actor Starborn02REF = Alias_Starborn02.GetActorRef() ; #DEBUG_LINE_NO:166
  Starborn02REF.Enable(False) ; #DEBUG_LINE_NO:168
  Starborn02REF.MoveTo(Alias_ArtifactRoomSpawnMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:169
  MUSGenesisStingerStarbornAppearB.Add() ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:180
  If Self.GetStageDone(30) == True ; #DEBUG_LINE_NO:183
    Self.SetStage(100) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference Artifact02REF = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(9, MQ201ArtifactSpawnMarker02) ; #DEBUG_LINE_NO:188
  Alias_ArtifactQuestObject02.ForceRefTo(Artifact02REF) ; #DEBUG_LINE_NO:189
  Artifact02REF.Enable(False) ; #DEBUG_LINE_NO:190
  Game.GetPlayer().additem(Artifact02REF as Form, 1, False) ; #DEBUG_LINE_NO:191
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(9) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:202
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:203
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:205
  ArmillaryMountSwapEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ204_002_ReturnScene.Start() ; #DEBUG_LINE_NO:216
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:218
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0115_Item_00()
  MQCompanionLockedBailoutMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:235
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:244
  MQ201B.SetStageNoWait(10) ; #DEBUG_LINE_NO:246
  Game.AddAchievement(5) ; #DEBUG_LINE_NO:249
  Self.Stop() ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:259
  Game.AddAchievement(5) ; #DEBUG_LINE_NO:262
  Self.Stop() ; #DEBUG_LINE_NO:264
EndFunction
