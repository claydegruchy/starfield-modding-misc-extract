ScriptName Fragments:Quests:QF__01000AC5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_TourEscort Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(20.0) ; #DEBUG_LINE_NO:17
  Self.SetStage(300) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:28
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:29
  oTarg = Alias_TourEscort.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:31
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:32
EndFunction
