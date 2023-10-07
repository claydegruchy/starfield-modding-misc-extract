ScriptName Fragments:Quests:QF_MQ_TempleQuest_Freefor_0001C077_13 Extends Quest Const hidden

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
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:17
  kmyQuest.ShowHelpMessage("OutpostTutorial") ; #DEBUG_LINE_NO:20
  If Alias_PlanetExploredTrait.GetLocation() == None ; #DEBUG_LINE_NO:22
    Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:33
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:36
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:45
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:46
  kmyQuest.PowerReceived() ; #DEBUG_LINE_NO:49
  kmyQuest.SpawnStarborn() ; #DEBUG_LINE_NO:50
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:51
  Self.Stop() ; #DEBUG_LINE_NO:52
EndFunction
