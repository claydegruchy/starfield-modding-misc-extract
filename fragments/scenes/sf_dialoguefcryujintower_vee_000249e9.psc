ScriptName Fragments:Scenes:SF_DialogueFCRyujinTower_Vee_000249E9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property DR017_DataCredits Auto Const mandatory
GlobalVariable Property DR017_DataCreditsHigh Auto Const mandatory
GlobalVariable Property DR017_DemandedHighPrice Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Book Property DR017_ValuableData01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  Int DataCount = PlayerREF.GetItemCount(DR017_ValuableData01 as Form) ; #DEBUG_LINE_NO:8
  Float fDemandedHighPrice = DR017_DemandedHighPrice.GetValue() ; #DEBUG_LINE_NO:9
  If fDemandedHighPrice == 1.0 ; #DEBUG_LINE_NO:11
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCreditsHigh.GetValueInt(), False) ; #DEBUG_LINE_NO:12
  Else ; #DEBUG_LINE_NO:
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCredits.GetValueInt(), False) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.RemoveItem(DR017_ValuableData01 as Form, DataCount, False, None) ; #DEBUG_LINE_NO:17
EndFunction
