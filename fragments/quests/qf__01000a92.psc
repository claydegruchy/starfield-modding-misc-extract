ScriptName Fragments:Quests:QF__01000A92 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Corpse_Creature_00 Auto Const mandatory
ReferenceAlias Property Alias_Corpse_Creature_01 Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Predator_Apex Auto Const mandatory
RefCollectionAlias Property Alias_Predators_GroupFormation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Alias_Corpse_Creature_00 as Bool && Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:7
    Alias_Corpse_Creature_00.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
  If Alias_Corpse_Creature_01 as Bool && Utility.RandomInt(1, 4) == 1 ; #DEBUG_LINE_NO:11
    Alias_Corpse_Creature_01.GetRef().Enable(False) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int chance = Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:21
  If chance <= 1 ; #DEBUG_LINE_NO:23
    Self.SetStage(210) ; #DEBUG_LINE_NO:24
  ElseIf chance <= 2 ; #DEBUG_LINE_NO:25
    Self.SetStage(220) ; #DEBUG_LINE_NO:26
  ElseIf chance <= 4 ; #DEBUG_LINE_NO:27
    Self.SetStage(230) ; #DEBUG_LINE_NO:28
  ElseIf chance <= 7 ; #DEBUG_LINE_NO:29
    Self.SetStage(240) ; #DEBUG_LINE_NO:30
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(250) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Terrormorph_Spawn.GetRef().Enable(False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Predator_Apex.GetRef().Enable(False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0230_Item_00()
  Alias_Predators_GroupFormation.EnableAll(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:65
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:66
  kmyQuest.LaunchAllShips(True) ; #DEBUG_LINE_NO:69
EndFunction
