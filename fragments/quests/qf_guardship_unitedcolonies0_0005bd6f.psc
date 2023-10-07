ScriptName Fragments:Quests:QF_GuardShip_UnitedColonies0_0005BD6F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.PlayerTryToArrest() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.PlayerResistingArrest() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:32
  kmyQuest.PlayerGoToJail() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:43
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:44
  kmyQuest.PlayerPayFine(True, True) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:55
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:56
  kmyQuest.PlayerPayFine(True, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:68
  kmyQuest.PlayerPayFine(False, False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0700_Item_00()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:79
  CF01.SetStage(110) ; #DEBUG_LINE_NO:80
EndFunction
