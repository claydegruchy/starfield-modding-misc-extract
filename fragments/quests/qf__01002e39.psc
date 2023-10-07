ScriptName Fragments:Quests:QF__01002E39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory
GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const mandatory
GlobalVariable Property MQ_TurnOnTemples Auto Const mandatory
ReferenceAlias Property Alias_EyeScanner Auto Const mandatory
ReferenceAlias Property Alias_VladimirSall Auto Const mandatory
Message Property MQ401EyeScanMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0007_Item_00()
  MQ401EyeScanMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:7
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:9
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:10
  MQ_TurnOnTemples.SetValueInt(1) ; #DEBUG_LINE_NO:11
  Alias_EyeScanner.GetRef().Disable(False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:20
  MQ_TurnOnTemples.SetValueInt(1) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_EyeScanner.GetRef().Enable(False) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:48
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:60
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:61
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:80
  Self.Stop() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0060_Item_01()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:90
  Self.Stop() ; #DEBUG_LINE_NO:91
EndFunction
