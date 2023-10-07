ScriptName Fragments:Quests:QF_TestKurtSpaceEncounterQue_0005B458 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Scene Property SE_KMK01HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0003_Item_00()
  SE_KMK01HailingScene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_playerShip.GetRef().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference HailingShip = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:23
  HailingShip.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:24
EndFunction
