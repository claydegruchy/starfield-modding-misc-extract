ScriptName Fragments:Quests:QF_SE_ZW10_00084DAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
Scene Property PSEZW10_100a_Hailing Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PSEZW10_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:19
EndFunction
