ScriptName Fragments:Quests:QF_SQ_OutpostAttack02Preda_00361C0E_4 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  sq_outpostattackcreaturesscript kmyQuest = __temp as sq_outpostattackcreaturesscript ; #DEBUG_LINE_NO:8
  kmyQuest.StartAttack(True) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:19
EndFunction
