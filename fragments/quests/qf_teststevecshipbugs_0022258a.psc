ScriptName Fragments:Quests:QF_TestSteveCShipBugs_0022258A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  BE_SC03_McGrathEncounterStateGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:11
EndFunction
