ScriptName Fragments:Quests:QF_FFNeonZ06_QuestIntroTimer_001CEDC2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property pDialogueFCNeon Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  dialoguefcneon_timerscript kmyQuest = __temp as dialoguefcneon_timerscript ; #DEBUG_LINE_NO:8
  kmyQuest.Wait24() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0020_Item_00()
  pDialogueFCNeon.SetStage(294) ; #DEBUG_LINE_NO:19
EndFunction
