ScriptName Fragments:Quests:QF__01001F55 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnomalyMapMarker Auto Const mandatory
Message Property MQ_TempleTutorialMSG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_AnomalyMapMarker.GetRef().SetRequiresScanning(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.setobjectivecompleted(20, True) ; #DEBUG_LINE_NO:15
  Self.setobjectivedisplayed(30, True, False) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().WaitFor3DLoad() ; #DEBUG_LINE_NO:18
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:19
  MQ_TempleTutorialMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.setobjectivecompleted(30, True) ; #DEBUG_LINE_NO:28
  Self.setobjectivedisplayed(40, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:37
EndFunction
