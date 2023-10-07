ScriptName Fragments:Quests:QF_SE_HailTemplate_0012C5A6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:8
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:20
EndFunction
