ScriptName Fragments:Quests:QF_SQ_OutpostAttack01Predato_00361A85 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  sq_outpostattackcreaturesscript kmyQuest = __temp as sq_outpostattackcreaturesscript ; #DEBUG_LINE_NO:8
  kmyQuest.StartAttack(True) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:19
EndFunction
