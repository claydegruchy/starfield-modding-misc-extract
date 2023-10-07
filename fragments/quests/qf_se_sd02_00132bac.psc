ScriptName Fragments:Quests:QF_SE_SD02_00132BAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_MinerShip Auto Const
ReferenceAlias Property Alias_EscortShip Auto Const
ReferenceAlias Property Alias_EscortShip01 Auto Const mandatory
ReferenceAlias Property Alias_MinerShip01 Auto Const mandatory
ActorValue Property DockingPermission Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg1 = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  spaceshipreference oTarg2 = Alias_MinerShip01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  spaceshipreference oTarg3 = Alias_EscortShip01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:20
  oTarg1.DisableWithGravJump() ; #DEBUG_LINE_NO:22
  oTarg2.DisableWithGravJump() ; #DEBUG_LINE_NO:23
  oTarg3.DisableWithGravJump() ; #DEBUG_LINE_NO:24
EndFunction
