ScriptName Fragments:Quests:QF_OE_Austinf_EggThief_00006E52 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Corpse_Creature_00 Auto Const mandatory
ReferenceAlias Property Alias_Corpse_Creature_01 Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Predator_Apex Auto Const mandatory
RefCollectionAlias Property Alias_Predators_GroupFormation Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Int chance = Utility.RandomInt(1, 5) ; #DEBUG_LINE_NO:7
  If chance == 1 ; #DEBUG_LINE_NO:9
    Self.SetStage(210) ; #DEBUG_LINE_NO:10
  ElseIf chance == 2 ; #DEBUG_LINE_NO:11
    Self.SetStage(220) ; #DEBUG_LINE_NO:12
  ElseIf chance == 3 ; #DEBUG_LINE_NO:13
    Self.SetStage(230) ; #DEBUG_LINE_NO:14
  ElseIf chance == 4 ; #DEBUG_LINE_NO:15
    Self.SetStage(240) ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(250) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Terrormorph_Spawn.GetRef().Enable(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Predator_Apex.GetRef().RemoveKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:35
  (Alias_Predator_Apex.GetRef() as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0230_Item_00()
  ObjectReference Creature = None ; #DEBUG_LINE_NO:44
  Int index = 0 ; #DEBUG_LINE_NO:45
  While index < Alias_Predators_GroupFormation.GetCount() ; #DEBUG_LINE_NO:47
    Creature = Alias_Predators_GroupFormation.GetAt(index) ; #DEBUG_LINE_NO:48
    If Creature ; #DEBUG_LINE_NO:49
      Creature.RemoveKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:50
      (Creature as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:53
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:63
  kmyQuest.LaunchAllShips(True) ; #DEBUG_LINE_NO:66
EndFunction
