ScriptName Fragments:Quests:QF_OE_MP_HuntedHomesteaders_000F3D39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property REPlayerAlly Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
RefCollectionAlias Property Alias_Homesteaders Auto Const mandatory
ReferenceAlias Property Alias_Leader Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(25) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
  Alias_Homesteaders.EnableAll(False) ; #DEBUG_LINE_NO:17
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:18
  Alias_PredatorGroup.EnableAll(False) ; #DEBUG_LINE_NO:20
  Self.SetStage(50) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference LeaderRef = Alias_Leader.GetRef() ; #DEBUG_LINE_NO:30
  ObjectReference ContainerRef = Alias_RewardContainer.GetRef() ; #DEBUG_LINE_NO:31
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:32
  Int LockLevel = 0 ; #DEBUG_LINE_NO:33
  If PlayerLevel > 100 ; #DEBUG_LINE_NO:35
    LockLevel = 100 ; #DEBUG_LINE_NO:36
  ElseIf PlayerLevel > 75 ; #DEBUG_LINE_NO:37
    LockLevel = 75 ; #DEBUG_LINE_NO:38
  ElseIf PlayerLevel > 50 ; #DEBUG_LINE_NO:39
    LockLevel = 50 ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    LockLevel = 25 ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  ContainerRef.Lock(True, True, True) ; #DEBUG_LINE_NO:45
  ContainerRef.SetLockLevel(LockLevel) ; #DEBUG_LINE_NO:46
  LeaderRef.AddKeyIfNeeded(ContainerRef) ; #DEBUG_LINE_NO:47
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:49
  Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0075_Item_00()
  Int SceneTheme = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:58
  If SceneTheme == 1 ; #DEBUG_LINE_NO:60
    Self.SetStage(110) ; #DEBUG_LINE_NO:61
  ElseIf SceneTheme == 2 ; #DEBUG_LINE_NO:62
    Self.SetStage(120) ; #DEBUG_LINE_NO:63
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(100) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:68
  Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !Self.GetStageDone(25) ; #DEBUG_LINE_NO:77
    Self.SetStage(25) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:81
    Self.SetStage(50) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(75) ; #DEBUG_LINE_NO:85
    Self.SetStage(75) ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:105
  oe_huntedhomesteaders_questscript kmyQuest = __temp as oe_huntedhomesteaders_questscript ; #DEBUG_LINE_NO:106
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:110
  Alias_Leader.TryToAddToFaction(REPlayerAlly) ; #DEBUG_LINE_NO:112
  Alias_Homesteaders.AddToFaction(REPlayerAlly) ; #DEBUG_LINE_NO:113
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:114
  Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:115
  Self.SetStage(250) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0225_Item_00()
  Self.SetStage(250) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:133
  oe_huntedhomesteaders_questscript kmyQuest = __temp as oe_huntedhomesteaders_questscript ; #DEBUG_LINE_NO:134
  kmyQuest.StartWaitTimer() ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:146
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:147
  Alias_PredatorGroup.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:149
  Alias_PredatorGroup.EvaluateAll() ; #DEBUG_LINE_NO:150
  Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:152
  Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:161
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:162
  Self.SetStage(900) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:171
    If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:172
      Self.SetStage(999) ; #DEBUG_LINE_NO:173
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:176
      Self.SetStage(940) ; #DEBUG_LINE_NO:177
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(820) ; #DEBUG_LINE_NO:180
      Self.SetStage(999) ; #DEBUG_LINE_NO:181
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:193
    If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:194
      Self.SetStage(999) ; #DEBUG_LINE_NO:195
    ElseIf Self.IsObjectiveDisplayed(900) ; #DEBUG_LINE_NO:196
      Self.SetStage(940) ; #DEBUG_LINE_NO:197
    ElseIf Self.GetStageDone(810) ; #DEBUG_LINE_NO:198
      If Self.GetStageDone(700) ; #DEBUG_LINE_NO:199
        Self.SetStage(940) ; #DEBUG_LINE_NO:200
      Else ; #DEBUG_LINE_NO:
        Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:202
        Self.SetObjectiveSkipped(300) ; #DEBUG_LINE_NO:203
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:207
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0825_Item_00()
  If !Self.GetStageDone(810) ; #DEBUG_LINE_NO:216
    Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:217
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(810) ; #DEBUG_LINE_NO:227
    If Self.GetStageDone(820) ; #DEBUG_LINE_NO:228
      Self.SetStage(940) ; #DEBUG_LINE_NO:229
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(910, True, False) ; #DEBUG_LINE_NO:231
      Alias_Homesteaders.EvaluateAll() ; #DEBUG_LINE_NO:232
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:235
    Alias_Leader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:236
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0910_Item_00()
  If Self.GetStageDone(810) ; #DEBUG_LINE_NO:245
    If Self.GetStageDone(820) ; #DEBUG_LINE_NO:246
      Self.SetStage(940) ; #DEBUG_LINE_NO:247
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(930) ; #DEBUG_LINE_NO:249
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0920_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:259
  ObjectReference ContainerRef = Alias_RewardContainer.GetRef() ; #DEBUG_LINE_NO:260
  ContainerRef.Lock(True, False, True) ; #DEBUG_LINE_NO:262
  ContainerRef.SetLockLevel(25) ; #DEBUG_LINE_NO:263
  PlayerRef.AddKeyIfNeeded(ContainerRef) ; #DEBUG_LINE_NO:264
  Self.SetStage(950) ; #DEBUG_LINE_NO:266
  Self.SetStage(930) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0930_Item_00()
  Self.SetStage(940) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0940_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:283
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:291
  Self.SetStage(999) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:300
  Self.Stop() ; #DEBUG_LINE_NO:301
EndFunction
