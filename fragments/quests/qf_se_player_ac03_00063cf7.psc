ScriptName Fragments:Quests:QF_SE_Player_AC03_00063CF7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property MoaraPostHailScene Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:19
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:20
  Self.SetStage(1000) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:29
EndFunction
