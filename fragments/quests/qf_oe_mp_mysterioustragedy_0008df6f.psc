ScriptName Fragments:Quests:QF_OE_MP_MysteriousTragedy_0008DF6F Extends Quest Const hidden

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

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:7
  Int Randomizer = Utility.RandomInt(1, 5) ; #DEBUG_LINE_NO:8
  If PlayerLevel > 100 ; #DEBUG_LINE_NO:10
    Randomizer += 5 ; #DEBUG_LINE_NO:11
  ElseIf PlayerLevel > 75 ; #DEBUG_LINE_NO:12
    Randomizer += 4 ; #DEBUG_LINE_NO:13
  ElseIf PlayerLevel > 50 ; #DEBUG_LINE_NO:14
    Randomizer += 3 ; #DEBUG_LINE_NO:15
  ElseIf PlayerLevel > 25 ; #DEBUG_LINE_NO:16
    Randomizer += 2 ; #DEBUG_LINE_NO:17
  ElseIf PlayerLevel > 15 ; #DEBUG_LINE_NO:18
    Randomizer += 1 ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:22
    Randomizer += 3 ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundExplorer) ; #DEBUG_LINE_NO:26
    Randomizer += 1 ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:31
    Self.SetStage(20) ; #DEBUG_LINE_NO:32
  ElseIf Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:33
    Self.SetStage(30) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:38
    Self.SetStage(50) ; #DEBUG_LINE_NO:39
  ElseIf Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:40
    Self.SetStage(60) ; #DEBUG_LINE_NO:41
  ElseIf Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:42
    Self.SetStage(70) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  If !Self.GetStageDone(10) ; #DEBUG_LINE_NO:52
    Self.SetStage(10) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_ApexPredator_Corpse.TryToEnable() ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0060_Item_00()
  Int numToSpawn = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:70
  Alias_Predator_Corpse00.TryToEnable() ; #DEBUG_LINE_NO:72
  If numToSpawn > 1 ; #DEBUG_LINE_NO:74
    Alias_Predator_Corpse01.TryToEnable() ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  If numToSpawn > 2 ; #DEBUG_LINE_NO:78
    Alias_Predator_Corpse02.TryToEnable() ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !Self.GetStageDone(10) ; #DEBUG_LINE_NO:88
    Self.SetStage(10) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(40) ; #DEBUG_LINE_NO:93
    If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:94
      Self.SetStage(150) ; #DEBUG_LINE_NO:95
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(20) ; #DEBUG_LINE_NO:99
    Self.SetStage(110) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Enemy.GetActorRef().AddItem(Alias_Note.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:118
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:119
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0200_Item_00()
  Bool apexAllowed = Alias_ApexPredator.GetRef() == None ; #DEBUG_LINE_NO:130
  apexAllowed = !apexAllowed ; #DEBUG_LINE_NO:130
  Bool predatorsAllowed = Alias_Predator.GetRef() == None ; #DEBUG_LINE_NO:131
  predatorsAllowed = !predatorsAllowed ; #DEBUG_LINE_NO:131
  Bool terrormorphAllowed = Alias_Trigger.GetRef().GetCurrentPlanet().HasKeyword(PCM_TerrormorphEncountersAllowed) ; #DEBUG_LINE_NO:132
  Int Randomizer = Utility.RandomInt(1, 5) ; #DEBUG_LINE_NO:133
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:134
  If PlayerLevel > 100 ; #DEBUG_LINE_NO:136
    Randomizer += 5 ; #DEBUG_LINE_NO:137
  ElseIf PlayerLevel > 75 ; #DEBUG_LINE_NO:138
    Randomizer += 4 ; #DEBUG_LINE_NO:139
  ElseIf PlayerLevel > 50 ; #DEBUG_LINE_NO:140
    Randomizer += 3 ; #DEBUG_LINE_NO:141
  ElseIf PlayerLevel > 25 ; #DEBUG_LINE_NO:142
    Randomizer += 2 ; #DEBUG_LINE_NO:143
  ElseIf PlayerLevel > 15 ; #DEBUG_LINE_NO:144
    Randomizer += 1 ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
  If PlayerLevel < 25 && Self.GetStageDone(20) ; #DEBUG_LINE_NO:148
    Randomizer -= 3 ; #DEBUG_LINE_NO:149
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:152
    Randomizer += 3 ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(BackgroundExplorer) ; #DEBUG_LINE_NO:156
    Randomizer += 1 ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
  If terrormorphAllowed ; #DEBUG_LINE_NO:161
    If Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:162
      Self.SetStage(310) ; #DEBUG_LINE_NO:163
      Randomizer -= 4 ; #DEBUG_LINE_NO:164
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If apexAllowed ; #DEBUG_LINE_NO:169
    If Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:170
      Self.SetStage(320) ; #DEBUG_LINE_NO:171
      Randomizer -= 3 ; #DEBUG_LINE_NO:172
    EndIf ; #DEBUG_LINE_NO:
  ElseIf predatorsAllowed ; #DEBUG_LINE_NO:
    If Utility.RandomInt(1, 10) < Randomizer ; #DEBUG_LINE_NO:175
      Self.SetStage(330) ; #DEBUG_LINE_NO:176
      Randomizer -= 2 ; #DEBUG_LINE_NO:177
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(20) && !Self.GetStageDone(310) && !Self.GetStageDone(320) && !Self.GetStageDone(330) ; #DEBUG_LINE_NO:182
    Self.SetStage(350) ; #DEBUG_LINE_NO:183
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0310_Item_00()
  If UC09_Result.GetValue() == 1.0 ; #DEBUG_LINE_NO:192
    Alias_Terrormorph.TryToEnable() ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  Alias_ApexPredator.TryToEnable() ; #DEBUG_LINE_NO:202
  Alias_ApexPredator.TryToSetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:203
EndFunction

Function Fragment_Stage_0330_Item_00()
  ActorValue aggression = Game.GetAggressionAV() ; #DEBUG_LINE_NO:211
  Int numToEnable = Utility.RandomInt(2, Alias_Predators.Length) ; #DEBUG_LINE_NO:212
  Int I = 0 ; #DEBUG_LINE_NO:213
  While I < numToEnable ; #DEBUG_LINE_NO:216
    Alias_Predators[I].TryToEnable() ; #DEBUG_LINE_NO:217
    Alias_Predators[I].TryToSetValue(aggression, 1.0) ; #DEBUG_LINE_NO:218
    I += 1 ; #DEBUG_LINE_NO:219
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Critters.EnableAll(False) ; #DEBUG_LINE_NO:228
EndFunction
