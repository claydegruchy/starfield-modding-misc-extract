ScriptName Fragments:Quests:QF_TestSB01Explore_002AB7C4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
LocationAlias Property Alias_PlanetExploredTrait Auto Const mandatory
ReferenceAlias Property Alias_TempleMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  MQ104A.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:7
  If Alias_PlanetExploredTrait.GetLocation() == None ; #DEBUG_LINE_NO:10
    MQ104A.SetObjectiveDisplayed(71, True, False) ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    MQ104A.SetObjectiveDisplayed(73, True, False) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:22
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript ; #DEBUG_LINE_NO:23
  Game.GetPlayer().WaitFor3DLoad() ; #DEBUG_LINE_NO:26
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:27
  MQ_TempleTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:28
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:29
  MQ104A.SetObjectiveCompleted(71, True) ; #DEBUG_LINE_NO:30
  MQ104A.SetObjectiveDisplayed(72, True, False) ; #DEBUG_LINE_NO:31
  MQ104A.SetObjectiveDisplayed(74, True, False) ; #DEBUG_LINE_NO:32
  MQ104A.SetStage(305) ; #DEBUG_LINE_NO:34
  kmyQuest.ShowHelpMessage("OutpostTutorial") ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0032_Item_00()
  MQ104A.SetObjectiveCompleted(74, True) ; #DEBUG_LINE_NO:44
  MQ104A.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0035_Item_00()
  MQ104A.SetObjectiveCompleted(74, True) ; #DEBUG_LINE_NO:53
  MQ104A.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:63
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:66
  MQ104A.SetObjectiveCompleted(72, True) ; #DEBUG_LINE_NO:67
  MQ104A.SetObjectiveDisplayed(73, True, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:76
  MQ104A.SetStage(400) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0060_Item_00()
  MQ104A.SetStage(600) ; #DEBUG_LINE_NO:85
  Self.Stop() ; #DEBUG_LINE_NO:86
EndFunction
