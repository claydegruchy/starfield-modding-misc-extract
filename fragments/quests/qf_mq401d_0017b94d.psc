ScriptName Fragments:Quests:QF_MQ401d_0017B94D Extends Quest Const hidden

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
ReferenceAlias Property Alias_Zealot02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Zealot01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot03 Auto Const mandatory
ReferenceAlias Property Alias_Zealot04 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact07 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact08 Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript ; #DEBUG_LINE_NO:8
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:11
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:13
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:15
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:17
  kmyQuest.EnableQuestActors() ; #DEBUG_LINE_NO:19
  If MQ402.IsRunning() == False ; #DEBUG_LINE_NO:22
    MQ402.Start() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  (MQ402 as mq402script).AddLodgeArtifacts(AndrejaREF) ; #DEBUG_LINE_NO:27
  (AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False) ; #DEBUG_LINE_NO:28
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:30
  Self.SetActive(True) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:41
  MQ401c_001_IntroScene.Start() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:52
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:54
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:55
  Actor Zealot01REF = Alias_Zealot01.GetActorRef() ; #DEBUG_LINE_NO:56
  Actor Zealot02REF = Alias_Zealot02.GetActorRef() ; #DEBUG_LINE_NO:57
  Actor Zealot03REF = Alias_Zealot03.GetActorRef() ; #DEBUG_LINE_NO:58
  Actor Zealot04REF = Alias_Zealot04.GetActorRef() ; #DEBUG_LINE_NO:59
  AndrejaREF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:61
  AndrejaREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:62
  AndrejaREF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:63
  Zealot01REF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:65
  Zealot01REF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:66
  Zealot01REF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:67
  Zealot02REF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:69
  Zealot02REF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:70
  Zealot02REF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:71
  Zealot03REF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:73
  Zealot03REF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:74
  Zealot03REF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:75
  Zealot04REF.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:77
  Zealot04REF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:78
  Zealot04REF.StartCombat(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:79
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0 ; #DEBUG_LINE_NO:82
    PlayerREF.additem(LodgeKey as Form, 1, True) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.setstage(110) ; #DEBUG_LINE_NO:92
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(160) ; #DEBUG_LINE_NO:94
    Self.setstage(200) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.setstage(110) ; #DEBUG_LINE_NO:104
  If Self.GetStageDone(120) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(160) ; #DEBUG_LINE_NO:106
    Self.setstage(200) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.setstage(110) ; #DEBUG_LINE_NO:116
  If Self.GetStageDone(130) && Self.GetStageDone(120) && Self.GetStageDone(150) && Self.GetStageDone(160) ; #DEBUG_LINE_NO:118
    Self.setstage(200) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.setstage(110) ; #DEBUG_LINE_NO:128
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(120) && Self.GetStageDone(160) ; #DEBUG_LINE_NO:130
    Self.setstage(200) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.setstage(110) ; #DEBUG_LINE_NO:140
  If Self.GetStageDone(130) && Self.GetStageDone(140) && Self.GetStageDone(150) && Self.GetStageDone(120) ; #DEBUG_LINE_NO:142
    Self.setstage(200) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:152
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0210_Item_00()
  MQ402.setstage(100) ; #DEBUG_LINE_NO:161
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:163
    Self.setstage(1000) ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0220_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:173
    Self.setstage(1000) ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0230_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:183
    Self.setstage(1000) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0240_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:193
    Self.setstage(1000) ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:203
    Self.setstage(1000) ; #DEBUG_LINE_NO:204
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(270) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:213
    Self.setstage(1000) ; #DEBUG_LINE_NO:214
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(210) && Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(280) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:223
    Self.setstage(1000) ; #DEBUG_LINE_NO:224
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(290) ; #DEBUG_LINE_NO:233
    Self.setstage(1000) ; #DEBUG_LINE_NO:234
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0290_Item_00()
  If Self.GetStageDone(220) && Self.GetStageDone(230) && Self.GetStageDone(240) && Self.GetStageDone(250) && Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(210) && Self.GetStageDone(280) ; #DEBUG_LINE_NO:243
    Self.setstage(1000) ; #DEBUG_LINE_NO:244
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:253
  PlayerREF.additem(Alias_ArtifaceDataSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:254
  PlayerREF.additem(Alias_LodgeArtifact01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:255
  PlayerREF.additem(Alias_LodgeArtifact02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:256
  PlayerREF.additem(Alias_LodgeArtifact03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:257
  PlayerREF.additem(Alias_LodgeArtifact04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:258
  PlayerREF.additem(Alias_LodgeArtifact05.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:259
  PlayerREF.additem(Alias_LodgeArtifact06.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:260
  PlayerREF.additem(Alias_LodgeArtifact07.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:261
  PlayerREF.additem(Alias_LodgeArtifact08.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:262
  Self.setstage(1000) ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:272
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:274
  If PlayerREF.GetItemCount(LodgeKey as Form) == 0 ; #DEBUG_LINE_NO:275
    PlayerREF.additem(LodgeKey as Form, 1, True) ; #DEBUG_LINE_NO:276
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:278
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:280
EndFunction
