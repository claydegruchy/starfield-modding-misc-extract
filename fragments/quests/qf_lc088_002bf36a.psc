ScriptName Fragments:Quests:QF_LC088_002BF36A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
lc082_vigilancequestscript Property LC082 Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Location Property LC082VigilanceCF07Location Auto Const mandatory
Location Property LC082VigilanceLocation Auto Const mandatory
Location Property StationTheKeyParentLocation Auto Const mandatory
Location Property StationTheKeyInteriorLocation Auto Const mandatory
Quest Property CF_Main Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  lc088questscript kmyQuest = __temp as lc088questscript ; #DEBUG_LINE_NO:8
  kmyQuest.QuickstartSpace(33, 0, 0, 0, 0, 0, 0, 0, 0) ; #DEBUG_LINE_NO:15
  LC088_Space.SetStage(4) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0010_Item_00()
  LC082.SetStage(11) ; #DEBUG_LINE_NO:28
  If !CF_Main.GetStageDone(300) ; #DEBUG_LINE_NO:29
    CF_Main.SetStage(20) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  CF01.Stop() ; #DEBUG_LINE_NO:34
  CF02.Stop() ; #DEBUG_LINE_NO:35
  CF03.Stop() ; #DEBUG_LINE_NO:36
  CF04.Stop() ; #DEBUG_LINE_NO:37
  CF05.Stop() ; #DEBUG_LINE_NO:38
  CF06.Stop() ; #DEBUG_LINE_NO:39
  LC082VigilanceCF07Location.Reset() ; #DEBUG_LINE_NO:42
  LC082VigilanceLocation.Reset() ; #DEBUG_LINE_NO:43
  StationTheKeyParentLocation.Reset() ; #DEBUG_LINE_NO:44
  StationTheKeyInteriorLocation.Reset() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_2000_Item_00()
  LC088_Space.SetStage(2000) ; #DEBUG_LINE_NO:56
  If LC088_Vigilance.IsRunning() ; #DEBUG_LINE_NO:57
    LC088_Vigilance.SetStage(2000) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
  If LC088_Key.IsRunning() ; #DEBUG_LINE_NO:60
    LC088_Key.SetStage(2000) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:65
EndFunction
