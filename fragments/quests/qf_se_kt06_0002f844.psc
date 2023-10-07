ScriptName Fragments:Quests:QF_SE_KT06_0002F844 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Scene Property HailTemplate_100a_KT06_HailStart Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 2.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:47
  HailTemplate_100a_KT06_HailStart.Start() ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:56
  Self.Stop() ; #DEBUG_LINE_NO:57
EndFunction
