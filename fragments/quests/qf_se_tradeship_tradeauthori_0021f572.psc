ScriptName Fragments:Quests:QF_SE_TradeShip_TradeAuthori_0021F572 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property pse_TradeShip_TradeAuthority_01_HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  pse_TradeShip_TradeAuthority_01_HailingScene.Start() ; #DEBUG_LINE_NO:8
  Self.setstage(100) ; #DEBUG_LINE_NO:9
EndFunction
