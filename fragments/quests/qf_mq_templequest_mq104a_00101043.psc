ScriptName Fragments:Quests:QF_MQ_TempleQuest_MQ104A_00101043 Extends Quest Const hidden

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
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:43
  MQ104A.SetStage(400) ; #DEBUG_LINE_NO:46
  MQ104A.SetObjectiveCompleted(72, True) ; #DEBUG_LINE_NO:48
  MQ104A.SetObjectiveDisplayed(73, True, False) ; #DEBUG_LINE_NO:49
  kmyQuest.TempleDiscovered() ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:59
  mq_temple_subscript kmyQuest = __temp as mq_temple_subscript ; #DEBUG_LINE_NO:60
  kmyQuest.PowerReceived() ; #DEBUG_LINE_NO:63
  MQ104A.SetStage(600) ; #DEBUG_LINE_NO:64
  Self.Stop() ; #DEBUG_LINE_NO:65
EndFunction
