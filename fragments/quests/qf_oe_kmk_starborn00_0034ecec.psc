ScriptName Fragments:Quests:QF_OE_KMK_Starborn00_0034ECEC Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:12
EndFunction
