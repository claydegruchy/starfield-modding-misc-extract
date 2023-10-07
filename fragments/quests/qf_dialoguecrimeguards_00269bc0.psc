ScriptName Fragments:Quests:QF_DialogueCrimeGuards_00269BC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC05_PlayerCaughtSnoopingFSE Auto Const mandatory
Quest Property RI04 Auto Const mandatory
Quest Property LC044 Auto Const
Quest Property CF01 Auto Const mandatory
GlobalVariable Property CrimeBribeAmount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
GlobalVariable Property CrimeBountyAmount Auto Const mandatory

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

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:55
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:56
  Game.GetPlayer().RemoveItem(Credits as Form, CrimeBribeAmount.GetValueInt(), False, None) ; #DEBUG_LINE_NO:59
  kmyQuest.PlayerPayFine(False, True) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:68
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:69
  kmyQuest.PlayerPayFine(False, True) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:80
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:81
  kmyQuest.PlayerPayFine(True, False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:92
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:93
  kmyQuest.PlayerPayFine(False, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0499_Item_00()
  If UC05_PlayerCaughtSnoopingFSE.GetValue() < 1.0 ; #DEBUG_LINE_NO:104
    UC05_PlayerCaughtSnoopingFSE.SetValue(1.0) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:114
  cf01dialoguecrimeguardsscript kmyQuest = __temp as cf01dialoguecrimeguardsscript ; #DEBUG_LINE_NO:115
  kmyQuest.DisablePlayerControlsForCF01Arrest() ; #DEBUG_LINE_NO:118
  CF01.SetStage(110) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0705_Item_00()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:127
  Alias_Guard.GetActorRef().EvaluatePackage(True) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:136
  lc044dialoguecrimeguardsscript kmyQuest = __temp as lc044dialoguecrimeguardsscript ; #DEBUG_LINE_NO:137
  kmyQuest.PlayerWinSpeechChallenge() ; #DEBUG_LINE_NO:140
  RI04.SetStage(470) ; #DEBUG_LINE_NO:141
  LC044.SetStage(15) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0810_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:150
  lc044dialoguecrimeguardsscript kmyQuest = __temp as lc044dialoguecrimeguardsscript ; #DEBUG_LINE_NO:151
  LC044.SetStage(13) ; #DEBUG_LINE_NO:154
  kmyQuest.PlayerGoToDetention() ; #DEBUG_LINE_NO:155
EndFunction
