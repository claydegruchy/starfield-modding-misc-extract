ScriptName Fragments:Quests:QF_SE_KT02_00029289 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property BE_KT02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveFailed(20, True) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:53
  If !BE_KT02.GetStageDone(15) ; #DEBUG_LINE_NO:54
    oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(20, True) ; #DEBUG_LINE_NO:65
  Self.Stop() ; #DEBUG_LINE_NO:66
EndFunction
