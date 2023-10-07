ScriptName Fragments:Quests:QF_OE_PredatorsVsGuard_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship Auto Const mandatory
ReferenceAlias Property Alias_Ship_Door Auto Const mandatory
MiscObject Property Credits Auto Const
Potion Property Aid_MedPack Auto Const mandatory
Potion Property MedPack Auto Const mandatory
ReferenceAlias Property Alias_NPC Auto Const mandatory
ReferenceAlias Property Alias_Ambush_HardSpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_RegularSpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_EasySpawn Auto Const mandatory
RefCollectionAlias Property Alias_Ambush_Bonus Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
GlobalVariable Property SQ_WoundedState_0_Unset Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory
ActorValue Property SQ_WoundedState Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Ambush_EasySpawn.DisableAll(False) ; #DEBUG_LINE_NO:15
  Alias_Ambush_RegularSpawn.DisableAll(False) ; #DEBUG_LINE_NO:16
  Alias_Ambush_Bonus.DisableAll(False) ; #DEBUG_LINE_NO:17
  Alias_Ambush_HardSpawn.GetRef().Disable(False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(60) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0060_Item_00()
  ObjectReference Marker = Alias_WoundedMarker.GetRef() ; #DEBUG_LINE_NO:34
  Actor NPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:35
  NPC.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue()) ; #DEBUG_LINE_NO:37
  NPC.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  NPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:39
  NPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1.0) ; #DEBUG_LINE_NO:40
  NPC.SetProtected(True) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0160_Item_00()
  Alias_NPC.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0185_Item_00()
  Game.GetPlayer().RemoveItem(MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:73
  Self.SetStage(180) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0190_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor aNPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:90
  Self.SetStage(210) ; #DEBUG_LINE_NO:92
  aNPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:93
  aNPC.SetProtected(True) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0210_Item_00()
  (Alias_NPC as defaultcaptivewoundedalias).HealActor(True) ; #DEBUG_LINE_NO:104
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0250_Item_00()
  Int EncounterPoints = 3 ; #DEBUG_LINE_NO:113
  If Self.GetStageDone(160) ; #DEBUG_LINE_NO:115
    If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:116
      EncounterPoints += 3 ; #DEBUG_LINE_NO:117
    Else ; #DEBUG_LINE_NO:
      EncounterPoints += 1 ; #DEBUG_LINE_NO:119
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    EncounterPoints -= 1 ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(170) ; #DEBUG_LINE_NO:125
    EncounterPoints += 2 ; #DEBUG_LINE_NO:126
  Else ; #DEBUG_LINE_NO:
    EncounterPoints -= 1 ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().GetLevel() > 100 ; #DEBUG_LINE_NO:131
    EncounterPoints += 6 ; #DEBUG_LINE_NO:132
  ElseIf Game.GetPlayer().GetLevel() > 75 ; #DEBUG_LINE_NO:133
    EncounterPoints += 3 ; #DEBUG_LINE_NO:134
  ElseIf Game.GetPlayer().GetLevel() > 50 ; #DEBUG_LINE_NO:135
    EncounterPoints += 2 ; #DEBUG_LINE_NO:136
  ElseIf Game.GetPlayer().GetLevel() > 25 ; #DEBUG_LINE_NO:137
    EncounterPoints += 1 ; #DEBUG_LINE_NO:138
  Else ; #DEBUG_LINE_NO:
    EncounterPoints -= 1 ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(5, 10) ; #DEBUG_LINE_NO:143
    Self.SetStage(270) ; #DEBUG_LINE_NO:144
  ElseIf EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:145
    Self.SetStage(265) ; #DEBUG_LINE_NO:146
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(260) ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > 5 ; #DEBUG_LINE_NO:151
    Self.SetStage(275) ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_Ambush_EasySpawn.EnableAll(False) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0265_Item_00()
  Alias_Ambush_RegularSpawn.EnableAll(False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0270_Item_00()
  Alias_Ambush_HardSpawn.GetRef().Enable(False) ; #DEBUG_LINE_NO:177
  Self.SetStage(260) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0275_Item_00()
  Alias_Ambush_Bonus.EnableAll(False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:196
  Self.SetStage(350) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0350_Item_00()
  Actor aNPC = Alias_NPC.GetActorRef() ; #DEBUG_LINE_NO:205
  aNPC.EvaluatePackage(False) ; #DEBUG_LINE_NO:207
  aNPC.SetProtected(False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0505_Item_00()
  Alias_NPC.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:224
  Self.SetStage(990) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0515_Item_00()
  Self.SetStage(505) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0525_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:241
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:253
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:254
  If !Self.GetStageDone(600) ; #DEBUG_LINE_NO:257
    kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:258
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(995) ; #DEBUG_LINE_NO:267
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(600) ; #DEBUG_LINE_NO:275
    Self.SetStage(810) ; #DEBUG_LINE_NO:276
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:278
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetStage(820) ; #DEBUG_LINE_NO:287
EndFunction

Function Fragment_Stage_0950_Item_00()
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:295
    Self.SetStage(990) ; #DEBUG_LINE_NO:296
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(995) ; #DEBUG_LINE_NO:298
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0990_Item_00()
  Bool NPCisAlive = !Self.GetStageDone(600) ; #DEBUG_LINE_NO:307
  Bool PlayerNeedsReward = !Self.GetStageDone(800) ; #DEBUG_LINE_NO:308
  If PlayerNeedsReward && NPCisAlive ; #DEBUG_LINE_NO:310
    Self.SetStage(800) ; #DEBUG_LINE_NO:311
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:322
EndFunction

Function Fragment_Stage_0999_Item_00()
  SQ_Followers.SetRoleInActive(Alias_NPC.GetActorRef(), True, False, True) ; #DEBUG_LINE_NO:330
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:340
  oe_austinf_pvg_script kmyQuest = __temp as oe_austinf_pvg_script ; #DEBUG_LINE_NO:341
EndFunction
