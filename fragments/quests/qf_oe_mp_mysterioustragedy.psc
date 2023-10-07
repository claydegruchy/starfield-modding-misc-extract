ScriptName Fragments:Quests:QF_OE_MP_MysteriousTragedy Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PCM_TerrormorphEncountersAllowed Auto Const mandatory
ReferenceAlias Property Alias_Note Auto Const mandatory
GlobalVariable Property UC09_Result Auto Const mandatory
Perk Property BackgroundBigGameHunter Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_Enemy Auto Const mandatory
ReferenceAlias Property Alias_ApexPredator Auto Const mandatory
ReferenceAlias Property Alias_Predator Auto Const mandatory
ReferenceAlias[] Property Alias_Predators Auto Const mandatory
RefCollectionAlias Property Alias_Enemies Auto Const
RefCollectionAlias Property Alias_Critters Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse00 Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse01 Auto Const mandatory
ReferenceAlias Property Alias_Predator_Corpse02 Auto Const mandatory
ReferenceAlias Property Alias_ApexPredator_Corpse Auto Const mandatory
ReferenceAlias Property Alias_EnemyCorpse00 Auto Const mandatory
ReferenceAlias Property Alias_EnemyCorpse01 Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:7
  Int EncounterPoints = Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:8
  If PlayerLevel > 200 ; #DEBUG_LINE_NO:10
    EncounterPoints += 10 ; #DEBUG_LINE_NO:11
  ElseIf PlayerLevel > 100 ; #DEBUG_LINE_NO:12
    EncounterPoints += 5 ; #DEBUG_LINE_NO:13
  ElseIf PlayerLevel > 75 ; #DEBUG_LINE_NO:14
    EncounterPoints += 4 ; #DEBUG_LINE_NO:15
  ElseIf PlayerLevel > 50 ; #DEBUG_LINE_NO:16
    EncounterPoints += 3 ; #DEBUG_LINE_NO:17
  ElseIf PlayerLevel > 25 ; #DEBUG_LINE_NO:18
    EncounterPoints += 2 ; #DEBUG_LINE_NO:19
  ElseIf PlayerLevel > 15 ; #DEBUG_LINE_NO:20
    EncounterPoints += 1 ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:24
    EncounterPoints += 4 ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundExplorer) ; #DEBUG_LINE_NO:28
    EncounterPoints += 2 ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:33
    Self.SetStage(20) ; #DEBUG_LINE_NO:34
    EncounterPoints -= 5 ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    Alias_Enemy.TryToDisable() ; #DEBUG_LINE_NO:37
    Alias_Enemies.DisableAll(False) ; #DEBUG_LINE_NO:38
    EncounterPoints += 2 ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:43
    Self.SetStage(30) ; #DEBUG_LINE_NO:44
    EncounterPoints -= 1 ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    Alias_EnemyCorpse00.TryToDisable() ; #DEBUG_LINE_NO:47
    Alias_EnemyCorpse01.TryToDisable() ; #DEBUG_LINE_NO:48
    EncounterPoints += 1 ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:53
    Self.SetStage(50) ; #DEBUG_LINE_NO:54
    EncounterPoints -= 2 ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:58
    Self.SetStage(60) ; #DEBUG_LINE_NO:59
    EncounterPoints -= 1 ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:63
    Self.SetStage(70) ; #DEBUG_LINE_NO:64
    EncounterPoints -= 3 ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  If EncounterPoints < 3 ; #DEBUG_LINE_NO:69
    Self.SetStage(150) ; #DEBUG_LINE_NO:70
    Self.SetStage(80) ; #DEBUG_LINE_NO:71
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(350) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Enemy.TryToEnable() ; #DEBUG_LINE_NO:82
  Alias_Enemies.EnableAll(False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0040_Item_00()
  If !Self.GetStageDone(10) ; #DEBUG_LINE_NO:91
    Self.SetStage(10) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ApexPredator_Corpse.TryToEnable() ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0060_Item_00()
  Int numToSpawn = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:109
  Alias_Predator_Corpse00.TryToEnable() ; #DEBUG_LINE_NO:111
  If numToSpawn > 1 ; #DEBUG_LINE_NO:113
    Alias_Predator_Corpse01.TryToEnable() ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
  If numToSpawn > 2 ; #DEBUG_LINE_NO:117
    Alias_Predator_Corpse02.TryToEnable() ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_RewardContainer.TryToEnable() ; #DEBUG_LINE_NO:127
  Alias_RewardContainer.GetRef().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:128
  Alias_RewardContainer.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !Self.GetStageDone(10) ; #DEBUG_LINE_NO:137
    Self.SetStage(10) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(40) ; #DEBUG_LINE_NO:142
    If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:143
      Self.SetStage(150) ; #DEBUG_LINE_NO:144
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(20) ; #DEBUG_LINE_NO:148
    Self.SetStage(110) ; #DEBUG_LINE_NO:149
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Enemy.GetActorRef().AddItem(Alias_Note.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0125_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:167
    Self.SetStage(200) ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:177
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:178
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0200_Item_00()
  Bool apexAllowed = Alias_ApexPredator.GetRef() == None ; #DEBUG_LINE_NO:189
  apexAllowed = !apexAllowed ; #DEBUG_LINE_NO:189
  Bool predatorsAllowed = Alias_Predator.GetRef() == None ; #DEBUG_LINE_NO:190
  predatorsAllowed = !predatorsAllowed ; #DEBUG_LINE_NO:190
  Bool terrormorphAllowed = Alias_Trigger.GetRef().GetCurrentPlanet().HasKeyword(PCM_TerrormorphEncountersAllowed) ; #DEBUG_LINE_NO:191
  Int EncounterPoints = Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:192
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:193
  If PlayerLevel > 200 ; #DEBUG_LINE_NO:195
    EncounterPoints += 10 ; #DEBUG_LINE_NO:196
  ElseIf PlayerLevel > 100 ; #DEBUG_LINE_NO:197
    EncounterPoints += 5 ; #DEBUG_LINE_NO:198
  ElseIf PlayerLevel > 75 ; #DEBUG_LINE_NO:199
    EncounterPoints += 4 ; #DEBUG_LINE_NO:200
  ElseIf PlayerLevel > 50 ; #DEBUG_LINE_NO:201
    EncounterPoints += 3 ; #DEBUG_LINE_NO:202
  ElseIf PlayerLevel > 25 ; #DEBUG_LINE_NO:203
    EncounterPoints += 2 ; #DEBUG_LINE_NO:204
  ElseIf PlayerLevel > 15 ; #DEBUG_LINE_NO:205
    EncounterPoints += 1 ; #DEBUG_LINE_NO:206
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:209
    EncounterPoints += 4 ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundExplorer) ; #DEBUG_LINE_NO:213
    EncounterPoints += 2 ; #DEBUG_LINE_NO:214
  EndIf ; #DEBUG_LINE_NO:
  If PlayerLevel < 25 ; #DEBUG_LINE_NO:217
    If Self.GetStageDone(20) ; #DEBUG_LINE_NO:218
      EncounterPoints -= 3 ; #DEBUG_LINE_NO:219
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(30) ; #DEBUG_LINE_NO:222
      EncounterPoints -= 2 ; #DEBUG_LINE_NO:223
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(50) || Self.GetStageDone(60) || Self.GetStageDone(70) ; #DEBUG_LINE_NO:226
      EncounterPoints -= 1 ; #DEBUG_LINE_NO:227
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(20) ; #DEBUG_LINE_NO:230
    EncounterPoints -= 2 ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  If terrormorphAllowed ; #DEBUG_LINE_NO:236
    If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:237
      Self.SetStage(310) ; #DEBUG_LINE_NO:238
      EncounterPoints -= 5 ; #DEBUG_LINE_NO:239
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If apexAllowed ; #DEBUG_LINE_NO:244
    If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:245
      Self.SetStage(320) ; #DEBUG_LINE_NO:246
      EncounterPoints -= 4 ; #DEBUG_LINE_NO:247
    EndIf ; #DEBUG_LINE_NO:
  ElseIf predatorsAllowed ; #DEBUG_LINE_NO:
    If EncounterPoints > Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:250
      Self.SetStage(330) ; #DEBUG_LINE_NO:251
      EncounterPoints -= 2 ; #DEBUG_LINE_NO:252
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(350) ; #DEBUG_LINE_NO:255
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0310_Item_00()
  If UC09_Result.GetValue() == 1.0 ; #DEBUG_LINE_NO:264
    Alias_Terrormorph.TryToEnable() ; #DEBUG_LINE_NO:265
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_ApexPredator.TryToEnable() ; #DEBUG_LINE_NO:274
  Alias_ApexPredator.TryToSetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0330_Item_00()
  ActorValue aggression = Game.GetAggressionAV() ; #DEBUG_LINE_NO:283
  Int numToEnable = Utility.RandomInt(2, Alias_Predators.Length) ; #DEBUG_LINE_NO:284
  Int I = 0 ; #DEBUG_LINE_NO:285
  While I < numToEnable ; #DEBUG_LINE_NO:288
    Alias_Predators[I].TryToEnable() ; #DEBUG_LINE_NO:289
    Alias_Predators[I].TryToSetValue(aggression, 1.0) ; #DEBUG_LINE_NO:290
    I += 1 ; #DEBUG_LINE_NO:291
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Critters.EnableAll(False) ; #DEBUG_LINE_NO:300
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:308
EndFunction
