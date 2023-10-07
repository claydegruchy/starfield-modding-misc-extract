ScriptName Fragments:Quests:QF_RL088_EavesdroppingScene_00246FCB Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rl088script kmyQuest = __temp as rl088script ; #DEBUG_LINE_NO:8
  kmyQuest.StartGravityCountdown(7, 7) ; #DEBUG_LINE_NO:12
EndFunction
