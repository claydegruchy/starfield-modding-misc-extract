ScriptName Fragments:Quests:QF_MB_BountySpace06Local_003514C7 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  missionbountyspacescript kmyQuest = __temp as missionbountyspacescript ; #DEBUG_LINE_NO:16
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:19
EndFunction
