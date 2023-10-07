ScriptName Fragments:Terminals:TERM_MQ301EarthTerminal03Sub_000B11CF Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth07 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth06 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth08 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth09.Stop() ; #DEBUG_LINE_NO:7
  AudioLogsQuest_MQ301_Earth10.Stop() ; #DEBUG_LINE_NO:8
  AudioLogsQuest_MQ301_Earth08.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth08.Stop() ; #DEBUG_LINE_NO:17
  AudioLogsQuest_MQ301_Earth10.Stop() ; #DEBUG_LINE_NO:18
  AudioLogsQuest_MQ301_Earth09.Start() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth08.Stop() ; #DEBUG_LINE_NO:27
  AudioLogsQuest_MQ301_Earth09.Stop() ; #DEBUG_LINE_NO:28
  AudioLogsQuest_MQ301_Earth10.Start() ; #DEBUG_LINE_NO:29
  MQ301.SetStage(144) ; #DEBUG_LINE_NO:31
EndFunction
