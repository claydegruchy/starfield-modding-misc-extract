ScriptName Fragments:Quests:QF_DialogueTrackersAllianceA_00216D3C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TrackersAllianceAgent Auto Const mandatory
Quest Property RAD04 Auto Const mandatory
ReferenceAlias Property Alias_TrackersAllianceAgentNeon Auto Const mandatory
ReferenceAlias Property Alias_TrackersAllianceAgentNewAtlantis Auto Const mandatory
ReferenceAlias Property Alias_TrackersAllianceAgentCydonia Auto Const mandatory
ActorValue Property RAD04_TrackerGaveQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgent.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0021_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentNeon.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0022_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentCydonia.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0023_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentNewAtlantis.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0200_Item_00()
  RAD04.Start() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0201_Item_00()
  Alias_TrackersAllianceAgent.GetRef().SetValue(RAD04_TrackerGaveQuest, 1.0) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0202_Item_00()
  Alias_TrackersAllianceAgentNeon.GetRef().SetValue(RAD04_TrackerGaveQuest, 1.0) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0203_Item_00()
  Alias_TrackersAllianceAgentCydonia.GetRef().SetValue(RAD04_TrackerGaveQuest, 1.0) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0204_Item_00()
  Alias_TrackersAllianceAgentNewAtlantis.GetRef().SetValue(RAD04_TrackerGaveQuest, 1.0) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0211_Item_00()
  Alias_TrackersAllianceAgent.GetRef().SetValue(RAD04_TrackerGaveQuest, 2.0) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0212_Item_00()
  Alias_TrackersAllianceAgentNeon.GetRef().SetValue(RAD04_TrackerGaveQuest, 2.0) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0213_Item_00()
  Alias_TrackersAllianceAgentCydonia.GetRef().SetValue(RAD04_TrackerGaveQuest, 2.0) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0214_Item_00()
  Alias_TrackersAllianceAgentNewAtlantis.GetRef().SetValue(RAD04_TrackerGaveQuest, 2.0) ; #DEBUG_LINE_NO:103
EndFunction
