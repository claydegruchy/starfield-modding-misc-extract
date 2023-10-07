ScriptName Fragments:Quests:QF_RL040Quest_0025A9E2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property RL040Quest_PirateScene Auto Const
Scene Property RL040Quest_VictimScene Auto Const
Scene Property RL040Quest_DisablesRadioScene Auto Const
ReferenceAlias Property Alias_ShipEnableMarker Auto Const
ReferenceAlias Property Alias_DirectionSwapTrigger Auto Const
ReferenceAlias Property Alias_GroundEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Switch Auto Const mandatory
ReferenceAlias Property Alias_PirateTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  RL040Quest_VictimScene.Stop() ; #DEBUG_LINE_NO:16
  RL040Quest_PirateScene.Start() ; #DEBUG_LINE_NO:17
  Alias_DirectionSwapTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:18
  Alias_GroundEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:19
  Utility.wait(15.0) ; #DEBUG_LINE_NO:20
  Alias_ShipEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:21
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0030_Item_00()
  RL040Quest_VictimScene.Stop() ; #DEBUG_LINE_NO:30
  RL040Quest_DisablesRadioScene.Start() ; #DEBUG_LINE_NO:31
  Alias_PirateTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:33
  Alias_DirectionSwapTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:34
  Alias_GroundEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:35
  Utility.wait(10.0) ; #DEBUG_LINE_NO:36
  Alias_ShipEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:38
EndFunction
