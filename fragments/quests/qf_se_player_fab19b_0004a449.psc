ScriptName Fragments:Quests:QF_SE_Player_FAB19b_0004A449 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker03 Auto Const mandatory
GlobalVariable Property MS03_Outcome Auto Const mandatory
ReferenceAlias Property Alias_DestroyedShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker03.GetRef() ; #DEBUG_LINE_NO:8
  spaceshipreference oJuno = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:9
  oJuno.Enable(False) ; #DEBUG_LINE_NO:10
  oJuno.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  oJuno.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:12
  If MS03_Outcome.GetValue() == 3.0 ; #DEBUG_LINE_NO:15
    Alias_DestroyedShip.GetRef().Disable(False) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:36
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:37
EndFunction
