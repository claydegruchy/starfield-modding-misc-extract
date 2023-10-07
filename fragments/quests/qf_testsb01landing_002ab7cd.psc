ScriptName Fragments:Quests:QF_TestSB01Landing_002AB7CD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:16
  kmyQuest.ShowHelpMessage("OutpostTutorial") ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:27
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:28
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(10, True, True) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:48
  Self.Stop() ; #DEBUG_LINE_NO:49
  Self.Reset() ; #DEBUG_LINE_NO:50
EndFunction
