ScriptName Fragments:Quests:QF_TestKurtArtifactTempleQue_00110679 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setobjectivedisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Alias_AnomalyMapMarker.GetRef().SetRequiresScanning(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.setobjectivecompleted(10, True) ; #DEBUG_LINE_NO:16
  Self.setobjectivedisplayed(20, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.setobjectivecompleted(20, True) ; #DEBUG_LINE_NO:25
  Self.setobjectivedisplayed(30, True, False) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().WaitFor3DLoad() ; #DEBUG_LINE_NO:28
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:29
  MQ_TempleTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.setobjectivecompleted(30, True) ; #DEBUG_LINE_NO:38
  Self.setobjectivedisplayed(40, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:47
EndFunction
