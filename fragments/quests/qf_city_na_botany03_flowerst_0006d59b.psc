ScriptName Fragments:Quests:QF_City_NA_Botany03_FlowerSt_0006D59B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnableMarker1 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  EnableMarker1.enable(False) ; #DEBUG_LINE_NO:7
  Self.SetStage(200) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.stop() ; #DEBUG_LINE_NO:17
EndFunction
