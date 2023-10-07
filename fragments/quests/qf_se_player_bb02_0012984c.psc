ScriptName Fragments:Quests:QF_SE_Player_BB02_0012984C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(12.0) ; #DEBUG_LINE_NO:18
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0400_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:28
  Alias_HailingShip.GetShipRef().Kill(None) ; #DEBUG_LINE_NO:29
EndFunction
