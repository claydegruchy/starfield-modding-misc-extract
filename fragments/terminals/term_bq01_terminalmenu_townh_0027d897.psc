ScriptName Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D897 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BarrettCommitmentQuest Auto Const mandatory
ActorValue Property AV_SelfAddress Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 79.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 72.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  Int SelfAddress = Game.GetPlayer().GetValue(AV_SelfAddress) as Int ; #DEBUG_LINE_NO:23
  If SelfAddress == 71 ; #DEBUG_LINE_NO:25
    BarrettCommitmentQuest.SetStage(71) ; #DEBUG_LINE_NO:26
  ElseIf SelfAddress == 72 ; #DEBUG_LINE_NO:27
    BarrettCommitmentQuest.SetStage(72) ; #DEBUG_LINE_NO:28
  ElseIf SelfAddress == 73 ; #DEBUG_LINE_NO:29
    BarrettCommitmentQuest.SetStage(73) ; #DEBUG_LINE_NO:30
  ElseIf SelfAddress == 74 ; #DEBUG_LINE_NO:31
    BarrettCommitmentQuest.SetStage(74) ; #DEBUG_LINE_NO:32
  ElseIf SelfAddress == 75 ; #DEBUG_LINE_NO:33
    BarrettCommitmentQuest.SetStage(75) ; #DEBUG_LINE_NO:34
  Else ; #DEBUG_LINE_NO:
    BarrettCommitmentQuest.SetStage(79) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  BarrettCommitmentQuest.SetStage(85) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 71.0) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 74.0) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 73.0) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  Game.GetPlayer().SetValue(AV_SelfAddress, 75.0) ; #DEBUG_LINE_NO:71
EndFunction
