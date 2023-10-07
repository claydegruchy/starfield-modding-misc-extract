ScriptName Fragments:Quests:QF_SE_Player_FAB06_0007E2B5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property SE_FAB06_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  SE_FAB06_RunOnce.SetValue(1.0) ; #DEBUG_LINE_NO:17
  HailTemplate_100a_Hailing.Stop() ; #DEBUG_LINE_NO:21
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:23
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:24
EndFunction
