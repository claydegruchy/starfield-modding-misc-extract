ScriptName Fragments:Quests:QF_UC02_ScannerQuest_002B1809 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DebugMarker Auto Const
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
Scene Property UC02_TrackerQuest_100_Scene Auto Const mandatory
GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const mandatory
Message Property UC02_DEBUG_Stopped Auto Const mandatory
Message Property UC02_DEBUG_Started Auto Const mandatory
wwiseevent Property WWiseScannerEvent Auto Const
Float Property WwiseEventInstanceID Auto Const
Quest Property UC02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Terrormorph.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().Moveto(DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  UC02_LivestockTrackerEnabled.SetValue(1.0) ; #DEBUG_LINE_NO:16
  If UC02.IsRunning() ; #DEBUG_LINE_NO:18
    (UC02 as uc02_questscript).ToggleRestoreTrackerObj(False) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript ; #DEBUG_LINE_NO:29
  kmyQuest.WwiseEventInstanceID = WWiseScannerEvent.Play(Alias_Terrormorph.GetRef(), None, None) ; #DEBUG_LINE_NO:32
  If UC02.GetStageDone(601) ; #DEBUG_LINE_NO:34
    kmyQuest.DisplayDistanceMessage() ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:44
  uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript ; #DEBUG_LINE_NO:45
  UC02_TrackerQuest_100_Scene.Stop() ; #DEBUG_LINE_NO:48
  wwiseevent.StopInstance(kmyQuest.WwiseEventInstanceID) ; #DEBUG_LINE_NO:49
  UC02_LivestockTrackerEnabled.SetValue(0.0) ; #DEBUG_LINE_NO:50
  If UC02.IsRunning() ; #DEBUG_LINE_NO:51
    (UC02 as uc02_questscript).ToggleRestoreTrackerObj(True) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:54
EndFunction
