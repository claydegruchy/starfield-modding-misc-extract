ScriptName Fragments:Quests:QF_OE_AustinF_CreatureCage_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CageMarker Auto Const mandatory
ReferenceAlias Property Alias_NestMarker Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Cage Auto Const mandatory
ReferenceAlias Property Alias_Creature Auto Const mandatory
ReferenceAlias Property Alias_Creature_Hard Auto Const mandatory
ReferenceAlias Property Alias_Creature_Medium Auto Const mandatory
ReferenceAlias Property Alias_Creature_Easy Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
Perk Property BackgroundBigGameHunter Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
GlobalVariable Property LockLevel_Novice Auto Const mandatory
GlobalVariable Property LockLevel_Expert Auto Const mandatory
GlobalVariable Property LockLevel_Advanced Auto Const mandatory
GlobalVariable Property LockLevel_Master Auto Const mandatory
LeveledItem Property LL_OELoot Auto Const mandatory
LeveledItem Property LL_OELoot_Rare Auto Const mandatory
LeveledItem Property LL_OELoot_Uncommon Auto Const mandatory
ReferenceAlias Property Alias_NPCCorpse Auto Const mandatory
ReferenceAlias Property Alias_CageDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(5) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Creature.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:15
  Alias_Creature_Hard.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:16
  Alias_Creature_Medium.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:17
  Alias_Creature_Easy.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:18
  Alias_Cage.GetRef().Enable(False) ; #DEBUG_LINE_NO:19
  Alias_Nest.GetRef().Enable(False) ; #DEBUG_LINE_NO:20
  Self.SetStage(10) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor Creature = Alias_Creature.GetActorRef() ; #DEBUG_LINE_NO:30
  Creature.MoveTo(Alias_CageMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Creature.SetScale(0.699999988) ; #DEBUG_LINE_NO:33
  Creature.Enable(False) ; #DEBUG_LINE_NO:34
  Creature.MoveTo(Alias_CageMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
  Self.SetStage(20) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference Cage = Alias_CageDoor.GetRef() ; #DEBUG_LINE_NO:45
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:46
  Int Range = PlayerLevel / 2 ; #DEBUG_LINE_NO:47
  Int NoviceLockLevel = LockLevel_Novice.GetValue() as Int ; #DEBUG_LINE_NO:48
  Int AdvancedLockLevel = LockLevel_Advanced.GetValue() as Int ; #DEBUG_LINE_NO:49
  Int ExpertLockLevel = LockLevel_Expert.GetValue() as Int ; #DEBUG_LINE_NO:50
  Int MasterLockLevel = LockLevel_Master.GetValue() as Int ; #DEBUG_LINE_NO:51
  PlayerLevel = Math.Clamp(PlayerLevel as Float, 0.0, 100.0) as Int ; #DEBUG_LINE_NO:53
  Range = Utility.RandomInt(Range, PlayerLevel) ; #DEBUG_LINE_NO:54
  Cage.SetOpen(False) ; #DEBUG_LINE_NO:56
  If Range < NoviceLockLevel ; #DEBUG_LINE_NO:58
    Cage.Lock(False, False, True) ; #DEBUG_LINE_NO:59
    Cage.UnLock(True) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    Cage.Lock(True, False, True) ; #DEBUG_LINE_NO:62
    If Range < AdvancedLockLevel ; #DEBUG_LINE_NO:64
      Cage.SetLockLevel(NoviceLockLevel) ; #DEBUG_LINE_NO:65
    ElseIf Range < ExpertLockLevel ; #DEBUG_LINE_NO:66
      Cage.SetLockLevel(AdvancedLockLevel) ; #DEBUG_LINE_NO:67
    ElseIf Range < MasterLockLevel ; #DEBUG_LINE_NO:68
      Cage.SetLockLevel(ExpertLockLevel) ; #DEBUG_LINE_NO:69
    Else ; #DEBUG_LINE_NO:
      Cage.SetLockLevel(MasterLockLevel) ; #DEBUG_LINE_NO:71
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(30) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference Nest = Alias_Nest.GetRef() ; #DEBUG_LINE_NO:83
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:84
  Nest.MoveTo(Alias_NestMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:86
  Nest.Enable(False) ; #DEBUG_LINE_NO:87
  Nest.UnLock(False) ; #DEBUG_LINE_NO:88
  Nest.SetOpen(True) ; #DEBUG_LINE_NO:89
  If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:91
    Self.SetStage(35) ; #DEBUG_LINE_NO:92
  ElseIf Utility.RandomInt(Player.GetLevel(), 100) > Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:93
    Self.SetStage(35) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(40) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0035_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:105
  Alias_Nest.GetRef().AddItem(LL_OELoot as Form, 1, False) ; #DEBUG_LINE_NO:107
  If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter) ; #DEBUG_LINE_NO:110
    Alias_Nest.GetRef().AddItem(LL_OELoot as Form, 1, False) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Int BonusChance = Utility.RandomInt(1, 3) ; #DEBUG_LINE_NO:120
  If BonusChance > 1 ; #DEBUG_LINE_NO:122
    Self.SetStage(45) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(50) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0045_Item_00()
  Actor BonusCreature = None ; #DEBUG_LINE_NO:134
  Int Random = Utility.RandomInt(0, Game.GetPlayer().GetLevel()) ; #DEBUG_LINE_NO:135
  If Random > 75 ; #DEBUG_LINE_NO:141
    Alias_Creature_Hard.TryToEnable() ; #DEBUG_LINE_NO:142
    Alias_Creature_Easy.TryToEnable() ; #DEBUG_LINE_NO:143
  ElseIf Random > 25 ; #DEBUG_LINE_NO:144
    Alias_Creature_Easy.TryToEnable() ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference Corpse = Alias_NPCCorpse.GetRef() ; #DEBUG_LINE_NO:154
  ObjectReference Nest = Alias_NestMarker.GetRef() ; #DEBUG_LINE_NO:155
  ObjectReference Cage = Alias_CageMarker.GetRef() ; #DEBUG_LINE_NO:156
  Int Random = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:157
  If Random < 4 ; #DEBUG_LINE_NO:159
    If Nest != None || Cage != None ; #DEBUG_LINE_NO:160
      Self.SetStage(55) ; #DEBUG_LINE_NO:161
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(90) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0055_Item_00()
  ObjectReference Marker = Alias_CageMarker.GetRef() ; #DEBUG_LINE_NO:173
  ObjectReference Corpse = Alias_NPCCorpse.GetRef() ; #DEBUG_LINE_NO:174
  Int Random = Utility.RandomInt(0, 3) ; #DEBUG_LINE_NO:175
  If Corpse != None ; #DEBUG_LINE_NO:177
    If Random < 2 ; #DEBUG_LINE_NO:178
      Marker = Alias_NestMarker.GetRef() ; #DEBUG_LINE_NO:179
      Random = Utility.RandomInt(0, 3) ; #DEBUG_LINE_NO:180
    EndIf ; #DEBUG_LINE_NO:
    If Random < 3 ; #DEBUG_LINE_NO:183
      Corpse.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:184
    EndIf ; #DEBUG_LINE_NO:
    Alias_NPCCorpse.GetRef().Enable(False) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:196
  If Utility.RandomInt(0, PlayerLevel) > 50 ; #DEBUG_LINE_NO:198
    Alias_Creature_Medium.TryToEnable() ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Creature = Alias_Creature.GetActorRef() ; #DEBUG_LINE_NO:208
  Creature.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:210
  Creature.StartCombat(Alias_Player.GetRef(), False) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:219
    Alias_Nest.GetRef().AddItem(LL_OELoot_Rare as Form, 1, False) ; #DEBUG_LINE_NO:220
  Else ; #DEBUG_LINE_NO:
    Alias_Nest.GetRef().AddItem(LL_OELoot_Uncommon as Form, 1, False) ; #DEBUG_LINE_NO:222
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(850) ; #DEBUG_LINE_NO:232
    Self.SetStage(999) ; #DEBUG_LINE_NO:233
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If Self.GetStageDone(800) ; #DEBUG_LINE_NO:243
    Self.SetStage(999) ; #DEBUG_LINE_NO:244
  EndIf ; #DEBUG_LINE_NO:
EndFunction
