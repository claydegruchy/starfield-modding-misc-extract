ScriptName Fragments:Quests:QF_MQ401h_00045F9F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifaceDataSlate Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_OtherPlayer Auto Const mandatory
Scene Property MQ401H_002_OutroScene Auto Const mandatory
ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
wwiseevent Property QST_MQ401_Magshear_SingleShot Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor AndrejaREF = Alias_OtherPlayer.GetActorRef() ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:9
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:11
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:13
  If MQ402.IsRunning() == False ; #DEBUG_LINE_NO:16
    MQ402.Start() ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
  (MQ402 as mq402script).AddLodgeArtifacts(AndrejaREF) ; #DEBUG_LINE_NO:21
  (AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False) ; #DEBUG_LINE_NO:22
  MQ204LodgeAttackClutterEnableMarker.Enable(False) ; #DEBUG_LINE_NO:25
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:27
  Self.SetActive(True) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:38
  MQ401c_001_IntroScene.Start() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0105_Item_00()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef() ; #DEBUG_LINE_NO:48
  OtherPlayerREF.Enable(False) ; #DEBUG_LINE_NO:50
  Actor SarahREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:52
  QST_MQ401_Magshear_SingleShot.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:53
  SarahREF.KillEssential(None) ; #DEBUG_LINE_NO:54
  MQ401H_002_OutroScene.Start() ; #DEBUG_LINE_NO:56
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:67
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:68
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:70
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef() ; #DEBUG_LINE_NO:71
  OtherPlayerREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:73
  OtherPlayerREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:74
  OtherPlayerREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:75
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0 ; #DEBUG_LINE_NO:78
    PlayerREF.additem(LodgeKey as Form, 1, True) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:88
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ402.SetStage(100) ; #DEBUG_LINE_NO:97
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:99
    Self.SetStage(1000) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0220_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:109
    Self.SetStage(1000) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(210) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:119
    Self.SetStage(1000) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(210) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:129
    Self.SetStage(1000) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(210) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:139
    Self.SetStage(1000) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(210) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:149
    Self.SetStage(1000) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(210) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:159
    Self.SetStage(1000) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:169
    Self.SetStage(1000) ; #DEBUG_LINE_NO:170
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(210) ; #DEBUG_LINE_NO:179
    Self.SetStage(1000) ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:189
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:191
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0 ; #DEBUG_LINE_NO:192
    PlayerREF.additem(LodgeKey as Form, 1, True) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:195
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:197
  Self.Stop() ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_2000_Item_00()
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef() ; #DEBUG_LINE_NO:207
  OtherPlayerREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:209
  ffStarbornDeath.Cast(OtherPlayerREF as ObjectReference, OtherPlayerREF as ObjectReference) ; #DEBUG_LINE_NO:210
  FortifyQuantumEssenceSpell.Cast(OtherPlayerREF as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:213
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:214
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:216
  OtherPlayerREF.Disable(False) ; #DEBUG_LINE_NO:217
EndFunction
