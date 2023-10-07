ScriptName Fragments:Quests:QF_MQ104B_LinHeller_BaseDial_0027E279 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int iHirePrice = 0 ; #DEBUG_LINE_NO:7
  If Self.GetStageDone(20) == True ; #DEBUG_LINE_NO:9
    iHirePrice = 250 ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    iHirePrice = 500 ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().removeitem(Credits as Form, iHirePrice, False, None) ; #DEBUG_LINE_NO:15
EndFunction
