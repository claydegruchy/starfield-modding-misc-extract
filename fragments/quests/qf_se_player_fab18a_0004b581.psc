ScriptName Fragments:Quests:QF_SE_Player_FAB18a_0004B581 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:29
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:30
  MS02_GenghisReactivity.SetValue(2.0) ; #DEBUG_LINE_NO:33
EndFunction
