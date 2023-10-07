ScriptName Ri08_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MeetingLayer

;-- Properties --------------------------------------
Group VotingGlobals
  GlobalVariable Property RI08_InfinityNayCount Auto Const mandatory
  GlobalVariable Property RI08_InfinityYayCount Auto Const mandatory
  GlobalVariable Property RI08_AcquiredInfinity Auto Const mandatory
  GlobalVariable Property RI08_NeuroampNayCount Auto Const mandatory
  GlobalVariable Property RI08_NeuroampYayCount Auto Const mandatory
  GlobalVariable Property RI08_ContinuedNeuroampResearch Auto Const mandatory
  GlobalVariable Property RI08_MasakoNayCount Auto Const mandatory
  GlobalVariable Property RI08_MasakoYayCount Auto Const mandatory
  GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
EndGroup

Group UlaruVotes
  Int Property iUlaruYESInfinityLTD Auto Const mandatory
  Int Property iUlaruNOInfinityLTD Auto Const mandatory
  Int Property iUlaruYESNeuroamps Auto Const mandatory
  Int Property iUlaruNONeuroamps Auto Const mandatory
  Int Property iUlaruYESMasako Auto Const mandatory
  Int Property iUlaruNOMasako Auto Const mandatory
EndGroup

Int Property iSetStage Auto Const mandatory
GlobalVariable Property RI05_UlaruDead Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Int Property iUlaruFired Auto Const mandatory
Int Property iMasakoFired Auto Const mandatory

;-- Functions ---------------------------------------

Function FreezeControlsMeeting()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:7
  MeetingLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:8
  MeetingLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function UnfreezeControlsMeeting()
  MeetingLayer = None ; #DEBUG_LINE_NO:15
EndFunction

Function SetTimer()
  Self.StartTimer(10.0, 1) ; #DEBUG_LINE_NO:22
EndFunction

Event OnTimer(Int aiTimerID)
  Self.SetStage(iSetStage) ; #DEBUG_LINE_NO:26
EndEvent

Function CalculateVotes()
  If RI08_InfinityYayCount.GetValue() >= RI08_InfinityNayCount.GetValue() ; #DEBUG_LINE_NO:63
    RI08_AcquiredInfinity.SetValue(1.0) ; #DEBUG_LINE_NO:64
  Else ; #DEBUG_LINE_NO:
    RI08_AcquiredInfinity.SetValue(0.0) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  If RI08_NeuroampYayCount.GetValue() >= RI08_NeuroampNayCount.GetValue() ; #DEBUG_LINE_NO:69
    RI08_ContinuedNeuroampResearch.SetValue(1.0) ; #DEBUG_LINE_NO:70
  Else ; #DEBUG_LINE_NO:
    RI08_ContinuedNeuroampResearch.SetValue(0.0) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoYayCount.GetValue() >= RI08_MasakoNayCount.GetValue() ; #DEBUG_LINE_NO:75
    RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:76
    RI_RadiantQuestGiver.SetValue(1.0) ; #DEBUG_LINE_NO:77
  Else ; #DEBUG_LINE_NO:
    RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:79
    RI_RadiantQuestGiver.SetValue(2.0) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ModifyVotes()
  If Self.GetStageDone(iUlaruFired) ; #DEBUG_LINE_NO:90
    If Self.GetStageDone(iUlaruYESInfinityLTD) ; #DEBUG_LINE_NO:91
      RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:92
    Else ; #DEBUG_LINE_NO:
      RI08_InfinityNayCount.SetValue(RI08_InfinityNayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(iUlaruYESNeuroamps) ; #DEBUG_LINE_NO:96
      RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:97
    Else ; #DEBUG_LINE_NO:
      RI08_NeuroampNayCount.SetValue(RI08_NeuroampNayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:99
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(iUlaruYESMasako) ; #DEBUG_LINE_NO:101
      RI08_MasakoYayCount.SetValue(RI08_MasakoYayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:102
    Else ; #DEBUG_LINE_NO:
      RI08_MasakoNayCount.SetValue(RI08_MasakoNayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:104
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(iMasakoFired) ; #DEBUG_LINE_NO:109
    RI08_InfinityYayCount.SetValue(RI08_InfinityYayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:110
    RI08_NeuroampYayCount.SetValue(RI08_NeuroampYayCount.GetValue() - 1.0) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  Self.CalculateVotes() ; #DEBUG_LINE_NO:114
EndFunction
