ScriptName Fragments:Quests:QF_MQ_TempleQuest_Freeform_0001C078_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory
Quest Property MQ106 Auto Const mandatory
ReferenceAlias Property Alias_TempleStarborn Auto Const mandatory
ReferenceAlias Property Alias_TemplePrayMarker Auto Const mandatory
ActorBase Property LvlStarborn_Boss_Aggro Auto Const mandatory
LocationAlias Property Alias_TempleLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:16
  kmyQuest.ShowHelpMessage("OutpostTutorial") ; #DEBUG_LINE_NO:19
  If Alias_TempleLocation.GetLocation() == None ; #DEBUG_LINE_NO:21
    Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:32
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:35
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(10, True, True) ; #DEBUG_LINE_NO:37
  kmyQuest.SpawnStarborn() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:56
  Self.Stop() ; #DEBUG_LINE_NO:57
EndFunction
