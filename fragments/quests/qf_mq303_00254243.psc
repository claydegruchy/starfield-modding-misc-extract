ScriptName Fragments:Quests:QF_MQ303_00254243 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HunterArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_HunterArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property StarbornTempleQuest Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker01 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker02 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker03 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker04 Auto Const mandatory
ObjectReference Property MQ303ArtifactSpawnMarker05 Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Quest Property MQ304 Auto Const mandatory
ObjectReference Property MQ202ArtifactSpawnMarker Auto Const mandatory
ReferenceAlias Property MQ202ArtifactHolder Auto Const
Quest Property MQ404 Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_MQ302B_Hunter Auto Const mandatory
Weapon Property Rocketlauncher Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Ammo Property Ammo20mmXPL Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:7
  ObjectReference ArtifactREF01 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(14, MQ303ArtifactSpawnMarker01) ; #DEBUG_LINE_NO:10
  Alias_HunterArtifact01.ForceRefTo(ArtifactREF01) ; #DEBUG_LINE_NO:11
  ArtifactREF01.Enable(False) ; #DEBUG_LINE_NO:12
  HunterREF.additem(ArtifactREF01 as Form, 1, False) ; #DEBUG_LINE_NO:13
  ObjectReference ArtifactREF02 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(15, MQ303ArtifactSpawnMarker02) ; #DEBUG_LINE_NO:15
  Alias_HunterArtifact02.ForceRefTo(ArtifactREF02) ; #DEBUG_LINE_NO:16
  ArtifactREF02.Enable(False) ; #DEBUG_LINE_NO:17
  HunterREF.additem(ArtifactREF02 as Form, 1, False) ; #DEBUG_LINE_NO:18
  ObjectReference ArtifactREF03 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(16, MQ303ArtifactSpawnMarker03) ; #DEBUG_LINE_NO:20
  Alias_HunterArtifact03.ForceRefTo(ArtifactREF03) ; #DEBUG_LINE_NO:21
  ArtifactREF03.Enable(False) ; #DEBUG_LINE_NO:22
  HunterREF.additem(ArtifactREF03 as Form, 1, False) ; #DEBUG_LINE_NO:23
  ObjectReference ArtifactREF04 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(17, MQ303ArtifactSpawnMarker04) ; #DEBUG_LINE_NO:25
  Alias_HunterArtifact04.ForceRefTo(ArtifactREF04) ; #DEBUG_LINE_NO:26
  ArtifactREF04.Enable(False) ; #DEBUG_LINE_NO:27
  HunterREF.additem(ArtifactREF04 as Form, 1, False) ; #DEBUG_LINE_NO:28
  ObjectReference ArtifactREF05 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(18, MQ303ArtifactSpawnMarker05) ; #DEBUG_LINE_NO:30
  Alias_HunterArtifact05.ForceRefTo(ArtifactREF05) ; #DEBUG_LINE_NO:31
  ArtifactREF05.Enable(False) ; #DEBUG_LINE_NO:32
  HunterREF.additem(ArtifactREF05 as Form, 1, False) ; #DEBUG_LINE_NO:33
  If MQ404.GetStageDone(200) ; #DEBUG_LINE_NO:36
    ObjectReference ArtifactREF10 = (StarbornTempleQuest as starborntemplequestscript).PlaceArtifact(10, MQ202ArtifactSpawnMarker) ; #DEBUG_LINE_NO:37
    MQ202ArtifactHolder.ForceRefTo(ArtifactREF10) ; #DEBUG_LINE_NO:38
    ArtifactREF10.Enable(False) ; #DEBUG_LINE_NO:39
    HunterREF.additem(ArtifactREF10 as Form, 1, False) ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(136) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:51
  PlayerREF.additem(Alias_HunterArtifact01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:52
  PlayerREF.additem(Alias_HunterArtifact02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:53
  PlayerREF.additem(Alias_HunterArtifact03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:54
  PlayerREF.additem(Alias_HunterArtifact04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:55
  PlayerREF.additem(Alias_HunterArtifact05.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0131_Item_00()
  If Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:65
    Self.SetStage(200) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(14) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0132_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:79
    Self.SetStage(200) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(15) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0133_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(134) && Self.GetStageDone(135) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:93
    Self.SetStage(200) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(16) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0134_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(135) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:107
    Self.SetStage(200) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(17) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0135_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(136) ; #DEBUG_LINE_NO:121
    Self.SetStage(200) ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(18) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0136_Item_00()
  If Self.GetStageDone(131) && Self.GetStageDone(132) && Self.GetStageDone(133) && Self.GetStageDone(134) && Self.GetStageDone(135) ; #DEBUG_LINE_NO:135
    Self.SetStage(200) ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
  (StarbornTempleQuest as starborntemplequestscript).SetPlayerAcquiredArtifact(10) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0137_Item_00()
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:149
    Self.SetStage(210) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:159
  PlayerREF.additem(Alias_HunterArtifact01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:160
  PlayerREF.additem(Alias_HunterArtifact02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:161
  PlayerREF.additem(Alias_HunterArtifact03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:162
  PlayerREF.additem(Alias_HunterArtifact04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:163
  PlayerREF.additem(Alias_HunterArtifact05.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:164
  If MQ404.GetStageDone(200) ; #DEBUG_LINE_NO:165
    PlayerREF.additem(MQ202ArtifactHolder.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:166
  EndIf ; #DEBUG_LINE_NO:
  MQ302b.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:177
  MQ302b.SetObjectiveCompleted(230, True) ; #DEBUG_LINE_NO:180
  If MQ304.GetStageDone(200) ; #DEBUG_LINE_NO:182
    MQ302b.SetStage(1280) ; #DEBUG_LINE_NO:183
  EndIf ; #DEBUG_LINE_NO:
  If HunterREF.IsDead() ; #DEBUG_LINE_NO:186
    If Self.GetStageDone(137) ; #DEBUG_LINE_NO:188
      Self.SetStage(210) ; #DEBUG_LINE_NO:189
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:192
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:201
  HunterREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:203
  AbStarbornDeath.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference) ; #DEBUG_LINE_NO:204
  FortifyQuantumEssenceSpell.Cast(HunterREF as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:207
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:208
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:210
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:211
  Self.Stop() ; #DEBUG_LINE_NO:213
EndFunction
