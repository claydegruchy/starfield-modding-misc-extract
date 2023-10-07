ScriptName Fragments:Terminals:TERM_MQ301EarthTerminal01Sub_0021CE26 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ301 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth01 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth02 Auto Const mandatory
Scene Property AudioLogsQuest_MQ301_Earth03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop() ; #DEBUG_LINE_NO:7
  AudioLogsQuest_MQ301_Earth02.Stop() ; #DEBUG_LINE_NO:8
  AudioLogsQuest_MQ301_Earth03.Stop() ; #DEBUG_LINE_NO:9
  AudioLogsQuest_MQ301_Earth01.Start() ; #DEBUG_LINE_NO:10
  MQ301.SetStage(141) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop() ; #DEBUG_LINE_NO:19
  AudioLogsQuest_MQ301_Earth02.Stop() ; #DEBUG_LINE_NO:20
  AudioLogsQuest_MQ301_Earth03.Stop() ; #DEBUG_LINE_NO:21
  AudioLogsQuest_MQ301_Earth02.Start() ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  AudioLogsQuest_MQ301_Earth01.Stop() ; #DEBUG_LINE_NO:30
  AudioLogsQuest_MQ301_Earth02.Stop() ; #DEBUG_LINE_NO:31
  AudioLogsQuest_MQ301_Earth03.Stop() ; #DEBUG_LINE_NO:32
  AudioLogsQuest_MQ301_Earth03.Start() ; #DEBUG_LINE_NO:33
EndFunction
