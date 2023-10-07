ScriptName Fragments:Quests:QF_SE_Player_FAB08_0007C7DD Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_NameTheTrader Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(5.0) ; #DEBUG_LINE_NO:18
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:20
  Self.SetStage(1000) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_NameTheTrader.ForceRefTo(Alias_HailingShip.GetRef()) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:39
EndFunction
