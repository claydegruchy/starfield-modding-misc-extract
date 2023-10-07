ScriptName Fragments:Quests:QF_BE_SC02_002BADF8 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ((Self as Quest) as be_sc02questscript).SetupCaptain() ; #DEBUG_LINE_NO:11
  ((Self as Quest) as bescript).SetCrewPlayerFriend(True, True) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:22
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:23
  kmyQuest.SetCrewPlayerFriend(False, True) ; #DEBUG_LINE_NO:29
EndFunction
