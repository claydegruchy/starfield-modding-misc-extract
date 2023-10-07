ScriptName Fragments:Quests:QF_MS06Intro_00258695 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS06 Auto Const mandatory
Scene Property MS06Intro_Jiro_BeaconMessage_Scene Auto Const
GlobalVariable Property MS06ECSConstantHailed Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
Message Property MS06_UnidentifiedShipNameMSG Auto Const mandatory
Message Property MS06_ParadisoOrbitNameMSG Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_ECSConstantShip.GetRef().SetOverrideName(MS06_UnidentifiedShipNameMSG) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  MS06Intro_Jiro_BeaconMessage_Scene.Start() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0200_Item_00()
  MS06.Start() ; #DEBUG_LINE_NO:23
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:24
    Self.SetStage(1000) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  MS06ECSConstantHailed.SetValue(1.0) ; #DEBUG_LINE_NO:35
  MS06.SetStage(300) ; #DEBUG_LINE_NO:37
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:39
    Self.SetStage(1000) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:49
EndFunction
