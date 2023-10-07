ScriptName Fragments:Quests:QF_MQ304_002514C1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Artifact01 Auto Const mandatory
ReferenceAlias Property Alias_Artifact02 Auto Const mandatory
ReferenceAlias Property Alias_Artifact03 Auto Const mandatory
ReferenceAlias Property Alias_Artifact04 Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
GlobalVariable Property MQ106_SurrenderedArtifact Auto Const mandatory
ReferenceAlias Property Alias_MQ105_ArtifactHolder Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker02 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker03 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker04 Auto Const mandatory
ObjectReference Property MQ304ArtifactSpawnMarker05 Auto Const mandatory
ObjectReference Property MQ105ArtifactSpawnMarker Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Weapon Property InflictorRifle Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Ammo Property AmmoParticleFuseHeavy Auto Const mandatory
Weapon Property FragGrenade Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:7
  If MQ106_SurrenderedArtifact.GetValueInt() >= 1 ; #DEBUG_LINE_NO:10
    ObjectReference ArtifactREF06 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(7, MQ105ArtifactSpawnMarker) ; #DEBUG_LINE_NO:11
    Alias_MQ105_ArtifactHolder.ForceRefTo(ArtifactREF06) ; #DEBUG_LINE_NO:12
    ArtifactREF06.Enable(False) ; #DEBUG_LINE_NO:13
    EmissaryREF.additem(ArtifactREF06 as Form, 1, False) ; #DEBUG_LINE_NO:14
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(136) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(19, MQ304ArtifactSpawnMarker01) ; #DEBUG_LINE_NO:20
  Alias_Artifact01.ForceRefTo(ArtifactREF01) ; #DEBUG_LINE_NO:21
  ArtifactREF01.Enable(False) ; #DEBUG_LINE_NO:22
  EmissaryREF.additem(ArtifactREF01 as Form, 1, False) ; #DEBUG_LINE_NO:23
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(20, MQ304ArtifactSpawnMarker02) ; #DEBUG_LINE_NO:25
  Alias_Artifact02.ForceRefTo(ArtifactREF02) ; #DEBUG_LINE_NO:26
  ArtifactREF02.Enable(False) ; #DEBUG_LINE_NO:27
  EmissaryREF.additem(ArtifactREF02 as Form, 1, False) ; #DEBUG_LINE_NO:28
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(21, MQ304ArtifactSpawnMarker03) ; #DEBUG_LINE_NO:30
  Alias_Artifact03.ForceRefTo(ArtifactREF03) ; #DEBUG_LINE_NO:31
  ArtifactREF03.Enable(False) ; #DEBUG_LINE_NO:32
  EmissaryREF.additem(ArtifactREF03 as Form, 1, False) ; #DEBUG_LINE_NO:33
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(22, MQ304ArtifactSpawnMarker04) ; #DEBUG_LINE_NO:35
  Alias_Artifact04.ForceRefTo(ArtifactREF04) ; #DEBUG_LINE_NO:36
  ArtifactREF04.Enable(False) ; #DEBUG_LINE_NO:37
  EmissaryREF.additem(ArtifactREF04 as Form, 1, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:47
    Self.SetStage(200) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(19) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:61
    Self.SetStage(200) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(20) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(134) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:75
    Self.SetStage(200) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(21) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:89
    Self.SetStage(200) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(22) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0136_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) ; #DEBUG_LINE_NO:103
    Self.SetStage(200) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0137_Item_00()
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:113
    Self.SetStage(210) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:123
  PlayerREF.additem(Alias_Artifact01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:124
  PlayerREF.additem(Alias_Artifact02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:125
  PlayerREF.additem(Alias_Artifact03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:126
  PlayerREF.additem(Alias_Artifact04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:127
  If MQ106_SurrenderedArtifact.GetValueInt() >= 1 ; #DEBUG_LINE_NO:128
    PlayerREF.additem(Alias_MQ105_ArtifactHolder.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  MQ302b.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:140
  MQ302b.SetObjectiveCompleted(240, True) ; #DEBUG_LINE_NO:143
  If MQ303.GetStageDone(200) ; #DEBUG_LINE_NO:145
    MQ302b.SetStage(1280) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  If EmissaryREF.IsDead() ; #DEBUG_LINE_NO:150
    If Self.GetStageDone(137) ; #DEBUG_LINE_NO:151
      Self.SetStage(210) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:164
  EmissaryREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:167
  AbStarbornDeath.Cast(EmissaryREF as ObjectReference, EmissaryREF as ObjectReference) ; #DEBUG_LINE_NO:168
  FortifyQuantumEssenceSpell.Cast(EmissaryREF as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:170
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:171
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:173
  EmissaryREF.Disable(False) ; #DEBUG_LINE_NO:174
  Self.Stop() ; #DEBUG_LINE_NO:176
EndFunction
