ScriptName Fragments:Quests:QF__01006B02 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property Attack01_100a_DefenderHailStart Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.RefillAlias() ; #DEBUG_LINE_NO:7
  Attack01_100a_DefenderHailStart.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0175_Item_00()
  Game.GetPlayer().AddItem(InorgCommonHelium3 as Form, 3, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0180_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 350, False) ; #DEBUG_LINE_NO:24
EndFunction
