ScriptName Fragments:Quests:QF_SE_KMK01_Testduplicate01_0047E81D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Keyword Property TestKurtShipDeathKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_playerShip.GetRef().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0500_Item_00()
  TestKurtShipDeathKeyword.SendStoryEvent(None, Alias_Ship01.GetRef(), None, 0, 0) ; #DEBUG_LINE_NO:15
EndFunction
