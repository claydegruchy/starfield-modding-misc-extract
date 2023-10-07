ScriptName Fragments:Quests:QF_SE_FAB25_00029CC8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Potion Property DrinkPack_Orange_Juice Auto Const mandatory
Float Property RunTime Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:16
  ShipRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:17
  Utility.Wait(RunTime) ; #DEBUG_LINE_NO:19
  Self.SetStage(300) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(DrinkPack_Orange_Juice as Form, 1, False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:38
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:39
EndFunction
